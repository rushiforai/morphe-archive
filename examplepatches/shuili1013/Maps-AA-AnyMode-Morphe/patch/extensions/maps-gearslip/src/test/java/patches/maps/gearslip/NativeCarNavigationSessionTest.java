package patches.maps.gearslip;

import static org.junit.Assert.*;
import android.os.Binder;
import android.os.Bundle;
import android.os.Parcel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32)
public final class NativeCarNavigationSessionTest {
    static final class Provider extends Binder {
        final List<Integer> calls = new ArrayList<>();
        int minimum = 1, maximum = 1;
        boolean failStart;
        protected boolean y(int code, Parcel data, Parcel reply) {
            calls.add(code);
            if (code == 1) {
                Bundle versions = new Bundle();
                versions.putInt("MIN_VERSION", minimum); versions.putInt("MAX_VERSION", maximum);
                reply.writeNoException(); reply.writeInt(1); reply.writeBundle(versions);
            } else if (code == 2 || code == 3) {
                assertEquals(1, data.readInt());
                Bundle value = data.readBundle(getClass().getClassLoader());
                assertEquals(0, data.dataAvail());
                if (code == 2) {
                    assertEquals(1, value.getInt("version"));
                    assertTrue(value.getBundle("dynamic_configuration").isEmpty());
                    reply.writeNoException();
                } else {
                    assertEquals(1, value.getInt("mode"));
                    if (failStart) throw new IllegalStateException("Native start failed");
                }
            } else if (code == 4) reply.writeNoException();
            else return false;
            return true;
        }
    }

    @Test public void forwardsOriginalConfigurationStartAndExactlyOneStop() throws Exception {
        Provider provider = new Provider();
        NativeCarNavigationSession.LocalProvider session = new NativeCarNavigationSession.LocalProvider(provider);
        session.start(); session.close(); session.close();
        assertEquals(Arrays.asList(1, 2, 3, 4), provider.calls);
        try { session.start(); fail("Closed native session restarted"); }
        catch (IllegalStateException expected) { assertEquals(4, provider.calls.size()); }
    }

    @Test public void unsupportedNativeProtocolNeverStarts() throws Exception {
        Provider provider = new Provider(); provider.minimum = 2; provider.maximum = 2;
        NativeCarNavigationSession.LocalProvider session = new NativeCarNavigationSession.LocalProvider(provider);
        try { session.start(); fail("Unsupported protocol started"); }
        catch (IllegalStateException expected) { session.close(); }
        assertEquals(Arrays.asList(1), provider.calls);
    }

    @Test public void partialNativeStartPropagatesAndStillStopsOnRelease() throws Exception {
        Provider provider = new Provider(); provider.failStart = true;
        NativeCarNavigationSession.LocalProvider session = new NativeCarNavigationSession.LocalProvider(provider);
        try { session.start(); fail("Native failure was swallowed"); }
        catch (IllegalStateException expected) { assertEquals("Native start failed", expected.getMessage()); }
        session.close();
        assertEquals(Arrays.asList(1, 2, 3, 4), provider.calls);
    }
}
