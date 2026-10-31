package app.morphe.patches.reddit.customclients.sync.syncforreddit.fix.thumbnail

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patches.reddit.customclients.sync.syncforreddit.http.interceptHttpRequests
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/http/imgur/RecoverThumbnailsPatch;"

private const val REMEMBER_METHOD =
    "rememberThumbnails(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V"

@Suppress("unused")
val recoverThumbnailsPatch = bytecodePatch(
    name = "Recover post thumbnails from the archive",
    description = "Loads a post's thumbnail from the Wayback Machine when its Reddit preview has " +
            "been purged.",
    default = true
) {
    dependsOn(sharedExtensionPatch, interceptHttpRequests)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        // Injected at the top of the method, where the locals it uses are still free. Reading
        // the addresses here rather than at the load call keeps this clear of the registers
        // Sync has in flight by then.
        postThumbnailBindFingerprint.method.addInstructions(
            0,
            """
            invoke-virtual      { p1 }, $POST_MODEL->Z0()Ljava/lang/String;
            move-result-object  v0
            invoke-virtual      { p1 }, $POST_MODEL->H0()Ljava/lang/String;
            move-result-object  v1
            invoke-virtual      { p1 }, $POST_MODEL->e1()Ljava/lang/String;
            move-result-object  v2
            invoke-static       { v0, v1, v2 }, $EXTENSION_CLASS_DESCRIPTOR->$REMEMBER_METHOD
            """
        )

        // A card shows the image through a view of its own, which is what a feed of cards
        // loads and so what has to be recorded for one. It holds the post in a field rather
        // than being handed it.
        cardMediaBindFingerprint.method.apply {
            val postField = instructions.first {
                it.opcode == Opcode.IGET_OBJECT &&
                        it.getReference<FieldReference>()?.type == POST_MODEL
            }.getReference<FieldReference>()!!

            addInstructions(
                0,
                """
                iget-object         v0, p0, ${postField.definingClass}->${postField.name}:${postField.type}
                invoke-virtual      { v0 }, $POST_MODEL->Z0()Ljava/lang/String;
                move-result-object  v1
                invoke-virtual      { v0 }, $POST_MODEL->H0()Ljava/lang/String;
                move-result-object  v2
                invoke-virtual      { v0 }, $POST_MODEL->e1()Ljava/lang/String;
                move-result-object  v3
                invoke-static       { v1, v2, v3 }, $EXTENSION_CLASS_DESCRIPTOR->$REMEMBER_METHOD
                """
            )
        }
    }
}
