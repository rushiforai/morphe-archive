/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowToast;

/** Clear from cache (#53) end to end with Telegram's calls recorded: the download stops first, files go, the cell refreshes, the toast says what happened. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {CacheClearFlowTest.Menu.class, CacheClearFlowTest.Tools.class},
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class CacheClearFlowTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder temp = new TemporaryFolder();

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Menu {
        static File finished;

        @Implementation protected static File photoFile(Object message) { return finished; }
    }

    @Implements(value = MessageMenuTools.class, isInAndroidSdk = false)
    public static class Tools {
        static final List<String> calls = new ArrayList<>();
        static String name;

        @Implementation protected static String attachName(Object message) { return name; }
        @Implementation protected static void cancelLoad(Object message) { calls.add("cancel"); }
        @Implementation protected static void refreshMedia(Object message, String name) { calls.add("refresh " + name); }
    }

    private Context context;
    private File video;

    @Before public void setUp() {
        context = Robolectric.buildActivity(Activity.class).setup().get();
        video = new File(temp.getRoot(), "video");
        assertTrue(video.mkdirs());
        CacheClear.work = Runnable::run;
        CacheClear.secondSweepMillis = 0;
        CacheClear.folders = new CacheClear.Folders() {
            @Override public List<File> telegram() { return Collections.singletonList(video); }
            @Override public List<File> publicStorage() { return Collections.emptyList(); }
        };
        Tools.name = "5_9.mp4";
        Menu.finished = null;
    }

    @After public void restore() {
        Tools.calls.clear();
        HookStatus.clear();
        ShadowToast.reset();
    }

    @Test public void itCancelsFirstDeletesAndRefreshes() throws IOException {
        Files.write(new File(video, "5_9.mp4").toPath(), new byte[2048]);
        Files.write(new File(video, "5_9.temp").toPath(), new byte[1024]);
        CacheClear.clear(context, new Object());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("cancel comes before any refresh", "cancel", Tools.calls.get(0));
        assertTrue(Tools.calls.contains("refresh 5_9.mp4"));
        assertFalse(new File(video, "5_9.mp4").exists() || new File(video, "5_9.temp").exists());
        String toast = ShadowToast.getTextOfLatestToast();
        assertTrue(toast, toast.startsWith("Cleared "));
    }

    @Test public void nothingToClearIsToasted() {
        CacheClear.clear(context, new Object());
        assertEquals("Nothing to clear", ShadowToast.getTextOfLatestToast());
        assertEquals("cancel", Tools.calls.get(0));
    }

    @Test public void aMessageWithNoFileNameStillStopsTheDownloadAndSaysNothingToClear() {
        Tools.name = null;
        CacheClear.clear(context, new Object());
        assertEquals(Arrays.asList("cancel"), Tools.calls);
        assertEquals("Nothing to clear", ShadowToast.getTextOfLatestToast());
    }
}
