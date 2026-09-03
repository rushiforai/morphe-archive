package printershare

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object PremiumValidationMethodFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Lcom/dynamixsoftware/printershare/x;"),
    filters = listOf(
        string("prm2_checked"),
        string("ru.vk.store")
    )
)