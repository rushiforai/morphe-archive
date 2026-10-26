package app.ytvr.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.ytvr.patches.shared.callsMethodOn
import app.ytvr.patches.shared.holdsStringLiteral

/**
 * Matches the method that turns the ad placements of a player response
 * into a list of ad breaks to schedule. Returning an empty list here
 * prevents preroll, midroll, postroll and pause ads from ever being scheduled.
 *
 * The class and method names are obfuscated and expected to change between app
 * versions, so the anchor is the shape instead: a `List`-returning method that
 * schedules its work with a `PriorityQueue`. `java.util.PriorityQueue` is a
 * framework type, so R8 cannot rename it.
 *
 * Measured over the stock 1.88.10 dex (5 dex files, 27,722 classes): ten methods
 * app-wide call `PriorityQueue(int, Comparator)`, and exactly one of those
 * returns `List` -- this one. The previous version of this fingerprint read the
 * placements through `oqi.F()`, an obfuscated name; `List` + `oqi.F()` alone
 * still matches three methods (`mqx.r`, `muk.a`, `rge.N`), so the framework
 * constructor is what carries the discrimination.
 */
object AdBreakRendererFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    filters = listOf(
        methodCall(smali = "Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V"),
    ),
)

/**
 * Matches the method that performs the network request for an ad break
 * ("player/ad_break"). Returning null here prevents ad break responses
 * from ever being fetched.
 *
 * The anchor is the distinctive log template alone. Measured: it occurs in
 * exactly one method of the app, and the `Lonm;` return type this fingerprint
 * used to name is obfuscated. The custom filter keeps the one property the
 * injected `return-object` depends on -- that the method returns a reference --
 * without naming the obfuscated type, so a future version that moved the string
 * into a primitive-returning helper fails to match instead of assembling
 * invalid bytecode.
 */
object AdBreakRequestFingerprint : Fingerprint(
    strings = listOf("Exception when trying to request AdBreakResponseModel: %s"),
    custom = { method, _ ->
        // A reference return type: `L…;` or an array (`[`), both of which `return-object` accepts.
        method.returnType.first().let { it == 'L' || it == '[' }
    },
)

/**
 * Matches the helper that reports whether a player response carries a
 * PlayerBytes ad slot: a pre-rendered ad layout embedded directly in the
 * response, used for the pre-roll played on the first playback after fresh
 * app data. Returning false here prevents that slot from ever being
 * bootstrapped, scheduled or fulfilled.
 *
 * Three independent facts, none of them an app name:
 *   - `Z` with exactly one reference parameter (the player response);
 *   - the class holds the `AdCpn is null or empty for CISA scheduling` literal,
 *     which is the diagnostic the ad-slot scheduler it belongs to logs;
 *   - the body asks an `Optional` whether it `isPresent()` -- the slot lookup.
 *
 * Measured over 1.88.10: the shape alone (`Z`, one reference parameter, an
 * `isPresent()` call) matches twelve methods, and the class fact alone still
 * leaves the class's two sibling `Z(...)` detectors; all three together match
 * exactly one, this one.
 */
object PlayerBytesSlotFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        method.parameterTypes.size == 1 &&
            method.parameterTypes[0].toString().startsWith("L") &&
            classDef.holdsStringLiteral("AdCpn is null or empty for CISA scheduling") &&
            method.callsMethodOn("Lj$/util/Optional;", "isPresent")
    },
)

/**
 * Matches the observer that bootstraps the pre-rendered PlayerBytes ad layout
 * embedded in a player response: it extracts the layout proto, builds a
 * playable ad layout and caches it for the pre-roll played on the first
 * playback after fresh app data. Returning early here prevents the layout
 * from ever being built or cached, regardless of which code path consults it.
 *
 * The anchor mirrors the upstream Android "Hide video ads" patch, which
 * neutralizes the equivalent loader by its distinctive log string. Measured:
 * the string occurs in exactly one method of the app, and it is not the
 * near-identical message without the `PlayerAds count: ` suffix that sits in
 * the same class.
 */
object PlayerBytesAdLayoutFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf(
        "Bootstrapped layout construction resulted in non PlayerBytesLayout. PlayerAds count: ",
    ),
)

/**
 * Matches the callback the native SABR player uses to hand the app its ad cue-point list -- the
 * server's statement of where the ad breaks are. The class and method are **not obfuscated** (they
 * are part of the media interfaces package), which is why this anchor is a name and not a shape.
 *
 * This is the one client-side ad path the other four hooks in [app.ytvr.patches.ads.hideAdsPatch]
 * leave alone, and the one the removed "Hide stitched ads (SSAI)" patch used to cover. Its own note
 * measured that dropping the list does not remove a *server-stitched* ad, but that measurement was
 * taken with the streaming spoof working, where ads are absent anyway; on the fallback path -- the
 * one measured on 2026-10-13 to fetch a doubleclick creative and play the pre-roll -- it has never
 * been tested. Hooked so it reports itself either way.
 */
object CuePointListFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/libraries/youtube/media/interfaces/" +
        "CuePointDataProviderWrapper\$NativeCallback;",
    name = "onCuepointList",
    parameters = listOf("[B"),
    returnType = "V",
)

/**
 * The two accessors that hand the ad-slot list of a player response to every other reader.
 *
 * Found by cross-referencing the field `Lzjp;->n:Lwxq;` over the stock 1.88.10 dex: five sites read
 * it, and only these two were left uncovered by the four hooks in [app.ytvr.patches.ads.hideAdsPatch]
 * (`mkz.a` is neutered as the layout bootstrap, `oqm.K` has no callers at all -- and `mqx.r`, the
 * ad-break list builder, is *not* hooked: it is one of the readers this pair now covers). `d` is the
 * one every other reader calls -- the neutered `mkz.a` and the unhooked `mqx.r` three times each --
 * and `c` is its single-type shorthand.
 *
 * Measured 2026-10-13 on the forced-fallback build: with all four of those hooks neutered and the
 * Louvre VR180 video playing, the app still fetched a doubleclick impression and a `pagead/adview`
 * creative, and the two accessors were reached four times around it. That is what makes them the
 * delivery path rather than the consumers above them.
 *
 * The class and method names are obfuscated and expected to change between versions, so both
 * fingerprints pin the *whole shape* -- static, the response (plus, for `d`, the slot-type list), and
 * a reference return -- and a rename fails the patch loudly at patch time instead of hooking a wrong
 * method silently. The injected `check-cast` reads its type from the method's own return type, so no
 * obfuscated name is written into the bytecode.
 */
object AdSlotAccessorFingerprint : Fingerprint(
    custom = { method, _ ->
        val params = method.parameterTypes.map { it.toString() }
        val is18810 = method.definingClass == "Lmgn;" &&
            method.name == "c" &&
            params == listOf("Lzjp;") &&
            method.returnType == "Lvmo;"
        val is18909 = method.definingClass == "Lmht;" &&
            method.name == "k" &&
            params == listOf("Lzmj;") &&
            method.returnType == "Lvpr;"
        is18810 || is18909
    },
)

object AdSlotTypedAccessorFingerprint : Fingerprint(
    custom = { method, _ ->
        val params = method.parameterTypes.map { it.toString() }
        val is18810 = method.definingClass == "Lmgn;" &&
            method.name == "d" &&
            params == listOf("Lzjp;", "Ljava/util/List;") &&
            method.returnType == "Lvmo;"
        val is18909 = method.definingClass == "Lmht;" &&
            method.name == "l" &&
            params == listOf("Lzmj;", "Ljava/util/List;") &&
            method.returnType == "Lvpr;"
        is18810 || is18909
    },
)
