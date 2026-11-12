/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;

/**
 * The lyrics panel. It covers the player sheet from the top of the screen down to the player's
 * controls, in the player's own colors, and follows the song that's playing: a new song brings
 * its own lyrics. The line being sung is highlighted and kept in the middle, except for a few
 * seconds after the list is touched. The close button or Back closes it, and it goes away with
 * the player.
 */
@SuppressLint("ViewConstructor")
final class LyricsPanel extends FrameLayout {
    private static final long TICK_MS = 250;
    /** How long after a touch the list stays where it was scrolled to. */
    private static final long HOLD_MS = 3000;
    private static final int CACHED = 16;
    /** Lyrics found this session by song, so reopening the panel doesn't search again. */
    private static final Map<Long, LyricsSource.Found> CACHE = new LinkedHashMap<Long, LyricsSource.Found>(CACHED, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<Long, LyricsSource.Found> eldest) {
            return size() > CACHED;
        }
    };
    /** Stands for a song lrclib.net has nothing for, in the cache. */
    private static final LyricsSource.Found NOTHING = new LyricsSource.Found(null, null, false);

    private final ViewGroup host;
    private final View player;
    private final int text;
    private final int faded;
    private final TextView title;
    private final TextView artist;
    private final TextView status;
    private final ScrollView scroll;
    private final LinearLayout lines;
    private final View.OnLayoutChangeListener track = (v, l, t, r, b, ol, ot, or, ob) -> post(this::place);
    private final Runnable tick = this::tick;

    private long song;
    private int search;
    private List<LyricsSource.Line> timed;
    private int current = -1;
    private long touched;

    /** Opens the panel over the player that [clicked] belongs to, or brings an open one forward. */
    static void open(ViewGroup container, View clicked) {
        View player = playerOf(clicked);
        if (player == null) {
            HookStatus.threw(FamilyNames.LYRICS, "lyrics panel", new IllegalStateException("no player found"));
            return;
        }
        ViewGroup host = container instanceof FrameLayout && contains(container, player)
                ? container : (ViewGroup) player.getParent();
        for (int i = host.getChildCount() - 1; i >= 0; i--) {
            if (host.getChildAt(i) instanceof LyricsPanel) host.removeViewAt(i);
        }
        LyricsPanel panel = new LyricsPanel(host, player);
        host.addView(panel, new FrameLayout.LayoutParams(0, 0, Gravity.TOP | Gravity.LEFT));
        panel.place();
        panel.requestFocus();
        HookStatus.counted(FamilyNames.LYRICS, "lyrics opened");
    }

    /**
     * The player's controls: going up from the menu button, the first view that sits at the bottom
     * of a frame below something else and is tall enough for the title, the seek bar and the buttons.
     */
    static View playerOf(View clicked) {
        float density = clicked.getResources().getDisplayMetrics().density;
        View view = clicked;
        ViewParent parent = view.getParent();
        while (parent instanceof ViewGroup) {
            ViewGroup frame = (ViewGroup) parent;
            if (frame instanceof FrameLayout && view.getTop() > 0
                    && view.getBottom() == frame.getHeight() - frame.getPaddingBottom()
                    && view.getHeight() >= 120 * density) {
                return view;
            }
            view = frame;
            parent = view.getParent();
        }
        return null;
    }

    private static boolean contains(ViewGroup group, View view) {
        for (ViewParent parent = view.getParent(); parent != null; parent = parent.getParent()) {
            if (parent == group) return true;
        }
        return false;
    }

    private LyricsPanel(ViewGroup host, View player) {
        super(host.getContext());
        this.host = host;
        this.player = player;
        int background = backgroundOf(player);
        text = textColorOf(player, background);
        faded = (text & 0x00FFFFFF) | 0x80000000;

        GradientDrawable shape = new GradientDrawable();
        shape.setColor(background);
        float corner = dp(12);
        shape.setCornerRadii(new float[] {corner, corner, corner, corner, 0, 0, 0, 0});
        setBackground(shape);
        setClickable(true);
        setFocusableInTouchMode(true);

        LinearLayout column = new LinearLayout(getContext());
        column.setOrientation(LinearLayout.VERTICAL);
        addView(column, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

        LinearLayout header = new LinearLayout(getContext());
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(dp(20), dp(12), dp(8), dp(4));
        column.addView(header, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        LinearLayout names = new LinearLayout(getContext());
        names.setOrientation(LinearLayout.VERTICAL);
        header.addView(names, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1));
        title = label(17, text);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        names.addView(title);
        artist = label(14, faded);
        names.addView(artist);
        header.addView(closeButton(), new LinearLayout.LayoutParams(dp(48), dp(48)));

        status = new TextView(getContext());
        status.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        status.setTextColor(faded);
        status.setGravity(Gravity.CENTER);
        status.setPadding(dp(24), dp(24), dp(24), dp(24));
        column.addView(status, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 0, 1));

        scroll = new ScrollView(getContext());
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setVisibility(GONE);
        lines = new LinearLayout(getContext());
        lines.setOrientation(LinearLayout.VERTICAL);
        lines.setPadding(0, dp(8), 0, dp(8));
        scroll.addView(lines, new ScrollView.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        column.addView(scroll, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 0, 1));

        TextView credit = label(12, faded);
        credit.setText(L10n.t("Lyrics from lrclib.net"));
        credit.setPadding(dp(20), dp(4), dp(20), dp(10));
        column.addView(credit);
    }

    private TextView label(int sp, int color) {
        TextView label = new TextView(getContext());
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        label.setTextColor(color);
        label.setSingleLine(true);
        label.setEllipsize(TextUtils.TruncateAt.END);
        return label;
    }

    private View closeButton() {
        Context context = getContext();
        int id = context.getResources().getIdentifier("ic_close_white", "drawable", context.getPackageName());
        Drawable cross = null;
        try {
            if (id != 0) cross = context.getDrawable(id);
        } catch (RuntimeException missing) {
            cross = null;
        }
        View button;
        if (cross != null) {
            ImageView image = new ImageView(context);
            cross = cross.mutate();
            cross.setTint(text);
            image.setImageDrawable(cross);
            image.setScaleType(ImageView.ScaleType.CENTER);
            button = image;
        } else {
            TextView word = label(14, text);
            word.setText(L10n.t("Close"));
            word.setGravity(Gravity.CENTER);
            button = word;
        }
        button.setContentDescription(L10n.t("Close"));
        button.setOnClickListener(v -> close());
        return button;
    }

    /** Puts the panel over the sheet, from below the status bar down to the player's top edge. */
    private void place() {
        if (getParent() != host || !player.isAttachedToWindow()) return;
        int[] at = new int[2];
        int[] controls = new int[2];
        host.getLocationInWindow(at);
        player.getLocationInWindow(controls);
        WindowInsets insets = host.getRootWindowInsets();
        int bar = insets == null ? 0 : insets.getSystemWindowInsetTop();
        int top = Math.max(0, bar - at[1]) + dp(8);
        int bottom = controls[1] - at[1];
        LayoutParams params = (LayoutParams) getLayoutParams();
        int width = player.getWidth();
        int height = Math.max(dp(120), bottom - top);
        int left = controls[0] - at[0];
        if (params.width == width && params.height == height && params.leftMargin == left && params.topMargin == top) return;
        params.width = width;
        params.height = height;
        params.leftMargin = left;
        params.topMargin = top;
        setLayoutParams(params);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        player.addOnLayoutChangeListener(track);
        tick();
    }

    @Override
    protected void onDetachedFromWindow() {
        player.removeOnLayoutChangeListener(track);
        removeCallbacks(tick);
        super.onDetachedFromWindow();
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent event) {
        touched = SystemClock.uptimeMillis();
        return super.dispatchTouchEvent(event);
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (event.getKeyCode() == KeyEvent.KEYCODE_BACK) {
            if (event.getAction() == KeyEvent.ACTION_UP && !event.isCanceled()) close();
            return true;
        }
        return super.dispatchKeyEvent(event);
    }

    private void close() {
        removeCallbacks(tick);
        ViewParent parent = getParent();
        if (parent instanceof ViewGroup) ((ViewGroup) parent).removeView(this);
    }

    /** Follows the song that's playing: new lyrics for a new song, the highlight for the same one. */
    private void tick() {
        removeCallbacks(tick);
        if (!isAttachedToWindow()) return;
        try {
            Object playing = Lyrics.playing();
            if (playing != null) {
                long id = Lyrics.documentId(playing);
                if (id != song) load(playing, id);
                else if (timed != null) follow(playing);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LYRICS, "lyrics panel", failure);
            return;
        }
        postDelayed(tick, TICK_MS);
    }

    private void load(Object playing, long id) {
        song = id;
        int mine = ++search;
        String name = Lyrics.title(playing);
        String by = Lyrics.author(playing);
        double seconds = Lyrics.duration(playing);
        if (seconds <= 0) seconds = Lyrics.playerDuration(playing);
        title.setText(TextUtils.isEmpty(name) ? L10n.t("Lyrics") : name);
        artist.setText(by == null ? "" : by);
        artist.setVisibility(TextUtils.isEmpty(by) ? GONE : VISIBLE);
        LyricsSource.Found known;
        synchronized (CACHE) {
            known = CACHE.get(id);
        }
        if (known != null) {
            show(known);
            return;
        }
        state(L10n.t("Looking for the lyrics."), false);
        double length = seconds;
        boolean queued = Utils.runOnBackgroundThread(() -> {
            LyricsSource.Found found;
            try {
                found = LyricsSource.fetch(name, by, length);
            } catch (Exception failure) {
                Utils.runOnMainThread(() -> failed(mine));
                return;
            }
            LyricsSource.Found result = found == null ? NOTHING : found;
            synchronized (CACHE) {
                CACHE.put(id, result);
            }
            Utils.runOnMainThread(() -> {
                if (mine == search) show(result);
            });
        });
        if (!queued) failed(mine);
    }

    private void failed(int mine) {
        if (mine != search) return;
        state(L10n.t("Couldn't load the lyrics. Tap to try again."), true);
    }

    private void state(String message, boolean retry) {
        timed = null;
        current = -1;
        scroll.setVisibility(GONE);
        status.setVisibility(VISIBLE);
        status.setText(message);
        status.setOnClickListener(retry ? v -> {
            song = 0;
            tick();
        } : null);
        status.setClickable(retry);
    }

    private void show(LyricsSource.Found found) {
        if (found == NOTHING) {
            state(L10n.t("No lyrics found for this song."), false);
            return;
        }
        if (found.instrumental) {
            state(L10n.t("This song is instrumental."), false);
            return;
        }
        lines.removeAllViews();
        current = -1;
        timed = found.lines;
        if (timed != null) {
            for (LyricsSource.Line line : timed) lines.addView(line(line.text, faded));
        } else {
            lines.addView(line(found.plain, text));
        }
        status.setVisibility(GONE);
        scroll.setVisibility(VISIBLE);
        scroll.scrollTo(0, 0);
    }

    private TextView line(String words, int color) {
        TextView line = new TextView(getContext());
        line.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        line.setTextColor(color);
        line.setText(words);
        line.setPadding(dp(20), dp(6), dp(20), dp(6));
        line.setLineSpacing(0, 1.1f);
        return line;
    }

    private void follow(Object playing) {
        double seconds = Lyrics.duration(playing);
        if (seconds <= 0) seconds = Lyrics.playerDuration(playing);
        long ms = (long) (Lyrics.progress(playing) * seconds * 1000);
        int now = LyricsSource.at(timed, ms);
        if (now == current) return;
        if (current >= 0 && current < lines.getChildCount()) mark((TextView) lines.getChildAt(current), false);
        current = now;
        if (now < 0 || now >= lines.getChildCount()) return;
        TextView line = (TextView) lines.getChildAt(now);
        mark(line, true);
        if (SystemClock.uptimeMillis() - touched > HOLD_MS) {
            int middle = line.getTop() + line.getHeight() / 2 - scroll.getHeight() / 2;
            scroll.smoothScrollTo(0, Math.max(0, middle));
        }
    }

    private void mark(TextView line, boolean sung) {
        line.setTextColor(sung ? text : faded);
        line.setTypeface(sung ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
    }

    /** The player's own background color, or the screen's when it has none. */
    static int backgroundOf(View player) {
        for (View view = player; view != null; view = view.getParent() instanceof View ? (View) view.getParent() : null) {
            Drawable background = view.getBackground();
            if (background instanceof ColorDrawable && Color.alpha(((ColorDrawable) background).getColor()) > 0) {
                return ((ColorDrawable) background).getColor() | 0xFF000000;
            }
        }
        return Utils.isDarkModeEnabled() ? 0xFF1C1C1E : Color.WHITE;
    }

    /** The color of the player's song title, or black or white against [background]. */
    static int textColorOf(View player, int background) {
        TextView first = firstText(player, 0);
        if (first != null) return first.getCurrentTextColor() | 0xFF000000;
        return SideMenuPanel.luminance(background) > 0.5f ? 0xFF000000 : Color.WHITE;
    }

    private static TextView firstText(View view, int depth) {
        if (view.getVisibility() != VISIBLE || depth > 6) return null;
        if (view instanceof TextView) return TextUtils.isEmpty(((TextView) view).getText()) ? null : (TextView) view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            TextView inside = firstText(group.getChildAt(i), depth + 1);
            if (inside != null) return inside;
        }
        return null;
    }

    private int dp(float value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
