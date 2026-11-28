package app.xposed.extension;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * What the account sheet and its image show about one account: X-Posed's account card. It
 * combines what X showed of the account (its user model), what "About this account" or the
 * community cache reported, and the profile details X loaded.
 */
final class AccountCard {
    private static final long YEAR_MS = TimeUnit.DAYS.toMillis(365) + TimeUnit.HOURS.toMillis(6);
    private static final Pattern HANDLE = Pattern.compile("[A-Za-z0-9_]{1,15}");
    /** A profile picture: the name, an optional size X added, the format. */
    private static final Pattern AVATAR = Pattern.compile(
            "/profile_images/\\d+/[\\w.-]{1,160}?(_normal|_bigger|_mini|_x96|_200x200|_400x400)?\\.(jpe?g|png|webp|gif)",
            Pattern.CASE_INSENSITIVE);

    /** What X last showed of an account, copied from its user model. */
    static final class Person {
        final String name, avatarUrl, labelName, labelBadgeUrl, labelUrl;
        final boolean squareAvatar, isProtected;
        /** One of ModelBridge's verification codes. */
        final int verification;
        /** 0 when unknown. */
        final long userId, createdAt;
        /** -1 when unknown. */
        final long followers, following;

        Person(String name, String avatarUrl, boolean squareAvatar, int verification, boolean isProtected, long userId,
               long createdAt, long followers, long following, String labelName, String labelBadgeUrl, String labelUrl) {
            this.name = blankToNull(name);
            this.avatarUrl = avatarUrl;
            this.squareAvatar = squareAvatar;
            this.verification = verification;
            this.isProtected = isProtected;
            this.userId = userId;
            this.createdAt = createdAt;
            this.followers = followers;
            this.following = following;
            this.labelName = blankToNull(labelName);
            this.labelBadgeUrl = labelBadgeUrl;
            this.labelUrl = labelUrl;
        }

        static Person of(Object user) {
            return new Person(ModelBridge.displayName(user), ModelBridge.avatarUrl(user), ModelBridge.squareAvatar(user),
                    ModelBridge.verification(user), ModelBridge.isProtected(user), ModelBridge.userId(user),
                    ModelBridge.instantMillis(ModelBridge.createdAt(user)), ModelBridge.followers(user),
                    ModelBridge.following(user), ModelBridge.affiliation(user), ModelBridge.labelBadgeUrl(user),
                    ModelBridge.labelUrl(user));
        }
    }

    final String handle;
    /** Null when X's user model for the account wasn't seen. */
    final String name;
    /** X's image server only, sized for the header; null without one. */
    final String avatarUrl;
    final boolean squareAvatar;
    final int verification;
    final boolean identityVerified, isProtected;
    final String location, source;
    final boolean locationWarning;
    /** -1 when unknown, or when "Use profile details" is off. */
    final long followers, following, posts;
    /** Epoch millis, 0 when unknown. */
    final long createdAt, verifiedSince;
    /** 0 when unknown. */
    final int verifiedYear;
    /** -1 when unknown. */
    final int handleChanges;
    final String affiliation, affiliationBadge, affiliationUrl;
    /** 0 when unknown. */
    final long userId;
    final boolean fromCloud;
    final long observedAt;

    private AccountCard(String handle, AccountInfo info, Person person, boolean counts, long posts, long knownUserId) {
        this.handle = handle;
        name = person != null ? person.name : null;
        avatarUrl = person != null ? avatarUrl(person.avatarUrl) : null;
        squareAvatar = person != null && person.squareAvatar;
        verification = person != null ? person.verification : ModelBridge.NOT_VERIFIED;
        isProtected = person != null && person.isProtected;
        identityVerified = Boolean.TRUE.equals(info.details.identityVerified);
        location = info.location;
        source = info.source;
        locationWarning = info.hasLocationWarning();
        followers = counts && person != null ? Math.max(-1, person.followers) : -1;
        following = counts && person != null ? Math.max(-1, person.following) : -1;
        this.posts = counts ? Math.max(-1, posts) : -1;
        // X's model is exact; About's copy is the same, the community cache's has seconds.
        createdAt = person != null && person.createdAt > 0 ? person.createdAt : info.details.createdAt;
        verifiedSince = info.details.verifiedSince;
        verifiedYear = info.details.verifiedYear;
        handleChanges = info.details.handleChanges;

        boolean fromX = AccountInfo.ORIGIN_X.equals(info.origin);
        String label = person != null ? person.labelName : null;
        if (label != null) {
            affiliation = label;
            affiliationBadge = imageUrl(person.labelBadgeUrl);
        } else {
            // X gives the affiliate's handle; the community cache only has its name.
            affiliation = info.affiliation == null ? null : fromX ? "@" + info.affiliation : info.affiliation;
            affiliationBadge = null;
        }
        String link = label != null ? webUrl(person.labelUrl) : null;
        if (link == null && fromX && info.affiliation != null && HANDLE.matcher(info.affiliation).matches()) {
            link = "https://x.com/" + info.affiliation;
        }
        affiliationUrl = affiliation != null ? link : null;

        userId = info.userId != 0 ? info.userId : person != null && person.userId != 0 ? person.userId : knownUserId;
        fromCloud = AccountInfo.ORIGIN_CLOUD.equals(info.origin);
        observedAt = info.observedAt;
    }

    /**
     * The card for [handle]. person is null when X's user model wasn't seen; counts is "Use
     * profile details", which X-Posed also requires for activity counts; posts is -1 when unknown.
     */
    static AccountCard of(String handle, AccountInfo info, Person person, boolean counts, long posts, long knownUserId) {
        return new AccountCard(handle, info, person, counts, posts, knownUserId);
    }

    boolean hasCounts() {
        return followers >= 0 || following >= 0 || posts >= 0;
    }

    boolean hasHistory() {
        return createdAt > 0 || verifiedSince > 0 || verifiedYear > 0 || handleChanges >= 0 || affiliation != null || userId > 0;
    }

    /** Whole years since [createdAt], or -1 when unknown. */
    static int ageYears(long createdAt, long now) {
        if (createdAt <= 0) return -1;
        return now <= createdAt ? 0 : (int) ((now - createdAt) / YEAR_MS);
    }

    /** The link to an account by its permanent user ID, which survives handle changes; null without an ID. */
    static String profileLink(long userId) {
        return userId > 0 ? "https://x.com/i/user/" + userId : null;
    }

    /** An image on X's image server, as given; null for anything else. */
    static String imageUrl(String raw) {
        URI uri = parse(raw, 512);
        return uri != null && "pbs.twimg.com".equalsIgnoreCase(uri.getHost()) ? uri.toString() : null;
    }

    /**
     * A profile picture on X's image server, in X's 200x200 size: sharp at the header's size
     * on any screen, without loading the original upload. Null for anything else.
     */
    static String avatarUrl(String raw) {
        String url = imageUrl(raw);
        if (url == null) return null;
        String path = URI.create(url).getRawPath();
        Matcher m = AVATAR.matcher(path);
        if (!m.matches()) return null;
        int extension = m.start(2) - 1;
        String sized = m.group(1) != null
                ? path.substring(0, m.start(1)) + "_200x200" + path.substring(m.end(1))
                : path.substring(0, extension) + "_200x200" + path.substring(extension);
        return "https://pbs.twimg.com" + sized;
    }

    /** An https page to open, or null. */
    static String webUrl(String raw) {
        URI uri = parse(raw, 2048);
        return uri != null ? uri.toString() : null;
    }

    private static URI parse(String raw, int maxLength) {
        if (raw == null || raw.length() > maxLength) return null;
        try {
            URI uri = new URI(raw);
            boolean safe = "https".equalsIgnoreCase(uri.getScheme()) && uri.getHost() != null && !uri.getHost().isEmpty()
                    && uri.getRawUserInfo() == null && uri.getPort() == -1;
            return safe ? uri : null;
        } catch (URISyntaxException e) {
            return null;
        }
    }

    private static String blankToNull(String s) {
        if (s == null) return null;
        s = s.trim();
        return s.isEmpty() ? null : s;
    }
}
