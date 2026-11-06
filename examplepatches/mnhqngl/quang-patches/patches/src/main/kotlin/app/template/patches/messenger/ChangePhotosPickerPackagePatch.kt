package app.template.patches.messenger

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.w3c.dom.Element

internal val COMPATIBILITY_MESSENGER = Compatibility(
    name = "Messenger",
    packageName = "com.facebook.orca",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x0866FF,
    targets = listOf(
        // Bản đã phân tích và viết patch.
        AppTarget(version = "575.0.0.0.1"),
        // Các bản khác: fingerprint không phụ thuộc tên class nên có khả năng vẫn chạy.
        AppTarget(version = null, isExperimental = true),
    ),
)
private const val GOOGLE_PHOTOS_PACKAGE = "com.google.android.apps.photos"

/**
 * Package của Google Photos bản Morphe trên máy bạn.
 * Kiểm tra bằng: adb shell pm list packages | grep photos
 */
private const val DEFAULT_MORPHE_PHOTOS_PACKAGE = "app.morphe.android.apps.photos"

/**
 * Messenger 575.0.0.0.1 — classes10.dex, method LX/NY0;->A00()Ljava/util/List;
 * (tên class bị obfuscate, đổi theo từng bản → match bằng fingerprint, không dùng tên).
 *
 * Logic gốc (đã decompile):
 *   intent = Intent(<PICK action>, MediaStore.Images.Media.INTERNAL_CONTENT_URI).setType(<mime ảnh/video>)
 *   for (ri in pm.queryIntentActivities(intent, 0)) {
 *       if ("com.google.android.apps.photos".equals(ri.activityInfo.packageName)) {   // <-- patch ở đây
 *           intent.setComponent(ComponentName(ri.activityInfo.packageName, ri.activityInfo.name))
 *           list.add(Item("Google Photos", intent, ri.loadIcon(pm), ...))               // nút Photos trong picker
 *       }
 *   }
 *
 * Package + Activity + icon đều lấy từ ResolveInfo của app tìm được, nên chỉ cần đổi
 * chuỗi so sánh là nút sẽ mở (và hiện icon của) Photos bản Morphe.
 * Không cần sửa manifest: Messenger đã có <queries><intent action=MAIN/></queries>,
 * đủ để thấy mọi app có launcher.
 */
internal object GooglePhotosPickerFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Landroid/content/pm/PackageManager;", name = "queryIntentActivities"),
        string(GOOGLE_PHOTOS_PACKAGE),
        methodCall(definingClass = "Ljava/lang/String;", name = "equals"),
        string("Google Photos"),
    ),
)

@Suppress("unused")
val changePhotosPickerPackagePatch = bytecodePatch(
    name = "Change Photos picker package",
    description = "Nút Google Photos trong trình chọn ảnh/video của Messenger sẽ mở Google Photos bản Morphe.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MESSENGER)

    val photosPackage by stringOption(
        key = "photosPackage",
        default = DEFAULT_MORPHE_PHOTOS_PACKAGE,
        title = "Package Photos (Morphe)",
        description = "Package name của Google Photos đã patch bằng Morphe trên máy bạn.",
        required = true,
    )

    execute {
        val newPackage = photosPackage!!.trim()

        GooglePhotosPickerFingerprint.let {
            // filter thứ 2 = const-string "com.google.android.apps.photos"
            val index = it.instructionMatches[1].index
            val register = it.method.getInstruction<OneRegisterInstruction>(index).registerA

            it.method.replaceInstruction(index, "const-string v$register, \"$newPackage\"")
        }
    }
}

/**
 * Messenger tự khai báo <permission app.facebook.permission.prod.FB_APP_COMMUNICATION>
 * (protectionLevel = signature). Quyền này cũng do app Facebook (com.facebook.katana) khai báo.
 * APK đã patch được ký bằng khóa khác → Android từ chối cài:
 *   INSTALL_FAILED_DUPLICATE_PERMISSION ... already owned by com.facebook.katana
 *
 * Patch này bỏ các khai báo <permission> không thuộc namespace của chính Messenger.
 * Các component vẫn giữ android:permission như cũ: Messenger tự gọi component của mình
 * thì luôn được phép (cùng UID), chỉ app khác ký khóa khác mới bị chặn (vốn đã bị chặn).
 */
@Suppress("unused")
val removeConflictingPermissionsPatch = resourcePatch(
    name = "Remove conflicting permission declarations",
    description = "Sửa lỗi INSTALL_FAILED_DUPLICATE_PERMISSION khi máy đã cài app Facebook.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MESSENGER)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val permissions = doc.getElementsByTagName("permission")
            val toRemove = (0 until permissions.length)
                .map { permissions.item(it) as Element }
                .filter { !it.getAttribute("android:name").startsWith("com.facebook.orca") }

            toRemove.forEach { it.parentNode.removeChild(it) }
        }
    }
}
