package lab.yamby.patches.license

import app.morphe.patcher.Fingerprint

/**
 * `rc/ۥۖۗ۬۠ۤۜ.<clinit>` — the settings singleton that owns the MMKV
 * `base_setting` store and the native licence-code getter/setter.
 *
 * The patch appends a call to the native setter (`m10563`) so a clean install
 * always has a non-empty licence string for the feature gates to read.
 */
internal object LicenseStoreClassInitFingerprint : Fingerprint(
    definingClass = "Lrc/ۥۖۗ۬۠ۤۜ;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `ub/ۥۚۥۘۧ۠ۨ.ۥۜۛ۫ۦۦ(C4835, String)Z` — the only HMAC equality helper
 * used by every Yamby Pro licence gate.
 */
internal object LicenseHmacEqualsFingerprint : Fingerprint(
    definingClass = "Lub/ۥۚۥۘۧ۠ۨ;",
    name = "ۥۜۛ۫ۦۦ",
    returnType = "Z",
    parameters = listOf("Lnj/ۥۗۚ۟ۧۡ;", "Ljava/lang/String;"),
)

/**
 * `fd/ۥۗۛۗ۬ۡ.<clinit>` — computes the list-animation Pro flag
 * (`f13536`) from the stored licence code and the `list_animation` preference.
 */
internal object ListAnimationProFlagClassInitFingerprint : Fingerprint(
    definingClass = "Lfd/ۥۗۛۗ۬ۡ;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `ec/ۥۢۙ۠۫ۨ.ۥۗۚ۟ۧۡ(Object, Object, Object)Object` — the settings-list
 * item that renders the `Pro` section and its `Yamby Pro` purchase entry.
 */
internal object SettingsProEntryFingerprint : Fingerprint(
    definingClass = "Lec/ۥۢۙ۠۫ۨ;",
    name = "ۥۗۚ۟ۧۡ",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
)