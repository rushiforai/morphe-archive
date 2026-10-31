package app.morphed.extension.twitch.patches;

import org.junit.Test;

import java.lang.reflect.Field;

import app.morphed.extension.twitch.adblock.AdBlocker;
import app.morphed.extension.twitch.adblock.BackupStreamFinder;

import static org.junit.Assert.assertNotNull;

/**
 * v1.2.0 built the ad blocker before its logger existed, so every stream crashed (E3).
 */
public class StreamAdsPatchTest {
    @Test
    public void everyPartIsBuiltWithItsLogger() throws Exception {
        AdBlocker blocker = (AdBlocker) staticField(StreamAdsPatch.class, "AD_BLOCKER");
        assertNotNull(blocker);
        assertNotNull(field(blocker, "logger"));
        assertNotNull(field(blocker, "problems"));
        assertNotNull(field(blocker, "breaks"));

        BackupStreamFinder backups = (BackupStreamFinder) field(blocker, "backups");
        assertNotNull(field(backups, "logger"));
        assertNotNull(field(backups, "problems"));
    }

    private static Object staticField(Class<?> type, String name) throws Exception {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field.get(null);
    }

    private static Object field(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(owner);
    }
}
