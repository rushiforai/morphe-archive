package app.morphed.extension.twitch.settings;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.InsetDrawable;
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
        if (testIdKey == 0) {
            testIdKey = activity.getResources().getIdentifier("react_test_id", "id", activity.getPackageName());
            if (testIdKey == 0) testIdKey = -1;
        }
        if (testIdKey < 0) return;
        if (!Included.adBlock() && !Included.songRemoval() && !Included.qualityUnlock()) return;
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
        section.addView(header);

        if (Included.adBlock()) section.addView(row(activity, theme, side, "Ad blocker", PatchSettings.AD_BLOCK, null));

        TextView songStatus = status(activity, theme);
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
        View songRow = row(activity, theme, side, "Song removal", PatchSettings.SONG_REMOVAL, songStatus);
        TextView songName = (TextView) ((ViewGroup) ((ViewGroup) songRow).getChildAt(0)).getChildAt(0);
        if (Included.songRemoval()) {
            section.addView(songRow);
            section.addView(retryLine);
        }

        TextView unlockStatus = status(activity, theme);
        if (Included.qualityUnlock()) {
            section.addView(row(activity, theme, side, "Quality unlock", PatchSettings.QUALITY_UNLOCK, unlockStatus));
        }

        Runnable showSong = () -> {
            boolean on = PatchSettings.songRemoval();
            SongRemoval.Status s = SongRemoval.status();
            // (a past broadcast's switch is its own: switching it on doesn't switch on its channel)
            songName.setText(PatchSettings.watchingVideo() ? "Song removal for this video" : "Song removal");
            String text = !on ? null : s.problem != null ? s.problem : s.step;
            show(songStatus, text, on && s.problem != null, theme);
            // Retry: only when there's a song to forget or a problem to try past
            boolean retryable = on && Included.songRemoval() && (s.filtering || s.problem != null);
            retryLine.setVisibility(retryable ? View.VISIBLE : View.GONE);
            relayout(section);
        };
        Runnable showUnlock = () -> {
            boolean on = PatchSettings.qualityUnlock();
            QualityUnlock.Status s = QualityUnlock.status();
            String text = on ? s.text : null;
            show(unlockStatus, text, on && s.problem, theme);
            relayout(section);
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
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
                SongRemoval.removeListener(songListener);
                QualityUnlock.removeListener(unlockListener);
                PatchSettings.removeListener(settingsListener);
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

    private static View row(Context context, Theme theme, int side, String title, String key, TextView status) {
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
