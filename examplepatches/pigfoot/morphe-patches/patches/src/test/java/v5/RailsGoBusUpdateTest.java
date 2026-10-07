package v5;
import android.app.Activity;
import com.google.android.gms.internal.ads.*;
import org.junit.Test;
import static org.junit.Assert.*;
public class RailsGoBusUpdateTest {
    private K valid() {
        K k=new K();k.c="ca-app-pub-6118603149023812/5192762441";k.a=17;
        k.b=new t0.b();k.b.A=new Activity();k.g=new mf();
        k.g.a=()->new af(){public int c(){return 7;} public String b(){return "bus";}};
        return k;
    }
    @Test public void completesLoadedRewardOnce() {
        K k=valid();assertTrue(RailsGoBusUpdate.tryComplete(k));
        assertEquals(Integer.valueOf(7),k.b.lastReward.amount);assertEquals("bus",k.b.lastReward.type);
        assertTrue(RailsGoBusUpdate.tryComplete(k));assertEquals(1,k.b.rewards);assertEquals(1,k.b.dismissals);
    }
    @Test public void unrelatedUnitFallsBack(){K k=valid();k.c="other";assertFalse(RailsGoBusUpdate.tryComplete(k));assertEquals(0,k.b.rewards);}
    @Test public void missingMetadataFallsBack(){K k=valid();k.g.a=()->null;assertFalse(RailsGoBusUpdate.tryComplete(k));assertEquals(0,k.b.rewards);}
    @Test public void noLoadedAdFallsBack(){K k=valid();k.g=null;assertFalse(RailsGoBusUpdate.tryComplete(k));}
    @Test public void noCallbackFallsBack(){K k=valid();k.b=null;assertFalse(RailsGoBusUpdate.tryComplete(k));}
    @Test public void nonActivityFallsBack(){K k=valid();k.b.A=new Object();assertFalse(RailsGoBusUpdate.tryComplete(k));}
    @Test public void noSourceFallsBack(){K k=valid();k.g.a=null;assertFalse(RailsGoBusUpdate.tryComplete(k));}
    @Test public void noTypeFallsBack(){K k=valid();k.g.a=()->new af(){public int c(){return 9;} public String b(){return null;}};assertFalse(RailsGoBusUpdate.tryComplete(k));assertEquals(0,k.b.rewards);}
    @Test public void retrievalExceptionCanRetry(){K k=valid();df original=k.g.a;k.g.a=()->{throw new IllegalStateException();};assertFalse(RailsGoBusUpdate.tryComplete(k));k.g.a=original;assertTrue(RailsGoBusUpdate.tryComplete(k));assertEquals(1,k.b.rewards);}
    @Test public void rewardExceptionDoesNotReplay(){K k=valid();k.b.throwReward=true;assertTrue(RailsGoBusUpdate.tryComplete(k));assertTrue(RailsGoBusUpdate.tryComplete(k));assertEquals(1,k.b.rewards);assertEquals(0,k.b.dismissals);}
    @Test public void dismissExceptionDoesNotReplay(){K k=valid();k.b.throwDismiss=true;assertTrue(RailsGoBusUpdate.tryComplete(k));assertTrue(RailsGoBusUpdate.tryComplete(k));assertEquals(1,k.b.rewards);assertEquals(1,k.b.dismissals);}
    @Test public void separateWrappersRemainIndependent(){K a=valid(),b=valid();assertTrue(RailsGoBusUpdate.tryComplete(a));assertTrue(RailsGoBusUpdate.tryComplete(b));assertEquals(1,b.b.rewards);}
}
