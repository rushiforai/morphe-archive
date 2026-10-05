package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val RELOAD_VIEW_TAG = "twitchpatches_reload_button"

internal fun insertNativeReloadLayout(document: Document, constrained: Boolean) {
    val nodes = document.getElementsByTagName("ImageView")
    val volumes = (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
        .filter { it.getAttribute("android:id") == "@id/mute_button" }
    if (volumes.size != 1) throw PatchException("Reload stream: native volume layout changed.")
    val volume = volumes.single()
    if (constrained && volume.getAttribute("app:layout_constraintEnd_toStartOf") != "@id/fullscreen_button")
        throw PatchException("Reload stream: native volume alignment changed.")
    val button = volume.cloneNode(true) as Element
    button.setAttribute("android:id", "@+id/$RELOAD_VIEW_TAG")
    button.setAttribute("android:tag", RELOAD_VIEW_TAG)
    button.setAttribute("android:src", "@drawable/ic_refresh_white_24dp")
    button.setAttribute("android:contentDescription", "Reload stream")
    button.setAttribute("android:visibility", "gone")
    if (constrained) volume.setAttribute("app:layout_constraintEnd_toStartOf", "@id/$RELOAD_VIEW_TAG")
    volume.parentNode.insertBefore(button, volume.nextSibling)
}
