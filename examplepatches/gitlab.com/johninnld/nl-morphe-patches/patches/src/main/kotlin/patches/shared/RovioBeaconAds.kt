package patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal const val ROVIO_AD_SDK = "Lcom/rovio/beacon/ads/AdsSdk;"
private const val ROVIO_AD_CONSTANTS = "Lcom/rovio/beacon/ads/AdsSdkConstants;"
private const val ROVIO_AD_ERROR = "Lcom/rovio/beacon/ads/AdsSdkConstants${'$'}Error;"

/**
 * Keep the public entries and their original UI-thread dispatch intact. Replace the dispatched
 * load/show bodies with the bridge's no-fill/show-failed callback, allocating a separate local even
 * when the original show method only has its receiver register.
 *
 * Exclude networks from the token collector as well: its existing empty-results completion emits
 * {} without querying SDKs. SDK initializers report their existing failure callback without starting a network.
 */
context(context: BytecodePatchContext)
internal fun silenceRovioBeaconAds(game: String) {
    val owner = context.mutableClassDefBy(ROVIO_AD_SDK)
    for ((name, parameters, constant) in listOf(
        Triple("load", listOf("Ljava/lang/String;"), "ERROR_NO_FILL"),
        Triple("show", emptyList(), "ERROR_SHOW_FAILED"),
    )) {
        val method = owner.methods.singleOrNull {
            it.name.startsWith("lambda${'$'}$name${'$'}") && it.returnType == "V" &&
                it.parameterTypes == parameters
        } ?: error("$game dispatched ad $name body changed")
        check(method.implementation?.instructions?.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/rovio/beacon/ads/AdsSdkBase;" && ref.name == name
        } == true) { "$game dispatched ad $name call changed or already patched" }
        val replacement = MutableMethod(ImmutableMethod(method.definingClass, method.name,
            method.parameters, method.returnType, method.accessFlags, method.annotations,
            method.hiddenApiRestrictions, ImmutableMethodImplementation(parameters.size + 2,
                emptyList(), emptyList(), emptyList())))
        replacement.addInstructions(0, """
            sget-object v0, $ROVIO_AD_CONSTANTS->$constant:$ROVIO_AD_ERROR
            invoke-virtual { p0, v0 }, $ROVIO_AD_SDK->onAdError($ROVIO_AD_ERROR)V
            return-void
        """.trimIndent())
        check(owner.methods.remove(method))
        check(owner.methods.add(replacement))
    }

    val tokens = context.mutableClassDefBy("Lcom/rovio/beacon/ads/AdsTokens;")
    val networks = tokens.methods.singleOrNull {
        it.name == "getAllNetworks" && it.parameterTypes == listOf("Lcom/rovio/beacon/ads/AdsSdk${'$'}AdType;") &&
            it.returnType == "[Lcom/rovio/beacon/ads/AdsTokens${'$'}AsyncNetwork;"
    } ?: error("$game bidder-token network selector changed")
    check(networks.implementation?.instructions?.count()?.let { it > 3 } == true) {
        "$game bidder-token network selector changed or already patched"
    }
    val replacement = MutableMethod(ImmutableMethod(networks.definingClass, networks.name,
        networks.parameters, networks.returnType, networks.accessFlags, networks.annotations,
        networks.hiddenApiRestrictions, ImmutableMethodImplementation(2,
            emptyList(), emptyList(), emptyList())))
    replacement.addInstructions(0, """
        const/4 v0, 0x0
        new-array v0, v0, ${networks.returnType}
        return-object v0
    """.trimIndent())
    check(tokens.methods.remove(networks))
    check(tokens.methods.add(replacement))

    val listener = "Lcom/rovio/beacon/ads/IAdSdkInitializerListener;"
    for (sdk in listOf("AdMob", "Applovin", "FBAudienceNetwork", "Fyber", "IronSrc",
        "Mintegral", "UnityAds", "Vungle")) {
        val initializer = context.mutableClassDefBy("Lcom/rovio/beacon/ads/${sdk}SdkInitializer;")
        val method = initializer.methods.singleOrNull {
            it.name.startsWith("lambda${'$'}initialize${'$'}") && it.returnType == "V" &&
                it.parameterTypes.size == 2 && it.parameterTypes.toSet() ==
                setOf(listener, "Ljava/util/HashMap;")
        } ?: error("$game $sdk UI-dispatched initializer changed")
        check(method.accessFlags and AccessFlags.STATIC.value != 0 &&
            method.implementation?.instructions?.count()?.let { it > 4 } == true) {
            "$game $sdk initializer layout changed or already patched"
        }
        val listenerParameter = method.parameterTypes.indexOf(listener)
        val replacement = MutableMethod(ImmutableMethod(method.definingClass, method.name,
            method.parameters, method.returnType, method.accessFlags, method.annotations,
            method.hiddenApiRestrictions, ImmutableMethodImplementation(4,
                emptyList(), emptyList(), emptyList())))
        replacement.addInstructions(0, """
            const/4 v0, 0x0
            const-string v1, "Advertising disabled"
            invoke-interface { p$listenerParameter, v0, v1 }, $listener->onComplete(ZLjava/lang/String;)V
            return-void
        """.trimIndent())
        check(initializer.methods.remove(method))
        check(initializer.methods.add(replacement))
    }

}
