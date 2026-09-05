package app.template.extension;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.util.TypedValue;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.fragment.app.Fragment;

import app.template.extension.settings.AccentPresets;
import app.template.extension.settings.Prefs;

import java.lang.reflect.Method;
import java.util.WeakHashMap;

/**
 * Merged into Letterboxd by the "Hide ratings until watched" patch.
 *
 * <p>{@code FilmRatingsHistogramFragment}'s root view is {@code @id/ratingsViewWrapper}. Inside it,
 * the endpoint stars, histogram, average and {@code RatingView} all live in one unnamed horizontal
 * row (the parent of {@code @id/ratingsView}). While the film is unwatched that row is covered with
 * the chosen reveal style; tapping it reveals the ratings for the current visit, and leaving and
 * returning to the film hides them again.
 *
 * <p>Cover ({@code style} baked in by the patch, overridable from Mod settings):
 * <ul>
 *   <li>{@code link} — the row is hidden and a plain "Tap to show ratings" text sits below the
 *       section title.</li>
 *   <li>{@code panel} / {@code shimmer} / {@code burst} — the row stays laid out and a
 *       {@link SpoilerOverlayView} is placed over it. Mod settings' separate "Reveal animation"
 *       (default / crumble / confetti) and, for confetti, "Confetti color" settings are read fresh
 *       each time an overlay is built — see {@link Prefs#revealAnimation()}.</li>
 * </ul>
 *
 * <p>The relationship and the rating data load asynchronously in unpredictable order, and a
 * coroutine re-shows the row when rating data arrives, so enforcement is reactive: a global layout
 * listener re-checks every pass and re-covers while the film is unwatched.
 *
 * <p>Everything is reflection-based and exception-safe. Any failure ({@code ERROR}) restores the
 * ratings and detaches — it fails open, never hiding ratings for a watched film.
 */
public final class HideRatingUntilWatched {

    private static final int WATCHED = 1;
    private static final int NOT_WATCHED = 0;
    private static final int UNKNOWN = -1;
    private static final int ERROR = -2;

    private static final String LINK_TAG = "morphe_reveal_ratings";
    private static final String OVERLAY_TAG = "morphe_spoiler_overlay";

    private static final WeakHashMap<View, Boolean> ATTACHED = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> REVEALED = new WeakHashMap<>();

    private static Method mGetModel;
    private static Method mGetRelationship;
    private static Method mGetValue;
    private static Method mGetWatched;

    private HideRatingUntilWatched() {}

    /** Back-compat shim for a call site without a style argument. */
    public static void enforce(final Fragment fragment) {
        enforce(fragment, "panel");
    }

    /**
     * Injected at the top of {@code FilmRatingsHistogramFragment.onViewCreated}. {@code style} is
     * the value baked in when patching; if the "Mod settings" screen has been used to override it
     * (or to turn the feature off) that takes precedence.
     */
    public static void enforce(final Fragment fragment, final String style) {
        try {
            Prefs.load(fragment != null ? fragment.getContext() : null);
            if (!Prefs.getBoolean(Prefs.KEY_HIDE_RATINGS_ENABLED, true)) return;

            final View wrapper = fragment.getView();
            if (wrapper == null || Boolean.TRUE.equals(ATTACHED.get(wrapper))) return;
            ATTACHED.put(wrapper, Boolean.TRUE);

            final String baked = (style == null || style.isEmpty()) ? "panel" : style;
            final String reveal = Prefs.has(Prefs.KEY_HIDE_RATINGS_STYLE)
                    ? Prefs.getString(Prefs.KEY_HIDE_RATINGS_STYLE, baked)
                    : baked;

            final ViewTreeObserver.OnGlobalLayoutListener[] self =
                    new ViewTreeObserver.OnGlobalLayoutListener[1];
            self[0] = new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override
                public void onGlobalLayout() {
                    if (Boolean.TRUE.equals(REVEALED.get(wrapper))) {
                        detach(wrapper, self[0]);
                        return;
                    }
                    int state;
                    try {
                        state = readWatchedState(fragment);
                    } catch (Throwable t) {
                        state = ERROR;
                    }
                    if (state == WATCHED || state == ERROR) {
                        restore(wrapper);
                        detach(wrapper, self[0]);
                    } else {
                        cover(wrapper, reveal);
                    }
                }
            };
            wrapper.getViewTreeObserver().addOnGlobalLayoutListener(self[0]);
            self[0].onGlobalLayout();
        } catch (Throwable ignored) {
        }
    }

    private static void detach(View v, ViewTreeObserver.OnGlobalLayoutListener l) {
        try {
            ViewTreeObserver vto = v.getViewTreeObserver();
            if (vto.isAlive()) vto.removeOnGlobalLayoutListener(l);
        } catch (Throwable ignored) {
        }
        ATTACHED.remove(v);
    }

    // --- covering ----------------------------------------------------------

    private static void cover(View wrapper, String style) {
        View toggle = byId(wrapper, "ratingsToggleIcon");
        if (toggle != null && toggle.getVisibility() != View.GONE) toggle.setVisibility(View.GONE);

        View row = ratingRow(wrapper);

        if ("link".equals(style)) {
            if (row != null && row.getVisibility() != View.GONE) row.setVisibility(View.GONE);
            ensureLink(wrapper);
            return;
        }

        // Overlay styles keep the row laid out so the overlay can align to it.
        if (row != null && row.getVisibility() != View.VISIBLE) row.setVisibility(View.VISIBLE);
        ensureOverlay(wrapper, style);
    }

    private static void restore(final View wrapper) {
        View row = ratingRow(wrapper);
        if (row != null && row.getVisibility() != View.VISIBLE) row.setVisibility(View.VISIBLE);

        View toggle = byId(wrapper, "ratingsToggleIcon");
        if (toggle != null && toggle.getVisibility() != View.VISIBLE) toggle.setVisibility(View.VISIBLE);

        View section = sectionOf(wrapper);
        if (section instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) section;
            View link = vg.findViewWithTag(LINK_TAG);
            if (link != null) vg.removeView(link);
            View overlay = vg.findViewWithTag(OVERLAY_TAG);
            if (overlay != null) vg.removeView(overlay);
        }
    }

    private static void ensureLink(final View wrapper) {
        View section = sectionOf(wrapper);
        if (!(section instanceof RelativeLayout)) return;
        RelativeLayout parent = (RelativeLayout) section;
        if (parent.findViewWithTag(LINK_TAG) != null) return;

        final TextView tv = new TextView(parent.getContext());
        tv.setTag(LINK_TAG);
        tv.setText("Tap to reveal ratings ›");
        tv.setAllCaps(false);
        tv.setTypeface(AppFont.semibold(parent.getContext()));
        tv.setLetterSpacing(0.01f);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        tv.setTextColor(0xFFAEB8C2);
        int padV = Math.round(10f * parent.getResources().getDisplayMetrics().density);
        tv.setPadding(0, padV, 0, padV);

        RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(
                RelativeLayout.LayoutParams.MATCH_PARENT, RelativeLayout.LayoutParams.WRAP_CONTENT);
        View title = byId(wrapper, "sectionTitle");
        if (title != null && title.getId() != View.NO_ID) {
            lp.addRule(RelativeLayout.BELOW, title.getId());
        }
        tv.setLayoutParams(lp);

        tv.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Haptics.tap(v);
                REVEALED.put(wrapper, Boolean.TRUE);
                restore(wrapper);
            }
        });
        parent.addView(tv);
    }

    private static void ensureOverlay(final View wrapper, String cover) {
        View row = ratingRow(wrapper);
        if (row == null || !(row.getParent() instanceof RelativeLayout)) return;
        RelativeLayout section = (RelativeLayout) row.getParent();
        if (section.findViewWithTag(OVERLAY_TAG) != null) return;
        if (row.getId() == View.NO_ID) row.setId(View.generateViewId());

        int mode;
        if ("shimmer".equals(cover)) mode = SpoilerOverlayView.SHIMMER;
        else if ("burst".equals(cover)) mode = SpoilerOverlayView.BURST;
        else mode = SpoilerOverlayView.PANEL;

        int transition;
        String animation = Prefs.revealAnimation();
        if ("crumble".equals(animation)) transition = SpoilerOverlayView.CRUMBLE;
        else if ("confetti".equals(animation)) transition = SpoilerOverlayView.CONFETTI;
        else transition = SpoilerOverlayView.DEFAULT;

        int[] palette = null;
        if (transition == SpoilerOverlayView.CONFETTI) {
            String confettiColor = Prefs.confettiColor();
            if ("letterboxd".equals(confettiColor)) {
                palette = ConfettiPalette.LETTERBOXD;
            } else if ("red".equals(confettiColor)) {
                palette = ConfettiPalette.RED;
            } else {
                int accent = AccentPresets.previewColor(wrapper.getContext(),
                        Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(wrapper.getContext())),
                        Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));
                palette = ConfettiPalette.forAccent(accent);
            }
        }

        SpoilerOverlayView overlay = new SpoilerOverlayView(section.getContext(), mode, transition, palette);
        overlay.setTag(OVERLAY_TAG);
        RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(0, 0);
        lp.addRule(RelativeLayout.ALIGN_TOP, row.getId());
        lp.addRule(RelativeLayout.ALIGN_BOTTOM, row.getId());
        lp.addRule(RelativeLayout.ALIGN_START, row.getId());
        lp.addRule(RelativeLayout.ALIGN_END, row.getId());
        // Negative margins outset the overlay past the row so nothing at the edges
        // (endpoint star, RatingView stars) can peek out. Top is left flush so the
        // section title stays clear.
        int over = Math.round(4f * section.getResources().getDisplayMetrics().density);
        lp.bottomMargin = -over;
        lp.leftMargin = -over;
        lp.rightMargin = -over;
        overlay.setLayoutParams(lp);
        overlay.setOnRevealListener(new SpoilerOverlayView.OnReveal() {
            @Override
            public void onReveal() {
                REVEALED.put(wrapper, Boolean.TRUE);
                restore(wrapper);
            }
        });
        section.addView(overlay);
        overlay.bringToFront();
    }

    /** The unnamed horizontal row holding the endpoint stars, histogram, average and RatingView. */
    private static View ratingRow(View wrapper) {
        View graph = byId(wrapper, "ratingsView");
        if (graph == null) return null;
        ViewParent p = graph.getParent();
        return (p instanceof View) ? (View) p : null;
    }

    /** The RelativeLayout holding the section title, toggle icon and the rating row. */
    private static View sectionOf(View wrapper) {
        View row = ratingRow(wrapper);
        if (row == null) return null;
        ViewParent p = row.getParent();
        return (p instanceof View) ? (View) p : null;
    }

    private static View byId(View root, String name) {
        try {
            int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
            return id == 0 ? null : root.findViewById(id);
        } catch (Throwable t) {
            return null;
        }
    }

    // --- watched state -----------------------------------------------------

    private static int readWatchedState(Fragment fragment) throws Exception {
        if (mGetModel == null) {
            mGetModel = fragment.getClass().getDeclaredMethod("getModel");
            mGetModel.setAccessible(true);
        }
        Object vm = mGetModel.invoke(fragment);
        if (vm == null) return UNKNOWN;

        if (mGetRelationship == null) mGetRelationship = vm.getClass().getMethod("getMemberRelationship");
        Object stateFlow = mGetRelationship.invoke(vm);
        if (stateFlow == null) return UNKNOWN;

        if (mGetValue == null) mGetValue = stateFlow.getClass().getMethod("getValue");
        Object relationship = mGetValue.invoke(stateFlow);
        if (relationship == null) return UNKNOWN;

        if (mGetWatched == null) mGetWatched = relationship.getClass().getMethod("getWatched");
        Object watched = mGetWatched.invoke(relationship);
        return (watched instanceof Boolean && (Boolean) watched) ? WATCHED : NOT_WATCHED;
    }
}
