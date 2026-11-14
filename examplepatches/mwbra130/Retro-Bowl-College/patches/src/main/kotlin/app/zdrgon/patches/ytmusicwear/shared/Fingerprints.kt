package app.zdrgon.patches.ytmusicwear.shared

import app.morphe.patcher.Fingerprint

// ── Wear main activity entry — YouTube Music (Wear OS) 9.45.41-WEAR_RELEASE ──
//
// The phone app's shared entry hook (MusicActivity.onCreate) does not
// exist in the Wear build: the class
// Lcom/google/android/apps/youtube/music/activities/MusicActivity;
// appears 0 times in the Wear dex (25,034 classes parsed 2026-11-13).
// The Wear app is a Jetpack Compose app whose main activity is
// WearMainActivityCompose, and it DOES implement the same entry method
// (verified in the Wear dex method list 2026-11-13):
//
//   Lcom/google/android/apps/youtube/music/wear/compose/activity/main/WearMainActivityCompose;->onCreate(Landroid/os/Bundle;)V
//
// This is the Wear equivalent foundation hook for any future
// extension/settings work. No shipped patch depends on it yet.

internal const val YOUTUBE_MUSIC_WEAR_MAIN_ACTIVITY_CLASS_TYPE =
    "Lcom/google/android/apps/youtube/music/wear/compose/activity/main/WearMainActivityCompose;"

object WearMainActivityOnCreateFingerprint : Fingerprint(
    definingClass = YOUTUBE_MUSIC_WEAR_MAIN_ACTIVITY_CLASS_TYPE,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)
