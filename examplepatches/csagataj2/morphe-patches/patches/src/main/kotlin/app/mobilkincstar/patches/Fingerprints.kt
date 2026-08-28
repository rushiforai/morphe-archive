package app.mobilkincstar.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

object BiometricUtilsFingerprint : Fingerprint(
    definingClass = "Lcom/sbaiahmed1/reactnativebiometrics/BiometricUtils;",
    name = "isDeviceRooted",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;")
)

object SSLPinningFingerprint : Fingerprint(
    definingClass = "Lokhttp3/CertificatePinner;",
    name = "check",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;")
)

object KeyboardDetectionFingerprint : Fingerprint(
    definingClass = "Lcom/learnium/RNDeviceInfo/RNDeviceModule;",
    name = "hasKeyboard",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;")
)

object TamperReporterFingerprint : Fingerprint(
    definingClass = "Ligknimiyn/k;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

object TamperThreadStarterFingerprint : Fingerprint(
    definingClass = "Ligknimiyn/k;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf()
)

object IntegrityStatusFingerprint : Fingerprint(
    definingClass = "Ligknimiyn/ac;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.NATIVE),
    returnType = "Z",
    parameters = listOf()
)

object ProtectorInitFingerprint : Fingerprint(
    definingClass = "Ligknimiyn/ac;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNCHRONIZED),
    returnType = "V",
    parameters = listOf()
)

object ProtectorInitInternalFingerprint : Fingerprint(
    definingClass = "Ligknimiyn/ac;",
    name = "d",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.SYNCHRONIZED),
    returnType = "V",
    parameters = listOf("Ligknimiyn/O;")
)

object ProtectorBaseOnCreateFingerprint : Fingerprint(
    definingClass = "Ligknimiyn/O;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.NATIVE),
    returnType = "V",
    parameters = listOf()
)

object MainApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/mobilkincstar/MainApplication;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf()
)

object ReactModalScreenshotFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/views/modal/d;",
    name = "c",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/app/Activity;")
)

object ProtectorService1Fingerprint : Fingerprint(
    definingClass = "Ligknimiyn/o;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf()
)

object ProtectorService2Fingerprint : Fingerprint(
    definingClass = "Ligknimiyn/n;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf()
)

object ProtectorService3Fingerprint : Fingerprint(
    definingClass = "Ligknimiyn/B;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf()
)

object ProtectorLifecycleFingerprint : Fingerprint(
    definingClass = "Ligknimiyn/C1571g;",
    name = "onActivityResumed",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.NATIVE),
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;")
)
