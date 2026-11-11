package dev.utaa.linimal.extension.features.browser;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class ExternalBrowserPolicyTest {
    @Test
    public void onlyHttpAndHttpsSchemesAreEligible() {
        assertTrue(ExternalBrowserPolicy.isEligibleScheme("https"));
        assertTrue(ExternalBrowserPolicy.isEligibleScheme("HTTP"));
        assertFalse(ExternalBrowserPolicy.isEligibleScheme(null));
        assertFalse(ExternalBrowserPolicy.isEligibleScheme("line"));
        assertFalse(ExternalBrowserPolicy.isEligibleScheme("content"));
        assertFalse(ExternalBrowserPolicy.isEligibleScheme("file"));
        assertFalse(ExternalBrowserPolicy.isEligibleScheme("tel"));
        assertFalse(ExternalBrowserPolicy.isEligibleScheme("mailto"));
        assertFalse(ExternalBrowserPolicy.isEligibleScheme("intent"));
    }

    @Test
    public void onlyLinkTapsInsideChatAreEligibleActions() {
        assertTrue(ExternalBrowserPolicy.isEligibleChatLinkAction("CLICK"));
        assertTrue(ExternalBrowserPolicy.isEligibleChatLinkAction("RICH_MSG"));
        assertTrue(ExternalBrowserPolicy.isEligibleChatLinkAction("RICH_MENU"));
        assertTrue(ExternalBrowserPolicy.isEligibleChatLinkAction("TEMPLATE_MSG"));
        // 操作の種類を持たない経路や、動画再生などの別の操作は元の処理へ残します。
        assertFalse(ExternalBrowserPolicy.isEligibleChatLinkAction("UNKNOWN"));
        assertFalse(ExternalBrowserPolicy.isEligibleChatLinkAction("PLAY"));
        assertFalse(ExternalBrowserPolicy.isEligibleChatLinkAction("DIRECT"));
        assertFalse(ExternalBrowserPolicy.isEligibleChatLinkAction(null));
        assertFalse(ExternalBrowserPolicy.isEligibleChatLinkAction("click"));
    }

    @Test
    public void knownLineWebHostsStayInOriginalNavigation() {
        assertTrue(ExternalBrowserPolicy.isKnownLineWebHost("line.me"));
        assertTrue(ExternalBrowserPolicy.isKnownLineWebHost("ACCESS.LINE.ME"));
        assertTrue(ExternalBrowserPolicy.isKnownLineWebHost("line.me."));
        assertTrue(ExternalBrowserPolicy.isKnownLineWebHost("u.lin.ee"));
        assertTrue(ExternalBrowserPolicy.isKnownLineWebHost("line.naver.jp"));
        assertFalse(ExternalBrowserPolicy.isKnownLineWebHost("example.com"));
        assertFalse(ExternalBrowserPolicy.isKnownLineWebHost("line.me.example.com"));
        assertFalse(ExternalBrowserPolicy.isKnownLineWebHost(null));
    }

    @Test
    public void externalCandidatesExcludeLineAndInvalidComponents() {
        List<ExternalBrowserPolicy.Candidate> candidates = ExternalBrowserPolicy.externalCandidates(
                "jp.naver.line.android",
                Arrays.asList(
                        new ExternalBrowserPolicy.Candidate("jp.naver.line.android", "OpenUriActivity", true, true),
                        new ExternalBrowserPolicy.Candidate("com.example.browser", "BrowserActivity", true, true),
                        new ExternalBrowserPolicy.Candidate("com.example.hidden", "HiddenActivity", false, true),
                        new ExternalBrowserPolicy.Candidate("com.example.disabled", "DisabledActivity", true, false),
                        new ExternalBrowserPolicy.Candidate(null, "MissingPackage", true, true),
                        new ExternalBrowserPolicy.Candidate("com.example.missing", null, true, true)));

        assertEquals(1, candidates.size());
        assertEquals("com.example.browser", candidates.get(0).getPackageName());
        assertEquals("BrowserActivity", candidates.get(0).getClassName());
    }

    @Test
    public void candidateOrderIsStableAndDuplicatesAreRemoved() {
        ExternalBrowserPolicy.Candidate first =
                new ExternalBrowserPolicy.Candidate("com.example.first", "First", true, true);
        ExternalBrowserPolicy.Candidate duplicate =
                new ExternalBrowserPolicy.Candidate("com.example.first", "First", true, true);
        ExternalBrowserPolicy.Candidate second =
                new ExternalBrowserPolicy.Candidate("com.example.second", "Second", true, true);

        List<ExternalBrowserPolicy.Candidate> candidates = ExternalBrowserPolicy.externalCandidates(
                "jp.naver.line.android",
                Arrays.asList(first, duplicate, second));

        assertEquals(Arrays.asList(first, second), candidates);
        assertTrue(ExternalBrowserPolicy.externalCandidates(
                "jp.naver.line.android", Collections.<ExternalBrowserPolicy.Candidate>emptyList()).isEmpty());
    }
}
