package dev.utaa.linimal.extension.features.readers;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.i18n.LinimalText;

/**
 * 他人のメッセージの時刻（{@code chat_ui_row_timestamp}）の上に、既読数と既読者のアイコンを描きます。
 *
 * <p>行の構造は変えず、時刻の TextView の上側 compound drawable だけを使います。横並びの行では時刻の上へ、
 * スタンプなど縦並びの行では吹き出しの下・時刻の上へ、アイコンと既読数の 1 行が加わります。RecyclerView で再利用されるため、
 * 変更前の値を TextView ごとに覚え、対象外の行として bind されたときに必ず元へ戻します。main thread からだけ呼びます。</p>
 *
 * <p>LINE は他人のメッセージの行を既読の更新で bind し直さないため、{@link #REFRESH_MILLIS} ごとに
 * 読み直しを予約し、表示を差し替えます。予約は View 自身に載せるため、画面外の View では次に画面へ
 * 戻るまで実行されず、View と一緒に破棄されます。対象外の行として bind されたとき・設定が OFF になったとき・
 * 別のメッセージで bind されたときに取り消します。</p>
 */
final class ReceivedTimestampDecorator {
    static final long REFRESH_MILLIS = 30_000L;
    private static final String COUNT_FORMAT_RESOURCE = "chathistory_message_read_count_format";
    private static final Map<TextView, State> STATES = new WeakHashMap<>();

    private ReceivedTimestampDecorator() {
    }

    private static final class State {
        final Drawable[] originalDrawables;
        final int originalDrawablePadding;
        final boolean originalClickable;
        final CharSequence originalContentDescription;
        /** LINE が元から listener を付けていた場合は、上書きしないようタップを付けません。 */
        final boolean hadClickListener;
        /** Linimal が gravity を変える前の値。LINE が後から変えた場合は、その値へ更新します。 */
        int originalGravity;
        /** Linimal が設定した gravity。現在値と一致するときだけ元へ戻します。未設定は -1 です。 */
        int appliedGravity = -1;
        /**
         * 時刻が吹き出しの右端の下に右寄せで置かれる行（スタンプなど、ConstraintLayout 直下）かどうか。
         * 横並びの行の時刻は縦の LinearLayout の中で吹き出し側（左）に寄ります。それ以外の構造では
         * gravity を変えず、左端にそろえます。
         */
        final boolean alignEnd;
        String key;
        /** bind ごとに増やし、古い読み取り結果で描かないようにします。 */
        int generation;
        boolean showCount;
        boolean showIcons;
        boolean openOnTap;
        String senderMid;
        String chatId;
        long messageId;
        ReceivedReadersDrawable drawable;
        Runnable refresh;
        boolean clickApplied;

        State(TextView timestamp) {
            originalDrawables = timestamp.getCompoundDrawablesRelative();
            originalDrawablePadding = timestamp.getCompoundDrawablePadding();
            originalClickable = timestamp.isClickable();
            originalContentDescription = timestamp.getContentDescription();
            hadClickListener = timestamp.hasOnClickListeners();
            originalGravity = timestamp.getGravity();
            alignEnd = isConstraintParent(timestamp);
        }
    }

    static void apply(
            TextView timestamp,
            String chatId,
            long messageId,
            String senderMid,
            boolean showCount,
            boolean showIcons,
            boolean openOnTap) {
        apply(timestamp, chatId, messageId, senderMid, showCount, showIcons, openOnTap, false);
    }

    private static void apply(
            TextView timestamp,
            String chatId,
            long messageId,
            String senderMid,
            boolean showCount,
            boolean showIcons,
            boolean openOnTap,
            boolean forceReload) {
        State state = STATES.get(timestamp);
        if (state == null) {
            state = new State(timestamp);
            STATES.put(timestamp, state);
        }
        String key = chatId + '\n' + messageId + "\n#received";
        boolean sameMessage = key.equals(state.key);
        state.key = key;
        state.senderMid = senderMid;
        state.chatId = chatId;
        state.messageId = messageId;
        state.showCount = showCount;
        state.showIcons = showIcons;
        state.openOnTap = openOnTap;
        int generation = ++state.generation;
        scheduleRefresh(timestamp, state);

        ReadersRepository repository = ReadersRepository.get(timestamp.getContext());
        ReadersSnapshot cached = repository.cached(key);
        if (cached != null) {
            render(timestamp, state, cached);
        } else if (!sameMessage) {
            // 前のメッセージの表示を残さないよう、読み取りが終わるまで元に戻します。
            restore(timestamp, state);
        }
        if (forceReload || cached == null || repository.isStale(key, REFRESH_MILLIS)) {
            State requested = state;
            WeakReference<TextView> target = new WeakReference<>(timestamp);
            repository.load(key, chatId, messageId, senderMid, snapshot -> {
                TextView view = target.get();
                if (view == null || snapshot == null || STATES.get(view) != requested
                        || requested.generation != generation) {
                    return;
                }
                try {
                    render(view, requested, snapshot);
                } catch (Throwable throwable) {
                    try {
                        clear(view);
                    } catch (Throwable ignored) {
                        // LINE の表示は続けます。
                    }
                }
            });
        }
    }

    static void clear(TextView timestamp) {
        State state = STATES.remove(timestamp);
        if (state != null) {
            cancelRefresh(timestamp, state);
            restore(timestamp, state);
        }
    }

    /**
     * 読み直しを予約します。Runnable は State に保持されるため、View を弱参照にして
     * {@link #STATES} の弱参照キーを強参照で固定しないようにします。
     */
    private static void scheduleRefresh(TextView timestamp, State state) {
        cancelRefresh(timestamp, state);
        WeakReference<TextView> target = new WeakReference<>(timestamp);
        Runnable refresh = new Runnable() {
            @Override
            public void run() {
                TextView view = target.get();
                if (view == null || STATES.get(view) != state || state.refresh != this) {
                    return;
                }
                if (!view.isAttachedToWindow()) {
                    // 画面外では読まず、View の run queue で次に画面へ戻るまで待ちます。
                    view.postDelayed(this, REFRESH_MILLIS);
                    return;
                }
                refresh(view, state);
            }
        };
        state.refresh = refresh;
        timestamp.postDelayed(refresh, REFRESH_MILLIS);
    }

    private static void cancelRefresh(TextView timestamp, State state) {
        if (state.refresh != null) {
            timestamp.removeCallbacks(state.refresh);
            state.refresh = null;
        }
    }

    /** 予約した読み直し。設定を読み直し、OFF なら元に戻します。 */
    private static void refresh(TextView timestamp, State state) {
        try {
            LinimalConfig config = LinimalConfig.get();
            boolean count = config.isReadReceiptReadersOthersCountEnabled();
            boolean icons = config.isReadReceiptReadersOthersIconsEnabled();
            if (!ReadReceiptReadersHooks.shouldDecorateReceived(true, count, icons, state.chatId, state.messageId)) {
                clear(timestamp);
                return;
            }
            apply(timestamp, state.chatId, state.messageId, state.senderMid, count, icons,
                    config.isReadReceiptReadersTapEnabled(), true);
        } catch (Throwable throwable) {
            try {
                clear(timestamp);
            } catch (Throwable ignored) {
                // LINE の表示は続けます。
            }
        }
    }

    /** 描く内容は、その時点の State（最後の bind の設定）から決めます。 */
    private static void render(TextView timestamp, State state, ReadersSnapshot snapshot) {
        boolean showCount = state.showCount;
        boolean showIcons = state.showIcons;
        boolean openOnTap = state.openOnTap && !state.hadClickListener;
        List<ReadersSnapshot.Member> readers = snapshot.getReaders();
        if (readers.isEmpty()) {
            // LINE と同じく、誰も読んでいなければ何も出しません。
            restore(timestamp, state);
            return;
        }
        float density = timestamp.getResources().getDisplayMetrics().density;
        String countText = showCount ? countText(timestamp.getContext(), readers.size()) : null;
        ReceivedReadersDrawable drawable = new ReceivedReadersDrawable(
                timestamp,
                showIcons ? readers : Collections.<ReadersSnapshot.Member>emptyList(),
                countText,
                density,
                ringColor(timestamp),
                state.alignEnd);
        if (drawable.isEmpty()) {
            restore(timestamp, state);
            return;
        }
        Drawable[] original = state.originalDrawables;
        // View を変える前に記録し、途中で失敗しても restore で戻せるようにします。
        state.drawable = drawable;
        timestamp.setCompoundDrawablesRelative(original[0], drawable, original[2], original[3]);
        // 段の方が時刻より幅が広いと TextView が広がります。右寄せの行では文字も右へ寄せ、
        // 時刻が吹き出しの右端から離れないようにします。
        if (state.alignEnd) {
            int current = timestamp.getGravity();
            if (current != state.appliedGravity) {
                // LINE が gravity を変えていれば、それを新しい復元先にします。
                state.originalGravity = current;
            }
            // 吹き出しの右端（物理的な右）に合わせるため、RTL でも RIGHT を使います。
            int gravity = (state.originalGravity & ~android.view.Gravity.RELATIVE_HORIZONTAL_GRAVITY_MASK)
                    | android.view.Gravity.RIGHT;
            timestamp.setGravity(gravity);
            state.appliedGravity = timestamp.getGravity();
        }
        // padding は左右の drawable にも効くため、元から左右にある場合は元の値を保ちます。
        if (original[0] == null && original[2] == null) {
            timestamp.setCompoundDrawablePadding(Math.round(2f * density));
        }

        List<ReadersSnapshot.Member> members = drawable.members();
        ReaderAvatars avatars = ReaderAvatars.get();
        for (int i = 0; i < members.size(); i++) {
            int index = i;
            Bitmap bitmap = avatars.request(members.get(i).getPicturePath(), (path, loaded) -> {
                if (state.drawable == drawable) {
                    drawable.setBitmap(index, loaded);
                }
            });
            if (bitmap != null) {
                drawable.setBitmap(index, bitmap);
            }
        }

        String chatId = snapshot.getChatId();
        long messageId = snapshot.getMessageId();
        String senderMid = state.senderMid;
        if (openOnTap) {
            timestamp.setOnClickListener(view ->
                    ReadersDialog.show(view.getContext(), chatId, messageId, senderMid));
            timestamp.setContentDescription(LinimalText.joinSentences(
                    String.valueOf(timestamp.getText()),
                    countText != null ? countText : LinimalText.t("既読者を表示")));
            state.clickApplied = true;
        } else if (state.clickApplied) {
            restoreClick(timestamp, state);
        }
    }

    /** LINE 自身の「既読 %s」を使い、LINE の表示言語と同じ文言にします。見つからなければ Linimal の訳を使います。 */
    static String countText(Context context, int count) {
        try {
            int id = context.getResources().getIdentifier(COUNT_FORMAT_RESOURCE, "string", context.getPackageName());
            if (id != 0) {
                return context.getString(id, String.valueOf(count));
            }
        } catch (RuntimeException ignored) {
            // 下の訳を使います。
        }
        return LinimalText.format("既読 %s", String.valueOf(count));
    }

    private static void restore(TextView timestamp, State state) {
        if (state.drawable != null) {
            Drawable[] original = state.originalDrawables;
            timestamp.setCompoundDrawablesRelative(original[0], original[1], original[2], original[3]);
            timestamp.setCompoundDrawablePadding(state.originalDrawablePadding);
            if (state.appliedGravity != -1 && timestamp.getGravity() == state.appliedGravity) {
                timestamp.setGravity(state.originalGravity);
            }
            state.appliedGravity = -1;
            state.drawable = null;
        }
        if (state.clickApplied) {
            restoreClick(timestamp, state);
        }
    }

    /** androidx の ConstraintLayout は LINE 側の class のため、名前で判定します。 */
    private static boolean isConstraintParent(TextView timestamp) {
        Object parent = timestamp.getParent();
        return parent != null && parent.getClass().getName().endsWith(".ConstraintLayout");
    }

    private static void restoreClick(TextView timestamp, State state) {
        timestamp.setOnClickListener(null);
        timestamp.setClickable(state.originalClickable);
        timestamp.setContentDescription(state.originalContentDescription);
        state.clickApplied = false;
    }

    private static int ringColor(TextView view) {
        int mode = view.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES ? 0xFF1B1B1B : 0xFFFFFFFF;
    }
}
