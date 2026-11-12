package dev.utaa.linimal.extension.features.readers;

import java.text.Collator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * LINE のローカル記録から、1 件のメッセージの既読者と未読者を組み立てます。Android API に依存しません。
 *
 * <ul>
 *   <li>既読者は {@code read_message_range} の範囲がメッセージを含むメンバーです。退会したメンバーも
 *       既読の記録が残っていれば既読者として数えます。LINE の「既読 N」と同じ集計です。</li>
 *   <li>未読者は現在のメンバーから既読者を除いた残りです。</li>
 *   <li>送信者自身と、この端末のアカウントはどちらの一覧にも含めません。</li>
 * </ul>
 */
final class ReadersResolver {
    private ReadersResolver() {
    }

    static ReadersSnapshot resolve(
            ReadersDataSource source,
            String chatId,
            long messageId,
            Collection<String> excludedMids) {
        Set<String> excluded = new LinkedHashSet<>();
        if (excludedMids != null) {
            for (String mid : excludedMids) {
                if (ReadersChat.isMid(mid)) {
                    excluded.add(mid);
                }
            }
        }

        Set<String> readers = new LinkedHashSet<>();
        List<String> readerMids = source.readerMids(chatId, messageId);
        if (readerMids != null) {
            for (String mid : readerMids) {
                if (ReadersChat.isMid(mid) && !excluded.contains(mid)) {
                    readers.add(mid);
                }
            }
        }

        List<String> memberMids = source.memberMids(chatId);
        boolean membersKnown = memberMids != null;
        Set<String> unread = new LinkedHashSet<>();
        if (memberMids != null) {
            for (String mid : memberMids) {
                if (ReadersChat.isMid(mid) && !excluded.contains(mid) && !readers.contains(mid)) {
                    unread.add(mid);
                }
            }
        }

        Set<String> all = new LinkedHashSet<>(readers);
        all.addAll(unread);
        Map<String, ReadersDataSource.Profile> profiles = all.isEmpty() ? null : source.profiles(all);

        return new ReadersSnapshot(
                chatId,
                messageId,
                members(readers, profiles),
                members(unread, profiles),
                membersKnown);
    }

    private static List<ReadersSnapshot.Member> members(
            Set<String> mids, Map<String, ReadersDataSource.Profile> profiles) {
        List<ReadersSnapshot.Member> members = new ArrayList<>();
        for (String mid : mids) {
            ReadersDataSource.Profile profile = profiles == null ? null : profiles.get(mid);
            String name = profile == null ? null : emptyToNull(profile.name);
            String picture = profile == null ? null : emptyToNull(profile.picturePath);
            members.add(new ReadersSnapshot.Member(mid, name, picture));
        }
        members.sort(BY_NAME);
        return members;
    }

    private static String emptyToNull(String value) {
        return value == null || value.trim().isEmpty() ? null : value;
    }

    /** 名前の分かるメンバーを先に、表示名の辞書順で並べます。同名は mid で安定させます。 */
    static final Comparator<ReadersSnapshot.Member> BY_NAME = new Comparator<ReadersSnapshot.Member>() {
        private final Collator collator = Collator.getInstance(Locale.JAPANESE);

        @Override
        public int compare(ReadersSnapshot.Member left, ReadersSnapshot.Member right) {
            String leftName = left.getDisplayName();
            String rightName = right.getDisplayName();
            if (leftName == null || rightName == null) {
                if (leftName != null) {
                    return -1;
                }
                if (rightName != null) {
                    return 1;
                }
            } else {
                int byName = collator.compare(leftName, rightName);
                if (byName != 0) {
                    return byName;
                }
            }
            return left.getMid().compareTo(right.getMid());
        }
    };
}
