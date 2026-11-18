package io.github.sabopura.morphe.extension.twitch.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;

public class ClassicHomeTest {
    /** Answers the given values in turn and counts the reads. */
    private static final class Setting {
        final List<Boolean> values;
        int reads;

        Setting(Boolean... values) {
            this.values = Arrays.asList(values);
        }

        Boolean read() {
            return values.get(reads++);
        }
    }

    @Test
    public void keepsTheFirstAnswerForTheWholeRun() {
        ClassicHome.Latch latch = new ClassicHome.Latch();
        Setting setting = new Setting(true, false, false);
        assertTrue(latch.get(setting::read));
        assertTrue(latch.get(setting::read));
        assertTrue(latch.get(setting::read));
        assertEquals(1, setting.reads);
    }

    @Test
    public void keepsANoAsWell() {
        ClassicHome.Latch latch = new ClassicHome.Latch();
        Setting setting = new Setting(false, true);
        assertFalse(latch.get(setting::read));
        assertFalse(latch.get(setting::read));
        assertEquals(1, setting.reads);
    }

    @Test
    public void answersNoUntilTheSettingsCanBeRead() {
        ClassicHome.Latch latch = new ClassicHome.Latch();
        Setting setting = new Setting(null, true, false);
        assertFalse(latch.get(setting::read));
        assertTrue(latch.get(setting::read));
        assertTrue(latch.get(setting::read));
        assertEquals(2, setting.reads);
    }

    @Test
    public void peekSaysWhatThisRunStartedWithOrNothingYet() {
        ClassicHome.Latch latch = new ClassicHome.Latch();
        assertEquals(null, latch.peek());
        latch.get(() -> null);
        assertEquals(null, latch.peek());
        latch.get(() -> true);
        assertEquals(Boolean.TRUE, latch.peek());
    }
}
