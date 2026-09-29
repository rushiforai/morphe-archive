/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.coexist;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Facebook's code names the two permissions it shares with Meta's other apps, and the patch hands
 * each name to the extension. On an install that declares the renamed permissions, the one Morphe
 * Manager makes, the code has to name those, or its own broadcasts stop reaching it. On a Root
 * Mount install Android still goes by Meta's manifest, which declares Facebook's own names only.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SharedPermissionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String RENAMED_APP_COMMUNICATION = "app.hushfacebook.permission.prod.FB_APP_COMMUNICATION";
    private static final String RENAMED_FORMAT = "app.hushfacebook.permission.%s.FB_APP_COMMUNICATION";
    private static final String RENAMED_RECEIVER_ACCESS = "app.hushfacebook.receiver.permission.ACCESS";

    @Before
    public void forget() {
        SharedPermissions.holdsRenamed = null;
        HookStatus.clear();
    }

    @After
    public void restore() {
        SharedPermissions.holdsRenamed = null;
        PauseForTests.resume();
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).denyPermissions(RENAMED_APP_COMMUNICATION);
        HookStatus.clear();
    }

    private static void declareRenamed() {
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).grantPermissions(RENAMED_APP_COMMUNICATION);
    }

    @Test
    public void anInstallThatDeclaresTheRenamedPermissionsGetsTheirNames() {
        declareRenamed();
        assertEquals(RENAMED_APP_COMMUNICATION, SharedPermissions.name(SharedPermissions.APP_COMMUNICATION));
        assertEquals(RENAMED_RECEIVER_ACCESS, SharedPermissions.name(SharedPermissions.RECEIVER_ACCESS));
        // The format keeps its placeholder, so Facebook's own String.format gives the renamed name.
        String format = SharedPermissions.name(SharedPermissions.APP_COMMUNICATION_FORMAT);
        assertEquals(RENAMED_FORMAT, format);
        assertEquals(RENAMED_APP_COMMUNICATION, String.format(format, "PROD".toLowerCase()));
    }

    /** A Root Mount install: Meta's manifest, which never declared the renamed names. */
    @Test
    public void anInstallThatDoesntKeepsFacebooksOwnNames() {
        assertEquals(SharedPermissions.APP_COMMUNICATION, SharedPermissions.name(SharedPermissions.APP_COMMUNICATION));
        assertEquals(SharedPermissions.RECEIVER_ACCESS, SharedPermissions.name(SharedPermissions.RECEIVER_ACCESS));
        assertEquals(SharedPermissions.APP_COMMUNICATION_FORMAT,
                SharedPermissions.name(SharedPermissions.APP_COMMUNICATION_FORMAT));
    }

    /** Only the literals the patch routes are renamed; Facebook's package-scoped permissions never collide. */
    @Test
    public void anyOtherTextComesBackAsItWas() {
        declareRenamed();
        assertEquals("com.facebook.katana.provider.ACCESS", SharedPermissions.name("com.facebook.katana.provider.ACCESS"));
        assertEquals("com.facebook.permission.prod.FB_APP_COMMUNICATION ",
                SharedPermissions.name("com.facebook.permission.prod.FB_APP_COMMUNICATION "));
        assertEquals("", SharedPermissions.name(""));
        assertNull(SharedPermissions.name(null));
    }

    /**
     * Profilo names the permission while Facebook's application is still starting. With no context
     * yet the answer is the renamed name, which nearly every install holds, and it isn't kept: the
     * first answer after the context is set comes from the install itself.
     */
    @Test
    public void beforeTheContextTheAnswerIsTheUsualOneAndNotKept() {
        String[] early = new String[1];
        SettingsContextRule.withoutContext(() -> early[0] = SharedPermissions.name(SharedPermissions.APP_COMMUNICATION));
        assertEquals(RENAMED_APP_COMMUNICATION, early[0]);
        assertNull("an answer given with no context was kept", SharedPermissions.holdsRenamed);
        assertEquals("a Root Mount install got the early answer for good", SharedPermissions.APP_COMMUNICATION,
                SharedPermissions.name(SharedPermissions.APP_COMMUNICATION));
    }

    /**
     * A copy renamed with Morphe's Clone app, its Update permissions option on: the clone declares
     * each renamed permission under its own package and an underscore, and Facebook's code has to
     * name those, the ones its manifest's components now require (#16).
     */
    @Test
    public void aCloneWithItsOwnDeclarationsGetsThoseNames() {
        String clone = RuntimeEnvironment.getApplication().getPackageName() + "_";
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).grantPermissions(clone + RENAMED_APP_COMMUNICATION);
        try {
            assertEquals(clone + RENAMED_APP_COMMUNICATION, SharedPermissions.name(SharedPermissions.APP_COMMUNICATION));
            assertEquals(clone + RENAMED_RECEIVER_ACCESS, SharedPermissions.name(SharedPermissions.RECEIVER_ACCESS));
            assertEquals(clone + RENAMED_FORMAT, SharedPermissions.name(SharedPermissions.APP_COMMUNICATION_FORMAT));
        } finally {
            Shadows.shadowOf(RuntimeEnvironment.getApplication()).denyPermissions(clone + RENAMED_APP_COMMUNICATION);
        }
    }

    /** The install doesn't change while the process runs, so it's asked once. */
    @Test
    public void theInstallIsAskedOncePerProcess() {
        declareRenamed();
        assertEquals(RENAMED_APP_COMMUNICATION, SharedPermissions.name(SharedPermissions.APP_COMMUNICATION));
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).denyPermissions(RENAMED_APP_COMMUNICATION);
        assertEquals(RENAMED_APP_COMMUNICATION, SharedPermissions.name(SharedPermissions.APP_COMMUNICATION));
        assertEquals(Boolean.TRUE, SharedPermissions.holdsRenamed);
    }

    /** Pause can't undo a manifest, and Facebook has to keep naming what it holds. */
    @Test
    public void pauseChangesNothing() {
        declareRenamed();
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertEquals(RENAMED_APP_COMMUNICATION, SharedPermissions.name(SharedPermissions.APP_COMMUNICATION));
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        assertEquals(RENAMED_RECEIVER_ACCESS, SharedPermissions.name(SharedPermissions.RECEIVER_ACCESS));
    }

    /** Every call is counted under the patch's name, with which names it answered. */
    @Test
    public void callsReportUnderThePatchsName() {
        declareRenamed();
        SharedPermissions.name(SharedPermissions.APP_COMMUNICATION);
        SharedPermissions.name(SharedPermissions.APP_COMMUNICATION_FORMAT);
        SharedPermissions.name("something else");
        List<String> lines = HookStatus.report("");
        assertTrue(String.join("\n", lines),
                lines.contains(FamilyNames.INSTALL_BESIDE_META_APPS + ": invoked 3, 1 found, 0 missing"));
        assertEquals("Install beside Meta's apps", FamilyNames.INSTALL_BESIDE_META_APPS);
    }
}
