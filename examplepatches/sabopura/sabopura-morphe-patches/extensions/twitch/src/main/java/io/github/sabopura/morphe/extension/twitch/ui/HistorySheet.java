package io.github.sabopura.morphe.extension.twitch.ui;

import android.animation.ValueAnimator;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.Editable;
import android.text.InputType;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextWatcher;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.EditorInfo;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import java.util.Collections;
import java.util.List;
import java.util.TimeZone;

import io.github.sabopura.morphe.extension.twitch.chat.ChatEnhancements;
import io.github.sabopura.morphe.extension.twitch.chat.ChatHistory;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.chat.HistoryMessage;
import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmoteSupport;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * Recent public chat from robotty.de, or the messages this device has shown, in a sheet over the player:
 * a search field above a list that reads like chat. Holding a row copies its message.
 */
public final class HistorySheet {
    private static final int SAY_MS = 2600;
    private static final int SPAN = Spanned.SPAN_EXCLUSIVE_EXCLUSIVE;

    private final Context context;
    private final Ui ui;
    private final boolean recent;
    /** Captured when the sheet opens, so a retry asks for the same channel. */
    private final String channel, room;
    private final TimeZone zone = TimeZone.getDefault();
    private final HistoryRows rows = new HistoryRows();
    private final int timeWidth;
    private final TextView status;
    private final ClearableField search;
    private final ListView list;
    private final Skeleton skeleton;
    private final StateView state;
    private final TextView clear;
    private final BaseAdapter adapter = new Adapter();
    private final BackDialog dialog;
    private final Runnable restoreStatus = this::showStatus;
    private final View.AccessibilityDelegate copyAction = new View.AccessibilityDelegate() {
        @Override
        public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(host, info);
            info.addAction(new AccessibilityNodeInfo.AccessibilityAction(AccessibilityNodeInfo.ACTION_LONG_CLICK,
                    label("メッセージをコピー", "Copy the message")));
        }
    };
    private HistoryRows.Fetch fetch = HistoryRows.Fetch.LOADING;
    private HistoryRows.Screen screen;

    public static void show(Context context, boolean recent) {
        show(context, recent, Ui.of(context));
    }

    /** In the opener's colours, so a sheet over the dark player menu stays dark in the light theme. */
    static void show(Context context, boolean recent, Ui ui) {
        new HistorySheet(context, recent, ui);
    }

    private HistorySheet(Context context, boolean recent, Ui ui) {
        this.context = context;
        this.recent = recent;
        this.ui = ui;
        Text.use(context);
        String name = ChatEnhancements.channelName();
        channel = name != null && name.matches("[A-Za-z0-9_]{1,25}") ? name : null;
        room = ChatEnhancements.channelId();

        TextView probe = ui.text(context, "", 12, ui.secondary, false);
        timeWidth = (int) Math.ceil(probe.getPaint().measureText("00:00")) + Ui.dp(context, 12);

        String titleText = recent ? label("過去チャット", "Recent chat")
                : label("表示したメッセージの履歴", "Viewed message history");
        TextView title = ui.text(context, titleText, 20, ui.text, true);
        heading(title);

        status = ui.text(context, "", 13, ui.secondary, false);
        status.setPadding(0, Ui.dp(context, 2), 0, Ui.dp(context, 10));
        status.setMaxLines(2);
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);

        search = new ClearableField(context, ui, Icons.Kind.SEARCH, label("本文・ユーザーを検索", "Search messages and users"));
        search.input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        search.input.setImeOptions(EditorInfo.IME_ACTION_SEARCH | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        search.input.setOnEditorActionListener((v, action, event) -> {
            search.hideKeyboard();
            return true;
        });
        search.input.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                rows.filter(s.toString());
                render();
            }
        });

        list = new ListView(context);
        list.setDivider(null);
        list.setSelector(new ColorDrawable(Color.TRANSPARENT));
        list.setCacheColorHint(Color.TRANSPARENT);
        list.setItemsCanFocus(true);
        list.setNestedScrollingEnabled(true);
        list.setClipToPadding(false);
        list.setPadding(0, 0, 0, Ui.dp(context, 8));
        list.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
        list.setContentDescription(titleText);
        list.setAdapter(adapter);
        skeleton = new Skeleton(context);
        state = new StateView(context);
        FrameLayout area = new FrameLayout(context);
        area.addView(list, Ui.frame(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT, Gravity.TOP));
        area.addView(skeleton, Ui.frame(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT, Gravity.TOP));
        area.addView(state, Ui.frame(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT, Gravity.CENTER));
        list.setVisibility(View.GONE);
        skeleton.setVisibility(View.GONE);
        state.setVisibility(View.GONE);

        Body body = new Body(context, area);
        int side = Ui.dp(context, 20);
        body.setPadding(side, Ui.dp(context, 4), side, Ui.dp(context, 12));
        body.addView(title, Ui.matchWidth());
        body.addView(status, Ui.matchWidth());
        body.addView(search, Ui.matchWidth());
        LinearLayout.LayoutParams areaLp = Ui.matchWidth();
        areaLp.topMargin = Ui.dp(context, 8);
        body.addView(area, areaLp);
        clear = recent ? null : clearButton();
        if (clear != null) {
            LinearLayout.LayoutParams clearLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            clearLp.topMargin = Ui.dp(context, 4);
            body.addView(clear, clearLp);
        }

        BackDialog[] holder = new BackDialog[1];
        Sheet sheet = new Sheet(context, ui, body, () -> {
            if (holder[0].isShowing()) holder[0].dismiss();
        });
        sheet.setInnerScroll(list);
        dialog = holder[0] = Sheet.host(context, sheet);
        dialog.setTitle(titleText);
        dialog.setOnDismissListener(d -> status.removeCallbacks(restoreStatus));
        Ui.show(dialog, context);
        load();
    }

    private static void heading(TextView view) {
        if (Build.VERSION.SDK_INT >= 28) view.setAccessibilityHeading(true);
    }

    // ---- loading ----

    private void load() {
        setFetch(HistoryRows.Fetch.LOADING);
        if (!recent) {
            ChatHistory.loadSaved(context, room, this::arrived);
        } else if (channel == null) {
            setFetch(HistoryRows.Fetch.NO_CHANNEL);
        } else if (!ChatHistory.fetchRecent(context, channel, this::arrived)) {
            setFetch(HistoryRows.Fetch.BUSY);
        }
    }

    private void arrived(List<HistoryRows.Row> loaded) {
        if (!dialog.isShowing()) return;
        if (loaded == null) {
            setFetch(HistoryRows.Fetch.FAILED);
            return;
        }
        rows.set(loaded);
        setFetch(HistoryRows.Fetch.DONE);
    }

    private void setFetch(HistoryRows.Fetch value) {
        fetch = value;
        render();
    }

    // ---- what the sheet shows ----

    private void render() {
        HistoryRows.Screen next = HistoryRows.screen(fetch, rows.total(), rows.size());
        boolean changed = next != screen;
        screen = next;
        adapter.notifyDataSetChanged();
        boolean loading = next == HistoryRows.Screen.LOADING, listed = next == HistoryRows.Screen.LIST;
        if (changed) {
            showSkeleton(loading);
            reveal(list, listed);
            reveal(state, !loading && !listed);
        }
        if (listed) list.setSelection(rows.size() - 1);
        else if (!loading) fillState(next);
        search.setEnabled(fetch == HistoryRows.Fetch.LOADING || fetch == HistoryRows.Fetch.DONE);
        if (clear != null) {
            boolean ready = fetch == HistoryRows.Fetch.DONE;
            clear.setEnabled(ready);
            clear.setTextColor(ready ? ui.danger() : ui.danger() & 0x00FFFFFF | 0x66000000);
        }
        showStatus();
    }

    private static void reveal(View view, boolean shown) {
        view.animate().cancel();
        view.setAlpha(1);
        if (!shown) {
            view.setVisibility(View.GONE);
            return;
        }
        view.setVisibility(View.VISIBLE);
        if (!Motion.enabled()) return;
        view.setAlpha(0);
        view.animate().alpha(1).setDuration(180).start();
    }

    /** A local read usually finishes at once; the placeholder only fades in if it does not. */
    private void showSkeleton(boolean shown) {
        skeleton.animate().cancel();
        skeleton.setVisibility(shown ? View.VISIBLE : View.GONE);
        skeleton.setAlpha(1);
        if (!shown || !Motion.enabled()) return;
        skeleton.setAlpha(0);
        skeleton.animate().alpha(1).setStartDelay(150).setDuration(220).start();
    }

    private void fillState(HistoryRows.Screen shown) {
        switch (shown) {
            case NO_CHANNEL:
                state.set(Icons.Kind.PLAY, label("配信を開いてからお使いください", "Open a channel first"),
                        label("過去チャットは、開いているチャンネルの公開ログを robotty.de から読み込みます",
                                "Recent chat loads the open channel's public log from robotty.de"), null, null);
                break;
            case FAILED:
                state.set(Icons.Kind.WARNING,
                        recent ? label("過去チャットを取得できませんでした", "Couldn't load recent chat")
                                : label("履歴を読み込めませんでした", "Couldn't read the history"),
                        recent ? label("robotty.de がこのチャンネルを記録していないか、記録を断られているか、サービスが止まっています",
                                "robotty.de may not log this channel, the channel may have opted out, or the service is offline")
                                : label("少し待ってから、もう一度お試しください", "Wait a moment, then try again"),
                        label("もう一度", "Try again"), this::load);
                break;
            case BUSY:
                state.set(Icons.Kind.CLOCK, label("読み込みが混み合っています", "Too many requests are waiting"),
                        label("ほかの読み込みが終わってから、もう一度お試しください", "Try again once the others finish"),
                        label("もう一度", "Try again"), this::load);
                break;
            case EMPTY:
                if (recent) {
                    state.set(Icons.Kind.CHAT, label("公開履歴はまだありません", "No public history yet"),
                            label("robotty.de がこのチャンネルで記録したメッセージが、ここに並びます",
                                    "Messages robotty.de logs in this channel will appear here"), null, null);
                } else {
                    boolean saved = ChatSettings.get(context).saveHistory;
                    state.set(Icons.Kind.CLOCK, label("まだ履歴はありません", "No history yet"),
                            label("チャットに表示されたメッセージが、この端末に最大 1,000 件たまります",
                                    "Messages shown in chat collect here, up to 1,000 on this device")
                                    + (saved ? "" : label("。保存はオフなので、アプリを閉じると消えます",
                                    ". Saving is off, so they are gone when the app closes")),
                            null, null);
                }
                break;
            default:
                state.set(Icons.Kind.SEARCH, label("「" + query() + "」に一致するメッセージはありません",
                                "Nothing matches “" + query() + "”"),
                        label("名前・ログイン名・本文から探しています", "Names, logins and messages are searched"),
                        label("検索をクリア", "Clear the search"), () -> search.input.setText(""));
                break;
        }
    }

    private String query() {
        String text = search.text().trim();
        return text.length() > 30 ? text.substring(0, 29) + "…" : text;
    }

    private void showStatus() {
        status.removeCallbacks(restoreStatus);
        status.setTextColor(ui.secondary);
        status.setText(statusText());
    }

    private String statusText() {
        String total = HistoryFormat.count(rows.total()), found = HistoryFormat.count(rows.size());
        switch (fetch) {
            case LOADING:
                return recent ? label("robotty.de から読み込んでいます…", "Loading from robotty.de…")
                        : label("この端末の履歴を読み込んでいます…", "Reading this device's history…");
            case DONE:
                if (rows.searching())
                    return recent ? label(total + " 件中 " + found + " 件が一致・robotty.de", found + " of " + total + " match · robotty.de")
                            : label(total + " 件中 " + found + " 件が一致", found + " of " + total + " match");
                if (recent) return label("公開履歴 " + total + " 件・robotty.de", total + " public messages · robotty.de");
                // Without saving the list restarts with the app, which looks like lost history unless it says so.
                return label("この端末で表示した " + total + " 件", total + " shown on this device")
                        + (ChatSettings.get(context).saveHistory
                        ? label("（最大 1,000 件）", " (up to 1,000)")
                        : label("・保存はオフ（アプリを閉じると消えます）", " · saving is off (gone when the app closes)"));
            default:
                return recent ? label("robotty.de の公開ログ", "Public log from robotty.de")
                        : label("この端末で表示したメッセージ", "Messages shown on this device");
        }
    }

    /** Confirms in the status line, right above the rows, where the eyes already are. */
    private void say(String text) {
        status.removeCallbacks(restoreStatus);
        status.setTextColor(ui.accent);
        status.setText(text);
        status.postDelayed(restoreStatus, SAY_MS);
    }

    // ---- actions ----

    private void copy(String message) {
        try {
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText(label("チャットのメッセージ", "Chat message"), message));
            say(label("メッセージをコピーしました", "Message copied"));
        } catch (RuntimeException e) {
            say(label("コピーできませんでした", "Couldn't copy"));
        }
    }

    private TextView clearButton() {
        TextView button = ui.text(context, label("この端末の履歴を削除", "Clear this device's history"), 14, ui.danger(), true);
        button.setGravity(Gravity.CENTER_VERTICAL);
        button.setMinHeight(Ui.dp(context, 48));
        button.setBackground(ui.pressable(context, 0, 12));
        button.setPadding(Ui.dp(context, 8), 0, Ui.dp(context, 8), 0);
        button.setOnClickListener(v -> confirmClear());
        return button;
    }

    private void confirmClear() {
        Ui.show(ui.confirmDanger(context, label("履歴を削除しますか？", "Clear the history?"),
                label("この端末に残っている、すべてのチャンネルの表示履歴を削除します。元には戻せません。",
                        "This deletes the viewed history of every channel kept on this device. It cannot be undone."),
                label("削除", "Delete"), () -> {
                    ChatHistory.clear(context);
                    rows.set(Collections.emptyList());
                    setFetch(HistoryRows.Fetch.DONE);
                    say(label("履歴を削除しました", "History cleared"));
                }, label("キャンセル", "Cancel")), context);
    }

    // ---- views ----

    /** Gives the list area all the height the sheet has left, so the sheet keeps one size in every state. */
    private static final class Body extends LinearLayout {
        private final View fill;
        private final int least, fallback;

        Body(Context context, View fill) {
            super(context);
            setOrientation(VERTICAL);
            this.fill = fill;
            least = Ui.dp(context, 160);
            fallback = Ui.dp(context, 360);
        }

        @Override
        protected void onMeasure(int widthSpec, int heightSpec) {
            // The sheet's scroll view passes the height it has as a hint, even though it lets this grow.
            int room = MeasureSpec.getSize(heightSpec);
            LayoutParams lp = (LayoutParams) fill.getLayoutParams();
            lp.height = room > 0 ? least : fallback;
            super.onMeasure(widthSpec, heightSpec);
            int wanted = room - (getMeasuredHeight() - lp.height);
            if (room <= 0 || wanted <= least) return;
            lp.height = wanted;
            super.onMeasure(widthSpec, heightSpec);
        }
    }

    private final class Adapter extends BaseAdapter {
        @Override
        public int getCount() {
            return rows.size();
        }

        @Override
        public Object getItem(int position) {
            return rows.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View old, ViewGroup parent) {
            RowView view = old instanceof RowView ? (RowView) old : new RowView(context);
            view.bind(position);
            return view;
        }
    }

    /** A day heading when the day changes, then the time and the line of chat. */
    private final class RowView extends LinearLayout {
        private final TextView day, time, body;
        private final LinearLayout line;
        private String message = "";

        RowView(Context context) {
            super(context);
            setOrientation(VERTICAL);
            day = ui.text(context, "", 12, ui.secondary, true);
            day.setPadding(Ui.dp(context, 4), Ui.dp(context, 14), 0, Ui.dp(context, 2));
            heading(day);
            addView(day, Ui.matchWidth());

            line = new LinearLayout(context);
            line.setMinimumHeight(Ui.dp(context, 48));
            line.setPadding(Ui.dp(context, 4), Ui.dp(context, 12), Ui.dp(context, 8), Ui.dp(context, 12));
            line.setBackground(ui.pressable(context, 0, 12));
            line.setFocusable(true);
            line.setOnLongClickListener(v -> {
                copy(message);
                return true;
            });
            line.setAccessibilityDelegate(copyAction);
            time = ui.text(context, "", 12, ui.secondary, false);
            time.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            line.addView(time, new LayoutParams(timeWidth, ViewGroup.LayoutParams.WRAP_CONTENT));
            body = ui.text(context, "", 14, ui.text, false);
            body.setLineSpacing(0, 1.1f);
            body.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            line.addView(body, new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            addView(line, Ui.matchWidth());
        }

        void bind(int position) {
            HistoryRows.Row row = rows.get(position);
            HistoryMessage m = row.message;
            long previous = position == 0 ? 0 : rows.get(position - 1).message.time;
            String heading = HistoryFormat.day(previous, m.time, System.currentTimeMillis(), zone, Text.japanese());
            day.setText(heading);
            day.setVisibility(heading == null ? View.GONE : View.VISIBLE);
            String clock = HistoryFormat.clock(m.time, zone);
            time.setText(clock);
            HistoryRows.Line shown = HistoryRows.line(m.user, m.text, rows.tokens());
            body.setText(decorate(shown, row.color));
            boolean thirdParty = Features.has(Feature.CHAT_EMOTES);
            if (thirdParty || !row.emotes.isEmpty())
                EmoteSupport.bind(body, recent || room != null ? room : m.room, thirdParty, row.emotes, ui.dark);
            // A recycled row still waits for the images of the message it showed before.
            else EmoteSupport.clear(body);
            message = shown.body();
            line.setContentDescription(clock.isEmpty() ? shown.text : clock + " " + shown.text);
        }
    }

    private CharSequence decorate(HistoryRows.Line shown, int color) {
        SpannableStringBuilder text = new SpannableStringBuilder(shown.text);
        int name = color == 0 ? ui.text : HistoryFormat.readable(color, ui.surface);
        text.setSpan(new ForegroundColorSpan(name), 0, shown.action ? text.length() : shown.nameEnd, SPAN);
        text.setSpan(new StyleSpan(Typeface.BOLD), 0, shown.nameEnd, SPAN);
        if (shown.action) text.setSpan(new StyleSpan(Typeface.ITALIC), shown.bodyStart, text.length(), SPAN);
        for (int[] mark : shown.marks) {
            text.setSpan(new BackgroundColorSpan(ui.accentSoft), mark[0], mark[1], SPAN);
            text.setSpan(new ForegroundColorSpan(ui.accent), mark[0], mark[1], SPAN);
        }
        return text;
    }

    /** Grey lines where messages will be, breathing slowly unless animations are off. */
    private final class Skeleton extends View {
        private final float[] lengths = {.78f, .52f, .9f, .64f, .84f, .44f, .72f, .96f, .58f};
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF bar = new RectF();
        private final int alpha;
        private ValueAnimator breath;
        private float level = 1;

        Skeleton(Context context) {
            super(context);
            int color = ui.dark ? 0x26FFFFFF : 0x17000000;
            alpha = Color.alpha(color);
            paint.setColor(color);
            setContentDescription(label("読み込み中", "Loading"));
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
        }

        @Override
        public void onVisibilityAggregated(boolean visible) {
            super.onVisibilityAggregated(visible);
            rest();
            if (!visible || !Motion.enabled()) return;
            breath = ValueAnimator.ofFloat(1f, .45f);
            breath.setDuration(900);
            breath.setRepeatMode(ValueAnimator.REVERSE);
            breath.setRepeatCount(ValueAnimator.INFINITE);
            breath.addUpdateListener(a -> {
                level = (float) a.getAnimatedValue();
                invalidate();
            });
            breath.start();
        }

        @Override
        protected void onDetachedFromWindow() {
            rest();
            super.onDetachedFromWindow();
        }

        private void rest() {
            if (breath != null) breath.cancel();
            breath = null;
            level = 1;
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float d = getResources().getDisplayMetrics().density;
            float row = 48 * d, thick = 10 * d, radius = thick / 2;
            paint.setAlpha(Math.round(alpha * level));
            int i = 0;
            for (float top = 0; top + row <= getHeight(); top += row, i++) {
                float y = top + (row - thick) / 2;
                bar.set(4 * d, y, timeWidth - 12 * d, y + thick);
                canvas.drawRoundRect(bar, radius, radius, paint);
                float start = timeWidth + 4 * d, name = (44 + i * 23 % 48) * d;
                bar.set(start, y, start + name, y + thick);
                canvas.drawRoundRect(bar, radius, radius, paint);
                float room = Math.max(0, getWidth() - start - name - 16 * d);
                bar.set(start + name + 8 * d, y, start + name + 8 * d + room * lengths[i % lengths.length], y + thick);
                canvas.drawRoundRect(bar, radius, radius, paint);
            }
        }
    }

    /** An icon, a heading, a line of explanation and at most one action, in the middle of the list area. */
    private final class StateView extends LinearLayout {
        private final ImageView icon;
        private final TextView title, body, action;
        private Runnable onAction;

        StateView(Context context) {
            super(context);
            setOrientation(VERTICAL);
            setGravity(Gravity.CENTER);
            setPadding(Ui.dp(context, 24), Ui.dp(context, 12), Ui.dp(context, 24), Ui.dp(context, 12));
            icon = new ImageView(context);
            icon.setScaleType(ImageView.ScaleType.CENTER);
            GradientDrawable circle = new GradientDrawable();
            circle.setShape(GradientDrawable.OVAL);
            circle.setColor(ui.accentSoft);
            icon.setBackground(circle);
            icon.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            LayoutParams iconLp = new LayoutParams(Ui.dp(context, 56), Ui.dp(context, 56));
            iconLp.bottomMargin = Ui.dp(context, 14);
            addView(icon, iconLp);
            title = ui.text(context, "", 16, ui.text, true);
            title.setGravity(Gravity.CENTER);
            heading(title);
            addView(title);
            body = ui.text(context, "", 13, ui.secondary, false);
            body.setGravity(Gravity.CENTER);
            body.setLineSpacing(0, 1.15f);
            body.setMaxWidth(Ui.dp(context, 320));
            body.setPadding(0, Ui.dp(context, 6), 0, 0);
            addView(body);
            action = ui.button(context, "", false, () -> {
                if (onAction != null) onAction.run();
            });
            LayoutParams actionLp = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            actionLp.topMargin = Ui.dp(context, 14);
            addView(action, actionLp);
        }

        void set(Icons.Kind kind, String heading, String text, String actionLabel, Runnable run) {
            icon.setImageDrawable(Icons.drawable(getContext(), kind, ui.accent, 26));
            title.setText(heading);
            body.setText(text);
            onAction = run;
            action.setText(actionLabel);
            action.setVisibility(actionLabel == null ? GONE : VISIBLE);
        }

        /** A short list area, as with the keyboard up, drops the icon before it would cut the words. */
        @Override
        protected void onMeasure(int widthSpec, int heightSpec) {
            int wanted = MeasureSpec.getSize(heightSpec) < Ui.dp(getContext(), 240) ? GONE : VISIBLE;
            if (icon.getVisibility() != wanted) icon.setVisibility(wanted);
            super.onMeasure(widthSpec, heightSpec);
        }
    }
}
