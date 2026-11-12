package dev.utaa.linimal.extension.features.readers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** 1 件のメッセージについて、既読したメンバーと未読のメンバーをまとめた結果です。 */
public final class ReadersSnapshot {
    /** 一覧の 1 行に表示するメンバー。 */
    public static final class Member {
        private final String mid;
        private final String displayName;
        private final String picturePath;

        public Member(String mid, String displayName, String picturePath) {
            this.mid = mid;
            this.displayName = displayName;
            this.picturePath = picturePath;
        }

        public String getMid() {
            return mid;
        }

        /** 表示名。contacts に記録がなければ null です。 */
        public String getDisplayName() {
            return displayName;
        }

        /** {@code /0h...} の形の profile 画像 path。設定されていなければ null です。 */
        public String getPicturePath() {
            return picturePath;
        }
    }

    private final String chatId;
    private final long messageId;
    private final List<Member> readers;
    private final List<Member> unreadMembers;
    private final boolean membersKnown;

    public ReadersSnapshot(
            String chatId,
            long messageId,
            List<Member> readers,
            List<Member> unreadMembers,
            boolean membersKnown) {
        this.chatId = chatId;
        this.messageId = messageId;
        this.readers = Collections.unmodifiableList(new ArrayList<>(readers));
        this.unreadMembers = Collections.unmodifiableList(new ArrayList<>(unreadMembers));
        this.membersKnown = membersKnown;
    }

    public String getChatId() {
        return chatId;
    }

    public long getMessageId() {
        return messageId;
    }

    /** 既読したメンバー。表示名の順に並びます。 */
    public List<Member> getReaders() {
        return readers;
    }

    /** まだ読んでいないメンバー。メンバー一覧を読めなかった場合は空です。 */
    public List<Member> getUnreadMembers() {
        return unreadMembers;
    }

    /** トークのメンバー一覧を読み取れたかどうか。false のときは未読の一覧を表示しません。 */
    public boolean isMembersKnown() {
        return membersKnown;
    }
}
