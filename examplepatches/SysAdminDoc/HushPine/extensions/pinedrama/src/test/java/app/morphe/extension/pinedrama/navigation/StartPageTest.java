package app.morphe.extension.pinedrama.navigation;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Intent;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class StartPageTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** PineDrama's main activity as the hook sees it: something whose intent started the app. */
    static final class Host extends Activity {
        Host(Intent intent) {
            setIntent(intent);
        }
    }

    /** An activity that fails when asked for its intent, which the start page must survive. */
    static final class BrokenHost extends Activity {
        @Override public Intent getIntent() {
            throw new IllegalStateException("no intent");
        }
    }

    @Before public void setUp() {
        resetSettings();
        HookStatus.clear();
        StartPage.resetForTests();
    }

    @After public void tearDown() {
        resetSettings();
        HookStatus.clear();
        StartPage.resetForTests();
    }

    /** A Setting keeps the value it last loaded in memory, whichever test's store it came from. */
    private static void resetSettings() {
        Settings.START_PAGE.resetToDefault();
        Settings.BOTTOM_NAVIGATION.resetToDefault();
        Settings.BOTTOM_NAVIGATION_TABS.resetToDefault();
        Settings.BOTTOM_NAVIGATION_OBSERVED_TABS.resetToDefault();
        Settings.FEED_NAVIGATION.resetToDefault();
        Settings.FEED_NAVIGATION_TABS.resetToDefault();
    }

    private static Intent launcher() {
        return new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER);
    }

    @Test public void theLauncherTestReadsActionCategoryDataAndTheNotificationTab() {
        assertTrue(StartPage.isLauncherStart(launcher()));
        assertFalse(StartPage.isLauncherStart(launcher().setAction(Intent.ACTION_VIEW)));
        assertFalse(StartPage.isLauncherStart(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME)));
        assertFalse(StartPage.isLauncherStart(null));
    }

    @Test public void anAccountServiceThatCannotBeReadKeepsTheChoice() {
        assertTrue(StartPage.signedIn());
    }

    /** PineDrama's service manager, as the sign-in check finds it by name. */
    public static final class Services {
        static Object account;

        public static Services get() {
            return new Services();
        }

        public Object getService(Class<?> type) {
            return account;
        }
    }

    /** PineDrama's account service, signed in or not. */
    public static final class Account {
        private final boolean login;

        Account(boolean login) {
            this.login = login;
        }

        public boolean isLogin() {
            return login;
        }
    }

}
