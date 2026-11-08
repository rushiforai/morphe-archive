package app.morphe.extension.swiftbackup;

import org.json.JSONObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.Objects;

/** Connects the native blacklist preferences and observers to the signed-in account's metadata. */
public final class BlacklistSync {
    // Resolve the app's 5.1.0 types lazily so loading the metadata journal doesn't initialize the blacklist repository.
    private static final class Native {
        static final String MODEL = "org.swiftapps.swiftbackup.blacklist.data.BlacklistData";
        static final Class<?> REPO = type("gs0");
        static final Class<?> DATA = type(MODEL);

        private static Class<?> type(String name) {
            try {
                return Class.forName(name);
            } catch (ClassNotFoundException error) {
                throw new IllegalStateException(error);
            }
        }
    }

    // Guarded by the native repository monitor, which also protects its preference loader and observer updates.
    private static String appliedUid;
    private static String appliedValue;

    private BlacklistSync() {}

    /** Never look up another account's list or treat the anonymous session as signed in. */
    private static String signedInUid() throws Exception {
        Object user = Class.forName("d45").getMethod("a").invoke(null);
        if (user == null || Boolean.TRUE.equals(user.getClass().getMethod("isAnonymous").invoke(user))) return null;
        return (String) user.getClass().getMethod("getUid").invoke(user);
    }

    /** Use the same serializer as the native exporter, stripping the device's transient install status. */
    private static String encode(Object blacklist) throws Exception {
        if (blacklist == null) return "{}";
        Object gson = Class.forName("w14").getMethod("d").invoke(null);
        String json = (String) gson.getClass().getMethod("i", Object.class).invoke(gson, blacklist);
        JSONObject value = new JSONObject(json);
        JSONObject entries = value.optJSONObject("dataMap");
        if (entries != null) {
            for (Iterator<String> keys = entries.keys(); keys.hasNext(); ) {
                entries.getJSONObject(keys.next()).remove("isInstalled");
            }
        }
        return value.toString();
    }

    /** Let the native setter normalize, persist and notify the UI without echoing a downloaded list to the cloud. */
    private static void apply(Object repo, String value) throws Exception {
        Object blacklist = null;
        if (value != null) {
            Object gson = Class.forName("w14").getMethod("c").invoke(null);
            Method parse = gson.getClass().getMethod("c", String.class, Class.class);
            blacklist = parse.invoke(gson, value, Native.DATA);
        }
        Native.REPO.getMethod("d", Native.DATA, boolean.class).invoke(repo, blacklist, false);
    }

    /** Update the restore cursor only after native preferences and observers have accepted the new list. */
    private static void publish(Object repo, String uid, String value) throws Exception {
        apply(repo, value);
        appliedUid = uid;
        appliedValue = value;
    }

    /** Called at sign-in and after metadata sync, including when cloud connects after first-run setup. */
    public static boolean restore() throws Exception {
        Object repo = Native.REPO.getField("a").get(null);
        synchronized (repo) {
            String uid = signedInUid();
            if (uid == null) {
                appliedUid = null;
                appliedValue = null;
                return false;
            }
            String saved = LocalDb.accountBlacklist(uid);
            // Absence can mean the cloud hasn't been read yet. Clear only a list already applied for this account.
            boolean sameAccount = uid.equals(appliedUid);
            if (saved != null ? !sameAccount || !saved.equals(appliedValue) : sameAccount && appliedValue != null) {
                publish(repo, uid, saved);
            }
            return true;
        }
    }

    /** Intercept signed-in user edits before the stock setter sends a whole-list replacement. */
    public static boolean edit(Object repo, Object requested) throws Exception {
        synchronized (repo) {
            String uid = signedInUid();
            if (uid == null) return false;
            Field current = Native.REPO.getDeclaredField("c");
            current.setAccessible(true);
            Object normalized = Class.forName("es0").getMethod("a", Native.DATA).invoke(null, requested);
            if (normalized == null) {
                // The native clear-all action intentionally replaces the entire list.
                LocalDb.importBlacklist(uid, "{}");
                publish(repo, uid, null);
            } else {
                publish(repo, uid, LocalDb.editBlacklist(uid, encode(current.get(null)), encode(normalized)));
            }
            return true;
        }
    }

    /** Apply a single removal without inferring deletions from the dialog's copy of the list. */
    public static void removeApp(Object repo, Object requested, Object removed) throws Exception {
        synchronized (repo) {
            String uid = signedInUid();
            if (uid == null) {
                Native.REPO.getMethod("d", Native.DATA, boolean.class).invoke(repo, requested, false);
                return;
            }
            String name = (String) removed.getClass().getMethod("getPackageName").invoke(removed);
            String key = (String) Class.forName("g00").getMethod("h", String.class).invoke(null, name);
            publish(repo, uid, LocalDb.removeBlacklistApp(uid, key, encode(requested)));
        }
    }

    /** A settings import is an explicit replacement, and should persist to the same account used at sign-in. */
    public static void importList(Object repo, Object requested) throws Exception {
        synchronized (repo) {
            String uid = signedInUid();
            if (uid != null) {
                Object normalized = Class.forName("es0").getMethod("a", Native.DATA).invoke(null, requested);
                LocalDb.importBlacklist(uid, encode(normalized));
            }
            Native.REPO.getMethod("d", Native.DATA, boolean.class).invoke(repo, requested, false);
            appliedUid = uid;
            appliedValue = uid == null ? null : LocalDb.accountBlacklist(uid);
        }
    }
}
