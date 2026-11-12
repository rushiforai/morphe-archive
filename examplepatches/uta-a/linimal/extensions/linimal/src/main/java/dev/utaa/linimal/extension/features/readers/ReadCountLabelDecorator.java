package dev.utaa.linimal.extension.features.readers;

import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.TextView;

import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import dev.utaa.linimal.extension.i18n.LinimalText;

/**
 * 既読ラベル（{@code chat_ui_row_read_count}）へのアイコン表示とタップ操作。
 *
 * <p>行の View は RecyclerView で再利用されるため、Linimal が加えた変更は label ごとに記録し、
 * 対象外の行として bind されたときに必ず元へ戻します。LINE が元から持つ compound drawable・
 * click listener・padding は変更前の値を保存して復元します。main thread からだけ呼びます。</p>
 */
final class ReadCountLabelDecorator {
    private static final Map<TextView, State> STATES = new WeakHashMap<>();

    private ReadCountLabelDecorator() {
    }

    /** label ごとに Linimal が加えた変更と、変更前の値。 */
    private static final class State {
        final Drawable[] originalDrawables;
        final int originalDrawablePadding;
        final boolean originalClickable;
        final CharSequence originalContentDescription;
        /** LINE が元から listener を付けていた場合は、上書きしないようタップを付けません。 */
        final boolean hadClickListener;
        String key;
        /** bind ごとに増やし、古い読み取り結果で描かないようにします。 */
        int generation;
        boolean showIcons;
        ReaderStripDrawable strip;
        /** いま表示しているアイコンがどのメッセージ・文言のものか。 */
        String stripKey;
        boolean clickApplied;

        State(TextView label) {
            originalDrawables = label.getCompoundDrawablesRelative();
            originalDrawablePadding = label.getCompoundDrawablePadding();
            originalClickable = label.isClickable();
            originalContentDescription = label.getContentDescription();
            hadClickListener = label.hasOnClickListeners();
        }
    }

    static void apply(
            TextView label,
            String chatId,
            long messageId,
            String senderMid,
            boolean showIcons,
            boolean openOnTap) {
        State state = STATES.get(label);
        if (state == null) {
            state = new State(label);
            STATES.put(label, state);
        }
        String key = ReadersRepository.key(chatId, messageId, label.getText());
        state.key = key;
        state.showIcons = showIcons;
        int generation = ++state.generation;

        if (openOnTap && !state.hadClickListener) {
            label.setOnClickListener(view ->
                    ReadersDialog.show(view.getContext(), chatId, messageId, senderMid));
            label.setContentDescription(LinimalText.joinSentences(
                    String.valueOf(label.getText()), LinimalText.t("既読者を表示")));
            state.clickApplied = true;
        } else if (state.clickApplied) {
            restoreClick(label, state);
        }

        if (!showIcons) {
            restoreDrawables(label, state);
            return;
        }
        ReadersRepository repository = ReadersRepository.get(label.getContext());
        ReadersSnapshot cached = repository.cached(key);
        if (cached != null) {
            showStrip(label, state, cached);
            return;
        }
        // 読み取り中は前のメッセージのアイコンを残さないようにします。
        if (state.strip != null && !key.equals(state.stripKey)) {
            restoreDrawables(label, state);
        }
        State requested = state;
        repository.load(key, chatId, messageId, senderMid, snapshot -> {
            if (snapshot == null || STATES.get(label) != requested || requested.generation != generation
                    || !requested.showIcons) {
                return;
            }
            showStrip(label, requested, snapshot);
        });
    }

    /** 対象外の行として bind されたとき、Linimal の変更をすべて戻します。 */
    static void clear(TextView label) {
        State state = STATES.remove(label);
        if (state == null) {
            return;
        }
        restoreDrawables(label, state);
        if (state.clickApplied) {
            restoreClick(label, state);
        }
    }

    private static void showStrip(TextView label, State state, ReadersSnapshot snapshot) {
        List<ReadersSnapshot.Member> readers = snapshot.getReaders();
        if (readers.isEmpty()) {
            restoreDrawables(label, state);
            return;
        }
        float density = label.getResources().getDisplayMetrics().density;
        ReaderStripDrawable strip = new ReaderStripDrawable(readers, density, ringColor(label));
        Drawable[] original = state.originalDrawables;
        label.setCompoundDrawablesRelative(strip, original[1], original[2], original[3]);
        label.setCompoundDrawablePadding(Math.round(3f * density));
        state.strip = strip;
        state.stripKey = state.key;

        ReaderAvatars avatars = ReaderAvatars.get();
        List<ReadersSnapshot.Member> members = strip.members();
        for (int i = 0; i < members.size(); i++) {
            int index = i;
            android.graphics.Bitmap bitmap = avatars.request(members.get(i).getPicturePath(),
                    (path, loaded) -> {
                        if (state.strip == strip) {
                            strip.setBitmap(index, loaded);
                        }
                    });
            if (bitmap != null) {
                strip.setBitmap(index, bitmap);
            }
        }
    }

    private static void restoreDrawables(TextView label, State state) {
        if (state.strip == null) {
            return;
        }
        Drawable[] original = state.originalDrawables;
        label.setCompoundDrawablesRelative(original[0], original[1], original[2], original[3]);
        label.setCompoundDrawablePadding(state.originalDrawablePadding);
        state.strip = null;
        state.stripKey = null;
    }

    private static void restoreClick(TextView label, State state) {
        label.setOnClickListener(null);
        label.setClickable(state.originalClickable);
        label.setContentDescription(state.originalContentDescription);
        state.clickApplied = false;
    }

    private static int ringColor(View view) {
        int mode = view.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES ? 0xFF1B1B1B : 0xFFFFFFFF;
    }
}
