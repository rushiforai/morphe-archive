package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmoteGrid;
import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmotePicker;
import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmoteSupport;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * The picker for third-party emotes: what the message box holds so far, a search field, the tabs and
 * a grid of images, in the same sheet as the player menu. A tap adds an emote's name to the message
 * box and the sheet stays open for the next one. Nothing is ever sent from here.
 */
public final class EmoteSheet {
    private static final int HINT_MS = 2600;

    private final Context context;
    private final Ui ui;
    private final EditText target;
    private final String channelId;
    private final TextView typed, status;
    private final EditText search;
    private final EmoteGrid grid;
    private final Runnable restoreHint = this::showHint;
    private JellyTabs tabs;
    private int tab;
    /** Still on the tab the sheet chose itself, so it may move on when the channel's emotes arrive. */
    private boolean untouched = true;

    private final TextWatcher mirror = new TextWatcher() {
        @Override
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }

        @Override
        public void afterTextChanged(Editable s) {
            showTyped();
        }
    };

    public static void show(EditText target, String channelId) {
        new EmoteSheet(target, channelId);
    }

    private EmoteSheet(EditText target, String channelId) {
        this.target = target;
        this.channelId = channelId;
        context = target.getContext();
        Text.use(context);
        ui = Ui.of(context);

        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        int side = Ui.dp(context, 16);
        content.setPadding(side, 0, side, Ui.dp(context, 12));

        typed = ui.text(context, "", 15, ui.text, false);
        content.addView(typedRow(), Ui.matchWidth());

        search = searchField();
        LinearLayout.LayoutParams searchLp = Ui.matchWidth();
        searchLp.topMargin = Ui.dp(context, 8);
        content.addView(search, searchLp);

        grid = new EmoteGrid(context, channelId, new EmoteGrid.Listener() {
            @Override
            public void picked(String name) {
                EmotePicker.insert(target, name);
            }

            @Override
            public void said(String text) {
                say(text);
            }

            @Override
            public void listed() {
                followChannel();
                showHint();
            }
        });
        tab = firstFilledTab();
        tabs = new JellyTabs(context, ui, new String[]{label("お気に入り", "Favorites"),
                label("チャンネル", "Channel"), label("グローバル", "Global")}, tab, picked -> {
            untouched = false;
            tab = picked;
            search.setText("");
            grid.show(tab, "");
        });
        HorizontalScrollView strip = new HorizontalScrollView(context);
        strip.setHorizontalScrollBarEnabled(false);
        strip.setHorizontalFadingEdgeEnabled(true);
        strip.setFadingEdgeLength(Ui.dp(context, 28));
        strip.addView(tabs);
        content.addView(strip, Ui.matchWidth());

        status = ui.text(context, "", 12, ui.secondary, false);
        status.setPadding(Ui.dp(context, 2), 0, 0, Ui.dp(context, 6));
        status.setSingleLine(true);
        status.setEllipsize(TextUtils.TruncateAt.END);
        content.addView(status, Ui.matchWidth());

        content.addView(grid, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, gridHeight(false)));

        BackDialog[] dialog = new BackDialog[1];
        Sheet sheet = new Sheet(context, ui, content, () -> {
            if (dialog[0].isShowing()) dialog[0].dismiss();
        });
        sheet.setInnerScroll(grid);
        dialog[0] = Sheet.host(context, sheet);
        dialog[0].setOnDismissListener(d -> {
            target.removeTextChangedListener(mirror);
            status.removeCallbacks(restoreHint);
        });
        search.setOnFocusChangeListener((view, focused) -> {
            ViewGroup.LayoutParams lp = grid.getLayoutParams();
            lp.height = gridHeight(focused);
            grid.setLayoutParams(lp);
        });
        target.addTextChangedListener(mirror);
        showTyped();
        grid.show(tab, "");
        Ui.show(dialog[0], context);
    }

    /** Five rows of emotes; three while the keyboard is up or the window is short, so the sheet still fits. */
    private int gridHeight(boolean typing) {
        boolean small = typing || context.getResources().getConfiguration().screenHeightDp < 520;
        return Ui.dp(context, 52 * (small ? 3 : 5));
    }

    private View typedRow() {
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setBackground(ui.field(context));
        row.setPadding(Ui.dp(context, 14), 0, Ui.dp(context, 2), 0);
        row.setMinimumHeight(Ui.dp(context, 48));
        row.addView(typed, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        ImageView erase = ui.iconView(context, Icons.Kind.BACKSPACE, ui.secondary, 22);
        erase.setContentDescription(label("最後の語を消す", "Delete the last word"));
        erase.setBackground(ui.pressable(context, 0, 24));
        erase.setOnClickListener(v -> eraseLastWord());
        row.addView(erase, new LinearLayout.LayoutParams(Ui.dp(context, 48), Ui.dp(context, 48)));
        return row;
    }

    private EditText searchField() {
        EditText field = new EditText(context);
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        field.setImeOptions(EditorInfo.IME_ACTION_SEARCH | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        field.setHint(label("エモートを検索", "Search emotes"));
        field.setTextColor(ui.text);
        field.setHintTextColor(ui.secondary);
        field.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        field.setBackground(ui.field(context));
        field.setCompoundDrawablesRelativeWithIntrinsicBounds(
                Icons.drawable(context, Icons.Kind.SEARCH, ui.secondary, 18), null, null, null);
        field.setCompoundDrawablePadding(Ui.dp(context, 10));
        field.setPadding(Ui.dp(context, 14), Ui.dp(context, 11), Ui.dp(context, 14), Ui.dp(context, 11));
        field.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (s.length() > 0) untouched = false;
                grid.show(tab, s.toString());
            }

            @Override
            public void afterTextChanged(Editable s) {
            }
        });
        return field;
    }

    /** The message so far, with its emotes drawn, since the sheet covers the message box. */
    private void showTyped() {
        CharSequence text = target.getText();
        boolean empty = TextUtils.isEmpty(text) || text.toString().trim().isEmpty();
        typed.setTextColor(empty ? ui.secondary : ui.text);
        // A long message shows its end, where the next emote goes. The hint wraps instead: at 1.3x
        // text on a 360dp phone it is wider than the field, and its end says that nothing is sent.
        typed.setSingleLine(!empty);
        if (empty) typed.setMaxLines(2);
        typed.setEllipsize(empty ? TextUtils.TruncateAt.END : TextUtils.TruncateAt.START);
        typed.setText(empty ? label("タップで追加（送信されません）", "Tap to add · nothing is sent") : text.toString());
        if (empty) EmoteSupport.clear(typed);
        else EmoteSupport.bind(typed, channelId);
    }

    /** Favourites first, then the channel's own emotes, then the global ones. */
    private int firstFilledTab() {
        return grid.count(EmoteGrid.FAVORITES) > 0 ? EmoteGrid.FAVORITES
                : grid.count(EmoteGrid.CHANNEL) > 0 ? EmoteGrid.CHANNEL : EmoteGrid.GLOBAL;
    }

    /**
     * A channel's emotes come from the network, often after the sheet opened on the global ones for
     * want of anything else. Until the viewer picks a tab, the sheet moves up to the better one.
     */
    private void followChannel() {
        if (!untouched || tabs == null) return;
        int better = firstFilledTab();
        if (better >= tab) return;
        tab = better;
        tabs.select(tab, false);
        grid.show(tab, "");
    }

    private void eraseLastWord() {
        Editable text = target.getText();
        int end = text.length();
        while (end > 0 && Character.isWhitespace(text.charAt(end - 1))) end--;
        text.delete(EmotePicker.tokenStart(text, end), text.length());
    }

    private void say(String text) {
        status.removeCallbacks(restoreHint);
        status.setTextColor(ui.accent);
        status.setText(text);
        status.announceForAccessibility(text);
        status.postDelayed(restoreHint, HINT_MS);
    }

    private void showHint() {
        status.removeCallbacks(restoreHint);
        status.setTextColor(ui.secondary);
        if (!grid.isEmpty()) {
            status.setText(label("タップで入力欄に追加・長押しでお気に入り", "Tap to add; hold to favorite"));
        } else if (search.length() > 0) {
            status.setText(label("一致するエモートはありません", "No matching emotes"));
        } else if (tab == EmoteGrid.FAVORITES) {
            status.setText(label("お気に入りはまだありません。エモートを長押しすると追加できます",
                    "No favorites yet. Hold an emote to add it"));
        } else {
            status.setText(label("エモートを読み込み中か、このチャンネルにはありません",
                    "Emotes are still loading, or this channel has none"));
        }
    }
}
