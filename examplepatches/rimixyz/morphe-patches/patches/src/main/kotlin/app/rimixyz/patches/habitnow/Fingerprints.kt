package app.rimixyz.patches.habitnow

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

private const val BILLING_MANAGER = "Lnp;"
private const val PURCHASE_STATE = "Lbc2;"
private const val STATE_FLOW = "Lr02;"

/**
 * Getter direto da flag premium local. O corpo lê
 * `getSharedPreferences("com.habit.now.apps", 0).getBoolean("com.habitnow.premium", false)`.
 * É o árbitro usado por todas as telas e pelo calculador de cotas `h44.t`.
 */
internal object PremiumFlagFingerprint : Fingerprint(
    definingClass = "Lia1;",
    name = "W",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    isStatic = true,
    filters = listOf(
        string("com.habit.now.apps"),
        string("com.habitnow.premium"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean",
            returnType = "Z",
        ),
    ),
)

/**
 * Construtor do repositório de compras. O estado reativo começa como
 * `PURCHASED` ou `NOT_PURCHASED` conforme a mesma preferência booleana.
 * O último filtro é a chamada a `r02.<init>(Object)` que consome o enum;
 * é imediatamente antes dela que o enum é forçado para `PURCHASED`.
 */
internal object PremiumStateInitFingerprint : Fingerprint(
    definingClass = BILLING_MANAGER,
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lb40;", "Lne3;", "Ln4;", "Lac2;"),
    filters = listOf(
        string("com.habit.now.apps"),
        string("com.habitnow.premium"),
        fieldAccess(definingClass = PURCHASE_STATE, name = "c", type = PURCHASE_STATE),
        fieldAccess(definingClass = PURCHASE_STATE, name = "a", type = PURCHASE_STATE),
        methodCall(
            definingClass = STATE_FLOW,
            name = "<init>",
            parameters = listOf("Ljava/lang/Object;"),
        ),
    ),
)

/**
 * Callback de compras do Play Billing. O único ramo que revoga a flag local
 * ocorre quando o terceiro parâmetro (`z`) é `true`, a lista está vazia e o
 * resultado é OK. Esse parâmetro não é lido em nenhum outro ponto do método.
 */
internal object ForcedPremiumRevokeFingerprint : Fingerprint(
    definingClass = BILLING_MANAGER,
    name = "k",
    returnType = "V",
    parameters = listOf("Lrp;", "Ljava/util/List;", "Z"),
    filters = listOf(
        string("com.habitnow.biometrics.enabled"),
        methodCall(definingClass = "Lia1;", name = "W", returnType = "Z"),
        fieldAccess(definingClass = "Lyq;", name = "c", type = "Lyq;"),
    ),
)

private const val SIGNATURE_CHECK = "Lcom/pairip/SignatureCheck;"
private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * Verificação de assinatura chamada por `PairIP.Application.attachBaseContext`.
 * Com a re-assinatura necessária para sideload, ela lançaria
 * `SignatureTamperedException` e impediria a inicialização.
 */
internal object PairIpSignatureCheckFingerprint : Fingerprint(
    definingClass = SIGNATURE_CHECK,
    name = "verifyIntegrity",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    isStatic = true,
    filters = listOf(
        methodCall(definingClass = "Landroid/content/pm/PackageManager;", name = "getPackageInfo"),
        string("SHA-256"),
        string("Apk signature is invalid."),
    ),
)

/**
 * Ponto de entrada da checagem de licença do PairIP. É o mesmo formato já
 * neutralizado no patch do MyTherapy deste repositório.
 */
internal object PairIpLicenseCheckFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT,
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    isStatic = true,
    filters = listOf(
        string("LicenseClient"),
        methodCall(definingClass = LICENSE_CLIENT, name = "isIsolatedProcess"),
        methodCall(
            definingClass = "Lcom/pairip/licensecheck/LicenseClient\$ImmediateTaskExecutor;",
            name = "run",
        ),
    ),
)
