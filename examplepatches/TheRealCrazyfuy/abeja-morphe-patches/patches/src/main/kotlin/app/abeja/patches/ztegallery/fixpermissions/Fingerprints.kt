package app.abeja.patches.ztegallery.fixpermissions

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object MultiGalleryOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/zte/gallery3d/activity/execute/MultiGallery;",
    name = "onResume",
    accessFlags = listOf(AccessFlags.PROTECTED),
    returnType = "V",
    parameters = emptyList(),
)

object PermissionCheckerCheckPermissionFingerprint : Fingerprint(
    definingClass = "Lcom/zte/gallery3d/component/permissionchecker/PermissionChecker;",
    name = "checkPermission",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

object PermissionCheckerCheckPermissionsIfNotAllowFingerprint : Fingerprint(
    definingClass = "Lcom/zte/gallery3d/component/permissionchecker/PermissionChecker;",
    name = "checkPermissionsIfNotAllow",
    returnType = "Z",
    parameters = emptyList(),
)

object WallpaperGetRequestArrayFingerprint : Fingerprint(
    definingClass = "Lcom/android/gallery3d/app/Wallpaper;",
    name = "getRequestArray",
    returnType = "[Ljava/lang/String;",
)

object CropPageGetRequestArrayFingerprint : Fingerprint(
    definingClass = "Lcom/android/gallery3d/app/CropPage;",
    name = "getRequestArray",
    returnType = "[Ljava/lang/String;",
)

object NewCropPageGetRequestArrayFingerprint : Fingerprint(
    definingClass = "Lcom/android/gallery3d/app/NewCropPage;",
    name = "getRequestArray",
    returnType = "[Ljava/lang/String;",
)

object DocumentActivityGetRequestArrayFingerprint : Fingerprint(
    definingClass = "Lcom/zte/document/DocumentActivity;",
    name = "getRequestArray",
    returnType = "[Ljava/lang/String;",
)

object BaseDocumentActivityGetRequestArrayFingerprint : Fingerprint(
    definingClass = "Lcom/zte/document/BaseDocumentActivity;",
    name = "getRequestArray",
    returnType = "[Ljava/lang/String;",
)

object GalleryFavoriteProviderGetRequestArrayFingerprint : Fingerprint(
    definingClass = "Lcom/android/gallery3d/provider/GalleryFavoriteProvider;",
    name = "getRequestArray",
    returnType = "[Ljava/lang/String;",
)
