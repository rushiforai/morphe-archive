package app.template.patches.taskito.layout

import app.morphe.patcher.Fingerprint

/**
 * The base activity's bottom-bar builder. It lists the tabs (Timeline, the user's tabs, More),
 * appends a "premium" tab (route "premium", label "Premium") and registers its tap listener under
 * the "base_activity" key. The activity and the method are R8-renamed (`base.i.d1()` in 1.3.3),
 * but the bar is a custom View inflated from a layout, so its class name is kept, and
 * "base_activity" is referenced by this method only.
 */
internal object BottomNavigationBuilderFingerprint : Fingerprint(
    returnType = "Lcom/fenchtose/reflog/widgets/bottomnavigation/BottomNavigationBar;",
    parameters = listOf(),
    strings = listOf("premium", "base_activity"),
)
