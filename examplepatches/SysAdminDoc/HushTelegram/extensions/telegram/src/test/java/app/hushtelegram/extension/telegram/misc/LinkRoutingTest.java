/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowPackageManager;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Real URI/intent behavior with the discovered account-domain policy replaced for the sandbox. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = LinkRoutingTest.HostProtection.class,
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class LinkRoutingTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private final Uri tracked = Uri.parse("https://example.com/p%2Fart?utm_source=a%2Bb&utm_campaign=c&fbclid=z#same%20anchor");
    private Context context;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        HostProtection.protectedLink = false;
        HostProtection.fail = false;
        Settings.OPEN_EXTERNAL_LINKS.resetToDefault();
        Settings.STRIP_LINK_TRACKING.resetToDefault();
        HookStatus.clear();
        while (shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity() != null) { }
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.OPEN_EXTERNAL_LINKS);
        SettingReadsForTests.mend(Settings.STRIP_LINK_TRACKING);
        Settings.OPEN_EXTERNAL_LINKS.resetToDefault();
        Settings.STRIP_LINK_TRACKING.resetToDefault();
        HookStatus.clear();
    }

    @Test public void cleaningDefaultsOffAndRoutingDefaultsOn() {
        assertFalse(Settings.STRIP_LINK_TRACKING.get());
        assertTrue(Settings.OPEN_EXTERNAL_LINKS.get());
        assertSame(tracked, LinkRouting.cleanOpenedUri(tracked, false, new boolean[1]));
        Intent share = share(tracked.toString());
        assertSame(share, LinkRouting.cleanShareIntent(share));
        assertNoCount();
    }

    @Test public void cleaningKeepsPathFragmentBytesAndOriginalObjects() {
        Settings.STRIP_LINK_TRACKING.save(true);
        Uri result = LinkRouting.cleanOpenedUri(tracked, false, new boolean[1]);
        assertEquals("https://example.com/p%2Fart#same%20anchor", result.toString());
        assertEquals("https://example.com/p%2Fart?utm_source=a%2Bb&utm_campaign=c&fbclid=z#same%20anchor", tracked.toString());
        Intent original = share(tracked.toString()).putExtra("unchanged", "value");
        Intent copied = LinkRouting.cleanShareIntent(original);
        assertNotSame(original, copied);
        assertEquals(tracked.toString(), original.getStringExtra(Intent.EXTRA_TEXT));
        assertEquals(result.toString(), copied.getStringExtra(Intent.EXTRA_TEXT));
        assertEquals("value", copied.getStringExtra("unchanged"));
        assertTrue(HookStatus.report().toString().contains("opened URLs cleaned 1"));
        assertTrue(HookStatus.report().toString().contains("shared URLs cleaned 1"));
    }

    @Test public void onlyTheSevenExactKeysCanChangeAQuery() {
        Settings.STRIP_LINK_TRACKING.save(true);
        for (String key : new String[]{"utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content", "gclid", "fbclid"}) {
            assertEquals("https://example.com/", LinkRouting.cleanOpenedUri(Uri.parse("https://example.com/?" + key + "=x"), false, new boolean[1]).toString());
        }
        HookStatus.clear();
        for (String query : new String[]{"id=4&utm_source=x", "utm_source=x&unknown=preserved", "UTM_SOURCE=x",
                "%75tm_source=x", "utm_source=x;id=4", "sig=x&utm_source=x", "token=x&utm_source=x",
                "code=x&utm_source=x", "state=x&utm_source=x", "X-Amz-Signature=x&utm_source=x",
                "opaqueSignature=x&utm_source=x", "utm_source=x&%74oken=y"}) {
            // A semicolon may be a service's parameter delimiter; never remove a mixed segment.
            Uri uri = Uri.parse("https://example.com/?" + query);
            assertSame(query, uri, LinkRouting.cleanOpenedUri(uri, false, new boolean[1]));
        }
        assertNoCount();
    }

    @Test public void nativeLoginPaymentAndAuthenticatedLinksKeepBothStockPaths() {
        Settings.STRIP_LINK_TRACKING.save(true);
        registerBrowser("org.example.browser", null);
        for (String url : new String[]{"tg://resolve?domain=user", "https://t.me/+invite?utm_source=x",
                "https://telegram.org/login?utm_source=x", "https://fragment.com/item?utm_source=x",
                "tonsite://site.ton/?utm_source=x", "https://site.ton/?utm_source=x",
                "https://example.com/oauth/callback?utm_source=x", "https://example.com/auth?utm_source=x",
                "https://example.com/login?utm_source=x", "https://example.com/%6cogin?utm_source=x",
                "https://example.com/payment?utm_source=x", "https://example.com/payments/start?utm_source=x",
                "https://example.com/checkout?utm_source=x", "https://example.com/?autologin_token=x&utm_source=y",
                "https://user:pass@example.com/?utm_source=x", "https://example.com/?utm_source=x#token=secret",
                "https://example.com/?utm_source=x#/auth", "https://example.com/?utm_source=x#code%3Dsecret"}) {
            Uri uri = Uri.parse(url);
            assertSame(url, uri, LinkRouting.cleanOpenedUri(uri, false, new boolean[1]));
            Intent originalShare = shareUri(uri);
            assertSame(url, originalShare, LinkRouting.cleanShareIntent(originalShare));
            assertFalse(url, LinkRouting.tryOpenExternal(context, uri, false, new boolean[1], null));
        }
        assertNoCount();
        assertEquals(null, shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity());
    }

    @Test public void messagesMultiUrlSharesFilesAndOtherActionsStayIdentical() {
        Settings.STRIP_LINK_TRACKING.save(true);
        for (Intent intent : new Intent[]{share("Read " + tracked), share(tracked + "\nhttps://example.org/"),
                share(" " + tracked), share(tracked.toString()).putExtra(Intent.EXTRA_STREAM, Uri.parse("content://test/file")),
                share(tracked.toString()).putExtra(Intent.EXTRA_HTML_TEXT, "<a>link</a>"),
                share(tracked.toString()).setPackage("org.telegram.messenger"),
                share(tracked.toString()).setAction(Intent.ACTION_SEND_MULTIPLE),
                share(tracked.toString()).setType("text/html")}) {
            assertSame(intent, LinkRouting.cleanShareIntent(intent));
        }
        assertNoCount();
    }

    @Test public void nativeClassifierFlagsAndAccountDomainGuardFailOpen() {
        Settings.STRIP_LINK_TRACKING.save(true);
        assertSame(tracked, LinkRouting.cleanOpenedUri(tracked, true, new boolean[1]));
        assertSame(tracked, LinkRouting.cleanOpenedUri(tracked, false, new boolean[]{true}));
        assertSame(tracked, LinkRouting.cleanOpenedUri(tracked, false, null));
        assertFalse(LinkRouting.tryOpenExternal(context, tracked, true, new boolean[1], null));
        HostProtection.protectedLink = true;
        assertStock();
        HostProtection.protectedLink = false;
        HostProtection.fail = true;
        assertStock();
        assertNoCount();
    }

    @Test public void switchOffEveryPauseAndSettingsFailureRetainStockObjectsAndLaunchNothing() {
        registerBrowser("org.example.browser", null);
        Settings.OPEN_EXTERNAL_LINKS.save(false);
        Settings.STRIP_LINK_TRACKING.save(false);
        assertStock();
        Settings.OPEN_EXTERNAL_LINKS.save(true);
        Settings.STRIP_LINK_TRACKING.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertStock();
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(this::assertStock);
        SettingReadsForTests.breakReads(Settings.OPEN_EXTERNAL_LINKS);
        SettingReadsForTests.breakReads(Settings.STRIP_LINK_TRACKING);
        assertStock();
        assertNoCount();
    }

    @Test public void browsersAreResolvedLocallyAndDomainBoundAppsAreExcluded() {
        registerBrowser("org.example.browser", null);
        registerBrowser("org.example.verifiedapp", "example.com");
        assertTrue(LinkRouting.tryOpenExternal(context, tracked, false, new boolean[1], "org.example.browser"));
        Intent launched = shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity();
        assertEquals(Intent.ACTION_VIEW, launched.getAction());
        assertEquals("org.example.browser", launched.getPackage());
        assertEquals(tracked, launched.getData());
        assertTrue((launched.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        assertFalse(LinkRouting.tryOpenExternal(context, tracked, false, new boolean[1], "org.example.verifiedapp"));
        assertFalse(LinkRouting.tryOpenExternal(context, tracked, false, new boolean[1], "missing.browser"));
        assertEquals(null, shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity());
    }

    @Test public void missingBrowserRetainsStockAndMultipleBrowsersUseOnlyExplicitBrowserIntents() {
        assertFalse(LinkRouting.tryOpenExternal(context, tracked, false, new boolean[1], null));
        registerBrowser("org.example.first", null);
        registerBrowser("org.example.second", null);
        assertTrue(LinkRouting.tryOpenExternal(context, tracked, false, new boolean[1], null));
        Intent chooser = shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity();
        assertEquals(Intent.ACTION_CHOOSER, chooser.getAction());
        Intent target = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        assertTrue(target.getPackage().startsWith("org.example."));
        android.os.Parcelable[] additional = chooser.getParcelableArrayExtra(Intent.EXTRA_INITIAL_INTENTS);
        assertEquals(1, additional.length);
        assertTrue(((Intent) additional[0]).getPackage().startsWith("org.example."));
        assertEquals(tracked, target.getData());
    }

    private void registerBrowser(String packageName, String authority) {
        ResolveInfo info = new ResolveInfo();
        info.activityInfo = new ActivityInfo();
        info.activityInfo.packageName = packageName;
        info.activityInfo.name = packageName + ".BrowserActivity";
        info.activityInfo.enabled = true;
        info.activityInfo.exported = true;
        info.filter = new IntentFilter(Intent.ACTION_VIEW);
        info.filter.addCategory(Intent.CATEGORY_DEFAULT);
        info.filter.addCategory(Intent.CATEGORY_BROWSABLE);
        info.filter.addDataScheme("http");
        info.filter.addDataScheme("https");
        if (authority != null) info.filter.addDataAuthority(authority, null);
        ShadowPackageManager manager = shadowOf(context.getPackageManager());
        for (String scheme : new String[]{"http", "https"}) manager.addResolveInfoForIntent(
                new Intent(Intent.ACTION_VIEW, Uri.parse(scheme + "://")).addCategory(Intent.CATEGORY_BROWSABLE), info);
    }

    private void assertStock() {
        assertSame(tracked, LinkRouting.cleanOpenedUri(tracked, false, new boolean[1]));
        Intent intent = share(tracked.toString());
        assertSame(intent, LinkRouting.cleanShareIntent(intent));
        assertFalse(LinkRouting.tryOpenExternal(context, tracked, false, new boolean[1], null));
    }

    private void assertNoCount() { assertFalse(HookStatus.report().toString(), HookStatus.report().toString().contains("Counted:")); }
    private static Intent share(String text) { return new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT, text); }
    private static Intent shareUri(Uri uri) { return share(uri.toString()); }

    @Implements(value = LinkRouting.class, isInAndroidSdk = false)
    public static class HostProtection {
        static boolean protectedLink;
        static boolean fail;
        @Implementation protected static boolean protectedByTelegram(Uri uri) {
            if (fail) throw new IllegalStateException("unavailable account-domain policy");
            return protectedLink;
        }
    }
}
