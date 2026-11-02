package org.ungoogled.waze;

import static org.junit.Assert.*;

import android.app.Application;
import android.content.Context;
import java.lang.reflect.Field;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE)
public class ConsentAnswersTest {
    private Application app;

    @Before public void setup() throws Exception {
        app = RuntimeEnvironment.getApplication();
        Field f = Customization.class.getDeclaredField("app");
        f.setAccessible(true);
        f.set(null, app);
        app.getSharedPreferences("ungoogled_waze", Context.MODE_PRIVATE).edit().clear().commit();
    }

    @Test public void requiredConsentIsAnsweredAndNeverRequestsAScreen() {
        AtomicInteger accepted = new AtomicInteger();
        assertFalse(ConsentAnswers.answerModern(true, accepted::incrementAndGet));
        assertEquals(1, accepted.get());
    }

    @Test public void alreadyAnsweredConsentDoesNotRepeatCompletion() {
        AtomicInteger accepted = new AtomicInteger();
        assertFalse(ConsentAnswers.answerModern(false, accepted::incrementAndGet));
        assertEquals(0, accepted.get());
    }

    @Test public void disabledPatchPreservesOriginalScreenDecision() {
        app.getSharedPreferences("ungoogled_waze", Context.MODE_PRIVATE).edit()
                .putBoolean("skipConsent", false).commit();
        AtomicInteger accepted = new AtomicInteger();
        assertTrue(ConsentAnswers.answerModern(true, accepted::incrementAndGet));
        assertEquals(0, accepted.get());
    }
}
