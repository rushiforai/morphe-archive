/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import java.util.Arrays;
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
 * The Supported links row under Links: what Android says about sending Threads' web addresses to
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
        Settings.SANITIZE_SHARING_LINKS.resetToDefault();
    }

    private static Map<String, Integer> hosts(int threadsCom, int threadsNet) {
        Map<String, Integer> hosts = new LinkedHashMap<>();
        hosts.put("www.threads.com", threadsCom);
        hosts.put("www.threads.net", threadsNet);
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
    private HushThreadsPreferenceFragment show(boolean withService) throws ClassNotFoundException {
        controller = Robolectric.buildActivity(Activity.class).setup();
        if (withService) installService(controller.get().getBaseContext());
        HushThreadsPreferenceFragment fragment = new HushThreadsPreferenceFragment();
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

    // Ported diagnostic contracts from Hushfacebook 4d1fec1e and c7059151.
    private List<String> reportFor(Object answer) throws ClassNotFoundException {
        this.answer = answer;
        controller = Robolectric.buildActivity(Activity.class).setup();
        installService(controller.get().getBaseContext());
        return SupportedLinks.reportLines(controller.get());
    }

    @Test public void reportsEveryDomainInStableOrderWithExplicitUnknownStates() throws Exception {
        Map<String, Integer> hosts = new LinkedHashMap<>();
        hosts.put("z.threads.com", null);
        hosts.put("www.threads.com", SELECTED);
        hosts.put("*.threads.net", VERIFIED);
        hosts.put("m.threads.com", NONE);
        hosts.put("future.threads.com", 99);
        hosts.put("münchen.threads.com", SELECTED);
        hosts.put("ki\u0301.threads.com", SELECTED);
        assertEquals(Arrays.asList("availability: reported", "link_handling_allowed: true",
                "*.threads.net -> verified", "future.threads.com -> unknown", "ki\u0301.threads.com -> selected", "m.threads.com -> none",
                "münchen.threads.com -> selected", "www.threads.com -> selected", "z.threads.com -> unknown"),
                reportFor(state(true, hosts)));
        for (String name : askedFor) assertEquals(RuntimeEnvironment.getApplication().getPackageName(), name);
    }

    @Test public void disabledLinkHandlingDoesNotEraseDomainSelectionsOrChangeOwnership() throws Exception {
        Map<String, Integer> hosts = hosts(SELECTED, NONE);
        Map<String, Integer> before = new LinkedHashMap<>(hosts);
        assertEquals(Arrays.asList("availability: reported", "link_handling_allowed: false",
                "www.threads.com -> selected", "www.threads.net -> none"), reportFor(state(false, hosts)));
        assertEquals(before, hosts);
    }

    @Test public void anEmptyDomainMapIsDistinctFromAnUnreadableService() throws Exception {
        assertEquals(Arrays.asList("availability: reported", "link_handling_allowed: true", "domains: none_declared"),
                reportFor(state(true, new LinkedHashMap<>())));
    }

    @Test public void aNullServiceAnswerIsExplicitlyUnknown() throws Exception {
        assertEquals(Arrays.asList("availability: unknown", "link_handling_allowed: unknown", "domains: unknown"), reportFor(null));
    }

    @Test public void serviceFailuresDoNotPutTheirSensitiveMessageInReports() throws Exception {
        List<String> report = reportFor(new IllegalStateException("https://www.threads.com/private?account_id=999000111 certificate:AA:BB"));
        assertEquals(Arrays.asList("availability: unknown", "link_handling_allowed: unknown", "domains: unknown"), report);
    }

    @Test public void invalidHostDataCannotInjectUrlsAccountFieldsOrCertificateFields() throws Exception {
        Map<String, Integer> hosts = hosts(SELECTED, NONE);
        hosts.put("https://www.threads.com/private?account_id=999000111", VERIFIED);
        hosts.put("certificate:AA:BB", VERIFIED);
        hosts.put("account_id=999000111", VERIFIED);
        hosts.put("host\nvisited-url", VERIFIED);
        assertEquals(Arrays.asList("availability: reported", "link_handling_allowed: true",
                "domains: unknown (invalid host data)", "www.threads.com -> selected", "www.threads.net -> none"),
                reportFor(state(true, hosts)));
    }

    @Test @Config(sdk = {28, 30}) public void android11ReportsThatTheStateCannotBeRead() {
        assertEquals(Arrays.asList("availability: not_reported (API below 31)", "link_handling_allowed: not_reported",
                "domains: not_reported"), SupportedLinks.reportLines(RuntimeEnvironment.getApplication()));
        assertTrue(askedFor.isEmpty());
    }

    @Test
    public void everyAddressSelectedByHandOpensHere() throws Exception {
        assertEquals("Threads' web addresses are selected for this app in Android's settings, so their links open here.",
                summaryFor(state(true, hosts(SELECTED, SELECTED))));
        // This app's package and no other.
        assertFalse(askedFor.isEmpty());
        for (String name : askedFor) assertEquals(RuntimeEnvironment.getApplication().getPackageName(), name);
    }

    @Test
    public void selectedPostHostsDoNotRequireChatOrAccountCallbacks() throws Exception {
        Map<String, Integer> hosts = hosts(SELECTED, SELECTED);
        hosts.put("threads.com", SELECTED);
        hosts.put("chat.threads.com", NONE);
        hosts.put("www.chat.threads.com", NONE);
        hosts.put("chat.threads.net", NONE);
        hosts.put("familycenter.threads.com", NONE);
        hosts.put("instagram.com", NONE);
        Map<String, Integer> before = new LinkedHashMap<>(hosts);

        assertEquals("Threads' web addresses are selected for this app in Android's settings, so their links open here.",
                summaryFor(state(true, hosts)));
        List<String> report = SupportedLinks.reportLines(controller.get());
        assertTrue(report.contains("chat.threads.com -> none"));
        assertTrue(report.contains("www.chat.threads.com -> none"));
        assertTrue(report.contains("chat.threads.net -> none"));
        assertTrue(report.contains("familycenter.threads.com -> none"));
        assertTrue(report.contains("instagram.com -> none"));
        // Stock 450 doesn't declare bare threads.net. Don't require or invent its selection.
        assertFalse(report.stream().anyMatch(line -> line.startsWith("threads.net -> ")));
        assertEquals(before, hosts);
    }

    @Test
    public void selectedChatAndAccountCallbacksDoNotMakePostLinksSelected() throws Exception {
        Map<String, Integer> hosts = hosts(NONE, NONE);
        hosts.put("threads.com", NONE);
        hosts.put("chat.threads.com", SELECTED);
        hosts.put("familycenter.threads.com", VERIFIED);
        hosts.put("instagram.com", VERIFIED);

        assertEquals("None of Threads' web addresses are selected for this app, so their links open elsewhere. Tap to "
                + "select them in Android's settings.", summaryFor(state(true, hosts)));
    }

    @Test
    public void unreadableUnrelatedDomainsDoNotHideVerifiedPostHosts() throws Exception {
        Map<String, Integer> hosts = hosts(VERIFIED, VERIFIED);
        hosts.put("threads.com", VERIFIED);
        hosts.put("chat.threads.com", null);
        hosts.put("instagram.com", 99);

        assertEquals("Android verified this app for Threads' web addresses, so their links open here.",
                summaryFor(state(true, hosts)));
        List<String> report = SupportedLinks.reportLines(controller.get());
        assertTrue(report.contains("chat.threads.com -> unknown"));
        assertTrue(report.contains("instagram.com -> unknown"));
    }

    @Test
    public void aMapWithoutPostHostsDoesNotClaimThatPostLinksOpenHere() throws Exception {
        Map<String, Integer> hosts = new LinkedHashMap<>();
        hosts.put("chat.threads.com", SELECTED);
        hosts.put("instagram.com", VERIFIED);

        assertEquals("Android didn't say which links open here. Tap to check in Android's settings.",
                summaryFor(state(true, hosts)));
    }

    @Test
    public void bareThreadsNetCountsIfAndroidReportsItAsDeclared() throws Exception {
        Map<String, Integer> hosts = hosts(SELECTED, SELECTED);
        hosts.put("threads.com", SELECTED);
        hosts.put("threads.net", NONE);

        assertEquals("Only some of Threads' web addresses are selected for this app, and links to the rest open "
                + "elsewhere. Tap to select them in Android's settings.", summaryFor(state(true, hosts)));
        assertTrue(SupportedLinks.reportLines(controller.get()).contains("threads.net -> none"));
    }

    @Test
    public void someAddressesSelected() throws Exception {
        assertEquals("Only some of Threads' web addresses are selected for this app, and links to the rest open "
                + "elsewhere. Tap to select them in Android's settings.", summaryFor(state(true, hosts(SELECTED, NONE))));
    }

    @Test
    public void noAddressSelected() throws Exception {
        assertEquals("None of Threads' web addresses are selected for this app, so their links open elsewhere. Tap to "
                + "select them in Android's settings.", summaryFor(state(true, hosts(NONE, NONE))));
    }

    /** What a build with Meta's own signature, such as a Root Mount install, gets. */
    @Test
    public void verifiedAddresses() throws Exception {
        assertEquals("Android verified this app for Threads' web addresses, so their links open here.",
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
        HushThreadsPreferenceFragment page = show(true);
        answer = state(true, hosts(SELECTED, SELECTED));
        controller.pause().resume();
        assertEquals("Threads' web addresses are selected for this app in Android's settings, so their links open here.",
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
        assertEquals("Android 11 and older don't say which links open here. Tap to open this app's settings, then Open by default.",
                String.valueOf(row.getSummary()));
        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        Intent started = shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull(started);
        assertEquals(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, started.getAction());
        assertEquals("package:" + RuntimeEnvironment.getApplication().getPackageName(), started.getDataString());
    }

    /** With no settings page at all, a tap says so instead of closing Threads. */
    @Test
    @Config(sdk = 30)
    public void withNoSettingsPageATapSaysSo() throws Exception {
        Preference row = show(false).findPreference(KEY);
        shadowOf(RuntimeEnvironment.getApplication()).checkActivities(true);
        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        ShadowLooper.idleMainLooper();
        assertNull(shadowOf(controller.get()).getNextStartedActivity());
        assertEquals("Android's settings for this app didn't open. Open App info from Threads' icon, then Open by default.",
                ShadowToast.getTextOfLatestToast());
    }

    /**
     * The row changes no switch: selecting addresses in Android decides which app gets a link, and
     * Remove tracking from shared links, under Privacy, decides what Threads does with one it shares.
     */
    @Test
    public void theLinkSwitchStaysAsItIs() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.SANITIZE_SHARING_LINKS);
        boolean sanitize = !Settings.SANITIZE_SHARING_LINKS.defaultValue;
        Settings.SANITIZE_SHARING_LINKS.save(sanitize);
        answer = state(true, hosts(NONE, NONE));
        HushThreadsPreferenceFragment page = show(true);
        Preference row = page.findPreference(KEY);
        PreferenceGroup links = row.getParent();
        assertEquals("Links", String.valueOf(links.getTitle()));
        assertEquals(row, links.getPreference(0));
        PreferenceGroup privacy = page.findPreference(Settings.SANITIZE_SHARING_LINKS.key).getParent();
        assertEquals("Privacy", String.valueOf(privacy.getTitle()));
        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        assertEquals(sanitize, Settings.SANITIZE_SHARING_LINKS.get());
    }

    /** The row says that selecting addresses sends links here without making the build verified. */
    @Test
    public void theScreenExplainsWhatSelectingChanges() throws Exception {
        answer = state(true, hosts(NONE, NONE));
        PreferenceGroup links = show(true).findPreference(KEY).getParent();
        Preference explanation = links.getPreference(links.getPreferenceCount() - 1);
        assertFalse(explanation.isSelectable());
        String summary = String.valueOf(explanation.getSummary());
        assertTrue(summary, summary.contains("Selecting the addresses sends their links here instead"));
        assertTrue(summary, summary.contains("Your other link settings stay as they are"));
    }

    /**
     * Beside a Meta-signed Instagram, the Links page ends with a line saying Instagram won't open
     * posts here (#8). With no Instagram, or one carrying this build's key, the page is as before.
     */
    @Test
    public void aMetaSignedInstagramGetsALineOnTheLinksPage() throws Exception {
        String title = "Instagram won't open posts here";
        answer = state(true, hosts(NONE, NONE));
        signWith(RuntimeEnvironment.getApplication().getPackageName(), new android.content.pm.Signature("308201a0b1c2d3"));
        assertFalse("the line showed with no Instagram", hasTitle(show(true).findPreference(KEY).getParent(), title));
        controller.close();

        signWith("com.instagram.android", new android.content.pm.Signature("308201a0b1c2d3"));
        assertFalse("the line showed beside a same-key Instagram", hasTitle(show(true).findPreference(KEY).getParent(), title));
        controller.close();

        java.lang.reflect.Field encoded = app.morphe.extension.hushthreads.misc.ThreadsSignature.class
                .getDeclaredField("INSTAGRAM_CERTIFICATE");
        encoded.setAccessible(true);
        signWith("com.instagram.android", new android.content.pm.Signature(
                android.util.Base64.decode((String) encoded.get(null), android.util.Base64.DEFAULT)));
        PreferenceGroup links = show(true).findPreference(KEY).getParent();
        Preference line = links.getPreference(links.getPreferenceCount() - 1);
        assertEquals(title, String.valueOf(line.getTitle()));
        assertFalse(line.isSelectable());
        String summary = String.valueOf(line.getSummary());
        assertTrue(summary, summary.contains("only opens Threads posts and profiles in a Threads signed by Meta"));
        // The way that works (seen on a phone 2026-11-13): Instagram patched with HushGram on the same key.
        assertTrue(summary, summary.contains("Patch Instagram with HushGram, signed with the same key as HushThreads"));
    }

    private static boolean hasTitle(PreferenceGroup group, String title) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            if (title.equals(String.valueOf(group.getPreference(i).getTitle()))) return true;
        }
        return false;
    }

    /**
     * Installs [packageName], or for this app its own installed info, with [certificate] as its
     * current signer, the way PackageManager fills it in for GET_SIGNING_CERTIFICATES.
     */
    private static void signWith(String packageName, android.content.pm.Signature certificate) throws Exception {
        android.content.pm.PackageManager packages = RuntimeEnvironment.getApplication().getPackageManager();
        android.content.pm.PackageInfo info;
        try {
            // Its components too, so replacing the info leaves the app's activities and providers declared.
            info = packages.getPackageInfo(packageName, android.content.pm.PackageManager.GET_ACTIVITIES
                    | android.content.pm.PackageManager.GET_SERVICES | android.content.pm.PackageManager.GET_PROVIDERS
                    | android.content.pm.PackageManager.GET_RECEIVERS | android.content.pm.PackageManager.GET_META_DATA);
        } catch (android.content.pm.PackageManager.NameNotFoundException missing) {
            info = new android.content.pm.PackageInfo();
            info.packageName = packageName;
            info.applicationInfo = new android.content.pm.ApplicationInfo();
            info.applicationInfo.packageName = packageName;
            info.applicationInfo.uid = 12345;
        }
        android.content.pm.SigningInfo signing = new android.content.pm.SigningInfo();
        ((org.robolectric.shadows.ShadowSigningInfo) Shadow.extract(signing))
                .setSignatures(new android.content.pm.Signature[]{certificate});
        info.signingInfo = signing;
        shadowOf(packages).installPackage(info);
    }
}
