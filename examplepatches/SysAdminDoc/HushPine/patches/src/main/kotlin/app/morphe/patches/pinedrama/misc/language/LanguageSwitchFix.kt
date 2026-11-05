/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.misc.language

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.util.addInstruction
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** The language-pack installer service. Its registry loads it by this name, so R8 keeps it. */
internal const val LANGUAGE_PLUGIN_SERVICE = "Lcom/bytedance/ies/ugc/aweme/plugin/service/IPluginService;"
internal val LANGUAGE_SWITCH_PARAMETERS =
    listOf("Landroid/content/Context;", "Ljava/util/Locale;", "Ljava/lang/String;", "Z", "L")

/**
 * PineDrama's switch to the language picked on its App language page (`X.pKp.LIZ` on 47.5.3),
 * which [I18N_MANAGER_SERVICE] calls with its fourth argument true. With that argument true and
 * PineDrama's split-language mode on, it hands the language to [LANGUAGE_PLUGIN_SERVICE] to fetch
 * the language's Play split first and applies nothing itself. A patched PineDrama is one APK that
 * Play didn't install, so that fetch never reports back and Done leaves the page as it was (#296).
 * With the argument false it sets the language on the app's resources, saves it and runs the same
 * callback the fetch would have.
 */
internal object LanguageSwitchFingerprint : Fingerprint(
    returnType = "V",
    parameters = LANGUAGE_SWITCH_PARAMETERS,
    custom = { method, _ -> method.isLanguageSwitch() },
)

/** Whether [method] is the static switch that can hand a language to [LANGUAGE_PLUGIN_SERVICE]. */
internal fun Method.isLanguageSwitch(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return false
    val types = parameterTypes.map(CharSequence::toString)
    if (types.size != LANGUAGE_SWITCH_PARAMETERS.size) return false
    if (types.take(4) != LANGUAGE_SWITCH_PARAMETERS.take(4) || !types[4].startsWith("L")) return false
    val instructions = implementation?.instructions ?: return false
    return instructions.any { it.getReference<TypeReference>()?.type == LANGUAGE_PLUGIN_SERVICE } &&
        calls("Landroid/content/res/Resources;", "getConfiguration")
}

/** Whether [method] calls [switch] with its arguments in the order the switch declares them. */
internal fun Method.callsLanguageSwitch(switch: Method): Boolean =
    implementation?.instructions?.any { instruction ->
        instruction.getReference<MethodReference>()?.let {
            it.definingClass == switch.definingClass && it.name == switch.name &&
                it.parameterTypes.map(CharSequence::toString) == switch.parameterTypes.map(CharSequence::toString)
        } == true
    } == true

/**
 * Makes the App language page's Done apply the language straight away (#296). The language page
 * reaches the switch through [I18N_MANAGER_SERVICE]; if it no longer does, this fails the patch
 * rather than change a method the page doesn't use.
 */
context(patchContext: BytecodePatchContext)
internal fun installLanguageSwitchFix() {
    val switch = LanguageSwitchFingerprint.method
    val callers = patchContext.classDefBy(I18N_MANAGER_SERVICE).methods.filter { it.callsLanguageSwitch(switch) }
    if (callers.isEmpty()) {
        throw PatchException(
            "Language switch: $I18N_MANAGER_SERVICE no longer calls ${switch.definingClass}->${switch.name}",
        )
    }
    // p3 is the "fetch the language first" argument: p0 context, p1 locale, p2 label, p3 boolean.
    switch.addInstruction(0, "const/4 p3, 0x0")
}
