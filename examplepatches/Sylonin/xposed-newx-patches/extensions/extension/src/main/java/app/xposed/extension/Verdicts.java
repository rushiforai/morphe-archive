package app.xposed.extension;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Filter verdicts per account. A verdict is computed from X's user object and cached until
 * that object, the account's profile details, X's report about it or the rules change, so
 * recomposing a post costs a few identity checks.
 */
final class Verdicts {
    private static final int LIMIT = 2000;

    private static final class Verdict {
        final Object source;
        final Observed.Profile profile;
        final FilterSubject subject;
        final FilterRules rules;
        final FilterMatcher.Sources sources;
        final AccountInfo info;
        final boolean exempt;
        final int reasons;

        Verdict(Object source, Observed.Profile profile, FilterSubject subject, FilterRules rules,
                FilterMatcher.Sources sources, AccountInfo info, boolean exempt, int reasons) {
            this.source = source;
            this.profile = profile;
            this.subject = subject;
            this.rules = rules;
            this.sources = sources;
            this.info = info;
            this.exempt = exempt;
            this.reasons = reasons;
        }

        boolean isCurrent(FilterRules rules, FilterMatcher.Sources sources, AccountInfo info) {
            return this.rules == rules && this.sources == sources && this.info == info;
        }
    }

    private static final Map<String, Verdict> byHandle = new LinkedHashMap<String, Verdict>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Verdict> eldest) {
            return size() > LIMIT;
        }
    };

    private Verdicts() {
    }

    /** The signed-in account is exempt from every filter. */
    static boolean isViewer(long userId) {
        return userId != 0 && userId == Observed.viewer();
    }

    /**
     * The filters a post or quote matches, from its author as X shows it and the post's
     * language (null for quotes). Schedules a lookup when the author's location is unknown.
     */
    static int forPost(Object user, String handle, long userId, String language, boolean quote) {
        FilterRules rules = Filters.rules();
        FilterMatcher.Sources sources = Settings.sources();
        if (rules.isEmpty() || isViewer(userId)) return 0;
        AccountInfo info = Lookup.get(handle);
        Observed.Profile profile = userId != 0 ? Observed.profile(userId) : null;
        Verdict e;
        synchronized (byHandle) {
            e = byHandle.get(handle);
        }
        boolean sameAccount = e != null && e.source == user && e.profile == profile;
        if (!sameAccount || !e.isCurrent(rules, sources, info)) {
            FilterSubject subject = sameAccount ? e.subject : subjectOf(user, handle, userId, profile);
            e = new Verdict(user, profile, subject, rules, sources, info, FilterMatcher.exempt(rules, subject),
                    FilterMatcher.account(rules, subject, info, sources));
            synchronized (byHandle) {
                byHandle.put(handle, e);
            }
        }
        return e.exempt ? 0 : FilterMatcher.post(rules, e.reasons, language, quote);
    }

    /**
     * The filters a post in a client event matches, from what was shown of its author. Never
     * schedules lookups: events arrive in bulk off the main thread.
     */
    static int forEvent(long authorId, long postId) {
        return forKnownPost(Users.handleFor(authorId), authorId, Observed.language(postId));
    }

    /**
     * The filters a post matches when only its author's handle, id and the post's language are
     * known, such as a post that another one replies to. Uses what was shown of the author;
     * never schedules lookups.
     */
    static int forKnownPost(String handle, long authorId, String language) {
        FilterRules rules = Filters.rules();
        FilterMatcher.Sources sources = Settings.sources();
        if (rules.isEmpty() || handle == null) return 0;
        long id = authorId != 0 ? authorId : Users.idFor(handle);
        if (isViewer(id)) return 0;
        AccountInfo info = Lookup.peek(handle);
        Verdict e;
        synchronized (byHandle) {
            e = byHandle.get(handle);
        }
        FilterSubject subject = e != null ? e.subject : FilterSubject.minimal(handle, id);
        if (FilterMatcher.exempt(rules, subject)) return 0;
        int account = e != null && e.isCurrent(rules, sources, info)
                ? e.reasons : FilterMatcher.account(rules, subject, info, sources);
        return FilterMatcher.post(rules, account, language, false);
    }

    /** True when no filter applies to this account: the signed-in one, or an exemption. Call after {@link #forPost}. */
    static boolean isExempt(String handle, long userId) {
        if (isViewer(userId)) return true;
        synchronized (byHandle) {
            Verdict e = byHandle.get(handle);
            return e != null && e.exempt;
        }
    }

    /** True when X last reported that the signed-in account follows this one. */
    static boolean followedByMe(String handle) {
        synchronized (byHandle) {
            Verdict e = byHandle.get(handle);
            return e != null && e.subject.followedByMe;
        }
    }

    private static FilterSubject subjectOf(Object user, String handle, long userId, Observed.Profile profile) {
        List<String> website = profile != null && profile.website != null
                ? Collections.singletonList(profile.website) : Collections.emptyList();
        return new FilterSubject(handle, userId, ModelBridge.displayName(user), ModelBridge.bio(user),
                profile != null ? profile.location : null, website, links(ModelBridge.bioLinks(user)),
                ModelBridge.label(user), ModelBridge.verification(user) == ModelBridge.VERIFIED_GOVERNMENT, ModelBridge.affiliation(user),
                ModelBridge.following(user), profile != null ? profile.posts : -1, ModelBridge.followedByMe(user));
    }

    private static List<String> links(List<?> entities) {
        if (entities == null || entities.isEmpty()) return Collections.emptyList();
        List<String> urls = new ArrayList<>(entities.size());
        for (Object entity : entities) {
            String url = ModelBridge.expandedUrl(entity);
            if (url != null) urls.add(url);
        }
        return urls;
    }
}
