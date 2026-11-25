package org.ungoogled.waze;

import static org.junit.Assert.*;
import android.os.Bundle;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=32,manifest=Config.NONE)
public class NativeZoneRangesTest {
    private long[] range(){return new long[]{1,-7,11,5000000,52000000,5100000,52100000,3};}
    private Bundle event(String phase){Bundle b=new Bundle();b.putString("native_type","AVERAGE_SPEED_CAMERA");
        b.putString("native_segment_phase",phase);b.putString("native_segment_key",WazeWarningModels.hash("AVERAGE_SPEED_CAMERA:-7-11"));b.putString("phase","approach");return b;}
    @Test public void rejectsMalformedOrAmbiguousCompleteSnapshots(){
        assertTrue(NativeZoneRanges.decode(null).isEmpty());assertTrue(NativeZoneRanges.decode(new long[]{1,2}).isEmpty());
        long[] invalid=range();invalid[3]=180000001;assertTrue(NativeZoneRanges.decode(invalid).isEmpty());
        invalid=range();invalid[1]=4294967295L;assertTrue(NativeZoneRanges.decode(invalid).isEmpty());
        invalid=range();invalid[0]=-1;assertTrue(NativeZoneRanges.decode(invalid).isEmpty());
        long[] duplicate={1,-7,11,5000000,52000000,5100000,52100000,3,-7,11,5000000,52000000,5100000,52100000,3};
        assertTrue(NativeZoneRanges.decode(duplicate).isEmpty());assertTrue(NativeZoneRanges.decode(new long[1+129*7]).isEmpty());
    }
    @Test public void usesSignedNativeIdentityAndPreservesExactEndpoints(){
        Bundle b=event("APPROACHING");NativeZoneRanges.apply(b,NativeZoneRanges.decode(range()),123);
        assertEquals("start",b.getString("zone_point"));assertEquals(52,b.getDouble("latitude"),0);assertEquals(5,b.getDouble("longitude"),0);
        assertEquals(123,b.getLong("position_observed_elapsed_ms"));assertFalse(b.getBoolean("position_estimated"));assertTrue(b.getBoolean("native_point_target"));
        b=event("WITHIN");NativeZoneRanges.apply(b,NativeZoneRanges.decode(range()),124);
        assertEquals("end",b.getString("zone_point"));assertEquals(52.1,b.getDouble("latitude"),0);assertEquals(5.1,b.getDouble("longitude"),0);
    }
    @Test public void routeTruncationDoesNotInventAControlBoundary(){
        long[] snapshot=range();snapshot[7]=1;Bundle b=event("WITHIN");
        NativeZoneRanges.apply(b,NativeZoneRanges.decode(snapshot),123);assertFalse(b.containsKey("latitude"));
        snapshot[7]=2;b=event("APPROACHING");NativeZoneRanges.apply(b,NativeZoneRanges.decode(snapshot),123);assertFalse(b.containsKey("latitude"));
        b=event("WITHIN");NativeZoneRanges.apply(b,NativeZoneRanges.decode(snapshot),123);assertEquals("end",b.getString("zone_point"));
    }
    @Test public void unknownIdentityPhaseAndContradictingZoneStateCannotAcquireGeometry(){
        Bundle b=event("UNKNOWN");NativeZoneRanges.apply(b,NativeZoneRanges.decode(range()),123);assertFalse(b.containsKey("latitude"));
        b=event("APPROACHING");b.putString("native_segment_key","different");NativeZoneRanges.apply(b,NativeZoneRanges.decode(range()),123);assertFalse(b.containsKey("latitude"));
        b=event("WITHIN");b.putString("native_zone_state","BeforeZone");NativeZoneRanges.apply(b,NativeZoneRanges.decode(range()),123);assertFalse(b.containsKey("latitude"));
        b=event("WITHIN");b.putString("phase","exit");NativeZoneRanges.apply(b,NativeZoneRanges.decode(range()),123);assertFalse(b.containsKey("latitude"));
    }
}
