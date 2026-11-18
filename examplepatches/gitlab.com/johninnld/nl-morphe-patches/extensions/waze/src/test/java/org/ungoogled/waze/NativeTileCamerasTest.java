package org.ungoogled.waze;

import static org.junit.Assert.*;
import android.location.Location;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=32,manifest=Config.NONE)
public class NativeTileCamerasTest {
    private Location fix(long at) {
        Location result=new Location("gps");result.setLatitude(52);result.setLongitude(5);
        result.setAccuracy(5);result.setElapsedRealtimeNanos(at*1000000);return result;
    }
    @Test public void rejectsStaleFixAndMalformedSnapshot(){
        long[] point={1,2,69,5000000,52000000};
        assertEquals(0,NativeTileCameras.select(point,fix(0),15001).length);
        assertEquals(0,NativeTileCameras.select(new long[]{1},fix(100),100).length);
        assertEquals(0,NativeTileCameras.select(point,null,100).length);
        assertEquals(0,NativeTileCameras.select(new long[]{1,2,69,Long.MIN_VALUE,52000000},fix(100),100).length);
    }
    @Test public void keepsNativePositionIdentityAndDummyTypeWithoutFabricatingDirection(){
        long[] point={4294967295L,-1,72,5000001,52000002};
        assertArrayEquals(point,NativeTileCameras.select(point,fix(100),100));
    }
    @Test public void deduplicatesNativeIdentityAndBoundsNearbyExport(){
        long[] snapshot=new long[40*5];
        for(int i=0;i<40;i++){snapshot[i*5]=1;snapshot[i*5+1]=i;snapshot[i*5+2]=69;snapshot[i*5+3]=5000000+i;snapshot[i*5+4]=52000000;}
        assertEquals(32*5,NativeTileCameras.select(snapshot,fix(100),100).length);
        long[] duplicate={1,2,69,5000000,52000000,1,2,69,5000000,52000000};
        assertEquals(5,NativeTileCameras.select(duplicate,fix(100),100).length);
    }
}
