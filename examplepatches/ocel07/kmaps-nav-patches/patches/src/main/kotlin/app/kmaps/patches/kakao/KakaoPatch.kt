package app.kmaps.patches.kakao

import app.kmaps.patches.shared.Constants.COMPATIBILITY_KAKAO_MAP
import app.kmaps.patches.shared.Op
import app.kmaps.patches.shared.Site
import app.kmaps.patches.shared.applySites
import app.morphe.patcher.patch.bytecodeContext
import app.morphe.patcher.patch.patch

/*
 * KakaoMap (KNSDK car navigation): high-rate GNSS.
 * Class names are obfuscated and change per version, so every site is addressed by SourceFile ("src:Foo.kt")
 * and an anchor whose app-specific references are wildcards.
 *
 * The normal path is the Kakao Mobility Location SDK: it takes every gps fix (0 ms / 0 m request) into a Kalman
 * filter and hands KNSDK one estimate per 500 ms tick. The engine keeps that 2 Hz tick; the patch lets the filter
 * use all 10 Hz fixes and keeps the downstream "origin" (fresh measurement) rate at the stock ~1 Hz.
 *  K1  ValidCheckerVehicle: fixes closer than 100 ms to the previous one were rejected -> 40 ms (up to 25 Hz)
 *  K2  KNGPSData: isOrigin (estimatedTimeLag < 500 ms) at most once per 900 ms (extension UbxKakao.originGate)
 *  K3  KNNetworkLinkMatching: each matching result kept a reference to the previous one, so the whole chain of
 *      results lived for the entire drive (memory leak, independent of rate); the field is only read by
 *      equals/hashCode/toString -> don't store it
 */

private const val UK = "Lapp/kmaps/extension/kakao/UbxKakao;"

private val V5 = setOf("5.17.8")
private val V6 = setOf("6.32.0")

internal val KAKAO_SITES: List<Site> = listOf(
    // K1: 5.17.8 ValidCheckerVehicle compares against 100 ms twice (gps and fused branch)
    Site(
        cls = "src:ValidCheckerVehicle.kt", note = "K1 min fix spacing", desc = null, count = 2,
        anchor = listOf("const-wide/16 *, 0x64", "cmp-long *, *, *", "if-gez *, L"),
        ops = listOf(Op("R", 0, "const-wide/16 {A0}, 0x28")), labels = emptyMap(),
        optional = true, requiredIn = V5,
    ),
    // K1: 6.32 ValidChecker loads the 100 ms constant once and uses it for both branches
    Site(
        cls = "src:ValidChecker.kt", note = "K1 min fix spacing", desc = null, count = 1,
        anchor = listOf("const-wide/16 *, 0x64"),
        ops = listOf(Op("R", 0, "const-wide/16 {A0}, 0x28")), labels = emptyMap(),
        optional = true, requiredIn = V6,
    ),
    // K2: 5.17.8 sets isOrigin with "move vX, vTrue" before the goto
    Site(
        cls = "src:KNGPSData.kt", note = "K2 origin 1 Hz", desc = null, count = 1,
        anchor = listOf(
            "invoke-virtual {p1}, L*;->getEstimatedTimeLag()J",
            "move-result-wide *",
            "const-wide/16 *, 0x1f4",
            "cmp-long *, *, *",
            "if-gez *, L",
            "move *, *",
            "goto L",
        ),
        ops = listOf(Op("R", 5, "invoke-static {p1}, $UK->originGate(Landroid/location/Location;)Z\nmove-result {A5}")),
        labels = emptyMap(),
        optional = true, requiredIn = V5,
    ),
    // K2: 6.32 keeps "true" preset in the result register and jumps straight on; the false branch is "move vX, vFalse"
    Site(
        cls = "src:KNGPSData.kt", note = "K2 origin 1 Hz", desc = null, count = 1,
        anchor = listOf(
            "invoke-virtual {p1}, L*;->getEstimatedTimeLag()J",
            "move-result-wide *",
            "const-wide/16 *, 0x1f4",
            "cmp-long *, *, *",
            "if-gez *, L",
            "goto L",
            "move *, *",
        ),
        ops = listOf(Op("I", 5, "invoke-static {p1}, $UK->originGate(Landroid/location/Location;)Z\nmove-result {A6}")),
        labels = emptyMap(),
        optional = true, requiredIn = V6,
    ),
    // K3: 5.17.8 only - 6.32 no longer stores the previous result (fixed upstream)
    Site(
        cls = "src:KNNetworkLinkMatching.kt", note = "K3 result chain leak", desc = null, count = 1,
        anchor = listOf(
            "iput-object p5, p0, L*;->*:Ljava/util/List;",
            "iput-object p6, p0, L*;->*:L*;",
            "if-eqz p6, L",
        ),
        ops = listOf(Op("R", 1, "nop")), labels = emptyMap(),
        optional = true, requiredIn = V5,
    ),
)

@Suppress("unused")
val kakaoHighRateGnssPatch = patch(
    name = "KakaoMap high-rate GNSS",
    description = "Lets the location SDK use every GNSS fix (up to 25 Hz) while KNSDK keeps its 1 Hz origin rate, " +
        "and fixes a map-matching result chain that leaked memory for the whole drive.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KAKAO_MAP)
    extendWith("extensions/kakao.mpe")
    execute {
        bytecodeContext.applySites(KAKAO_SITES) { println("KakaoMap high-rate GNSS: $it") }
    }
}
