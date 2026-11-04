package app.wordfeudwordfinder.extension.hooks;

import static org.junit.Assert.assertEquals;

import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Test;

public class RouteTapChannelLogTest {
    @After
    public void reset() {
        RouteTap.setChannelLogger(null);
    }

    @Test
    public void logsEachChannelNameOnceAndOnlyWhenEnabled() {
        List<String> seen = new ArrayList<>();
        ByteBuffer msg = ByteBuffer.wrap(new byte[] {0x0C, 0x01, 0x01});
        RouteTap.onPlatformMessage("x.before", msg); // no logger: nothing recorded
        RouteTap.setChannelLogger(seen::add);
        RouteTap.onPlatformMessage("dev.flutter.pigeon.wordfeud.AdApi.setBannerVisible", msg);
        RouteTap.onPlatformMessage("dev.flutter.pigeon.wordfeud.AdApi.setBannerVisible", msg);
        RouteTap.onPlatformMessage("plugins.flutter.io/firebase_messaging", msg);
        RouteTap.onPlatformMessage("x.before", msg);
        assertEquals(Arrays.asList("dev.flutter.pigeon.wordfeud.AdApi.setBannerVisible",
                "plugins.flutter.io/firebase_messaging", "x.before"), seen);
        assertEquals(0, msg.position()); // buffer untouched
    }

    @Test
    public void failingLoggerDoesNotBreakTheTap() {
        RouteTap.setChannelLogger(c -> { throw new IllegalStateException(); });
        RouteTap.onPlatformMessage("y.channel", ByteBuffer.wrap(new byte[0]));
    }
}
