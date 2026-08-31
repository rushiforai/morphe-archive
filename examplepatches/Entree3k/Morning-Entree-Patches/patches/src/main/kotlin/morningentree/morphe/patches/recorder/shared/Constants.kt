package morningentree.morphe.patches.recorder.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Google Recorder",
        packageName = "com.google.android.apps.recorder",
        appIconColor = 0xEA4335,
        targets = listOf(AppTarget(null)),
    )
}
