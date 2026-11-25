package app.sigstick.patches.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

private const val SETTINGS_SCREEN = "Lcom/sigstick/myapp/ui/screen/account/SettingsScreenKt;"

/**
 * Settings' "About" card body (`SettingsScreen$lambda$10` in 5.25.0). It builds a
 * `List<ListItem>` — [Debug], Terms of Service, Privacy Policy, Send Logs to Developer,
 * Version — each `new ListItem(title, Icons.Outlined.<icon>, onClick)` followed by
 * `List.add`. The icon getters are the stable anchors: R.string ids move between builds.
 */
internal object AboutItemsFingerprint : Fingerprint(
    definingClass = SETTINGS_SCREEN,
    filters = listOf(
        methodCall(name = "getAccountBalance"),
        methodCall(name = "getPrivacyTip"),
        methodCall(name = "getAdb"),
    ),
)

/**
 * Settings' "Connect" card body (`SettingsScreen$lambda$10$2$3`): `SectionListItem` Follow Us
 * (Icons.Outlined.Favorite) → `SectionDivider` → `SectionListItem` Community → `SectionDivider`
 * → `EmailUsBtn`.
 */
internal object ConnectItemsFingerprint : Fingerprint(
    definingClass = SETTINGS_SCREEN,
    filters = listOf(
        methodCall(name = "getFavorite"),
        methodCall(name = "SectionListItem-hGBTI10"),
        methodCall(name = "getDiversity1"),
        methodCall(name = "EmailUsBtn"),
    ),
)

/**
 * `sendDevLog(Context)V` — writes the file list, the WhatsApp sticker directory tree and the
 * in-memory Timber buffer to `cache/logs/sigstick.log`, then opens an ACTION_SEND email to the
 * support address from Remote Config.
 */
internal object SendDevLogFingerprint : Fingerprint(
    definingClass = SETTINGS_SCREEN,
    name = "sendDevLog",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/** `LogTree.log(ILString;String;Throwable)V` — the Timber tree that fills that buffer. */
internal object LogTreeLogFingerprint : Fingerprint(
    definingClass = "Lcom/sigstick/myapp/log/LogTree;",
    name = "log",
    returnType = "V",
)
