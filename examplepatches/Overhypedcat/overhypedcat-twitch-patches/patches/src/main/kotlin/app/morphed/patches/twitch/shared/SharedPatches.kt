package app.morphed.patches.twitch.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val HTTP_CLIENT = "Lcom/amazonaws/ivs/net/HttpClient;"
private const val WRAPPER_CLASS = "Lcom/amazonaws/ivs/net/MorphedHttpClient;"
private const val INCLUDED_CLASS = "Lapp/morphed/extension/twitch/Included;"

/**
 * Amazon IVS creates every HTTP client its native player uses through this factory,
 * including the one that fetches the HLS playlists and the video.
 */
object HttpClientFactoryCreateFingerprint : Fingerprint(
    definingClass = "Lcom/amazonaws/ivs/net/HttpClientFactory;",
    name = "create",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/amazonaws/ivs/net/HttpClient;",
    parameters = listOf(),
)

/**
 * The player's network requests pass through the extension's wrapper, which serves the ad blocker (playlist
 * rewriting), the quality unlock (the VPN's playlist and video) and song removal (which stream plays).
 */
val playerHttpHookPatch = bytecodePatch {
    extendWith("extensions/twitch.mpe")

    execute {
        HttpClientFactoryCreateFingerprint.method.apply {
            indicesOf(Opcode.RETURN_OBJECT).forEach { returnIndex ->
                val register = getInstruction<OneRegisterInstruction>(returnIndex).registerA
                addInstructionsBeforeReturn(
                    returnIndex,
                    """
                        invoke-static/range { v$register .. v$register }, $WRAPPER_CLASS->wrap($HTTP_CLIENT)$HTTP_CLIENT
                        move-result-object v$register
                    """
                )
            }
        }
    }
}

/** Tells the extension a feature's patch was applied: Included.<feature>() returns true from now on. */
internal fun BytecodePatchContext.markIncluded(feature: String) {
    val included = mutableClassDefBy(INCLUDED_CLASS)
    val method = included.methods.firstOrNull { it.name == feature && it.returnType == "Z" }
        ?: error("$INCLUDED_CLASS has no $feature()")
    val first = method.implementation?.instructions?.firstOrNull()
    check(first?.opcode == Opcode.CONST_4 && (first as OneRegisterInstruction).registerA == 0) {
        "$INCLUDED_CLASS.$feature() doesn't start with const/4 v0; the extension changed"
    }
    method.replaceInstruction(0, "const/4 v0, 0x1")
}
