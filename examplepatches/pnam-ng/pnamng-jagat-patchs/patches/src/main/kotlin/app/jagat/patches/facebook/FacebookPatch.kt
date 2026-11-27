package app.jagat.patches.facebook

import app.jagat.patches.shared.Constants.COMPATIBILITY_JAGAT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch

private const val ORIGINAL_FACEBOOK_KEY_HASH = "0g1G+7XJeh/8Qc4sbi2h79rCm7E="

@Suppress("unused")
val jagatFacebookLoginPatch = patch(
    name = "Sửa lỗi đăng nhập Facebook (Fix Facebook Login)",
    description = "Khắc phục lỗi 'Invalid key hash' khi đăng nhập Facebook, tự động giả lập mã hash gốc của Jagat và chuyển hướng đăng nhập an toàn qua trình duyệt.",
    default = true
) {
    compatibleWith(COMPATIBILITY_JAGAT)

    execute {
        // 1. Hook CertificateUtil.getCertificateHash trả về đúng Key Hash gốc đã đăng ký trên Facebook Developer Console
        mutableClassDefByOrNull("Lcom/facebook/internal/security/CertificateUtil;")?.let { certClass ->
            certClass.methods.filter { it.name == "getCertificateHash" }.forEach { method ->
                method.addInstructions(
                    0,
                    """
                        const-string v0, "$ORIGINAL_FACEBOOK_KEY_HASH"
                        return-object v0
                    """
                )
            }
        }

        // 2. Hook KatanaProxyLoginMethodHandler.tryAuthorize để bỏ qua gọi ứng dụng Facebook gốc (tránh bị Katana từ chối do chữ ký app bị đổi)
        // Khi trả về 0, Facebook SDK sẽ tự động chuyển sang CustomTabLoginMethodHandler (đăng nhập qua Chrome/trình duyệt Web)
        mutableClassDefByOrNull("Lcom/facebook/login/KatanaProxyLoginMethodHandler;")?.let { katanaClass ->
            katanaClass.methods.filter { it.name == "tryAuthorize" }.forEach { method ->
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """
                )
            }
        }
    }
}
