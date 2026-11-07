package com.anderson.applemusic.core

import android.graphics.Bitmap
import androidx.compose.runtime.Immutable

/** What the Apple Music media session is currently doing. */
// @Immutable: every field is replaced, never mutated — the artwork bitmap comes from
// getBitmap() and is never written after it is handed over. Without the annotation the
// Bitmap field makes the class unstable and forces the TV player chip / full player to
// recompose on every playback snapshot.
@Immutable
data class PlaybackSnapshot(
    val hasSession: Boolean = false,
    val playing: Boolean = false,
    val positionMs: Long = 0L,
    val durationMs: Long = 0L,
    val title: String = "",
    val artist: String = "",
    val album: String = "",
    val artwork: Bitmap? = null,
    /** Session actions of the engine ("Favorito", "Criar Estação", …), in its order. */
    val customActions: List<CustomAction> = emptyList(),
)

/**
 * One action of `PlaybackState.getCustomActions()`.
 *
 * The icon is the drawable resource id published by the session app (the engine);
 * the extras bundle is flattened to strings so the snapshot stays immutable and
 * comparable instead of carrying a mutable [android.os.Bundle].
 */
@Immutable
data class CustomAction(
    /** Action id to hand back to [MediaBrowserClient.sendCustomAction]. */
    val action: String,
    /** Display name the engine publishes for the action. */
    val title: String,
    /** Drawable resource id in the session app's package; 0 when none was set. */
    val iconResId: Int = 0,
    /** Flattened `CustomAction.getExtras()`. */
    val extras: Map<String, String> = emptyMap(),
)
