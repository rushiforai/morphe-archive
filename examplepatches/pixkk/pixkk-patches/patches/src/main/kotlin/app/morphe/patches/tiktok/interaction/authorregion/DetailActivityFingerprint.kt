package app.morphe.patches.tiktok.interaction.authorregion

import app.morphe.patcher.Fingerprint

/**
 * Videos opened from a profile play in the detail page, and a process restored with a video open
 * can start it with no main feed behind it yet, so the hook in MainActivity.onCreate never runs
 * before it.
 */
internal object DetailActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/detail/ui/DetailActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
