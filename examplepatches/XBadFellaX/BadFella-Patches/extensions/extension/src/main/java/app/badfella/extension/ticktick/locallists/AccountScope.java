package app.badfella.extension.ticktick.locallists;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Identifies one TickTick account on one server realm.
 *
 * <p>Rows in the local organizer are keyed by {@link #tag()}. The tag is a
 * one-way digest so the raw account id is not written to the organizer or to
 * exported backups. A backup therefore works only for the same account and
 * realm, without publishing the account id itself.</p>
 */
public final class AccountScope {
    private static final String TAG_PREFIX = "badfella-local-lists-v1\n";

    private final String userId;
    private final String realm;

    public AccountScope(String userId, String realm) {
        if (userId == null || userId.trim().isEmpty()) {
            throw new IllegalArgumentException("A signed-in account is required");
        }
        this.userId = userId.trim();
        String normalizedRealm = realm == null ? "" : realm.trim().toLowerCase(java.util.Locale.ROOT);
        this.realm = normalizedRealm.isEmpty() ? "unknown" : normalizedRealm;
    }

    public String getUserId() {
        return userId;
    }

    public String getRealm() {
        return realm;
    }

    /** Stable, non-reversible scope key. */
    public String tag() {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(
                    (TAG_PREFIX + realm + "\n" + userId).getBytes("UTF-8"));
            StringBuilder result = new StringBuilder(hash.length * 2);
            for (byte value : hash) {
                result.append(Character.forDigit((value >> 4) & 0x0f, 16));
                result.append(Character.forDigit(value & 0x0f, 16));
            }
            return result.toString();
        } catch (NoSuchAlgorithmException error) {
            throw new IllegalStateException("SHA-256 is unavailable", error);
        } catch (UnsupportedEncodingException error) {
            throw new IllegalStateException("UTF-8 is unavailable", error);
        }
    }

    /** Short label suitable for a preview dialog; not used as a storage key. */
    public String shortTag() {
        String tag = tag();
        return tag.substring(0, 12);
    }

    @Override
    public boolean equals(Object other) {
        return other instanceof AccountScope
                && tag().equals(((AccountScope) other).tag());
    }

    @Override
    public int hashCode() {
        return tag().hashCode();
    }

    @Override
    public String toString() {
        return "AccountScope{" + realm + ", " + shortTag() + "}";
    }
}
