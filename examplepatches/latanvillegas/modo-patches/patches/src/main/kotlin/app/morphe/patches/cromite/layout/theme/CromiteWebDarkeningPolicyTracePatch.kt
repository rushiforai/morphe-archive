package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Non-mutating bridge at the exact native web-darkening decision.
 * Trace is OFF by default in runtime preferences.
 * No change to JNI content setting 71 or ALLOW/BLOCK precedence.
 */
private val cromiteWebDarkPolicyDecision = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/night_mode/WebContentsThemeClient;",
    name = "isForceDarkWebContentEnabled",
    returnType = "Z",
    parameters = listOf("Lorg/chromium/content_public/browser/WebContents;"),
)

@Suppress("unused")
val cromiteWebDarkeningPolicyTracePatch = bytecodePatch(
    name = "Cromite web theme policy native decision trace",
    description = "Safe opt-in tracing at the native WebContents darkening decision; does not yet alter rendering.",
    default = false,
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))
    extendWith("extensions/cromite.mpe")

    execute {
        classDefBy("Lapp/morphe/extension/cromite/amoled/WebDarkeningPolicy;")
        val method = cromiteWebDarkPolicyDecision.method
        val impl = checkNotNull(method.implementation)
        check(impl.registerCount == 5) { "Unexpected native darkening register layout" }
        val instructions = impl.instructions.toList()
        val strings = instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
        }
        check(strings.count { it == "WebContentsForceDark" } == 1)
        check(strings.count { it == "DarkenWebsitesCheckboxInThemesSetting" } == 1)
        val methods = instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }
        check(methods.any { it.definingClass == "LJ/N;" && it.name == "IIOOO" }) {
            "Native content-setting 71 decision missing; fail closed"
        }
        // Zero argument invocation: no existing registers or control-flow
        // branches are modified. Chromium still decides ALLOW/BLOCK itself.
        method.addInstructions(
            0,
            "invoke-static {}, Lapp/morphe/extension/cromite/amoled/WebDarkeningPolicy;->observeNativeDecision()V",
        )
    }
}
