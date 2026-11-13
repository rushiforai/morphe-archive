package app.abeja.patches.ztegallery.fixpermissions

import app.abeja.patches.shared.Constants.ZTE_GALLERY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val READ_EXTERNAL_STORAGE = "android.permission.READ_EXTERNAL_STORAGE"
private const val WRITE_EXTERNAL_STORAGE = "android.permission.WRITE_EXTERNAL_STORAGE"
private const val MANAGE_EXTERNAL_STORAGE = "android.permission.MANAGE_EXTERNAL_STORAGE"
private const val ACCESS_MEDIA_LOCATION = "android.permission.ACCESS_MEDIA_LOCATION"
private const val READ_MEDIA_IMAGES = "android.permission.READ_MEDIA_IMAGES"
private const val READ_MEDIA_VIDEO = "android.permission.READ_MEDIA_VIDEO"
private const val READ_MEDIA_AUDIO = "android.permission.READ_MEDIA_AUDIO"

/**
 * Makes `PermissionChecker.checkPermission` treat permissions that cannot be granted (or that
 * must not block the UI) as granted.
 *
 * - MANAGE_EXTERNAL_STORAGE is not a runtime permission, so it is always considered granted.
 * - ACCESS_MEDIA_LOCATION is only used to read EXIF location data, which the gallery can live
 *   without. Denying it makes several activities finish immediately, so it is always granted.
 * - WRITE_EXTERNAL_STORAGE is not grantable anymore once scoped storage is enforced (API 30+).
 * - READ_EXTERNAL_STORAGE has no effect on API 33+ (READ_MEDIA_* replaced it).
 *
 * READ_MEDIA_* permissions must still be checked and requested normally: they are required to
 * read photos and videos, and marking them as granted would leave a fresh install without access.
 */
private val CHECK_PERMISSION_SMALI = """
    const/4 v1, 0x1

    if-eqz p1, :original

    const-string v0, "$MANAGE_EXTERNAL_STORAGE"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :not_manage
    return v1

    :not_manage
    const-string v0, "$ACCESS_MEDIA_LOCATION"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :not_media_location
    return v1

    :not_media_location
    const-string v0, "$WRITE_EXTERNAL_STORAGE"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :not_write
    sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const/16 v2, 0x1e
    if-ge v0, v2, :original
    return v1

    :not_write
    const-string v0, "$READ_EXTERNAL_STORAGE"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :original
    sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const/16 v2, 0x21
    if-ge v0, v2, :original
    return v1

    :original
    nop
"""

/**
 * Builds smali that returns an empty permission array.
 */
private val EMPTY_REQUEST_ARRAY_SMALI = """
    const/4 v0, 0x0
    new-array v0, v0, [Ljava/lang/String;
    return-object v0
"""

/**
 * Builds smali that returns an SDK aware permission array.
 *
 * On API 33+ the given media permissions are returned, below API 33
 * READ_EXTERNAL_STORAGE is returned instead.
 */
private fun sdkAwareRequestArray(vararg mediaPermissions: String): String = buildString {
    appendLine("sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I")
    appendLine("const/16 v1, 0x21")
    appendLine("if-lt v0, v1, :modern")
    appendLine("const/4 v0, 0x1")
    appendLine("new-array v0, v0, [Ljava/lang/String;")
    appendLine("const/4 v1, 0x0")
    appendLine("const-string p0, \"$READ_EXTERNAL_STORAGE\"")
    appendLine("aput-object p0, v0, v1")
    appendLine("return-object v0")
    appendLine(":modern")
    appendLine("const/4 v0, 0x${mediaPermissions.size.toString(16)}")
    appendLine("new-array v0, v0, [Ljava/lang/String;")
    mediaPermissions.forEachIndexed { index, permission ->
        appendLine("const/4 v1, 0x${index.toString(16)}")
        appendLine("const-string p0, \"$permission\"")
        appendLine("aput-object p0, v0, v1")
    }
    appendLine("return-object v0")
}

@Suppress("unused")
val FixPermissionsPatch = bytecodePatch(
    name = "Fix storage permission",
    description = "Patch to fix the storage permission.",
    default = true
) {
    compatibleWith(ZTE_GALLERY)

    extendWith("extensions/extension.mpe")

    execute {
        // Never ask for permissions that cannot be granted, or whose denial would close the UI.
        PermissionCheckerCheckPermissionFingerprint.method.addInstructionsWithLabels(
            0,
            CHECK_PERMISSION_SMALI,
        )

        // The permission arrays never contain more than six entries, so raising the
        // "request everything" thresholds to 7 makes the checker always request only the
        // missing permissions. This avoids requesting ungrantable entries such as
        // MANAGE_EXTERNAL_STORAGE.
        PermissionCheckerCheckPermissionsIfNotAllowFingerprint.method.apply {
            val thresholdIndices = mutableListOf<Int>()

            instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.CONST_4) return@forEachIndexed

                val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral
                    ?: return@forEachIndexed
                val register = (instruction as? OneRegisterInstruction)?.registerA
                    ?: return@forEachIndexed

                // The two "request everything" thresholds are const/4 v3, 0x4 and const/4 v3, 0x3.
                if (register == 3 && (literal == 4 || literal == 3)) {
                    thresholdIndices += index
                }
            }

            if (thresholdIndices.isEmpty()) {
                throw PatchException("Could not find the permission request thresholds")
            }

            thresholdIndices.forEach { index ->
                replaceInstruction(index, "const/4 v3, 0x7")
            }
        }

        // The wallpaper activity only receives a granted content URI, so it does not need
        // to request any storage permission of its own.
        WallpaperGetRequestArrayFingerprint.method.addInstructions(
            0,
            EMPTY_REQUEST_ARRAY_SMALI,
        )

        // These activities only need read access and must not request ACCESS_MEDIA_LOCATION:
        // denying it would make them finish immediately.
        CropPageGetRequestArrayFingerprint.method.addInstructionsWithLabels(
            0,
            sdkAwareRequestArray(READ_MEDIA_IMAGES, READ_MEDIA_VIDEO),
        )

        NewCropPageGetRequestArrayFingerprint.method.addInstructionsWithLabels(
            0,
            sdkAwareRequestArray(READ_MEDIA_IMAGES, READ_MEDIA_VIDEO),
        )

        DocumentActivityGetRequestArrayFingerprint.method.addInstructionsWithLabels(
            0,
            sdkAwareRequestArray(READ_MEDIA_IMAGES, READ_MEDIA_VIDEO, READ_MEDIA_AUDIO),
        )

        BaseDocumentActivityGetRequestArrayFingerprint.method.addInstructionsWithLabels(
            0,
            sdkAwareRequestArray(READ_MEDIA_IMAGES, READ_MEDIA_VIDEO, READ_MEDIA_AUDIO),
        )

        // The provider does its own permission check and only reads image metadata.
        GalleryFavoriteProviderGetRequestArrayFingerprint.method.addInstructionsWithLabels(
            0,
            sdkAwareRequestArray(READ_MEDIA_IMAGES),
        )

        // Keep asking for All Files Access on Android 11+
        MultiGalleryOnResumeFingerprint.method.addInstructions(
            0,
            """
                sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I

                const/16 v1, 0x1e    # Android 11

                if-lt v0, v1, :permission_ok

                invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z
                move-result v0

                if-nez v0, :permission_ok

                new-instance v0, Landroid/content/Intent;

                const-string v1, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

                invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

                const-string v1, "package"

                invoke-virtual {p0}, Lcom/zte/gallery3d/activity/execute/MultiGallery;->getPackageName()Ljava/lang/String;
                move-result-object v2

                const/4 v3, 0x0

                invoke-static {v1, v2, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
                move-result-object v1

                invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

                const-string v1, "Please grant All Files permission"

                const/4 v2, 0x1    # Toast.LENGTH_LONG

                invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
                move-result-object v1

                invoke-virtual {v1}, Landroid/widget/Toast;->show()V

                invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

                return-void

                :permission_ok
            """,
        )
    }
}
