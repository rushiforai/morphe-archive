package app.linenotifications.extension;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.RemoteInput;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.service.notification.StatusBarNotification;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import app.linenotifications.extension.core.NotificationPolicy;

/** Called only from the verified native notification publish path. */
public final class Notifications {
    private static final String CHANNEL = "line_notification_patches.silent.v1";
    private static final String ACCOUNT = "line_notification_patches.account";
    private static final String NATIVE_ACTIONS = "line_notification_patches.native_actions";
    private static final String MESSAGE_TAG = "NOTIFICATION_TAG_MESSAGE";
    private static final String DEBUG_TAG = "LineNotifyPatch";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService REFRESH_WORKER = Executors.newSingleThreadExecutor();
    private static final Map<NotificationPolicy.ChatKey, Runnable> DEFERRED = new HashMap<>();
    private Notifications() {}

    // Disabled by default; adb can enable this tag for a reproduction. Only fixed stage
    // names are recorded, never room/account IDs, message contents or exception messages.
    private static void trace(String stage) {
        if (android.util.Log.isLoggable(DEBUG_TAG, android.util.Log.DEBUG)) android.util.Log.d(DEBUG_TAG, stage);
    }

    /** Scoped replacement of the two regular-chat presentation mute checks. */
    public static boolean allowMuted(Object manager, String chat) {
        try {
            boolean nativeEnabled = NativeLine.notificationEnabled(manager, chat);
            if (!Settings.enabled(Settings.SILENT) || !NativeLine.regularChat(chat)) {
                trace("mute gate: native policy");
                return nativeEnabled;
            }
            String account = NativeLine.account();
            boolean show = !Settings.fullyMuted(account, chat);
            trace(!show ? "mute gate: fully hidden" : nativeEnabled ? "mute gate: normal" : "mute gate: silent allowed");
            return show;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            trace("mute gate: adapter failed");
            // A failed native check must never turn a muted chat into an audible notification.
            return false;
        }
    }

    /** Suppress before the native child + summary pair is posted. */
    public static boolean suppressBuilder(Object nativeBuilder) {
        if (!Settings.enabled(Settings.SILENT)) return false;
        try {
            Bundle extras = (Bundle) NativeLine.field(nativeBuilder, "p");
            if (extras == null) return false;
            String chat = extras.getString("line.chat.id");
            return NativeLine.regularChat(chat) && Settings.fullyMuted(NativeLine.account(), chat);
        } catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }

    public static synchronized void post(NotificationManager manager, String tag, int id, Notification original) {
        if (original == null) return;
        Notification notification = original;
        try {
            notification = transform(manager, tag, original);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            trace("transform: adapter failed");
            // A failed account/hidden-room lookup must never expose a fully hidden room.
            if (Settings.enabled(Settings.SILENT) && isMessage(original)) {
                notification = null;
            }
        }
        if (notification == null) {
            trace("post: suppressed");
            manager.cancel(tag, id);
        } else {
            manager.notify(tag, id, notification);
            trace("post: delivered to Android");
            if (isMessage(notification)) deferRefresh(notification.extras.getString("line.chat.id"));
        }
    }

    /** Native save completion only: refresh existing posts, without fetching or polling. */
    public static synchronized void onMessageStored(String chat) {
        if ((!Settings.enabled(Settings.INFO) && !Settings.enabled(Settings.READ)) || !NativeLine.regularChat(chat)) return;
        refreshActive(chat, false);
        deferRefresh(chat);
    }

    /**
     * NotificationManager publishes asynchronously. A save hook can observe the
     * previous child while the final child/summary pair is being queued. Coalesce
     * each room's burst into one trailing refresh of still-active notifications.
     * This is event-driven and bounded: no polling, native state writes or network.
     */
    private static void deferRefresh(String chat) {
        if ((!Settings.enabled(Settings.INFO) && !Settings.enabled(Settings.READ)) || !NativeLine.regularChat(chat)) return;
        try {
            NotificationPolicy.ChatKey key = new NotificationPolicy.ChatKey(NativeLine.account(), chat);
            Runnable callback = new Runnable() {
                @Override public void run() {
                    REFRESH_WORKER.execute(() -> {
                        synchronized (Notifications.class) {
                            if (DEFERRED.get(key) != this) return;
                            DEFERRED.remove(key);
                            try {
                                if ((!Settings.enabled(Settings.INFO) && !Settings.enabled(Settings.READ))
                                        || !key.accountId.equals(NativeLine.account())) return;
                                // refreshActive rechecks account, privacy, read boundary and
                                // current post identity, and never creates an absent notification.
                                refreshActive(key.chatId, false);
                                trace("local save: trailing refresh completed");
                            } catch (ReflectiveOperationException | RuntimeException ignored) {
                                trace("local save: trailing refresh unavailable");
                            }
                        }
                    });
                }
            };
            Runnable previous = DEFERRED.put(key, callback);
            if (previous != null) MAIN.removeCallbacks(previous);
            MAIN.postDelayed(callback, 400);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            trace("local save: trailing refresh unavailable");
        }
    }

    /** Switching this feature updates only actions, without changing quiet/hidden-room state. */
    static synchronized void refreshReadActions() { refreshActive(null, true); }

    private static void refreshActive(String chat, boolean actionsOnly) {
        try {
            String account = NativeLine.account();
            NotificationManager manager = Settings.context().getSystemService(NotificationManager.class);
            for (StatusBarNotification active : manager.getActiveNotifications()) {
                Notification original = active.getNotification();
                if (!isMessage(original) || (chat != null && !chat.equals(original.extras.getString("line.chat.id")))
                        || !account.equals(original.extras.getString(ACCOUNT))) continue;
                String activeChat = original.extras.getString("line.chat.id");
                if (!NativeLine.regularChat(activeChat) || original.extras.getBoolean("line.square.notification")) continue;
                boolean onlyActions = actionsOnly || !Settings.enabled(Settings.INFO) || !NativeLine.previewsAllowed();
                Notification updated;
                if (onlyActions) {
                    if (!MESSAGE_TAG.equals(active.getTag()) || (original.flags & Notification.FLAG_GROUP_SUMMARY) != 0) continue;
                    Notification.Builder builder = Notification.Builder.recoverBuilder(Settings.context(), original);
                    applyActions(builder, original, account, activeChat, false);
                    updated = builder.build();
                } else updated = transform(manager, active.getTag(), original);
                // Best-effort check immediately before updating: do not knowingly revive a
                // dismissed/replaced post. Android does not offer an atomic update-if-active.
                boolean stillActive = false;
                for (StatusBarNotification current : manager.getActiveNotifications()) {
                    if (active.getKey().equals(current.getKey()) && active.getPostTime() == current.getPostTime()
                            && java.util.Objects.equals(original.extras.getString("line.message.id"),
                                current.getNotification().extras.getString("line.message.id"))) {
                        stillActive = true;
                        break;
                    }
                }
                if (!stillActive || !account.equals(NativeLine.account())) continue;
                if (updated != null && !NativeLine.previewsAllowed()) {
                    // An action refresh must not republish a preview after privacy was disabled.
                    String newMessage = Strings.get("line_notify_new_message", "You have a new message.");
                    updated = plainSummary(Notification.Builder.recoverBuilder(Settings.context(), updated),
                            "LINE", newMessage);
                    if (updated.publicVersion != null) updated.publicVersion = plainSummary(
                            Notification.Builder.recoverBuilder(Settings.context(), updated.publicVersion)
                                    .setActions(new Notification.Action[0]), "LINE", newMessage);
                }
                if (updated == null) manager.cancel(active.getTag(), active.getId());
                else {
                    updated.flags |= Notification.FLAG_ONLY_ALERT_ONCE;
                    manager.notify(active.getTag(), active.getId(), updated);
                }
                trace("local save: active notification refreshed");
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            trace("local save: refresh unavailable");
        }
    }

    private static boolean isMessage(Notification n) {
        return n.extras != null && n.extras.getString("line.chat.id") != null
                && (n.flags & (Notification.FLAG_FOREGROUND_SERVICE | Notification.FLAG_ONGOING_EVENT)) == 0;
    }

    private static Notification transform(NotificationManager manager, String tag, Notification original)
            throws ReflectiveOperationException {
        if (!isMessage(original)) return original;
        NotificationPolicy.Settings settings = Settings.values();
        // Stamp the account even while READ is off so a later switch cannot adopt another
        // account's existing notification. No content or action change is needed in that case.
        if (!settings.notTooMuchSilent && !settings.moreChatInfo && !settings.noReply && !Settings.readIncluded()) return original;
        String chat = original.extras.getString("line.chat.id");
        if (!NativeLine.regularChat(chat) || original.extras.getBoolean("line.square.notification")) return original;
        boolean summary = (original.flags & Notification.FLAG_GROUP_SUMMARY) != 0;
        if (!summary && !MESSAGE_TAG.equals(tag)) return original;
        String account = NativeLine.account();
        String postedAccount = original.extras.getString(ACCOUNT);
        if (postedAccount != null && !account.equals(postedAccount)) return null;
        if (settings.notTooMuchSilent && Settings.fullyMuted(account, chat)) return null;
        boolean muted = settings.notTooMuchSilent && (Settings.quiet(account, chat) || NativeLine.muted(chat));
        Notification.Builder builder = Notification.Builder.recoverBuilder(Settings.context(), original);
        Bundle extras = new Bundle(original.extras);
        extras.putString(ACCOUNT, account);
        builder.setExtras(extras);
        if (muted) {
            NotificationChannel source = manager.getNotificationChannel(original.getChannelId());
            if (source == null || source.getImportance() == NotificationManager.IMPORTANCE_NONE) {
                trace("silent: source channel unavailable or blocked");
                return null;
            }
            if (source.getGroup() != null && manager.getNotificationChannelGroup(source.getGroup()) != null
                    && manager.getNotificationChannelGroup(source.getGroup()).isBlocked()) return null;
            int channelVisibility = source.getLockscreenVisibility();
            if (channelVisibility == Notification.VISIBILITY_SECRET || channelVisibility == Notification.VISIBILITY_PRIVATE) {
                builder.setVisibility(Math.min(original.visibility, channelVisibility));
            }
            silent(manager, builder);
            trace("silent: channel applied");
        }

        boolean singleRoom = !summary || !hasOtherRoom(manager, original, account, chat);
        if (summary && settings.notTooMuchSilent) {
            // Keep a single room's native sender/body while its push awaits local storage.
            // Never reuse LINE's global summary total or stale recovered BigTextStyle.
            boolean nativePreview = singleRoom && NativeLine.previewsAllowed();
            String newMessage = Strings.get("line_notify_new_message", "You have a new message.");
            Notification fallback = plainSummary(builder, nativePreview
                    ? original.extras.getCharSequence(Notification.EXTRA_TITLE, "LINE") : "LINE", nativePreview
                    ? original.extras.getCharSequence(Notification.EXTRA_TEXT, newMessage) : newMessage);
            if (original.publicVersion != null) {
                fallback.publicVersion = plainSummary(Notification.Builder.recoverBuilder(Settings.context(), original.publicVersion)
                        .setActions(new Notification.Action[0]), "LINE", newMessage);
            }
            builder = Notification.Builder.recoverBuilder(Settings.context(), fallback);
        }
        if (summary && !singleRoom) return builder.build();

        applyActions(builder, original, account, chat, summary);
        if (settings.moreChatInfo) {
            try {
                NativeLine.Chat state = NativeLine.chat(chat);
                boolean preview = NativeLine.previewsAllowed();
                String posted = original.extras.getString("line.message.id");
                if (state != null && preview && posted != null) {
                    List<NotificationPolicy.Message> messages = NativeLine.recent(chat, account, state);
                    NotificationPolicy.PreviewState readiness = NotificationPolicy.previewState(state.unread, state.readUp, posted, messages);
                    if (readiness == NotificationPolicy.PreviewState.READ) return null;
                    if (readiness == NotificationPolicy.PreviewState.NATIVE) {
                        trace("preview: waiting for local save");
                        return builder.build();
                    }
                    // A concurrent read/account change invalidates this preview. Let the native
                    // notification/sync path produce the next state; never post stale plaintext.
                    NativeLine.Chat after = NativeLine.chat(chat);
                    if (!account.equals(NativeLine.account()) || after == null || after.unread == 0) return null;
                    if (state.unread != after.unread || !java.util.Objects.equals(state.readUp, after.readUp)
                            || !NativeLine.previewsAllowed()) return null;
                    NotificationPolicy.Snapshot snapshot = new NotificationPolicy.Snapshot(
                            new NotificationPolicy.ChatKey(account, chat), muted, true, state.unread, false, messages);
                    NotificationPolicy.Decision decision = NotificationPolicy.evaluate(settings, snapshot, false);
                    String name = state.name == null || state.name.isEmpty()
                            ? String.valueOf(original.extras.getCharSequence(Notification.EXTRA_TITLE, "LINE")) : state.name;
                    Map<String, android.graphics.drawable.Icon> icons = NativeLine.senderIcons(
                            Settings.context(), account, !chat.startsWith("u"), original, decision.recentMessages);
                    return ConversationPreview.apply(builder, snapshot.chat, name, state.unread, decision.recentMessages, icons);
                }
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                // Hidden-room suppression and silent-channel routing are already enforced above;
                // a transient preview/DB read failure falls back to the native notification.
                trace("preview: adapter failed, keeping native notification");
            }
        }
        return builder.build();
    }

    private static boolean hasOtherRoom(NotificationManager manager, Notification summary, String account, String chat) {
        if (summary.getGroup() == null) return true;
        for (StatusBarNotification active : manager.getActiveNotifications()) {
            Notification child = active.getNotification();
            if ((child.flags & Notification.FLAG_GROUP_SUMMARY) != 0
                    || !java.util.Objects.equals(summary.getGroup(), child.getGroup())) continue;
            if (!isMessage(child) || !chat.equals(child.extras.getString("line.chat.id"))
                    || !account.equals(child.extras.getString(ACCOUNT))) return true;
        }
        return false;
    }

    private static Notification plainSummary(Notification.Builder builder, CharSequence title, CharSequence text) {
        Notification result = builder.setStyle(null).setCustomContentView(null).setCustomBigContentView(null)
                .setCustomHeadsUpContentView(null).setContentTitle(title).setContentText(text)
                .setSubText(null).setContentInfo(null).setNumber(0).build();
        // recoverBuilder may retain these even after setStyle(null). Clear the built extras too.
        ConversationPreview.clearPresentationExtras(result.extras);
        return result;
    }

    private static Notification.Builder silent(NotificationManager manager, Notification.Builder builder) {
        NotificationChannel channel = new NotificationChannel(CHANNEL,
                Strings.get("line_notify_channel_silent_name", "Silent chat notifications"), NotificationManager.IMPORTANCE_LOW);
        channel.setSound(null, null); channel.enableVibration(false); channel.enableLights(false);
        channel.setDescription(Strings.get("line_notify_channel_silent_desc",
                "Chats delivered quietly via Not Too Much Silent"));
        manager.createNotificationChannel(channel);
        // Android retains any explicit channel override made by the user.
        return builder.setChannelId(CHANNEL).setOnlyAlertOnce(true)
                .setDefaults(0).setSound(null).setVibrate(null);
    }

    private static void applyActions(Notification.Builder builder, Notification original, String account,
                                     String chat, boolean summary) throws ReflectiveOperationException {
        Notification.Action[] nativeActions = original.actions;
        android.os.Parcelable[] saved = original.extras.getParcelableArray(NATIVE_ACTIONS);
        if (saved != null) {
            nativeActions = new Notification.Action[saved.length];
            for (int i = 0; i < saved.length; i++) {
                if (!(saved[i] instanceof Notification.Action)) return;
                nativeActions[i] = (Notification.Action) saved[i];
            }
        }
        Notification.Action[] actions = nativeActions;
        if (Settings.enabled(Settings.NO_REPLY)) {
            builder.setAllowSystemGeneratedContextualActions(false);
            actions = withoutSuggestions(actions);
        }
        Bundle extra = new Bundle();
        if (!summary && Settings.enabled(Settings.READ) && actions != null) {
            int titleId = Settings.context().getResources().getIdentifier("notification_button_mute", "string",
                    Settings.context().getPackageName());
            CharSequence muteTitle = titleId == 0 ? null : Settings.context().getText(titleId);
            int muteIndex = -1;
            for (int i = 0; i < actions.length; i++) {
                Notification.Action action = actions[i];
                if (action != null && action.actionIntent != null && muteTitle != null
                        && android.text.TextUtils.equals(muteTitle, action.title)
                        && (action.getRemoteInputs() == null || action.getRemoteInputs().length == 0)) {
                    if (muteIndex != -1) { muteIndex = -1; break; }
                    muteIndex = i;
                }
            }
            if (muteIndex >= 0) {
                ArrayList<Notification.Action> changed = new ArrayList<>();
                boolean ready = NativeLine.readReady(Settings.context(), chat, original.extras.getString("line.message.id"))
                        && account.equals(NativeLine.account());
                for (int i = 0; i < actions.length; i++) {
                    if (i != muteIndex) changed.add(actions[i]);
                    else if (ready) changed.add(ReadActions.action(Settings.context(), account, chat));
                }
                // Keep the native mute PendingIntent for immediate restoration when switched off.
                extra.putParcelableArray(NATIVE_ACTIONS, nativeActions);
                actions = changed.toArray(new Notification.Action[0]);
                trace(ready ? "read: action ready" : "read: awaiting local storage");
            }
        }
        builder.setActions(actions == null ? new Notification.Action[0] : actions);
        // Null marks restoration without replacing unrelated native extras or this post's account stamp.
        if (!extra.containsKey(NATIVE_ACTIONS)) extra.putParcelableArray(NATIVE_ACTIONS, null);
        builder.addExtras(extra);
    }

    private static Notification.Action[] withoutSuggestions(Notification.Action[] actions) {
        ArrayList<Notification.Action> result = new ArrayList<>();
        if (actions == null) return new Notification.Action[0];
        for (Notification.Action action : actions) {
            if (action == null) continue;
            RemoteInput[] inputs = action.getRemoteInputs();
            if (inputs != null && inputs.length > 0) {
                boolean freeform = false;
                for (RemoteInput input : inputs) freeform |= input.getAllowFreeFormInput();
                if (!freeform) continue;
            }
            Notification.Action.Builder copy = new Notification.Action.Builder(action.getIcon(), action.title, action.actionIntent)
                    .addExtras(new Bundle(action.getExtras())).setAllowGeneratedReplies(false)
                    .setSemanticAction(action.getSemanticAction())
                    .setContextual(action.isContextual());
            if (Build.VERSION.SDK_INT >= 31) copy.setAuthenticationRequired(action.isAuthenticationRequired());
            if (inputs != null) for (RemoteInput input : inputs) {
                RemoteInput.Builder remote = new RemoteInput.Builder(input.getResultKey()).setLabel(input.getLabel())
                        .setAllowFreeFormInput(input.getAllowFreeFormInput()).setChoices(null).addExtras(new Bundle(input.getExtras()));
                for (String mime : input.getAllowedDataTypes()) remote.setAllowDataType(mime, true);
                remote.setEditChoicesBeforeSending(RemoteInput.EDIT_CHOICES_BEFORE_SENDING_AUTO);
                copy.addRemoteInput(remote.build());
            }
            result.add(copy.build());
        }
        return result.toArray(new Notification.Action[0]);
    }

    static void clearSummaries(NotificationManager manager) {
        for (StatusBarNotification n : manager.getActiveNotifications()) {
            if ((n.getNotification().flags & Notification.FLAG_GROUP_SUMMARY) != 0 && isMessage(n.getNotification())) {
                manager.cancel(n.getTag(), n.getId());
            }
        }
    }
}
