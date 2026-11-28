package com.waze.gw;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * Mod reporter, styled as a Waze-like BOTTOM SHEET. Reports are filed as map-issues to Waze's
 * editors via {@link Gateway#reportIssue}/{@link Gateway#reportWrongSpeed} at the current GPS
 * position (no keyboard). The sheet has two panels:
 *   MAIN  — pick an issue type (wrong speed / no-turn / no-passing / missing cameras…)
 *   SPEED — the wrong-speed sub-picker (10..120 signs); reached from "Sai tốc độ", has a back arrow.
 */
final class ModReport {

    private static final int[] PRESETS = {30, 40, 50, 60, 70, 80, 90, 100, 120};
    /** The wrong-speed picker for Waze in mph (US/UK limits). */
    static final int[] PRESETS_MPH ={15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80};
    private static final long SUBMISSION_DELAY_MS = 10000L;
    /** The sheet closes itself after this long without a touch so it never hides the map for long. */
    private static final long IDLE_CLOSE_MS = 15000L;
    /** wz_pins name for the wrong-speed tile; a drawn "?" limit sign stands in when it is missing. */
    private static final String UNKNOWN_LIMIT_ICON = "unknown_restrict";
    private static long lastInteractionMs;
    private static Runnable idleClose;

    /** One pending confirmation per sheet. Cancellation must never invoke its submit action. */
    private static final class PendingSubmission {
        final Runnable submit;
        android.animation.ValueAnimator animator;
        Runnable timeout;
        boolean cancelled;
        boolean submitted;

        PendingSubmission(Runnable submit) { this.submit = submit; }

        void cancel() {
            cancelled = true;
            if (animator != null) animator.cancel();
        }
    }

    // Each row is {icon, label, comment}. icon = a wz_pins asset name (rendered as an image) or, if no
    // such asset exists, an emoji shown as text. comment is the map-issue text sent to Waze's editors.

    // issue types that submit directly from the main panel
    private static final String[][] ISSUES = {
        {"bigpin_dummy_camera", "report.no_such_camera_here", "comment.no_such_camera_here"},
        {"no_passing_in", "point.no_overtaking", "comment.no_passing_missing"},
        {"no_passing_out", "point.end_of_no_overtaking", "comment.end_of_no_passing_sign"},
        {"end_of_previous_prohibitions", "point.end_of_all_restrictions", "comment.end_of_all_restrictions_sign"},
        {"residential_area_start", "point.built_up_area_starts", "comment.built_up_area_starts_sign"},
        {"residential_area_end", "point.built_up_area_ends", "comment.built_up_area_ends_sign"},
        {"bigpin_traffic_light", "report.there_is_a_traffic_light", "comment.traffic_light_here"},
    };

    // "Cấm rẽ / quay đầu" sub-menu — hi-res turn-restriction signs
    private static final String[][] TURNS = {
        {"no_left_turn", "point.no_left_turn", "comment.no_left_turn"},
        {"no_right_turn", "point.no_right_turn", "comment.no_right_turn"},
        {"no_u_turn", "point.no_u_turn", "comment.no_u_turn"},
        {"no_left_and_u_turn", "report.no_left_turn_u_turn", "comment.no_left_turn_u_turn"},
        {"no_right_and_u_turn", "report.no_right_turn_u_turn", "comment.no_right_turn_u_turn"},
        {"no_straight", "point.no_straight_ahead", "comment.no_straight_ahead"},
    };

    // "Hết cấm rẽ" sub-menu — the grey "restriction removed" signs, same order as TURNS
    private static final String[][] TURNS_REMOVED = {
        {"left_turn_restriction_removed", "report.end_of_no_left_turn", "comment.end_of_no_left_turn"},
        {"right_turn_restriction_removed", "report.end_of_no_right_turn", "comment.end_of_no_right_turn"},
        {"u_turn_restriction_removed", "report.end_of_no_u_turn", "comment.end_of_no_u_turn"},
        {"left_and_u_turn_restriction_removed", "report.end_of_no_left_turn_u", "comment.end_of_no_left_turn_u_turn"},
        {"right_and_u_turn_restriction_removed", "report.end_of_no_right_turn_u", "comment.end_of_no_right_turn_u_turn"},
        {"no_straightrestriction_removed", "report.end_of_no_straight_ahead", "comment.end_of_no_straight_ahead"},
    };

    // "Thiếu camera" sub-menu — Waze's own camera pins
    private static final String[][] CAMERAS = {
        {"bigpin_red_light_and_speed_camera", "report.automatic_ticketing_camera", "comment.missing_automatic_ticketing_camera"},
        {"bigpin_speed_camera", "report.speed_camera", "comment.missing_speed_camera"},
        {"bigpin_red_light_camera", "report.red_light_camera", "comment.missing_red_light_camera"},
    };

    /** No-passing and residential-area signs only exist in Vietnam: these reports are offered in Vietnam only. */
    private static boolean vietnameseSignOnly(String icon) {
        return "no_passing_in".equals(icon) || "no_passing_out".equals(icon)
                || "residential_area_start".equals(icon) || "residential_area_end".equals(icon);
    }

    /** Submit a leaf selected inside Waze's native report UI without opening our HUD sheet. */
    static boolean submitNativeItem(String key) {
        if (key == null) return false;
        if (key.startsWith("gw_mod:speed:")) {
            try {
                int speed = Integer.parseInt(key.substring("gw_mod:speed:".length()));
                for (int preset : Units.imperial() ? PRESETS_MPH : PRESETS) {
                    if (preset == speed) {
                        Gateway.reportWrongSpeed(speed);
                        return true;
                    }
                }
            } catch (NumberFormatException ignored) { /* unknown key */ }
            return false;
        }

        String[][] rows = null;
        int index = -1;
        if ("gw_mod:turn:left".equals(key)) { rows = TURNS; index = 0; }
        else if ("gw_mod:turn:right".equals(key)) { rows = TURNS; index = 1; }
        else if ("gw_mod:turn:u".equals(key)) { rows = TURNS; index = 2; }
        else if ("gw_mod:turn:left_u".equals(key)) { rows = TURNS; index = 3; }
        else if ("gw_mod:turn:right_u".equals(key)) { rows = TURNS; index = 4; }
        else if ("gw_mod:turn:straight".equals(key)) { rows = TURNS; index = 5; }
        else if ("gw_mod:turn_removed:left".equals(key)) { rows = TURNS_REMOVED; index = 0; }
        else if ("gw_mod:turn_removed:right".equals(key)) { rows = TURNS_REMOVED; index = 1; }
        else if ("gw_mod:turn_removed:u".equals(key)) { rows = TURNS_REMOVED; index = 2; }
        else if ("gw_mod:turn_removed:left_u".equals(key)) { rows = TURNS_REMOVED; index = 3; }
        else if ("gw_mod:turn_removed:right_u".equals(key)) { rows = TURNS_REMOVED; index = 4; }
        else if ("gw_mod:turn_removed:straight".equals(key)) { rows = TURNS_REMOVED; index = 5; }
        else if ("gw_mod:camera:combined".equals(key)) { rows = CAMERAS; index = 0; }
        else if ("gw_mod:camera:speed".equals(key)) { rows = CAMERAS; index = 1; }
        else if ("gw_mod:camera:red_light".equals(key)) { rows = CAMERAS; index = 2; }
        else if ("gw_mod:no_camera_here".equals(key)) { rows = ISSUES; index = 0; }
        else if ("gw_mod:no_passing".equals(key)) { rows = ISSUES; index = 1; }
        else if ("gw_mod:end_no_passing".equals(key)) { rows = ISSUES; index = 2; }
        else if ("gw_mod:end_prohibitions".equals(key)) { rows = ISSUES; index = 3; }
        else if ("gw_mod:residential_start".equals(key)) { rows = ISSUES; index = 4; }
        else if ("gw_mod:residential_end".equals(key)) { rows = ISSUES; index = 5; }
        else if ("gw_mod:traffic_light".equals(key)) { rows = ISSUES; index = 6; }

        if (rows == null || index < 0 || index >= rows.length) return false;
        if (vietnameseSignOnly(rows[index][0]) && !Region.inVietnam()) return false;
        Gateway.reportIssue(rows[index][1], I18n.reportComment(rows[index][2]));
        return true;
    }

    /** Add the trigger + (hidden) scrim/bottom-sheet to a FrameLayout root. hud = HUD placement. */
    static void attach(FrameLayout root, boolean hud) {
        try {
            if (root.findViewWithTag("mod_report_scrim") != null) return;   // already added
            final Context c = root.getContext();
            final float d = c.getResources().getDisplayMetrics().density;

            // full-screen dim scrim; a tap on it (outside the sheet) slides the sheet away
            final FrameLayout scrim = new FrameLayout(c);
            scrim.setTag("mod_report_scrim");
            scrim.setVisibility(View.GONE);
            scrim.setBackgroundColor(0x99000000);
            scrim.setClickable(true);

            final LinearLayout sheet = buildSheet(c, d, scrim);
            sheet.setClickable(true);                      // absorb taps so the sheet itself never dismisses
            scrim.addView(sheet, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
            scrim.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) { dismiss(scrim, sheet); }
            });
            root.addView(scrim, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            // The phone UI is now entered from Waze's native report grid.  Keep the standalone
            // trigger only on the mirrored HUD, whose report UI is a separate rendering path.
            if (!hud) return;

            TextView trig = new TextView(c);
            trig.setTag("mod_report");
            trig.setText("⚠");
            trig.setTextColor(0xFFFFFFFF);
            trig.setTextSize(hud ? 20 : 30);
            trig.setTypeface(Typeface.DEFAULT_BOLD);
            trig.setGravity(Gravity.CENTER);
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.OVAL);
            bg.setColor(AmbientTheme.withAlpha(AmbientTheme.color(c), 242));
            bg.setStroke((int) (2 * d), 0x66FFFFFF);
            trig.setBackground(bg);
            trig.setElevation(6 * d);
            trig.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) {
                    if (scrim.getVisibility() == View.VISIBLE) dismiss(scrim, sheet);
                    else { showMain(sheet); reveal(scrim, sheet); }
                }
            });
            int sz = (int) ((hud ? 46 : 66) * d), m = (int) (12 * d);
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(sz, sz);
            if (hud) {
                lp.gravity = Gravity.BOTTOM | Gravity.END;
                lp.rightMargin = m;
                lp.bottomMargin = (int) (14 * d);
            } else {
                lp.gravity = Gravity.END | Gravity.BOTTOM;   // right edge, above Waze's native report button
                lp.rightMargin = m;
                lp.bottomMargin = (int) (220 * d);
            }
            root.addView(trig, lp);
        } catch (Throwable t) { /* never crash host */ }
    }

    /** Open the existing Mod sheet directly at the category selected in Waze's report grid. */
    static void openFromReportMenu(FrameLayout root, String key) {
        try {
            if (root == null || key == null) return;
            attach(root, false);
            View rawScrim = root.findViewWithTag("mod_report_scrim");
            if (!(rawScrim instanceof FrameLayout)) return;
            final FrameLayout scrim = (FrameLayout) rawScrim;
            View rawSheet = scrim.getChildCount() > 0 ? scrim.getChildAt(0) : null;
            if (!(rawSheet instanceof LinearLayout)) return;
            final LinearLayout sheet = (LinearLayout) rawSheet;

            if ("gw_mod:wrong_speed".equals(key)) {
                showSpeed(sheet);
            } else if ("gw_mod:turn".equals(key)) {
                showTurn(sheet);
            } else if ("gw_mod:camera".equals(key)) {
                showCamera(sheet);
            } else if ("gw_mod:no_camera_here".equals(key)) {
                showDirectIssue(root.getContext(), scrim, sheet, ISSUES[0]);
            } else if ("gw_mod:no_passing".equals(key)) {
                showDirectIssue(root.getContext(), scrim, sheet, ISSUES[1]);
            } else if ("gw_mod:end_no_passing".equals(key)) {
                showDirectIssue(root.getContext(), scrim, sheet, ISSUES[2]);
            } else if ("gw_mod:end_prohibitions".equals(key)) {
                showDirectIssue(root.getContext(), scrim, sheet, ISSUES[3]);
            } else if ("gw_mod:residential_start".equals(key)) {
                showDirectIssue(root.getContext(), scrim, sheet, ISSUES[4]);
            } else if ("gw_mod:residential_end".equals(key)) {
                showDirectIssue(root.getContext(), scrim, sheet, ISSUES[5]);
            } else if ("gw_mod:turn_removed".equals(key)) {
                showTurnRemoved(sheet);
            } else {
                return;
            }
            reveal(scrim, sheet);
        } catch (Throwable t) { /* never crash host */ }
    }

    private static void showDirectIssue(Context c, final FrameLayout scrim,
                                        final LinearLayout sheet, final String[] issue) {
        float d = c.getResources().getDisplayMetrics().density;
        final String comment = I18n.reportComment(issue[2]);
        showConfirmation(c, d, scrim, sheet, issue[0], -1,
                I18n.f("report.report_0_1", I18n.tr(issue[1]), comment), new Runnable() {
                    @Override public void run() { Gateway.reportIssue(issue[1], comment); }
                });
    }

    /** Slide the sheet up from the bottom + fade the scrim in. */
    private static void reveal(final FrameLayout scrim, final View sheet) {
        armIdleClose(scrim, sheet);
        scrim.setAlpha(0f);
        scrim.setVisibility(View.VISIBLE);
        scrim.animate().alpha(1f).setDuration(200).start();
        sheet.post(new Runnable() {
            @Override public void run() {
                int h = sheet.getHeight();
                sheet.setTranslationY(h > 0 ? h : sheet.getResources().getDisplayMetrics().heightPixels);
                sheet.animate().translationY(0f).setDuration(300)
                        .setInterpolator(new DecelerateInterpolator(1.6f)).start();
            }
        });
    }

    /** Slide the sheet back down + fade the scrim out, then hide the whole overlay. */
    private static void dismiss(final FrameLayout scrim, final View sheet) {
        if (scrim.getVisibility() != View.VISIBLE) return;
        cancelPending(sheet);
        if (idleClose != null) sheet.removeCallbacks(idleClose);
        idleClose = null;
        int h = sheet.getHeight();
        sheet.animate().translationY(h > 0 ? h : 1200).setDuration(220)
                .setInterpolator(new AccelerateInterpolator(1.2f)).start();
        scrim.animate().alpha(0f).setDuration(220).withEndAction(new Runnable() {
            @Override public void run() { scrim.setVisibility(View.GONE); scrim.setAlpha(1f); }
        }).start();
    }

    // The panels live inside the sheet; only one is visible at a time.
    private static void show(LinearLayout sheet, String tag) {
        for (String t : new String[]{"panel_main", "panel_speed", "panel_turn", "panel_turn_removed",
                "panel_camera", "panel_confirm"}) {
            View v = sheet.findViewWithTag(t);
            if (v != null) v.setVisibility(t.equals(tag) ? View.VISIBLE : View.GONE);
        }
        View scroll = sheet.findViewWithTag("report_scroll");
        if (scroll != null) scroll.scrollTo(0, 0);      // every panel starts at its top
        lastInteractionMs = android.os.SystemClock.uptimeMillis();
    }

    /**
     * Close the sheet after IDLE_CLOSE_MS without interaction. Touches anywhere on the sheet and
     * panel changes push the deadline back. The confirmation panel is left alone: it has its own
     * countdown that submits the report, and closing it would silently cancel that report.
     */
    private static void armIdleClose(final FrameLayout scrim, final View sheet) {
        if (idleClose != null) sheet.removeCallbacks(idleClose);
        lastInteractionMs = android.os.SystemClock.uptimeMillis();
        idleClose = new Runnable() {
            @Override public void run() {
                if (idleClose != this || scrim.getVisibility() != View.VISIBLE) return;
                long idle = android.os.SystemClock.uptimeMillis() - lastInteractionMs;
                View confirm = sheet.findViewWithTag("panel_confirm");
                boolean confirming = confirm != null && confirm.getVisibility() == View.VISIBLE;
                if (confirming || idle < IDLE_CLOSE_MS) {
                    sheet.postDelayed(this, confirming ? IDLE_CLOSE_MS : IDLE_CLOSE_MS - idle);
                    return;
                }
                dismiss(scrim, sheet);
            }
        };
        sheet.postDelayed(idleClose, IDLE_CLOSE_MS);
    }

    /** Speed-limit sign with "?" in the middle: red ring, white disc, bold black mark. */
    private static android.graphics.Bitmap unknownLimitSign(int size) {
        android.graphics.Bitmap bm = android.graphics.Bitmap.createBitmap(
                size, size, android.graphics.Bitmap.Config.ARGB_8888);
        android.graphics.Canvas canvas = new android.graphics.Canvas(bm);
        android.graphics.Paint paint = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        float r = size / 2f;
        paint.setColor(0xFFE53935);
        canvas.drawCircle(r, r, r, paint);
        paint.setColor(0xFFFFFFFF);
        canvas.drawCircle(r, r, r * 0.76f, paint);
        paint.setColor(0xFF111111);
        paint.setTypeface(Typeface.DEFAULT_BOLD);
        paint.setTextAlign(android.graphics.Paint.Align.CENTER);
        paint.setTextSize(size * 0.58f);
        android.graphics.Paint.FontMetrics fm = paint.getFontMetrics();
        canvas.drawText("?", r, r - (fm.ascent + fm.descent) / 2f, paint);
        return bm;
    }
    private static void showMain(LinearLayout sheet)   { show(sheet, "panel_main"); }
    private static void showSpeed(LinearLayout sheet)  { show(sheet, "panel_speed"); }
    private static void showTurn(LinearLayout sheet)   { show(sheet, "panel_turn"); }
    private static void showTurnRemoved(LinearLayout sheet) { show(sheet, "panel_turn_removed"); }
    private static void showCamera(LinearLayout sheet) { show(sheet, "panel_camera"); }

    private static LinearLayout buildSheet(Context c, float d, final FrameLayout scrim) {
        final LinearLayout sheet = new LinearLayout(c);
        sheet.setOrientation(LinearLayout.VERTICAL);
        sheet.setPadding((int) (18 * d), (int) (10 * d), (int) (18 * d), (int) (22 * d));
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setColor(0xF5171722);
        float r = 26 * d;
        bg.setCornerRadii(new float[]{r, r, r, r, 0, 0, 0, 0});   // round the TOP corners only
        sheet.setBackground(bg);
        sheet.setElevation(16 * d);

        // grab handle (decorative)
        View handle = new View(c);
        GradientDrawable hb = new GradientDrawable();
        hb.setShape(GradientDrawable.RECTANGLE);
        hb.setColor(0x4DFFFFFF);
        hb.setCornerRadius(3 * d);
        LinearLayout.LayoutParams hlp = new LinearLayout.LayoutParams((int) (42 * d), (int) (5 * d));
        hlp.gravity = Gravity.CENTER_HORIZONTAL;
        hlp.bottomMargin = (int) (12 * d);
        handle.setBackground(hb);
        sheet.addView(handle, hlp);

        // The panels scroll: on a short (landscape HUD) screen a long menu used to be cut off at the
        // bottom with no way to reach the rest. The scroll area is capped so the sheet keeps its top
        // margin and the scrim stays tappable above it.
        int maxScroll = (int) (c.getResources().getDisplayMetrics().heightPixels * 0.86f - 64 * d);
        CappedScrollView scroll = new CappedScrollView(c, maxScroll);
        scroll.setTag("report_scroll");
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        LinearLayout panels = new LinearLayout(c);
        panels.setOrientation(LinearLayout.VERTICAL);
        panels.addView(buildMainPanel(c, d, scrim, sheet));
        panels.addView(buildSpeedPanel(c, d, scrim, sheet));
        panels.addView(buildListPanel(c, d, scrim, sheet, "panel_turn", I18n.tr("report.no_turn_u_turn"), I18n.tr("report.choose_the_type_of_prohibition_sign"), TURNS));
        panels.addView(buildListPanel(c, d, scrim, sheet, "panel_turn_removed", I18n.tr("report.end_of_turn_ban"), I18n.tr("report.choose_the_type_of_end_of"), TURNS_REMOVED));
        panels.addView(buildListPanel(c, d, scrim, sheet, "panel_camera", I18n.tr("report.missing_camera"), I18n.tr("report.choose_the_camera_type"), CAMERAS));
        panels.addView(buildConfirmationPanel(c, d));
        scroll.addView(panels, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        sheet.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return sheet;
    }

    /** ScrollView that grows with its content but never taller than {@code maxHeight}. */
    private static final class CappedScrollView extends android.widget.ScrollView {
        private final int maxHeight;

        CappedScrollView(Context c, int maxHeight) {
            super(c);
            this.maxHeight = Math.max(1, maxHeight);
        }

        @Override public boolean dispatchTouchEvent(android.view.MotionEvent event) {
            lastInteractionMs = android.os.SystemClock.uptimeMillis();
            return super.dispatchTouchEvent(event);
        }

        @Override protected void onMeasure(int widthSpec, int heightSpec) {
            int mode = View.MeasureSpec.getMode(heightSpec);
            int size = View.MeasureSpec.getSize(heightSpec);
            int cap = mode == View.MeasureSpec.UNSPECIFIED ? maxHeight : Math.min(size, maxHeight);
            super.onMeasure(widthSpec, View.MeasureSpec.makeMeasureSpec(cap, View.MeasureSpec.AT_MOST));
        }
    }

    // ---------------- MAIN panel: pick an issue type ----------------
    private static LinearLayout buildMainPanel(final Context c, final float d, final FrameLayout scrim, final LinearLayout sheet) {
        LinearLayout p = new LinearLayout(c);
        p.setTag("panel_main");
        p.setOrientation(LinearLayout.VERTICAL);

        p.addView(header(c, d, I18n.tr("report.report_an_issue_to_waze"), I18n.tr("report.sent_to_map_editors_for_fixing")));

        java.util.List<View> tiles = new java.util.ArrayList<View>();
        // wrong-speed -> opens the speed sub-picker
        tiles.add(issueTile(c, d, UNKNOWN_LIMIT_ICON, I18n.tr("report.wrong_speed_limit"), new View.OnClickListener() {
            @Override public void onClick(View v) { showSpeed(sheet); }
        }));
        // no-turn -> opens the turn-restriction sub-menu
        tiles.add(issueTile(c, d, "no_left_turn", I18n.tr("report.no_turn_u_turn"), new View.OnClickListener() {
            @Override public void onClick(View v) { showTurn(sheet); }
        }));
        // end of a turn restriction -> opens its own sub-menu
        tiles.add(issueTile(c, d, "left_turn_restriction_removed", I18n.tr("report.end_of_turn_ban"), new View.OnClickListener() {
            @Override public void onClick(View v) { showTurnRemoved(sheet); }
        }));
        // missing camera -> opens the camera sub-menu
        tiles.add(issueTile(c, d, "bigpin_speed_camera", I18n.tr("report.missing_camera"), new View.OnClickListener() {
            @Override public void onClick(View v) { showCamera(sheet); }
        }));
        // remaining issue types: submit directly
        for (final String[] it : ISSUES) {
            if (!vietnameseSignOnly(it[0]) || Region.inVietnam()) tiles.add(directTile(c, d, scrim, sheet, it));
        }
        addTileGrid(p, c, d, tiles);

        p.addView(closeBtn(c, d, scrim, sheet));
        return p;
    }

    /** A tile that asks for confirmation and then files {@code it} = {icon, label, comment}. */
    private static View directTile(final Context c, final float d, final FrameLayout scrim,
                                   final LinearLayout sheet, final String[] it) {
        return issueTile(c, d, it[0], I18n.tr(it[1]), new View.OnClickListener() {
            @Override public void onClick(View v) {
                final String comment = I18n.reportComment(it[2]);
                showConfirmation(c, d, scrim, sheet, it[0], -1,
                        I18n.f("report.report_0_1", I18n.tr(it[1]), comment), new Runnable() {
                            @Override public void run() { Gateway.reportIssue(it[1], comment); }
                        });
            }
        });
    }

    /** Tiles per row: as many ~118dp tiles as fit the screen, 3 on a phone up to 6 on a wide HUD. */
    private static int gridColumns(Context c, float d) {
        float widthDp = c.getResources().getDisplayMetrics().widthPixels / d - 36f;
        return Math.max(3, Math.min(6, (int) (widthDp / 118f)));
    }

    /** Lay the tiles out in equal-width rows; the last row is padded so tiles keep one size. */
    private static void addTileGrid(LinearLayout parent, Context c, float d, java.util.List<View> tiles) {
        int perRow = gridColumns(c, d);
        int margin = (int) (5 * d);
        for (int i = 0; i < tiles.size(); i += perRow) {
            LinearLayout row = new LinearLayout(c);
            row.setOrientation(LinearLayout.HORIZONTAL);
            for (int k = 0; k < perRow; k++) {
                View tile;
                if (i + k < tiles.size()) {
                    tile = tiles.get(i + k);
                } else {
                    tile = new View(c);              // invisible filler
                    tile.setVisibility(View.INVISIBLE);
                }
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0,
                        ViewGroup.LayoutParams.MATCH_PARENT, 1f);
                lp.setMargins(margin, 0, margin, 0);
                row.addView(tile, lp);
            }
            LinearLayout.LayoutParams rp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            rp.topMargin = (int) (10 * d);
            parent.addView(row, rp);
        }
    }

    /** One large tappable tile: big icon (a wz_pins image, or emoji fallback) over a two-line label. */
    private static View issueTile(Context c, float d, String icon, String label, final View.OnClickListener onTap) {
        LinearLayout tile = new LinearLayout(c);
        tile.setOrientation(LinearLayout.VERTICAL);
        tile.setGravity(Gravity.CENTER_HORIZONTAL);
        tile.setPadding((int) (6 * d), (int) (12 * d), (int) (6 * d), (int) (10 * d));
        GradientDrawable tb = new GradientDrawable();
        tb.setShape(GradientDrawable.RECTANGLE);
        tb.setColor(0x14FFFFFF);
        tb.setCornerRadius(16 * d);
        tile.setBackground(tb);
        tile.setClickable(true);

        int isz = (int) (58 * d);
        android.graphics.Bitmap bm = Signs.pin(c, icon);   // wz_pins asset, or null -> emoji fallback
        if (bm == null && UNKNOWN_LIMIT_ICON.equals(icon)) bm = unknownLimitSign(isz);
        LinearLayout.LayoutParams icp = new LinearLayout.LayoutParams(isz, isz);
        if (bm != null) {
            ImageView iv = new ImageView(c);
            iv.setImageBitmap(bm);
            iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
            tile.addView(iv, icp);
        } else {
            TextView ic = new TextView(c);
            ic.setText(icon);
            ic.setTextSize(36);
            ic.setTextColor(0xFFFFFFFF);
            ic.setGravity(Gravity.CENTER);
            tile.addView(ic, icp);
        }

        TextView tv = new TextView(c);
        tv.setText(label);
        tv.setTextColor(0xFFFFFFFF);
        tv.setTextSize(13);
        tv.setTypeface(Typeface.DEFAULT_BOLD);
        tv.setGravity(Gravity.CENTER);
        tv.setMaxLines(2);
        tv.setEllipsize(android.text.TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams tlp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        tlp.topMargin = (int) (8 * d);
        tile.addView(tv, tlp);

        tile.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(final View v) {
                v.animate().alpha(0.5f).setDuration(80).withEndAction(new Runnable() {
                    @Override public void run() { v.setAlpha(1f); onTap.onClick(v); }
                }).start();
            }
        });
        return tile;
    }

    // ---------------- SPEED panel: the wrong-speed sub-picker ----------------
    private static LinearLayout buildSpeedPanel(Context c, float d, final FrameLayout scrim, final LinearLayout sheet) {
        LinearLayout p = new LinearLayout(c);
        p.setTag("panel_speed");
        p.setOrientation(LinearLayout.VERTICAL);
        p.setVisibility(View.GONE);

        boolean mph = Units.imperial();
        int[] presets = mph ? PRESETS_MPH : PRESETS;
        p.addView(backHeader(c, d, sheet, I18n.tr("report.report_wrong_speed"),
                I18n.tr(mph ? "report.choose_the_correct_speed_mph" : "report.choose_the_correct_speed_km_h")));

        // bigger signs, well-spaced: 3 per row on portrait, 4 on landscape; the longer mph list is compact (4 per row)
        boolean portrait = c.getResources().getConfiguration().orientation
                == android.content.res.Configuration.ORIENTATION_PORTRAIT;
        int perRow = mph || !portrait ? 4 : 3;
        int btn = (int) ((mph ? (portrait ? 66 : 80) : (portrait ? 84 : 92)) * d);
        LinearLayout row = null;
        for (int i = 0; i < presets.length; i++) {
            if (i % perRow == 0) {
                row = new LinearLayout(c);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER);
                LinearLayout.LayoutParams rp = wrap(Gravity.CENTER_HORIZONTAL);
                rp.topMargin = (int) (14 * d);
                p.addView(row, rp);
            }
            row.addView(speedBtn(c, d, btn, presets[i], scrim, sheet));
        }

        p.addView(closeBtn(c, d, scrim, sheet));
        return p;
    }

    // ---------------- generic sub-menu panel: back header + a list of direct-submit issue rows ----------------
    private static LinearLayout buildListPanel(Context c, float d, final FrameLayout scrim, final LinearLayout sheet,
                                               String tag, String title, String sub, String[][] items) {
        LinearLayout p = new LinearLayout(c);
        p.setTag(tag);
        p.setOrientation(LinearLayout.VERTICAL);
        p.setVisibility(View.GONE);

        p.addView(backHeader(c, d, sheet, title, sub));

        java.util.List<View> tiles = new java.util.ArrayList<View>();
        for (final String[] it : items) tiles.add(directTile(c, d, scrim, sheet, it));
        addTileGrid(p, c, d, tiles);

        p.addView(closeBtn(c, d, scrim, sheet));
        return p;
    }

    /** A sub-panel header with a ‹ back arrow (returns to the main panel) + title/subtitle. */
    private static View backHeader(Context c, float d, final LinearLayout sheet, String titleTxt, String subTxt) {
        LinearLayout head = new LinearLayout(c);
        head.setOrientation(LinearLayout.HORIZONTAL);
        head.setGravity(Gravity.CENTER_VERTICAL);
        TextView back = new TextView(c);
        back.setText("‹");
        back.setTextColor(0xFFFFFFFF);
        back.setTextSize(28);
        back.setTypeface(Typeface.DEFAULT_BOLD);
        back.setGravity(Gravity.CENTER);
        back.setPadding((int) (4 * d), 0, (int) (14 * d), 0);
        back.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { showMain(sheet); }
        });
        head.addView(back, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout titles = new LinearLayout(c);
        titles.setOrientation(LinearLayout.VERTICAL);
        TextView title = new TextView(c);
        title.setText(titleTxt);
        title.setTextColor(0xFFFFFFFF);
        title.setTextSize(19);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        titles.addView(title);
        TextView sub = new TextView(c);
        sub.setText(subTxt);
        sub.setTextColor(0xFF9AA0A6);
        sub.setTextSize(13);
        titles.addView(sub);
        head.addView(titles);
        LinearLayout.LayoutParams hlp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hlp.bottomMargin = (int) (6 * d);
        head.setLayoutParams(hlp);
        return head;
    }

    private static View speedBtn(Context c, float d, int s, final int val,
                                 final FrameLayout scrim, final View sheet) {
        final int mm = (int) (10 * d);
        View b;
        // our speed-limit sign artwork (km/h); the mph list has its own signs, in the style Waze uses
        android.graphics.Bitmap sign = Units.imperial() ? LimitSign.anyBitmap(val) : Signs.limit(c, val);
        if (sign != null) {
            ImageView iv = new ImageView(c);
            iv.setImageBitmap(sign);
            iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
            int pad = (int) (2 * d);
            iv.setPadding(pad, pad, pad, pad);
            b = iv;
        } else {                                              // fallback: pink number chip
            TextView t = new TextView(c);
            t.setText(String.valueOf(val));
            t.setTextColor(0xFFFFFFFF);
            t.setTextSize(20);
            t.setTypeface(Typeface.DEFAULT_BOLD);
            t.setGravity(Gravity.CENTER);
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.RECTANGLE);
            bg.setColor(AmbientTheme.color(c));
            bg.setCornerRadius(12 * d);
            t.setBackground(bg);
            b = t;
        }
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(s, s);
        lp.leftMargin = mm; lp.rightMargin = mm;
        b.setLayoutParams(lp);
        b.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(final View v) {
                v.animate().scaleX(0.85f).scaleY(0.85f).setDuration(90)   // quick press feedback, then fire
                        .withEndAction(new Runnable() {
                            @Override public void run() {
                                v.setScaleX(1f); v.setScaleY(1f);
                                showConfirmation(c, d, scrim, (LinearLayout) sheet,
                                        "", val,
                                        I18n.f(Units.imperial() ? "report.report_wrong_speed_correct_speed_0_mph"
                                                : "report.report_wrong_speed_correct_speed_0", val),
                                        new Runnable() {
                                            @Override public void run() { Gateway.reportWrongSpeed(val); }
                                        });
                            }
                        }).start();
            }
        });
        return b;
    }

    // ---------------- CONFIRM panel: five-second undo window before submission ----------------

    private static LinearLayout buildConfirmationPanel(Context c, float d) {
        LinearLayout p = new LinearLayout(c);
        p.setTag("panel_confirm");
        p.setOrientation(LinearLayout.VERTICAL);
        p.setGravity(Gravity.CENTER_HORIZONTAL);
        p.setVisibility(View.GONE);
        p.setPadding((int) (12 * d), (int) (4 * d), (int) (12 * d), (int) (2 * d));

        FrameLayout iconHolder = new FrameLayout(c);
        iconHolder.setTag("confirm_icon");
        LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(
                (int) (104 * d), (int) (104 * d));
        iconLp.gravity = Gravity.CENTER_HORIZONTAL;
        iconLp.bottomMargin = (int) (18 * d);
        p.addView(iconHolder, iconLp);

        TextView description = new TextView(c);
        description.setTag("confirm_description");
        description.setTextColor(0xFFFFFFFF);
        description.setTextSize(18);
        description.setTypeface(Typeface.DEFAULT_BOLD);
        description.setGravity(Gravity.CENTER);
        description.setLineSpacing(0f, 1.12f);
        LinearLayout.LayoutParams descLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        descLp.bottomMargin = (int) (22 * d);
        p.addView(description, descLp);

        LinearLayout buttons = new LinearLayout(c);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.setGravity(Gravity.CENTER);

        TextView cancel = new TextView(c);
        cancel.setTag("confirm_cancel");
        cancel.setText(I18n.tr("report.cancel"));
        cancel.setTextColor(0xFFFFFFFF);
        cancel.setTextSize(15);
        cancel.setTypeface(Typeface.DEFAULT_BOLD);
        cancel.setGravity(Gravity.CENTER);
        GradientDrawable cancelBg = new GradientDrawable();
        cancelBg.setShape(GradientDrawable.RECTANGLE);
        cancelBg.setColor(0x0DFFFFFF);
        cancelBg.setCornerRadius(11 * d);
        cancelBg.setStroke(Math.max(2, (int) (2 * d)), 0xFFFFFFFF);
        cancel.setBackground(cancelBg);
        LinearLayout.LayoutParams cancelLp = new LinearLayout.LayoutParams(0, (int) (48 * d), 1f);
        cancelLp.rightMargin = (int) (8 * d);
        buttons.addView(cancel, cancelLp);

        FrameLayout submit = new FrameLayout(c);
        submit.setTag("confirm_submit");
        submit.setClipToOutline(true);
        GradientDrawable submitBg = new GradientDrawable();
        submitBg.setShape(GradientDrawable.RECTANGLE);
        submitBg.setColor(0x0DFFFFFF);
        submitBg.setCornerRadius(11 * d);
        submitBg.setStroke(Math.max(2, (int) (2 * d)), 0xFFFFFFFF);
        submit.setBackground(submitBg);

        View progress = new View(c);
        progress.setTag("confirm_progress");
        GradientDrawable progressBg = new GradientDrawable();
        progressBg.setShape(GradientDrawable.RECTANGLE);
        progressBg.setColor(0xFF91C9F2);
        progressBg.setCornerRadius(9 * d);
        progress.setBackground(progressBg);
        submit.addView(progress, new FrameLayout.LayoutParams(0,
                ViewGroup.LayoutParams.MATCH_PARENT, Gravity.START));

        TextView submitLabel = new TextView(c);
        submitLabel.setTag("confirm_submit_label");
        submitLabel.setText(I18n.tr("report.report"));
        submitLabel.setTextColor(0xFFFFFFFF);
        submitLabel.setTextSize(15);
        submitLabel.setTypeface(Typeface.DEFAULT_BOLD);
        submitLabel.setGravity(Gravity.CENTER);
        submit.addView(submitLabel, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        LinearLayout.LayoutParams submitLp = new LinearLayout.LayoutParams(0, (int) (48 * d), 1f);
        submitLp.leftMargin = (int) (8 * d);
        buttons.addView(submit, submitLp);
        p.addView(buttons, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return p;
    }

    private static void showConfirmation(Context c, float d, final FrameLayout scrim,
                                         final LinearLayout sheet, String icon, int speed,
                                         String description, final Runnable submitAction) {
        cancelPending(sheet);
        View panelView = sheet.findViewWithTag("panel_confirm");
        if (!(panelView instanceof LinearLayout)) return;
        LinearLayout panel = (LinearLayout) panelView;
        View iconView = panel.findViewWithTag("confirm_icon");
        View descView = panel.findViewWithTag("confirm_description");
        View cancelView = panel.findViewWithTag("confirm_cancel");
        View submitView = panel.findViewWithTag("confirm_submit");
        View progress = panel.findViewWithTag("confirm_progress");
        View labelView = panel.findViewWithTag("confirm_submit_label");
        if (!(iconView instanceof FrameLayout) || !(descView instanceof TextView)
                || !(submitView instanceof FrameLayout) || !(labelView instanceof TextView)
                || progress == null || cancelView == null) return;

        FrameLayout iconHolder = (FrameLayout) iconView;
        iconHolder.removeAllViews();
        android.graphics.Bitmap bitmap = speed > 0 ? Signs.limit(c, speed) : Signs.pin(c, icon);
        if (bitmap != null) {
            ImageView image = new ImageView(c);
            image.setImageBitmap(bitmap);
            image.setScaleType(ImageView.ScaleType.FIT_CENTER);
            iconHolder.addView(image, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        } else {
            TextView fallback = new TextView(c);
            fallback.setText(icon);
            fallback.setTextColor(0xFFFFFFFF);
            fallback.setTextSize(42);
            fallback.setGravity(Gravity.CENTER);
            iconHolder.addView(fallback, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }
        ((TextView) descView).setText(description);
        final int totalSeconds = Math.max(1, (int) (SUBMISSION_DELAY_MS / 1000L));
        ((TextView) labelView).setText(I18n.f("report.report_0_s", totalSeconds));
        FrameLayout.LayoutParams initialProgress = (FrameLayout.LayoutParams) progress.getLayoutParams();
        initialProgress.width = 0;
        progress.setLayoutParams(initialProgress);

        final PendingSubmission pending = new PendingSubmission(submitAction);
        sheet.setTag(pending);
        cancelView.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                cancelPending(sheet);
                dismiss(scrim, sheet);
            }
        });
        show(sheet, "panel_confirm");

        final FrameLayout submitButton = (FrameLayout) submitView;
        final TextView submitLabel = (TextView) labelView;
        final View progressView = progress;
        final Runnable complete = new Runnable() {
            @Override public void run() {
                completeSubmission(pending, scrim, sheet, submitLabel);
            }
        };
        pending.timeout = complete;
        submitButton.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { complete.run(); }
        });
        submitButton.setContentDescription(I18n.f("report.the_report_will_be_sent_automatically", totalSeconds));
        submitButton.post(new Runnable() {
            @Override public void run() {
                if (pending.cancelled || sheet.getTag() != pending) return;
                android.animation.ValueAnimator animator = android.animation.ValueAnimator.ofFloat(0f, 1f);
                pending.animator = animator;
                animator.setDuration(SUBMISSION_DELAY_MS);
                animator.setInterpolator(new android.view.animation.LinearInterpolator());
                animator.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {
                    @Override public void onAnimationUpdate(android.animation.ValueAnimator animation) {
                        float fraction = ((Float) animation.getAnimatedValue()).floatValue();
                        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) progressView.getLayoutParams();
                        lp.width = Math.round(submitButton.getWidth() * fraction);
                        progressView.setLayoutParams(lp);
                        int seconds = Math.max(1, (int) Math.ceil((1f - fraction) * totalSeconds));
                        submitLabel.setText(I18n.f("report.report_0_s", seconds));
                    }
                });
                animator.addListener(new android.animation.AnimatorListenerAdapter() {
                    @Override public void onAnimationEnd(android.animation.Animator animation) {
                        complete.run();
                    }
                });
                animator.start();
                submitButton.postDelayed(complete, SUBMISSION_DELAY_MS + 80L);
            }
        });
    }

    /** Shared idempotent completion path for timeout animation, fallback timer and manual tap. */
    private static void completeSubmission(PendingSubmission pending, FrameLayout scrim,
                                           LinearLayout sheet, TextView label) {
        if (pending.cancelled || pending.submitted || sheet.getTag() != pending) return;
        pending.submitted = true;
        sheet.setTag(null);
        if (pending.timeout != null) sheet.removeCallbacks(pending.timeout);
        if (pending.animator != null && pending.animator.isRunning()) pending.animator.cancel();
        label.setText(I18n.tr("report.sending"));
        dismiss(scrim, sheet);
        try {
            pending.submit.run();
        } catch (Throwable ignored) { /* the sheet must still close if submission fails */ }
    }

    private static void cancelPending(View sheet) {
        Object value = sheet.getTag();
        if (value instanceof PendingSubmission) {
            PendingSubmission pending = (PendingSubmission) value;
            if (pending.timeout != null) sheet.removeCallbacks(pending.timeout);
            pending.cancel();
            sheet.setTag(null);
        }
    }

    // ---------------- shared UI helpers ----------------
    private static View header(Context c, float d, String titleTxt, String subTxt) {
        LinearLayout h = new LinearLayout(c);
        h.setOrientation(LinearLayout.VERTICAL);
        h.setGravity(Gravity.CENTER_HORIZONTAL);
        TextView title = new TextView(c);
        title.setText(titleTxt);
        title.setTextColor(0xFFFFFFFF);
        title.setTextSize(19);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setGravity(Gravity.CENTER);
        h.addView(title);
        TextView sub = new TextView(c);
        sub.setText(subTxt);
        sub.setTextColor(0xFF9AA0A6);
        sub.setTextSize(13);
        sub.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams sp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sp.topMargin = (int) (2 * d);
        sp.bottomMargin = (int) (8 * d);
        h.addView(sub, sp);
        LinearLayout.LayoutParams hp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        h.setLayoutParams(hp);
        return h;
    }

    private static TextView closeBtn(Context c, float d, final FrameLayout scrim, final LinearLayout sheet) {
        TextView close = new TextView(c);
        close.setText(I18n.tr("report.close"));
        close.setTextColor(0xFFDDE2E6);
        close.setTextSize(16);
        close.setTypeface(Typeface.DEFAULT_BOLD);
        close.setGravity(Gravity.CENTER);
        close.setPadding(0, (int) (13 * d), 0, (int) (13 * d));
        GradientDrawable cb = new GradientDrawable();
        cb.setShape(GradientDrawable.RECTANGLE);
        cb.setColor(0x1AFFFFFF);
        cb.setCornerRadius(14 * d);
        close.setBackground(cb);
        close.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { dismiss(scrim, sheet); }
        });
        LinearLayout.LayoutParams clp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        clp.topMargin = (int) (16 * d);
        close.setLayoutParams(clp);
        return close;
    }

    private static LinearLayout.LayoutParams wrap(int gravity) {
        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        p.gravity = gravity;
        return p;
    }
}
