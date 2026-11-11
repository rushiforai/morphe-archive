package app.template.extension.extension;

import android.app.Dialog;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.Base64;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Constructor;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public final class NezumiSettings {
    private static final String PREFS = "nezumi_settings";
    private static final String REACTION = "unlock_icon_react";
    private static final String HIDE_TYPING = "hide_text_typing";
    private static final String HIDE_READ_RECEIPTS = "hide_read_receipts";
    private static final String HIDE_DELIVERY_RECEIPTS = "hide_delivery_receipts";
    private static final String HIDE_MEDIA_BOX = "hide_media_box";
    private static final String HIDE_BUSINESS_BOX = "hide_business_box";
    private static final String HIDE_OA_MESSAGES = "hide_oa_messages";
    private static final String HIDE_FEED_ADS = "hide_feed_ads";
    private static final String KEEP_RECALLED_MESSAGES = "keep_recalled_messages";
    private static final String HIDE_ONLINE_STATUS = "hide_online_status";
    private static final String HIDE_DISCOVERY = "hide_discovery";
    private static final String SAVED_ONLINE_SHARING = "saved_online_sharing";
    private static final String ENTRY_TAG = "nezumi-settings-entry";
    private static final int BLUE = 0xFF0068FF;
    private static final int HEADER_BLUE = 0xFF008DFA;
    private static final int DIVIDER = 0xFFE9EAEC;
    private static final int SECTION = 0xFFF2F3F5;
    private static final int FEATURE_REACTION = 1;
    private static final int FEATURE_TYPING = 1 << 1;
    private static final int FEATURE_READ_RECEIPTS = 1 << 2;
    private static final int FEATURE_DELIVERY_RECEIPTS = 1 << 3;
    private static final int FEATURE_MEDIA_BOX = 1 << 4;
    private static final int FEATURE_BUSINESS_BOX = 1 << 10;
    private static final int FEATURE_OA_MESSAGES = 1 << 12;
    private static final int FEATURE_FEED_ADS = 1 << 11;
    private static final int FEATURE_RECALLED_MESSAGES = 1 << 8;
    private static final int FEATURE_ONLINE_STATUS = 1 << 5;
    private static final int FEATURE_CUSTOM_FONT = 1 << 6;
    private static final int FEATURE_DISCOVERY = 1 << 7;
    private static final int FEATURE_CUSTOM_SOUNDS = 1 << 9;
    private static final Object ONLINE_LOCK = new Object();
    private static final Set<String> ONLINE_USERS = new HashSet<>();
    private static final Object RECALL_LOCK = new Object();
    private static final Object OA_LOCK = new Object();
    private static final HashMap<String, Long> OA_ATTEMPTS = new HashMap<>();
    private static final WeakHashMap<View, Boolean> RECALL_ROWS = new WeakHashMap<>();
    private static String recallAccount;
    private static Set<String> recalledMessages = new HashSet<>();
    private static final WeakHashMap<TextView, ChatPresence> CHAT_SUBTITLES = new WeakHashMap<>();
    private static final WeakHashMap<Object, String> CHAT_TARGETS = new WeakHashMap<>();
    private static final ThreadLocal<Boolean> CHAT_REFRESH = new ThreadLocal<>();
    private static long onlineObservedAt;
    private static long lastChatRefresh;
    private static long lastChatAttempt;
    private static String onlineAccount;
    private static final String GEAR_ICON = "iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAQAAAD9CzEMAAADgklEQVR42u1Yv09UQRD+7viRozjACCZiYsRSQE2MgEQtjI2ggCgkiv+AdmDhj4LYKWo8FK7wB7HSKFFjY+dJCAhaaRQUC0iMCQGRAiGBxJPPgmFu99493oNgbNwt9u3szJuX2W++2X0B4u+2IP47WDMHQTSgB1OYQg/qV2BHfz2dT2i2Lqb5s/Tr4BqTW+taOsjlT4eDn8zxY5vuErn9aMAGxPECTzGPMwgDAEZwAEHEsBVAGKdxBSEcQxUyMI7H6PO7B1m8b3zpFAe4IM9NBMFmmS1wgD8MzU5m+QvRfaZuk1xPEMyzXkvLhQ8He12M53hIdao476JV4e2gXVQ/8AhbOC7B6OVuS6uUfaI3zhZWc1BmN70dPBfVKsF/EfdwY0qEFLCMJUwnCFaL1TNvFM3JuAsvAMQx5JqjYxjT551J1sugqFG+ZUK+zU/P4IRYnfQOUUgxUmLJi9nGIc5ylkOMsNha2644C/mB6RtR36OSTEYZt9ASZwczdb1CpAPeMM3hRUmrBd3aTMZSQjKmLgrU5kIygdiMeZ0zat6n8ijdWofq9BocddVk2sTrgxYhzynuizU4w6xlmGHWclgDVaR5MWeRecDpoMEihUTWtonsM3NVto5fRHpDZZUWgRx3OuiRpRE2Cecs9iGR11qxPSrSQUOWxyaOiLzb6WBKljYnbfvSroQtabZG3NYu1BiIJGhk3GILODJxJS3gXvQHZexGM/IMjW8yHrTslmZfDVk+mvFSnj86qaLe2KIfQnXmJg9z3bKbfFiDTJJ1qWDaZSjMszQFTI8ym9ms09cnYFpuVYhHqWAKprHVKO69PhKtXXVeq2yal1Mn2hI6zvumipdKFZvU5hyzvcnubQqy63CQ3S2D7JbKbL+fmpyga5uSixjhIGc4w4+8obFf7DtWQtentNaupOB8dys4zkNslYxRxH2n1y9E5akyeclZk7NkfAcAyMA2hDFqVN9EK8AWzOIT4gDeJ1kvU5PblcZqeImTWh1KLa0yrQATbGGNUmLEew/2uWB+npVG1rodvMr91OROj6NjvuvR8Y6/s2kW71mvfZ10+D0rs9/st1zddYLU/X5QwQi7+IAnGCJ4XotRIbdyVGbnCIbYyIfsYsRIy1VcQMKcXu0FxN9lbga3HbIoptfyEphmkTn5aK0vgWCAx/iKk5xkjHUJvvfqgf//Kv65gz/gmFMG8oKg/wAAAABJRU5ErkJggg==";
    private static final String CHAT_ICON = "iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAQAAAD9CzEMAAADI0lEQVR42u2YzWuVRxTGf29yb5SYkmLMImjAD2y7aItWDVUXJYJU8GNhay0trrppbf0bugkm1E2rLVZEELsRRPsVBRVEsN3YiAgtNBWKxi9oqtQmlCSV/rrI5HrN3Pe+N/e1dOPM5jJzzvPcmTnznDNvIv9ta+AJQUYr1GDTSBfdrOA5OmgBRrnNIJc4x0X+yfS2eu+0z5umtRv2uqA6QrXJdg84blYbd7/z6iF4y7slkDsecocv2WbRZjtd6bt+4W+l+d99c2YERQ+WnM+7ycaKVk1u90LJ7nOLtRI0eyo4XXWDWaf0uteD9UmbayEoluCP2JIJj9jiieDRH68iNp/anA9rAp/siT3Ba38Wwdt1wE/2PcFzezWC9hA5R2YMj4lHVR22LZ3gQDjaOXUQ4NPeUvWzNILOcK021AWPuEXVsfLbXT7dF+KeHP0HVXsrETQGzdmYi+ANVYdsiAlWB1Eo5CIoeE/VrqmRh/mgG4CTPJgmt71MpOJN0DvN+gFnAVgXy/VxVXdEKKNVtXQ0sn9H1WPxCp4F4KcoYexlIjWZ/M0n0djPZWiPrGDyirXlOgHEBeG6RStoAWAkdxK+C8BTcdL3MRUBs9OqivsAtD4mgpGYYBiA+ZFDpTAdpyeVYAkAd2KCHwFYHjnsohiNNbErleBFAAZjgisArKkpTCuF51R7GYCBOExXhPDKJxWz/UPVVbEWJd5QdXMugtdUvV5J7Ah59fsc8IkDqu6unA86QsJZl/P/jzk/LWX+qmp3nfBzHVJ1X1rKXBT0cVadBF+GMnJeGsFOVb+uE/6jIODb0suWb1TdWRd8X4D/NL3wanJE1SUzBm8NFZH2x7fo4c/uUBOVV6mvZEZU4tZwtPpt9eK3r2yJi33Pr/xT1YtuSynfZ7k1xP2kZ0UNSErv5MssAz6mwKssnaYv9zjLGQa5xn2KFHiGF1jL5pK4D/M+x7LeaH9VSOnXanhCjbnPubU8oc4/Uiv0+4FLxQ57SnsctyF3l9/a6lu0kMN0cZXTnOY7xssWmbCc9SzjedpppYFRbvILA5zjUvYzNnnyreJ/J/gXo3zphTXHOI0AAAAASUVORK5CYII=";

    private NezumiSettings() { }

    public static boolean isReactionEnabled(Context context) {
        return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(REACTION, true);
    }

    public static boolean isDiscoveryHidden() {
        Context context = onlineContext();
        return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
            .getBoolean(HIDE_DISCOVERY, true);
    }

    public static boolean isTypingHidden(Context context) {
        return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(HIDE_TYPING, false);
    }

    public static boolean isReadReceiptsHidden(Context context) {
        return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(HIDE_READ_RECEIPTS, false);
    }

    public static boolean isDeliveryReceiptsHidden(Context context) {
        return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(HIDE_DELIVERY_RECEIPTS, false);
    }

    public static boolean isMediaBoxHidden(Context context) {
        return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(HIDE_MEDIA_BOX, false);
    }

    public static boolean isBusinessBoxHidden(Context context) {
        return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(HIDE_BUSINESS_BOX, false);
    }

    public static boolean isOAMessagesHidden(Context context) {
        return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(HIDE_OA_MESSAGES, true);
    }

    public static void setOAMessagesHidden(Context context, boolean hidden) {
        if (context == null || isOAMessagesHidden(context) == hidden) return;
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
            .putBoolean(HIDE_OA_MESSAGES, hidden).apply();
        synchronized (OA_LOCK) {
            OA_ATTEMPTS.clear();
        }
        try {
            Object repository = Class.forName("tg0.p").getMethod("a").invoke(null);
            repository.getClass().getMethod("O").invoke(repository);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) {
            android.util.Log.w("NezumiOA", "Messages refresh unavailable");
        }
    }

    private static boolean isOfficialAccount(Object conversation) {
        if (conversation == null) return false;
        try {
            String uid = (String) conversation.getClass().getField("b").get(conversation);
            if (uid == null || uid.isEmpty() || uid.startsWith("group_")) return false;
            Object profile = conversation.getClass().getField("a").get(conversation);
            if (profile == null) {
                profile = Class.forName("rz.p3").getMethod("l", String.class).invoke(null, uid);
            }
            return profile != null && Boolean.TRUE.equals(profile.getClass().getMethod("P1").invoke(profile));
        } catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) {
            return false;
        }
    }

    public static List filterOfficialAccounts(List items) {
        if (!isOAMessagesHidden(onlineContext()) || items == null) return items;
        ArrayList filtered = new ArrayList(items.size());
        for (Object item : items) {
            try {
                if (item != null && Class.forName("l20.d").isInstance(item)
                        && hideOrMuteOfficialAccount(item.getClass().getField("f").get(item))) continue;
            } catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) { }
            filtered.add(item);
        }
        return filtered;
    }

    private static boolean hideOrMuteOfficialAccount(Object conversation) {
        Context context = onlineContext();
        if (!isOAMessagesHidden(context) || !isOfficialAccount(conversation)) return false;
        String uid;
        try {
            uid = (String) conversation.getClass().getField("b").get(conversation);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return true;
        }
        if (uid == null || uid.isEmpty()) return true;
        String account = currentOnlineAccount();
        if (account == null || account.isEmpty() || uid.equals(account)) return true;
        String key = account + ":" + uid;
        long now = android.os.SystemClock.elapsedRealtime();
        synchronized (OA_LOCK) {
            Long attemptedAt = OA_ATTEMPTS.get(key);
            if (attemptedAt != null && now - attemptedAt < 60000) return true;
            OA_ATTEMPTS.put(key, now);
        }
        try {
            Object dispatcher = Class.forName("bv.b").getMethod("e").invoke(null);
            Object nativeRepository = dispatcher.getClass().getField("g").get(dispatcher);
                Object existing = nativeRepository.getClass().getMethod("b", String.class).invoke(nativeRepository, uid);
                if (existing == null || existing.getClass().getField("d").getLong(existing) >= 0
                    || existing.getClass().getField("e").getInt(existing) != 0) {
                Class<?> itemClass = Class.forName(
                    "com.zing.zalo.comm.mutechatsetting.data.model.MuteSettingItem");
                Object item = itemClass.getConstructor(int.class, int.class, long.class, long.class,
                    String.class).newInstance(1, 0, System.currentTimeMillis(), -1L, uid);
                Class<?> trackingClass = Class.forName("bx.d");
                Object tracking = Enum.valueOf((Class) trackingClass, "TAB_MSG");
                Class<?> entryClass = Class.forName("bx.a");
                Object entry = Enum.valueOf((Class) entryClass, "MUTE_SHEET");
                Class<?> eventClass = Class.forName("dx.a");
                Object event = eventClass.getConstructor(itemClass, trackingClass, entryClass)
                    .newInstance(item, tracking, entry);
                Object flow = dispatcher.getClass().getMethod("s0", Object.class)
                    .invoke(dispatcher, event);
                collectNativeFlow(flow);
                android.util.Log.i("NezumiOA", "Permanent mute dispatched");
            }
        } catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) {
            android.util.Log.w("NezumiOA", "Automatic mute unavailable");
        }
        return true;
    }

    private static void collectNativeFlow(Object flow) throws ReflectiveOperationException {
        Class<?> contextClass = Class.forName("qa2.i");
        Object ioContext = Class.forName("kotlinx.coroutines.scheduling.DefaultIoScheduler")
            .getField("c").get(null);
        Class<?> scopeClass = Class.forName("kotlinx.coroutines.CoroutineScope");
        Object scope = Class.forName("kotlinx.coroutines.CoroutineScopeKt")
            .getMethod("a", contextClass).invoke(null, ioContext);
        Class<?> flowClass = Class.forName("kotlinx.coroutines.flow.Flow");
        Class<?> flowKtClass = Class.forName("kotlinx.coroutines.flow.FlowKt");
        flowKtClass.getMethod("E", flowClass, scopeClass).invoke(null, flow, scope);
    }

    public static List filterFeedAds(List items) {
        if (!isFeedAdsHidden(onlineContext()) || items == null || items.isEmpty()) return items;
        ArrayList filtered = new ArrayList(items.size());
        for (Object item : items) {
            if (!isFeedAdItem(item)) filtered.add(item);
        }
        return filtered;
    }

    private static boolean isFeedAdsHidden(Context context) {
        return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(HIDE_FEED_ADS, false);
    }

    private static boolean isFeedAdItem(Object item) {
        try {
            return item != null && item.getClass().getField("c").getInt(item) == 0x51;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }

    public static boolean isRecalledMessagesKept(Context context) {
        return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(KEEP_RECALLED_MESSAGES, false);
    }

    public static boolean shouldKeepIncomingRecall(String senderId, int eventType) {
        boolean enabled = isRecalledMessagesKept(onlineContext());
        String account = currentOnlineAccount();
        boolean incoming = account != null && !account.isEmpty()
            && senderId != null && !senderId.isEmpty() && !account.equals(senderId);
        boolean keep = enabled && incoming;
        android.util.Log.i("NezumiRecall", "event=" + eventType + " enabled=" + enabled
            + " incoming=" + incoming + " kept=" + keep);
        return keep;
    }

    private static String recallDigest(String value) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            return Base64.encodeToString(digest, Base64.NO_WRAP | Base64.URL_SAFE);
        } catch (NoSuchAlgorithmException failure) {
            throw new IllegalStateException(failure);
        }
    }

    private static Set<String> recallKeys(Object messageId) {
        Set<String> keys = new HashSet<>();
        if (messageId == null) return keys;
        try {
            String clientId = (String) messageId.getClass().getField("a").get(messageId);
            String globalId = (String) messageId.getClass().getField("b").get(messageId);
            String ownerId = (String) messageId.getClass().getField("c").get(messageId);
            if (ownerId == null || ownerId.isEmpty()) return keys;
            if (clientId != null && !clientId.isEmpty() && !"0".equals(clientId)) {
                keys.add(recallDigest(new org.json.JSONArray().put(ownerId).put("client").put(clientId).toString()));
            }
            if (globalId != null && !globalId.isEmpty() && !"0".equals(globalId)) {
                keys.add(recallDigest(new org.json.JSONArray().put(ownerId).put("global").put(globalId).toString()));
            }
            return keys;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return keys;
        }
    }

    private static String loadRecallAccount(Context context) {
        String account = currentOnlineAccount();
        if (account == null || account.isEmpty()) return null;
        String key = "recalled_ids_" + recallDigest(account);
        if (!key.equals(recallAccount)) {
            recalledMessages = new HashSet<>(context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getStringSet(key, java.util.Collections.emptySet()));
            recallAccount = key;
        }
        return key;
    }

    public static void markIncomingRecall(Object messageId) {
        Context context = onlineContext();
        Set<String> keys = recallKeys(messageId);
        if (context == null || keys.isEmpty()) return;
        ArrayList<View> rows;
        synchronized (RECALL_LOCK) {
            String accountKey = loadRecallAccount(context);
            if (accountKey == null || !recalledMessages.addAll(keys)) return;
            context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putStringSet(accountKey, new HashSet<>(recalledMessages)).apply();
            rows = new ArrayList<>(RECALL_ROWS.keySet());
        }
        for (View row : rows) {
            row.post(() -> refreshRecallRow(row));
        }
        android.util.Log.i("NezumiRecall", "target marked");
    }

    public static boolean isIncomingRecall(Object message) {
        Context context = onlineContext();
        if (context == null || message == null) {
            android.util.Log.i("NezumiRecall", "lookup miss no-context-or-message");
            return false;
        }
        try {
            Set<String> keys = recallKeys(message.getClass().getField("b").get(message));
            synchronized (RECALL_LOCK) {
                boolean hit = !keys.isEmpty() && loadRecallAccount(context) != null
                    && keys.stream().anyMatch(recalledMessages::contains);
                android.util.Log.i("NezumiRecall", "lookup " + (hit ? "hit" : "miss"));
                return hit;
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            android.util.Log.i("NezumiRecall", "lookup miss reflection");
            return false;
        }
    }

    public static boolean hasRecallLabel(Object row) {
        try {
            return row != null && isIncomingRecall(row.getClass().getMethod("getMessage").invoke(row));
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }

    public static String formatRecallTime(View row, String original) {
        if (!hasRecallLabel(row)) {
            android.util.Log.i("NezumiRecall", "footer miss");
            return original;
        }
        android.util.Log.i("NezumiRecall", "footer hit");
        String label = recalledLabel(row.getContext());
        return original == null || original.isEmpty() ? label : original + " - " + label;
    }

    public static void trackRecallRow(View row) {
        if (row == null) return;
        synchronized (RECALL_LOCK) {
            RECALL_ROWS.put(row, Boolean.TRUE);
        }
        android.util.Log.i("NezumiRecall", "row tracked");
    }

    private static void refreshRecallRow(View row) {
        if (!row.isAttachedToWindow() || !hasRecallLabel(row)) return;
        try {
            Class<?> base = Class.forName("com.zing.zalo.ui.chat.chatrow.ChatRow");
            Object message = base.getMethod("getMessage").invoke(row);
            Object binding = base.getField("j").get(row);
            if (message == null || binding == null) return;
            base.getMethod("p2", Class.forName("j20.q"), Class.forName("zg1.a"))
                .invoke(row, message, binding);
            base.getField("j1").setBoolean(row, false);
            row.requestLayout();
            row.invalidate();
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            android.util.Log.w("NezumiRecall", "row refresh unavailable");
        }
    }

    public static String recalledLabel(Context context) {
        return isVietnamese(context) ? "Đã thu hồi" : "Recalled";
    }

    public static boolean shouldFetchOnlineStatus() {
        return isOnlineHidden() || originalOnlineSharing();
    }

    public static void traceOnlineResponse(org.json.JSONObject data) {
        try {
            org.json.JSONArray onlines = data.optJSONArray("onlines");
            android.util.Log.i("NezumiOnline", "onlineResponse sharing=" + originalOnlineSharing()
                + " hidden=" + isOnlineHidden() + " hasOnlines=" + data.has("onlines")
                + " arrayPresent=" + (onlines != null)
                + " count=" + (onlines == null ? -1 : onlines.length()));
        } catch (RuntimeException ignored) {
            android.util.Log.w("NezumiOnline", "onlineResponse probe unavailable");
        }
    }

    public static void traceLastSeenResponse(org.json.JSONObject data) {
        try {
            android.util.Log.i("NezumiOnline", "lastSeenResponse sharing=" + originalOnlineSharing()
                + " hidden=" + isOnlineHidden() + " hasTimestamp=" + data.has("timestamp")
                + " timestampPositive=" + (data.optLong("timestamp") > 0)
                + " hasVisibility=" + data.has("settingOnlineStatus")
                + " visibility=" + data.optInt("settingOnlineStatus", -1));
        } catch (RuntimeException ignored) {
            android.util.Log.w("NezumiOnline", "lastSeenResponse probe unavailable");
        }
    }

    public static void traceFriendListResponse(org.json.JSONObject data) {
        try {
            org.json.JSONArray onlines = data.optJSONArray("onlines");
            android.util.Log.i("NezumiOnline", "friendListResponse sharing=" + originalOnlineSharing()
                + " hidden=" + isOnlineHidden() + " arrayPresent=" + (onlines != null)
                + " count=" + (onlines == null ? -1 : onlines.length()));
        } catch (RuntimeException ignored) {
            android.util.Log.w("NezumiOnline", "friendListResponse probe unavailable");
        }
    }

    public static void updateChatOnlineUsers(org.json.JSONObject data) {
        Set<String> onlineUsers = new HashSet<>();
        org.json.JSONArray onlines = data.optJSONArray("onlines");
        if (onlines != null) {
            for (int index = 0; index < onlines.length(); index++) {
                org.json.JSONObject entry = onlines.optJSONObject(index);
                if (entry == null) continue;
                String userId = entry.optString("userId");
                if (!android.text.TextUtils.isEmpty(userId)) onlineUsers.add(userId);
            }
        }
        ArrayList<TextView> views;
        synchronized (ONLINE_LOCK) {
            ONLINE_USERS.clear();
            ONLINE_USERS.addAll(onlineUsers);
            onlineObservedAt = android.os.SystemClock.elapsedRealtime();
            onlineAccount = currentOnlineAccount();
            views = new ArrayList<>(CHAT_SUBTITLES.keySet());
        }
        for (TextView view : views) {
            ChatPresence presence;
            synchronized (ONLINE_LOCK) {
                presence = CHAT_SUBTITLES.get(view);
            }
            if (presence != null) view.post(presence::render);
        }
    }

    public static void setChatPresenceTarget(Object chatView, android.os.Bundle arguments) {
        String userId = arguments == null ? null : arguments.getString("extra_chat_profile_uid");
        synchronized (ONLINE_LOCK) {
            if (android.text.TextUtils.isEmpty(userId)) CHAT_TARGETS.remove(chatView);
            else CHAT_TARGETS.put(chatView, userId);
        }
    }

    public static void bindChatSubtitle(Object chatView, TextView subtitle) {
        if (subtitle == null) return;
        synchronized (ONLINE_LOCK) {
            String userId = CHAT_TARGETS.get(chatView);
            ChatPresence presence = CHAT_SUBTITLES.get(subtitle);
            if (presence == null) {
                presence = new ChatPresence(subtitle);
                CHAT_SUBTITLES.put(subtitle, presence);
            }
            presence.userId = userId;
            presence.start();
        }
    }

    public static boolean isChatOnlineRefresh() {
        return Boolean.TRUE.equals(CHAT_REFRESH.get());
    }

    public static long onlineRefreshInterval() {
        return isChatOnlineRefresh() ? 10000L : 60000L;
    }

    public static void traceChatOnlineDispatch() {
        if (isChatOnlineRefresh()) {
            lastChatRefresh = android.os.SystemClock.elapsedRealtime();
            android.util.Log.i("NezumiOnline", "chatRefresh dispatched");
        }
    }

    public static void traceChatOnlineGate(Object repository) {
        if (!isChatOnlineRefresh()) return;
        try {
            boolean inFlight = repository.getClass().getField("n").getBoolean(repository);
            long requestedAt = repository.getClass().getField("l").getLong(repository);
            long remaining = Math.max(0, onlineRefreshInterval() - (System.currentTimeMillis() - requestedAt));
            android.util.Log.i("NezumiOnline", "chatRefresh gate inFlight=" + inFlight
                + " throttleRemainingMs=" + remaining);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            android.util.Log.w("NezumiOnline", "Chat refresh gate unavailable");
        }
    }

    public static boolean retainChatOnlineSubtitle(TextView subtitle) {
        ChatPresence presence;
        synchronized (ONLINE_LOCK) {
            presence = CHAT_SUBTITLES.get(subtitle);
        }
        return presence != null && presence.render(true);
    }

    public static void requestChatOnlineList() {
        throw new IllegalStateException("Chat online request bridge was not patched");
    }

    private static String currentOnlineAccount() {
        try {
            Object account = Class.forName("com.zing.zalocore.CoreUtility").getField("i").get(null);
            return account instanceof String ? (String) account : null;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static final class ChatPresence implements Runnable, View.OnAttachStateChangeListener {
        private final WeakReference<TextView> view;
        private final Object marker = new Object();
        private String userId;
        private boolean scheduled;

        private ChatPresence(TextView subtitle) {
            view = new WeakReference<>(subtitle);
            subtitle.addOnAttachStateChangeListener(this);
        }

        private void start() {
            TextView subtitle = view.get();
            if (subtitle == null || scheduled || !subtitle.isAttachedToWindow()) return;
            scheduled = true;
            subtitle.post(this);
        }

        @Override
        public void onViewAttachedToWindow(View attachedView) {
            start();
        }

        @Override
        public void onViewDetachedFromWindow(View detachedView) {
            detachedView.removeCallbacks(this);
            scheduled = false;
        }

        private void render() {
            render(false);
        }

        private boolean render(boolean nativeClear) {
            TextView subtitle = view.get();
            if (subtitle == null) return false;
            boolean online;
            synchronized (ONLINE_LOCK) {
                online = userId != null && ONLINE_USERS.contains(userId)
                    && onlineObservedAt > 0
                    && android.os.SystemClock.elapsedRealtime() - onlineObservedAt < 90000
                    && onlineAccount != null && onlineAccount.equals(currentOnlineAccount());
            }
            CharSequence text = subtitle.getText();
            boolean managed = text instanceof android.text.Spanned
                && ((android.text.Spanned) text).getSpanStart(marker) >= 0;
            if (isOnlineHidden() && online && (nativeClear || android.text.TextUtils.isEmpty(text) || managed)) {
                android.text.SpannableString label = new android.text.SpannableString(
                    isVietnamese(subtitle.getContext()) ? "Đang hoạt động" : "Online");
                label.setSpan(marker, 0, label.length(), android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                if (!managed) subtitle.setText(label, TextView.BufferType.SPANNABLE);
                subtitle.setVisibility(View.VISIBLE);
                return true;
            } else if (managed) {
                subtitle.setText("");
                subtitle.setVisibility(View.GONE);
            }
            return false;
        }

        @Override
        public void run() {
            TextView subtitle = view.get();
            if (subtitle == null) return;
            render();
            if (!subtitle.isAttachedToWindow()) {
                scheduled = false;
                return;
            }
            if (!android.text.TextUtils.isEmpty(userId) && isOnlineHidden()
                    && subtitle.getWindowVisibility() == View.VISIBLE && subtitle.hasWindowFocus()
                    && subtitle.getRootView().isShown()) {
                long now = android.os.SystemClock.elapsedRealtime();
                if ((lastChatRefresh == 0 || now - lastChatRefresh > 10000)
                        && (lastChatAttempt == 0 || now - lastChatAttempt > 5000)) {
                    lastChatAttempt = now;
                    CHAT_REFRESH.set(true);
                    try {
                        android.util.Log.i("NezumiOnline", "chatRefresh attempt");
                        requestChatOnlineList();
                    } catch (LinkageError | RuntimeException ignored) {
                        android.util.Log.w("NezumiOnline", "Chat online refresh unavailable");
                    } finally {
                        CHAT_REFRESH.remove();
                    }
                }
            }
            scheduled = true;
            subtitle.postDelayed(this, 2000);
        }
    }

    private static Context onlineContext() {
        try {
            return (Context) Class.forName("com.zing.zalo.MainApplication")
                .getMethod("getAppContext").invoke(null);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static Activity activityContext(Context context) {
        Context current = context;
        while (current instanceof android.content.ContextWrapper) {
            if (current instanceof Activity) return (Activity) current;
            Context base = ((android.content.ContextWrapper) current).getBaseContext();
            if (base == current) break;
            current = base;
        }
        return current instanceof Activity ? (Activity) current : null;
    }

    private static void recreateForDiscovery(Context context) {
        refreshDiscoveryTabs();
        Activity activity = activityContext(context);
        if (activity != null && !activity.isFinishing() && !activity.isChangingConfigurations()) {
            activity.recreate();
        }
    }

    private static void refreshDiscoveryTabs() {
        String[] configurationClasses = { "if1.y", "kj1.v" };
        for (String className : configurationClasses) {
            try {
                Object configuration = Class.forName(className).getMethod("h").invoke(null);
                configuration.getClass().getMethod("o").invoke(configuration);
                configuration.getClass().getMethod("q").invoke(configuration);
                return;
            } catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) {
            }
        }
    }

    private static boolean isOnlineHidden() {
        Context context = onlineContext();
        return context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
            .getBoolean(HIDE_ONLINE_STATUS, false);
    }

    public static int mapOnlineState(int state) {
        Context context = onlineContext();
        boolean hidden = context != null && context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
            .getBoolean(HIDE_ONLINE_STATUS, false);
        int mapped = state == 103 && hidden ? 102 : state;
        android.util.Log.i("NezumiOnline", "socketState=" + state + " mapped=" + mapped
            + " hidden=" + hidden + " contextAvailable=" + (context != null));
        return mapped;
    }

    public static void publishOnlineState(int state) {
        throw new IllegalStateException("Online state bridge was not patched");
    }

    public static boolean originalOnlineSharing() {
        return false;
    }

    public static void applyOriginalOnlineSharing(boolean enabled) {
        throw new IllegalStateException("Online sharing setter bridge was not patched");
    }

    public static boolean isOnlinePatchAvailable() {
        return false;
    }

    public static void attachReaction(View root, View anchor) {
        attach(root, anchor, FEATURE_REACTION);
    }

    public static void attachTyping(View root, View anchor) {
        attach(root, anchor, FEATURE_TYPING);
    }

    public static void attachReadReceipts(View root, View anchor) {
        attach(root, anchor, FEATURE_READ_RECEIPTS);
    }

    public static void attachDeliveryReceipts(View root, View anchor) {
        attach(root, anchor, FEATURE_DELIVERY_RECEIPTS);
    }

    public static void attachMediaBox(View root, View anchor) {
        attach(root, anchor, FEATURE_MEDIA_BOX);
    }

    public static void attachBusinessBox(View root, View anchor) {
        attach(root, anchor, FEATURE_BUSINESS_BOX);
    }

    public static void attachOAMessages(View root, View anchor) {
        attach(root, anchor, FEATURE_OA_MESSAGES);
    }

    public static void attachFeedAds(View root, View anchor) {
        attach(root, anchor, FEATURE_FEED_ADS);
    }

    public static void attachRecalledMessages(View root, View anchor) {
        attach(root, anchor, FEATURE_RECALLED_MESSAGES);
    }

    public static void attachOnlineStatus(View root, View anchor) {
        attach(root, anchor, FEATURE_ONLINE_STATUS);
    }

    public static void attachDiscovery(View root, View anchor) {
        attach(root, anchor, FEATURE_DISCOVERY);
    }

    public static void attachCustomFont(View root, View anchor) {
        attach(root, anchor, FEATURE_CUSTOM_FONT);
    }

    public static void attachCustomSounds(View root, View anchor) {
        attach(root, anchor, FEATURE_CUSTOM_SOUNDS);
    }

    private static void attach(View root, View anchor, int feature) {
        if (root == null || anchor == null || !(anchor.getParent() instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) anchor.getParent();
        for (int index = 0; index < parent.getChildCount(); index++) {
            Object tag = parent.getChildAt(index).getTag();
            if (tag instanceof EntryState) {
                ((EntryState) tag).features |= feature;
                return;
            }
        }
        Context context = anchor.getContext();
        boolean darkMode = isDarkMode(context, anchor);
        int titleId = context.getResources().getIdentifier("list_title", "id", context.getPackageName());
        View title = titleId == 0 ? null : anchor.findViewById(titleId);
        TextView nativeTitle = title instanceof TextView ? (TextView) title : null;
        View entry = row(context, "Nezumi's Settings", true, true, darkMode, nativeTitle);
        Drawable background = anchor.getBackground();
        if (background != null && background.getConstantState() != null) {
            entry.setBackground(background.getConstantState().newDrawable(context.getResources()).mutate());
        }
        EntryState state = new EntryState(feature);
        entry.setTag(state);
        entry.setOnClickListener(view -> showNezumi(context, darkMode, state));
        parent.addView(entry, parent.indexOfChild(anchor) + 1);
        int dividerId = context.getResources().getIdentifier("list_divider", "id", context.getPackageName());
        View divider = dividerId == 0 ? null : anchor.findViewById(dividerId);
        if (divider != null) divider.post(() -> divider.setVisibility(View.VISIBLE));
    }

    private static final class EntryState {
        private int features;

        private EntryState(int features) {
            this.features = features;
        }
    }

    private static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics());
    }

    private static boolean isDarkMode(Context context) {
        return (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
    }

    private static boolean isDarkMode(Context context, View reference) {
        if (isDarkMode(context)) return true;
        TextView nativeLabel = findTextView(reference);
        if (nativeLabel == null) return false;
        int color = nativeLabel.getCurrentTextColor();
        int red = (color >> 16) & 0xFF;
        int green = (color >> 8) & 0xFF;
        int blue = color & 0xFF;
        return (red * 299 + green * 587 + blue * 114) / 1000 > 180;
    }

    private static TextView findTextView(View view) {
        if (view instanceof TextView) return (TextView) view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int index = 0; index < group.getChildCount(); index++) {
            TextView text = findTextView(group.getChildAt(index));
            if (text != null) return text;
        }
        return null;
    }

    private static int themeColor(Context context, int attribute, int fallback) {
        TypedValue color = new TypedValue();
        if (!context.getTheme().resolveAttribute(attribute, color, true)) return fallback;
        try {
            return color.resourceId != 0
                    ? context.getColorStateList(color.resourceId).getDefaultColor() : color.data;
        } catch (RuntimeException ignored) {
            return fallback;
        }
    }

    private static int resourceColor(Context context, String name, int fallback) {
        int resourceId = context.getResources().getIdentifier(
                name, "color", context.getPackageName());
        if (resourceId == 0) return fallback;
        try {
            return context.getColorStateList(resourceId).getDefaultColor();
        } catch (RuntimeException ignored) {
            return fallback;
        }
    }

    private static int surfaceColor(Context context, boolean darkMode) {
        if (darkMode) return 0xFF121212;
        return resourceColor(context, "ui_background", themeColor(context, android.R.attr.colorBackground,
            0xFFFFFFFF));
    }

    private static int sectionColor(Context context, boolean darkMode) {
        return darkMode ? 0xFF1E1E1E : SECTION;
    }

    private static int textColor(Context context, boolean darkMode) {
        return darkMode ? 0xFFFFFFFF
                : resourceColor(context, "list_item_title",
                themeColor(context, android.R.attr.textColorPrimary, 0xFF222222));
    }

    private static TextView label(Context context, String value, boolean darkMode) {
        TextView text;
        try {
            Constructor<?> constructor = Class.forName("com.zing.zalo.ui.widget.RobotoTextView")
                    .getConstructor(Context.class);
            text = (TextView) constructor.newInstance(context);
        } catch (ReflectiveOperationException | ClassCastException | SecurityException ignored) {
            text = new TextView(context);
        }
        text.setText(value);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        text.setTextColor(textColor(context, darkMode));
        text.setGravity(Gravity.CENTER_VERTICAL);
        android.graphics.Typeface font = CustomFont.forMessageModule(context, text.getTypeface());
        if (font != text.getTypeface()) text.setTypeface(font);
        return text;
    }

    private static boolean isVietnamese(Context context) {
        try {
            Object language = Class.forName("com.google.android.play.core.appupdate.b")
                    .getField("b").get(null);
            if ("vi".equals(language)) return true;
            if ("en".equals(language)) return false;
        } catch (ReflectiveOperationException | SecurityException ignored) { }
        return "vi".equals(context.getResources().getConfiguration().locale.getLanguage());
    }

    private static View row(Context context, String title, boolean icon, boolean chevron, boolean darkMode) {
        return row(context, title, icon, chevron, darkMode, null);
    }

    private static View row(Context context, String title, boolean icon, boolean chevron,
                            boolean darkMode, TextView nativeTitle) {
        LinearLayout wrapper = new LinearLayout(context);
        wrapper.setOrientation(LinearLayout.VERTICAL);
        wrapper.setBackgroundColor(surfaceColor(context, darkMode));
        LinearLayout content = new LinearLayout(context);
        content.setGravity(Gravity.CENTER_VERTICAL);
        content.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        TypedValue ripple = new TypedValue();
        if (context.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true)) {
            content.setBackgroundResource(ripple.resourceId);
        }
        if (icon) {
            View leading = new View(context);
            leading.setBackground(vectorIcon(context));
            LinearLayout.LayoutParams leadingParams = new LinearLayout.LayoutParams(dp(context, 24), dp(context, 24));
            leadingParams.rightMargin = dp(context, 18);
            content.addView(leading, leadingParams);
        }
        TextView text = nativeTitle == null ? label(context, title, darkMode) : new TextView(context);
        if (nativeTitle != null) {
            text.setText(title);
            text.setTextSize(TypedValue.COMPLEX_UNIT_PX, nativeTitle.getTextSize());
            text.setTypeface(nativeTitle.getTypeface());
            text.setTextColor(nativeTitle.getTextColors());
            text.setGravity(Gravity.CENTER_VERTICAL);
        }
        content.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        if (chevron) {
            ImageView trailing = new ImageView(context);
            int chevronId = context.getResources().getIdentifier(
                    "zds_ic_chevron_right_line_16", "drawable", context.getPackageName());
            if (chevronId != 0) {
                trailing.setImageResource(chevronId);
                int colorAttribute = context.getResources().getIdentifier("icon_02", "attr", context.getPackageName());
                TypedValue color = new TypedValue();
                if (colorAttribute != 0 && context.getTheme().resolveAttribute(colorAttribute, color, true)) {
                    trailing.setImageTintList(ColorStateList.valueOf(color.resourceId != 0
                            ? context.getColorStateList(color.resourceId).getDefaultColor() : color.data));
                }
            } else {
                trailing.setImageDrawable(new LineIcon(0xFF999999, 1));
            }
            content.addView(trailing, new LinearLayout.LayoutParams(dp(context, 16), dp(context, 16)));
        }
        wrapper.addView(content, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 49)));
        View divider = new View(context);
        divider.setBackgroundColor(resourceColor(context, "divider_01",
            darkMode ? 0xFF303030 : DIVIDER));
        LinearLayout.LayoutParams dividerParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 1));
        dividerParams.leftMargin = dp(context, icon ? 50 : 16);
        wrapper.addView(divider, dividerParams);
        content.setOnClickListener(view -> wrapper.performClick());
        return wrapper;
    }

    private static Drawable vectorIcon(Context context) {
        try {
            byte[] bytes = Base64.decode(GEAR_ICON, Base64.DEFAULT);
            Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
            if (bitmap == null) throw new IllegalStateException("Invalid icon image");
            Drawable icon = new BitmapDrawable(context.getResources(), bitmap);
            icon.setColorFilter(BLUE, PorterDuff.Mode.SRC_IN);
            return icon;
        } catch (Exception ignored) {
            return new LineIcon(BLUE, 0);
        }
    }

    private static void addGroup(LinearLayout list, Context context, String title, boolean darkMode) {
        View spacer = new View(context);
        spacer.setBackgroundColor(sectionColor(context, darkMode));
        list.addView(spacer, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 8)));
        TextView heading = label(context, title, darkMode);
        heading.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        heading.setTextColor(0xFF1255B8);
        heading.setPadding(dp(context, 16), 0, 0, 0);
        heading.setBackgroundColor(surfaceColor(context, darkMode));
        list.addView(heading, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 48)));
    }

    private static void showNezumi(Context context, boolean darkMode, EntryState state) {
        boolean vietnamese = isVietnamese(context);
        int features = state.features;
        boolean hasChatFeatures = (features & (FEATURE_ONLINE_STATUS | FEATURE_REACTION |
            FEATURE_TYPING | FEATURE_READ_RECEIPTS | FEATURE_DELIVERY_RECEIPTS |
            FEATURE_RECALLED_MESSAGES)) != 0;
        String reactionLabel = vietnamese ? "Mở khóa biểu tượng cảm xúc" : "Unlock reaction icons";
        String typingLabel = vietnamese ? "Ẩn trạng thái đang nhập" : "Hide typing status";
        String readLabel = vietnamese ? "Ẩn trạng thái đã xem" : "Hide read receipts";
        String deliveryLabel = vietnamese ? "Ẩn trạng thái đã nhận" : "Hide delivery receipts";
        String mediaBoxLabel = vietnamese ? "Ẩn Media Box" : "Hide Media Box";
        String businessBoxLabel = vietnamese ? "Ẩn Business Box" : "Hide Business Box";
        String oaMessagesLabel = vietnamese ? "Ẩn tài khoản OA" : "Hide OA accounts";
        String feedAdsLabel = vietnamese ? "Ẩn quảng cáo Bảng tin" : "Hide feed ads";
        String recalledMessagesLabel = vietnamese ? "Giữ tin nhắn đã thu hồi" :
            "Keep recalled messages";
        String onlineLabel = vietnamese ? "Ẩn trạng thái hoạt động" : "Hide activity status";
        String discoveryLabel = vietnamese ? "Ẩn tab Khám phá" : "Hide Discovery tab";
        SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        Dialog page = page(context, "Nezumi's Settings", darkMode);
        boolean[] discoveryChanged = { false };
        page.setOnDismissListener(dialog -> {
            if (discoveryChanged[0]) recreateForDiscovery(context);
        });
        LinearLayout list = page.findViewById(android.R.id.content).findViewWithTag("nezumi-list");
        if (hasChatFeatures) addGroup(list, context, vietnamese ? "Trò chuyện" : "Chat", darkMode);
        if ((features & FEATURE_ONLINE_STATUS) != 0) {
        LinearLayout onlineItem = new LinearLayout(context);
        onlineItem.setGravity(Gravity.CENTER_VERTICAL);
        onlineItem.setBackgroundColor(surfaceColor(context, darkMode));
        onlineItem.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        onlineItem.addView(label(context, onlineLabel, darkMode),
            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        Switch onlineToggle = new Switch(context);
        onlineToggle.setContentDescription(onlineLabel);
        onlineToggle.setThumbTintList(ColorStateList.valueOf(0xFFFFFFFF));
        onlineToggle.setTrackTintList(new ColorStateList(
            new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
            new int[] { BLUE, 0xFFBDBDBD }));
        onlineToggle.setChecked(prefs.getBoolean(HIDE_ONLINE_STATUS, false));
        onlineToggle.setOnCheckedChangeListener((button, checked) -> {
            if (prefs.getBoolean(HIDE_ONLINE_STATUS, false) == checked) return;
            boolean originalSharing = originalOnlineSharing();
            boolean hasSavedSharing = prefs.contains(SAVED_ONLINE_SHARING);
            boolean savedSharing = hasSavedSharing ? prefs.getBoolean(SAVED_ONLINE_SHARING, true) : originalSharing;
            prefs.edit().putBoolean(HIDE_ONLINE_STATUS, checked).apply();
            try {
                if (checked) {
                    if (!hasSavedSharing) {
                        prefs.edit().putBoolean(SAVED_ONLINE_SHARING, originalSharing).apply();
                    }
                    applyOriginalOnlineSharing(false);
                } else {
                    applyOriginalOnlineSharing(savedSharing);
                    prefs.edit().remove(SAVED_ONLINE_SHARING).apply();
                }
                publishOnlineState(103);
            } catch (LinkageError | RuntimeException failure) {
                applyOriginalOnlineSharing(originalSharing);
                prefs.edit().putBoolean(HIDE_ONLINE_STATUS, !checked).apply();
                onlineToggle.setChecked(!checked);
                Toast.makeText(context, vietnamese ? "Không thể cập nhật trạng thái kết nối" :
                    "Unable to update connection status", Toast.LENGTH_SHORT).show();
            }
        });
        onlineItem.addView(onlineToggle);
        onlineItem.setOnClickListener(view -> onlineToggle.setChecked(!onlineToggle.isChecked()));
        list.addView(onlineItem, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        onlineItem.setVisibility(isOnlinePatchAvailable() ? View.VISIBLE : View.GONE);
        }
        if ((features & FEATURE_REACTION) != 0) {
        LinearLayout item = new LinearLayout(context);
        item.setGravity(Gravity.CENTER_VERTICAL);
        item.setBackgroundColor(surfaceColor(context, darkMode));
        item.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        item.addView(label(context, reactionLabel, darkMode),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        Switch toggle = new Switch(context);
        toggle.setContentDescription(reactionLabel);
        toggle.setThumbTintList(ColorStateList.valueOf(0xFFFFFFFF));
        toggle.setTrackTintList(new ColorStateList(
            new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
            new int[] { BLUE, 0xFFBDBDBD }));
        toggle.setChecked(prefs.getBoolean(REACTION, true));
        toggle.setOnCheckedChangeListener((button, checked) -> prefs.edit().putBoolean(REACTION, checked).apply());
        item.addView(toggle);
        item.setOnClickListener(view -> toggle.setChecked(!toggle.isChecked()));
        list.addView(item, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        }
        if ((features & FEATURE_TYPING) != 0) {
        LinearLayout typingItem = new LinearLayout(context);
        typingItem.setGravity(Gravity.CENTER_VERTICAL);
        typingItem.setBackgroundColor(surfaceColor(context, darkMode));
        typingItem.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        typingItem.addView(label(context, typingLabel, darkMode),
            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        Switch typingToggle = new Switch(context);
        typingToggle.setContentDescription(typingLabel);
        typingToggle.setThumbTintList(ColorStateList.valueOf(0xFFFFFFFF));
        typingToggle.setTrackTintList(new ColorStateList(
            new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
            new int[] { BLUE, 0xFFBDBDBD }));
        typingToggle.setChecked(prefs.getBoolean(HIDE_TYPING, false));
        typingToggle.setOnCheckedChangeListener((button, checked) -> prefs.edit().putBoolean(HIDE_TYPING, checked).apply());
        typingItem.addView(typingToggle);
        typingItem.setOnClickListener(view -> typingToggle.setChecked(!typingToggle.isChecked()));
        list.addView(typingItem, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        }
        if ((features & FEATURE_READ_RECEIPTS) != 0) {
        LinearLayout readItem = new LinearLayout(context);
        readItem.setGravity(Gravity.CENTER_VERTICAL);
        readItem.setBackgroundColor(surfaceColor(context, darkMode));
        readItem.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        readItem.addView(label(context, readLabel, darkMode),
            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        Switch readToggle = new Switch(context);
        readToggle.setContentDescription(readLabel);
        readToggle.setThumbTintList(ColorStateList.valueOf(0xFFFFFFFF));
        readToggle.setTrackTintList(new ColorStateList(
            new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
            new int[] { BLUE, 0xFFBDBDBD }));
        readToggle.setChecked(prefs.getBoolean(HIDE_READ_RECEIPTS, false));
        readToggle.setOnCheckedChangeListener((button, checked) -> prefs.edit().putBoolean(HIDE_READ_RECEIPTS, checked).apply());
        readItem.addView(readToggle);
        readItem.setOnClickListener(view -> readToggle.setChecked(!readToggle.isChecked()));
        list.addView(readItem, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        }
        if ((features & FEATURE_DELIVERY_RECEIPTS) != 0) {
        LinearLayout deliveryItem = new LinearLayout(context);
        deliveryItem.setGravity(Gravity.CENTER_VERTICAL);
        deliveryItem.setBackgroundColor(surfaceColor(context, darkMode));
        deliveryItem.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        deliveryItem.addView(label(context, deliveryLabel, darkMode),
            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        Switch deliveryToggle = new Switch(context);
        deliveryToggle.setContentDescription(deliveryLabel);
        deliveryToggle.setThumbTintList(ColorStateList.valueOf(0xFFFFFFFF));
        deliveryToggle.setTrackTintList(new ColorStateList(
            new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
            new int[] { BLUE, 0xFFBDBDBD }));
        deliveryToggle.setChecked(prefs.getBoolean(HIDE_DELIVERY_RECEIPTS, false));
        deliveryToggle.setOnCheckedChangeListener((button, checked) -> prefs.edit().putBoolean(HIDE_DELIVERY_RECEIPTS, checked).apply());
        deliveryItem.addView(deliveryToggle);
        deliveryItem.setOnClickListener(view -> deliveryToggle.setChecked(!deliveryToggle.isChecked()));
        list.addView(deliveryItem, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        }
        if ((features & FEATURE_RECALLED_MESSAGES) != 0) {
        LinearLayout recalledMessagesItem = new LinearLayout(context);
        recalledMessagesItem.setGravity(Gravity.CENTER_VERTICAL);
        recalledMessagesItem.setBackgroundColor(surfaceColor(context, darkMode));
        recalledMessagesItem.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        recalledMessagesItem.addView(label(context, recalledMessagesLabel, darkMode),
            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        Switch recalledMessagesToggle = new Switch(context);
        recalledMessagesToggle.setContentDescription(recalledMessagesLabel);
        recalledMessagesToggle.setThumbTintList(ColorStateList.valueOf(0xFFFFFFFF));
        recalledMessagesToggle.setTrackTintList(new ColorStateList(
            new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
            new int[] { BLUE, 0xFFBDBDBD }));
        recalledMessagesToggle.setChecked(prefs.getBoolean(KEEP_RECALLED_MESSAGES, false));
        recalledMessagesToggle.setOnCheckedChangeListener((button, checked) ->
            prefs.edit().putBoolean(KEEP_RECALLED_MESSAGES, checked).apply());
        recalledMessagesItem.addView(recalledMessagesToggle);
        recalledMessagesItem.setOnClickListener(view ->
            recalledMessagesToggle.setChecked(!recalledMessagesToggle.isChecked()));
        list.addView(recalledMessagesItem, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        }
        if ((features & FEATURE_DISCOVERY) != 0) {
        addGroup(list, context, vietnamese ? "Điều hướng" : "Navigation", darkMode);
        LinearLayout discoveryItem = new LinearLayout(context);
        discoveryItem.setGravity(Gravity.CENTER_VERTICAL);
        discoveryItem.setBackgroundColor(surfaceColor(context, darkMode));
        discoveryItem.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        discoveryItem.addView(label(context, discoveryLabel, darkMode),
            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        Switch discoveryToggle = new Switch(context);
        discoveryToggle.setContentDescription(discoveryLabel);
        discoveryToggle.setThumbTintList(ColorStateList.valueOf(0xFFFFFFFF));
        discoveryToggle.setTrackTintList(new ColorStateList(
            new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
            new int[] { BLUE, 0xFFBDBDBD }));
        discoveryToggle.setChecked(prefs.getBoolean(HIDE_DISCOVERY, true));
        discoveryToggle.setOnCheckedChangeListener((button, checked) -> {
            if (prefs.getBoolean(HIDE_DISCOVERY, true) == checked) return;
            prefs.edit().putBoolean(HIDE_DISCOVERY, checked).apply();
            discoveryChanged[0] = true;
        });
        discoveryItem.addView(discoveryToggle);
        discoveryItem.setOnClickListener(view -> discoveryToggle.setChecked(!discoveryToggle.isChecked()));
        list.addView(discoveryItem, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        }
        if ((features & FEATURE_FEED_ADS) != 0) {
        addGroup(list, context, vietnamese ? "Bảng tin" : "Feed", darkMode);
        LinearLayout feedAdsItem = new LinearLayout(context);
        feedAdsItem.setGravity(Gravity.CENTER_VERTICAL);
        feedAdsItem.setBackgroundColor(surfaceColor(context, darkMode));
        feedAdsItem.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        feedAdsItem.addView(label(context, feedAdsLabel, darkMode),
            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        Switch feedAdsToggle = new Switch(context);
        feedAdsToggle.setContentDescription(feedAdsLabel);
        feedAdsToggle.setThumbTintList(ColorStateList.valueOf(0xFFFFFFFF));
        feedAdsToggle.setTrackTintList(new ColorStateList(
            new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
            new int[] { BLUE, 0xFFBDBDBD }));
        feedAdsToggle.setChecked(prefs.getBoolean(HIDE_FEED_ADS, false));
        feedAdsToggle.setOnCheckedChangeListener((button, checked) ->
            prefs.edit().putBoolean(HIDE_FEED_ADS, checked).apply());
        feedAdsItem.addView(feedAdsToggle);
        feedAdsItem.setOnClickListener(view -> feedAdsToggle.setChecked(!feedAdsToggle.isChecked()));
        list.addView(feedAdsItem, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        }
        if ((features & (FEATURE_MEDIA_BOX | FEATURE_BUSINESS_BOX | FEATURE_OA_MESSAGES)) != 0) {
        addGroup(list, context, vietnamese ? "Hội thoại" : "Conversation", darkMode);
        }
        if ((features & FEATURE_MEDIA_BOX) != 0) {
        LinearLayout mediaBoxItem = new LinearLayout(context);
        mediaBoxItem.setGravity(Gravity.CENTER_VERTICAL);
        mediaBoxItem.setBackgroundColor(surfaceColor(context, darkMode));
        mediaBoxItem.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        mediaBoxItem.addView(label(context, mediaBoxLabel, darkMode),
            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        Switch mediaBoxToggle = new Switch(context);
        mediaBoxToggle.setContentDescription(mediaBoxLabel);
        mediaBoxToggle.setThumbTintList(ColorStateList.valueOf(0xFFFFFFFF));
        mediaBoxToggle.setTrackTintList(new ColorStateList(
            new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
            new int[] { BLUE, 0xFFBDBDBD }));
        mediaBoxToggle.setChecked(prefs.getBoolean(HIDE_MEDIA_BOX, false));
        mediaBoxToggle.setOnCheckedChangeListener((button, checked) -> prefs.edit().putBoolean(HIDE_MEDIA_BOX, checked).apply());
        mediaBoxItem.addView(mediaBoxToggle);
        mediaBoxItem.setOnClickListener(view -> mediaBoxToggle.setChecked(!mediaBoxToggle.isChecked()));
        list.addView(mediaBoxItem, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        }
        if ((features & FEATURE_BUSINESS_BOX) != 0) {
        LinearLayout businessBoxItem = new LinearLayout(context);
        businessBoxItem.setGravity(Gravity.CENTER_VERTICAL);
        businessBoxItem.setBackgroundColor(surfaceColor(context, darkMode));
        businessBoxItem.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        businessBoxItem.addView(label(context, businessBoxLabel, darkMode),
            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        Switch businessBoxToggle = new Switch(context);
        businessBoxToggle.setContentDescription(businessBoxLabel);
        businessBoxToggle.setThumbTintList(ColorStateList.valueOf(0xFFFFFFFF));
        businessBoxToggle.setTrackTintList(new ColorStateList(
            new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
            new int[] { BLUE, 0xFFBDBDBD }));
        businessBoxToggle.setChecked(prefs.getBoolean(HIDE_BUSINESS_BOX, false));
        businessBoxToggle.setOnCheckedChangeListener((button, checked) ->
            prefs.edit().putBoolean(HIDE_BUSINESS_BOX, checked).apply());
        businessBoxItem.addView(businessBoxToggle);
        businessBoxItem.setOnClickListener(view -> businessBoxToggle.setChecked(!businessBoxToggle.isChecked()));
        list.addView(businessBoxItem, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        }
        if ((features & FEATURE_OA_MESSAGES) != 0) {
        LinearLayout oaMessagesItem = new LinearLayout(context);
        oaMessagesItem.setGravity(Gravity.CENTER_VERTICAL);
        oaMessagesItem.setBackgroundColor(surfaceColor(context, darkMode));
        oaMessagesItem.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        oaMessagesItem.addView(label(context, oaMessagesLabel, darkMode),
            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        Switch oaMessagesToggle = new Switch(context);
        oaMessagesToggle.setContentDescription(oaMessagesLabel);
        oaMessagesToggle.setThumbTintList(ColorStateList.valueOf(0xFFFFFFFF));
        oaMessagesToggle.setTrackTintList(new ColorStateList(
            new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
            new int[] { BLUE, 0xFFBDBDBD }));
        oaMessagesToggle.setChecked(prefs.getBoolean(HIDE_OA_MESSAGES, true));
        oaMessagesToggle.setOnCheckedChangeListener((button, checked) ->
            setOAMessagesHidden(context, checked));
        oaMessagesItem.addView(oaMessagesToggle);
        oaMessagesItem.setOnClickListener(view -> oaMessagesToggle.setChecked(!oaMessagesToggle.isChecked()));
        list.addView(oaMessagesItem, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        }
        if ((features & FEATURE_CUSTOM_FONT) != 0) {
        addGroup(list, context, vietnamese ? "Giao diện" : "Appearance", darkMode);
        String fontTitle = vietnamese ? "Phông chữ tùy chọn" : "Custom font";
        View fontItem = row(context, fontTitle, false, true, darkMode);
        TextView fontLabel = findTextView(fontItem);
        Runnable updateFontLabel = () -> fontLabel.setText(fontTitle + (CustomFont.isSelected(context)
            ? (vietnamese ? " (đã chọn)" : " (selected)") : ""));
        updateFontLabel.run();
        fontItem.setOnClickListener(view -> {
            if (!CustomFont.pick(context, updateFontLabel)) {
            Toast.makeText(context, vietnamese ? "Không thể mở trình chọn phông chữ" : "Cannot open font picker",
                Toast.LENGTH_SHORT).show();
            }
        });
        list.addView(fontItem);
        View resetFont = row(context, vietnamese ? "Dùng phông chữ mặc định" : "Restore default font",
            false, false, darkMode);
        resetFont.setOnClickListener(view -> {
            CustomFont.reset(context);
            updateFontLabel.run();
            Toast.makeText(context, vietnamese ? "Mở lại Zalo để cập nhật phông chữ"
                : "Restart Zalo to refresh text", Toast.LENGTH_LONG).show();
        });
        list.addView(resetFont);
        }
        if ((features & FEATURE_CUSTOM_SOUNDS) != 0) {
            addGroup(list, context, vietnamese ? "Âm thanh" : "Sounds", darkMode);
            addSoundRows(list, context, CustomSounds.NOTIFICATION,
                vietnamese ? "Âm báo tin nhắn" : "Notification sound", darkMode, vietnamese);
            addSoundRows(list, context, CustomSounds.RINGTONE,
                vietnamese ? "Nhạc chuông cuộc gọi" : "Incoming-call ringtone", darkMode, vietnamese);
        }
        page.show();
        page.getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
    }

    private static void addSoundRows(LinearLayout list, Context context, String kind, String title,
            boolean darkMode, boolean vietnamese) {
        View item = row(context, title, false, true, darkMode);
        TextView text = findTextView(item);
        Runnable update = () -> text.setText(title + (CustomSounds.isSelected(context, kind)
            ? (vietnamese ? " (đã chọn)" : " (selected)") : ""));
        update.run();
        item.setOnClickListener(view -> {
            if (!CustomSounds.pick(context, kind, update)) {
                Toast.makeText(context, vietnamese ? "Không thể mở trình chọn âm thanh"
                    : "Cannot open audio picker", Toast.LENGTH_SHORT).show();
            }
        });
        list.addView(item);
        View reset = row(context, vietnamese ? "Khôi phục: " + title : "Restore: " + title,
            false, false, darkMode);
        reset.setOnClickListener(view -> {
            CustomSounds.reset(context, kind);
            update.run();
        });
        list.addView(reset);
    }

    private static Dialog page(Context context, String title, boolean darkMode) {
        Dialog page = new Dialog(context);
        page.requestWindowFeature(Window.FEATURE_NO_TITLE);
        LinearLayout screen = new LinearLayout(context);
        screen.setOrientation(LinearLayout.VERTICAL);
        screen.setBackgroundColor(HEADER_BLUE);
        screen.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(0, insets.getSystemWindowInsetTop(), 0, 0);
            return insets;
        });
        LinearLayout bar = new LinearLayout(context);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(HEADER_BLUE);
        ImageView back = new ImageView(context);
        int backId = context.getResources().getIdentifier(
            "zds_ic_arrow_left_line_24", "drawable", context.getPackageName());
        if (backId != 0) back.setImageResource(backId);
        else {
            back.setImageDrawable(new LineIcon(0xFFFFFFFF, 1));
            back.setRotation(180f);
        }
        back.setImageTintList(ColorStateList.valueOf(0xFFFFFFFF));
        back.setScaleType(ImageView.ScaleType.CENTER);
        back.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        back.setContentDescription("Back");
        back.setOnClickListener(view -> page.dismiss());
        bar.addView(back, new LinearLayout.LayoutParams(dp(context, 56), ViewGroup.LayoutParams.MATCH_PARENT));
        TextView pageTitle = label(context, title, darkMode);
        pageTitle.setTextColor(0xFFFFFFFF);
        bar.addView(pageTitle, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        screen.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56)));
        ScrollView scroll = new ScrollView(context);
        scroll.setBackgroundColor(sectionColor(context, darkMode));
        LinearLayout list = new LinearLayout(context);
        list.setTag("nezumi-list");
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list);
        screen.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        page.setContentView(screen);
        Window window = page.getWindow();
        window.setBackgroundDrawable(new ColorDrawable(surfaceColor(context, darkMode)));
        window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        window.setDimAmount(0f);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) window.setStatusBarContrastEnforced(false);
        window.setStatusBarColor(0x00000000);
        window.getDecorView().setSystemUiVisibility(
            (window.getDecorView().getSystemUiVisibility() | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                | View.SYSTEM_UI_FLAG_LAYOUT_STABLE) & ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        return page;
    }

    private static final class LineIcon extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int kind;

        LineIcon(int color, int kind) {
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(2);
            paint.setStrokeCap(Paint.Cap.ROUND);
            this.kind = kind;
        }

        @Override public void draw(Canvas canvas) {
            float cx = getBounds().exactCenterX();
            float cy = getBounds().exactCenterY();
            float scale = Math.min(getBounds().width(), getBounds().height()) / 24f;
            paint.setStrokeWidth(1.8f * scale);
            if (kind == 1) {
                canvas.drawLine(cx - 3 * scale, cy - 5 * scale, cx + 2 * scale, cy, paint);
                canvas.drawLine(cx + 2 * scale, cy, cx - 3 * scale, cy + 5 * scale, paint);
                return;
            }
            if (kind == 2) {
                canvas.drawRoundRect(cx - 9 * scale, cy - 7 * scale, cx + 9 * scale,
                        cy + 5 * scale, 4 * scale, 4 * scale, paint);
                canvas.drawLine(cx - 4 * scale, cy + 5 * scale, cx - 7 * scale, cy + 9 * scale, paint);
                canvas.drawLine(cx - 7 * scale, cy + 9 * scale, cx + 1 * scale, cy + 5 * scale, paint);
                return;
            }
            canvas.drawCircle(cx, cy, 8 * scale, paint);
            canvas.drawCircle(cx, cy, 3 * scale, paint);
            for (int spoke = 0; spoke < 8; spoke++) {
                double angle = spoke * Math.PI / 4;
                canvas.drawLine(cx + (float) Math.cos(angle) * 8 * scale,
                        cy + (float) Math.sin(angle) * 8 * scale,
                        cx + (float) Math.cos(angle) * 10 * scale,
                        cy + (float) Math.sin(angle) * 10 * scale, paint);
            }
        }

        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(android.graphics.ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}