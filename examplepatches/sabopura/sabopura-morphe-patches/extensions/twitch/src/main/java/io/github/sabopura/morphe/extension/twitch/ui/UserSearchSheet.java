package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.Editable;
import android.text.InputFilter;
import android.text.InputType;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextWatcher;
import android.text.style.ImageSpan;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import io.github.sabopura.morphe.extension.twitch.chat.UserSearch;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * Looks up a login name or numeric ID and shows the public profile as a card, with the channel one tap
 * away. Progress and problems appear under the button, never as Toasts.
 */
public final class UserSearchSheet {
    private static final int COPIED_MS = 2000;
    private static final int KEYBOARD_DELAY_MS = 250;

    private final Context context;
    private final Ui ui;
    private final ClearableField field;
    private final TextView search;
    private final LinearLayout notice;
    private final ProgressBar spinner;
    private final ImageView warning;
    private final TextView noticeText;
    private final LinearLayout card;
    private final TextView name, login, id, about, copy;
    private final Sheet sheet;
    private final BackDialog dialog;
    private final Runnable restoreCopy = this::resetCopy;
    private boolean running;
    private UserSearch.Profile profile;

    public static void show(Context context) {
        show(context, Ui.of(context));
    }

    /** In the opener's colours, so a sheet over the dark player menu stays dark in the light theme. */
    static void show(Context context, Ui ui) {
        new UserSearchSheet(context, ui);
    }

    private UserSearchSheet(Context context, Ui ui) {
        this.context = context;
        this.ui = ui;
        Text.use(context);
        LinearLayout body = new LinearLayout(context);
        body.setOrientation(LinearLayout.VERTICAL);
        int side = Ui.dp(context, 20);
        body.setPadding(side, Ui.dp(context, 4), side, Ui.dp(context, 20));

        String titleText = label("ユーザー検索", "Find user");
        TextView title = ui.text(context, titleText, 20, ui.text, true);
        heading(title);
        body.addView(title, Ui.matchWidth());
        TextView hint = ui.text(context, label("ログイン名か数値 ID で、公開プロフィールを探します",
                "Look up a public profile by login name or numeric ID"), 13, ui.secondary, false);
        hint.setPadding(0, Ui.dp(context, 2), 0, Ui.dp(context, 12));
        body.addView(hint, Ui.matchWidth());

        field = new ClearableField(context, ui, Icons.Kind.PERSON, label("ログイン名 または 数値 ID", "Login name or numeric user ID"));
        // Logins are ASCII. Japanese keyboards ignore IME_FLAG_FORCE_ASCII (a Galaxy opened its kana
        // layout); the "visible password" kind is the one they all answer with a Latin layout, and
        // it shows what is typed.
        field.input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        // That kind switches the field to a monospace face; keep the sheet's own.
        field.input.setTypeface(android.graphics.Typeface.DEFAULT);
        field.input.setImeOptions(EditorInfo.IME_ACTION_SEARCH | EditorInfo.IME_FLAG_NO_EXTRACT_UI
                | EditorInfo.IME_FLAG_FORCE_ASCII);
        field.input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(40)});
        field.input.setOnEditorActionListener((v, action, event) -> {
            submit();
            return true;
        });
        field.input.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                refreshButton();
            }
        });
        body.addView(field, Ui.matchWidth());

        search = ui.button(context, "", true, this::submit);
        // In its own box: the sheet fades its rows in as it opens, which would undo the disabled look.
        FrameLayout searchBox = new FrameLayout(context);
        searchBox.addView(search, Ui.frame(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP));
        LinearLayout.LayoutParams searchLp = Ui.matchWidth();
        searchLp.topMargin = Ui.dp(context, 12);
        body.addView(searchBox, searchLp);

        notice = new LinearLayout(context);
        notice.setGravity(Gravity.CENTER_VERTICAL);
        notice.setMinimumHeight(Ui.dp(context, 40));
        notice.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        spinner = new ProgressBar(context, null, android.R.attr.progressBarStyleSmall);
        spinner.setIndeterminate(true);
        spinner.setIndeterminateTintList(ColorStateList.valueOf(ui.accent));
        spinner.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams markLp = new LinearLayout.LayoutParams(Ui.dp(context, 18), Ui.dp(context, 18));
        markLp.rightMargin = Ui.dp(context, 10);
        notice.addView(spinner, markLp);
        warning = ui.iconView(context, Icons.Kind.WARNING, ui.danger(), 18);
        warning.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        notice.addView(warning, new LinearLayout.LayoutParams(markLp));
        noticeText = ui.text(context, "", 14, ui.secondary, false);
        notice.addView(noticeText, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        notice.setVisibility(View.GONE);
        LinearLayout.LayoutParams noticeLp = Ui.matchWidth();
        noticeLp.topMargin = Ui.dp(context, 8);
        body.addView(notice, noticeLp);

        card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(Ui.rounded(context, ui.dark ? 0x14FFFFFF : 0x0A000000, 16));
        int pad = Ui.dp(context, 16);
        card.setPadding(pad, pad, pad, Ui.dp(context, 12));
        name = ui.text(context, "", 20, ui.text, true);
        heading(name);
        name.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        card.addView(name, Ui.matchWidth());
        login = ui.text(context, "", 14, ui.secondary, false);
        login.setPadding(0, Ui.dp(context, 2), 0, Ui.dp(context, 6));
        card.addView(login, Ui.matchWidth());
        id = fact(card, "ID");
        about = fact(card, label("自己紹介", "About"));
        TextView open = ui.button(context, label("チャンネルを開く", "Open channel"), true, this::open);
        LinearLayout.LayoutParams openLp = Ui.matchWidth();
        openLp.topMargin = Ui.dp(context, 14);
        card.addView(open, openLp);
        copy = ui.button(context, "", false, this::copyId);
        copy.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        LinearLayout.LayoutParams copyLp = Ui.matchWidth();
        copyLp.topMargin = Ui.dp(context, 6);
        card.addView(copy, copyLp);
        resetCopy();
        card.setVisibility(View.GONE);
        LinearLayout.LayoutParams cardLp = Ui.matchWidth();
        cardLp.topMargin = Ui.dp(context, 12);
        body.addView(card, cardLp);

        BackDialog[] holder = new BackDialog[1];
        sheet = new Sheet(context, ui, body, () -> {
            if (holder[0].isShowing()) holder[0].dismiss();
        });
        dialog = holder[0] = Sheet.host(context, sheet);
        dialog.setTitle(titleText);
        dialog.setOnDismissListener(d -> copy.removeCallbacks(restoreCopy));
        refreshButton();
        Ui.show(dialog, context);
        // After the sheet has risen, so the keyboard does not push it while it moves.
        field.postDelayed(() -> {
            if (dialog.isShowing()) field.showKeyboard();
        }, KEYBOARD_DELAY_MS);
    }

    private static void heading(TextView view) {
        if (Build.VERSION.SDK_INT >= 28) view.setAccessibilityHeading(true);
    }

    /** A labelled value inside the card; TalkBack reads the label and the value together. */
    private TextView fact(LinearLayout card, String labelText) {
        LinearLayout row = new LinearLayout(context);
        row.setPadding(0, Ui.dp(context, 8), 0, Ui.dp(context, 8));
        TextView key = ui.text(context, labelText, 13, ui.secondary, false);
        key.setMinWidth(Ui.dp(context, 84));
        key.setPadding(0, 0, Ui.dp(context, 12), 0);
        row.addView(key);
        TextView value = ui.text(context, "", 15, ui.text, false);
        value.setLineSpacing(0, 1.1f);
        row.addView(value, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        if (Build.VERSION.SDK_INT >= 28) row.setScreenReaderFocusable(true);
        card.addView(row, Ui.matchWidth());
        return value;
    }

    // ---- searching ----

    private void refreshButton() {
        boolean ready = !running && !field.text().trim().isEmpty();
        search.setText(running ? label("検索中…", "Searching…") : label("検索", "Search"));
        search.setEnabled(ready);
        search.setAlpha(ready ? 1f : .4f);
    }

    private void submit() {
        if (running || field.text().trim().isEmpty()) return;
        String value = UserSearch.query(field.text());
        if (value == null) {
            problem(label("ログイン名は英数字と _ で 25 文字まで、ID は数字だけで入力してください",
                    "Use letters, digits and _ (up to 25), or a numeric ID"));
            return;
        }
        field.hideKeyboard();
        running = true;
        refreshButton();
        progress();
        boolean started = UserSearch.lookup(value, new UserSearch.Listener() {
            @Override
            public void found(UserSearch.Profile found) {
                if (finish()) showProfile(found);
            }

            @Override
            public void missing() {
                if (finish()) problem(label("「" + value + "」というユーザーは見つかりませんでした",
                        "No user called “" + value + "”"));
            }

            @Override
            public void failed() {
                if (finish()) problem(label("検索サービスに接続できませんでした。通信を確かめて、もう一度お試しください",
                        "Couldn't reach the lookup service. Check the connection and try again"));
            }
        });
        if (!started && finish())
            problem(label("読み込みが混み合っています。少し待ってから、もう一度お試しください",
                    "Too many requests are waiting. Try again in a moment"));
    }

    /** Ends a search; false when the sheet closed meanwhile and nothing should change. */
    private boolean finish() {
        running = false;
        if (!dialog.isShowing()) return false;
        refreshButton();
        return true;
    }

    private void progress() {
        notice.setVisibility(View.VISIBLE);
        spinner.setVisibility(View.VISIBLE);
        warning.setVisibility(View.GONE);
        noticeText.setTextColor(ui.secondary);
        noticeText.setText(label("探しています…", "Searching…"));
        if (card.getVisibility() == View.VISIBLE)
            card.animate().alpha(.4f).setStartDelay(0).setDuration(Motion.enabled() ? 150 : 0).start();
    }

    private void problem(String text) {
        notice.setVisibility(View.VISIBLE);
        spinner.setVisibility(View.GONE);
        warning.setVisibility(View.VISIBLE);
        noticeText.setTextColor(ui.danger());
        noticeText.setText(text);
        card.animate().cancel();
        card.setVisibility(View.GONE);
        profile = null;
    }

    private void showProfile(UserSearch.Profile found) {
        profile = found;
        notice.setVisibility(View.GONE);
        name.setText(found.displayName);
        login.setText("@" + found.login);
        id.setText(found.id);
        boolean described = !found.description.trim().isEmpty();
        about.setText(described ? found.description.trim() : label("なし", "None"));
        about.setTextColor(described ? ui.text : ui.secondary);
        resetCopy();
        card.animate().cancel();
        card.setVisibility(View.VISIBLE);
        card.setAlpha(1);
        if (Motion.enabled()) {
            card.setAlpha(0);
            card.setTranslationY(Ui.dp(context, 8));
            card.animate().alpha(1).translationY(0).setStartDelay(0).setDuration(220).start();
        }
    }

    // ---- the card's actions ----

    private void open() {
        if (profile == null) return;
        if (UserSearch.open(context, profile.login)) sheet.close();
        else problem(label("チャンネルを開けませんでした", "Couldn't open the channel"));
    }

    private void copyId() {
        if (profile == null) return;
        try {
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText("ID", profile.id));
        } catch (RuntimeException e) {
            problem(label("コピーできませんでした", "Couldn't copy"));
            return;
        }
        String done = label("ID をコピーしました", "ID copied");
        SpannableStringBuilder text = new SpannableStringBuilder("  " + done);
        Drawable check = Icons.drawable(context, Icons.Kind.CHECK, ui.accent, 18);
        check.setBounds(0, 0, check.getIntrinsicWidth(), check.getIntrinsicHeight());
        text.setSpan(new ImageSpan(check, Build.VERSION.SDK_INT >= 29 ? ImageSpan.ALIGN_CENTER : ImageSpan.ALIGN_BOTTOM),
                0, 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        copy.setText(text);
        copy.setContentDescription(done);
        copy.removeCallbacks(restoreCopy);
        copy.postDelayed(restoreCopy, COPIED_MS);
    }

    private void resetCopy() {
        copy.removeCallbacks(restoreCopy);
        copy.setText(label("ID をコピー", "Copy ID"));
        copy.setContentDescription(null);
    }
}
