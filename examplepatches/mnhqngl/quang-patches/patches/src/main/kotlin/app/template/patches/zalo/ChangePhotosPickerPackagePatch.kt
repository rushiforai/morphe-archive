package app.template.patches.zalo

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal val COMPATIBILITY_ZALO = Compatibility(
    name = "Zalo",
    packageName = "com.zing.zalo",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x0068FF,
    targets = listOf(
        // Bản đã phân tích và viết patch (APKMirror, bundle .apkm).
        AppTarget(version = "26.10.02"),
        // Các bản khác: patch tìm theo class/chuỗi chứ không theo tên method bị obfuscate,
        // nên có khả năng vẫn chạy.
        AppTarget(version = null, isExperimental = true),
    ),
)

private const val GOOGLE_PHOTOS_PACKAGE = "com.google.android.apps.photos"
private const val GOOGLE_PHOTOS_PROVIDER = "com.google.android.apps.photos.contentprovider"

/**
 * Package của Google Photos bản Morphe trên máy bạn.
 * Kiểm tra bằng: adb shell pm list packages | grep photos
 * Authority của ContentProvider chính là "<package>.contentprovider" (Morphe đổi cả hai).
 */
private const val DEFAULT_MORPHE_PHOTOS_PACKAGE = "app.morphe.android.apps.photos"

/** Zalo giữ nguyên tên class UI (không bị obfuscate), tên method thì có. */
private const val ZALO_CLASS_PREFIX = "Lcom/zing/zalo/"
private const val QUICK_PICKER_VIEW = "Lcom/zing/zalo/ui/picker/QuickPickerView;"

private fun String.smaliEscape() = replace("\\", "\\\\").replace("\"", "\\\"")

/**
 * Zalo 26.10.02 — các chỗ nhắc tới Google Photos (đã decompile):
 *
 * 1. com.zing.zalo.ui.picker.QuickPickerView.K6 / k5   (tên method bị obfuscate)
 *      const-string "com.google.android.apps.photos"
 *      pm.getPackageInfo(<package>, ...)        // không thấy gói => ẩn nút Photos
 *      Intent(GET_CONTENT).setType("*&#47;*").addCategory(OPENABLE).putExtra(ALLOW_MULTIPLE) ...
 *    => Đây là lý do bản Morphe (đổi package) làm mất nút chọn ảnh Photos của Zalo.
 *
 * 2. FileSelectView.Q6
 *      uri.toString().contains("com.google.android.apps.photos.contentprovider")
 *    => Photos trả ảnh về dạng content://<authority>/... ; Zalo nhận ra authority để bóc URI thật.
 *
 * 3. Vài regex "content://.*com.google.android.apps.photos.contentprovider/.*"
 *    (nhiều class obfuscate khác nhau) dùng để nhận dạng URI do Photos trả về.
 *
 * Patch thay mọi chuỗi trên bằng package/authority của Photos bản Morphe.
 * Chuỗi "com.google.android.apps.photos" nằm ở thư viện đăng nhập Google (ngoài com.zing.zalo)
 * là so sánh package của chính Zalo, nên KHÔNG đụng tới.
 */
@Suppress("unused")
val zaloChangePhotosPickerPackagePatch = bytecodePatch(
    name = "Change Photos picker package (Zalo)",
    description = "Nút Google Photos trong trình chọn ảnh của Zalo sẽ mở Google Photos bản Morphe.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    val photosPackage by stringOption(
        key = "photosPackage",
        default = DEFAULT_MORPHE_PHOTOS_PACKAGE,
        title = "Package Photos (Morphe)",
        description = "Package name của Google Photos đã patch bằng Morphe trên máy bạn. " +
            "Authority của provider được suy ra là <package>.contentprovider.",
        required = true,
    )

    execute {
        val newPackage = photosPackage!!.trim()
        val newProvider = "$newPackage.contentprovider"

        fun replacement(classType: String, value: String): String? = when {
            // Regex / authority: "...com.google.android.apps.photos.contentprovider..." (mọi class).
            value.contains(GOOGLE_PHOTOS_PROVIDER) -> value.replace(GOOGLE_PHOTOS_PACKAGE, newPackage)
            // Tên package đứng riêng: chỉ trong code của Zalo.
            value == GOOGLE_PHOTOS_PACKAGE && classType.startsWith(ZALO_CLASS_PREFIX) -> newPackage
            else -> null
        }

        fun ClassDef.hasTarget() = methods.any { method ->
            method.implementation?.instructions?.any { instruction ->
                (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((instruction as ReferenceInstruction).reference as? StringReference)
                        ?.string?.let { replacement(type, it) } != null
            } == true
        }

        val targets = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.hasTarget()) targets += classDef
        }

        var packageReplaced = 0
        var quickPickerReplaced = 0
        var providerReplaced = 0

        targets.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val jumbo = instruction.opcode == Opcode.CONST_STRING_JUMBO
                    if (instruction.opcode != Opcode.CONST_STRING && !jumbo) return@forEachIndexed

                    val value = ((instruction as ReferenceInstruction).reference as? StringReference)
                        ?.string ?: return@forEachIndexed
                    val newValue = replacement(classDef.type, value) ?: return@forEachIndexed

                    val register = (instruction as OneRegisterInstruction).registerA
                    val opcodeName = if (jumbo) "const-string/jumbo" else "const-string"
                    method.replaceInstruction(index, "$opcodeName v$register, \"${newValue.smaliEscape()}\"")

                    if (value == GOOGLE_PHOTOS_PACKAGE) {
                        packageReplaced++
                        if (classDef.type == QUICK_PICKER_VIEW) quickPickerReplaced++
                    } else {
                        providerReplaced++
                    }
                }
            }
        }

        if (quickPickerReplaced == 0) {
            throw PatchException(
                "Không tìm thấy chuỗi \"$GOOGLE_PHOTOS_PACKAGE\" trong QuickPickerView " +
                    "(bản Zalo này có thể đã đổi cấu trúc).",
            )
        }
        if (providerReplaced == 0) {
            throw PatchException("Không tìm thấy chuỗi \"$GOOGLE_PHOTOS_PROVIDER\" trong Zalo.")
        }
        println("Zalo Photos patch: $packageReplaced package string(s), $providerReplaced provider string(s) -> $newPackage")
    }
}

/**
 * Zalo targetSdk 36 => package visibility. <queries> của Zalo chỉ có vài intent chung
 * (OPEN_DOCUMENT/OPENABLE ...), nên để chắc chắn Zalo thấy được Photos bản Morphe,
 * khai báo thêm <package> vào <queries>. Thiếu bước này getPackageInfo() có thể ném
 * NameNotFoundException và nút Photos vẫn bị ẩn.
 */
@Suppress("unused")
val zaloQueryPhotosPackagePatch = resourcePatch(
    name = "Allow Zalo to see Photos (Zalo)",
    description = "Thêm Google Photos bản Morphe vào <queries> của Zalo để Zalo nhìn thấy app này.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    val photosPackage by stringOption(
        key = "photosPackage",
        default = DEFAULT_MORPHE_PHOTOS_PACKAGE,
        title = "Package Photos (Morphe)",
        description = "Phải trùng với package đã nhập ở patch \"Change Photos picker package (Zalo)\".",
        required = true,
    )

    execute {
        val newPackage = photosPackage!!.trim()

        document("AndroidManifest.xml").use { doc ->
            val queries = doc.getElementsByTagName("queries").item(0)
                ?: doc.documentElement.appendChild(doc.createElement("queries"))

            val element = doc.createElement("package")
            element.setAttribute("android:name", newPackage)
            queries.appendChild(element)
        }
    }
}
