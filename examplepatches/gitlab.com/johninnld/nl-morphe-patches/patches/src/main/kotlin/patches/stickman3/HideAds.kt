package patches.stickman3

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal const val STICKMAN_ADS = "Lcom/unity3d/services/ads/UnityAdsImplementation;"
internal const val STICKMAN_TOKEN_LISTENER = "Lcom/unity3d/ads/IUnityAdsTokenListener;"

/** Replace the complete entry: a null callback must never fall through into the original SDK. */
internal fun stickmanAdBody(original: MutableMethod, locals: Int, body: String): MutableMethod =
    MutableMethod(ImmutableMethod(original.definingClass, original.name, original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        ImmutableMethodImplementation(locals + original.parameterTypes.size + 1,
            emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, body.trimIndent()) }

internal val stickmanTokenGate = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val owner = mutableClassDefBy(STICKMAN_ADS)
        val callback = "Lcom/unity3d/services/ads/UnityAdsImplementation${'$'}${'$'}ExternalSyntheticLambda0;"
        check(classDefBy(callback).methods.any { it.name == "<init>" && it.parameterTypes == listOf(STICKMAN_TOKEN_LISTENER) }) {
            "Draw a Stickman token completion adapter changed"
        }
        for (parameters in listOf(emptyList(), listOf(STICKMAN_TOKEN_LISTENER))) {
            val result = if (parameters.isEmpty()) "Ljava/lang/String;" else "V"
            val original = owner.methods.singleOrNull {
                it.name == "getToken" && it.returnType == result && it.parameterTypes == parameters
            } ?: error("Draw a Stickman token entry changed")
            check(original.implementation?.instructions?.count()?.let { it > 2 } == true)
            val body = if (parameters.isEmpty()) "const/4 v0, 0x0\nreturn-object v0" else """
                if-eqz p1, :done
                new-instance v0, $callback
                invoke-direct {v0, p1}, $callback-><init>($STICKMAN_TOKEN_LISTENER)V
                invoke-static {v0}, Lcom/unity3d/services/core/misc/Utilities;->wrapCustomerListener(Ljava/lang/Runnable;)V
                :done
                return-void
            """.trimIndent()
            val changed = stickmanAdBody(original, 1, body)
            check(owner.methods.remove(original)); check(owner.methods.add(changed))
        }
    }
}


internal val stickmanAdsGate = bytecodePatch {
    dependsOn(originalInput, stickmanTokenGate)
    execute {
        val owner = mutableClassDefBy(STICKMAN_ADS)
        fun replace(name: String, result: String, parameters: List<String>, locals: Int, body: String) {
            val original = owner.methods.singleOrNull {
                it.name == name && it.returnType == result && it.parameterTypes == parameters
            } ?: error("Draw a Stickman ad entry changed: $name")
            check(original.implementation?.instructions?.count()?.let { it > 2 } == true) {
                "Draw a Stickman ad entry changed or already patched: $name"
            }
            val changed = stickmanAdBody(original, locals, body)
            check(owner.methods.remove(original)); check(owner.methods.add(changed))
        }
        val init = "Lcom/unity3d/ads/IUnityAdsInitializationListener;"
        replace("initialize", "V", listOf("Landroid/content/Context;", "Ljava/lang/String;", "Z", init), 0, """
            if-eqz p4, :done
            invoke-interface {p4}, $init->onInitializationComplete()V
            :done
            return-void
        """)
        for (name in listOf("isInitialized", "isSupported")) {
            replace(name, "Z", emptyList(), 1, "const/4 v0, 0x1\nreturn v0")
        }
        val loadListener = "Lcom/unity3d/ads/IUnityAdsLoadListener;"
        val loadError = "Lcom/unity3d/ads/UnityAds${'$'}UnityAdsLoadError;"
        replace("load", "V", listOf("Ljava/lang/String;", "Lcom/unity3d/ads/UnityAdsLoadOptions;", loadListener), 2, """
            if-eqz p3, :done
            sget-object v0, $loadError->NO_FILL:$loadError
            const-string v1, "ads disabled"
            invoke-interface {p3, p1, v0, v1}, $loadListener->onUnityAdsFailedToLoad(Ljava/lang/String;${loadError}Ljava/lang/String;)V
            :done
            return-void
        """)
        val showListener = "Lcom/unity3d/ads/IUnityAdsShowListener;"
        val showError = "Lcom/unity3d/ads/UnityAds${'$'}UnityAdsShowError;"
        replace("show", "V", listOf("Landroid/app/Activity;", "Ljava/lang/String;", "Lcom/unity3d/ads/UnityAdsShowOptions;", showListener), 2, """
            if-eqz p4, :done
            sget-object v0, $showError->NOT_READY:$showError
            const-string v1, "ads disabled"
            invoke-interface {p4, p2, v0, v1}, $showListener->onUnityAdsShowFailure(Ljava/lang/String;${showError}Ljava/lang/String;)V
            :done
            return-void
        """)

    }
}

@Suppress("unused")
val stickman3HideAds = bytecodePatch(
    name = "Hide ads",
    description = "Handles Unity Ads initialization locally, returns no-fill/not-ready for ads, " +
        "and returns no bidding token. Null listeners cannot restart the original SDK path.",
    default = true,
) {
    compatibleWith(stickman3)
    dependsOn(stickmanAdsGate)
}
