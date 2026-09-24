package app.yydarlinker.deepseekcaptions;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.assertEquals;

/** No bridge shadow: the unpatched JVM accessor must remain a safe, ownerless stub. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28)
public class NativeModelVideo126Test {
    @Test public void unpatchedModelAccessorReturnsEmptyForNullAndArbitraryManagers() {
        assertEquals("",NativeCaptionBridge.nativeModelVideo(null));
        assertEquals("",NativeCaptionBridge.nativeModelVideo(new Object()));
    }
}
