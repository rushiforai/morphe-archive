package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.assertEquals;

import android.app.Activity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class CaptionSizeRangeTest {
    @Test public void savedCaptionSizeStaysWithinEightToFifteenSp() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        try {
            assertEquals(13, DeepSeekConfig.displayStyle(activity).captionTextSize);
            DeepSeekConfig.saveCaptionTextSize(activity, 1);
            assertEquals(8, DeepSeekConfig.displayStyle(activity).captionTextSize);
            DeepSeekConfig.saveCaptionTextSize(activity, 99);
            assertEquals(15, DeepSeekConfig.displayStyle(activity).captionTextSize);
        } finally {
            activity.finish();
        }
    }
}
