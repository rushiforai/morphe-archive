package app.abeja.patches.ztegallery

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.abeja.patches.shared.Constants.ZTE_GALLERY
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION_CLASS = "Lapp/template/extension/ExamplePatch;"

@Suppress("unused")
val FixPermissionsPatch = bytecodePatch(
    name = "Fix storage permission",
    description = "Patch to fix the storage permission.",
    default = true
) {
    compatibleWith(ZTE_GALLERY)

    // dependsOn(internalPatch)

    extendWith("extensions/extension.mpe")

    // Business logic of the patch to fix app permissions.
    execute {

        PhotoGalleryGetRequestArrayFingerprint.method.instructions.forEachIndexed { index, instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? StringReference
                ?: return@forEachIndexed

            if (ref.string == "android.permission.MANAGE_EXTERNAL_STORAGE") {
                PhotoGalleryGetRequestArrayFingerprint.method.replaceInstruction(
                    index,
                    """const-string v0, "android.permission.READ_MEDIA_IMAGES""""
                )
            }
        }

        PermissionCheckerHelperGetRequestArrayFingerprint.method.instructions.forEachIndexed { index, instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? StringReference
                ?: return@forEachIndexed

            if (ref.string == "android.permission.MANAGE_EXTERNAL_STORAGE") {
                PermissionCheckerHelperGetRequestArrayFingerprint.method.replaceInstruction(
                    index,
                    """const-string v0, "android.permission.READ_MEDIA_IMAGES""""
                )
            }
        }

        PreViewAlbumActivityGetRequestArrayFingerprint.method.instructions.forEachIndexed { index, instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? StringReference
                ?: return@forEachIndexed

            if (ref.string == "android.permission.MANAGE_EXTERNAL_STORAGE") {
                PreViewAlbumActivityGetRequestArrayFingerprint.method.replaceInstruction(
                    index,
                    """const-string v0, "android.permission.READ_MEDIA_IMAGES""""
                )
            }
        }

        SmartBusinessGalleryGetRequestArrayFingerprint.method.instructions.forEachIndexed { index, instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? StringReference
                ?: return@forEachIndexed

            if (ref.string == "android.permission.MANAGE_EXTERNAL_STORAGE") {
                SmartBusinessGalleryGetRequestArrayFingerprint.method.replaceInstruction(
                    index,
                    """const-string v0, "android.permission.READ_MEDIA_IMAGES""""
                )
            }
        }

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
            """

        )
    }
}
