package patches.maps.gearslip;

import android.os.Bundle;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32)
public class NativeUiStateStoreTest {
    @Test public void reconnectRestoresAnIndependentCopyOfTheSameHostsNativeState() {
        NativeUiStateStore store=new NativeUiStateStore(2);var first=store.acquire(100);
        Bundle state=new Bundle(),nested=new Bundle();nested.putString("screen","guidance");state.putBundle("native",nested);
        store.save(first,state);nested.putString("screen","changed after save");
        var next=store.acquire(100);assertEquals("guidance",next.restored.getBundle("native").getString("screen"));
        next.restored.getBundle("native").putString("screen","changed by restore");
        assertEquals("guidance",store.acquire(100).restored.getBundle("native").getString("screen"));
    }
    @Test public void aLateRetiredPresentationCannotOverwriteItsReplacement() {
        NativeUiStateStore store=new NativeUiStateStore(2);var first=store.acquire(100);var next=store.acquire(100);
        Bundle current=new Bundle();current.putString("screen","current");store.save(next,current);
        Bundle late=new Bundle();late.putString("screen","retired");store.save(first,late);
        assertEquals("current",store.acquire(100).restored.getString("screen"));
    }
    @Test public void nativeStateCannotCrossHostUidsAndRetentionIsBounded() {
        NativeUiStateStore store=new NativeUiStateStore(2);var first=store.acquire(100);Bundle state=new Bundle();state.putString("screen","private");store.save(first,state);
        assertNull(store.acquire(101).restored);store.acquire(102);assertNull(store.acquire(100).restored);
    }
    @Test public void aNativeNullStateClearsAnEarlierSnapshot() {
        NativeUiStateStore store=new NativeUiStateStore(2);var lease=store.acquire(100);store.save(lease,new Bundle());store.save(lease,null);
        assertNull(store.acquire(100).restored);
    }
}
