package app.xposed.extension;

import java.util.Collections;
import java.util.List;

/**
 * An account as X's data shows it, for the filters. Every field is what X already loaded:
 * null strings, empty lists and -1 counts mean unknown, never "none".
 */
final class FilterSubject {
    /** Lowercase handle without "@". */
    final String handle;
    /** X's numeric user id, 0 when unknown. */
    final long userId;
    final String displayName, bio, profileLocation;
    /** Expanded destinations of the profile website and of the links in the bio. */
    final List<String> websiteUrls, bioUrls;
    /** "parody", "commentary" or "fan", or null. */
    final String label;
    /** True when X marks the account with the grey government or multilateral checkmark. */
    final boolean government;
    /** The organization of the account's highlighted label, or null. */
    final String affiliation;
    /** Accounts followed and posts written, or -1. */
    final long following, posts;
    /** True when X reports that the signed-in account follows this one; false also when X didn't say. */
    final boolean followedByMe;

    FilterSubject(String handle, long userId, String displayName, String bio, String profileLocation,
                  List<String> websiteUrls, List<String> bioUrls, String label, boolean government,
                  String affiliation, long following, long posts, boolean followedByMe) {
        this.handle = handle;
        this.userId = userId;
        this.displayName = displayName;
        this.bio = bio;
        this.profileLocation = profileLocation;
        this.websiteUrls = websiteUrls != null ? websiteUrls : Collections.emptyList();
        this.bioUrls = bioUrls != null ? bioUrls : Collections.emptyList();
        this.label = label;
        this.government = government;
        this.affiliation = affiliation;
        this.following = following;
        this.posts = posts;
        this.followedByMe = followedByMe;
    }

    /** An account known only by its handle and id, as in client events for unseen posts. */
    static FilterSubject minimal(String handle, long userId) {
        return new FilterSubject(handle, userId, null, null, null, null, null, null, false, null, -1, -1, false);
    }
}
