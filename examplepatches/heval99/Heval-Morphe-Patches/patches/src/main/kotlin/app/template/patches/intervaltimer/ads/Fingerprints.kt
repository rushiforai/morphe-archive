package app.template.patches.intervaltimer.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

// Interval Timer caches its ad-free state in two R8-renamed JSON models (AppInstallation and
// User). Both serialize the server's "config_ads" (adbuster) flag; AppInstallation also keeps the
// rewarded-ad window ("local_ads_time", "local_ads_off"). The JSON annotation type is renamed too,
// so only the annotations' string values are compared.
private val AD_STATE_FIELDS = setOf("config_ads", "local_ads_time", "local_ads_off")

private fun ClassDef.jsonFieldNames(): Set<String> =
    fields.flatMap { field ->
        field.annotations.flatMap { annotation ->
            annotation.elements.mapNotNull { (it.value as? StringEncodedValue)?.value }
        }
    }.toSet()

// The ad-state getter: an instance ()I method that returns 3 (ad-free) or 1 (ads); the
// AppInstallation getter also returns 2 (rewarded window active), the User getter 0 (unknown)
// and, since 2.3.31, no 2. Every ad placement and the "Remove ads" toolbar item read it.
internal open class AdStateFingerprint(
    requiredFields: Set<String>,
    literals: List<Int>,
) : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    filters = literals.map { literal(it) },
    custom = { method, classDef ->
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
            classDef.jsonFieldNames().containsAll(requiredFields)
    },
)

// AppInstallation (keyed by "device"): the per-install copy, synced from GET me/device/{sid}/config.
internal object InstallationAdStateFingerprint :
    AdStateFingerprint(AD_STATE_FIELDS + "device", listOf(3, 2, 1))

// User (keyed by "token"): the signed-in account's copy, synced from GET me/config. The app asks
// it first and falls back to the installation unless it answers 3 (or 2). Since 2.3.31 User no
// longer carries the rewarded-ad window fields ("local_ads_time", "local_ads_off") and its getter
// has no "2" branch (3 ad-free, 1 ads, 0 unknown), so it is keyed by "config_ads" + "token".
internal object UserAdStateFingerprint :
    AdStateFingerprint(setOf("config_ads", "token"), listOf(3, 1))
