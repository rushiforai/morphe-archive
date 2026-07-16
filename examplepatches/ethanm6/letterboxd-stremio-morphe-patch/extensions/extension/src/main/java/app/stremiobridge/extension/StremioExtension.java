package app.stremiobridge.extension;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;

import androidx.fragment.app.Fragment;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

/**
 * Stremio Bridge extension for Letterboxd 3.5.3 (versionCode 495).
 *
 * <p>Merged into the patched APK's DEX pool and called from two separate
 * injected smali instructions (see AddStremioButtonPatch.kt):
 *
 * <ol>
 *   <li>{@link #cacheImdbId(Object)} — injected into FilmFragment.updateData
 *       at index 0. Caches the current film's IMDb ID into a static field
 *       so it's available by the time the user can tap the button.</li>
 *   <li>{@link #onTrailerConfigured(Fragment, Object, Object)} — injected
 *       into FilmHeaderFragment.configureTrailer at index 0. Creates and
 *       positions the Stremio button.</li>
 * </ol>
 *
 * <p>The real trailerButton (android.widget.Button) always exists in the
 * layout; when there's no trailer, Letterboxd just sets its visibility to
 * GONE rather than removing it. The Stremio button is built with an
 * explicit solid-purple rounded-pill background (rather than cloning the
 * trailer button's own background drawable, which produced an unreliable,
 * washed-out color), while its icon, text size, typeface, and padding are
 * still copied live from the real trailer button for a consistent look.</p>
 */
public final class StremioExtension {

    private static final String TAG     = "StremioExt";
    private static final int    PURPLE  = 0xFF7B5EA7;
    private static final String BTN_TAG = "stremio_btn_v2";
    private static final String WRAPPER_TAG = "stremio_wrapper_v1";

    /**
     * Most recently cached IMDb ID, set by {@link #cacheImdbId(Object)}
     * and read when the Stremio button is tapped. Cleared per film load
     * by being overwritten (or set to null if the film has no IMDb link).
     */
    private static volatile String sCachedImdbId = null;

    /**
     * Weak reference to the most recently created Stremio button.
     * cacheImdbId and onTrailerConfigured can run in either order within a
     * film-page load, so the button's visibility is set from the cached ID
     * at build time AND re-applied here whenever new film data arrives.
     */
    private static volatile WeakReference<Button> sButtonRef = null;

    // ── Entry point 1: cache the IMDb ID ────────────────────────────────────

    /**
     * @param filmResultsObj FilmViewModel$FilmResults, passed as Object to
     *                       avoid a hard classpath dependency on
     *                       Letterboxd's internal, obfuscation-prone model.
     */
    public static void cacheImdbId(Object filmResultsObj) {
        sCachedImdbId = extractImdbId(filmResultsObj);
        Log.d(TAG, "Cached IMDb ID: " + sCachedImdbId);
        updateButtonVisibility();
    }

    /**
     * Shows the Stremio button only when the current film has an IMDb link,
     * mirroring the trailer button's own behavior (hidden via GONE when the
     * film has no trailer). Safe to call from any thread; the visibility
     * change is posted to the button's UI thread.
     */
    private static void updateButtonVisibility() {
        WeakReference<Button> ref = sButtonRef;
        final Button button = (ref != null) ? ref.get() : null;
        if (button == null) return;
        String id = sCachedImdbId;
        final boolean show = id != null && !id.isEmpty();
        button.post(() ->
            button.setVisibility(show ? View.VISIBLE : View.GONE));
    }

    private static String extractImdbId(Object filmResultsObj) {
        if (filmResultsObj == null) return null;
        try {
            Object film  = call(filmResultsObj, "getFilm");
            if (film == null) return null;
            Object links = call(film, "getLinks");
            if (!(links instanceof List)) return null;
            for (Object link : (List<?>) links) {
                Object type = call(link, "getType");
                if (type != null && type.getClass().getSimpleName().contains("Imdb")) {
                    Object id = call(link, "getId");
                    if (id instanceof String && !((String) id).isEmpty())
                        return (String) id;
                }
            }
        } catch (Exception e) {
            Log.d(TAG, "extractImdbId: " + e.getMessage());
        }
        return null;
    }

    private static Object call(Object target, String method) throws Exception {
        Method m = target.getClass().getMethod(method);
        return m.invoke(target);
    }

    // ── Entry point 2: create and position the button ───────────────────────

    public static void onTrailerConfigured(Fragment fragment, Object trailerObj, Object bindingObj) {
        if (bindingObj == null) return;

        Button trailerButton = getTrailerButton(bindingObj);
        if (trailerButton == null) return;

        // The trailer button lives inside a small HORIZONTAL LinearLayout row
        // alongside a separator dot and the runtime text ("96 mins"):
        //
        //   [ TRAILER ]  ·  96 mins        (LinearLayout, horizontal)
        //
        // We want:
        //
        //   [ TRAILER ]
        //   [ Stremio ]  ·  96 mins        (buttons stacked, text centered)
        //
        // To do this we insert a NEW vertical LinearLayout into the row in
        // the trailer button's slot, move the trailer button into it, and add
        // the Stremio clone directly beneath. We also set the row's gravity to
        // center_vertical so the dot + runtime text center against the taller
        // two-button stack, filling the open space.
        Object rowObj = trailerButton.getParent();
        if (!(rowObj instanceof LinearLayout)) {
            // Defensive fallback for an unexpected parent type: just drop the
            // button in after the trailer button so it's at least usable.
            if (rowObj instanceof ViewGroup) {
                ViewGroup p = (ViewGroup) rowObj;
                if (p.findViewWithTag(BTN_TAG) == null) {
                    Button b = cloneTrailerButton(trailerButton);
                    b.setOnClickListener(
                        v -> openInStremio(v.getContext(), sCachedImdbId));
                    p.addView(b, p.indexOfChild(trailerButton) + 1);
                    applyInitialVisibility(b);
                }
            }
            return;
        }
        LinearLayout row = (LinearLayout) rowObj;

        // Idempotent: don't insert twice on rebind (e.g. configuration change).
        if (row.findViewWithTag(WRAPPER_TAG) != null) return;

        Context ctx = trailerButton.getContext();
        int trailerIndex = row.indexOfChild(trailerButton);
        ViewGroup.LayoutParams trailerOriginalParams = trailerButton.getLayoutParams();
        boolean hasTrailer = trailerObj != null;

        // The Stremio clone is now constructed as the SAME widget class as the
        // trailer button (MaterialButton) with the same insets, padding, icon
        // size, corner radius, text size, and minHeight. That means it derives
        // the IDENTICAL height from wrap_content — no need to measure or force a
        // pixel height (forcing height was what made it too tall with off-center
        // text, because a plain Button can't match a MaterialButton's model).

        // Build the vertical wrapper that takes the trailer button's slot.
        LinearLayout wrapper = new LinearLayout(ctx);
        wrapper.setTag(WRAPPER_TAG);
        wrapper.setOrientation(LinearLayout.VERTICAL);
        wrapper.setLayoutParams(cloneLayoutParams(trailerOriginalParams));

        // Move the real trailer button into the wrapper unchanged (it keeps its
        // natural sizing; if GONE it simply takes no space).
        row.removeView(trailerButton);
        trailerButton.setLayoutParams(new LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.WRAP_CONTENT,
            LinearLayout.LayoutParams.WRAP_CONTENT));
        wrapper.addView(trailerButton);

        // Build the Stremio clone beneath it. Both buttons attach at natural
        // wrap_content width first — this is the v1.0.8 baseline that always
        // renders correctly (each hugs its own label, nothing wraps).
        Button stremioButton = cloneTrailerButton(trailerButton);
        LinearLayout.LayoutParams stremioParams = new LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.WRAP_CONTENT,
            LinearLayout.LayoutParams.WRAP_CONTENT);
        // Small gap below the trailer button when one is shown. With no trailer
        // the trailer button is GONE (zero height) so no gap is needed.
        if (hasTrailer) {
            stremioParams.topMargin = dpToPx(ctx, 8);
        }
        stremioButton.setLayoutParams(stremioParams);
        wrapper.addView(stremioButton);

        // Equalize the two buttons' widths to the LARGER of the two, applied
        // BEFORE the first frame is drawn (via an OnPreDrawListener on the
        // wrapper) so there's no visible snap of the trailer text re-centering.
        // Equalizing only ever WIDENS the narrower button, so text never wraps.
        if (hasTrailer) {
            equalizeWidthsBeforeDraw(wrapper, trailerButton, stremioButton);
        }

        // Put the wrapper back where the trailer button was.
        row.addView(wrapper, trailerIndex);

        // Vertically center the row's remaining children (separator dot +
        // runtime text) against the button stack so the open space is even.
        row.setGravity(android.view.Gravity.CENTER_VERTICAL);

        stremioButton.setOnClickListener(
            v -> openInStremio(v.getContext(), sCachedImdbId));

        // Like the trailer button when there's no trailer: hidden (GONE, still
        // in the layout) when the film has no IMDb link. cacheImdbId may run
        // before or after this point, so visibility is set from the current
        // cache here and re-applied by updateButtonVisibility when data lands.
        applyInitialVisibility(stremioButton);

        Log.d(TAG, "Stremio button inserted (hasTrailer=" + hasTrailer + ")");
    }

    /** Registers the button for visibility updates and applies the current one. */
    private static void applyInitialVisibility(Button stremioButton) {
        sButtonRef = new WeakReference<>(stremioButton);
        String id = sCachedImdbId;
        stremioButton.setVisibility(
            (id != null && !id.isEmpty()) ? View.VISIBLE : View.GONE);
    }

    // ── Reflection: pull the real Button out of the generated binding ──────

    private static Button getTrailerButton(Object bindingObj) {
        try {
            Field f = bindingObj.getClass().getField("trailerButton");
            Object value = f.get(bindingObj);
            return (value instanceof Button) ? (Button) value : null;
        } catch (Exception e) {
            Log.d(TAG, "getTrailerButton: " + e.getMessage());
            return null;
        }
    }

    // ── Cloning the real button's appearance ────────────────────────────────

    /**
     * Builds a Stremio button that is dimensionally identical to the trailer
     * button.
     *
     * <p>Critical detail discovered from the decompiled layout: the trailer
     * button is NOT a plain android.widget.Button — it is a
     * com.google.android.material.button.MaterialButton (it carries Material-
     * only attributes: app:icon, app:iconSize, app:iconPadding, a Material
     * widget style, and insetTop/insetBottom). A plain Button computes its
     * height with a different padding/inset model, so it can never match a
     * MaterialButton's dimensions — which is why earlier clones were always
     * slightly too tall with vertically off-center text.
     *
     * <p>The fix is to construct the clone as a MaterialButton and copy the
     * dimensional properties that define its height and text centering:
     * insets, padding, icon size/padding/gravity, corner radius, min height,
     * text size/appearance, letter spacing, and includeFontPadding. Material
     * API calls go through reflection so this compiles regardless of how the
     * source field is typed and tolerates minor version differences.
     */
    private static Button cloneTrailerButton(Button source) {
        Context ctx = source.getContext();

        // Construct the SAME widget class as the trailer button at runtime
        // (MaterialButton), so the height/inset/icon model matches exactly.
        Button clone;
        Class<?> srcClass = source.getClass();
        try {
            clone = (Button) srcClass.getConstructor(Context.class).newInstance(ctx);
        } catch (Exception e) {
            // Fallback: try MaterialButton by name, else plain Button.
            Button mb = tryNewMaterialButton(ctx);
            clone = (mb != null) ? mb : new Button(ctx);
        }
        clone.setTag(BTN_TAG);

        // ── Dimensional properties (the things that decide height/centering) ──
        clone.setMinHeight(source.getMinHeight());
        clone.setMinimumHeight(source.getMinimumHeight());
        // Force minWidth to 0 so the button hugs its text. The default Material
        // button style applies an 88dp minWidth that stretched Stremio wider
        // than the trailer button; the trailer button itself uses wrap_content
        // (minWidth -2 in XML), so zero here matches its content-hugging width.
        clone.setMinWidth(0);
        clone.setMinimumWidth(0);
        clone.setPadding(
            source.getPaddingLeft(), source.getPaddingTop(),
            source.getPaddingRight(), source.getPaddingBottom());
        try {
            clone.setPaddingRelative(
                source.getPaddingStart(), source.getPaddingTop(),
                source.getPaddingEnd(), source.getPaddingBottom());
        } catch (Exception ignored) { }

        // Material-specific dimensional props via reflection (insets, icon).
        // These directly affect rendered height & centering. The corner radius
        // is NOT copied — the source reports 0 (its pill comes from a Material
        // shapeAppearance); forcePillShape sets the real radius below.
        copyMaterialDimensions(source, clone);
        copyRippleColor(source, clone);

        // ── Text appearance ──────────────────────────────────────────────────
        clone.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, source.getTextSize());
        clone.setTypeface(source.getTypeface());
        clone.setTextColor(source.getCurrentTextColor());
        clone.setAllCaps(true);
        clone.setLetterSpacing(source.getLetterSpacing());
        clone.setGravity(source.getGravity());
        clone.setIncludeFontPadding(source.getIncludeFontPadding());
        clone.setElevation(source.getElevation());

        // ── Purple pill background ───────────────────────────────────────────
        // Tint the Material background purple (preserves the Material shape &
        // inset model so height stays identical to the trailer button).
        boolean isMaterial = applyMaterialPurple(clone);
        if (!isMaterial) {
            float r = android.util.TypedValue.applyDimension(
                android.util.TypedValue.COMPLEX_UNIT_DIP, 24,
                ctx.getResources().getDisplayMetrics());
            android.graphics.drawable.GradientDrawable pill =
                new android.graphics.drawable.GradientDrawable();
            pill.setShape(android.graphics.drawable.GradientDrawable.RECTANGLE);
            pill.setCornerRadius(r);
            pill.setColor(PURPLE);
            clone.setBackground(pill);
        } else {
            // The trailer button's fully-rounded pill comes from a Material
            // shapeAppearance, which getCornerRadius() reports as 0 — so the
            // copied value gives a near-square rectangle. Force a fully-rounded
            // pill explicitly: once the button has a height, set its corner
            // radius to half that height. The exact radius is applied from an
            // OnPreDrawListener (after measure, before the first paint) so the
            // first visible frame already has the true pill shape; the
            // immediate call sets a close fixed-dp fallback until then.
            forcePillShape(clone);
            setPillRadiusBeforeDraw(clone);
        }

        // ── Icon (the play triangle) ─────────────────────────────────────────
        // MaterialButton uses app:icon (not a compound drawable). Copy it via
        // reflection; if that fails, fall back to compound drawables.
        if (!copyMaterialIcon(source, clone)) {
            Drawable[] rel = source.getCompoundDrawablesRelative();
            Drawable[] abs = source.getCompoundDrawables();
            if (rel[0] != null || rel[2] != null) {
                clone.setCompoundDrawablesRelativeWithIntrinsicBounds(
                    rel[0], rel[1], rel[2], rel[3]);
            } else {
                clone.setCompoundDrawablesWithIntrinsicBounds(
                    abs[0], abs[1], abs[2], abs[3]);
            }
            clone.setCompoundDrawablePadding(source.getCompoundDrawablePadding());
        }

        clone.setText("Stremio");
        clone.setContentDescription("Open in Stremio");
        return clone;
    }

    private static Button tryNewMaterialButton(Context ctx) {
        try {
            Class<?> mb = Class.forName(
                "com.google.android.material.button.MaterialButton");
            return (Button) mb.getConstructor(Context.class).newInstance(ctx);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Forces a MaterialButton into a fully-rounded "pill" shape by setting its
     * cornerRadius to half its height (a stadium shape). The trailer button's
     * roundness comes from a Material shapeAppearance, which getCornerRadius()
     * reports as 0, so copying that value yields a near-square rectangle — this
     * restores the pill look. Before the button is measured, falls back to a
     * large fixed radius so it still looks rounded on first paint.
     */
    private static void forcePillShape(Button clone) {
        try {
            int h = clone.getHeight();
            int radius;
            if (h > 0) {
                radius = h / 2;
            } else {
                radius = (int) android.util.TypedValue.applyDimension(
                    android.util.TypedValue.COMPLEX_UNIT_DIP, 20,
                    clone.getContext().getResources().getDisplayMetrics());
            }
            clone.getClass().getMethod("setCornerRadius", int.class)
                .invoke(clone, radius);
        } catch (Exception ignored) { }
    }

    /**
     * Applies the true pill radius (half the measured height) from an
     * OnPreDrawListener, which fires after measure/layout but before the first
     * paint — so the button is never painted with the approximate fallback
     * radius set by the immediate forcePillShape() call. Removes itself once
     * the height is available.
     */
    private static void setPillRadiusBeforeDraw(final Button clone) {
        final android.view.ViewTreeObserver vto = clone.getViewTreeObserver();
        vto.addOnPreDrawListener(new android.view.ViewTreeObserver.OnPreDrawListener() {
            @Override public boolean onPreDraw() {
                if (clone.getHeight() <= 0) return true; // not measured yet
                android.view.ViewTreeObserver live = clone.getViewTreeObserver();
                if (live.isAlive()) live.removeOnPreDrawListener(this);
                forcePillShape(clone);
                return true;
            }
        });
    }

    /**
     * Copies the MaterialButton press-ripple color so touch feedback on the
     * purple pill matches the trailer button's, rather than the theme default
     * (which is calibrated against the original background color). No-op if
     * either button isn't a MaterialButton.
     */
    private static void copyRippleColor(Button source, Button clone) {
        try {
            Object ripple = source.getClass().getMethod("getRippleColor").invoke(source);
            if (ripple instanceof android.content.res.ColorStateList) {
                clone.getClass()
                    .getMethod("setRippleColor", android.content.res.ColorStateList.class)
                    .invoke(clone, ripple);
            }
        } catch (Exception ignored) { }
    }

    /**
     * Copies MaterialButton dimensional properties (insets, icon size/padding/
     * gravity) from source to clone via reflection. No-op if either isn't a
     * MaterialButton.
     */
    private static void copyMaterialDimensions(Button source, Button clone) {
        // int getters with matching setters
        String[][] intProps = {
            {"getInsetTop", "setInsetTop"},
            {"getInsetBottom", "setInsetBottom"},
            {"getIconSize", "setIconSize"},
            {"getIconPadding", "setIconPadding"},
            {"getIconGravity", "setIconGravity"},
        };
        for (String[] pair : intProps) {
            try {
                Object val = source.getClass().getMethod(pair[0]).invoke(source);
                if (val instanceof Integer) {
                    clone.getClass().getMethod(pair[1], int.class).invoke(clone, val);
                }
            } catch (Exception ignored) { }
        }
    }

    /** Copies the MaterialButton app:icon. Returns false if not applicable. */
    private static boolean copyMaterialIcon(Button source, Button clone) {
        try {
            Object icon = source.getClass().getMethod("getIcon").invoke(source);
            if (icon instanceof Drawable) {
                clone.getClass().getMethod("setIcon", Drawable.class).invoke(clone, icon);
                // Match icon tint to the text color so it reads on purple.
                try {
                    clone.getClass()
                        .getMethod("setIconTint", android.content.res.ColorStateList.class)
                        .invoke(clone, android.content.res.ColorStateList.valueOf(
                            source.getCurrentTextColor()));
                } catch (Exception ignored) { }
                return true;
            }
        } catch (Exception ignored) { }
        return false;
    }

    /**
     * Applies the Stremio purple as a MaterialButton background tint, which
     * preserves the Material shape & inset model (so height stays identical).
     * Returns false if clone isn't a MaterialButton.
     */
    private static boolean applyMaterialPurple(Button clone) {
        try {
            clone.getClass()
                .getMethod("setBackgroundTintList",
                    android.content.res.ColorStateList.class)
                .invoke(clone, android.content.res.ColorStateList.valueOf(PURPLE));
            return clone.getClass().getName().contains("MaterialButton");
        } catch (Exception e) {
            return false;
        }
    }

    private static ViewGroup.LayoutParams cloneLayoutParams(ViewGroup.LayoutParams source) {
        if (source instanceof LinearLayout.LayoutParams) {
            return new LinearLayout.LayoutParams((LinearLayout.LayoutParams) source);
        }
        if (source instanceof ViewGroup.MarginLayoutParams) {
            return new ViewGroup.MarginLayoutParams((ViewGroup.MarginLayoutParams) source);
        }
        return new ViewGroup.LayoutParams(source);
    }

    private static int dpToPx(Context ctx, int dp) {
        return (int) android.util.TypedValue.applyDimension(
            android.util.TypedValue.COMPLEX_UNIT_DIP, dp,
            ctx.getResources().getDisplayMetrics());
    }

    /**
     * Makes two buttons the same width by widening the narrower one to match
     * the wider, applying the change BEFORE the first frame is drawn so there
     * is no visible "snap" (e.g. the trailer text re-centering after it has
     * already been painted at its natural width).
     *
     * <p>Uses an OnPreDrawListener on the wrapper: it fires after measure and
     * layout (so getWidth() is reliable) but before the draw pass, so the
     * buttons are only ever painted at their final equalized width. This is
     * the key difference from a post()/postDelayed approach, which runs a frame
     * LATER — after the natural-width paint — and therefore shows the snap.
     *
     * <p>Equalizing only ever WIDENS the narrower button beyond its natural
     * content width, so text can never wrap or clip.
     */
    private static void equalizeWidthsBeforeDraw(final ViewGroup wrapper,
                                                 final Button a, final Button b) {
        final android.view.ViewTreeObserver vto = wrapper.getViewTreeObserver();
        vto.addOnPreDrawListener(new android.view.ViewTreeObserver.OnPreDrawListener() {
            @Override public boolean onPreDraw() {
                int wa = a.getWidth();
                int wb = b.getWidth();
                if (wa <= 0 || wb <= 0) {
                    // Not measured yet — let this frame proceed and check again
                    // on the next pre-draw (listener stays registered).
                    return true;
                }
                // Done measuring: detach this listener so it runs only once.
                android.view.ViewTreeObserver live = wrapper.getViewTreeObserver();
                if (live.isAlive()) live.removeOnPreDrawListener(this);

                if (wa != wb) {
                    int target = Math.max(wa, wb);
                    boolean changed = false;
                    changed |= applyFixedWidth(a, target);
                    changed |= applyFixedWidth(b, target);
                    if (changed) {
                        // Widths changed this frame — request another layout and
                        // skip drawing THIS frame so the very first painted frame
                        // already shows the equalized widths (no visible snap).
                        wrapper.requestLayout();
                        return false;
                    }
                }
                return true; // proceed with drawing
            }
        });
    }

    /**
     * Sets an exact pixel width on a button, centering its content. Returns
     * true if the width actually changed (so the caller can re-layout).
     */
    private static boolean applyFixedWidth(Button button, int width) {
        ViewGroup.LayoutParams lp = button.getLayoutParams();
        if (lp == null || lp.width == width) return false;
        lp.width = width;
        button.setLayoutParams(lp);
        button.setGravity(android.view.Gravity.CENTER);
        return true;
    }

    // ── Stremio launch ────────────────────────────────────────────────────

    public static void openInStremio(Context ctx, String imdbId) {
        if (imdbId != null && !imdbId.isEmpty()) {
            String id = imdbId.startsWith("tt") ? imdbId : "tt" + imdbId;
            launch(ctx,
                Uri.parse("stremio://detail/movie/" + id + "/" + id),
                Uri.parse("https://web.stremio.com/#/detail/movie/" + id));
        } else {
            launch(ctx,
                Uri.parse("stremio://board"),
                Uri.parse("https://web.stremio.com"));
        }
    }

    /**
     * Tries the stremio:// deep link first and falls back to the web player
     * if no app handles it. Uses try/catch rather than
     * PackageManager.resolveActivity, which is subject to Android 11+
     * package-visibility filtering and only works today because the host
     * app's own <queries> declaration happens to be broad enough.
     */
    private static void launch(Context ctx, Uri appUri, Uri webUri) {
        try {
            ctx.startActivity(new Intent(Intent.ACTION_VIEW, appUri));
        } catch (ActivityNotFoundException e) {
            ctx.startActivity(new Intent(Intent.ACTION_VIEW, webUri));
        }
    }

    private StremioExtension() {}
}
