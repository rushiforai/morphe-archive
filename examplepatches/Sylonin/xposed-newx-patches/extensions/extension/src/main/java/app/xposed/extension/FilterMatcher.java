package app.xposed.extension;

import java.util.ArrayList;
import java.util.List;

/**
 * Decides which filters an account or post matches, as X-Posed's resolveBlockReasons does.
 * Returns a bit set of {@link Reason}s; 0 means no match. Unknown data never matches.
 * Text matching folds strings, so callers cache the result per account and rules snapshot.
 */
final class FilterMatcher {
    enum Reason {
        ACCOUNT("Account"),
        COUNTRY("Country"),
        REGION("Region"),
        NAME("Display name"),
        BIO("Bio or profile location"),
        LINK("Linked domain or URL"),
        LABEL("Account label"),
        AFFILIATION("Affiliation"),
        FOLLOWING("Following"),
        POSTS("Total posts"),
        HANDLE_DIGITS("Digits in handle"),
        NAME_DIGITS("Digits in display name"),
        LOCATION_WARNING("Location warning"),
        LANGUAGE("Post language");

        final String label;
        final int bit = 1 << ordinal();

        Reason(String label) {
            this.label = label;
        }

        boolean in(int reasons) {
            return (reasons & bit) != 0;
        }

        static List<String> labels(int reasons) {
            List<String> labels = new ArrayList<>();
            for (Reason r : values()) if (r.in(reasons)) labels.add(r.label);
            return labels;
        }

        /** The first two matched filters, "Country · Bio · +2 more", as X-Posed's placeholders name them. */
        static String summary(int reasons) {
            List<String> labels = labels(reasons);
            if (labels.isEmpty()) return "Matches your filters";
            String shown = String.join(" \u00B7 ", labels.subList(0, Math.min(2, labels.size())));
            return labels.size() > 2 ? shown + " \u00B7 +" + (labels.size() - 2) + " more" : shown;
        }
    }

    /**
     * X-Posed's global data source settings, which apply to every filter profile. Compared
     * by identity in caches, so {@link Settings} keeps one instance per combination.
     */
    static final class Sources {
        static final Sources DEFAULT = new Sources(false, true);

        /** Use the connection source's country for location filters ("Use device country"). */
        final boolean deviceCountry;
        /** Use bios, links and activity counts ("Use profile details"). */
        final boolean profileDetails;

        Sources(boolean deviceCountry, boolean profileDetails) {
            this.deviceCountry = deviceCountry;
            this.profileDetails = profileDetails;
        }
    }

    private FilterMatcher() {
    }

    /** Reasons a quoted account is exempt from: they are left to the enclosing post, as in X-Posed. */
    static final int QUOTE_EXEMPT = Reason.LOCATION_WARNING.bit | Reason.LANGUAGE.bit;

    /** Filters that need profile details; they stay saved but inactive while those are off. */
    static final int PROFILE_DETAILS = Reason.BIO.bit | Reason.LINK.bit | Reason.FOLLOWING.bit | Reason.POSTS.bit;

    /**
     * True for accounts no filter applies to, as X-Posed's isAuthorExempt: Always Show, and
     * accounts the signed-in account follows when that option is on. Follow status counts only
     * when X reports it; the signed-in account itself is exempted by the caller.
     */
    static boolean exempt(FilterRules rules, FilterSubject who) {
        return who.handle != null && rules.alwaysShow.contains(who.handle) || rules.alwaysShowFollowing && who.followedByMe;
    }

    /**
     * The filters the author of a post or quote matches. info is what X reports about the
     * account, or null while it loads; language is the post's language, or null. Exempt
     * authors match nothing, their post language included.
     */
    static int match(FilterRules rules, FilterSubject who, AccountInfo info, String language, boolean quote) {
        return match(rules, who, info, language, quote, Sources.DEFAULT);
    }

    static int match(FilterRules rules, FilterSubject who, AccountInfo info, String language, boolean quote, Sources sources) {
        if (who != null && exempt(rules, who)) return 0;
        return post(rules, account(rules, who, info, sources), language, quote);
    }

    /** A post's filters from its author's account filters: adds the post language and drops what quotes ignore. */
    static int post(FilterRules rules, int account, String language, boolean quote) {
        int reasons = account | language(rules, language);
        return quote ? reasons & ~QUOTE_EXEMPT : reasons;
    }

    /** The account filters, location warnings included; the same for every post of the account. */
    static int account(FilterRules rules, FilterSubject who, AccountInfo info, Sources sources) {
        if (rules.isEmpty() || who == null || exempt(rules, who)) return 0;
        int reasons = 0;
        if (who.userId != 0 && rules.accounts.containsKey(who.userId)) reasons |= Reason.ACCOUNT.bit;
        if (info != null) reasons |= location(rules, info.country(sources.deviceCountry));
        if (!rules.labels.isEmpty() && hasLabel(rules, who)) reasons |= Reason.LABEL.bit;
        if (rules.minFollowing > 0 && who.following >= rules.minFollowing) reasons |= Reason.FOLLOWING.bit;
        if (rules.minPosts > 0 && who.posts >= rules.minPosts) reasons |= Reason.POSTS.bit;
        if (rules.minHandleDigits > 0 && FilterText.handleDigits(who.handle) >= rules.minHandleDigits) {
            reasons |= Reason.HANDLE_DIGITS.bit;
        }
        if (rules.minNameDigits > 0 && who.displayName != null
                && FilterText.decimalDigits(who.displayName) >= rules.minNameDigits) {
            reasons |= Reason.NAME_DIGITS.bit;
        }
        if (rules.warnedAccounts && info != null && info.hasLocationWarning()) reasons |= Reason.LOCATION_WARNING.bit;
        if (rules.affiliationTerms.length > 0 && (affiliated(rules.affiliationTerms, who.affiliation)
                || info != null && affiliated(rules.affiliationTerms, info.affiliation))) {
            reasons |= Reason.AFFILIATION.bit;
        }
        if (who.displayName != null && contains(rules.nameTerms, FilterText.fold(who.displayName))) {
            reasons |= Reason.NAME.bit;
        }
        if (rules.bioTerms.length > 0 && bioMatches(rules, who)) reasons |= Reason.BIO.bit;
        if (!rules.links.isEmpty() && linked(rules, who)) reasons |= Reason.LINK.bit;
        return sources.profileDetails ? reasons : reasons & ~PROFILE_DETAILS;
    }

    /** The language filter for a post; "und" and unknown languages never match. */
    static int language(FilterRules rules, String language) {
        if (language == null || rules.languages.isEmpty()) return 0;
        return rules.languages.contains(FilterText.language(language)) ? Reason.LANGUAGE.bit : 0;
    }

    private static int location(FilterRules rules, String location) {
        if (location == null || rules.locationKeys.isEmpty()) return 0;
        String key = Countries.canonicalKey(location);
        if (rules.locationKeys.contains(key)) {
            return Countries.region(location) != null ? Reason.REGION.bit : Reason.COUNTRY.bit;
        }
        return rules.coveredCountries.contains(key) ? Reason.REGION.bit : 0;
    }

    private static boolean hasLabel(FilterRules rules, FilterSubject who) {
        return who.government && rules.labels.contains(FilterRules.GOVERNMENT)
                || who.label != null && rules.labels.contains(who.label);
    }

    /** Part of the name or handle is enough, either way round, as in X-Posed. */
    private static boolean affiliated(String[] terms, String affiliation) {
        if (affiliation == null) return false;
        String candidate = FilterText.fold(affiliation.startsWith("@") ? affiliation.substring(1) : affiliation).trim();
        if (candidate.isEmpty()) return false;
        for (String term : terms) {
            if (candidate.contains(term) || term.contains(candidate)) return true;
        }
        return false;
    }

    private static boolean bioMatches(FilterRules rules, FilterSubject who) {
        if (who.bio != null && contains(rules.bioTerms, FilterText.fold(who.bio))) return true;
        return rules.bioMatchesLocation && who.profileLocation != null
                && contains(rules.bioTerms, FilterText.fold(who.profileLocation));
    }

    private static boolean linked(FilterRules rules, FilterSubject who) {
        for (String url : who.websiteUrls) if (Links.match(url, rules.domains, rules.urls) != null) return true;
        for (String url : who.bioUrls) if (Links.match(url, rules.domains, rules.urls) != null) return true;
        if (rules.linksMatchLocation && who.profileLocation != null) {
            for (String link : Links.inText(who.profileLocation)) {
                if (Links.match(link, rules.domains, rules.urls) != null) return true;
            }
        }
        return false;
    }

    private static boolean contains(String[] terms, String folded) {
        if (folded.isEmpty()) return false;
        for (String term : terms) if (folded.contains(term)) return true;
        return false;
    }
}
