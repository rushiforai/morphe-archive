package id.ikuradachi.patches.carbitlink.browser

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import id.ikuradachi.patches.carbitlink.shared.Constants.COMPATIBILITY_CARBIT_LINK

@Suppress("unused")
val enableBrowserPatch = bytecodePatch(
    name = "Enable browser",
    description = "Shows the browser in the projected mirror grid for non-SDK mode.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CARBIT_LINK)

    execute {
        val match = BrowserVisibilityFingerprint.matchAll(1..1).single()
        val result = match.instructionMatches.last()
        val register = result.getInstruction<OneRegisterInstruction>().registerA
        match.method.replaceInstruction(result.index, "const/4 v$register, 0x1")
    }
}
