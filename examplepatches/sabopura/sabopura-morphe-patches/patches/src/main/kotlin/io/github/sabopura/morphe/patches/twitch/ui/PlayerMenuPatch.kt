package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.softHook
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val BUTTON = "io.github.sabopura.morphe.extension.twitch.ui.PlayerMenuButton"
private const val BUTTON_ID = "sabopura_player_menu"
private const val RUNTIME = "Lio/github/sabopura/morphe/extension/twitch/TwitchRuntime;"

private fun Element.descendants(): List<Element> {
    val nodes = getElementsByTagName("*")
    return (0 until nodes.length).map { nodes.item(it) as Element }
}

private fun Element.androidId() = getAttribute("android:id").substringAfter('/')

/** Starts the extension with the app, whichever patches were selected. */
internal val twitchRuntimePatch = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        mutableClassDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;")
            .methods.single { it.name == "onCreate" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static/range {p0 .. p0}, $RUNTIME->initialize(Landroid/content/Context;)V")
    }
}

/** Twitch's two sets of player controls: the live player's, and the one VODs and clips use. */
internal val PLAYER_CONTROL_LAYOUTS = listOf("player_control_overlay", "player_control_overlay_widget")

private const val END_TO_START = "app:layout_constraintEnd_toStartOf"
private const val START_TO_END = "app:layout_constraintStart_toEndOf"

/**
 * Puts the menu button directly left of the share button of a player control layout, sized and
 * padded like it. What sat there (the cast button, which comes and goes with cast devices) now sits
 * left of ours, so ours never moves. Where the buttons form a chain, ours joins it in both
 * directions; a one-way link would break the chain and unpack the row.
 */
internal fun addPlayerMenuButton(document: Document, layout: String) {
    val root = document.documentElement
    val views = root.descendants()
    if (views.any { it.androidId() == BUTTON_ID }) return
    val share = views.singleOrNull { it.androidId() == "share_button" }
        ?: throw PatchException("Twitch player controls ($layout) lost share_button")
    views.filter { it.getAttribute(END_TO_START).substringAfter('/') == "share_button" }
        .forEach { it.setAttribute(END_TO_START, "@+id/$BUTTON_ID") }
    val button = document.createElement(BUTTON)
    button.setAttribute("android:id", "@+id/$BUTTON_ID")
    for (copied in listOf("android:layout_width", "android:layout_height", "android:padding", "app:layout_constraintTop_toTopOf")) {
        val value = share.getAttribute(copied)
        if (value.isEmpty()) throw PatchException("Twitch player controls ($layout): share_button has no $copied")
        button.setAttribute(copied, value)
    }
    button.setAttribute(END_TO_START, "@id/share_button")
    val leftOfShare = share.getAttribute(START_TO_END)
    if (leftOfShare.isNotEmpty()) {
        button.setAttribute(START_TO_END, leftOfShare)
        share.setAttribute(START_TO_END, "@id/$BUTTON_ID")
    }
    share.parentNode.insertBefore(button, share)
}

/**
 * Adds the single player menu button to the player controls. Every feature patch depends on it,
 * so it is added once.
 */
internal val playerMenuResourcePatch = resourcePatch(
    description = "Adds the shared player menu button to Twitch's player controls.",
) {
    compatibleWith(TWITCH_SUPPORTED)
    dependsOn(twitchRuntimePatch, settingsEntryPatch, nativeTheatrePatch)

    execute {
        for (layout in PLAYER_CONTROL_LAYOUTS) softHook("player menu button in $layout") {
            document("res/layout/$layout.xml").use { addPlayerMenuButton(it, layout) }
        }
    }
}
