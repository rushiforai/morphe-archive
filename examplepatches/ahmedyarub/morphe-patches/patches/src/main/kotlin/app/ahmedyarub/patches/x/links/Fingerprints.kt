package app.ahmedyarub.patches.x.links

import app.ahmedyarub.patches.x.shared.EXTENSION_PACKAGE
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal const val LINKS_CLASS = "$EXTENSION_PACKAGE/Links;"

/**
 * Builds the ACTION_SEND text intent. Every text share the app's share features make goes through
 * it: the share sheet's "share to app" and system chooser, and the native long-press share.
 */
internal object ShareTextIntentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Landroid/content/Intent;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("android.intent.action.SEND", "text/plain", "android.intent.extra.TEXT"),
)

/** The share sheet's "Copy link" handler, taking the post URL. */
internal object ShareSheetCopyLinkFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("link", "copy_link"),
)

/** The native (long-press) share, which builds x.com/i/status/<id> links. */
internal object NativeShareIntentFingerprint : Fingerprint(
    returnType = "Landroid/content/Intent;",
    strings = listOf("https://x.com/i/trending/", "https://x.com/i/lists/", "https://x.com/i/status/", "image/*"),
)

/**
 * The post interface's default getUrl(): x.com/<username>/status/<id>. Its defining class is the
 * post interface itself.
 */
internal object PostGetUrlFingerprint : Fingerprint(
    name = "getUrl",
    returnType = "Ljava/lang/String;",
    strings = listOf("https://x.com/unavailable/status/"),
)

/**
 * UrlEntity.toString(), which names the entity's fields in the order they are read. A live event
 * model of the same name exists; the one links in posts, DMs and bios use is in com.x.models.
 */
internal object UrlEntityToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("UrlEntity(displayUrl="),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/x/models/") },
)

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/x/android/main/MainActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object MainActivityOnNewIntentFingerprint : Fingerprint(
    definingClass = "Lcom/x/android/main/MainActivity;",
    name = "onNewIntent",
    parameters = listOf("Landroid/content/Intent;"),
)

internal object SharingDomainExtensionFingerprint : Fingerprint(
    definingClass = LINKS_CLASS,
    name = "sharingDomain",
)
