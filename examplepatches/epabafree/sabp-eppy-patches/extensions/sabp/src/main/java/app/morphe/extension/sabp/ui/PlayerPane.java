package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyBookmarks;
import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.EppyTheme;
import app.morphe.extension.sabp.read.BookText;
import app.morphe.extension.sabp.read.ReadAlong;

/**
 * Now Playing: cover (styled per skin), title, seek bar, circular play button, chips, and the
 * player sheet (Chapters / Read along / Bookmarks / Details / Up next) that drags up from the
 * bottom. Used as an overlay on phones and as a persistent side pane on large screens.
 */
public final class PlayerPane implements EppyBookmarks.Listener {
    private final Host host;
    private final Context c;
    private final EppyTheme t;
    private final boolean embedded;
    public final FrameLayout root;
    private final PlayerSheet sheet;

    private final ImageView cover;
    private final FrameLayout coverFrame;
    private final RingCover ring;
    private final TextView transcript;
    private final TextView title, chapter, elapsed, remaining, bookLine, subtitle;
    private final EppySlider slider;
    private final PlayButton play;
    private final LinearLayout chipRow;
    private LinearLayout bookmarkChip;
    private Boolean bookmarkShown;
    private Bitmap lastCover;
    private String lastChapter;
    private boolean lastPlaying;
    private String lastSpeedLabel, lastSleepLabel;
    private LinearLayout sleepChip;
    /** Book second where the seek bar's chapter starts, or -1 when it shows SABP's own range. */
    private int chapterStart = -1;
    private long sliderDur;
    private int coverSize;

    public PlayerPane(Host host, boolean embedded) {
        this.host = host;
        this.c = host.activity();
        this.t = host.theme().playerTheme();
        this.embedded = embedded;

        root = new FrameLayout(c);
        root.setBackground(embedded ? new android.graphics.drawable.ColorDrawable(t.surfaceContainerLow) : t.background());
        root.setClickable(true);

        ScrollView scroll = new ScrollView(c);
        scroll.setFillViewport(true);
        LinearLayout col = Ui.column(c);
        col.setGravity(Gravity.CENTER_HORIZONTAL);
        sheet = new PlayerSheet(host, t);
        col.setPadding(Ui.dp(c, 24), Ui.dp(c, 8), Ui.dp(c, 24), sheet.peekHeight() + Ui.dp(c, 16));
        scroll.addView(col, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(scroll, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // Top app bar.
        LinearLayout bar = Ui.row(c);
        if (!embedded) bar.addView(Ui.iconButton(c, t, EppyIcon.CHEVRON_DOWN, t.onSurface, 0, "Collapse player", v -> host.closePlayer()));
        else bar.addView(Ui.space(c, 48, 48));
        TextView label = Ui.text(c, t, "Now Playing", 16, 600, t.onSurface);
        label.setGravity(Gravity.CENTER);
        label.setAccessibilityHeading(true);
        bar.addView(label, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        bar.addView(Ui.iconButton(c, t, EppyIcon.LOCK, t.onSurface, 0, "Lock the player controls", v -> setLocked(true)));
        bar.addView(Ui.iconButton(c, t, EppyIcon.CAST, t.onSurface, 0, "Audio output and cast", v -> ControlsPanels.showOutputSwitcher(host)));
        bar.addView(Ui.iconButton(c, t, EppyIcon.MORE, t.onSurface, 0, "More options", v -> host.showMoreSheet()));
        col.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // Cover area, styled by skin.
        coverFrame = new FrameLayout(c);
        ring = t.playerStyle == EppyTheme.PLAYER_RING ? new RingCover(c, t) : null;
        if (ring != null) coverFrame.addView(ring, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        else if (t.playerStyle == EppyTheme.PLAYER_GLOW) {
            GradientDrawable glow = new GradientDrawable();
            glow.setGradientType(GradientDrawable.RADIAL_GRADIENT);
            glow.setColors(new int[]{EppyTheme.withAlpha(t.primary, t.dark ? 0.38f : 0.28f), EppyTheme.withAlpha(t.primary, 0f)});
            coverFrame.setBackground(glow);
        }
        cover = Ui.cover(c, t, null, t.playerStyle == EppyTheme.PLAYER_RING ? 24 : 28);
        cover.setContentDescription("Book cover");
        if (t.playerStyle == EppyTheme.PLAYER_CARD || t.playerStyle == EppyTheme.PLAYER_TRANSCRIPT) cover.setElevation(Ui.dp(c, 14));
        else cover.setElevation(Ui.dp(c, 6));
        if (ring != null) cover.setRotation(-8f);
        coverFrame.addView(cover);
        transcript = Ui.text(c, t, "", 26, 600, t.onSurface);
        transcript.setLineSpacing(0, 1.18f);
        transcript.setVisibility(View.GONE);
        transcript.setOnClickListener(v -> sheet.show(PlayerSheet.TAB_READ));
        coverFrame.addView(transcript, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        col.addView(coverFrame);
        new CoverGestures(c, t, CoverGestures.playerSeeker(c, host.player()), coverFrame, () -> {
            // Single tap: like the classic player's cover, play/pause (the transcript opens Read along).
            if (transcript.getVisibility() == View.VISIBLE) sheet.show(PlayerSheet.TAB_READ);
            else {
                Ui.haptic(coverFrame, t);
                host.player().playPause();
            }
        });

        title = Ui.text(c, t, "", 25, 650, t.onSurface);
        title.setGravity(Gravity.CENTER);
        title.setMaxLines(2);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        title.setAccessibilityHeading(true);
        LinearLayout.LayoutParams tl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        tl.topMargin = Ui.dp(c, 18);
        col.addView(title, tl);

        chapter = Ui.singleLine(Ui.text(c, t, "", 15, 400, t.onSurfaceVariant));
        chapter.setGravity(Gravity.CENTER);
        chapter.setBackground(Ui.ripple(t, null, Ui.dp(c, 12)));
        chapter.setPadding(Ui.dp(c, 8), Ui.dp(c, 4), Ui.dp(c, 8), Ui.dp(c, 4));
        chapter.setOnClickListener(v -> sheet.show(PlayerSheet.TAB_CHAPTERS));
        LinearLayout.LayoutParams cl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cl.topMargin = Ui.dp(c, 4);
        col.addView(chapter, cl);

        bookLine = Ui.singleLine(Ui.text(c, t, "", 12, 600, t.progressColor));
        bookLine.setGravity(Gravity.CENTER);
        bookLine.setLetterSpacing(0.04f);
        col.addView(bookLine, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        subtitle = Ui.text(c, t, "", 15, 500, t.onSurface);
        subtitle.setGravity(Gravity.CENTER);
        subtitle.setMaxLines(3);
        subtitle.setVisibility(View.GONE);
        subtitle.setPadding(0, Ui.dp(c, 8), 0, 0);
        subtitle.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        subtitle.setOnClickListener(v -> ControlsPanels.showSubtitles(host));
        col.addView(subtitle, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        slider = new EppySlider(c);
        slider.apply(t, t.waveformSeekBar);
        LinearLayout.LayoutParams sl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 56));
        sl.topMargin = Ui.dp(c, 16);
        col.addView(slider, sl);
        slider.setListener(new EppySlider.OnSeekListener() {
            @Override
            public void onSeekPreview(long ms) {
                setTimes(ms, sliderDur);
            }

            @Override
            public void onSeek(long ms) {
                EppyPlayer pl = host.player();
                if (chapterStart >= 0) pl.jumpToBook(chapterStart + ms / 1000.0, pl.isPlaying());
                else pl.seekTo(ms);
            }
        });

        LinearLayout times = Ui.row(c);
        elapsed = Ui.text(c, t, "0:00", 13, 600, t.progressColor);
        remaining = Ui.text(c, t, "", 13, 500, t.onSurfaceVariant);
        remaining.setGravity(Gravity.END);
        times.addView(elapsed, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        times.addView(remaining, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        times.setPadding(Ui.dp(c, 4), 0, Ui.dp(c, 4), 0);
        col.addView(times, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // Transport controls.
        LinearLayout controls = Ui.row(c);
        controls.setGravity(Gravity.CENTER);
        controls.addView(Ui.iconButton(c, t, EppyIcon.SKIP_PREV, t.onSurface, 0, "Previous chapter",
                v -> host.player().skipChapter(-1)));
        controls.addView(Ui.space(c, 4, 1));
        controls.addView(sideButton(EppyIcon.REWIND, "Rewind", EppyBridge.ACTION_REWIND_SMALL, EppyBridge.ACTION_REWIND_BIG, false));
        controls.addView(Ui.space(c, 14, 1));
        play = new PlayButton(c);
        play.apply(t);
        play.setOnClickListener(v -> {
            Ui.haptic(v, t);
            host.player().playPause();
        });
        controls.addView(play, new LinearLayout.LayoutParams(Ui.dp(c, 84), Ui.dp(c, 84)));
        controls.addView(Ui.space(c, 14, 1));
        controls.addView(sideButton(EppyIcon.FORWARD, "Fast forward", EppyBridge.ACTION_FWD_SMALL, EppyBridge.ACTION_FWD_BIG, true));
        controls.addView(Ui.space(c, 4, 1));
        controls.addView(Ui.iconButton(c, t, EppyIcon.SKIP_NEXT, t.onSurface, 0, "Next chapter",
                v -> host.player().skipChapter(1)));
        LinearLayout.LayoutParams ctl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        ctl.topMargin = Ui.dp(c, 12);
        col.addView(controls, ctl);

        // Secondary controls as chips.
        HorizontalScrollView chipScroll = new HorizontalScrollView(c);
        chipScroll.setHorizontalScrollBarEnabled(false);
        chipRow = Ui.row(c);
        chipScroll.addView(chipRow);
        LinearLayout.LayoutParams chl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        chl.topMargin = Ui.dp(c, 20);
        chl.gravity = Gravity.CENTER_HORIZONTAL;
        col.addView(chipScroll, chl);

        // Player sheet.
        sheet.setTab(PlayerSheet.TAB_CHAPTERS, new SheetTabs.Chapters(host, t));
        sheet.setTab(PlayerSheet.TAB_READ, new ReadTab(host, t));
        sheet.setTab(PlayerSheet.TAB_BOOKMARKS, new SheetTabs.Bookmarks(host, t));
        sheet.setTab(PlayerSheet.TAB_DETAILS, new SheetTabs.Details(host, t));
        sheet.setTab(PlayerSheet.TAB_UP_NEXT, new SheetTabs.UpNext(host, t));
        root.addView(sheet.root, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        EppyBookmarks.get(c).addListener(this);
        buildChips();
        update(true);
    }

    /** Skip button: tap = SABP's short skip, long-press = its long skip, caption shows both. */
    private View sideButton(int icon, String desc, String action, String bigAction, boolean forward) {
        boolean boxed = t.playShape == PlayButton.SHAPE_ROUNDED_SQUARE;
        int small = app.morphe.extension.sabp.SabpPrefs.smallSeconds(c), big = app.morphe.extension.sabp.SabpPrefs.bigSeconds(c);
        FrameLayout b = Ui.iconButton(c, t, icon, t.onSecondaryContainer, 0, desc + " " + small + " seconds", v -> host.player().command(action));
        int bg = boxed ? t.surfaceContainerHigh : t.secondaryContainer;
        b.setBackground(Ui.ripple(t, Ui.rounded(bg, Ui.dp(c, boxed ? 16 : 28)), Ui.dp(c, boxed ? 16 : 28)));
        if (t.playShape == PlayButton.SHAPE_OUTLINE_CIRCLE) b.setBackground(Ui.ripple(t, Ui.outlined(0, t.outline, Ui.dp(c, 1), Ui.dp(c, 28)), Ui.dp(c, 28)));
        ((ImageView) b.getChildAt(0)).setImageDrawable(new EppyIcon(icon, boxed || t.playShape == PlayButton.SHAPE_OUTLINE_CIRCLE ? t.onSurface : t.onSecondaryContainer));
        b.getChildAt(0).setLayoutParams(new FrameLayout.LayoutParams(Ui.dp(c, 28), Ui.dp(c, 28), Gravity.CENTER));
        b.setOnLongClickListener(v -> {
            Ui.haptic(v, t);
            host.player().command(bigAction);
            root.announceForAccessibility((forward ? "Forward " : "Back ") + skipLabel(big));
            return true;
        });
        b.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View h, android.view.accessibility.AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(h, info);
                info.addAction(new android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction(
                        android.view.accessibility.AccessibilityNodeInfo.ACTION_LONG_CLICK, (forward ? "Forward " : "Back ") + skipLabel(big)));
            }
        });
        LinearLayout col = Ui.column(c);
        col.setGravity(Gravity.CENTER_HORIZONTAL);
        col.addView(b, new LinearLayout.LayoutParams(Ui.dp(c, 56), Ui.dp(c, 56)));
        TextView cap = Ui.label(c, t, skipLabel(small) + " · hold " + skipLabel(big), 11, 500, t.onSurfaceVariant);
        cap.setIncludeFontPadding(false);
        cap.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams cl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cl.topMargin = Ui.dp(c, 4);
        col.addView(cap, cl);
        return col;
    }

    private static String skipLabel(int s) {
        return s >= 60 && s % 60 == 0 ? (s / 60) + " min" : s + " s";
    }

    // ---- lock -----------------------------------------------------------------------------------

    private View lockOverlay;

    /** Locks the player controls (the classic lock): touches are ignored until press-and-hold. */
    private void setLocked(boolean on) {
        if (on && lockOverlay == null) {
            FrameLayout o = new FrameLayout(c);
            o.setClickable(true);
            o.setBackgroundColor(EppyTheme.withAlpha(0xFF000000, 0.15f));
            TextView hint = Ui.text(c, t, "Controls locked · press and hold to unlock", 14, 600, 0xFFFFFFFF);
            hint.setBackground(Ui.rounded(0xCC000000, Ui.dp(c, 20)));
            hint.setPadding(Ui.dp(c, 16), Ui.dp(c, 10), Ui.dp(c, 16), Ui.dp(c, 10));
            FrameLayout.LayoutParams hl = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.CENTER_HORIZONTAL | Gravity.TOP);
            hl.topMargin = Ui.dp(c, 64);
            o.addView(hint, hl);
            o.setOnLongClickListener(v -> {
                setLocked(false);
                return true;
            });
            o.setContentDescription("Player locked. Press and hold to unlock.");
            root.addView(o, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            lockOverlay = o;
            root.announceForAccessibility("Player locked");
        } else if (!on && lockOverlay != null) {
            root.removeView(lockOverlay);
            lockOverlay = null;
            root.announceForAccessibility("Player unlocked");
        }
    }

    private void buildChips() {
        chipRow.removeAllViews();
        EppyPlayer pl = host.player();
        lastSpeedLabel = PlaybackPanels.formatSpeed(pl.canSetSpeed() ? pl.bookSpeed() : pl.speed());
        LinearLayout speedChip = Ui.chip(c, t, EppyIcon.SPEED, lastSpeedLabel, false, "0.75×", v -> {
            if (pl.canSetSpeed()) {
                float next = pl.nextSpeed(PlaybackPanels.speedCycle(c));
                pl.setSpeed(next, pl.skipSilence());
                lastSpeedLabel = PlaybackPanels.formatSpeed(next);
                buildChips();
                root.announceForAccessibility("Speed " + lastSpeedLabel);
            } else {
                pl.command(EppyBridge.ACTION_TOGGLE_SPEED);
            }
        });
        speedChip.setOnLongClickListener(v -> {
            PlaybackPanels.showSpeed(host, this::buildChips);
            return true;
        });
        speedChip.setContentDescription("Speed " + lastSpeedLabel + ". Double-tap for the next speed, double-tap and hold for the speed panel.");
        addChip(speedChip);

        boolean sleepOn = pl.sleepActive();
        lastSleepLabel = sleepLabel();
        sleepChip = Ui.chip(c, t, EppyIcon.MOON, lastSleepLabel, sleepOn, "End of ch.", v -> {
            if (pl.sleepActive()) pl.stopSleep();
            else pl.startSleep(app.morphe.extension.sabp.SabpPrefs.sleepMinutes(c));
            root.postDelayed(this::buildChips, 300);
        });
        sleepChip.setOnLongClickListener(v -> {
            PlaybackPanels.showSleep(host, () -> root.postDelayed(this::buildChips, 300));
            return true;
        });
        sleepChip.setContentDescription("Sleep timer " + (sleepOn ? lastSleepLabel : "off") + ". Double-tap to turn " + (sleepOn ? "off" : "on") + ", double-tap and hold for options.");
        addChip(sleepChip);

        int boost = app.morphe.extension.sabp.BookControls.boost();
        LinearLayout boostChip = Ui.chip(c, t, boost < 0 ? EppyIcon.VOLUME_DOWN : EppyIcon.VOLUME, ControlsPanels.boostLabel(boost), boost != 0, "Boost 3",
                v -> ControlsPanels.cycleBoost(host, this::buildChips));
        boostChip.setOnLongClickListener(v -> {
            ControlsPanels.showBoost(host, this::buildChips);
            return true;
        });
        addChip(boostChip);
        boolean eqOn = !app.morphe.extension.sabp.BookControls.equalizer().flat();
        addChip(Ui.chip(c, t, EppyIcon.EQUALIZER, "Equalizer", eqOn, v -> ControlsPanels.showEqualizer(host, this::buildChips)));
        String rep = app.morphe.extension.sabp.BookControls.repeatMode();
        addChip(Ui.chip(c, t, rep != null && rep.startsWith("File") ? EppyIcon.REPEAT_ONE : EppyIcon.REPEAT, rep == null ? "Repeat" : app.morphe.extension.sabp.BookControls.repeatLabel(rep),
                rep != null, v -> ControlsPanels.showRepeat(host, this::buildChips)));
        boolean marked = isBookmarked();
        bookmarkShown = marked;
        bookmarkChip = Ui.chip(c, t, marked ? EppyIcon.BOOKMARK : EppyIcon.BOOKMARK_ADD, marked ? "Remove bookmark" : "Add bookmark", marked,
                "Remove bookmark", v -> host.bookmarkAction(0));
        bookmarkChip.setOnLongClickListener(v -> {
            bookmarkOptions();
            return true;
        });
        addChip(bookmarkChip);
        addChip(Ui.chip(c, t, EppyIcon.LIST, "Chapters", false, v -> sheet.show(PlayerSheet.TAB_CHAPTERS)));
        addChip(Ui.chip(c, t, EppyIcon.LIBRARY, "Read", false, v -> sheet.show(PlayerSheet.TAB_READ)));
    }

    private void bookmarkOptions() {
        new Sheet(host.overlayRoot(), t, "Bookmark")
                .item(EppyIcon.BOOKMARK_ADD, isBookmarked() ? "Remove bookmark at this moment" : "Bookmark this moment", Ui.time(host.player().positionMs()),
                        () -> host.bookmarkAction(0))
                .item(EppyIcon.LIST, "Bookmark the start of this chapter", null, () -> host.bookmarkAction(1))
                .item(EppyIcon.BOOKMARK, "All bookmarks", null, () -> sheet.show(PlayerSheet.TAB_BOOKMARKS))
                .show();
    }

    private boolean isBookmarked() {
        EppyPlayer p = host.player();
        EppyBook b = p.book();
        if (b == null) return false;
        EppyBookmarks bm = EppyBookmarks.get(c);
        bm.sync(b.folderUri, false);
        return bm.at(b.folderUri, b.currentFile, p.filePositionSeconds()) != null;
    }

    @Override
    public void onBookmarksChanged() {
        buildChips();
        sheet.refresh(true);
    }

    private void addChip(View chip) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.rightMargin = Ui.dp(c, 8);
        chipRow.addView(chip, lp);
    }

    /** "Sleep", "9:58" while counting, or "End of ch." */
    private String sleepLabel() {
        EppyPlayer pl = host.player();
        if (!pl.sleepActive()) return "Sleep";
        if (app.morphe.extension.sabp.SabpPrefs.sleepMinutes(c) < 0) return "End of ch.";
        String rem = pl.sleepRemaining();
        return rem != null && !rem.isEmpty() ? rem : "Sleep on";
    }

    /** Sizes the cover to the available width (also called on layout changes). */
    public void layoutCover(int availableWidthPx) {
        int max = Ui.dp(c, embedded ? 300 : 340);
        int size = Math.max(Ui.dp(c, 160), Math.min(max, availableWidthPx - Ui.dp(c, 112)));
        coverSize = size;
        int pad = ring != null ? Ui.dp(c, 44) : Ui.dp(c, 24);
        LinearLayout.LayoutParams fl = new LinearLayout.LayoutParams(size + pad * 2, size + pad * 2);
        fl.topMargin = Ui.dp(c, 4);
        coverFrame.setLayoutParams(fl);
        int coverPx = ring != null ? Math.round(size * 0.62f) : size;
        cover.setLayoutParams(new FrameLayout.LayoutParams(coverPx, coverPx, Gravity.CENTER));
        FrameLayout.LayoutParams tp = new FrameLayout.LayoutParams(size + pad, size + pad, Gravity.CENTER);
        transcript.setLayoutParams(tp);
    }

    private void setTimes(long pos, long dur) {
        elapsed.setText(Ui.time(pos));
        // Time left in real time at the current speed.
        float sp = host.player().speed();
        long left = sp > 0 ? (long) (Math.max(0, dur - pos) / sp) : Math.max(0, dur - pos);
        remaining.setText(dur > 0 ? "-" + Ui.time(left) : "");
        remaining.setContentDescription(dur > 0 ? Ui.duration(left / 1000) + " left in this chapter" + (Math.abs(sp - 1f) > 0.01f ? " at " + PlaybackPanels.formatSpeed(sp) : "") : "");
    }

    /** Back press: close the sheet first. */
    public boolean onBack() {
        if (lockOverlay != null) return true;
        return sheet.onBack();
    }

    public int openSheetTab() {
        return sheet.openTab();
    }

    public void showSheet(int tab) {
        sheet.show(tab);
    }

    /** Refreshes from the player. full = also metadata (cheap per-tick calls pass false). */
    public void update(boolean full) {
        EppyPlayer p = host.player();
        long dur = p.durationMs();
        long pos = p.positionMs();
        long[] cp = p.chapterProgressMs();
        if (cp != null) {
            pos = cp[0];
            dur = cp[1];
            chapterStart = (int) cp[2];
        } else chapterStart = -1;
        sliderDur = dur;
        slider.setProgress(pos, dur);
        slider.setSeekEnabled(p.canSeek() && dur > 0 && (chapterStart < 0 || app.morphe.extension.sabp.EppyBridge.has("jump")));
        setTimes(pos, dur);
        boolean playing = p.isPlaying();
        if (playing != lastPlaying || full) {
            play.setPlaying(playing, !full);
            if (playing != lastPlaying && !full) root.announceForAccessibility(playing ? "Playing" : "Paused");
            lastPlaying = playing;
        }
        float prog = p.bookProgress();
        if (ring != null) ring.setProgress(dur > 0 ? pos / (float) dur : 0f);
        boolean marked = isBookmarked();
        if (!p.sleepActive()) p.restoreSleepDefault();
        String sl = sleepLabel();
        String sp = PlaybackPanels.formatSpeed(p.canSetSpeed() ? p.bookSpeed() : p.speed());
        boolean sleepStateChanged = (lastSleepLabel != null && lastSleepLabel.equals("Sleep")) != sl.equals("Sleep");
        if (bookmarkShown == null || marked != bookmarkShown || sleepStateChanged || !sp.equals(lastSpeedLabel)) buildChips();
        else if (!sl.equals(lastSleepLabel) && sleepChip != null) {
            // Countdown: update the label in place so the row doesn't rebuild every second.
            View last = sleepChip.getChildAt(sleepChip.getChildCount() - 1);
            if (last instanceof TextView) ((TextView) last).setText(sl);
            lastSleepLabel = sl;
        }
        updateTranscript();
        String sub = ControlsPanels.currentSubtitle(p);
        if (sub != null && !sub.equals(subtitle.getText().toString())) subtitle.setText(sub);
        subtitle.setVisibility(sub != null ? View.VISIBLE : View.GONE);
        sheet.refresh(false);
        if (!full) return;

        String book = p.bookTitle();
        String ch = p.chapterTitle();
        title.setText(book != null ? book : "Nothing playing");
        if (ch != null && book != null && ch.equals(book)) ch = null;
        chapter.setText(ch != null ? ch : (book == null ? "Pick a book from your library" : ""));
        chapter.setContentDescription((ch != null ? ch : "") + ". Double-tap for chapters.");
        if (lastChapter != null && ch != null && !ch.equals(lastChapter)) root.announceForAccessibility("Now playing " + ch);
        lastChapter = ch;
        int rem = p.bookRemainingSeconds();
        float bsp = p.speed();
        if (rem > 0 && bsp > 0) rem = Math.round(rem / bsp);
        if (prog >= 0) {
            bookLine.setText(Math.round(prog * 100) + "% COMPLETE" + (rem >= 0 ? "  ·  " + Ui.duration(rem).toUpperCase() + " LEFT" : ""));
            bookLine.setVisibility(View.VISIBLE);
        } else bookLine.setVisibility(View.GONE);
        Bitmap b = p.cover();
        if (b != lastCover) {
            Ui.setCover(cover, t, b);
            lastCover = b;
        }
        EppyBook bk = p.book();
        if (bk != null) EppyBookmarks.get(c).sync(bk.folderUri, false);
        buildChips();
        sheet.refresh(true);
    }

    /** Midnight skin: show the current sentences in place of the cover when a book is paired. */
    private void updateTranscript() {
        if (t.playerStyle != EppyTheme.PLAYER_TRANSCRIPT) return;
        ReadAlong ra = ReadAlong.get(c);
        BookText text = ra.text();
        double pos = host.player().bookPositionSeconds();
        if (text == null || text.pagesOnly || pos < 0) {
            transcript.setVisibility(View.GONE);
            cover.setVisibility(View.VISIBLE);
            return;
        }
        int w = ra.unitAt(pos);
        int[] s = text.sentence(w);
        int from = Math.max(0, s[0] - 22), to = Math.min(text.wordCount() - 1, s[1] + 22);
        android.text.SpannableStringBuilder sb = new android.text.SpannableStringBuilder();
        int lastPara = -1;
        for (int i = from; i <= to; i++) {
            BookText.Para para = text.paras.get(text.wordPara[i]);
            String word = para.text.substring(text.wordStart[i], Math.min(para.text.length(), wordEndWithPunct(para.text, text.wordEnd[i])));
            if (sb.length() > 0) sb.append(text.wordPara[i] != lastPara ? "\n" : " ");
            int start = sb.length();
            sb.append(word);
            int color = i < s[0] ? EppyTheme.withAlpha(t.onSurface, 0.35f) : i <= s[1] ? t.onSurface : EppyTheme.withAlpha(t.onSurface, 0.35f);
            sb.setSpan(new android.text.style.ForegroundColorSpan(color), start, sb.length(), 0);
            lastPara = text.wordPara[i];
        }
        transcript.setText(sb);
        transcript.setContentDescription("Current passage. Double-tap to open Read along.");
        transcript.setVisibility(View.VISIBLE);
        cover.setVisibility(View.GONE);
    }

    private static int wordEndWithPunct(String s, int end) {
        while (end < s.length() && ".,!?;:”’\"')—".indexOf(s.charAt(end)) >= 0) end++;
        return end;
    }

    public int sheetState() {
        return sheet.state();
    }

    public void restoreSheet(int tab, int state) {
        sheet.restore(tab, state);
    }

    public void backProgress(float p) {
        sheet.backProgress(p);
    }

    public void backCancelled() {
        sheet.backCancelled();
    }
}
