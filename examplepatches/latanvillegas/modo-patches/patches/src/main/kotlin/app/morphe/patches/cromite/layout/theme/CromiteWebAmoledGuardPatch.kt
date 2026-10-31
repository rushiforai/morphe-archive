package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Cromite 153.0.8010.37: fail-closed verification of the real web darkening
 * decision point. Deliberately separate from the 14 working UI patches.
 *
 * The original method contains both WebContentsForceDark and
 * DarkenWebsitesCheckboxInThemesSetting gates, then checks the profile,
 * night mode, and a JNI site-content setting. Do not bypass that final JNI
 * decision: it contains site-specific overrides.
 *
 * This is an opt-in verification stage, NOT a web-AMOLED rendering patch.
 * A future mutation must be added only after the distinction between global
 * checkbox state and per-site content settings is verified.
 */
private val cromiteWebDarkDecisionFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/night_mode/WebContentsThemeClient;",
    name = "isForceDarkWebContentEnabled",
    returnType = "Z",
    parameters = listOf("Lorg/chromium/content_public/browser/WebContents;"),
)

@Suppress("unused")
val cromiteWebAmoledGuardPatch = bytecodePatch(
    name = "Cromite web AMOLED decision guard (verification only)",
    description = "Validates Cromite's web darkening decision structure without changing its behavior.",
    default = false,
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))

    execute {
        val method = cromiteWebDarkDecisionFingerprint.method
        val implementation = checkNotNull(method.implementation) {
            "Cromite web darkening method has no implementation"
        }
        check(implementation.registerCount == 5) {
            "Unexpected WebContentsThemeClient register layout"
        }
        val instructions = implementation.instructions.toList()
        val strings = instructions.mapNotNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
        }
        check(strings.count { it == "WebContentsForceDark" } == 1) {
            "WebContentsForceDark feature gate missing or ambiguous"
        }
        check(strings.count { it == "DarkenWebsitesCheckboxInThemesSetting" } == 1) {
            "DarkenWebsitesCheckboxInThemesSetting gate missing or ambiguous"
        }
        val invokedMethods = instructions.mapNotNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
        }
        check(invokedMethods.any {
            it.name == "isNightModeEnabled" &&
                it.definingClass == "Lorg/chromium/chrome/browser/night_mode/WebContentsThemeClient;"
        }) {
            "Night mode gate missing; refusing to patch"
        }
        check(invokedMethods.any {
            it.name == "IIOOO" && it.definingClass == "LJ/N;"
        }) {
            "R8-inlined JNI content-setting call LJ/N;->IIOOO missing; refusing to patch"
        }
        // Intentionally no bytecode mutation: the final JNI content-setting
        // result must remain authoritative until per-site overrides are mapped.
    }
}
