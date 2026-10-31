package app.syncfixes.patches.syncforreddit.fix.gallery

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.syncfixes.patches.syncforreddit.shared.Constants.COMPATIBILITY_SYNC_ALL
import app.syncfixes.patches.syncforreddit.shared.Constants.EXTENSION
import app.syncfixes.patches.syncforreddit.shared.Constants.EXTENSION_PACKAGE
import app.syncfixes.patches.syncforreddit.shared.Constants.NETWORK_RESPONSE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/FixGalleriesPatch;"

@Suppress("unused")
val fixGalleriesPatch = bytecodePatch(
    name = "Fix Reddit galleries",
    description = "Fixes Reddit image galleries failing to load (\"Could not load gallery\") since Reddit " +
        "blocked /api/info for third-party clients. Galleries are loaded from /comments instead.",
    default = true,
) {
    compatibleWith(*COMPATIBILITY_SYNC_ALL)

    extendWith(EXTENSION)

    execute {
        // Send the request to /comments/{id}.json instead of /api/info.
        GalleryUrlFingerprint.method.apply {
            val returns = instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }
            if (returns.isEmpty()) throw PatchException("Gallery URL builder has no return-object")

            returns.asReversed().forEach { (index, register) ->
                addInstructions(
                    index,
                    """
                        invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->galleryUrl(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$register
                    """,
                )
            }
        }

        // Unwrap the /comments reply into the Listing that Sync parses (and caches).
        GalleryParseResponseFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->galleryResponse($NETWORK_RESPONSE)$NETWORK_RESPONSE
                move-result-object p1
            """,
        )
    }
}
