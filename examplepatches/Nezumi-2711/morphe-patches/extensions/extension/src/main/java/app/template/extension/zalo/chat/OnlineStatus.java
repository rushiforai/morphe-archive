package app.template.extension.zalo.chat;

import android.content.Context;
import android.view.View;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.WeakHashMap;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
import app.template.extension.zalo.settings.NezumiPrefs;
import app.template.extension.zalo.shared.ZaloEnv;

/** Private online status: masks our own presence while still showing peers online. */
public final class OnlineStatus {
    private OnlineStatus() { }

    private static final Object ONLINE_LOCK = new Object();

    private static final Set<String> ONLINE_USERS = new HashSet<>();

    private static final WeakHashMap<TextView, ChatPresence> CHAT_SUBTITLES = new WeakHashMap<>();

    private static final WeakHashMap<Object, String> CHAT_TARGETS = new WeakHashMap<>();

    private static final ThreadLocal<Boolean> CHAT_REFRESH = new ThreadLocal<>();

    private static long onlineObservedAt;

    private static long lastChatRefresh;

    private static long lastChatAttempt;

    private static String onlineAccount;

    public static boolean shouldFetchOnlineStatus() {
        return isOnlineHidden() || originalOnlineSharing();
    }

    public static void traceOnlineResponse(org.json.JSONObject data) {
        try {
            org.json.JSONArray onlines = data.optJSONArray("onlines");
            NezumiLog.i(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "onlineResponse sharing=" + originalOnlineSharing()
                + " hidden=" + isOnlineHidden() + " hasOnlines=" + data.has("onlines")
                + " arrayPresent=" + (onlines != null)
                + " count=" + (onlines == null ? -1 : onlines.length()));
        } catch (RuntimeException ignored) {
            NezumiLog.w(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "onlineResponse probe unavailable");
        }
    }

    public static void traceLastSeenResponse(org.json.JSONObject data) {
        try {
            NezumiLog.i(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "lastSeenResponse sharing=" + originalOnlineSharing()
                + " hidden=" + isOnlineHidden() + " hasTimestamp=" + data.has("timestamp")
                + " timestampPositive=" + (data.optLong("timestamp") > 0)
                + " hasVisibility=" + data.has("settingOnlineStatus")
                + " visibility=" + data.optInt("settingOnlineStatus", -1));
        } catch (RuntimeException ignored) {
            NezumiLog.w(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "lastSeenResponse probe unavailable");
        }
    }

    public static void traceFriendListResponse(org.json.JSONObject data) {
        try {
            org.json.JSONArray onlines = data.optJSONArray("onlines");
            NezumiLog.i(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "friendListResponse sharing=" + originalOnlineSharing()
                + " hidden=" + isOnlineHidden() + " arrayPresent=" + (onlines != null)
                + " count=" + (onlines == null ? -1 : onlines.length()));
        } catch (RuntimeException ignored) {
            NezumiLog.w(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "friendListResponse probe unavailable");
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
            onlineAccount = ZaloEnv.currentAccount(Patch.VIEW_ONLINE_STATUS_PRIVATELY);
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
            NezumiLog.i(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "chatRefresh dispatched");
        }
    }

    public static void traceChatOnlineGate(Object repository) {
        if (!isChatOnlineRefresh()) return;
        try {
            boolean inFlight = repository.getClass().getField("n").getBoolean(repository);
            long requestedAt = repository.getClass().getField("l").getLong(repository);
            long remaining = Math.max(0, onlineRefreshInterval() - (System.currentTimeMillis() - requestedAt));
            NezumiLog.i(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "chatRefresh gate inFlight=" + inFlight
                + " throttleRemainingMs=" + remaining);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            NezumiLog.w(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "Chat refresh gate unavailable", failure);
        }
    }

    public static boolean retainChatOnlineSubtitle(TextView subtitle) {
        ChatPresence presence;
        synchronized (ONLINE_LOCK) {
            presence = CHAT_SUBTITLES.get(subtitle);
        }
        return presence != null && presence.render(true);
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
                    && onlineAccount != null && onlineAccount.equals(ZaloEnv.currentAccount(Patch.VIEW_ONLINE_STATUS_PRIVATELY));
            }
            CharSequence text = subtitle.getText();
            boolean managed = text instanceof android.text.Spanned
                && ((android.text.Spanned) text).getSpanStart(marker) >= 0;
            if (isOnlineHidden() && online && (nativeClear || android.text.TextUtils.isEmpty(text) || managed)) {
                android.text.SpannableString label = new android.text.SpannableString(
                    ZaloEnv.isVietnamese(Patch.VIEW_ONLINE_STATUS_PRIVATELY, subtitle.getContext()) ? "Đang hoạt động" : "Online");
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
                        NezumiLog.i(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "chatRefresh attempt");
                        requestChatOnlineList();
                    } catch (LinkageError | RuntimeException failure) {
                        NezumiLog.w(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "Chat online refresh unavailable", failure);
                    } finally {
                        CHAT_REFRESH.remove();
                    }
                }
            }
            scheduled = true;
            subtitle.postDelayed(this, 2000);
        }
    }

    public static int mapOnlineState(int state) {
        Context context = ZaloEnv.appContext(Patch.VIEW_ONLINE_STATUS_PRIVATELY);
        boolean hidden = isOnlineHidden();
        int mapped = state == 103 && hidden ? 102 : state;
        NezumiLog.d(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "OnlineStatus", "socketState=" + state + " mapped=" + mapped
            + " hidden=" + hidden + " contextAvailable=" + (context != null));
        return mapped;
    }

    // Bridge stubs: ViewOnlineStatusPrivatelyPatch replaces these bodies with calls into Zalo,
    // so their names and signatures must not change.

    public static void requestChatOnlineList() {
        throw new IllegalStateException("Chat online request bridge was not patched");
    }

    static boolean isOnlineHidden() {
        return NezumiPrefs.bool(ZaloEnv.appContext(Patch.VIEW_ONLINE_STATUS_PRIVATELY), NezumiPrefs.HIDE_ONLINE_STATUS, false);
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
}
