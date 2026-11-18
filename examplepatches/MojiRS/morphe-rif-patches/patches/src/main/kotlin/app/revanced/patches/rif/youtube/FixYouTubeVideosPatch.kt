package app.revanced.patches.rif.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.revanced.patches.rif.settings.revancedSettingsPatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val EXTENSION = "Lapp/revanced/extension/rif/YouTubeFix;"
private const val OLD_ORIGIN = "https://www.youtube.com"

private fun constStrings(method: Method) =
    method.implementation?.instructions
        ?.filter { it.opcode == Opcode.CONST_STRING }
        ?.map { (it as ReferenceInstruction).reference.toString() }
        .orEmpty()

// android-youtube-player 12.x IFramePlayerOptions.Builder constructor (free qe.a$a /
// Platinum rd.a$a): sets the default playerVars, including origin = https://www.youtube.com.
// That origin is also the WebView's loadDataWithBaseURL base. Matched by its strings, so
// it works in both builds.
internal val iframePlayerOptionsBuilderFingerprint = fingerprint {
    custom { method, _ ->
        method.name == "<init>" && constStrings(method).let {
            OLD_ORIGIN in it && "iv_load_policy" in it
        }
    }
}

@Suppress("unused")
val fixYouTubeVideosPatch = bytecodePatch(
    name = "Fix YouTube videos",
    description = "Fixes the built-in YouTube player.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    // Settings.init(context) runs in Application.onCreate; the extension needs the context
    // for the package name.
    dependsOn(revancedSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // YouTube rejects embeds whose origin/Referer isn't https://<app package> (player
        // error 152/153, which the 12.x library reports as "error code 0"). Replace
        // `const-string vX, "https://www.youtube.com"` with the app's origin, same register.
        val method = iframePlayerOptionsBuilderFingerprint.method
        val index = method.instructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                (it as ReferenceInstruction).reference.toString() == OLD_ORIGIN
        }
        if (index < 0) throw PatchException("YouTube origin string not found")
        val register = (method.instructions[index] as OneRegisterInstruction).registerA
        method.replaceInstruction(index, "invoke-static { }, $EXTENSION->origin()Ljava/lang/String;")
        method.addInstruction(index + 1, "move-result-object v$register")
    }
}
