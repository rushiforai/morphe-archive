package app.morphe.extension.pinedrama.blockauthor;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import android.preference.PreferenceActivity;

import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.pinedrama.settings.Settings;

import org.junit.Rule;
import app.morphe.extension.pinedrama.wellbeing.SessionBudget;
import org.robolectric.util.ReflectionHelpers;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The feed binds the items either side of the current one before the user reaches them, so
 * "most recently bound" is not "on screen". These cover the difference.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class CurrentVideoAuthorTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    public static final class TestActivity extends PreferenceActivity {}

    @Before public void setUp() {
        CurrentVideoAuthor.resetForTests();
    }

    @After public void tearDown() {
        CurrentVideoAuthor.resetForTests();
    }

    /** Stands in for VideoItemParams. */
    public static final class Params {
        public final Clip aweme;

        Params(String awemeId, String uid) {
            aweme = new Clip(awemeId, uid);
        }
    }

    public static final class Clip {
        public final String aid;
        public final Author author;

        Clip(String aid, String uid) {
            this.aid = aid;
            this.author = new Author(uid);
        }
    }

    public static final class Author {
        public final String uid;
        public final String uniqueId;

        Author(String uid) {
            this.uid = uid;
            this.uniqueId = uid;
        }
    }

    private interface BudgetBody {
        void run(java.util.concurrent.atomic.AtomicLong now) throws Exception;
    }

    /** Runs {@code body} with SessionBudget reading a clock the test moves. */
    private static void withBudgetClock(BudgetBody body) throws Exception {
        java.util.concurrent.atomic.AtomicLong now = new java.util.concurrent.atomic.AtomicLong(1_790_000_000_000L);
        Class<?> clockType = Class.forName("app.morphe.extension.pinedrama.wellbeing.SessionBudget$Clock");
        Object clock = java.lang.reflect.Proxy.newProxyInstance(clockType.getClassLoader(),
                new Class<?>[]{clockType}, (proxy, method, args) ->
                        "now".equals(method.getName()) ? now.get() : null);
        try (var controller = Robolectric.buildActivity(TestActivity.class).setup()) {
            Utils.setContext(controller.get());
            budgetForTests("awaitWritesForTests");
            ReflectionHelpers.callStaticMethod(SessionBudget.class, "setClockForTests",
                    ReflectionHelpers.ClassParameter.from(clockType, clock));
            budgetForTests("resetForTests");
            CurrentVideoAuthor.update(new Params("long_clip", "creator_one"));
            body.run(now);
        } finally {
            ReflectionHelpers.callStaticMethod(SessionBudget.class, "setClockForTests",
                    ReflectionHelpers.ClassParameter.from(clockType, null));
            budgetForTests("awaitWritesForTests");
            budgetForTests("resetForTests");
            Settings.SESSION_BUDGET_MINUTES.resetToDefault();
            Settings.SESSION_BUDGET_LOCK_MINUTES.resetToDefault();
            Settings.SESSION_BUDGET_STATE.resetToDefault();
        }
    }

    private static void budgetForTests(String method) {
        ReflectionHelpers.callStaticMethod(SessionBudget.class, method);
    }

    @Test
    public void authorEqualityAndHashingUseTheSameCanonicalIdentifier() {
        VideoAuthor first = new VideoAuthor("uid-1", "sec-1", "First", "video-1");
        VideoAuthor rebound = new VideoAuthor("uid-1", "sec-2", "Renamed", "video-2");
        VideoAuthor secureOnly = new VideoAuthor(null, "sec-1", "First", "video-3");
        VideoAuthor emptyUid = new VideoAuthor("", "sec-1", "First", "video-4");

        assertEquals(first, rebound);
        assertEquals(first.hashCode(), rebound.hashCode());
        assertNotEquals(first, secureOnly);
        assertEquals(secureOnly, emptyUid);
        assertEquals(secureOnly.hashCode(), emptyUid.hashCode());

        java.util.Set<VideoAuthor> authors = new java.util.HashSet<>();
        authors.add(first);
        authors.add(rebound);
        authors.add(secureOnly);
        authors.add(emptyUid);
        assertEquals(2, authors.size());
    }
}
