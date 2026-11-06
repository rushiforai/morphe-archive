package app.bookspiko.patches.books.reader.copy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string

internal object ReaderCopyMenuFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("L", "L", "I"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "menu_copy"),
        resourceLiteral(ResourceType.DRAWABLE, "gs_content_copy_vd_theme_24"),
    ),
)

internal object ReaderCopyActionFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    filters = listOf(
        methodCall(smali = "Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;"),
        methodCall(smali = "Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V"),
        methodCall(smali = "Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;"),
    ),
)

internal object CopyQuotaInfoFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("CopyQuotaInfo(volumeId=")),
)

internal object InnerVolumeEntityFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("InnerVolumeEntity(volumeId=")),
)

internal object VolumeInfoEntityFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("VolumeInfoEntity(title=")),
)

internal object VolumeFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("Volume(volumeId=")),
)

internal object VolumeInfoFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(string("VolumeInfo(title=")),
)

/** Contract used by BookMetadata's on-demand, offline lookup. */
internal object LegacyVolumeColumnsFingerprint : Fingerprint(
    name = "<clinit>",
    filters = listOf(string("title"), string("creator"), string("sortable_creator"), string("authors")),
)

internal object LegacyVolumeRouteFingerprint : Fingerprint(
    name = "<clinit>",
    filters = listOf(string("accounts/volumes")),
)

internal object LegacyVolumeAuthorityFingerprint : Fingerprint(
    name = "<clinit>",
    filters = listOf(
        string("content://com.google.android.apps.books"),
        string("books-content://com.google.android.apps.books"),
    ),
)

internal object LegacyVolumeQueryFingerprint : Fingerprint(
    returnType = "Landroid/database/Cursor;",
    filters = listOf(string("COUNT(*) AS _count"), string("view_volumes"), string("volumes")),
)
