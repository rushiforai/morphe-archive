package app.revanced.patches.rif.gallery

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.revanced.patches.rif.ads.platinumAdSlotFixPatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY

private const val EXTENSION = "Lapp/revanced/extension/rif/GalleryRepair;"

// rif's gallery response parser (free h2.c$a.d0 / Platinum i2.c$a.d0): (InputStream) ->
// GalleryThreadThing, run on a pool thread. Matched by shape: exactly one method in each
// build takes only an InputStream and returns the gallery model.
internal val galleryParserFingerprint = fingerprint {
    returns("Lcom/andrewshu/android/reddit/browser/redditgallery/GalleryThreadThing;")
    parameters("Ljava/io/InputStream;")
}

@Suppress("unused")
val repairBrokenGalleryImagesPatch = bytecodePatch(
    name = "Repair broken gallery images",
    description = "Shows the images of galleries that fail to load because Reddit marks some of their images as failed.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(platinumAdSlotFixPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // p1 = the response stream (the method has 11 registers, so it fits invoke-static).
        galleryParserFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, $EXTENSION->repairGallery(Ljava/io/InputStream;)Ljava/io/InputStream;
                move-result-object p1
            """,
        )
    }
}
