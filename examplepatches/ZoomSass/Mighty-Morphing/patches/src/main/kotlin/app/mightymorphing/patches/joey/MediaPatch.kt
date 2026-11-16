package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.indexOfReference
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel

/*
 * Media features shared by Modern UI and Media enhancements: downloads, full screen media,
 * hide controls on open, the album viewer and swipe albums closed. Both patches depend on
 * mediaHooksPatch, so the hooks below are added once whichever is picked. The features run in
 * Modern and in Classic; each has its own switch in Morphe Settings (Media).
 */

private const val SETTINGS = "Lapp/mightymorphing/extension/joey/MorpheSettings;"
private const val MODERN_UI = "Lapp/mightymorphing/extension/joey/ModernUi;"
private const val POSTS = "Lapp/mightymorphing/extension/joey/PostLayout;"
private const val DOWNLOADS = "Lapp/mightymorphing/extension/joey/MediaDownload;"
private const val ALBUM = "Lapp/mightymorphing/extension/joey/AlbumChrome;"

private val mediaResources = resourcePatch {
    compatibleWith(JOEY)

    execute {
        val drawable = get("res").resolve("drawable")
        drawable.mkdirs()
        drawable.resolve("morphe_download.xml").writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp"
                android:height="24dp"
                android:viewportWidth="24"
                android:viewportHeight="24">
                <path
                    android:fillColor="#FFFFFFFF"
                    android:fillType="evenOdd"
                    android:pathData="M17,3H5C3.89,3 3,3.9 3,5V19C3,20.1 3.89,21 5,21H19C20.1,21 21,20.1 21,19V7L17,3M19,19H5V5H16.17L19,7.83V19M12,12C10.34,12 9,13.34 9,15S10.34,18 12,18 15,16.66 15,15 13.66,12 12,12M6,6H15V10H6V6Z" />
            </vector>
            """.trimIndent(),
        )
    }
}

/** No name, so it is not listed in Morphe. Pulled in by Modern UI and Media enhancements. */
internal val mediaHooksPatch = bytecodePatch {
    compatibleWith(JOEY)

    dependsOn(mediaResources, dismissWithoutTearingPatch)
    extendWith("extensions/extension.mpe")

    execute {
        SettingsHookFingerprint.method.insertAt(
            0,
            """
            invoke-static {}, $SETTINGS->enableMediaEnhancements()V
            """,
        )

        // Classic: the download button on Joey's own post bar, after each bind (u(Z), the
        // bind for feed, comment screen, profile and search). Modern places it through PostLayout.
        val bind = Fingerprint(
            definingClass = "Ljc/d;",
            name = "u",
            returnType = "V",
            parameters = listOf("Z"),
        ).method
        bind.insertAt(
            bind.instructions.lastIndex,
            """
            invoke-static {p0}, $POSTS->classicPost(Ljava/lang/Object;)V
            """,
        )

        val open = Fingerprint(
            definingClass = "Loa/f;",
            name = "e",
            returnType = "V",
            parameters = listOf(
                "Lnet/dean/jraw/models/Submission;",
                "Landroid/app/Activity;",
                "Z",
            ),
        ).method
        open.insertAt(
            0,
            """
            invoke-static {p0}, $DOWNLOADS->note(Ljava/lang/Object;)V
            """,
        )

        val save = Fingerprint(
            definingClass = "Lo/o/joey/Activities/BaseActivity;",
            name = "y1",
            returnType = "V",
            parameters = listOf("Ljava/lang/String;"),
        ).method
        save.insertAt(
            0,
            """
            invoke-static {p0, p1}, $DOWNLOADS->prepare(Landroid/app/Activity;Ljava/lang/String;)V
            """,
        )

        PhotoViewerFingerprint.method.insertAt(
            0,
            """
            invoke-static {p0}, $MODERN_UI->setupPhotoViewer(Landroid/app/Activity;)V
            """,
        )

        val album = Fingerprint(
            definingClass = "Lo/o/joey/Activities/BaseAlbumActivity;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
        ).method
        album.insertAt(
            album.instructions.lastIndex,
            """
            invoke-static {p0}, $MODERN_UI->setupAlbumViewer(Landroid/app/Activity;)V
            """,
        )

        // Joey leaves fullscreen when a screen opens with its Immersive mode off (BaseActivity.B1),
        // and its picture viewer resets the system bars on every tap (ja.v.T0). In Modern the
        // viewers stay fullscreen, so both return early there. Both have v0 free at the start.
        val leaveFullscreen = Fingerprint(
            definingClass = "Lo/o/joey/Activities/BaseActivity;",
            name = "B1",
            returnType = "V",
            parameters = emptyList(),
        ).method
        leaveFullscreen.insertAt(
            0,
            """
            invoke-static {p0}, $MODERN_UI->keepViewerFullscreen(Landroid/app/Activity;)Z
            move-result v0
            if-eqz v0, :leave_fullscreen_joey
            return-void
            """,
            ExternalLabel("leave_fullscreen_joey", leaveFullscreen.instructions[0]),
        )
        val viewerBars = Fingerprint(
            definingClass = "Lja/v;",
            name = "T0",
            returnType = "V",
            parameters = listOf("Z"),
        ).method
        viewerBars.insertAt(
            0,
            """
            invoke-static {p0}, $MODERN_UI->ownsViewerBars(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :viewer_bars_joey
            return-void
            """,
            ExternalLabel("viewer_bars_joey", viewerBars.instructions[0]),
        )

        // Joey's album grid overview (J3) opens as a small dialog. In Modern the same grid view,
        // adapter and tap handler are shown full screen by AlbumChrome, and Joey's dialog is not
        // shown. v0 is Joey's dialog, v1 its GridView; v2 is free after the tap handler is set.
        for (album in listOf("RedditGalleryActivity", "IAActivity")) {
            val overview = Fingerprint(
                definingClass = "Lo/o/joey/Activities/$album;",
                name = "J3",
                returnType = "V",
                parameters = emptyList(),
            ).method
            val show = overview.indexOfReference("Lzd/c;->e0(Landroid/app/Dialog;)V")
            overview.insertAt(
                show,
                """
                invoke-static {p0, v0, v1}, $ALBUM->grid(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/GridView;)Z
                move-result v2
                if-eqz v2, :album_grid_joey
                return-void
                """,
                ExternalLabel("album_grid_joey", overview.instructions[show]),
            )
        }

        VActivityFingerprint.method.insertAt(
            0,
            """
            invoke-static {p0}, $MODERN_UI->setupVideoViewer(Landroid/app/Activity;)V
            """,
        )

        // Joey names the saved file from the URL. Swap in the chosen name as it is filed.
        for (name in listOf("E", "F")) {
            val filing = Fingerprint(
                definingClass = "Lo/o/joey/Download/DownloadService;",
                name = name,
                returnType = "V",
                parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
            ).method
            filing.insertAt(
                0,
                """
                invoke-static {p2}, $DOWNLOADS->fileName(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p2
                """,
            )
        }
    }
}

@Suppress("unused")
val mediaEnhancementsPatch = bytecodePatch(
    name = "Media enhancements",
    description = "[v1.5.0: New. The Modern UI media features, now as their own patch so Classic Joey can have them too. Nothing changes for existing users; Modern UI already includes all of this.] Downloads with your own file names and folder, full screen media, optionally opening without controls, an album viewer with thumbnails, grid and captions, and swiping albums closed. All on by default; each can be turned off in Joey Settings - Morphe Settings.",
    default = false,
) {
    compatibleWith(JOEY)

    dependsOn(mediaHooksPatch)
}
