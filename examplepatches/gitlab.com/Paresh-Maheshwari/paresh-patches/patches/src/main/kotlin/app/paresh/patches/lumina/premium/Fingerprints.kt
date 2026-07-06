package app.paresh.patches.lumina.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object LifetimePremiumCheckFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "Landroid/content/SharedPreferences;"),
        string("lifetime"),
        methodCall(definingClass = "Landroid/content/SharedPreferences;", name = "getBoolean"),
        methodCall(definingClass = "Lcom/lumina/wallpapers/data/models/User;", name = "isUpgraded"),
        methodCall(definingClass = "Lcom/lumina/wallpapers/data/models/User;", name = "getUserId"),
    )
)

object WallpaperIsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/lumina/wallpapers/data/models/Wallpaper;",
    name = "isPremium",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)

object CategoryIsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/lumina/wallpapers/data/models/Category;",
    name = "isPremium",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)

// PairIP license check — processResponse callback
object PairipProcessResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse",
    returnType = "V",
)

// PairIP signature validation
object PairipValidateResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/ResponseValidator;",
    name = "validateResponse",
    returnType = "V",
)
