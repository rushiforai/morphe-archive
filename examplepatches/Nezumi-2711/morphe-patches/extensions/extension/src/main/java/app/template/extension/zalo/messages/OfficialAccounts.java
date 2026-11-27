package app.template.extension.zalo.messages;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
import app.template.extension.zalo.settings.NezumiPrefs;
import app.template.extension.zalo.shared.ZaloEnv;

/** Hides and auto-mutes Official Account conversations in the Messages tab. */
public final class OfficialAccounts {
    private OfficialAccounts() { }

    private static final Object OA_LOCK = new Object();

    private static final HashMap<String, Long> OA_ATTEMPTS = new HashMap<>();

    public static void setOAMessagesHidden(Context context, boolean hidden) {
        if (context == null || isOAMessagesHidden(context) == hidden) return;
        NezumiPrefs.of(context).edit()
            .putBoolean(NezumiPrefs.HIDE_OA_MESSAGES, hidden).apply();
        refreshOAMessages();
    }

    public static void setOAMessagesMuted(Context context, boolean muted) {
        if (context == null || isOAMessagesMuted(context) == muted) return;
        NezumiPrefs.of(context).edit()
            .putBoolean(NezumiPrefs.MUTE_OA_MESSAGES, muted).apply();
        refreshOAMessages();
    }

    private static void refreshOAMessages() {
        synchronized (OA_LOCK) {
            OA_ATTEMPTS.clear();
        }
        MessagesTab.refreshList(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES);
    }

    private static boolean hasOfficialFlag(Object profile) {
        if (profile == null) return false;
        try {
            return Boolean.TRUE.equals(profile.getClass().getMethod("B2").invoke(profile));
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            NezumiLog.swallowedOnce(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES, "OfficialAccounts", "official flag unavailable (B2)", failure);
            return false;
        }
    }

    private static String conversationUid(Object conversation) {
        try {
            return (String) conversation.getClass().getField("b").get(conversation);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            NezumiLog.swallowedOnce(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES, "OfficialAccounts", "conversation uid unavailable (field b)", failure);
            return null;
        }
    }

    /**
     * An incoming message for an uncached sender makes Zalo's notification processor
     * (huj.n) cache a blank ContactProfile whose type is 0, so a single profile source
     * can temporarily deny that a known OA is an OA. Both profile sources are checked
     * and every confirmed OA uid is remembered per account.
     */
    private static boolean isOfficialAccount(Object conversation, String uid, Set<String> known) {
        if (uid == null || uid.isEmpty() || uid.startsWith("group_")) return false;
        if (known.contains(uid)) return true;
        Object cached = null;
        try {
            cached = Class.forName("huj").getMethod("l", String.class).invoke(null, uid);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            NezumiLog.swallowedOnce(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES, "OfficialAccounts", "profile cache lookup unavailable (huj.l)", failure);
        }
        if (hasOfficialFlag(cached)) return true;
        try {
            return hasOfficialFlag(conversation.getClass().getField("a").get(conversation));
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            NezumiLog.swallowedOnce(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES, "OfficialAccounts", "conversation profile unavailable (field a)", failure);
            return false;
        }
    }

    private static String oaKnownKey(String account) {
        return NezumiPrefs.OA_KNOWN_UIDS + (account == null ? "" : account);
    }

    public static List filterOfficialAccounts(List items) {
        Context context = ZaloEnv.appContext(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES);
        if (context == null || items == null) return items;
        boolean hide = isOAMessagesHidden(context);
        boolean mute = isOAMessagesMuted(context);
        String account = ZaloEnv.currentAccount(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES);
        if (!mute) unmuteTrackedOfficialAccounts(context, account);
        if (!hide && !mute) return items;
        ArrayList filtered = hide ? new ArrayList(items.size()) : null;
        SharedPreferences prefs = NezumiPrefs.of(context);
        Set<String> stored = prefs.getStringSet(oaKnownKey(account), null);
        Set<String> known = stored == null ? new HashSet<>() : new HashSet<>(stored);
        boolean learned = false;
        for (Object item : items) {
            boolean official = false;
            try {
                if (item != null && Class.forName("r24").isInstance(item)) {
                    Object conversation = item.getClass().getField("f").get(item);
                    String uid = conversation == null ? null : conversationUid(conversation);
                    official = conversation != null && isOfficialAccount(conversation, uid, known);
                    if (official && known.add(uid)) learned = true;
                    if (official && mute) muteOfficialAccount(context, account, conversation);
                }
            } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
                NezumiLog.swallowedOnce(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES, "OfficialAccounts", "conversation filtering failed for an item", failure);
            }
            if (hide && !official) filtered.add(item);
        }
        if (learned) prefs.edit().putStringSet(oaKnownKey(account), known).apply();
        return hide ? filtered : items;
    }

    private static boolean claimOAAttempt(String key) {
        long now = android.os.SystemClock.elapsedRealtime();
        synchronized (OA_LOCK) {
            Long attemptedAt = OA_ATTEMPTS.get(key);
            if (attemptedAt != null && now - attemptedAt < 60000) return false;
            OA_ATTEMPTS.put(key, now);
            return true;
        }
    }

    private static String oaMutedKey(String account) {
        return NezumiPrefs.OA_MUTED_UIDS + account;
    }

    private static Set<String> trackedOfficialAccounts(Context context, String account) {
        Set<String> stored = NezumiPrefs.of(context)
            .getStringSet(oaMutedKey(account), null);
        return stored == null ? new HashSet<>() : new HashSet<>(stored);
    }

    private static void storeTrackedOfficialAccounts(Context context, String account, Set<String> uids) {
        SharedPreferences.Editor editor = NezumiPrefs.of(context).edit();
        if (uids.isEmpty()) editor.remove(oaMutedKey(account));
        else editor.putStringSet(oaMutedKey(account), uids);
        editor.apply();
    }

    private static Object nativeMuteRepository() throws ReflectiveOperationException {
        Object dispatcher = Class.forName("kc7").getMethod("e").invoke(null);
        return dispatcher.getClass().getField("j").get(dispatcher);
    }

    private static void muteOfficialAccount(Context context, String account, Object conversation) {
        String uid;
        try {
            uid = (String) conversation.getClass().getField("b").get(conversation);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            NezumiLog.swallowedOnce(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES, "OfficialAccounts", "mute target uid unavailable (field b)", failure);
            return;
        }
        if (uid == null || uid.isEmpty()) return;
        if (account == null || account.isEmpty() || uid.equals(account)) return;
        if (!claimOAAttempt("m:" + account + ":" + uid)) return;
        try {
            Object dispatcher = Class.forName("kc7").getMethod("e").invoke(null);
            Object nativeRepository = dispatcher.getClass().getField("j").get(dispatcher);
            Object existing = nativeRepository.getClass().getMethod("b", String.class).invoke(nativeRepository, uid);
            if (existing == null || existing.getClass().getField("d").getLong(existing) >= 0
                    || existing.getClass().getField("e").getInt(existing) != 0) {
                Class<?> itemClass = Class.forName(
                    "com.zing.zalo.comm.mutechatsetting.data.model.MuteSettingItem");
                Object item = itemClass.getConstructor(int.class, int.class, long.class, long.class,
                    String.class).newInstance(1, 0, System.currentTimeMillis(), -1L, uid);
                Class<?> trackingClass = Class.forName("v3h");
                Object tracking = Enum.valueOf((Class) trackingClass, "TAB_MSG");
                Class<?> entryClass = Class.forName("t1h");
                Object entry = Enum.valueOf((Class) entryClass, "MUTE_SHEET");
                Class<?> eventClass = Class.forName("ap");
                Object event = eventClass.getConstructor(itemClass, trackingClass, entryClass)
                    .newInstance(item, tracking, entry);
                Object flow = dispatcher.getClass().getMethod("p1", Object.class)
                    .invoke(dispatcher, event);
                ZaloEnv.collectNativeFlow(flow);
                Set<String> tracked = trackedOfficialAccounts(context, account);
                if (tracked.add(uid)) storeTrackedOfficialAccounts(context, account, tracked);
                NezumiLog.i(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES, "OfficialAccounts", "Permanent mute dispatched");
            }
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            NezumiLog.w(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES, "OfficialAccounts", "Automatic mute unavailable", failure);
        }
    }

    private static void unmuteTrackedOfficialAccounts(Context context, String account) {
        if (account == null || account.isEmpty()) return;
        Set<String> tracked = trackedOfficialAccounts(context, account);
        if (tracked.isEmpty()) return;
        boolean changed = false;
        try {
            Object nativeRepository = nativeMuteRepository();
            java.lang.reflect.Method lookup = nativeRepository.getClass().getMethod("b", String.class);
            for (String uid : new ArrayList<>(tracked)) {
                // Native success removes the uid from the mute map, so null confirms the unmute.
                if (lookup.invoke(nativeRepository, uid) == null) {
                    tracked.remove(uid);
                    changed = true;
                    continue;
                }
                if (!claimOAAttempt("u:" + account + ":" + uid)) continue;
                Object useCase = Class.forName("kc7").getMethod("i").invoke(null);
                Class<?> trackingClass = Class.forName("v3h");
                Object tracking = Enum.valueOf((Class) trackingClass, "TAB_MSG");
                Object event = Class.forName("bdl").getConstructor(String.class, int.class, trackingClass)
                    .newInstance(uid, 1, tracking);
                Object flow = useCase.getClass().getMethod("p1", Object.class).invoke(useCase, event);
                ZaloEnv.collectNativeFlow(flow);
                NezumiLog.i(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES, "OfficialAccounts", "Unmute dispatched");
            }
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            NezumiLog.w(Patch.HIDE_OA_ACCOUNTS_IN_MESSAGES, "OfficialAccounts", "Automatic unmute unavailable", failure);
        }
        if (changed) storeTrackedOfficialAccounts(context, account, tracked);
    }

    public static boolean isOAMessagesHidden(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.HIDE_OA_MESSAGES, true);
    }

    public static boolean isOAMessagesMuted(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.MUTE_OA_MESSAGES, true);
    }
}
