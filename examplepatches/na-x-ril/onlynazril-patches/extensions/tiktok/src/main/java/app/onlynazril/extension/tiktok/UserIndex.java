package app.onlynazril.extension.tiktok;

import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * The handle behind a reply line, resolved by account id rather than by name, and cross-checked
 * against the comment being replied to.
 *
 * A reply reference (`@name > @name`) is drawn from a half built user: it carries no uid, and its
 * uniqueId reads back as the nickname, so the render alone cannot say which account it is. The
 * comment it belongs to can. It carries `replyToUserId`, the uid of the person being replied to,
 * and `replyToReplyId`, the cid of the comment that person wrote. Both are remembered per thread
 * at the bind, and the handle is looked up by uid.
 *
 * The parent comment is the second source. Every bound comment records its cid against its author's
 * uid, nickname and handle, so a reply whose parent is in the list can be proven twice: the parent's
 * uid has to match `replyToUserId`, its nickname has to match the name on the reply line, and a
 * handle it carries has to agree with the one learned for the uid. Any disagreement suppresses the
 * stamp instead of guessing. A parent that was never bound simply adds no evidence.
 *
 * Names are only a check, never a key: two accounts can share one, and a guessed handle is worse
 * than the name TikTok drew. Bounded on purpose, since the comment list is unbounded and only
 * recent entries are ever asked for.
 */
public final class UserIndex {
    private static final int MAX_ENTRIES = 512;

    private static final Map<String, String> HANDLE_BY_UID = new ConcurrentHashMap<>();
    private static final Map<String, String> NICKNAME_BY_UID = new ConcurrentHashMap<>();
    private static final Map<String, String> UID_BY_CID = new ConcurrentHashMap<>();
    private static final Map<String, String> NICKNAME_BY_CID = new ConcurrentHashMap<>();
    private static final Map<String, String> HANDLE_BY_CID = new ConcurrentHashMap<>();

    /** The reply the current thread is binding: {uid, nickname, parent cid}. */
    private static final ThreadLocal<String[]> REPLY = new ThreadLocal<>();

    private UserIndex() {}

    /**
     * Records the comment being bound, so a later reply can be checked against it by cid. A comment
     * with no cid or no author is skipped: it can prove nothing.
     */
    public static void rememberComment(String cid, String uid, String nickname, String handle) {
        if (cid == null || cid.isEmpty()) return;
        if (uid != null && !uid.isEmpty()) putBounded(UID_BY_CID, cid, uid);
        if (nickname != null && !nickname.trim().isEmpty()) {
            putBounded(NICKNAME_BY_CID, cid, nickname.trim());
        }
        if (handle != null) putBounded(HANDLE_BY_CID, cid, handle);
    }

    /**
     * Called with every comment as it is bound, before its name is drawn. A comment that replies to
     * nobody clears the marker, so a later render on the same thread cannot inherit an old reply.
     */
    public static void rememberReply(String nickname, String uid, String parentCid) {
        if (uid == null || uid.isEmpty()) {
            REPLY.remove();
            return;
        }
        REPLY.set(new String[] {uid, nickname, parentCid});
        if (nickname != null && !nickname.trim().isEmpty()) {
            putBounded(NICKNAME_BY_UID, uid, nickname.trim());
        }
    }

    /** Called with every real user, the ones a payload fills in completely. */
    public static void learnUser(String uid, String handle) {
        if (uid == null || uid.isEmpty() || handle == null) return;
        putBounded(HANDLE_BY_UID, uid, handle);
    }

    /** The handle behind the reply this thread is binding, or null when it cannot be proven. */
    public static String handleOfReply(String nickname) {
        String[] reply = REPLY.get();
        if (reply == null) return null;
        String uid = reply[0];
        String parentCid = reply[2];

        // The parent comment is the second source: where it exists, both the account and the name
        // have to agree with the reply reference before anything is stamped.
        String uidHandle = HANDLE_BY_UID.get(uid);
        if (parentCid != null && !parentCid.isEmpty()) {
            String parentUid = UID_BY_CID.get(parentCid);
            if (parentUid != null && !parentUid.equals(uid)) return null;
            String parentName = NICKNAME_BY_CID.get(parentCid);
            if (parentName != null && nickname != null
                    && !normalize(parentName).equals(normalize(nickname))) {
                return null;
            }
            String parentHandle = HANDLE_BY_CID.get(parentCid);
            if (parentHandle != null && uidHandle != null && !parentHandle.equals(uidHandle)) {
                return null;
            }
            if (uidHandle == null && parentHandle != null) return checked(parentHandle, nickname, uid);
        }
        return checked(uidHandle, nickname, uid);
    }

    /** Whether the reply reference currently being drawn disagrees with what its uid is known as. */
    public static boolean replyNameDisagrees(String nickname) {
        String[] reply = REPLY.get();
        if (reply == null || nickname == null) return false;
        String learned = NICKNAME_BY_UID.get(reply[0]);
        return learned != null && !normalize(learned).equals(normalize(nickname));
    }

    /** The name on the reply line has to be the name the uid is known by. */
    private static String checked(String handle, String nickname, String uid) {
        if (handle == null) return null;
        String learned = NICKNAME_BY_UID.get(uid);
        if (learned != null && nickname != null && !normalize(learned).equals(normalize(nickname))) {
            return null;
        }
        return handle;
    }

    private static void putBounded(Map<String, String> map, String key, String value) {
        if (map.size() >= MAX_ENTRIES) map.clear();
        map.put(key, value);
    }

    private static String normalize(String text) {
        return text.trim().toLowerCase(Locale.ROOT);
    }
}
