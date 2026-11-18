// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.enablegoldenplatinum

import app.edbfi.patches.shared.hasFlags
import app.edbfi.patches.shared.isCallTo
import app.edbfi.patches.shared.string
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** The paid build's package. A feature is "pro" where the app compares its own package name to it. */
internal const val PAID_PACKAGE = "com.andrewshu.android.redditdonation"

private const val SHARED_PREFERENCES = "Landroid/content/SharedPreferences;"

/** Every method that holds [literal]. */
private class HoldsStringFingerprint(literal: String) : Fingerprint(strings = listOf(literal))

/**
 * The getter of the app's in-memory copy of the boolean setting [key]. The settings class, renamed by R8, reads each
 * setting in a method of its own: `getBoolean(key, default)`, then a call to its setter, which only stores the value
 * in a field. The getter is the one `()Z` method of that class that only returns that field.
 */
internal fun settingGetter(key: String): Method {
    // The settings screens read some settings too, but hand them to no setter of their own class.
    val readers = HoldsStringFingerprint(key).matchAllOrNull().orEmpty().map { it.originalMethod }.mapNotNull { method ->
        val code = method.implementation?.instructions?.toList() ?: return@mapNotNull null
        val read = code.indexOfFirst { it.string == key }
        val calls = code.drop(read).mapNotNull { it.getReference<MethodReference>() }
        if (calls.firstOrNull()?.let { it.definingClass == SHARED_PREFERENCES && it.name == "getBoolean" } != true) return@mapNotNull null
        val setter = calls.firstOrNull {
            it.definingClass == method.definingClass && it.parameterTypes.map { p -> p.toString() } == listOf("Z") && it.returnType == "V"
        } ?: return@mapNotNull null
        method to setter
    }
    val (reader, setter) = readers.singleOrNull() ?: throw PatchException("Expected one method that reads the setting $key, found ${readers.size}")
    val settings = classDefByOrNull(reader.definingClass) ?: throw PatchException("No class ${reader.definingClass}")
    val setterCode = settings.methods.singleOrNull { isCallTo(setter, it) }?.implementation?.instructions?.toList()
    val field = setterCode?.takeIf { c -> c.map { it.opcode } == listOf(Opcode.IPUT_BOOLEAN, Opcode.RETURN_VOID) }?.get(0)?.getReference<FieldReference>()
        ?: throw PatchException("The setter of $key doesn't just store it")
    val getters = settings.methods.filter { method ->
        val getter = method.implementation?.instructions?.toList()
        method.returnType == "Z" && method.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(method.accessFlags) &&
            getter?.map { it.opcode } == listOf(Opcode.IGET_BOOLEAN, Opcode.RETURN) && getter[0].getReference<FieldReference>() == field
    }
    val getter = getters.singleOrNull() ?: throw PatchException("Expected one getter of $key, found ${getters.size}")
    return getter
}

/** A pro check in a method: the index of `String.equals` whose receiver is [PAID_PACKAGE], and that receiver. */
internal class ProCheck(val method: MutableMethod, val equals: List<Pair<Int, Int>>)

/** A method that holds [PAID_PACKAGE] and calls [adsEnabled]. */
private class ProCheckFingerprint(adsEnabled: MethodReference) :
    Fingerprint(
        strings = listOf(PAID_PACKAGE),
        custom = { method, _ -> method.implementation?.instructions?.any { isCallTo(it.getReference<MethodReference>(), adsEnabled) } == true },
    )

/**
 * Every pro check: a method that compares the package name to [PAID_PACKAGE] and calls [adsEnabled], the getter of the
 * "Ads & pro features" setting. Methods that hold the paid package's name for anything else (the app's own packages
 * left out of "Open with", app link verification, importing the free app's settings into the paid one) don't call it.
 */
internal fun proChecks(adsEnabled: MethodReference): List<ProCheck> = ProCheckFingerprint(adsEnabled).matchAllOrNull().orEmpty()
    .map { match ->
        val method = match.method
        val code = method.implementation!!.instructions.toList()
        val literals = code.indices.filter { code[it].string == PAID_PACKAGE }
        val equals = literals.map { i ->
            // `"…redditdonation".equals(packageName)`: R8 loads the literal right before the comparison, or before
            // the getPackageName() call and its result.
            val receiver = (code[i] as OneRegisterInstruction).registerA
            val index = (i + 1..minOf(i + 3, code.lastIndex)).firstOrNull { isPackageComparison(code[it], receiver) }
            val between = index?.let { code.subList(i + 1, it) }
            if (index == null || code.getOrNull(index + 1)?.opcode != Opcode.MOVE_RESULT || between!!.any { !keeps(it, receiver) }) {
                throw PatchException("${method.definingClass}->${method.name} holds \"$PAID_PACKAGE\" but doesn't compare the package name to it")
            }
            index to receiver
        }
        ProCheck(method, equals)
    }

private fun isPackageComparison(
    instruction: Instruction,
    receiver: Int,
): Boolean {
    val reference = instruction.getReference<MethodReference>()
    return instruction.opcode == Opcode.INVOKE_VIRTUAL && reference?.definingClass == "Ljava/lang/String;" && reference.name == "equals" &&
        (instruction as FiveRegisterInstruction).registerCount == 2 && instruction.registerC == receiver
}

/** Whether [instruction], between the literal and the comparison, leaves the literal's [register] alone. */
private fun keeps(
    instruction: Instruction,
    register: Int,
) = when (instruction.opcode) {
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_STATIC -> (instruction as FiveRegisterInstruction).let { call ->
        listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount).none { it == register }
    }

    Opcode.MOVE_RESULT_OBJECT -> (instruction as OneRegisterInstruction).registerA != register

    else -> false
}

/**
 * The new post push backend's static initializer. Its class finds the backend by reflection, Firebase by its class and
 * Amazon's by name; R8 renamed the class.
 */
internal object NewPostPushInitFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("com.andrewshu.android.reddit.notifynew.adm.NewPostAmazonTokens"),
)

/** Whether the new post push backend is available. R8 renamed the method. */
internal class NewPostPushAvailableFingerprint(backend: String) :
    Fingerprint(
        definingClass = backend,
        returnType = "Z",
        parameters = listOf(),
        custom = { method, _ -> method.hasFlags(AccessFlags.PUBLIC) },
    )

/**
 * The settings screens' checks of the "Ads & pro features" setting. Each runs only when `R.bool.built_with_ads`, false
 * in the paid build, is true: it greys out the pro settings while the setting is off. Each is a method of a settings
 * fragment, whose names R8 kept, that reads "ADS_ENABLED" and asks Resources.getBoolean once.
 */
private object BuiltWithAdsFingerprint : Fingerprint(
    definingClass = "Lcom/andrewshu/android/reddit/settings/",
    strings = listOf("ADS_ENABLED"),
    custom = { method, _ -> method.definingClass.endsWith("SettingsFragment;") },
)

internal fun builtWithAdsChecks(): List<Pair<MutableMethod, Int>> = BuiltWithAdsFingerprint.matchAllOrNull().orEmpty()
    .map { match ->
        val method = match.method
        val code = method.implementation!!.instructions.toList()
        val reads = code.indices.filter {
            val reference = code[it].getReference<MethodReference>()
            reference?.definingClass == "Landroid/content/res/Resources;" && reference.name == "getBoolean"
        }
        val read = reads.singleOrNull() ?: throw PatchException("Expected one built_with_ads read in ${method.definingClass}->${method.name}, found ${reads.size}")
        if (code.getOrNull(read + 1)?.opcode != Opcode.MOVE_RESULT) throw PatchException("${method.definingClass}->${method.name} drops built_with_ads")
        method to read + 1
    }

/** Whether the album ad helper may show ads: ads on, and not hidden for a Reddit Premium account. R8 kept its name. */
internal object AlbumAdsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/andrewshu/android/reddit/ads/ImageAlbumAdViewHelper;",
    name = "isAdsEnabledAndUnblocked",
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ -> method.hasFlags(AccessFlags.PRIVATE) },
)
