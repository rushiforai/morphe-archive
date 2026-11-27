package app.jagat.patches.maps

import app.jagat.patches.shared.Constants.COMPATIBILITY_JAGAT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch

private const val ORIGINAL_MAPS_SHA1 = "D20D46FBB5C97A1FFC41CE2C6E2DA1EFDAC29BB1"

@Suppress("unused")
val jagatGoogleMapsPatch = patch(
    name = "Sửa lỗi bản đồ trắng (Fix Blank Maps)",
    description = "Khắc phục triệt để lỗi không tải được bản đồ (nền bản đồ trắng tinh) do lệch chữ ký ứng dụng trên thiết bị chưa root. Tự động giả lập chứng chỉ phát hành gốc của Jagat cho Google Maps SDK.",
    default = true
) {
    compatibleWith(COMPATIBILITY_JAGAT)

    execute {
        // 1. Hook BaseApplication.attachBaseContext để kích hoạt GoogleMapsHook ngay từ khi tiến trình khởi chạy
        mutableClassDefByOrNull("Lio/utown/core/base/BaseApplication;")?.let { appClass ->
            appClass.methods.filter { it.name == "attachBaseContext" }.forEach { method ->
                method.addInstructions(
                    0,
                    """
                        invoke-static {p1}, Lapp/jagat/extension/GoogleMapsHook;->init(Landroid/content/Context;)V
                    """
                )
            }
        }

        // 2. Hook BaseUTApp.onCreate làm điểm tựa dự phòng đảm bảo Context luôn được khởi tạo
        mutableClassDefByOrNull("Lio/utown/base/BaseUTApp;")?.let { utAppClass ->
            utAppClass.methods.filter { it.name == "onCreate" }.forEach { method ->
                method.addInstructions(
                    0,
                    """
                        invoke-static {p0}, Lapp/jagat/extension/GoogleMapsHook;->init(Landroid/content/Context;)V
                    """
                )
            }
        }

        // 3. Hook AndroidUtilsLight.getPackageCertificateHashBytes trả về SHA-1 hash gốc của Jagat (20 bytes)
        mutableClassDefByOrNull("Lcom/google/android/gms/common/util/AndroidUtilsLight;")?.let { utilsClass ->
            utilsClass.methods.filter { it.name == "getPackageCertificateHashBytes" }.forEach { method ->
                method.addInstructions(
                    0,
                    """
                        invoke-static {p0, p1}, Lapp/jagat/extension/GoogleMapsHook;->hookPackageCertificateHashBytes(Landroid/content/Context;Ljava/lang/String;)[B
                        move-result-object v0
                        return-object v0
                    """
                )
            }
        }

        // 4. Hook Google Places CredentialsHelper (zzlk.zza) trả về SHA-1 fingerprint hex gốc
        mutableClassDefByOrNull("Lcom/google/android/libraries/places/internal/zzlk;")?.let { zzlkClass ->
            zzlkClass.methods.filter { it.name == "zza" && it.returnType == "Ljava/lang/String;" }.forEach { method ->
                method.addInstructions(
                    0,
                    """
                        const-string v0, "$ORIGINAL_MAPS_SHA1"
                        return-object v0
                    """
                )
            }
        }

        // 5. Hook PackageManagerWrapper.getPackageInfo để đảm bảo kết quả PackageInfo luôn mang chứng chỉ gốc
        mutableClassDefByOrNull("Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;")?.let { wrapperClass ->
            wrapperClass.methods.filter { it.name == "getPackageInfo" }.forEach { method ->
                method.addInstructions(
                    0,
                    """
                        iget-object v0, p0, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->zza:Landroid/content/Context;
                        invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
                        move-result-object v0
                        invoke-virtual {v0, p1, p2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
                        move-result-object v0
                        invoke-static {v0, p1, p2}, Lapp/jagat/extension/GoogleMapsHook;->hookPackageInfo(Landroid/content/pm/PackageInfo;Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
                        move-result-object v0
                        return-object v0
                    """
                )
            }
        }
    }
}
