/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import android.content.pm.verify.domain.DomainVerificationManager;
import android.content.pm.verify.domain.DomainVerificationUserState;
import android.os.Process;
import android.os.UserHandle;
import org.robolectric.shadows.ShadowContextImpl;
import org.robolectric.util.ReflectionHelpers;
import org.robolectric.util.ReflectionHelpers.ClassParameter;
import java.lang.reflect.Proxy;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.ClipboardManager;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowSigningInfo;
import org.robolectric.shadow.api.Shadow;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

import app.morphe.extension.hushthreads.misc.Analytics;
import app.morphe.extension.hushthreads.misc.ThreadsSignature;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;
import app.morphe.extension.shared.settings.preference.LogBufferManagerExportTest;

/**
 * Bug reports used to come without a report: with nothing logged and no hook missing anything, the
 * export said there was nothing to report and told the reader to turn on Debug logging. A report
 * asked for now always carries the facts a maintainer asks for first: the app's package, version
 * code, Android API and user, ABI, HushThreads's version, whether it's paused, which patches
 * the build carries and what each hook has counted. Debug logging stays off here, both exports
 * are read, and nothing is sent anywhere.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SupportReportTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.registerDiagnostics();
        BaseSettings.DEBUG.save(false);
        BaseSettings.DEBUG_LOG_FILTERS.resetToDefault();
        LogBufferManager.clearLogBuffer();
        HookStatus.clear();
    }

    @After
    public void tearDown() {
        PatchFamily.inBuildForTests = null;
        PauseForTests.resume();
        BaseSettings.DEBUG.resetToDefault();
        LogBufferManager.clearLogBuffer();
        HookStatus.clear();
    }

    /** The clipboard copy and the saved file of one report, in that order. */
    private static String[] bothExports() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        String copied = copyReport();

        if (Build.VERSION.SDK_INT < 29) {
            File folder = new File(context.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS), "Morphe");
            Set<String> previous = new HashSet<>();
            File[] files = folder.listFiles();
            if (files != null) for (File file : files) previous.add(file.getName());
            LogBufferManager.exportToFile();
            Utils.awaitBackgroundTasksForTests();
            ShadowLooper.idleMainLooper();
            List<File> created = new ArrayList<>();
            files = folder.listFiles();
            if (files != null) for (File file : files) {
                if (!previous.contains(file.getName()) && file.getName().endsWith(".txt")) created.add(file);
            }
            assertTrue("exactly one new report was saved", created.size() == 1);
            return new String[]{copied, new String(Files.readAllBytes(created.get(0).toPath()), StandardCharsets.UTF_8)};
        }

        LogBufferManagerExportTest.Downloads downloads = Robolectric.setupContentProvider(
                LogBufferManagerExportTest.Downloads.class, MediaStore.AUTHORITY);
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(
                android.content.ContentUris.withAppendedId(MediaStore.Downloads.EXTERNAL_CONTENT_URI, 1), body);
        LogBufferManager.exportToFile();
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        return new String[]{copied, body.toString(StandardCharsets.UTF_8.name())};
    }

    private static String copyReport() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        ClipboardManager clipboard = context.getSystemService(ClipboardManager.class);
        LogBufferManager.exportToClipboard();
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        return String.valueOf(clipboard.getPrimaryClip().getItemAt(0).getText());
    }

    /** What every report asked for carries, whatever went right or wrong. */
    private static void assertBuildFacts(String report) {
        String packageName = RuntimeEnvironment.getApplication().getPackageName();
        assertTrue(report, report.startsWith("MORPHE DIAGNOSTIC REPORT\n"));
        assertTrue("no package or version code: " + report,
                Pattern.compile("\napp: " + Pattern.quote(packageName) + " \\S+ \\(\\d+\\)\n").matcher(report).find());
        assertTrue("no API level or profile: " + report, report.contains(
                "\nandroid: API " + Build.VERSION.SDK_INT + " (" + Build.VERSION.RELEASE + "), user "));
        assertTrue("no ABI: " + report, report.contains("\nabi: app "));
        assertTrue("no HushThreads bundle version: " + report, report.contains("\nhushthreads_bundle: "));
        assertFalse("bundle mislabeled as Manager: " + report, report.contains("\nmorphe: "));
        assertTrue(report, report.contains("\npatch_build: unknown\n"));
        for (String fact : new String[]{"installing_package", "initiating_package", "originating_package",
                "current_signer_classification", "current_signer_sha256"}) {
            assertTrue("missing installation fact: " + report, report.contains("\n" + fact + ": "));
        }
        assertTrue("Debug logging's state is missing: " + report, report.contains("\ndebug_logging: off\n"));
        assertTrue("no patch list: " + report, report.contains("\n[PATCHES]\n"));
        assertTrue(report, report.contains("\nHide ads: on (hushthreads_hide_ads=on)\n"));
        assertFalse("events without Debug logging: " + report, report.contains("[SELECTED EVENTS]"));
    }

    // Ported file/clipboard contracts from Hushfacebook 4d1fec1e and c7059151.
    @Test @Config(sdk = 31)
    public void bothExportsContainSortedDomainsWithoutChangingTheAppsLinkOwnership() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Map<String, Integer> hosts = new LinkedHashMap<>();
        hosts.put("www.threads.com", DomainVerificationUserState.DOMAIN_STATE_SELECTED);
        hosts.put("m.threads.com", DomainVerificationUserState.DOMAIN_STATE_NONE);
        hosts.put("z\u0301.threads.com", DomainVerificationUserState.DOMAIN_STATE_SELECTED);
        DomainVerificationUserState user = ReflectionHelpers.callConstructor(DomainVerificationUserState.class,
                ClassParameter.from(UUID.class, UUID.randomUUID()), ClassParameter.from(String.class, context.getPackageName()),
                ClassParameter.from(UserHandle.class, Process.myUserHandle()), ClassParameter.from(boolean.class, false),
                ClassParameter.from(Map.class, hosts));
        Class<?> binder = Class.forName("android.content.pm.verify.domain.IDomainVerificationManager");
        AtomicInteger reads = new AtomicInteger();
        Object service = Proxy.newProxyInstance(binder.getClassLoader(), new Class<?>[]{binder}, (proxy, method, args) -> {
            assertTrue("ownership-changing or unrelated API call", method.getName().equals("getDomainVerificationUserState"));
            assertTrue("another package was queried", context.getPackageName().equals(args[0]));
            reads.incrementAndGet();
            return user;
        });
        DomainVerificationManager manager = ReflectionHelpers.callConstructor(DomainVerificationManager.class,
                ClassParameter.from(Context.class, context), ClassParameter.from(binder, service));
        ShadowContextImpl shadow = Shadow.extract(RuntimeEnvironment.getApplication().getBaseContext());
        shadow.setSystemService(Context.DOMAIN_VERIFICATION_SERVICE, manager);
        PatchFamily.registerDiagnostics();
        for (String report : bothExports()) {
            assertBuildFacts(report);
            assertTrue(report, report.contains("\nlink_handling_allowed: false\nm.threads.com -> none\nwww.threads.com -> selected\n"));
            assertTrue("combining-mark domain omitted or redacted", report.contains("\nz\u0301.threads.com -> selected\n"));
            assertTrue("duplicate supported-link section", report.indexOf("[SUPPORTED LINKS]") == report.lastIndexOf("[SUPPORTED LINKS]"));
            assertFalse(report.contains("http://") || report.contains("https://") || report.contains("certificate:"));
        }
        BaseSettings.DEBUG_LOG_FILTERS.save("feed");
        LogBufferManager.persistCrashReport(context, "java.io.IOException: " + "long trace ".repeat(10_000));
        for (String report : bothExports()) {
            assertTrue("event filters or a long crash hid link state", report.contains(
                    "\nlink_handling_allowed: false\nm.threads.com -> none\nwww.threads.com -> selected\n"));
            assertFalse("patch sections ignored the selected filter", report.contains("[PATCHES]"));
            assertTrue("combining-mark domain omitted or redacted", report.contains("\nz\u0301.threads.com -> selected\n"));
            assertTrue("link state follows a potentially truncated crash", report.indexOf("[SUPPORTED LINKS]") < report.indexOf("[LATEST JAVA CRASH]"));
        }
        assertTrue("both report paths must query the live state", reads.get() >= 2);
    }

    @Test @Config(sdk = {28, 30})
    public void androidBelow31KeepsTheNotReportedStateWithAnEventsOnlyFilter() throws Exception {
        BaseSettings.DEBUG_LOG_FILTERS.save("feed");
        for (String report : bothExports()) {
            assertTrue(report.contains("[SUPPORTED LINKS]\navailability: not_reported (API below 31)"));
            assertFalse(report.contains("[PATCHES]"));
        }
    }

    @Test
    public void aHealthyRunStillGivesAReport() throws Exception {
        for (String report : bothExports()) {
            assertBuildFacts(report);
            assertTrue("the Pause state is missing: " + report, report.contains("\nhushthreads: running\n"));
            assertFalse("a healthy run reported hook findings: " + report, report.contains("[HOOK STATUS]"));
        }
    }

    /**
     * A hook that ran says how often and what it did, with nothing logged: here Threads built three
     * analytics upload addresses and each was replaced. The report says so without Debug logging.
     */
    @Test
    public void aHookThatRanSaysWhatItCounted() throws Exception {
        for (int i = 0; i < 3; i++) Analytics.endpoint("https://graph.threads.net/logging_client_events");

        for (String report : bothExports()) {
            assertBuildFacts(report);
            assertTrue(report, report.contains("\n[HOOK STATUS]\nDisable analytics: invoked 3, 0 found, 0 missing. "
                    + "Counted: upload address replaced 3\n"));
        }
    }

    @Test
    public void aPausedRunSaysSo() throws Exception {
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        for (String report : bothExports()) {
            assertTrue(report, report.contains("\nhushthreads: paused (switch)"));
            assertTrue(report, report.contains("\nHide ads: disabled while paused (saved hushthreads_hide_ads=on)\n"));
        }
    }

    private static PackageInfo currentSigners(Signature... certificates) {
        Context context = RuntimeEnvironment.getApplication();
        PackageInfo installed = Shadows.shadowOf(context.getPackageManager())
                .getInternalMutablePackageInfo(context.getPackageName());
        SigningInfo signing = new SigningInfo();
        ((ShadowSigningInfo) Shadow.extract(signing)).setSignatures(certificates);
        installed.signingInfo = signing;
        return installed;
    }

    @Test @Config(sdk = {28, 30})
    public void reportsCurrentSignersWithoutPastCertificatesOrUnrelatedApps() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        PackageInfo installed = currentSigners(new Signature("01020304"));
        ((ShadowSigningInfo) Shadow.extract(installed.signingInfo))
                .setPastSigningCertificates(new Signature[]{new Signature("05060708")});
        PackageInfo unrelated = new PackageInfo();
        unrelated.packageName = "private.unrelated.app";
        unrelated.signatures = new Signature[]{new Signature("05060708")};
        Shadows.shadowOf(context.getPackageManager()).installPackage(unrelated);
        for (String report : Build.VERSION.SDK_INT >= 29 ? bothExports() : new String[]{copyReport()}) {
            assertTrue(report, report.contains("\ncurrent_signer_classification: non-Meta current certificate\n"));
            assertTrue(report, report.contains("\ncurrent_signer_sha256: "
                    + "9f64a747e1b97f131fabb6b447296c9b6f0201e79fb3c5356e6c77e89b6a806a\n"));
            assertFalse(report, report.contains("private.unrelated.app"));
            assertFalse(report, report.contains("55e5509f8052998294266ee5b50cb592938191fb5d67f73cac2e60b0276b1bdd"));
            assertFalse(report, report.contains("01020304"));
            assertFalse(report, report.contains("05060708"));
        }
    }

    @Test @Config(sdk = 28)
    public void android9ReportsOnlyTheAvailableInstaller() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        context.getPackageManager().setInstallerPackageName(
                context.getPackageName(), "com.android.shell");
        String report = copyReport();
        assertTrue(report, report.contains("\ninstalling_package: com.android.shell\n"));
        assertTrue(report, report.contains("\ninitiating_package: unknown (API below 30)\n"));
        assertTrue(report, report.contains("\noriginating_package: unknown (API below 30)\n"));
        assertFalse(report, report.contains("Shizuku"));
        assertFalse(report, report.contains("work profile"));
    }

    @Test
    public void android11ReportsInstallerAndInitiatorSeparately() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(context.getPackageManager()).setInstallSourceInfo(
                context.getPackageName(), "app.morphe.manager", "com.android.shell");
        for (String report : bothExports()) {
            assertTrue(report, report.contains("\ninstalling_package: com.android.shell\n"));
            assertTrue(report, report.contains("\ninitiating_package: app.morphe.manager\n"));
            assertTrue(report, report.contains("\noriginating_package: unknown (not recorded)\n"));
            assertFalse(report, report.contains("Shizuku"));
        }
    }

    @Test @Config(sdk = 36)
    public void reportsAvailableOriginWithoutLookingUpThatApp() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(context.getPackageManager()).setInstallSourceInfo(context.getPackageName(),
                "app.morphe.manager", null, "com.example.source", "com.android.shell", null, 0);
        String report = copyReport();
        assertTrue(report, report.contains("\noriginating_package: com.example.source\n"));
    }

    @Test
    public void recognizesTheKnownMetaCertificateWithoutExportingIt() throws Exception {
        PackageInfo meta = new PackageInfo();
        meta.packageName = "com.instagram.barcelona";
        meta.applicationInfo = new android.content.pm.ApplicationInfo();
        meta.applicationInfo.packageName = meta.packageName;
        meta.applicationInfo.uid = android.os.Process.myUid();
        Signature certificate = ThreadsSignature.originalSigners(meta).get(0);
        currentSigners(certificate);
        String report = copyReport();
        assertTrue(report, report.contains("\ncurrent_signer_classification: known Meta Threads certificate\n"));
        assertTrue(report, report.contains("\ncurrent_signer_sha256: "
                + "5367570bad488d8da6a0fab78d9766a1a4c23c3c70fac0ad2e91c8f0bd58b432\n"));
        assertFalse(report, report.contains(certificate.toCharsString()));
        assertFalse(report, report.contains("Meta Platforms"));
        assertFalse(report, report.contains(RuntimeEnvironment.getApplication().getFilesDir().getAbsolutePath()));
    }

    @Test @Config(sdk = {28, 30})
    public void missingAndMultipleCertificatesAreExplicit() throws Exception {
        currentSigners().signingInfo = null;
        assertTrue(copyReport().contains("\ncurrent_signer_sha256: unknown (missing current certificates)\n"));
        currentSigners();
        assertTrue(copyReport().contains("\ncurrent_signer_sha256: unknown (missing current certificates)\n"));
        currentSigners(new Signature("01020304"), new Signature("05060708"));
        String report = copyReport();
        assertTrue(report, report.contains("\ncurrent_signer_classification: multiple current certificates\n"));
        assertTrue(report, Pattern.compile("\ncurrent_signer_sha256: [a-f0-9]{64},[a-f0-9]{64}\n")
                .matcher(report).find());
    }

    @Test
    public void oversizedAndInvalidCertificatesNeverLeakPartialData() throws Exception {
        Signature valid = new Signature("01020304");
        currentSigners(valid, valid, valid, valid, valid);
        assertTrue(copyReport().contains("\ncurrent_signer_sha256: unknown (too many current certificates)\n"));
        currentSigners(valid, null);
        assertTrue(copyReport().contains("\ncurrent_signer_sha256: unknown (invalid current certificate)\n"));
        currentSigners(new Signature(new byte[65_537]));
        assertTrue(copyReport().contains("\ncurrent_signer_sha256: unknown (invalid current certificate)\n"));
    }

    @Test @Config(sdk = {28, 30})
    public void unavailableSourceAndCertificateQueriesDoNotStopTheExport() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(context.getPackageManager()).removePackage(context.getPackageName());
        String report = copyReport();
        assertTrue(report, report.contains("\ncurrent_signer_sha256: unknown (error)\n"));
        assertTrue(report, report.contains("\ninstalling_package: unknown ("));
        assertFalse(report, report.contains(context.getFilesDir().getAbsolutePath()));
    }

    @Test
    public void untrustedSourceNamesAreBoundedAndCannotInjectReportFields() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(context.getPackageManager()).setInstallSourceInfo(
                context.getPackageName(), "/data/private/account.token", "com.android.shell\npassword=secret");
        BaseSettings.DEBUG_LOG_FILTERS.save("crashes");
        String report = copyReport();
        assertTrue(report, report.contains("\ninstalling_package: unknown (invalid package name)\n"));
        assertTrue(report, report.contains("\ninitiating_package: unknown (invalid package name)\n"));
        assertFalse(report, report.contains("account.token"));
        assertFalse(report, report.contains("password"));
        Shadows.shadowOf(context.getPackageManager()).setInstallSourceInfo(
                context.getPackageName(), null, "a".repeat(201));
        assertTrue(copyReport().contains("\ninstalling_package: unknown (invalid package name)\n"));
    }

    @Test @Config(sdk = {28, 30, 36})
    public void bothExportsRemovePathsFromEventsAndBothCrashSections() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        currentSigners(new Signature("01020304"));
        for (boolean debug : new boolean[]{false, true}) {
            LogBufferManager.clearLogBuffer();
            BaseSettings.DEBUG.save(debug);
            BaseSettings.DEBUG_LOG_FILTERS.save("all");
            LogBufferManager.appendEvent(DiagnosticCategory.OTHER, "FileProbe", "ERROR",
                    "Android file: /storage/emulated/0/Download/private android report.txt\n"
                            + "Unix file: /home/example/Private folder/private unix report.txt\n"
                            + "URI: file:///storage/emulated/0/Download/private uri report.txt\n"
                            + "Windows file: C:\\Users\\Example Name\\private windows report.txt\n"
                            + "UNC file: \\\\server\\Shared Files\\private unc report.txt\n"
                            + "{\"path\":\"\\/storage\\/emulated\\/0\\/private escaped report.txt\"}");
            LogBufferManager.persistCrashReport(context,
                    "java.io.FileNotFoundException: /storage/emulated/0/Download/private java report.txt\n"
                            + "\tat app.morphe.extension.hushthreads.settings.ReleaseTransport.get(ReleaseTransport.java:120)\n");
            LogBufferManager.persistNpthCrashReport(context,
                    "backtrace:\n#00 pc 0000000000012345 /data/app/example/lib/arm64/private native library.so\n"
                            + "map: \"C:\\\\Users\\\\Example Name\\\\private map file.txt\"\n");
            for (String report : bothExports()) {
                assertTrue(report, report.contains("[SELECTED EVENTS]"));
                assertTrue(report, report.contains("[LATEST JAVA CRASH]"));
                assertTrue(report, report.contains("[LATEST NATIVE CRASH SIGNAL]"));
                assertTrue(report, report.contains("[path omitted]"));
                for (String value : new String[]{"private android", "private unix", "private uri",
                        "private windows", "private unc", "private escaped", "private java", "private native",
                        "private map", "Example Name", "/storage/", "/home/", "/data/app/"}) {
                    assertFalse(value + " escaped into " + report, report.contains(value));
                }
                assertTrue(report, report.contains("ReleaseTransport.get(ReleaseTransport.java:120)"));
                assertTrue(report, report.contains("\napp: " + context.getPackageName() + " "));
                assertTrue(report, report.contains("\ncurrent_signer_sha256: "
                        + "9f64a747e1b97f131fabb6b447296c9b6f0201e79fb3c5356e6c77e89b6a806a\n"));
                assertTrue(report, report.contains("\ndebug_logging: " + (debug ? "on" : "off") + "\n"));
            }
        }
    }
}
