package app.template.patches.truecaller.misc.privacy

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalValueHelper
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * One Privacy Center preference: the string key its boolean is stored under and the value the
 * privacy-preserving default takes. Some keys are "disabled" flags (true means private), others are
 * "opt in" flags (false means private).
 */
private class PrivacyDefault(
    val feature: HevalFeature,
    val key: String,
    val privateValue: Boolean,
)

// 2026-11-07: "Don't share fraud messages" (fraudMessageLoggingOptIn) was dropped. Every read of
// that key in 26.43.5 already falls back to false, so the switch changed nothing.
private val PRIVACY_DEFAULTS = listOf(
    PrivacyDefault(
        HevalFeature(
            id = "truecaller.privacy_availability",
            name = "Hide my availability",
            description = "Stops Truecaller telling other users that you are busy or in silent mode.",
            category = TruecallerControlsCategory.PRIVACY,
        ),
        key = "availability_disabled",
        privateValue = true,
    ),
    PrivacyDefault(
        HevalFeature(
            id = "truecaller.privacy_profile_views",
            name = "No profile view notifications",
            description = "Turns off the notification that says someone viewed your profile.",
            category = TruecallerControlsCategory.PRIVACY,
        ),
        key = "showProfileViewNotifications",
        privateValue = false,
    ),
    PrivacyDefault(
        HevalFeature(
            id = "truecaller.privacy_social_graph",
            name = "Disable social graph",
            description = "Stops Truecaller analysing your call patterns to enrich incoming calls.",
            category = TruecallerControlsCategory.PRIVACY,
        ),
        key = "supernovaOptIn",
        privateValue = false,
    ),
    PrivacyDefault(
        HevalFeature(
            id = "truecaller.privacy_business_call_logs",
            name = "Don't share business call logs",
            description = "Stops sharing your verified-business call log with those businesses.",
            category = TruecallerControlsCategory.PRIVACY,
        ),
        key = "verifiedBusinessCallLogsOptIn",
        privateValue = false,
    ),
)

/** The Privacy Center switches, in registry order. */
internal val PRIVACY_FEATURES = PRIVACY_DEFAULTS.map { it.feature }

/** The Privacy defaults helper name for [feature] (one static (Z)Z helper per class and switch). */
internal fun privacyHelperName(feature: HevalFeature) = "heval_" + feature.id.replace('.', '_')

/** A boolean read of one privacy key: the call's index and the register of its fallback argument. */
private class Site(val default: PrivacyDefault, val call: Int, val fallback: Int)

/**
 * Privacy Center defaults (#125 follow-up). Every toggle in Truecaller's Privacy Center is a boolean
 * preference read through the generic `getBoolean(settings, key, fallback)` helper or plain
 * `SharedPreferences.getBoolean(key, fallback)`; the Privacy Center screen, the workers and the
 * feature gates all go through them, while the toggle writer uses `putBoolean` and is left alone.
 *
 * While a switch is on, the fallback passed to each read of its key is the private value, so a
 * preference the user never touched reads as private; a stored choice still wins. The switches are
 * on by default (they are the privacy-preserving state); turned off, every read is stock.
 *
 * Fixed 2026-11-07 (audit of v2.3.0-dev.1). The first version gated every boolean read in the
 * method whose key register had the same number, so reads of unrelated keys (backup_enabled,
 * featureAvailability, ...) were changed too, and it wrote the gate into the fallback register
 * itself, which R8 shares between reads: other reads and state fields in the same method changed
 * even with the switch off. Now only the first read after the key is loaded is matched (the key
 * register must still hold the key), and the fallback is copied aside, passed through a per-switch
 * `(Z)Z` helper and restored right after the call, so nothing else in the method sees a change.
 */
@Suppress("unused")
val privacyDefaultsPatch = bytecodePatch(
    name = "Privacy defaults",
    description = "Turns the Privacy Center sharing options off unless you opt in.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    dependsOn(truecallerControls.patch)

    execute {
        // One pass, collecting the reads of every key. Mutating happens afterwards.
        val found = mutableMapOf<Pair<String, MethodKey>, MutableList<Site>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val insns = method.implementation?.instructions?.toList() ?: return@forEach
                val sites = PRIVACY_DEFAULTS.flatMap { insns.readsOf(it) }
                if (sites.isNotEmpty()) found[classDef.type to MethodKey.of(method)] = sites.toMutableList()
            }
        }
        for (default in PRIVACY_DEFAULTS) {
            if (found.values.none { sites -> sites.any { it.default === default } }) {
                throw PatchException("Privacy defaults: no getBoolean read of \"${default.key}\" found")
            }
        }

        for ((owner, sites) in found) {
            val (type, key) = owner
            val mutableClass = mutableClassDefBy(type)
            if (AccessFlags.INTERFACE.isSet(mutableClass.accessFlags)) {
                throw PatchException("Privacy defaults: $type is an interface")
            }
            val method = mutableClass.methods.single { key.matches(it) }
            // Back to front, so the earlier indices stay valid.
            for (site in sites.distinctBy { it.call }.sortedByDescending { it.call }) {
                try {
                    method.passThroughHelper(mutableClass, site)
                } catch (e: PatchException) {
                    throw PatchException("$type->${method.name} (${site.default.key}): ${e.message}", e)
                }
            }
        }
        PRIVACY_DEFAULTS.forEach { truecallerControls.register(it.feature) }
    }
}

/** A method's name and signature, to find it again in the mutable class. */
private data class MethodKey(val name: String, val returnType: String, val parameters: List<String>) {
    fun matches(method: Method) = method.name == name && method.returnType == returnType &&
        method.parameterTypes.map(CharSequence::toString) == parameters

    companion object {
        fun of(method: Method) = MethodKey(method.name, method.returnType, method.parameterTypes.map(CharSequence::toString))
    }
}

/**
 * The reads of [default]'s key in these instructions: for each load of the key string, the first
 * boolean read after it whose key argument is that register, as long as nothing reassigned the
 * register in between and no return, throw or goto came first.
 */
private fun List<Instruction>.readsOf(default: PrivacyDefault): List<Site> = indices.mapNotNull { keyIndex ->
    if (this[keyIndex].stringOrNull() != default.key) return@mapNotNull null
    val keyRegister = (this[keyIndex] as OneRegisterInstruction).registerA
    for (index in keyIndex + 1 until size) {
        val insn = this[index]
        if (insn.isBooleanGet() && insn.keyArgument() == keyRegister) {
            return@mapNotNull Site(default, index, insn.fallbackArgument())
        }
        if (insn.opcode.setsRegister() && (insn as? OneRegisterInstruction)?.registerA == keyRegister) break
        if (insn.opcode in STOPS) break
    }
    null
}

private val STOPS = setOf(
    Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_VOID, Opcode.RETURN_WIDE, Opcode.THROW,
    Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32,
)

/** While the switch is on, the read at [Site.call] gets the private value as its fallback. */
private fun MutableMethod.passThroughHelper(owner: MutableClass, site: Site) {
    val literal = if (site.default.privateValue) 1 else 0
    val helper = owner.addHevalValueHelper(site.default.feature.id, privacyHelperName(site.default.feature), "Z") { v ->
        "const/4 $v, 0x$literal\nreturn $v"
    }
    overrideFallback(site.call, "privacy default read") { v ->
        """
            invoke-static/range { $v .. $v }, $helper
            move-result $v
        """
    }
}

private fun Instruction.keyArgument(): Int = when (this) {
    is FiveRegisterInstruction -> if (registerCount == 3) registerD else -1
    is RegisterRangeInstruction -> if (registerCount == 3) startRegister + 1 else -1
    else -> -1
}

private fun Instruction.fallbackArgument(): Int = when (this) {
    is FiveRegisterInstruction -> registerE
    is RegisterRangeInstruction -> startRegister + 2
    else -> throw PatchException("getBoolean is not an invoke with registers ($opcode)")
}

/**
 * True for both boolean getter shapes Truecaller uses: the generic settings helper
 * `(settings, String key, boolean fallback)Z` (class and method R8-renamed, found by shape) and the
 * plain `SharedPreferences.getBoolean(String key, boolean fallback)Z`. In both, of the three
 * registers the second is the key and the third the fallback.
 */
private fun Instruction.isBooleanGet(): Boolean {
    if (opcode !in setOf(
            Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE,
            Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE,
            Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE,
        )
    ) return false
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    if (reference.returnType != "Z") return false
    val params = reference.parameterTypes.map(CharSequence::toString)
    if (reference.definingClass == "Landroid/content/SharedPreferences;") {
        return params.size == 2 && params[0] == "Ljava/lang/String;" && params[1] == "Z"
    }
    return params.size == 3 && params[1] == "Ljava/lang/String;" && params[2] == "Z" &&
        params[0].startsWith("L") && params[0] != "Ljava/lang/String;"
}

private fun Instruction.stringOrNull(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
