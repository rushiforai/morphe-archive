/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.content.pm.verify.domain.DomainVerificationManager;
import android.content.pm.verify.domain.DomainVerificationUserState;
import android.os.Process;
import android.os.RemoteException;
import android.os.UserHandle;
import android.preference.Preference;
import android.preference.PreferenceGroup;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowContextImpl;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.util.ReflectionHelpers;
import org.robolectric.util.ReflectionHelpers.ClassParameter;

import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import app.morphe.extension.shared.SettingsContextRule;

/**
 * The Supported links row under Links: what Android says about sending Facebook's web addresses to
 * this app, read for this app only, and the way to Android's own page for them. A re-signed build
 * loses Meta's link verification (Morphe Manager #1028), so the row is in every build.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 31)
@SuppressWarnings("deprecation")
public class SupportedLinksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String KEY = "action_supported_links";
    private static final int NONE = 0;
    private static final int SELECTED = 1;
    private static final int VERIFIED = 2;

    private ActivityController<Activity> controller;
    /** What the fake service answers, or throws. */
    private Object answer;
    /** The package the row asked about. */
    private final List<String> askedFor = new ArrayList<>();

    @Before
    public void noPatches() {
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        ShadowToast.reset();
    }

    @After
    public void restore() {
        if (controller != null) controller.close();
        PatchFamily.inBuildForTests = null;
        ScreenColors.shown = null;
        Settings.OPEN_LINKS_EXTERNALLY.resetToDefault();
        Settings.SANITIZE_SHARING_LINKS.resetToDefault();
    }

    private static Map<String, Integer> hosts(int facebook, int mobile) {
        Map<String, Integer> hosts = new LinkedHashMap<>();
        hosts.put("www.facebook.com", facebook);
        hosts.put("m.facebook.com", mobile);
        return hosts;
    }

    private static DomainVerificationUserState state(boolean allowed, Map<String, Integer> hosts) {
        return ReflectionHelpers.callConstructor(DomainVerificationUserState.class,
                ClassParameter.from(UUID.class, UUID.randomUUID()),
                ClassParameter.from(String.class, RuntimeEnvironment.getApplication().getPackageName()),
                ClassParameter.from(UserHandle.class, Process.myUserHandle()),
                ClassParameter.from(boolean.class, allowed),
                ClassParameter.from(Map.class, hosts));
    }

    /** Android's own manager over a fake of the system service behind it, on [context]. */
    private void installService(Context context) throws ClassNotFoundException {
        Class<?> binder = Class.forName("android.content.pm.verify.domain.IDomainVerificationManager");
        Object service = Proxy.newProxyInstance(binder.getClassLoader(), new Class<?>[]{binder}, (proxy, method, args) -> {
            if (!method.getName().equals("getDomainVerificationUserState")) {
                throw new UnsupportedOperationException(method.getName());
            }
            askedFor.add((String) args[0]);
            if (answer instanceof Throwable) throw (Throwable) answer;
            return answer;
        });
        DomainVerificationManager manager = ReflectionHelpers.callConstructor(DomainVerificationManager.class,
                ClassParameter.from(Context.class, context), ClassParameter.from(binder, service));
        ShadowContextImpl shadow = Shadow.extract(context);
        shadow.setSystemService(Context.DOMAIN_VERIFICATION_SERVICE, manager);
    }

    /** The screen, with the fake service on the activity when [withService]. */
    private HushfacebookPreferenceFragment show(boolean withService) throws ClassNotFoundException {
        controller = Robolectric.buildActivity(Activity.class).setup();
        if (withService) installService(controller.get().getBaseContext());
        HushfacebookPreferenceFragment fragment = new HushfacebookPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction()
                .add(android.R.id.content, fragment)
                .commitNow();
        return fragment;
    }

    private String summaryFor(Object answer) throws ClassNotFoundException {
        this.answer = answer;
        Preference row = show(true).findPreference(KEY);
        assertNotNull("no Supported links row", row);
        return String.valueOf(row.getSummary());
    }

    @Test
    public void everyAddressSelectedByHandOpensHere() throws Exception {
        assertEquals("Facebook's web addresses are selected for this app in Android's settings, so their links open here.",
                summaryFor(state(true, hosts(SELECTED, SELECTED))));
        // This app's package and no other.
        assertFalse(askedFor.isEmpty());
        for (String name : askedFor) assertEquals(RuntimeEnvironment.getApplication().getPackageName(), name);
    }

    @Test
    public void someAddressesSelected() throws Exception {
        assertEquals("Only some of Facebook's web addresses are selected for this app, and links to the rest open "
                + "elsewhere. Tap to select them in Android's settings.", summaryFor(state(true, hosts(SELECTED, NONE))));
    }

    @Test
    public void noAddressSelected() throws Exception {
        assertEquals("None of Facebook's web addresses are selected for this app, so their links open elsewhere. Tap to "
                + "select them in Android's settings.", summaryFor(state(true, hosts(NONE, NONE))));
    }

    /** What a build with Meta's own signature, such as a Root Mount install, gets. */
    @Test
    public void verifiedAddresses() throws Exception {
        assertEquals("Android verified this app for Facebook's web addresses, so their links open here.",
                summaryFor(state(true, hosts(VERIFIED, VERIFIED))));
    }

    /** Open supported links switched off wins over any address's state. */
    @Test
    public void linkHandlingOff() throws Exception {
        assertEquals("Opening supported links is off for this app in Android's settings. Tap to turn it on.",
                summaryFor(state(false, hosts(SELECTED, VERIFIED))));
    }

    /** Every read that doesn't give a clear answer says so, and none of them guesses one. */
    @Test
    public void anUnreadableStateIsUnknown() throws Exception {
        String unknown = "Android didn't say which links open here. Tap to check in Android's settings.";
        assertEquals("no answer", unknown, summaryFor(null));
        controller.close();
        assertEquals("refused", unknown, summaryFor(new SecurityException("no")));
        controller.close();
        assertEquals("system server gone", unknown, summaryFor(new RemoteException("gone")));
        controller.close();
        assertEquals("no addresses", unknown, summaryFor(state(true, new LinkedHashMap<>())));
        controller.close();
        assertEquals("a state newer than this code", unknown, summaryFor(state(true, hosts(SELECTED, 7))));
        controller.close();
        controller = null;
        Preference row = show(false).findPreference(KEY);
        assertEquals("no service", unknown, String.valueOf(row.getSummary()));
    }

    /** Coming back from Android's page shows what was chosen there. */
    @Test
    public void comingBackReadsTheStateAgain() throws Exception {
        answer = state(true, hosts(NONE, NONE));
        HushfacebookPreferenceFragment page = show(true);
        answer = state(true, hosts(SELECTED, SELECTED));
        controller.pause().resume();
        assertEquals("Facebook's web addresses are selected for this app in Android's settings, so their links open here.",
                String.valueOf(page.findPreference(KEY).getSummary()));
    }

    @Test
    public void aTapOpensOpenByDefaultForThisApp() throws Exception {
        answer = state(true, hosts(NONE, NONE));
        Preference row = show(true).findPreference(KEY);
        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        Intent started = shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull(started);
        assertEquals(android.provider.Settings.ACTION_APP_OPEN_BY_DEFAULT_SETTINGS, started.getAction());
        assertEquals("package:" + RuntimeEnvironment.getApplication().getPackageName(), started.getDataString());
    }

    /** A phone without the Open by default page gets the app's own page, which leads there. */
    @Test
    public void withoutOpenByDefaultTheAppsPageOpens() throws Exception {
        answer = state(true, hosts(NONE, NONE));
        Preference row = show(true).findPreference(KEY);
        shadowOf(RuntimeEnvironment.getApplication()).checkActivities(true);
        Intent details = new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                android.net.Uri.fromParts("package", RuntimeEnvironment.getApplication().getPackageName(), null));
        ResolveInfo settings = new ResolveInfo();
        settings.activityInfo = new android.content.pm.ActivityInfo();
        settings.activityInfo.packageName = "com.android.settings";
        settings.activityInfo.name = "com.android.settings.AppInfo";
        shadowOf(RuntimeEnvironment.getApplication().getPackageManager()).addResolveInfoForIntent(details, settings);
        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        Intent started = shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull(started);
        assertEquals(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, started.getAction());
        assertEquals(details.getDataString(), started.getDataString());
    }

    /** Android 11 has no selection to read: the row says so and opens the app's own page. */
    @Test
    @Config(sdk = 30)
    public void android11OpensTheAppsPage() throws Exception {
        Preference row = show(false).findPreference(KEY);
        assertEquals("Android 11 doesn't say which links open here. Tap to open this app's settings, then Open by default.",
                String.valueOf(row.getSummary()));
        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        Intent started = shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull(started);
        assertEquals(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, started.getAction());
        assertEquals("package:" + RuntimeEnvironment.getApplication().getPackageName(), started.getDataString());
    }

    /** With no settings page at all, a tap says so instead of closing Facebook. */
    @Test
    @Config(sdk = 30)
    public void withNoSettingsPageATapSaysSo() throws Exception {
        Preference row = show(false).findPreference(KEY);
        shadowOf(RuntimeEnvironment.getApplication()).checkActivities(true);
        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        ShadowLooper.idleMainLooper();
        assertNull(shadowOf(controller.get()).getNextStartedActivity());
        assertEquals("Android's settings for this app didn't open. Open App info from Facebook's icon, then Open by default.",
                ShadowToast.getTextOfLatestToast());
    }

    /**
     * The row sits under the two link switches and changes neither: selecting addresses in Android
     * decides which app gets a link, and the switches decide what Facebook does with one.
     */
    @Test
    public void theLinkSwitchesStayAsTheyAre() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.EXTERNAL_BROWSER, PatchFamily.SANITIZE_SHARING_LINKS);
        boolean external = !Settings.OPEN_LINKS_EXTERNALLY.defaultValue;
        boolean sanitize = !Settings.SANITIZE_SHARING_LINKS.defaultValue;
        Settings.OPEN_LINKS_EXTERNALLY.save(external);
        Settings.SANITIZE_SHARING_LINKS.save(sanitize);
        answer = state(true, hosts(NONE, NONE));
        HushfacebookPreferenceFragment page = show(true);
        Preference row = page.findPreference(KEY);
        PreferenceGroup links = row.getParent();
        assertEquals("Links", String.valueOf(links.getTitle()));
        assertEquals(Settings.OPEN_LINKS_EXTERNALLY.key, links.getPreference(0).getKey());
        assertEquals(Settings.SANITIZE_SHARING_LINKS.key, links.getPreference(1).getKey());
        assertEquals(row, links.getPreference(2));
        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        assertEquals(external, Settings.OPEN_LINKS_EXTERNALLY.get());
        assertEquals(sanitize, Settings.SANITIZE_SHARING_LINKS.get());
    }

    /** The row says that selecting addresses sends links here without making the build verified. */
    @Test
    public void theScreenExplainsWhatSelectingDoesntRestore() throws Exception {
        answer = state(true, hosts(NONE, NONE));
        PreferenceGroup links = show(true).findPreference(KEY).getParent();
        Preference explanation = links.getPreference(links.getPreferenceCount() - 1);
        assertFalse(explanation.isSelectable());
        assertTrue(String.valueOf(explanation.getSummary()), String.valueOf(explanation.getSummary())
                .contains("doesn't restore"));
    }
}
