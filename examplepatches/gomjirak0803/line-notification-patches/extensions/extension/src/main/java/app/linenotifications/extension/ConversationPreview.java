package app.linenotifications.extension;

import android.app.Notification;
import android.app.Person;
import android.graphics.drawable.Icon;
import android.os.Bundle;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import app.linenotifications.extension.core.NotificationPolicy;

/** Uses the public Android conversation template; no foreign app code or resources are embedded. */
final class ConversationPreview {
    private ConversationPreview() {}

    static Notification apply(Notification.Builder builder, NotificationPolicy.ChatKey chat, String room,
                              int unread, List<NotificationPolicy.Message> messages) {
        return apply(builder, chat, room, unread, messages, null, null);
    }

    static Notification apply(Notification.Builder builder, NotificationPolicy.ChatKey chat, String room,
                              int unread, List<NotificationPolicy.Message> messages, Map<String, Icon> icons) {
        return apply(builder, chat, room, unread, messages, icons, null);
    }

    static Notification apply(Notification.Builder builder, NotificationPolicy.ChatKey chat, String room,
                              int unread, List<NotificationPolicy.Message> messages, Map<String, Icon> icons,
                              Map<String, NativeLine.MediaPreview> mediaPreviews) {
        // Android's recoverBuilder retains mN.extras and merges it over user extras at build().
        // Materialize and strip presentation keys on an independent Notification copy before
        // re-recovering so stale BigText/Picture/EXTRA_HISTORIC_MESSAGES cannot survive.
        Notification base = builder.build();
        Notification cleanBase = copyWithoutPresentationExtras(base);
        Notification.Builder cleanBuilder = Notification.Builder.recoverBuilder(Settings.context(), cleanBase)
                .setStyle(null).setCustomContentView(null).setCustomBigContentView(null)
                .setCustomHeadsUpContentView(null).setSubText(null).setContentInfo(null).setNumber(unread);

        String title = room + "  [" + unread + "]";
        boolean group = !chat.chatId.startsWith("u");
        Person self = new Person.Builder().setName(Strings.get("line_notify_self_name", "You"))
                .setKey("self:" + chat.accountId).build();
        Notification.MessagingStyle style = new Notification.MessagingStyle(self).setGroupConversation(group);
        // Android uses the peer's Person name for a one-to-one heading; a group has a
        // separate conversation heading. Brackets survive platform span sanitization.
        if (group) style.setConversationTitle(title);
        Map<String, Person> people = new HashMap<>();
        for (NotificationPolicy.Message message : messages) {
            Person person = people.get(message.senderId);
            if (person == null) {
                String sender = group ? message.sender : title;
                if (sender == null || sender.isEmpty()) sender = Strings.get("line_notify_fallback_sender", "Message");
                Person.Builder personBuilder = new Person.Builder().setName(sender)
                        .setKey(chat.accountId + ":" + message.senderId);
                Icon icon = icons != null ? icons.get(message.senderId) : null;
                if (icon != null) personBuilder.setIcon(icon);
                person = personBuilder.build();
                people.put(message.senderId, person);
            }
            Notification.MessagingStyle.Message item = new Notification.MessagingStyle.Message(
                    message.text, message.timestampMillis, person);
            NativeLine.MediaPreview media = mediaPreviews != null ? mediaPreviews.get(message.id) : null;
            if (media != null && media.uri != null && media.mimeType != null) {
                item.setData(media.mimeType, media.uri);
            }
            style.addMessage(item);
        }
        if (!messages.isEmpty()) {
            NotificationPolicy.Message latest = messages.get(messages.size() - 1);
            String sender = group ? latest.sender : title;
            if (sender == null || sender.isEmpty()) sender = Strings.get("line_notify_fallback_sender", "Message");
            String ticker = group ? (sender + ": " + latest.text) : latest.text;
            cleanBuilder.setContentTitle(title).setContentText(latest.text).setTicker(ticker);
        } else {
            cleanBuilder.setContentTitle(title);
        }
        // The platform determines wrapping, sender grouping and visible rows. The source
        // snapshot retains at most 25 messages; the native total count can be larger.
        Notification built = cleanBuilder.setStyle(style).build();
        if (built.extras != null) {
            for (String key : new String[]{
                    Notification.EXTRA_HISTORIC_MESSAGES, Notification.EXTRA_BIG_TEXT,
                    Notification.EXTRA_TITLE_BIG, Notification.EXTRA_SUMMARY_TEXT,
                    Notification.EXTRA_SUB_TEXT, Notification.EXTRA_INFO_TEXT,
                    Notification.EXTRA_TEXT_LINES, "android.picture", "android.pictureIcon",
                    "android.pictureContentDescription", "android.showBigPictureWhenCollapsed"
            }) {
                built.extras.remove(key);
            }
        }
        return built;
    }

    static Notification copyWithoutPresentationExtras(Notification source) {
        Notification copy = source.clone();
        copy.extras = source.extras == null ? new Bundle() : new Bundle(source.extras);
        clearPresentationExtras(copy.extras);
        copy.extras.remove(Notification.EXTRA_TITLE);
        copy.extras.remove(Notification.EXTRA_TEXT);
        return copy;
    }

    static void clearStickerExtras(Bundle extras) {
        if (extras == null) return;
        extras.remove("line.sticker.id");
        extras.remove("line.sticker.url");
    }

    static void clearCarExtensions(Bundle extras) {
        if (extras == null) return;
        extras.remove("android.car.EXTENSIONS");
    }

    static void clearRedactedMediaExtras(Bundle extras) {
        if (extras == null) return;
        clearPresentationExtras(extras);
        clearStickerExtras(extras);
        clearCarExtensions(extras);
        extras.remove("android.largeIcon");
        extras.remove("android.largeIcon.big");
        extras.remove(Notification.EXTRA_REMOTE_INPUT_HISTORY);
        extras.remove("android.remoteInputHistoryItems");
        extras.remove("android.remoteInputDraft");
        extras.remove("android.remoteInputSpinner");
        Bundle wearable = extras.getBundle("android.wearable.EXTENSIONS");
        if (wearable != null) {
            Bundle cleanWearable = new Bundle(wearable);
            cleanWearable.remove("background");
            cleanWearable.remove("pages");
            cleanWearable.remove("actions");
            extras.putBundle("android.wearable.EXTENSIONS", cleanWearable);
        }
    }

    /** Also used when a settings refresh redacts a previously visible conversation. */
    static void clearPresentationExtras(Bundle extras) {
        if (extras == null) return;
        for (String key : new String[]{Notification.EXTRA_TEMPLATE, Notification.EXTRA_BIG_TEXT,
                Notification.EXTRA_TITLE_BIG, Notification.EXTRA_SUMMARY_TEXT, Notification.EXTRA_SUB_TEXT,
                Notification.EXTRA_INFO_TEXT, Notification.EXTRA_TEXT_LINES, Notification.EXTRA_MESSAGES,
                Notification.EXTRA_HISTORIC_MESSAGES, Notification.EXTRA_CONVERSATION_TITLE,
                "android.picture", "android.pictureIcon", "android.pictureContentDescription",
                "android.showBigPictureWhenCollapsed",
                "android.hiddenConversationTitle", "android.messagingStyleUser", "android.selfDisplayName",
                "android.isGroupConversation"}) extras.remove(key);
    }
}
