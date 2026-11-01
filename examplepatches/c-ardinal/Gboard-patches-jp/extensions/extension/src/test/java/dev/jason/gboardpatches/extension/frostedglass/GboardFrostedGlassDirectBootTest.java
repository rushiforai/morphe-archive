package dev.jason.gboardpatches.extension.frostedglass;

import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.os.UserManager;
import android.view.Window;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowUserManager;

import java.util.concurrent.atomic.AtomicInteger;

import dev.jason.gboardpatches.extension.clipboardcontentlimit.GboardClipboardContentLimitSettings;
import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.UPSIDE_DOWN_CAKE)
public final class GboardFrostedGlassDirectBootTest {
    private static final String DIRECT_BOOT_MESSAGE =
            "SharedPreferences in credential encrypted storage are not available "
                    + "until after user (id 0) is unlocked";

    private Context application;
    private ShadowUserManager shadowUserManager;

    @Before
    public void setUp() {
        application = RuntimeEnvironment.getApplication();
        UserManager userManager = (UserManager) application.getSystemService(Context.USER_SERVICE);
        shadowUserManager = Shadow.extract(userManager);
        shadowUserManager.setUserUnlocked(true);
        SharedPreferences prefs = GboardPatchesSettings.preferences(application);
        prefs.edit().clear().commit();
    }

    @Test
    public void preferencesOrNullSkipsLockedUserAndCatchesCredentialEncryptedStorageException() {
        GboardFrostedGlassSettings.writeEnabled(application, true);
        Assert.assertNotNull(GboardFlagRuntimeContext.preferencesOrNull(application));
        Assert.assertTrue(GboardFrostedGlassSettingsRuntime.isEnabled());

        shadowUserManager.setUserUnlocked(false);
        Assert.assertFalse(GboardFlagRuntimeContext.isUserUnlocked(application));
        Assert.assertNull(GboardFlagRuntimeContext.preferencesOrNull(application));
        Assert.assertNull(GboardFlagRuntimeContext.preferencesOrNull());
        Assert.assertFalse(GboardFrostedGlassSettingsRuntime.isEnabled());

        Context throwingUnlockedContext = new ContextWrapper(application) {
            @Override
            public Context getApplicationContext() {
                return this;
            }

            @Override
            public Object getSystemService(String name) {
                if (Context.USER_SERVICE.equals(name)) {
                    return null;
                }
                return super.getSystemService(name);
            }

            @Override
            public SharedPreferences getSharedPreferences(String name, int mode) {
                throw new IllegalStateException(DIRECT_BOOT_MESSAGE);
            }
        };
        Assert.assertNull(GboardFlagRuntimeContext.preferencesOrNull(throwingUnlockedContext));

        shadowUserManager.setUserUnlocked(true);
        Assert.assertTrue(GboardFlagRuntimeContext.isUserUnlocked(application));
        Assert.assertNotNull(GboardFlagRuntimeContext.preferencesOrNull(application));
        Assert.assertTrue(GboardFrostedGlassSettingsRuntime.isEnabled());
    }

    @Test
    public void frostedGlassLifecycleEntryPointsSkipDirectBootAndRecoverAfterUnlock() {
        GboardFrostedGlassSettings.writeEnabled(application, true);
        AtomicInteger sharedPrefsCallsWhileLocked = new AtomicInteger();

        TestInputMethodService service = Robolectric.setupService(TestInputMethodService.class);
        service.setThrowOnSharedPreferencesWhenLocked(true, sharedPrefsCallsWhileLocked);
        Dialog dialog = service.getWindow();
        Window window = dialog != null ? dialog.getWindow() : null;

        shadowUserManager.setUserUnlocked(false);

        GboardFrostedGlassLifecycleRuntime.onInputViewStarted(service);
        GboardFrostedGlassRuntime.onConfigureWindow(service, false, false);
        GboardFrostedGlassLifecycleRuntime.afterConfigureWindow(window, false, false);
        GboardFrostedGlassLifecycleRuntime.onInputWindowHidden(service);

        Assert.assertEquals(0, sharedPrefsCallsWhileLocked.get());
        Assert.assertFalse(GboardFrostedGlassSettingsRuntime.isEnabled());

        shadowUserManager.setUserUnlocked(true);
        Assert.assertTrue(GboardFrostedGlassSettingsRuntime.isEnabled());
        GboardFrostedGlassLifecycleRuntime.onInputViewStarted(service);
        GboardFrostedGlassLifecycleRuntime.afterConfigureWindow(window, false, false);
        GboardFrostedGlassLifecycleRuntime.onInputWindowHidden(service);
    }

    @Test
    public void clipboardContentLimitRuntimeFailsClosedDuringDirectBoot() {
        SharedPreferences clipPrefs = GboardClipboardContentLimitSettings.preferences(application);
        clipPrefs.edit()
                .putInt(GboardClipboardContentLimitSettings.PREF_KEY_MAX_CHARACTERS, 50_000)
                .commit();

        shadowUserManager.setUserUnlocked(false);
        Assert.assertEquals(
                Long.valueOf(20_000L),
                dev.jason.gboardpatches.extension.clipboardcontentlimit
                        .GboardClipboardContentLimitRuntime.applyOverriddenFlagValue(
                                "text_clip_item_char_limit", Long.valueOf(20_000L)));

        shadowUserManager.setUserUnlocked(true);
        Assert.assertEquals(
                Long.valueOf(50_000L),
                dev.jason.gboardpatches.extension.clipboardcontentlimit
                        .GboardClipboardContentLimitRuntime.applyOverriddenFlagValue(
                                "text_clip_item_char_limit", Long.valueOf(20_000L)));
    }

    public static final class TestInputMethodService extends InputMethodService {
        private boolean throwWhenLocked;
        private AtomicInteger lockedSharedPreferencesCounter;

        void setThrowOnSharedPreferencesWhenLocked(boolean throwWhenLocked,
                AtomicInteger counter) {
            this.throwWhenLocked = throwWhenLocked;
            this.lockedSharedPreferencesCounter = counter;
        }

        @Override
        public Context getApplicationContext() {
            return this;
        }

        @Override
        public SharedPreferences getSharedPreferences(String name, int mode) {
            UserManager manager = getSystemService(UserManager.class);
            if (throwWhenLocked && manager != null && !manager.isUserUnlocked()) {
                if (lockedSharedPreferencesCounter != null) {
                    lockedSharedPreferencesCounter.incrementAndGet();
                }
                throw new IllegalStateException(DIRECT_BOOT_MESSAGE);
            }
            return super.getSharedPreferences(name, mode);
        }
    }
}
