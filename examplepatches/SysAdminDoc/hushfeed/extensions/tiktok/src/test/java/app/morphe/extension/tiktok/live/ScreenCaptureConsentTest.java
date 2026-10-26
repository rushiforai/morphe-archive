package app.morphe.extension.tiktok.live;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Intent;
import android.os.Looper;
import app.morphe.extension.tiktok.SettingsContextRule;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE)
public class ScreenCaptureConsentTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    @After public void clear() {
        ScreenCapture.denied();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        ScreenCapture.release(null);
    }

    @Test @Config(sdk = {34, 35})
    public void appPickerConsentUsesAnotherTaskAndStillRequiresAnAnswer() {
        checkRequest(Intent.FLAG_ACTIVITY_NO_ANIMATION
                | Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_MULTIPLE_TASK);
    }

    @Test @Config(sdk = {23, 33})
    public void displayOnlyConsentKeepsItsExistingRoute() {
        checkRequest(Intent.FLAG_ACTIVITY_NO_ANIMATION);
    }

    private void checkRequest(int expectedFlags) {
        try (var owner = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = owner.get();
            Intent original = activity.getIntent();
            int originalFlags = original.getFlags();
            AtomicInteger answers = new AtomicInteger();
            ScreenCapture.request(activity, granted -> {
                assertFalse(granted);
                answers.incrementAndGet();
            });
            Intent consent = Shadows.shadowOf(activity).getNextStartedActivity();
            assertNotNull(consent);
            assertEquals(ScreenRecordConsentActivity.class.getName(),
                    consent.getComponent().getClassName());
            assertEquals(expectedFlags, consent.getFlags());
            assertSame(original, activity.getIntent());
            assertEquals(originalFlags, original.getFlags());
            assertEquals(0, answers.get());
            assertNull(ScreenCapture.pending());
            ScreenCapture.denied();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(1, answers.get());
            assertNull(ScreenCapture.pending());
        }
    }
}
