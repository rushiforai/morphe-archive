/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import app.hushtelegram.extension.shared.L10nTablesForTests;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * Link preview rules (#79): which links a rule covers, how the rules are read and kept, and what
 * the send does with them.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LinkPreviewRulesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.LINK_PREVIEW_RULES);
        Settings.LINK_PREVIEW_RULES.resetToDefault();
        Settings.LINK_PREVIEW_RULE_LIST.resetToDefault();
        HookStatus.clear();
    }

    private static List<LinkPreviewRules.Rule> rules(String text) {
        return LinkPreviewRules.parse(text).rules;
    }

    /** [link] as the starting rules rewrite it. */
    private static String rewrite(String link) {
        return LinkPreviewRules.rewrite(link, rules(LinkPreviewRules.DEFAULT_RULES));
    }

    private static LinkPreviewRulesForTests sent(String text) {
        LinkPreviewRulesForTests send = new LinkPreviewRulesForTests(text);
        LinkPreviewRules.send(send);
        return send;
    }

    // ---- Which links a rule covers ---------------------------------------------------------------

    @Test public void anExactHostAndItsWwwGetTheAlternative() {
        assertEquals("https://fixupx.com/a/status/1", rewrite("https://x.com/a/status/1"));
        assertEquals("https://fixupx.com/a/status/1", rewrite("https://www.x.com/a/status/1"));
        assertEquals("https://fixupx.com/jack/status/20", rewrite("https://twitter.com/jack/status/20"));
        assertEquals("https://vxreddit.com/r/android/comments/abc/", rewrite("https://reddit.com/r/android/comments/abc/"));
        assertEquals("https://kkclip.com/p/abc/", rewrite("https://www.instagram.com/p/abc/"));
        assertEquals("https://phixiv.net/artworks/1", rewrite("https://www.pixiv.net/artworks/1"));
        assertEquals("a trailing dot is the same host", "https://fixupx.com/a/status/1", rewrite("https://x.com./a/status/1"));
    }

    @Test public void aRuleWithoutTheWildcardLeavesOtherSubdomainsAlone() {
        assertNull(rewrite("https://mobile.x.com/a/status/1"));
        assertNull(rewrite("https://old.reddit.com/r/android/comments/abc/"));
    }

    @Test public void theWildcardCoversSubdomainsAndCanCarryThemOver() {
        assertEquals("https://vm.kktiktok.com/ZM1/", rewrite("https://vm.tiktok.com/ZM1/"));
        assertEquals("https://a.b.kktiktok.com/@a/video/1", rewrite("https://a.b.tiktok.com/@a/video/1"));
        assertEquals("the site itself", "https://kktiktok.com/@a/video/1", rewrite("https://tiktok.com/@a/video/1"));
        assertEquals("www is the site itself", "https://kktiktok.com/@a/video/1", rewrite("https://www.tiktok.com/@a/video/1"));

        // Without the wildcard on the alternative, every subdomain goes to the alternative itself.
        List<LinkPreviewRules.Rule> plain = rules("*.example.org -> mirror.example");
        assertEquals("https://mirror.example/p", LinkPreviewRules.rewrite("https://deep.sub.example.org/p", plain));
        assertEquals("https://mirror.example/p", LinkPreviewRules.rewrite("https://example.org/p", plain));
    }

    @Test public void lookalikesStayStock() {
        assertNull(rewrite("https://notx.com/a/status/1"));
        assertNull(rewrite("https://x.com.evil.example/a/status/1"));
        assertNull(rewrite("https://evil-x.com/a/status/1"));
        assertNull(rewrite("https://x.co/a/status/1"));
        assertNull(rewrite("https://faketiktok.com/@a/video/1"));
        assertNull(rewrite("https://tiktok.com.evil.example/@a/video/1"));
        // A user name in front of the host is a lookalike too: the link goes to the host after it.
        assertNull(rewrite("https://x.com@evil.example/a/status/1"));
        assertNull(rewrite("https://evil.example@x.com/a/status/1"));
        assertNull("x.com is only in the path", rewrite("https://evil.example/x.com/a/status/1"));
        assertNull("x.com is only in the query", rewrite("https://evil.example/?u=https://x.com/a/status/1"));
    }

    @Test public void portsPathsQueriesAndFragmentsAreKept() {
        assertEquals("https://fixupx.com:8443/a/status/1?s=20&t=abc#reply",
                rewrite("https://x.com:8443/a/status/1?s=20&t=abc#reply"));
        assertEquals("http://fixupx.com/a/status/1", rewrite("http://x.com/a/status/1"));
        List<LinkPreviewRules.Rule> site = rules("x.com -> fixupx.com");
        assertEquals("https://fixupx.com?s=1", LinkPreviewRules.rewrite("https://x.com?s=1", site));
        assertEquals("https://fixupx.com#top", LinkPreviewRules.rewrite("https://x.com#top", site));
        assertEquals("https://fixupx.com", LinkPreviewRules.rewrite("https://x.com", site));
        assertNull("a port that isn't a number", rewrite("https://x.com:http/a/status/1"));
        assertNull("a port that's too long", rewrite("https://x.com:123456/a/status/1"));
        assertNull("an empty port", rewrite("https://x.com:/a/status/1"));
    }

    @Test public void uppercaseHostsAndSchemesMatchAndThePathKeepsItsCase() {
        assertEquals("https://fixupx.com/Jack/Status/1", rewrite("HTTPS://X.COM/Jack/Status/1"));
        assertEquals("https://fixupx.com/A/status/2", rewrite("https://WWW.X.Com/A/status/2"));
        assertEquals("https://vm.kktiktok.com/ZMabc/", rewrite("https://VM.TikTok.com/ZMabc/"));
    }

    @Test public void aLinkWithoutASchemeGetsHttps() {
        assertEquals("https://fixupx.com/a/status/1", rewrite("x.com/a/status/1"));
        assertEquals("https://fixupx.com/a/status/1", rewrite("www.x.com/a/status/1"));
    }

    @Test public void otherSchemesAndOddHostsStayStock() {
        assertNull(rewrite("ftp://x.com/a/status/1"));
        assertNull(rewrite("javascript://x.com/a/status/1"));
        assertNull(rewrite("https://[::1]/a"));
        assertNull(rewrite("https://1.2.3.4/a"));
        assertNull(rewrite("https://localhost/a"));
        assertNull(rewrite(""));
        assertNull(rewrite(null));
        assertNull(LinkPreviewRules.rewrite("https://x.com/a", Collections.<LinkPreviewRules.Rule>emptyList()));
    }

    @Test public void aPathCoversOnlyLinksThatStartWithIt() {
        // A post gets the fixer's preview. A profile keeps Telegram's own: fixupx.com previews its code page for one,
        // and kktiktok.com and kkclip.com answer 404.
        assertEquals("https://fixupx.com/telegram/status/1", rewrite("https://x.com/telegram/status/1"));
        assertEquals("https://fixupx.com/i/status/1", rewrite("https://x.com/i/status/1"));
        assertNull(rewrite("https://x.com/telegram"));
        assertNull(rewrite("https://x.com/telegram/"));
        assertNull(rewrite("https://x.com/telegram/media"));
        assertNull(rewrite("https://twitter.com/jack"));
        assertNull(rewrite("https://x.com"));
        assertNull("status only in the query", rewrite("https://x.com/telegram?x=/status/1"));
        assertNull(rewrite("https://www.tiktok.com/@a"));
        assertEquals("https://kktiktok.com/@a/photo/2", rewrite("https://www.tiktok.com/@a/photo/2"));
        assertEquals("https://kktiktok.com/t/ZT1/", rewrite("https://www.tiktok.com/t/ZT1/"));
        assertEquals("https://vt.kktiktok.com/ZS1/", rewrite("https://vt.tiktok.com/ZS1/"));
        assertNull(rewrite("https://reddit.com/r/android"));
        assertEquals("https://vxreddit.com/r/android/s/abc", rewrite("https://www.reddit.com/r/android/s/abc"));
        assertNull(rewrite("https://www.instagram.com/instagram/"));
        assertEquals("https://kkclip.com/reel/abc/", rewrite("https://www.instagram.com/reel/abc/"));
        assertEquals("https://kkclip.com/reels/abc/", rewrite("https://www.instagram.com/reels/abc/"));
        assertEquals("https://kkclip.com/tv/abc", rewrite("https://instagram.com/tv/abc"));
        // pixiv's fixer sends anything that isn't a post back to pixiv, so the whole site keeps its rule.
        assertEquals("https://phixiv.net/users/11", rewrite("https://www.pixiv.net/users/11"));
        // Letter case and empty parts don't matter, and * needs a part to stand for.
        assertEquals("https://fixupx.com//Telegram//STATUS/1", rewrite("https://x.com//Telegram//STATUS/1"));
        List<LinkPreviewRules.Rule> any = rules("example.org/*/x -> mirror.example");
        assertNull(LinkPreviewRules.rewrite("https://example.org/x", any));
        assertNull(LinkPreviewRules.rewrite("https://example.org//x", any));
        assertEquals("https://mirror.example/a/x/y", LinkPreviewRules.rewrite("https://example.org/a/x/y", any));
    }

    @Test public void aRulesPathIsWrittenOneWay() {
        LinkPreviewRules.Parsed parsed = LinkPreviewRules.parse("X.com/*/Status/ -> fixupx.com\n"
                + "x.com/ -> fixupx.com\n"
                + "*.tiktok.com/@a/video -> *.kktiktok.com\n"
                + "x.com/a//b -> fixupx.com\n"
                + "x.com/a?b=1 -> fixupx.com\n"
                + "x.com/a#b -> fixupx.com\n"
                + "x.com/a b -> fixupx.com\n"
                + "x.com/1/2/3/4/5/6/7/8/9 -> fixupx.com\n"
                + "x.com -> fixupx.com/status\n"
                + "x.com/a -> x.com");
        assertEquals(7, parsed.skipped);
        assertEquals("x.com/*/status -> fixupx.com\nx.com -> fixupx.com\n*.tiktok.com/@a/video -> *.kktiktok.com", parsed.text());
        assertTrue(LinkPreviewRules.allowed("x.com/*/status -> fixupx.com"));
        assertTrue(LinkPreviewRules.allowed("x.com/1/2/3/4/5/6/7/8 -> fixupx.com"));
        assertFalse(LinkPreviewRules.allowed("x.com/*/status/ -> fixupx.com"));
        assertFalse(LinkPreviewRules.allowed("x.com/*/Status -> fixupx.com"));
    }

    @Test public void theFirstRuleThatCoversALinkWins() {
        List<LinkPreviewRules.Rule> both = rules("x.com -> first.example\nx.com -> second.example");
        assertEquals("https://first.example/a", LinkPreviewRules.rewrite("https://x.com/a", both));
    }

    // ---- Reading and keeping the rules -----------------------------------------------------------

    @Test public void linesThatArentRulesAreSkippedAndCounted() {
        LinkPreviewRules.Parsed parsed = LinkPreviewRules.parse("x.com -> fixupx.com\n"
                + "\n   \n"
                + "just some text\n"
                + "x.com -> fixupx.com -> more.example\n"
                + "x.com -> x.com\n"
                + "x.com -> *.fixupx.com\n"
                + "localhost -> fixupx.com\n"
                + "x.com/a//b -> fixupx.com\n"
                + "-x.com -> fixupx.com\n"
                + "*.x.com -> \n"
                + "pixiv.net->phixiv.net\n"
                + "  REDDIT.com   ->   VXreddit.COM  ");
        assertEquals("blank lines aren't counted", 8, parsed.skipped);
        assertEquals("x.com -> fixupx.com\npixiv.net -> phixiv.net\nreddit.com -> vxreddit.com", parsed.text());
        assertEquals(0, LinkPreviewRules.parse(null).rules.size());
        assertEquals(0, LinkPreviewRules.parse(null).skipped);
    }

    @Test public void theStartingRulesCoverTheSixSitesPostsWrittenTheEditorsWay() {
        LinkPreviewRules.Parsed parsed = LinkPreviewRules.parse(LinkPreviewRules.DEFAULT_RULES);
        assertEquals(14, parsed.rules.size());
        assertEquals(0, parsed.skipped);
        assertEquals(LinkPreviewRules.DEFAULT_RULES, parsed.text());
        assertTrue(LinkPreviewRules.allowed(LinkPreviewRules.DEFAULT_RULES));
        assertEquals("a new install starts with them", LinkPreviewRules.DEFAULT_RULES, Settings.LINK_PREVIEW_RULE_LIST.savedValue());
        assertEquals(14, LinkPreviewRules.saved().rules.size());
    }

    @Test public void onlyRulesWrittenTheEditorsWayComeInFromAFile() {
        assertTrue(LinkPreviewRules.allowed(""));
        assertTrue(LinkPreviewRules.allowed("*.example.org -> *.mirror.example"));
        assertFalse(LinkPreviewRules.allowed(null));
        assertFalse(LinkPreviewRules.allowed("X.com -> fixupx.com"));
        assertFalse(LinkPreviewRules.allowed("x.com->fixupx.com"));
        assertFalse(LinkPreviewRules.allowed("x.com -> fixupx.com\n"));
        assertFalse(LinkPreviewRules.allowed("x.com -> fixupx.com\nnot a rule"));
        StringBuilder many = new StringBuilder();
        for (int i = 0; many.length() <= LinkPreviewRules.MAX_TEXT; i++) {
            if (many.length() > 0) many.append('\n');
            many.append("site").append(i).append(".com -> fixupx.com");
        }
        assertTrue("written the editor's way", LinkPreviewRules.parse(many.toString()).text().contentEquals(many));
        assertFalse("too long to keep", LinkPreviewRules.allowed(many.toString()));
    }

    @Test public void savedRulesAreWhatTheSendFollows() {
        Settings.LINK_PREVIEW_RULES.save(true);
        assertTrue(LinkPreviewRules.save(LinkPreviewRules.parse("*.example.org -> *.mirror.example")));
        assertEquals("*.example.org -> *.mirror.example", Settings.LINK_PREVIEW_RULE_LIST.savedValue());
        assertEquals("https://docs.mirror.example/a", sent("https://docs.example.org/a").pointed);
        assertNull("x.com isn't in the rules any more", sent("https://x.com/a/status/1").pointed);

        assertTrue(LinkPreviewRules.save(LinkPreviewRules.parse("")));
        assertNull("no rules, no change", sent("https://docs.example.org/a").pointed);
    }

    // ---- The send --------------------------------------------------------------------------------

    @Test public void withTheSwitchOffThePreviewIsLeftAlone() {
        assertFalse("off by default", Settings.LINK_PREVIEW_RULES.get());
        assertNull(sent("look https://x.com/a/status/1").pointed);
        assertFalse(LinkPreviewRulesForTests.on());
    }

    @Test public void withTheSwitchOnTheFirstLinkGetsItsPreviewFromTheAlternative() {
        Settings.LINK_PREVIEW_RULES.save(true);
        LinkPreviewRulesForTests send = sent("look https://x.com/a/status/1 and https://reddit.com/r/a");
        assertEquals("https://fixupx.com/a/status/1", send.pointed);
        assertEquals("the text goes out as typed", "look https://x.com/a/status/1 and https://reddit.com/r/a", send.text);
        assertEquals("a link typed without a scheme", "https://fixupx.com/a/status/1", sent("x.com/a/status/1").pointed);

        assertNull("only the first link makes a preview", sent("see https://example.com then https://x.com/a/status/1").pointed);
        assertNull("an email address isn't a link", sent("mail me at someone@x.com").pointed);
        assertNull(sent("hello there").pointed);
        assertNull("a send with no text to look at: a retry, a rich message or the preview turned off",
                sent(null).pointed);
    }

    @Test public void thePickedPreviewCountsBeforeTheFirstLink() {
        Settings.LINK_PREVIEW_RULES.save(true);
        LinkPreviewRulesForTests send = new LinkPreviewRulesForTests("https://example.com and https://x.com/b/status/2");
        send.chosen = "https://x.com/b/status/2";
        LinkPreviewRules.send(send);
        assertEquals("https://fixupx.com/b/status/2", send.pointed);

        send = new LinkPreviewRulesForTests("https://x.com/a/status/1");
        send.chosen = "https://example.com/";
        LinkPreviewRules.send(send);
        assertNull("the picked preview isn't covered", send.pointed);

        send = new LinkPreviewRulesForTests("https://x.com/a/status/1");
        send.chosen = "";
        LinkPreviewRules.send(send);
        assertNull("a picked preview without an address", send.pointed);
    }

    @Test public void secretChatsAndBotResultsStayStock() {
        Settings.LINK_PREVIEW_RULES.save(true);
        LinkPreviewRulesForTests secret = new LinkPreviewRulesForTests("https://x.com/a/status/1");
        secret.peer = 0x4000000000000000L | 7L;
        LinkPreviewRules.send(secret);
        assertNull("a secret chat makes its previews on the phone", secret.pointed);

        LinkPreviewRulesForTests channel = new LinkPreviewRulesForTests("https://x.com/a/status/1");
        channel.peer = -1001234567890L;
        LinkPreviewRules.send(channel);
        assertEquals("a channel isn't a secret chat", "https://fixupx.com/a/status/1", channel.pointed);

        for (String key : new String[]{"query_id", "bot"}) {
            LinkPreviewRulesForTests inline = new LinkPreviewRulesForTests("https://x.com/a/status/1");
            inline.extras = new HashMap<>();
            inline.extras.put(key, "1");
            LinkPreviewRules.send(inline);
            assertNull(key, inline.pointed);
        }
        LinkPreviewRulesForTests extras = new LinkPreviewRulesForTests("https://x.com/a/status/1");
        extras.extras = new HashMap<>();
        extras.extras.put("originalPath", "x");
        LinkPreviewRules.send(extras);
        assertEquals("other extras don't matter", "https://fixupx.com/a/status/1", extras.pointed);
    }

    @Test public void pausedTheSendIsStock() {
        Settings.LINK_PREVIEW_RULES.save(true);
        assertTrue(LinkPreviewRulesForTests.on());
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(LinkPreviewRulesForTests.on());
        PauseForTests.resume();
        assertTrue(LinkPreviewRulesForTests.on());
    }

    @Test public void aSendThatThrowsIsLeftToTelegramAndReported() {
        Settings.LINK_PREVIEW_RULES.save(true);
        LinkPreviewRules.Params broken = new LinkPreviewRules.Params() {
            @Override public String text() { return "https://x.com/a/status/1"; }
            @Override public long peer() { return 42; }
            @Override public HashMap<String, String> extras() { return null; }
            @Override public String chosen() { return null; }
            @Override public void point(String address) { throw new IllegalStateException("renamed"); }
        };
        LinkPreviewRules.send(broken);
        assertTrue(HookStatus.missing(FamilyNames.DISABLE_DRAFT_PREVIEWS).toString(),
                HookStatus.missing(FamilyNames.DISABLE_DRAFT_PREVIEWS).toString().contains("'link preview rule'"));
    }

    // ---- Toasts ----------------------------------------------------------------------------------

    @Test public void theEditorsToastsFitTwoLinesInEveryLanguage() {
        String[] toasts = {"Too many rules to keep. Take some out.", "Couldn't save the rules. Try again in a moment.",
                "Lines left out: %1$s. They aren't rules."};
        for (String toast : toasts) {
            assertFitsATwoLineToast("en", String.format(toast, 12));
            for (String language : new String[]{"bg", "de", "es", "in", "it", "pt-rbr", "tr", "zh-hans"}) {
                String row = L10nTablesForTests.of(language).get(toast);
                assertNotNull(language + ": " + toast, row);
                assertFitsATwoLineToast(language, String.format(row, 12));
            }
        }
    }

    private static void assertFitsATwoLineToast(String language, String text) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.split(" ")) {
            if (line.length() > 0 && line.length() + 1 + word.length() > 28) {
                lines.add(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(' ');
            line.append(word);
        }
        if (line.length() > 0) lines.add(line.toString());
        assertTrue(language + ": " + text, lines.size() <= 2);
        for (String each : lines) assertTrue(language + ": " + each, each.length() <= 28);
    }
}
