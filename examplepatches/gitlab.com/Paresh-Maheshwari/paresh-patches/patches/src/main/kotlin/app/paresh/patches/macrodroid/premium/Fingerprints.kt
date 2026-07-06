package app.paresh.patches.macrodroid.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object PremiumStatusFingerprint : Fingerprint(
    returnType = "Lcom/arlosoft/macrodroid/confirmation/a;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Landroidx/lifecycle/LiveData;", name = "getValue"),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Lcom/arlosoft/macrodroid/confirmation/a\$c;", name = "a"),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Lcom/arlosoft/macrodroid/confirmation/a\$b;", name = "a")
    )
)

object ValidatePurchaseFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    parameters = listOf(),
    strings = listOf("Validate purchases is enabled with frequency: ")
)

// Main signature check — public static in com.arlosoft.macrodroid.a
object SignatureCheckFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/content/pm/PackageManager;", name = "getPackageInfo"),
        methodCall(definingClass = "Landroid/content/pm/Signature;", name = "toCharsString")
    )
)

// Template store signature check — l5.t.w(Context)
object TemplateStoreSignatureCheckFingerprint : Fingerprint(
    definingClass = "Ll5/t;",
    name = "w",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;")
)

// Signature hash for API auth — r1.a(Context)
object SignatureHashFingerprint : Fingerprint(
    definingClass = "Lcom/arlosoft/macrodroid/utils/r1;",
    name = "a",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;")
)

object ShowUpgradeScreenFingerprint : Fingerprint(
    definingClass = "Lcom/arlosoft/macrodroid/upgrade/UpgradeActivity2\$a;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;")
)
