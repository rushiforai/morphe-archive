package app.xposed.extension;

import static app.xposed.extension.FilterMatcher.Reason;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class FilterMatcherTest {
    private interface Rules {
        void apply(FilterRules.Builder b);
    }

    private static FilterRules rules(Rules edit) {
        FilterRules.Builder b = new FilterRules.Builder();
        edit.apply(b);
        return b.build();
    }

    private static FilterSubject user(String displayName, String bio) {
        return new FilterSubject("someone", 42, displayName, bio, null, null, null, null, false, null, -1, -1, false);
    }

    private static AccountInfo reported(String location) {
        return new AccountInfo(location, "App Store", true, null, 0, AccountInfo.ORIGIN_X, 42);
    }

    private static int match(FilterRules rules, FilterSubject who, AccountInfo info) {
        return FilterMatcher.match(rules, who, info, null, false);
    }

    @Test
    public void placeholderSummaryNamesTwoFiltersAndCountsTheRest() {
        assertEquals("Matches your filters", Reason.summary(0));
        assertEquals("Country", Reason.summary(Reason.COUNTRY.bit));
        assertEquals("Account \u00B7 Country \u00B7 +2 more",
                Reason.summary(Reason.ACCOUNT.bit | Reason.COUNTRY.bit | Reason.BIO.bit | Reason.LANGUAGE.bit));
    }

    @Test
    public void deviceCountryReplacesTheAccountLocationWhenChosen() {
        FilterRules rules = rules(b -> b.addLocation("Switzerland"));
        AccountInfo basedInGermany = new AccountInfo("Germany", "Switzerland App Store", false, null, 0,
                AccountInfo.ORIGIN_X, 42);
        FilterMatcher.Sources device = new FilterMatcher.Sources(true, true);
        assertEquals(0, match(rules, user(null, null), basedInGermany));
        assertEquals(Reason.COUNTRY.bit, FilterMatcher.match(rules, user(null, null), basedInGermany, null, false, device));
        AccountInfo web = new AccountInfo("Switzerland", "Web", false, null, 0, AccountInfo.ORIGIN_X, 42);
        assertEquals(Reason.COUNTRY.bit, FilterMatcher.match(rules, user(null, null), web, null, false, device));
    }

    @Test
    public void profileDetailsOffKeepsOnlyTheOtherFilters() {
        FilterRules rules = rules(b -> {
            b.addBio("airdrop");
            b.addName("bot");
            b.setMinFollowing(10);
        });
        FilterSubject who = new FilterSubject("someone", 42, "a bot", "free airdrop", null, null, null, null, false,
                null, 50, -1, false);
        FilterMatcher.Sources noDetails = new FilterMatcher.Sources(false, false);
        assertEquals(Reason.NAME.bit | Reason.BIO.bit | Reason.FOLLOWING.bit, match(rules, who, null));
        assertEquals(Reason.NAME.bit, FilterMatcher.match(rules, who, null, null, false, noDetails));
    }

    @Test
    public void noFiltersMatchNothing() {
        assertEquals(0, match(FilterRules.EMPTY, user("Name 12345", "bio"), reported("Germany")));
    }

    @Test
    public void countriesMatchEverySpellingXReports() {
        FilterRules rules = rules(b -> b.addLocation("Turkey"));
        assertEquals(Reason.COUNTRY.bit, match(rules, user(null, null), reported("T\u00fcrkiye")));
        assertEquals(0, match(rules, user(null, null), reported("Greece")));
        assertEquals(0, match(rules, user(null, null), null));
    }

    @Test
    public void regionsMatchTheirLabelAndOnlyChosenCountries() {
        FilterRules labelOnly = rules(b -> b.addLocation("South Asia"));
        assertEquals(Reason.REGION.bit, match(labelOnly, user(null, null), reported("South Asia")));
        assertEquals(0, match(labelOnly, user(null, null), reported("India")));

        FilterRules withIndia = rules(b -> {
            b.addLocation("South Asia");
            b.setRegionCountries("South Asia", Collections.singletonList("India"));
        });
        assertEquals(Reason.REGION.bit, match(withIndia, user(null, null), reported("India")));
        assertEquals(0, match(withIndia, user(null, null), reported("Pakistan")));
    }

    @Test
    public void accountsMatchByIdWhateverTheirHandle() {
        FilterRules rules = rules(b -> b.putAccount(42, "oldhandle"));
        assertEquals(Reason.ACCOUNT.bit, match(rules, user(null, null), null));
        FilterSubject other = new FilterSubject("someone", 43, null, null, null, null, null, null, false, null, -1, -1, false);
        assertEquals(0, match(rules, other, null));
    }

    @Test
    public void namesAndBiosMatchFoldedSubstrings() {
        FilterRules rules = rules(b -> {
            b.addName("\uD83D\uDEA8");
            b.addBio("follow for follow");
        });
        assertEquals(Reason.NAME.bit, match(rules, user("\uD83D\uDEA8 BREAKING", null), null));
        assertEquals(Reason.BIO.bit, match(rules, user("Plain", "Please FOLLOW for follow!"), null));
        assertEquals(0, match(rules, user("Plain", "follow me"), null));
    }

    @Test
    public void profileLocationCountsOnlyWhenChosen() {
        FilterSubject who = new FilterSubject("someone", 42, null, "nothing here", "airdrop hq \u00b7 t.me/x", null, null,
                null, false, null, -1, -1, false);
        FilterRules bioOnly = rules(b -> b.addBio("airdrop"));
        assertEquals(0, match(bioOnly, who, null));
        FilterRules withLocation = rules(b -> {
            b.addBio("airdrop");
            b.bioMatchesLocation = true;
        });
        assertEquals(Reason.BIO.bit, match(withLocation, who, null));
    }

    @Test
    public void linksMatchWebsiteBioLinksAndOptionallyLocation() {
        FilterRules rules = rules(b -> b.addLink("t.me"));
        List<String> website = Collections.singletonList("https://t.me/channel");
        FilterSubject site = new FilterSubject("someone", 42, null, null, null, website, null, null, false, null, -1, -1, false);
        FilterSubject bio = new FilterSubject("someone", 42, null, null, null, null, website, null, false, null, -1, -1, false);
        FilterSubject located = new FilterSubject("someone", 42, null, null, "join t.me/channel", null, null, null, false,
                null, -1, -1, false);
        assertEquals(Reason.LINK.bit, match(rules, site, null));
        assertEquals(Reason.LINK.bit, match(rules, bio, null));
        assertEquals(0, match(rules, located, null));
        FilterRules withLocation = rules(b -> {
            b.addLink("t.me");
            b.linksMatchLocation = true;
        });
        assertEquals(Reason.LINK.bit, match(withLocation, located, null));
    }

    @Test
    public void labelsUseXsStructuredLabelAndGreyCheck() {
        FilterRules parody = rules(b -> b.addLabel(FilterRules.PARODY));
        FilterRules government = rules(b -> b.addLabel(FilterRules.GOVERNMENT));
        FilterSubject parodyAccount = new FilterSubject("someone", 42, null, null, null, null, null, "parody", false, null,
                -1, -1, false);
        FilterSubject agency = new FilterSubject("someone", 42, null, null, null, null, null, null, true, null, -1, -1, false);
        assertEquals(Reason.LABEL.bit, match(parody, parodyAccount, null));
        assertEquals(0, match(parody, agency, null));
        assertEquals(Reason.LABEL.bit, match(government, agency, null));
        assertEquals(0, match(government, parodyAccount, null));
    }

    @Test
    public void affiliationsMatchPartlyEitherWay() {
        FilterRules rules = rules(b -> b.addAffiliation("Example"));
        FilterSubject labelled = new FilterSubject("someone", 42, null, null, null, null, null, null, false,
                "Example News Network", -1, -1, false);
        assertEquals(Reason.AFFILIATION.bit, match(rules, labelled, null));
        AccountInfo fromX = new AccountInfo(null, null, null, "example", 0, AccountInfo.ORIGIN_X, 42);
        assertEquals(Reason.AFFILIATION.bit, match(rules, user(null, null), fromX));
        assertEquals(0, match(rules, user(null, null), null));
    }

    @Test
    public void countThresholdsAreInclusiveAndIgnoreUnknownCounts() {
        FilterRules rules = rules(b -> {
            b.setMinFollowing(5000);
            b.setMinPosts(100000);
        });
        FilterSubject atThreshold = new FilterSubject("someone", 42, null, null, null, null, null, null, false, null,
                5000, 100000, false);
        FilterSubject below = new FilterSubject("someone", 42, null, null, null, null, null, null, false, null,
                4999, 99999, false);
        assertEquals(Reason.FOLLOWING.bit | Reason.POSTS.bit, match(rules, atThreshold, null));
        assertEquals(0, match(rules, below, null));
        assertEquals(0, match(rules, user(null, null), null));
    }

    @Test
    public void digitsInHandlesAndNamesAreCountedSeparately() {
        FilterRules rules = rules(b -> {
            b.setMinHandleDigits(5);
            b.setMinNameDigits(3);
        });
        FilterSubject digits = new FilterSubject("a1b2c3d4e5", 42, "Bob 12", null, null, null, null, null, false, null,
                -1, -1, false);
        assertEquals(Reason.HANDLE_DIGITS.bit, match(rules, digits, null));
        assertEquals(Reason.NAME_DIGITS.bit, match(rules, user("\uD835\uDFD9\uD835\uDFDA\uD835\uDFDB", null), null));
    }

    @Test
    public void locationWarningsAndLanguagesAreLeftToTheEnclosingPost() {
        FilterRules rules = rules(b -> {
            b.warnedAccounts = true;
            b.addLanguage("id");
        });
        AccountInfo warned = new AccountInfo("Germany", null, false, null, 0, AccountInfo.ORIGIN_X, 42);
        int post = FilterMatcher.match(rules, user(null, null), warned, "in", false);
        assertEquals(Reason.LOCATION_WARNING.bit | Reason.LANGUAGE.bit, post);
        assertEquals(0, FilterMatcher.match(rules, user(null, null), warned, "in", true));
        assertEquals(0, FilterMatcher.match(rules, user(null, null), reported("Germany"), "und", false));
    }

    @Test
    public void alwaysShowBeatsEveryFilterIncludingLanguage() {
        FilterRules rules = rules(b -> {
            b.putAccount(42, "someone");
            b.addLanguage("ja");
            b.addAlwaysShow("@SomeOne");
        });
        assertEquals(0, FilterMatcher.match(rules, user(null, null), reported("Germany"), "ja", false));
        FilterSubject stranger = new FilterSubject("stranger", 42, null, null, null, null, null, null, false, null,
                -1, -1, false);
        assertEquals(Reason.ACCOUNT.bit | Reason.LANGUAGE.bit, FilterMatcher.match(rules, stranger, null, "ja", false));
    }

    @Test
    public void followedAccountsAreExemptOnlyWhenChosenAndReported() {
        FilterSubject followed = new FilterSubject("someone", 42, null, null, null, null, null, null, false, null,
                -1, -1, true);
        FilterRules filterOnly = rules(b -> b.putAccount(42, null));
        assertEquals(Reason.ACCOUNT.bit, match(filterOnly, followed, null));
        FilterRules exemptFollowed = rules(b -> {
            b.putAccount(42, null);
            b.alwaysShowFollowing = true;
        });
        assertEquals(0, match(exemptFollowed, followed, null));
        assertEquals(Reason.ACCOUNT.bit, match(exemptFollowed, user(null, null), null));
    }

    @Test
    public void reasonLabelsFollowTheirOrder() {
        int reasons = Reason.LANGUAGE.bit | Reason.COUNTRY.bit;
        assertEquals(Arrays.asList("Country", "Post language"), Reason.labels(reasons));
        assertTrue(Reason.COUNTRY.in(reasons));
    }
}
