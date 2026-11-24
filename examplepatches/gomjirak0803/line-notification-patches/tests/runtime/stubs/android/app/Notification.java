package android.app;

import android.content.Context;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.widget.RemoteViews;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Notification implements Parcelable {
    public static final int FLAG_ONGOING_EVENT = 0x00000002;
    public static final int FLAG_ONLY_ALERT_ONCE = 0x00000008;
    public static final int FLAG_FOREGROUND_SERVICE = 0x00000040;
    public static final int FLAG_GROUP_SUMMARY = 0x00000200;

    public static final int VISIBILITY_PUBLIC = 1;
    public static final int VISIBILITY_PRIVATE = 0;
    public static final int VISIBILITY_SECRET = -1;

    public static final String EXTRA_TITLE = "android.title";
    public static final String EXTRA_TEXT = "android.text";
    public static final String EXTRA_TEMPLATE = "android.template";
    public static final String EXTRA_BIG_TEXT = "android.bigText";
    public static final String EXTRA_TITLE_BIG = "android.title.big";
    public static final String EXTRA_SUMMARY_TEXT = "android.summaryText";
    public static final String EXTRA_SUB_TEXT = "android.subText";
    public static final String EXTRA_INFO_TEXT = "android.infoText";
    public static final String EXTRA_TEXT_LINES = "android.textLines";
    public static final String EXTRA_MESSAGES = "android.messages";
    public static final String EXTRA_HISTORIC_MESSAGES = "android.messages.historic";
    public static final String EXTRA_CONVERSATION_TITLE = "android.conversationTitle";

    public Bundle extras = new Bundle();
    public int flags;
    public int visibility = VISIBILITY_PRIVATE;
    public Action[] actions;
    public Notification publicVersion;
    public PendingIntent contentIntent;
    public CharSequence tickerText;

    private String channelId = "line_default";
    private String groupKey;
    private String shortcutId;
    private Icon largeIcon;
    private Style style;

    public Notification() {}

    public String getChannelId() { return channelId; }
    public String getGroup() { return groupKey; }
    public String getShortcutId() { return shortcutId; }
    public Icon getLargeIcon() { return largeIcon; }
    public Style getStyleForTest() { return style; }

    public void setChannelIdForTest(String channelId) { this.channelId = channelId; }
    public void setGroupForTest(String groupKey) { this.groupKey = groupKey; }
    public void setShortcutIdForTest(String shortcutId) { this.shortcutId = shortcutId; }
    public void setLargeIconForTest(Icon largeIcon) { this.largeIcon = largeIcon; }

    @Override public int describeContents() { return 0; }
    @Override public void writeToParcel(Parcel dest, int flags) {}

    public static class Action implements Parcelable {
        public static final int SEMANTIC_ACTION_MUTE = 9;
        public static final int SEMANTIC_ACTION_MARK_AS_READ = 2;

        public final Icon icon;
        public final CharSequence title;
        public final PendingIntent actionIntent;
        private final Bundle extras;
        private final RemoteInput[] remoteInputs;
        private final int semanticAction;
        private final boolean contextual;
        private final boolean authenticationRequired;

        private Action(Builder b) {
            this.icon = b.icon;
            this.title = b.title;
            this.actionIntent = b.intent;
            this.extras = new Bundle(b.extras);
            this.remoteInputs = b.inputs.isEmpty() ? null : b.inputs.toArray(new RemoteInput[0]);
            this.semanticAction = b.semanticAction;
            this.contextual = b.contextual;
            this.authenticationRequired = b.authenticationRequired;
        }

        public Icon getIcon() { return icon; }
        public Bundle getExtras() { return extras; }
        public RemoteInput[] getRemoteInputs() { return remoteInputs; }
        public int getSemanticAction() { return semanticAction; }
        public boolean isContextual() { return contextual; }
        public boolean isAuthenticationRequired() { return authenticationRequired; }

        @Override public int describeContents() { return 0; }
        @Override public void writeToParcel(Parcel dest, int flags) {}

        public static final class Builder {
            private final Icon icon;
            private final CharSequence title;
            private final PendingIntent intent;
            private final Bundle extras = new Bundle();
            private final List<RemoteInput> inputs = new ArrayList<RemoteInput>();
            private int semanticAction;
            private boolean contextual;
            private boolean authenticationRequired;

            public Builder(Icon icon, CharSequence title, PendingIntent intent) {
                this.icon = icon;
                this.title = title;
                this.intent = intent;
            }

            public Builder addExtras(Bundle extras) { this.extras.putAll(extras); return this; }
            public Builder setAllowGeneratedReplies(boolean allow) { return this; }
            public Builder setSemanticAction(int semanticAction) { this.semanticAction = semanticAction; return this; }
            public Builder setContextual(boolean contextual) { this.contextual = contextual; return this; }
            public Builder setAuthenticationRequired(boolean auth) { this.authenticationRequired = auth; return this; }
            public Builder addRemoteInput(RemoteInput input) {
                if (input != null) inputs.add(input);
                return this;
            }
            public Action build() { return new Action(this); }
        }
    }

    public abstract static class Style {}

    public static class MessagingStyle extends Style {
        public static final class Message {
            private final CharSequence text;
            private final long timestamp;
            private final Person senderPerson;
            private String dataMimeType;
            private Uri dataUri;

            public Message(CharSequence text, long timestamp, Person sender) {
                this.text = text;
                this.timestamp = timestamp;
                this.senderPerson = sender;
            }

            public CharSequence getText() { return text; }
            public long getTimestamp() { return timestamp; }
            public Person getSenderPerson() { return senderPerson; }
            public String getDataMimeType() { return dataMimeType; }
            public Uri getDataUri() { return dataUri; }

            public Message setData(String dataMimeType, Uri dataUri) {
                this.dataMimeType = dataMimeType;
                this.dataUri = dataUri;
                return this;
            }
        }

        private final Person user;
        private boolean groupConversation;
        private CharSequence conversationTitle;
        private final List<Message> messages = new ArrayList<Message>();

        public MessagingStyle(Person user) { this.user = user; }
        public Person getUser() { return user; }
        public boolean isGroupConversation() { return groupConversation; }
        public CharSequence getConversationTitle() { return conversationTitle; }
        public List<Message> getMessages() { return messages; }

        public MessagingStyle setGroupConversation(boolean isGroup) {
            this.groupConversation = isGroup;
            return this;
        }

        public MessagingStyle setConversationTitle(CharSequence title) {
            this.conversationTitle = title;
            return this;
        }

        public MessagingStyle addMessage(Message message) {
            if (message != null) messages.add(message);
            return this;
        }
    }

    public static class Builder {
        private Bundle extras = new Bundle();
        private int flags;
        private int visibility = VISIBILITY_PRIVATE;
        private Action[] actions;
        private Notification publicVersion;
        private PendingIntent contentIntent;
        private CharSequence ticker;
        private String channelId = "line_default";
        private String groupKey;
        private String shortcutId;
        private Icon largeIcon;
        private Style style;

        public Builder(Context context, String channelId) {
            this.channelId = channelId;
        }

        public static Builder recoverBuilder(Context context, Notification n) {
            Builder b = new Builder(context, n.getChannelId());
            b.extras = new Bundle(n.extras);
            b.flags = n.flags;
            b.visibility = n.visibility;
            b.actions = n.actions;
            b.publicVersion = n.publicVersion;
            b.contentIntent = n.contentIntent;
            b.ticker = n.tickerText;
            b.groupKey = n.getGroup();
            b.shortcutId = n.getShortcutId();
            b.largeIcon = n.getLargeIcon();
            b.style = n.getStyleForTest();
            return b;
        }

        public Builder setExtras(Bundle extras) {
            this.extras = extras == null ? new Bundle() : new Bundle(extras);
            return this;
        }

        public Builder addExtras(Bundle extras) {
            if (extras != null) this.extras.putAll(extras);
            return this;
        }

        public Bundle getExtras() { return extras; }
        public Builder setStyle(Style style) { this.style = style; return this; }
        public Builder setCustomContentView(RemoteViews views) { return this; }
        public Builder setCustomBigContentView(RemoteViews views) { return this; }
        public Builder setCustomHeadsUpContentView(RemoteViews views) { return this; }

        public Builder setContentTitle(CharSequence title) {
            extras.putCharSequence(EXTRA_TITLE, title);
            return this;
        }

        public Builder setContentText(CharSequence text) {
            extras.putCharSequence(EXTRA_TEXT, text);
            return this;
        }

        public Builder setTicker(CharSequence tickerText) {
            this.ticker = tickerText;
            return this;
        }

        public Builder setSubText(CharSequence subText) {
            if (subText == null) extras.remove(EXTRA_SUB_TEXT);
            else extras.putCharSequence(EXTRA_SUB_TEXT, subText);
            return this;
        }

        public Builder setContentInfo(CharSequence info) {
            if (info == null) extras.remove(EXTRA_INFO_TEXT);
            else extras.putCharSequence(EXTRA_INFO_TEXT, info);
            return this;
        }

        public Builder setNumber(int number) { return this; }

        public Builder setOnlyAlertOnce(boolean onlyAlertOnce) {
            if (onlyAlertOnce) flags |= FLAG_ONLY_ALERT_ONCE;
            else flags &= ~FLAG_ONLY_ALERT_ONCE;
            return this;
        }

        public Builder setShortcutId(String shortcutId) { this.shortcutId = shortcutId; return this; }
        public Builder setContentIntent(PendingIntent intent) { this.contentIntent = intent; return this; }
        public Builder setActions(Action... actions) { this.actions = actions; return this; }
        public Builder setChannelId(String channelId) { this.channelId = channelId; return this; }
        public Builder setDefaults(int defaults) { return this; }
        public Builder setSound(Uri sound) { return this; }
        public Builder setVibrate(long[] pattern) { return this; }
        public Builder setVisibility(int visibility) { this.visibility = visibility; return this; }
        public Builder setAllowSystemGeneratedContextualActions(boolean allowed) { return this; }

        public Notification build() {
            Notification n = new Notification();
            n.extras = new Bundle(extras);
            n.flags = flags;
            n.visibility = visibility;
            n.actions = actions;
            n.publicVersion = publicVersion;
            n.contentIntent = contentIntent;
            n.tickerText = ticker;
            n.channelId = channelId;
            n.groupKey = groupKey;
            n.shortcutId = shortcutId;
            n.largeIcon = largeIcon;
            n.style = style;
            if (style instanceof MessagingStyle) {
                MessagingStyle ms = (MessagingStyle) style;
                n.extras.putString(EXTRA_TEMPLATE, "android.app.Notification$MessagingStyle");
                n.extras.putBoolean("android.isGroupConversation", ms.isGroupConversation());
                if (ms.getConversationTitle() != null) {
                    n.extras.putCharSequence(EXTRA_CONVERSATION_TITLE, ms.getConversationTitle());
                }
                List<MessagingStyle.Message> msgs = ms.getMessages();
                Parcelable[] packed = new Parcelable[msgs.size()];
                for (int i = 0; i < msgs.size(); i++) {
                    MessagingStyle.Message m = msgs.get(i);
                    Bundle item = new Bundle();
                    item.putCharSequence("text", m.getText());
                    item.putLong("time", m.getTimestamp());
                    if (m.getSenderPerson() != null) item.putParcelable("sender_person", m.getSenderPerson());
                    packed[i] = item;
                }
                n.extras.putParcelableArray(EXTRA_MESSAGES, packed);
            }
            return n;
        }
    }
}
