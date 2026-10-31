package app.fluffydiscord.patches.screenrecorder

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val TILE_ICON_PATH = "res/drawable/ic_title.xml"
private const val LETTER_H_PATH = "M6.72,9.25H8.52V12.1H10.92V9.25H12.72V16.75H10.92V13.9H8.52V16.75H6.72Z"

@Suppress("unused")
val tileIconPatch = resourcePatch(
    name = "Mark tile icon",
    description = "Cuts an \"H\" into the camera of the Screen Recorder tile icon.",
    default = true,
) {
    compatibleWith(SCREEN_RECORDER_COMPATIBILITY)

    dependsOn(highFrameRatePatch)

    execute {
        document(TILE_ICON_PATH).use { document ->
            val cameraPath = document.getElementsByTagName("path").item(0) as Element
            val cameraOutline = cameraPath.getAttribute("android:pathData")
            cameraPath.setAttribute("android:pathData", cameraOutline + LETTER_H_PATH)
            cameraPath.setAttribute("android:fillType", "evenOdd")
        }
    }
}
