package dev.utaa.linimal.extension.features.readers;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 既読者の算出に使う LINE のローカルデータ。Android の SQLite に依存する部分をこの seam に切り出し、
 * 判定は {@link ReadersResolver} で local JVM test できるようにします。
 *
 * <p>実装は読み取り専用です。LINE のデータベースへは書き込みません。</p>
 */
interface ReadersDataSource {
    /**
     * 指定メッセージを範囲に含む既読記録を持つメンバーの mid。
     *
     * <p>LINE 自身の既読数と同じく、{@code from_msg_id < messageId <= to_msg_id} の範囲を数えます。</p>
     */
    List<String> readerMids(String chatId, long messageId);

    /** トークに参加しているメンバーの mid。読み取れない場合は null を返します。 */
    List<String> memberMids(String chatId);

    /** mid ごとの表示名と画像 path。記録のない mid は含めません。 */
    Map<String, Profile> profiles(Collection<String> mids);

    /** contacts に保存された表示用の情報。 */
    final class Profile {
        final String name;
        final String picturePath;

        Profile(String name, String picturePath) {
            this.name = name;
            this.picturePath = picturePath;
        }
    }
}
