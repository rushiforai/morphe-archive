package arpit.morphe.patches.cricfy.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Locates the app's ad manager class without depending on its R8-renamed name
 * (7.3: `Lm7;`, 7.4: `Lj7;` — a new short name in every build).
 *
 * The class is the only one that declares the sponsor gate
 * `(MainActivity, String, <callback>)V` (7.3: `g(MainActivity, String, i41)`,
 * 7.4: `g(MainActivity, String, p41)`). Only method signatures are read, so this
 * works before the invalid `array-data` payloads of the class are repaired.
 */
internal fun BytecodePatchContext.adsManagerClassType(): String {
    val candidates = mutableListOf<String>()

    classDefForEach { classDef ->
        val declaresGate = classDef.methods.any { method ->
            val parameters = method.parameterTypes.map(CharSequence::toString)
            method.returnType == "V" &&
                parameters.size == 3 &&
                parameters[0] == "Lcom/android/vending/activities/MainActivity;" &&
                parameters[1] == "Ljava/lang/String;" &&
                parameters[2].startsWith("L")
        }
        if (declaresGate) candidates += classDef.type
    }

    check(candidates.size == 1) {
        "Expected exactly one class declaring the sponsor gate method, found " +
            "${candidates.size}: $candidates."
    }

    return candidates.single()
}

/**
 * Locates the app's ad manager class through its constructor. In 7.3 the class is
 * `Lm7;`, in 7.4 `Lj7;` (R8 full mode short name, changes between app versions, so it
 * is never referenced directly).
 *
 * The constructor takes the `Application`, the `SharedPreferences` that stores the
 * downloaded ad configuration and the kotlinx.serialization JSON parser.
 *
 * Verified against `analysis/cricfy-tv-74/smali/classes/j7.smali` (same shape in 7.3's
 * `m7.smali`):
 * - `public constructor <init>(Landroid/app/Application;Landroid/content/SharedPreferences;Lti1;)V`
 *   at line 19 (`.registers 11`) — the R8-renamed parser class is declared as an
 *   obfuscated object type (`"L"`).
 * - Instruction order of the filters: `const-string "ass"` (line 81) then
 *   `Lcom/unity3d/ads/UnityAds;->initialize` (line 161) — the app's only call site.
 */
object AdsManagerClassFingerprint : Fingerprint(
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "Landroid/app/Application;",
        "Landroid/content/SharedPreferences;",
        "L",
    ),
    filters = listOf(
        // SharedPreferences key holding the Base64 encoded ad config.
        string("ass"),
        // Unity Ads bootstrap, gated on the downloaded config.
        methodCall(
            definingClass = "Lcom/unity3d/ads/UnityAds;",
            name = "initialize",
        ),
    ),
)

/**
 * Matches the only scheduler that loads a Unity full-screen ad:
 * `public final d(Landroid/app/Activity;)V` (7.4 line 2143, `.registers 30`) in the ad
 * manager class. It is called when the player screen, a channel or the floating
 * player opens.
 *
 * Verified instruction order of the filters (`j7.smali`): `const-string
 * "UmV3YXJkZWRfQW5kcm9pZA=="` (line 2993, Base64 of the `Rewarded_Android`
 * placement) then `UnityAds;->load(String, IUnityAdsLoadListener)` (line 3018).
 * Without `load` nothing can `show`.
 */
object UnityAdScheduleFingerprint : Fingerprint(
    classFingerprint = AdsManagerClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        // Base64 literal of the ad placement name.
        string("UmV3YXJkZWRfQW5kcm9pZA=="),
        methodCall(
            definingClass = "Lcom/unity3d/ads/UnityAds;",
            name = "load",
        ),
    ),
)

/**
 * Matches the single boolean that decides whether the sponsor banner is shown:
 * `public final b()Z` (7.4 line 1091, `.registers 4`) in the ad manager class — the
 * only `()Z` method of the class.
 *
 * Verified instruction order of the filters (`j7.smali`):
 * - line 1095: `iget-object v0, p0, Lj7;->d:Lp6;` — the config holder.
 * - line 1099: `iget-object v1, v0, Lp6;->c:Lwg3;` — the `SponsorBanner` config.
 * - line 1103: `iget-boolean v1, v1, Lwg3;->a:Z` — `SponsorBanner.enable`.
 * - line 1121: `const/4 v0, 0x4` — sponsor list index 4 (banner entry).
 * - line 1140: `iget-boolean p0, p0, Ltg3;->a:Z` — `Sponsor.enabled` of that entry.
 *
 * `Lwg3`/`Ltg3` are R8 short names and change every version, so the field accesses
 * are matched structurally (opcode only) inside the fingerprint-pinned class.
 */
object SponsorBannerFingerprint : Fingerprint(
    classFingerprint = AdsManagerClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        // Config holder.
        fieldAccess(opcode = Opcode.IGET_OBJECT),
        // SponsorBanner config object.
        fieldAccess(opcode = Opcode.IGET_OBJECT),
        // SponsorBanner.enable.
        fieldAccess(opcode = Opcode.IGET_BOOLEAN),
        // Sponsor list index 4 (banner entry).
        literal(4),
        // Sponsor.enabled of the banner entry.
        fieldAccess(opcode = Opcode.IGET_BOOLEAN),
    ),
)

/**
 * Matches the sponsor gate that runs before a channel is opened:
 * `public final g(Lcom/android/vending/activities/MainActivity;Ljava/lang/String;Lp41;)V`
 * (7.4 line 3414, `.registers 17`) in the ad manager class. The gate picks the first
 * enabled sponsor entry of indices 1..3: index 1 shows the locked channel dialog,
 * index 2 opens a countdown WebActivity and index 3 opens an in-app page or the
 * external browser (the reported browser-redirect ad).
 *
 * Verified instruction order of the filters (`j7.smali`):
 * - line 3603: `invoke-virtual {p0, p2, v7, v6}, Lj7;->f(Ljava/lang/String;II)Z` —
 *   the frequency gate, matched by signature so the R8 name is irrelevant.
 * - line 3654: `UnlockDilaogBinding;->inflate` — the locked channel dialog (typo in
 *   the databinding class name is the app's own and is stable).
 *
 * The `string/channel_locked` id used as a third filter in 7.3 moved from
 * `0x7f140078` to `0x7f140079` in 7.4, so it is not filtered on anymore; the dialog
 * inflation is only referenced by this method.
 */
object SponsorGateFingerprint : Fingerprint(
    classFingerprint = AdsManagerClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/android/vending/activities/MainActivity;",
        "Ljava/lang/String;",
        "L",
    ),
    filters = listOf(
        methodCall(
            definingClass = "this",
            parameters = listOf("Ljava/lang/String;", "I", "I"),
            returnType = "Z",
        ),
        methodCall(
            definingClass = "Lcom/cricfytv/sports/databinding/UnlockDilaogBinding;",
            name = "inflate",
        ),
    ),
)

/**
 * Matches `public final onCreate(Landroid/os/Bundle;)V` (7.4 line 4414, `.registers 31`)
 * of the main activity. The method contains the self-hosted full-screen ad
 * (`CustomAdFull` dialog) that is shown every `sponsors[0].adNumber` opens, as well
 * as the Telegram promo dialog (`w7`/`DialogTgJoinBinding`) that runs before it.
 *
 * Verified instruction order of the filters (`MainActivity.smali`):
 * - line 6342/6358: `"dialog_alert"` / `"start_alert"` — the promo dialog prefs.
 * - line 6710: `const-string "fullTries"` — the ad open-count preference read.
 * - line 6793: `CustomAdFullBinding;->inflate` — the ad dialog inflation.
 */
object CustomAdFullFingerprint : Fingerprint(
    // Suffix match, survives package/class renames.
    definingClass = "/activities/MainActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("dialog_alert"),
        string("start_alert"),
        string("fullTries"),
        methodCall(
            definingClass = "Lcom/cricfytv/sports/databinding/CustomAdFullBinding;",
            name = "inflate",
        ),
    ),
)
