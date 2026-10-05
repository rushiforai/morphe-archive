/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.privacy;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import android.content.ClipData;
import android.content.Intent;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LinkTrackingTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After public void restore() {
        PauseForTests.resume();
        Settings.STRIP_LINK_TRACKING.resetToDefault();
    }

    @Test public void cleansKnownParametersAndKeepsRawDestinationParametersAndFragment() {
        assertEquals("https://example.org/a?filter=a%2Bb&filter=c#preview",
                LinkTracking.cleanUrl("https://example.org/a?utm_source=pin&filter=a%2Bb&fbclid=abc&filter=c#preview"));
        assertEquals("https://example.org/a?&filter=1",
                LinkTracking.cleanUrl("https://example.org/a?&utm_medium=app&filter=1"));
        assertEquals("https://example.org/a#preview", LinkTracking.cleanUrl("https://example.org/a?utm_source=pin#preview"));
    }

    @Test public void matchesDecodedNamesWithoutDecodingFunctionalValues() {
        assertEquals("https://example.org/a?id=4%26foo%3Dbar",
                LinkTracking.cleanUrl("https://example.org/a?%75tm_source=x&id=4%26foo%3Dbar&UTM_MEDIUM=app"));
    }

    @Test public void pinterestSenderTrackingIsHostScopedAndShortTokensStayIntact() {
        assertEquals("https://www.pinterest.com/pin/123/?foo=bar",
                LinkTracking.cleanUrl("https://www.pinterest.com/pin/123/?sender=999&foo=bar&tracking_id=5"));
        assertEquals("https://example.org/pin/123?sender=999",
                LinkTracking.cleanUrl("https://example.org/pin/123?sender=999&utm_source=pin"));
        assertEquals("https://pin.it/OpaqueToken", LinkTracking.cleanUrl("https://pin.it/OpaqueToken?utm_source=app"));
        String spoof = "https://pinterest.com.example.org/a?sender=123";
        assertEquals(spoof, LinkTracking.cleanUrl(spoof));
    }

    @Test public void signedLinksAndSignInParametersArePreservedExactly() {
        for (String marker : new String[]{"signature=secret", "code=sign-in", "X-Amz-Signature=secret", "token=secret"}) {
            String original = "https://example.org/a?utm_source=pin&" + marker;
            assertEquals(original, LinkTracking.cleanUrl(original));
        }
    }

    @Test public void keepsTextAndPunctuationAroundMultipleUrls() {
        assertEquals("First https://example.org/a. Then (https://www.pinterest.com/pin/123/).",
                LinkTracking.cleanText("First https://example.org/a. Then (https://www.pinterest.com/pin/123/?utm_source=pin)."));
        assertEquals("https://example.org/a and https://example.org/b",
                LinkTracking.cleanText("https://example.org/a?utm_source=1 and https://example.org/b?fbclid=2"));
        assertNull(LinkTracking.cleanText(null));
    }

    @Test public void onlySharedTextExtrasChangeAndCopyLabelsStayTheSame() {
        String original = "https://example.org/a?utm_source=pin";
        Intent intent = new Intent(Intent.ACTION_SEND);
        assertSame(intent, LinkTracking.putStringExtra(intent, "login_url", original));
        assertEquals(original, intent.getStringExtra("login_url"));
        LinkTracking.putStringExtra(intent, Intent.EXTRA_TEXT, original);
        assertEquals("https://example.org/a", intent.getStringExtra(Intent.EXTRA_TEXT));
        ClipData clip = LinkTracking.newPlainText("Copy link", original);
        assertEquals("Copy link", clip.getDescription().getLabel());
        assertEquals("https://example.org/a", clip.getItemAt(0).getText());
        assertEquals("https://example.org/a", LinkTracking.newPlainText(original, original).getDescription().getLabel());
    }

    @Test public void pauseAndDisabledSwitchAndColdStartKeepOriginalText() {
        String original = "https://example.org/a?utm_source=pin";
        Settings.STRIP_LINK_TRACKING.save(false);
        assertSame(original, LinkTracking.cleanText(original));
        Settings.STRIP_LINK_TRACKING.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertSame(original, LinkTracking.cleanText(original));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertSame(original, LinkTracking.cleanText(original)));
    }
}
