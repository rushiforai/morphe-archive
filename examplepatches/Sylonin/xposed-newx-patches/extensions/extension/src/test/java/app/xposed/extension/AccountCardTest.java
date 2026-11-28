package app.xposed.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.concurrent.TimeUnit;

public class AccountCardTest {
    private static final long NOW = 1_780_000_000_000L;
    private static final long DAY = TimeUnit.DAYS.toMillis(1);

    private static AccountCard.Person person(String labelName, String labelBadge, String labelUrl) {
        return new AccountCard.Person("Name", "https://pbs.twimg.com/profile_images/1/a_normal.jpg", false,
                ModelBridge.VERIFIED_BUSINESS, true, 7, NOW - 400 * DAY, 1200, 34, labelName, labelBadge, labelUrl);
    }

    private static AccountInfo info(String origin, String affiliation, long userId, AccountInfo.Details details) {
        return new AccountInfo("Germany", "Germany App Store", true, affiliation, NOW, origin, userId, details);
    }

    @Test
    public void avatarsAreAskedForInTheHeaderSize() {
        assertEquals("https://pbs.twimg.com/profile_images/123/abc_200x200.jpg",
                AccountCard.avatarUrl("https://pbs.twimg.com/profile_images/123/abc_normal.jpg"));
        assertEquals("https://pbs.twimg.com/profile_images/123/abc_200x200.png",
                AccountCard.avatarUrl("https://pbs.twimg.com/profile_images/123/abc.png"));
        assertEquals("https://pbs.twimg.com/profile_images/123/a_b-c_200x200.jpeg",
                AccountCard.avatarUrl("https://pbs.twimg.com/profile_images/123/a_b-c_400x400.jpeg"));
    }

    @Test
    public void picturesComeOnlyFromXsImageServerOverHttps() {
        assertNull(AccountCard.avatarUrl("http://pbs.twimg.com/profile_images/123/abc_normal.jpg"));
        assertNull(AccountCard.avatarUrl("https://pbs.twimg.com.example.com/profile_images/123/abc_normal.jpg"));
        assertNull(AccountCard.avatarUrl("https://pbs.twimg.com:8443/profile_images/123/abc_normal.jpg"));
        assertNull(AccountCard.avatarUrl("https://user@pbs.twimg.com/profile_images/123/abc_normal.jpg"));
        assertNull(AccountCard.avatarUrl("https://pbs.twimg.com/profile_banners/123/1500"));
        assertNull(AccountCard.avatarUrl(null));

        String badge = "https://pbs.twimg.com/semantic_core_img/1/abc?format=png&name=orig";
        assertEquals(badge, AccountCard.imageUrl(badge));
        assertNull(AccountCard.imageUrl("https://example.com/badge.png"));
    }

    @Test
    public void linksOpenOnlyHttpsPages() {
        assertEquals("https://example.org/team", AccountCard.webUrl("https://example.org/team"));
        assertNull(AccountCard.webUrl("http://example.org/team"));
        assertNull(AccountCard.webUrl("javascript:alert(1)"));
        assertNull(AccountCard.webUrl("intent://example.org#Intent;end"));
        assertNull(AccountCard.webUrl("https://user:pass@example.org/"));
    }

    @Test
    public void profileLinksUseThePermanentUserId() {
        assertEquals("https://x.com/i/user/783214", AccountCard.profileLink(783214));
        assertNull(AccountCard.profileLink(0));
    }

    @Test
    public void ageCountsWholeYears() {
        assertEquals(-1, AccountCard.ageYears(0, NOW));
        assertEquals(0, AccountCard.ageYears(NOW + DAY, NOW));
        assertEquals(0, AccountCard.ageYears(NOW - 364 * DAY, NOW));
        assertEquals(2, AccountCard.ageYears(NOW - 731 * DAY, NOW));
        assertEquals(10, AccountCard.ageYears(NOW - 3653 * DAY, NOW));
    }

    @Test
    public void countsNeedProfileDetails() {
        AccountInfo info = info(AccountInfo.ORIGIN_X, null, 7, AccountInfo.Details.UNKNOWN);
        AccountCard off = AccountCard.of("handle", info, person(null, null, null), false, 99, 0);
        assertFalse(off.hasCounts());
        assertEquals(-1, off.followers);
        assertEquals(-1, off.posts);

        AccountCard on = AccountCard.of("handle", info, person(null, null, null), true, 99, 0);
        assertTrue(on.hasCounts());
        assertEquals(1200, on.followers);
        assertEquals(34, on.following);
        assertEquals(99, on.posts);

        AccountCard noPerson = AccountCard.of("handle", info, null, true, -1, 0);
        assertFalse(noPerson.hasCounts());
    }

    @Test
    public void combinesTheUserModelWithAboutThisAccount() {
        AccountInfo.Details details = new AccountInfo.Details(NOW - 900 * DAY, 2, NOW - 30 * DAY, 0, true);
        AccountCard card = AccountCard.of("handle", info(AccountInfo.ORIGIN_X, null, 0, details), person(null, null, null),
                false, -1, 0);
        assertEquals("Name", card.name);
        assertEquals("https://pbs.twimg.com/profile_images/1/a_200x200.jpg", card.avatarUrl);
        assertEquals(ModelBridge.VERIFIED_BUSINESS, card.verification);
        assertTrue(card.isProtected);
        assertTrue(card.identityVerified);
        // X's model has the exact creation time.
        assertEquals(NOW - 400 * DAY, card.createdAt);
        assertEquals(NOW - 30 * DAY, card.verifiedSince);
        assertEquals(2, card.handleChanges);
        assertEquals(7, card.userId);
        assertFalse(card.fromCloud);

        AccountCard withoutModel = AccountCard.of("handle", info(AccountInfo.ORIGIN_CLOUD, null, 0, details), null, false, -1, 0);
        assertNull(withoutModel.name);
        assertEquals(ModelBridge.NOT_VERIFIED, withoutModel.verification);
        assertEquals(NOW - 900 * DAY, withoutModel.createdAt);
        assertTrue(withoutModel.fromCloud);
    }

    @Test
    public void userIdPrefersXsAnswerThenTheModelThenTheKnownId() {
        AccountInfo.Details none = AccountInfo.Details.UNKNOWN;
        assertEquals(5, AccountCard.of("h", info(AccountInfo.ORIGIN_X, null, 5, none), person(null, null, null), false, -1, 9).userId);
        assertEquals(7, AccountCard.of("h", info(AccountInfo.ORIGIN_X, null, 0, none), person(null, null, null), false, -1, 9).userId);
        assertEquals(9, AccountCard.of("h", info(AccountInfo.ORIGIN_X, null, 0, none), null, false, -1, 9).userId);
        assertFalse(AccountCard.of("h", info(AccountInfo.ORIGIN_X, null, 0, none), null, false, -1, 0).hasHistory());
    }

    @Test
    public void affiliationPrefersTheLabelWithItsBadgeAndLink() {
        AccountCard card = AccountCard.of("h", info(AccountInfo.ORIGIN_X, "nasa", 0, AccountInfo.Details.UNKNOWN),
                person("NASA", "https://pbs.twimg.com/semantic_core_img/1/n?format=png", "https://www.nasa.gov/"),
                false, -1, 0);
        assertEquals("NASA", card.affiliation);
        assertEquals("https://pbs.twimg.com/semantic_core_img/1/n?format=png", card.affiliationBadge);
        assertEquals("https://www.nasa.gov/", card.affiliationUrl);

        AccountCard unsafe = AccountCard.of("h", info(AccountInfo.ORIGIN_CLOUD, null, 0, AccountInfo.Details.UNKNOWN),
                person("NASA", "https://example.com/n.png", "http://www.nasa.gov/"), false, -1, 0);
        assertEquals("NASA", unsafe.affiliation);
        assertNull(unsafe.affiliationBadge);
        assertNull(unsafe.affiliationUrl);
    }

    @Test
    public void affiliationFallsBackToTheAffiliateHandleFromX() {
        AccountCard fromX = AccountCard.of("h", info(AccountInfo.ORIGIN_X, "nasa", 0, AccountInfo.Details.UNKNOWN), null,
                false, -1, 0);
        assertEquals("@nasa", fromX.affiliation);
        assertEquals("https://x.com/nasa", fromX.affiliationUrl);
        assertNull(fromX.affiliationBadge);

        // The community cache has the organization's name, not a handle to link.
        AccountCard fromCloud = AccountCard.of("h", info(AccountInfo.ORIGIN_CLOUD, "NASA Goddard", 0, AccountInfo.Details.UNKNOWN),
                null, false, -1, 0);
        assertEquals("NASA Goddard", fromCloud.affiliation);
        assertNull(fromCloud.affiliationUrl);
    }
}
