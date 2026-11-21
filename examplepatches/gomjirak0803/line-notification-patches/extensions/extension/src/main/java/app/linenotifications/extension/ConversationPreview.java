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
        return apply(builder, chat, room, unread, messages, null);
    }

    static Notification apply(Notification.Builder builder, NotificationPolicy.ChatKey chat, String room,
                              int unread, List<NotificationPolicy.Message> messages, Map<String, Icon> icons) {
        // recoverBuilder can retain the previous custom/Inbox style. Clear only presentation
        // metadata, keeping LINE's routing, account marker, actions and native-action backup.
        Bundle extras = new Bundle(builder.getExtras());
        clearPresentationExtras(extras);
        builder.setExtras(extras).setStyle(null).setCustomContentView(null).setCustomBigContentView(null)
                .setCustomHeadsUpContentView(null).setSubText(null).setContentInfo(null).setNumber(unread);

        String title = room + "  [" + unread + "]";
        boolean group = !chat.chatId.startsWith("u");
        Person self = new Person.Builder().setName("나").setKey("self:" + chat.accountId).build();
        Notification.MessagingStyle style = new Notification.MessagingStyle(self).setGroupConversation(group);
        // Android uses the peer's Person name for a one-to-one heading; a group has a
        // separate conversation heading. Brackets survive platform span sanitization.
        if (group) style.setConversationTitle(title);
        Map<String, Person> people = new HashMap<>();
        for (NotificationPolicy.Message message : messages) {
            Person person = people.get(message.senderId);
            if (person == null) {
                String sender = group ? message.sender : title;
                if (sender == null || sender.isEmpty()) sender = "메시지";
                Person.Builder personBuilder = new Person.Builder().setName(sender)
                        .setKey(chat.accountId + ":" + message.senderId);
                Icon icon = icons != null ? icons.get(message.senderId) : null;
                if (icon != null) personBuilder.setIcon(icon);
                person = personBuilder.build();
                people.put(message.senderId, person);
            }
            style.addMessage(new Notification.MessagingStyle.Message(message.text, message.timestampMillis, person));
        }
        // The platform determines wrapping, sender grouping and visible rows. The source
        // snapshot retains at most 25 messages; the native total count can be larger.
        return builder.setStyle(style).build();
    }

    /** Also used when a settings refresh redacts a previously visible conversation. */
    static void clearPresentationExtras(Bundle extras) {
        for (String key : new String[]{Notification.EXTRA_TEMPLATE, Notification.EXTRA_BIG_TEXT,
                Notification.EXTRA_TITLE_BIG, Notification.EXTRA_SUMMARY_TEXT, Notification.EXTRA_SUB_TEXT,
                Notification.EXTRA_INFO_TEXT, Notification.EXTRA_TEXT_LINES, Notification.EXTRA_MESSAGES,
                Notification.EXTRA_HISTORIC_MESSAGES, Notification.EXTRA_CONVERSATION_TITLE,
                "android.hiddenConversationTitle", "android.messagingStyleUser", "android.selfDisplayName",
                "android.isGroupConversation"}) extras.remove(key);
    }
}
