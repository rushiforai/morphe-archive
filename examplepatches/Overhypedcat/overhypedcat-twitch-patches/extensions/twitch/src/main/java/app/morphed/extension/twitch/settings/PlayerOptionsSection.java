package app.morphed.extension.twitch.settings;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.InsetDrawable;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.Included;
import app.morphed.extension.twitch.Messages;
import app.morphed.extension.twitch.musicfilter.SongRemoval;
import app.morphed.extension.twitch.musicfilter.StatusWords;
import app.morphed.extension.twitch.patches.DebugLog;
import app.morphed.extension.twitch.ui.Squircle;
import app.morphed.extension.twitch.ui.Theme;
import app.morphed.extension.twitch.ui.TwitchFonts;
import app.morphed.extension.twitch.unlock.QualityUnlock;

/**
 * The patches' switches in the video player's Options sheet (ad blocker, song removal, quality unlock), with what
 * each is doing right now. The sheet is React Native: its own rows are found by their test ids, and the section
 * is appended to the end of its scrolling list, which is lengthened to hold it.
 */
public final class PlayerOptionsSection {
    /**
     * Rows of the Options sheet, any of which says it's open. The sheet differs by layout (portrait, full screen,
     * vertical full screen): rows that are in each, and rows that are only in some, are all here.
     */
    static final String[] SHEET_ROWS = {"playback-audio-only", "playback-video-stats", "playback-ad-stats",
            "playback-captions-settings", "playback-landscape-alerts", "playback-pip-auto-popout"};
    private static final Object SECTION_TAG = new Object();
    private static int testIdKey;
    private static boolean failureShown;

    private PlayerOptionsSection() {
    }

    /** Looks for an open Options sheet in this window and adds the section once. */
    public static void scan(Activity activity, View root) {
        if (!Included.adBlock() && !Included.songRemoval() && !Included.qualityUnlock() && !Included.highestQuality()) return;
        if (testIdKey == 0) {
            testIdKey = activity.getResources().getIdentifier("react_test_id", "id", activity.getPackageName());
            if (testIdKey == 0) testIdKey = -1;
        }
        scanNative(activity, root);
        if (testIdKey < 0) return;
        View row = find(root);
        if (row == null) return;
        ScrollView scroll = null;
        for (View v = row; v.getParent() instanceof View; v = (View) v.getParent()) {
            if (v.getParent() instanceof ScrollView) {
                scroll = (ScrollView) v.getParent();
                break;
            }
        }
        if (scroll == null || !(scroll.getChildAt(0) instanceof ViewGroup)) {
            failed(new IllegalStateException("the Options list has no scrolling content"));
            return;
        }
        ViewGroup content = (ViewGroup) scroll.getChildAt(0);
        for (int i = 0; i < content.getChildCount(); i++) {
            if (content.getChildAt(i).getTag() == SECTION_TAG) return; // there already
        }
        // where the sheet's own rows start (its list may already be inset)
        View section = build(activity, leftEdge(row));
        section.setTag(SECTION_TAG);
        content.addView(section);
        place(content, section);
        content.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
                if (section.getParent() != content) {
                    content.removeOnLayoutChangeListener(this);
                    return;
                }
                content.post(() -> place(content, section));
            }
        });
        DebugLog.log("Player Options: patch switches added");
    }

    /**
     * The native player's Options sheet (the one with an Apply button; Twitch uses that player for some streams):
     * Android views, its sections one under the other in a list. The section goes at the end of that list, which
     * lays it out as one of its own.
     */
    private static void scanNative(Activity activity, View root) {
        if (nativeIds == null) nativeIds = NativeSheetIds.of(activity);
        if (nativeIds.list == 0) return; // (not in this version of the app: the other sheets are looked for)
        View scroll = root.findViewById(nativeIds.list);
        if (scroll == null || !scroll.isShown()) return;
        if (scroll instanceof ViewGroup && ((ViewGroup) scroll).getChildCount() == 0) return; // (not filled in yet)
        if (!(scroll instanceof ViewGroup) || !(((ViewGroup) scroll).getChildAt(0) instanceof LinearLayout)) {
            if (badList.get() != scroll) { // (told once for each such list, not on every layout pass)
                badList = new WeakReference<>(scroll);
                failed(new IllegalStateException("the Options list (" + scroll.getClass().getName()
                        + ") doesn't hold its sections in a column"));
            }
            return;
        }
        LinearLayout content = (LinearLayout) ((ViewGroup) scroll).getChildAt(0);
        for (int i = 0; i < content.getChildCount(); i++) {
            if (content.getChildAt(i).getTag() == NATIVE_SECTION_TAG) return; // there already
        }
        // Lined up with the sheet's own section titles.
        View title = nativeIds.title == 0 ? null : content.findViewById(nativeIds.title);
        boolean shown = title != null && title.getWidth() > 0;
        int[] titleAt = new int[2], listAt = new int[2];
        if (shown) {
            title.getLocationOnScreen(titleAt);
            content.getLocationOnScreen(listAt);
        }
        // (from where the list's own padding ends: that's where the section starts)
        int side = sideOf(shown, titleAt[0], listAt[0] + content.getPaddingLeft(), shown ? title.getPaddingLeft() : 0,
                new Theme(activity).dp(16));
        // In the look of the sheet's own section titles and switch rows ("Pop Out"; else "Chat Only").
        View switchRow = nativeIds.switchRow == 0 ? null : content.findViewById(nativeIds.switchRow);
        View row = nativeIds.row == 0 ? null : content.findViewById(nativeIds.row);
        TextView rowLook = firstText(switchRow);
        if (rowLook == null) rowLook = firstText(row);
        View section = build(activity, side, title instanceof TextView ? (TextView) title : null, rowLook);
        // (the sheet's sections follow each other without a gap of their own above their titles)
        section.setPadding(0, 0, 0, section.getPaddingBottom());
        section.setTag(NATIVE_SECTION_TAG);
        content.addView(section, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        DebugLog.log("Player Options: patch switches added (native player)");
    }

    /** Where our rows start in the list: where the sheet's own titles do, or a default without one to go by. */
    static int sideOf(boolean titleShown, int titleLeft, int listLeft, int titlePadding, int fallback) {
        int side = titleLeft - listLeft + titlePadding;
        return titleShown && side >= 0 ? side : fallback;
    }

    private static WeakReference<View> badList = new WeakReference<>(null);

    /** The native Options sheet's views, by their resource names (0: not in this version of the app). */
    static final class NativeSheetIds {
        static final String LIST = "options_scrollview";
        static final String TITLE = "viewing_options_header";
        static final String ROW = "chat_only_toggle";
        static final String SWITCH_ROW = "pip_wrapper";
        final int list, title, row, switchRow;

        NativeSheetIds(int list, int title, int row, int switchRow) {
            this.list = list;
            this.title = title;
            this.row = row;
            this.switchRow = switchRow;
        }

        static NativeSheetIds of(Activity activity) {
            android.content.res.Resources resources = activity.getResources();
            String app = activity.getPackageName();
            return new NativeSheetIds(resources.getIdentifier(LIST, "id", app), resources.getIdentifier(TITLE, "id", app),
                    resources.getIdentifier(ROW, "id", app), resources.getIdentifier(SWITCH_ROW, "id", app));
        }
    }

    /** The first text in a view (itself, or the first found among its children), or null. */
    private static TextView firstText(View view) {
        if (view instanceof TextView) return (TextView) view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            TextView found = firstText(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    private static NativeSheetIds nativeIds;
    private static final Object NATIVE_SECTION_TAG = new Object();

    /** The first visible row of the Options sheet, in one walk through the window. */
    private static View find(View view) {
        if (view.getVisibility() != View.VISIBLE) return null;
        if (isSheetRow(view.getTag(testIdKey))) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = find(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    /** Whether a view's React Native test id is one of the Options sheet's rows. */
    static boolean isSheetRow(Object testId) {
        if (!(testId instanceof String)) return false;
        for (String id : SHEET_ROWS) if (id.equals(testId)) return true;
        return false;
    }

    /**
     * React Native lays out its own rows and leaves ours alone: ours goes below the lowest of them, and the list
     * is made that much longer so it scrolls to it.
     */
    private static void place(ViewGroup content, View section) {
        int bottom = 0;
        for (int i = 0; i < content.getChildCount(); i++) {
            View child = content.getChildAt(i);
            if (child != section && child.getVisibility() != View.GONE) bottom = Math.max(bottom, child.getBottom());
        }
        int width = content.getWidth();
        if (width <= 0) return;
        section.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        int height = section.getMeasuredHeight();
        section.layout(0, bottom, width, bottom + height);
        int wanted = content.getTop() + bottom + height;
        if (content.getBottom() != wanted) content.setBottom(wanted);
    }

    /**
     * The section as a sheet of its own, from the bottom (for the player's older Options sheet, which is drawn by
     * Jetpack Compose and can't take it in).
     */
    public static void showSheet(Activity activity) {
        Dialog open = openSheet.get();
        if (open != null && open.isShowing()) return; // (a second tap while it opens)
        if (activity.isFinishing() || activity.isDestroyed()) throw new IllegalStateException("the screen is closing");
        Theme theme = new Theme(activity);
        Dialog dialog = new Dialog(activity, theme.dark ? android.R.style.Theme_DeviceDefault_Dialog_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_Dialog_NoActionBar);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setOwnerActivity(activity);
        LinearLayout sheet = new LinearLayout(activity);
        sheet.setOrientation(LinearLayout.VERTICAL);
        // Rounded at the top only: the squircle's lower corners are drawn below the screen's edge.
        int radius = theme.dp(16);
        sheet.setBackground(new InsetDrawable(new Squircle(theme.background, radius), 0, 0, 0, -2 * radius));
        View handle = new View(activity);
        handle.setBackground(new Squircle(theme.dark ? 0xFF53535F : 0xFFADADB8, theme.dpf(2)));
        LinearLayout.LayoutParams handleSize = new LinearLayout.LayoutParams(theme.dp(32), theme.dp(4));
        handleSize.gravity = Gravity.CENTER_HORIZONTAL;
        handleSize.topMargin = theme.dp(10);
        sheet.addView(handle, handleSize);
        ScrollView scroll = new ScrollView(activity);
        scroll.addView(build(activity, theme.dp(16)));
        sheet.addView(scroll);
        dialog.setContentView(sheet);
        dialog.setCanceledOnTouchOutside(true);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(0));
            window.setGravity(Gravity.BOTTOM);
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            window.getDecorView().setPadding(0, 0, 0, 0);
        }
        dialog.show();
        openSheet = new WeakReference<>(dialog);
        DebugLog.log("Player Options: patch switches opened as a sheet");
    }

    /** The screen goes: its sheet, if open, goes with it. */
    public static void closeSheet(Activity activity) {
        Dialog open = openSheet.get();
        if (open != null && open.getOwnerActivity() == activity && open.isShowing()) open.dismiss();
        openSheet = new WeakReference<>(null);
    }

    private static WeakReference<Dialog> openSheet = new WeakReference<>(null);

    public static void failed(Throwable t) {
        Log.e(App.TAG, "Adding the patch switches to the player's Options failed", t);
        DebugLog.log("PROBLEM Player Options: " + Log.getStackTraceString(t));
        if (failureShown) return;
        failureShown = true;
        Context context = App.application();
        if (context != null) {
            Toast.makeText(context, "The patch switches couldn't be added to the player's Options (Twitch changed it): "
                            + Messages.of(t),
                    Toast.LENGTH_LONG).show();
        }
    }

    // --- the section

    private static View build(Activity activity, int side) {
        return build(activity, side, null, null);
    }

    /**
     * The section; with a sheet's own section title and row title to take the look of (its text size, font and
     * color), or null for the look of the React Native sheet's.
     */
    private static View build(Activity activity, int side, TextView titleLook, TextView rowLook) {
        Theme theme = new Theme(activity);
        LinearLayout section = new LinearLayout(activity);
        section.setOrientation(LinearLayout.VERTICAL);
        section.setPadding(0, theme.dp(12), 0, theme.dp(24));

        TextView header = new TextView(activity);
        header.setText("PATCHES");
        header.setTextColor(theme.dark ? 0xFFDEDEE3 : 0xFF3A3A3D); // as the sheet's own section titles
        header.setTextSize(19);
        header.setTypeface(TwitchFonts.regular(activity));
        header.setPadding(side, theme.dp(12), side, theme.dp(10));
        lookOf(titleLook, header);
        section.addView(header);

        if (Included.adBlock()) section.addView(row(activity, theme, side, "Ad blocker", PatchSettings.AD_BLOCK, null, rowLook));

        TextView songStatus = status(activity, theme);
        TextView songDetail = status(activity, theme); // a problem's whole sentence, under its few words
        songDetail.setTextSize(12);
        songDetail.setMaxLines(Integer.MAX_VALUE); // (a problem's whole sentence, to report: never cut short)
        songDetail.setEllipsize(null);
        TextView retry = new TextView(activity);
        retry.setText("Retry");
        retry.setTextColor(theme.text);
        retry.setTextSize(13);
        retry.setTypeface(TwitchFonts.semiBold(activity));
        retry.setPadding(theme.dp(14), theme.dp(7), theme.dp(14), theme.dp(7));
        // as Twitch's secondary buttons (Subscribe): a grey pill
        retry.setBackground(new Squircle(theme.dark ? 0xFF2F2F35 : 0xFFE5E5E9, theme.dpf(16)));
        retry.setOnClickListener(v -> SongRemoval.retry());
        LinearLayout retryLine = new LinearLayout(activity);
        retryLine.setPadding(side, 0, side, theme.dp(4));
        retryLine.addView(retry);
        View songRow = row(activity, theme, side, "Song removal", PatchSettings.SONG_REMOVAL, songStatus, rowLook);
        ViewGroup songTexts = (ViewGroup) ((ViewGroup) songRow).getChildAt(0);
        TextView songName = (TextView) songTexts.getChildAt(0);
        songTexts.addView(songDetail);
        if (Included.songRemoval()) {
            section.addView(songRow);
            section.addView(retryLine);
        }

        TextView unlockStatus = status(activity, theme);
        if (Included.qualityUnlock()) {
            section.addView(row(activity, theme, side, "Quality unlock", PatchSettings.QUALITY_UNLOCK, unlockStatus, rowLook));
        }
        if (Included.highestQuality()) {
            section.addView(row(activity, theme, side, "Highest quality", PatchSettings.HIGHEST_QUALITY, null, rowLook));
        }

        Runnable[] tick = new Runnable[1];
        boolean[] ticking = {false}; // only a countdown's number changed: no need to lay the sheet out again
        Runnable showSong = () -> {
            boolean on = PatchSettings.songRemoval();
            SongRemoval.Status s = SongRemoval.status();
            // (a past broadcast's switch is its own: switching it on doesn't switch on its channel)
            // (it's set per stream: the switch says for which, so another stream's Off doesn't look like a reset)
            String channel = PatchSettings.watchingChannel();
            songName.setText(PatchSettings.watchingVideo() ? "Song removal for this video"
                    : channel != null ? "Song removal for " + channel : "Song removal");
            long now = SystemClock.elapsedRealtime();
            SongLines lines = SongLines.of(s, now);
            // (nothing under way: listening, as the song pill says)
            show(songStatus, on ? (lines.status != null ? lines.status : StatusWords.LISTENING) : null,
                    on && s.problem != null, theme);
            show(songDetail, on ? lines.detail : null, false, theme);
            // a countdown: shown again at its next number
            section.removeCallbacks(tick[0]);
            if (on && lines.nextTick >= 0 && section.isAttachedToWindow()) section.postDelayed(tick[0], lines.nextTick);
            // Retry: only when there's a song to forget or a problem to try past
            boolean retryable = on && Included.songRemoval() && (s.filtering || s.problem != null);
            retryLine.setVisibility(retryable ? View.VISIBLE : View.GONE);
            // (removing a song: the button forgets it and starts over; after a problem: it tries again)
            retry.setText(s.problem == null && s.filtering ? "Restart" : "Retry");
            if (!ticking[0]) relayout(section);
        };
        Runnable showUnlock = () -> {
            boolean on = PatchSettings.qualityUnlock();
            QualityUnlock.Status s = QualityUnlock.status();
            String text = on ? s.text : null;
            show(unlockStatus, text, on && s.problem, theme);
            relayout(section);
        };
        tick[0] = () -> {
            ticking[0] = true;
            try {
                showSong.run();
            } finally {
                ticking[0] = false;
            }
        };
        showSong.run();
        showUnlock.run();
        SongRemoval.StatusListener songListener = s -> showSong.run();
        QualityUnlock.StatusListener unlockListener = s -> showUnlock.run();
        PatchSettings.Listener settingsListener = (key, on) -> App.onMain(() -> {
            showSong.run();
            showUnlock.run();
        });
        section.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
                SongRemoval.addListener(songListener);
                QualityUnlock.addListener(unlockListener);
                PatchSettings.addListener(settingsListener);
                showSong.run(); // (what changed while it was away, and its countdown going again)
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
                SongRemoval.removeListener(songListener);
                QualityUnlock.removeListener(unlockListener);
                PatchSettings.removeListener(settingsListener);
                section.removeCallbacks(tick[0]);
            }
        });
        return section;
    }

    /** Where a sheet row starts, from the left of the scrolling list, measured on screen. */
    private static int leftEdge(View row) {
        View list = row;
        while (list.getParent() instanceof View && !(list.getParent() instanceof ScrollView)) list = (View) list.getParent();
        int[] rowAt = new int[2], listAt = new int[2];
        row.getLocationOnScreen(rowAt);
        list.getLocationOnScreen(listAt);
        return Math.max(0, rowAt[0] - listAt[0]) + row.getPaddingLeft();
    }

    /** The section's lines changed: React Native doesn't measure it again, so it's placed again here. */
    private static void relayout(View section) {
        if (section.getTag() != SECTION_TAG) return; // in a sheet of its own: laid out as usual
        section.post(() -> {
            if (section.getParent() instanceof ViewGroup) place((ViewGroup) section.getParent(), section);
        });
    }

    /** Song removal's lines in the Options: what it does (or a problem's few words), and a problem's sentence. */
    static final class SongLines {
        final String status, detail;
        final long nextTick; // ms until a countdown shows its next number, -1: none

        private SongLines(String status, String detail, long nextTick) {
            this.status = status;
            this.detail = detail;
            this.nextTick = nextTick;
        }

        static SongLines of(SongRemoval.Status s, long nowMs) {
            return of(s.step, s.stepEndsAt, s.problem, s.problemEndsAt, nowMs);
        }

        static SongLines of(String step, long stepEndsAt, String problem, long problemEndsAt, long nowMs) {
            if (problem == null) {
                return new SongLines(step == null ? null : StatusWords.counting(step, stepEndsAt, nowMs), null,
                        StatusWords.nextTick(stepEndsAt, nowMs));
            }
            String words = StatusWords.words(problem), detail = StatusWords.detail(problem);
            return new SongLines(StatusWords.counting(words, problemEndsAt, nowMs), detail.equals(words) ? null : detail,
                    StatusWords.nextTick(problemEndsAt, nowMs));
        }
    }

    private static TextView status(Context context, Theme theme) {
        TextView status = new TextView(context);
        status.setTextSize(14);
        status.setTypeface(TwitchFonts.regular(context));
        status.setLineSpacing(0, 1.1f);
        status.setMaxLines(3);
        status.setEllipsize(TextUtils.TruncateAt.END);
        status.setPadding(0, theme.dp(2), 0, 0);
        return status;
    }

    private static void show(TextView view, String text, boolean problem, Theme theme) {
        view.setVisibility(text == null || text.isEmpty() ? View.GONE : View.VISIBLE);
        view.setText(text);
        view.setTextColor(problem ? theme.danger : theme.secondary);
    }

    /** A text takes the look (size, font, color) of one of the sheet's own, when there's one to go by. */
    private static void lookOf(TextView look, TextView text) {
        if (look == null) return;
        text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, look.getTextSize());
        text.setTypeface(look.getTypeface());
        text.setTextColor(look.getTextColors());
        text.setLetterSpacing(look.getLetterSpacing());
    }

    private static View row(Context context, Theme theme, int side, String title, String key, TextView status,
                            TextView look) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(side, theme.dp(10), side, theme.dp(10));
        row.setMinimumHeight(theme.dp(52));

        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        TextView name = new TextView(context);
        name.setText(title);
        name.setTextColor(theme.text);
        name.setTextSize(15);
        name.setTypeface(TwitchFonts.semiBold(context)); // as the sheet's own row titles
        lookOf(look, name);
        // As tall as the sheet's own row it takes its look from (its text's row), not taller.
        if (look != null && look.getParent() instanceof View && ((View) look.getParent()).getHeight() > 0) {
            row.setMinimumHeight(((View) look.getParent()).getHeight());
            row.setPadding(side, theme.dp(4), side, theme.dp(4));
        }
        texts.addView(name);
        if (status != null) texts.addView(status);
        LinearLayout.LayoutParams textArea = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
        textArea.rightMargin = theme.dp(12);
        row.addView(texts, textArea);

        // Android's own switch, in the colors of the sheet's switches (React Native draws them the same way).
        Switch toggle = new Switch(context);
        toggle.setChecked(PatchSettings.get(key));
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[]{0xFF5C16C5, theme.dark ? 0xFFADADB8 : 0xFFFFFFFF}));
        toggle.setTrackTintList(new ColorStateList(states, new int[]{0xFFA970FF, theme.dark ? 0xFF53535F : 0xFF3A3A3D}));
        toggle.setContentDescription(title);
        boolean[] syncing = {false};
        toggle.setOnCheckedChangeListener((button, on) -> {
            if (syncing[0]) return;
            PatchSettings.set(key, on);
            DebugLog.log("Player Options: " + title + (on ? " on" : " off"));
        });
        row.addView(toggle);
        // Only a tap on the row switches it: the switch itself takes no touches (it would also switch on a sideways
        // drag, which a swipe scrolling the sheet can start on it).
        toggle.setClickable(false);
        toggle.setFocusable(false);
        row.setOnClickListener(v -> toggle.toggle());
        PatchSettings.Listener sync = (changed, on) -> {
            if (!changed.equals(key)) return;
            App.onMain(() -> {
                syncing[0] = true;
                toggle.setChecked(on);
                syncing[0] = false;
            });
        };
        row.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
                PatchSettings.addListener(sync);
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
                PatchSettings.removeListener(sync);
            }
        });
        return row;
    }
}
