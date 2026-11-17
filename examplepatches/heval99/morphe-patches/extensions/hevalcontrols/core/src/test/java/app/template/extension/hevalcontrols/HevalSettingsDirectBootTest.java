package app.template.extension.hevalcontrols;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.ContextWrapper;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/** Direct boot: a locked user must not leave a permanent failed snapshot behind. */
public class HevalSettingsDirectBootTest {
    private static final String REGISTRY = "hevalcontrols-registry:1\n"
            + "on.default\tOn by default\t\tA\t1\t0\t0\t\n"
            + "off.default\tOff by default\t\tA\t0\t0\t0\t\n";

    /** A context whose preferences cannot be opened, like a locked user's private storage. */
    private final Context context = new ContextWrapper(null);

    @Before
    public void setUp() {
        HevalSettings.resetForTests();
        Registry.install(REGISTRY);
    }

    @After
    public void tearDown() {
        HevalSettings.resetForTests();
        Registry.install(null);
    }

    @Test
    public void lockedUserPublishesNothingAndAnswersTheDefaults() {
        HevalSettings.userUnlockedForTests = false;
        assertNull(HevalSettings.init(context, "provider"));
        assertNull(HevalSettings.init(context, "lazy"));
        assertFalse(HevalSettings.isReady());
        assertFalse(HevalSettings.isEngineFailed());
        assertTrue(HevalSettings.isEnabled("on.default"));
        assertFalse(HevalSettings.isEnabled("off.default"));
        assertTrue(HevalSettings.getHidden("on.default").isEmpty());
        assertFalse(HevalSettings.isReady());
    }

    @Test
    public void theEngineStartsOnALaterCallOnceTheUserIsUnlocked() {
        HevalSettings.userUnlockedForTests = false;
        assertNull(HevalSettings.init(context, "lazy"));
        assertFalse(HevalSettings.isReady());

        // Unlocked: the start is tried again. The stub context cannot open preferences, so this
        // start fails like an unlocked process always did (a failed snapshot, every feature stock).
        HevalSettings.userUnlockedForTests = true;
        assertTrue(HevalSettings.init(context, "lazy") != null);
        assertTrue(HevalSettings.isReady());
        assertTrue(HevalSettings.isEngineFailed());
    }

    @Test
    public void anUnlockedProcessBehavesAsBefore() {
        HevalSettings.userUnlockedForTests = true;
        assertTrue(HevalSettings.init(context, "provider") != null);
        assertTrue(HevalSettings.isEngineFailed());
        assertFalse(HevalSettings.isEnabled("on.default"));
    }
}
