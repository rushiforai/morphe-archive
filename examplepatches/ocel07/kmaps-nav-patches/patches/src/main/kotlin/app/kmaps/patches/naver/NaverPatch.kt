package app.kmaps.patches.naver

import app.kmaps.patches.shared.Constants.COMPATIBILITY_NAVER_MAP
import app.kmaps.patches.shared.Op
import app.kmaps.patches.shared.Site
import app.kmaps.patches.shared.applySites
import app.morphe.patcher.patch.bytecodeContext
import app.morphe.patcher.patch.patch

/*
 * NAVER Map: GNSS fix rate up to 20 Hz for navigation.
 *  N1   location requests 1000 -> 125 ms (FusedLocationSource interval, SystemLocationSource minTime)
 *  N2   map matching per new fix through RateGate (extension) with time-weighted counters: NAVER_SITES
 *       (converted from the smali-text patch rate8v4, legacy/) + HAND_SITES below (code that moved or appeared in 6.11)
 */

private const val RG = "Lcom/naver/maps/navi/mapmatching/RateGate;"
private const val MRC = "Lcom/naver/maps/navi/mapmatching/internal/routeMatching/reroute/internal/MergeRoadChecker;"

internal val HAND_SITES: List<Site> = listOf(
    // N1: LocationRequest.setInterval(1000) in FusedLocationSource.<init>(Context) (method renamed by R8 per version)
    Site(
        cls = "Lcom/naver/map/core/common/location/FusedLocationSource;", note = "N1 setInterval", desc = "(Landroid/content/Context;)V", count = 1,
        anchor = listOf("const-wide/16 *, 0x3e8", "invoke-virtual {*}, Lcom/google/android/gms/location/LocationRequest;->*(J)Lcom/google/android/gms/location/LocationRequest;"),
        ops = listOf(Op("R", 0, "const-wide/16 {A0}, 0x7d")), labels = emptyMap(),
    ),
    // N1: LocationManager.requestLocationUpdates(provider, 1000, ...) in SystemLocationSource
    Site(
        cls = "Lcom/naver/map/core/common/location/SystemLocationSource;", note = "N1 minTime", desc = null, count = 1,
        anchor = listOf("const-wide/16 *, 0x3e8", "invoke-virtual/range {*}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V"),
        ops = listOf(Op("R", 0, "const-wide/16 {A0}, 0x7d")), labels = emptyMap(),
    ),
    // guide-B3: driving track (NaviStore <list>.add) at 1 Hz; the method holding it changed between versions and
    // the field is renamed by R8 (e1 in 6.11, g1 in 6.12)
    Site(
        cls = "Lcom/naver/map/core/navigation/NaviStore;", note = "B3 track", desc = null, count = 1,
        anchor = listOf(
            "if-eqz *, L",
            "iget-object *, *, Lcom/naver/map/core/navigation/NaviStore;->*:Ljava/util/List;",
            "invoke-virtual {*}, Lcom/naver/maps/navi/v2/shared/api/model/GuidePoint;->getLocation()Lcom/naver/maps/geometry/LatLng;",
            "move-result-object *",
            "invoke-interface {*}, Ljava/util/List;->add(Ljava/lang/Object;)Z",
        ),
        ops = listOf(Op("I", 1, "invoke-static {}, $RG->gateTrack()Z\nmove-result {A1}\nif-eqz {A1}, :rg_track")),
        labels = mapOf("rg_track" to ("T" to "0")),
    ),
    // MergeRoadChecker (new in 6.11): adjacent merge-road tracking, released after 2 misses / 5 skipped runs
    Site(
        cls = MRC, note = "M9 merge miss", desc = null, count = 1, optional = true, requiredIn = setOf("6.11.2.2"),
        anchor = listOf("add-int/lit8 v0, v0, 0x1", "iput v0, p0, $MRC->b:I", "const/4 v1, 0x2"),   // if-lt v0, v1 follows a const-string
        ops = listOf(Op("R", 0, "invoke-static {v0}, $RG->inc(I)I\nmove-result v0"), Op("R", 2, "const/16 v1, 0x7d0")),
        labels = emptyMap(),
    ),
    Site(
        cls = MRC, note = "M9 merge skip", desc = null, count = 1, optional = true, requiredIn = setOf("6.11.2.2"),
        anchor = listOf("add-int/lit8 v0, v0, 0x1", "iput v0, p0, $MRC->c:I", "const/4 v1, 0x5", "if-lt v0, v1, L"),
        ops = listOf(Op("R", 0, "invoke-static {v0}, $RG->inc(I)I\nmove-result v0"), Op("R", 2, "const/16 v1, 0x1388")),
        labels = emptyMap(),
    ),
)

@Suppress("unused")
val naverHighRateGnssPatch = patch(
    name = "NAVER Map high-rate GNSS",
    description = "Runs map matching on every new GNSS fix (max 20 Hz) with time-weighted counters " +
        "and requests location updates every 125 ms.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NAVER_MAP)
    extendWith("extensions/naver.mpe")
    execute {
        bytecodeContext.applySites(NAVER_SITES + HAND_SITES) { println("NAVER high-rate GNSS: $it") }
    }
}
