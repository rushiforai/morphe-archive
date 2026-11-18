package org.ungoogled.ui;

import static org.junit.Assert.*;

import android.os.Bundle;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import nl.johninnl.navigation.alerts.IndicatorContract;
import nl.johninnl.navigation.alerts.WarningCodec;
import nl.johninnl.navigation.alerts.WarningEvent;
import nl.johninnl.navigation.alerts.WarningView;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk = 33, manifest = Config.NONE)
public class WarningPinsTest {
    static final String SESSION = "12345678-1234-1234-1234-123456789abc";
    static final long T = 100_000;

    /** A provider warning observed at [at]; [position] null for none; [fixed] native_point_target. */
    static Bundle warning(String id, long sequence, long at, double[] position, Long positionAt, boolean fixed, boolean estimated) {
        Bundle b = new Bundle();
        b.putInt("protocol_version", 1); b.putString("provider_session", SESSION); b.putString("warning_id", id);
        b.putLong("sequence", sequence); b.putLong("revision", sequence); b.putLong("announcement_index", 0);
        b.putString("operation", "UPSERT"); b.putString("phase", "approach"); b.putInt("priority", 1);
        b.putString("native_type", "SPEED_CAM"); b.putString("category", "speed_camera"); b.putString("relevance", "point_ahead");
        b.putString("relationship", "unknown"); b.putString("message", "Speed camera"); b.putString("language_tag", "en");
        b.putString("message_origin", "native_text");
        b.putLong("observed_elapsed_ms", at); b.putLong("issued_elapsed_ms", at); b.putLong("state_until_elapsed_ms", at + 30_000);
        if (position != null) {
            b.putDouble("latitude", position[0]); b.putDouble("longitude", position[1]);
            b.putLong("position_observed_elapsed_ms", positionAt); b.putBoolean("position_estimated", estimated);
        }
        if (fixed) b.putBoolean("native_point_target", true);
        return b;
    }

    static WarningEvent event(Bundle b) { return WarningCodec.decode(b, b.getLong("issued_elapsed_ms")); }

    static final double[] HERE = {51.485487, 5.416153};
    @Test public void nativeTileFeatureHasAMapPinWithoutBecomingAWarningPill() {
        Bundle b=warning("waze/tile/7/11/72",1,T,HERE,T,true,false);
        b.putString("native_type","CAMERA");b.putString("category","display_only");
        b.putString("native_namespace","waze.insights.native_tile");b.putInt("native_tile_kind",72);
        b.putString("position_clock_origin","native_tile");
        WarningView view=new WarningView();view.events(List.of(event(b)));
        assertTrue(view.carEvents(T,e->true).isEmpty());
        List<WarningEvent> features=view.mapFeatures(T,e->true);
        assertEquals(1,WarningPins.select(features,T,false).size());
        List<WarningPins.Pin> pins=WarningPins.select(features,T,false);
        assertTrue(pins.get(0).mapFeature);
        assertEquals(1,WarningPins.mapPlaces(pins,true).size());
        assertTrue(WarningPins.incidentPins(pins).isEmpty());
        assertTrue(view.mapFeatures(T,e->false).isEmpty());
        assertTrue(view.mapFeatures(T+30000,e->true).isEmpty());
    }
    @Test public void staticMapFeaturesAndRoadWarningsUseDifferentGuidanceLayers() {
        WarningPins.Pin warning=new WarningPins.Pin("warning","speed_camera",52,5,"Camera");
        WarningPins.Pin feature=new WarningPins.Pin("feature","speed_camera",52.1,5.1,"Camera",true);
        List<WarningPins.Pin> mixed=List.of(warning,feature);
        assertEquals(List.of(warning),WarningPins.incidentPins(mixed));
        assertEquals(List.of(feature),WarningPins.mapPlaces(mixed,true));
        assertEquals(mixed,WarningPins.mapPlaces(mixed,false));
    }

    @Test public void nativeRangeUsesTheCorrelatedSegmentPhaseWithoutChangingTheAlertsPhase() {
        Bundle b=warning("waze/alert",1,T,HERE,T,true,false);
        b.putString("native_type","CAMERA");b.putString("phase","notice");b.putString("relevance","zone");
        b.putString("zone_point","start");b.putString("position_clock_origin","native_route_line");
        b.putBoolean("native_segment_correlated",true);b.putString("native_segment_type","AVERAGE_SPEED_CAMERA");
        b.putString("native_segment_phase","APPROACHING");
        assertEquals(1,WarningPins.select(List.of(event(b)),T,false).size());assertEquals("notice",b.getString("phase"));
        b.putString("native_zone_state","InZone");assertTrue(WarningPins.select(List.of(event(b)),T,false).isEmpty());
    }

    @Test public void fixedNativePointPersistsUntilStateExpires() {
        WarningEvent fixed = event(warning("cam", 1, T, HERE, T, true, false));
        assertEquals(1, WarningPins.select(List.of(fixed), T + 20_000, false).size());
        assertEquals(1, WarningPins.select(List.of(fixed), T + 29_999, false).size());
        assertTrue("state_until ends the pin", WarningPins.select(List.of(fixed), T + 30_000, false).isEmpty());
    }

    @Test public void otherPointsNeedAFreshPositionObservation() {
        WarningEvent waze = event(warning("police", 1, T, HERE, T - 1000, false, false));
        assertEquals(1, WarningPins.select(List.of(waze), T + 4000, false).size());
        assertTrue("older than 5 s: no pin, though the warning is still valid", WarningPins.select(List.of(waze), T + 4001, false).isEmpty());
        assertTrue(waze.stateValid(T + 4001));
    }

    @Test public void onlyANativeCoordinatePairBecomesAPin() {
        assertTrue("no position", WarningPins.select(List.of(event(warning("a", 1, T, null, null, true, false))), T, false).isEmpty());
        assertTrue("0,0 is a default, not a place", WarningPins.select(List.of(event(warning("b", 1, T, new double[]{0, 0}, T, true, false))), T, false).isEmpty());
        assertTrue("estimated position", WarningPins.select(List.of(event(warning("c", 1, T, HERE, T, true, true))), T, false).isEmpty());
        WarningPins.Pin pin = WarningPins.select(List.of(event(warning("d", 1, T, HERE, T, true, false))), T, false).get(0);
        assertEquals(HERE[0], pin.lat, 0); assertEquals(HERE[1], pin.lng, 0);
    }

    @Test public void pinsFollowThePillSelectionThroughClear() {
        WarningView view = new WarningView();
        view.events(List.of(event(warning("cam", 1, T, HERE, T, true, false))));
        assertEquals(1, WarningPins.select(view.carEvents(T + 10, e -> true), T + 10, false).size());
        Bundle clear = new Bundle();
        clear.putInt("protocol_version", 1); clear.putString("provider_session", SESSION); clear.putString("warning_id", "cam");
        clear.putLong("sequence", 2); clear.putLong("revision", 2); clear.putLong("announcement_index", 0);
        clear.putString("operation", "CLEAR"); clear.putLong("observed_elapsed_ms", T + 20); clear.putLong("issued_elapsed_ms", T + 20);
        view.events(List.of(WarningCodec.decode(clear, T + 20)));
        assertTrue(WarningPins.select(view.carEvents(T + 30, e -> true), T + 30, false).isEmpty());
        // A warning the pill filter withholds (category off, passed, off route) gets no pin either.
        view.events(List.of(event(warning("cam2", 3, T + 40, HERE, T + 40, true, false))));
        assertTrue(WarningPins.select(view.carEvents(T + 50, e -> false), T + 50, false).isEmpty());
    }

    static final double[] START = {52.3017, 4.9630}, END = {52.1213, 5.0228};

    /** An average-speed control with its provider's own fixed start ([inside] false) or end point. */
    static Bundle zone(String id, long sequence, long at, double[] position, String zonePoint, boolean inside) {
        Bundle b = warning(id, sequence, at, position, at, true, false);
        b.putString("native_type", "AVG_SPEED_CHECK"); b.putString("category", "speed_control"); b.putString("relevance", "zone");
        b.putString("message", "Trajectcontrole"); b.putString("phase", inside ? "enter" : "approach");
        if (zonePoint != null) b.putString("zone_point", zonePoint);
        b.putInt("distance_m", inside ? 14000 : 800); b.putLong("distance_observed_elapsed_ms", at); b.putBoolean("distance_estimated", false);
        b.putString("native_distance_kind", inside ? "remaining_in_segment" : "to_segment");
        return b;
    }

    @Test public void averageSpeedControlIsPinnedAtItsStartBeforeEntryAndAtItsEndInside() {
        WarningPins.Pin start = WarningPins.select(List.of(event(zone("AvgSpeedCheck:a2", 1, T, START, "start", false))), T, true).get(0);
        assertEquals("average_speed", start.icon); assertEquals("Trajectcontrole", start.title);
        assertEquals(START[0], start.lat, 0); assertEquals(START[1], start.lng, 0);
        assertEquals("SPEED_CAMERA_ZONE", IncidentPins.type(start.icon));
        WarningPins.Pin end = WarningPins.select(List.of(event(zone("AvgSpeedCheck:a2", 2, T + 60_000, END, "end", true))), T + 60_000, true).get(0);
        assertEquals(END[0], end.lat, 0); assertEquals(END[1], end.lng, 0);
        assertEquals("one warning, one pin that moves from start to end", start.key, end.key);
        assertFalse("a moved pin is drawn again", IncidentPins.same(end, start));
        assertEquals("a fixed native point, kept until the state ends", 1,
            WarningPins.select(List.of(event(zone("AvgSpeedCheck:a2", 2, T, END, "end", true))), T + 29_999, false).size());
    }

    @Test public void zoneCoordinatesOutsideTheirOwnPhaseOrUnmarkedGetNoPin() {
        assertTrue("an entry point while inside", WarningPins.select(List.of(event(zone("z", 1, T, START, "start", true))), T, false).isEmpty());
        assertTrue("an end point before entry", WarningPins.select(List.of(event(zone("z", 1, T, END, "end", false))), T, false).isEmpty());
        assertTrue("no zone_point", WarningPins.select(List.of(event(zone("z", 1, T, START, null, false))), T, false).isEmpty());
        Bundle exit = zone("z", 1, T, END, "end", true); exit.putString("phase", "exit");
        assertTrue("exit", WarningPins.select(List.of(event(exit)), T, false).isEmpty());
        assertTrue("no coordinates", WarningPins.select(List.of(event(zone("z", 1, T, null, "start", false))), T, false).isEmpty());
    }

    @Test public void zonePinLeavesWithTheZonesClear() {
        WarningView view = new WarningView();
        view.events(List.of(event(zone("AvgSpeedCheck:a2", 1, T, END, "end", true))));
        assertEquals(1, WarningPins.select(view.carEvents(T + 10, e -> true), T + 10, false).size());
        Bundle clear = new Bundle();
        clear.putInt("protocol_version", 1); clear.putString("provider_session", SESSION); clear.putString("warning_id", "AvgSpeedCheck:a2");
        clear.putLong("sequence", 2); clear.putLong("revision", 2); clear.putLong("announcement_index", 0);
        clear.putString("operation", "CLEAR"); clear.putLong("observed_elapsed_ms", T + 20); clear.putLong("issued_elapsed_ms", T + 20);
        view.events(List.of(WarningCodec.decode(clear, T + 20)));
        assertTrue(WarningPins.select(view.carEvents(T + 30, e -> true), T + 30, false).isEmpty());
    }

    @Test public void keyIsStablePerWarningAndCarriesNoIdentityText() {
        WarningEvent first = event(warning("road-123", 1, T, HERE, T, true, false));
        WarningEvent later = event(warning("road-123", 7, T + 5000, new double[]{51.5, 5.5}, T + 5000, true, false));
        WarningEvent other = event(warning("road-124", 2, T, HERE, T, true, false));
        assertEquals(WarningPins.key(first), WarningPins.key(later));
        assertNotEquals(WarningPins.key(first), WarningPins.key(other));
        assertTrue(WarningPins.key(first).matches("w[0-9a-f]{16}"));
        assertFalse(WarningPins.key(first).contains("123"));
        WarningPins.Pin pin = WarningPins.select(List.of(first), T, false).get(0);
        assertFalse("never the position in text", pin.toString().contains("51.48"));
    }

    @Test public void unchangedSelectionCompareEqualSoMapsIsNotAskedToRedraw() {
        WarningEvent cam = event(warning("cam", 1, T, HERE, T, true, false));
        List<WarningPins.Pin> a = WarningPins.select(List.of(cam), T + 100, false), b = WarningPins.select(List.of(cam), T + 900, false);
        assertEquals(a, b);
        WarningEvent moved = event(warning("cam", 2, T + 1000, new double[]{51.4855, 5.416153}, T + 1000, true, false));
        assertNotEquals(a, WarningPins.select(List.of(moved), T + 1100, false));
        assertNotEquals(a, Collections.emptyList());
    }

    @Test public void everyIconOfTheVocabularyHasItsOwnEmojiAndName() {
        Set<String> emoji = new HashSet<>();
        for (IndicatorContract.Kind kind : IndicatorContract.Kind.values()) {
            assertTrue(kind.icon, emoji.add(WarningPins.emoji(kind.icon)));
            assertFalse(WarningPins.title(kind.icon, false).isEmpty());
            assertFalse(WarningPins.title(kind.icon, true).isEmpty());
        }
        assertEquals(WarningPins.emoji("incident"), WarningPins.emoji("something_new"));
        WarningPins.Pin pin = WarningPins.select(List.of(event(warning("cam", 1, T, HERE, T, true, false))), T, true).get(0);
        assertEquals("speed_camera", pin.icon); assertEquals("📷", pin.emoji()); assertEquals("Flitspaal", pin.title);
    }

    @Test public void twoWarningsSwappingInThePillsGiveTheSamePins() {
        WarningEvent near = event(warning("cam", 1, T, HERE, T, true, false));
        WarningEvent other = event(warning("trap", 1, T, HERE, T, true, false));
        List<WarningPins.Pin> one = WarningPins.byKey(WarningPins.select(List.of(near, other), T, false));
        List<WarningPins.Pin> two = WarningPins.byKey(WarningPins.select(List.of(other, near), T, false));
        assertEquals("the map redraws only when the set changes", one, two);
        assertTrue(one.get(0).key.compareTo(one.get(1).key) < 0);
        assertEquals(Collections.emptyList(), WarningPins.byKey(Collections.emptyList()));
    }

    @Test public void throttleRunsTheFirstRedrawAtOnceAndBoundsTheRest() {
        WarningPins.Throttle throttle = new WarningPins.Throttle(1000);
        assertEquals(0, throttle.delay(5000));
        throttle.ran(5000);
        assertEquals(1000, throttle.delay(5000));
        assertEquals(600, throttle.delay(5400));
        assertEquals(0, throttle.delay(6000));
        assertEquals(0, throttle.delay(9000));
        assertEquals("a clock before the last redraw never stalls it", 0, throttle.delay(4000));
    }
}
