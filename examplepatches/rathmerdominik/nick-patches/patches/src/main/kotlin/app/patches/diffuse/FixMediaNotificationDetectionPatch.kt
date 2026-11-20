package app.patches.diffuse

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.patches.shared.Constants.COMPATIBILITY_DIFFUSE

@Suppress("unused")
val fixMediaNotificationDetectionPatch = patch (
    name = "Fix media notification detection",
    description = "Detects music notifications posted by foreground services that don't set " +
        "FLAG_ONGOING_EVENT e.G Morphed YT Music. Requires a PairIP bypass patch!",
) {
    compatibleWith(COMPATIBILITY_DIFFUSE)

    execute {
        IsPersistentNotificationFingerprint.method.addInstructions(
            0,
            persistentNotificationInstructions(),
        )
    }
}

private fun persistentNotificationInstructions() = listOf(
    checkNotificationClearability(),
    checkNotificationExists(),
    checkPersistentFlags(),
    returnPersistent(),
    returnNotPersistent(),
).joinToString("\n")

private fun checkNotificationClearability() = """
    invoke-virtual {p0}, Landroid/service/notification/StatusBarNotification;->isClearable()Z
    move-result v0
    if-nez v0, :not_persistent
""".trimIndent()

private fun checkNotificationExists() = """
    invoke-virtual {p0}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;
    move-result-object v0
    if-eqz v0, :not_persistent
""".trimIndent()

private fun checkPersistentFlags() = """
    iget v0, v0, Landroid/app/Notification;->flags:I
    and-int/lit8 v0, v0, 0x42
    if-eqz v0, :not_persistent
""".trimIndent()

private fun returnPersistent() = """
    const/4 v0, 0x1
    return v0
""".trimIndent()

private fun returnNotPersistent() = """
    :not_persistent
    const/4 v0, 0x0
    return v0
""".trimIndent()
