package app.timetree.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

internal const val PACKAGE_NAME = "works.jubilee.timetree"

private const val DOMAIN_ADS = "Lworks/jubilee/timetree/domain/ads/model/"

internal const val ADS_CONFIG_MODEL = "${DOMAIN_ADS}AdsConfigModel;"
internal const val ADS_AD_MODEL = "${DOMAIN_ADS}AdsAdModel;"
internal const val ADS_AD_EMPTY = "${DOMAIN_ADS}AdsAdModel\$Empty;"
internal const val ADS_REQUEST_PARAM = "${DOMAIN_ADS}timetree/AdsTimeTreeRequestParam;"
internal const val RX_OBSERVABLE = "Lio/reactivex/Observable;"

internal const val SPLASH_ADS_ACTIVITY = "Lworks/jubilee/timetree/app/ui/SplashAdsActivity;"

/** ACC_STATIC, spelled out so the patch does not depend on an AccessFlags helper API. */
internal const val ACC_STATIC = 0x8

/**
 * TimeTree builds every ad stream inside a synthetic `Function1` lambda that closes over
 * the placement request (`AdsTimeTreeRequestParam`), the ads API client and the downloaded
 * `AdsConfigModel`.
 *
 * The captured request param is the anchor: it is a non-obfuscated domain type that no other
 * `Function1` lambda holds as an instance field. Matching on it instead of on the obfuscated
 * lambda class name (`Lbo;` in 15.34.1, something else after the next R8 run) keeps the
 * patch working across releases.
 */
internal object AdsStreamFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = ADS_REQUEST_PARAM,
        ),
    ),
)

/**
 * Constructor of the server-driven ads config. Located by class name plus a structural
 * check ("this class has a pile of boolean fields"), never by parameter order, so a release
 * that adds or reorders a field still matches.
 */
internal object AdsConfigConstructorFingerprint : Fingerprint(
    definingClass = ADS_CONFIG_MODEL,
    name = "<init>",
    returnType = "V",
    custom = { _, classDef ->
        classDef.fields.count { it.type == "Z" && (it.accessFlags and ACC_STATIC) == 0 } >= 6
    },
)

/**
 * The gate method that decides whether the splash ad screen is shown at all: the only
 * no-argument `void` method of `SplashAdsActivity` that both reads and writes one of its
 * own boolean fields and reads one of its object fields.
 */
internal object SplashAdsGateFingerprint : Fingerprint(
    definingClass = SPLASH_ADS_ACTIVITY,
    isStatic = false,
    returnType = "V",
    parameters = listOf(),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions
        instructions != null &&
            instructions.any { it.opcode == Opcode.IGET_BOOLEAN } &&
            instructions.any { it.opcode == Opcode.IPUT_BOOLEAN } &&
            instructions.any { it.opcode == Opcode.IGET_OBJECT }
    },
)
