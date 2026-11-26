/*
 * Copyright 2026 Morphe.
 * Copyright (C) 2026 lavinhoque33
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 * Written by lavinhoque33, 2026-11-13.
 */

package app.morphe.extension.music.patches;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Outline;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.media.session.PlaybackState;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.TextAppearanceSpan;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.animation.LinearInterpolator;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.music.patches.player.PlayerPatch;
import app.morphe.extension.music.patches.utils.MusicLightTheme;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.shared.settings.preference.SeekBarPreference;
import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.ui.glass.GlassBackdrop;
import app.morphe.extension.shared.ui.glass.GlassCapsuleDrawable;

/**
 * Draws the floating miniplayer of YouTube Music (9.39+) as a rounded, translucent glass card
 * ({@link GlassCapsuleDrawable}), with the page behind it blurred like the glass navigation bar.
 * <p>
 * While the player is collapsed into the miniplayer (either at the bottom of the screen or pinned
 * at the top while the lyrics, comments, or queue sheets are open), the artwork is rounded with
 * corners that follow the card, or is round and spins while a song plays, the progress bar of the
 * player ends before the rounded corners, and the background of the player around the card is
 * faded out, so the page shows around it. Everything is put back when the full player opens.
 */
@SuppressWarnings("unused")
public final class MusicGlassMiniplayer {

    private static final int MINI_PLAYER = getId("mini_player");
    private static final int PLAYER_PAGE = getId("player_page");
    private static final int MINIPLAYER_SCRIM = getId("mini_player_scrim");

    /**
     * The artwork (the player) and the artwork of the songs that can be swiped to.
     */
    private static final int[] ARTWORKS = {
            getId("watch_fragment_container"),
            getId("swipeable_mini_player_thumbnail_container")
    };

    private static final int[] BUTTONS = {
            getId("mini_player_previous_button"),
            getId("mini_player_play_pause_replay_button"),
            getId("mini_player_next_button")
    };

    private static int lightGlassSurface = MusicLightTheme.SURFACE;

    /**
     * Added during patching to the class of the time bars, of which the miniplayer has one next to it
     * that has no id.
     */
    public interface TimeBar {
    }

    static final boolean ENABLED = Settings.MINIPLAYER_GLASS.get() && MINI_PLAYER != 0;

    /**
     * The least room between the buttons and the end of the card.
     */
    private static final int BUTTONS_END_ROOM = Dim.dp8;
    private static final int MIN_ARTWORK_RADIUS = Dim.dp(6);
    private static final long SPIN_MILLISECONDS = 10_000;

    /**
     * The style of the glass, read again when the app comes back from the settings.
     */
    private static float opacityScale;
    private static float rimScale;
    private static float blurRadius;
    private static boolean lightTint;
    private static boolean albumTint;
    private static boolean spinningArtwork;
    private static boolean progressBarShown;
    private static int cornerRadius;
    private static int artworkPadding;

    static {
        readSettings();
    }

    private static WeakReference<View> currentMiniplayer = new WeakReference<>(null);
    private static WeakReference<GlassCapsuleDrawable> currentGlass = new WeakReference<>(null);
    private static boolean lookupPosted;

    /**
     * If the miniplayer was styled as collapsed in the last frame.
     */
    private static boolean styled;

    private static volatile boolean playing;

    /**
     * Outline and clip of the artworks before they were rounded.
     */
    private static final Map<View, ViewOutlineProvider> artworkOutlines = new WeakHashMap<>();
    private static final Map<View, Boolean> artworkClips = new WeakHashMap<>();
    private static final Map<View, ObjectAnimator> spinAnimators = new WeakHashMap<>();
    private static final Map<Drawable, Integer> fadedBackgrounds = new WeakHashMap<>();
    private static WeakReference<View> clippedTimeBar = new WeakReference<>(null);
    private static final Map<View, Boolean> movedArtworks = new WeakHashMap<>();
    private static WeakReference<View> currentPlayerPage = new WeakReference<>(null);
    private static final Rect playerClip = new Rect();
    private static final int[] location = new int[2];
    private static final int[] miniplayerLocation = new int[2];

    private MusicGlassMiniplayer() {
    }

    private static int getId(String name) {
        return ResourceUtils.getIdentifier(ResourceType.ID, name);
    }

    private static void readSettings() {
        opacityScale = SeekBarPreference.clampToRange(Settings.MINIPLAYER_GLASS_OPACITY) / 50f;
        rimScale = SeekBarPreference.clampToRange(Settings.MINIPLAYER_GLASS_RIM) / 50f;
        blurRadius = Dim.dp(SeekBarPreference.clampToRange(Settings.MINIPLAYER_GLASS_BLUR));
        lightTint = Settings.MINIPLAYER_GLASS_LIGHT.get();
        albumTint = Settings.MINIPLAYER_GLASS_ALBUM_TINT.get();
        spinningArtwork = Settings.MINIPLAYER_GLASS_SPINNING_ARTWORK.get();
        progressBarShown = !Settings.MINIPLAYER_GLASS_HIDE_PROGRESS_BAR.get();
        cornerRadius = Dim.dp(SeekBarPreference.clampToRange(Settings.MINIPLAYER_GLASS_CORNER_RADIUS));
        artworkPadding = Dim.dp(SeekBarPreference.clampToRange(Settings.MINIPLAYER_GLASS_ARTWORK_PADDING));
    }

    /**
     * @return The corner radius of a card with this height, at most half of it.
     */
    public static float getCornerRadius(float cornerRadius, float height) {
        return app.morphe.extension.shared.ui.glass.GlassCapsuleGeometry.cornerRadius(cornerRadius, height);
    }

    /**
     * @return The corner radius of the artwork, so its corners follow the corners of the card.
     */
    public static float getArtworkRadius(float cardRadius, float padding) {
        return app.morphe.extension.shared.ui.glass.GlassCapsuleGeometry.artworkRadius(
                cardRadius, padding, MIN_ARTWORK_RADIUS);
    }

    /**
     * Injection point.
     */
    public static void onSetPlaybackState(@Nullable PlaybackState state) {
        if (!ENABLED || !spinningArtwork || state == null) return;

        final boolean nowPlaying = state.getState() == PlaybackState.STATE_PLAYING;
        if (nowPlaying == playing) return;
        playing = nowPlaying;

        Utils.runOnMainThread(MusicGlassMiniplayer::updateSpinning);
    }

    /**
     * Called when the color of the album art changes, or the player is closed.
     */
    public static void onAlbumColorChanged() {
        GlassCapsuleDrawable glass = currentGlass.get();
        if (glass != null) {
            Utils.runOnMainThread(() -> updateGlassTint(glass));
        }
    }

    private static int getTintColor() {
        return albumTint ? MusicGlassNavigationBar.getAlbumColor() : 0;
    }

    private static void updateGlassTint(GlassCapsuleDrawable glass) {
        final int tint = getTintColor();
        glass.setTintColor(tint);
        if (MusicLightTheme.isEnabled()) {
            lightGlassSurface = MusicChromeColors.glassSurface(tint, opacityScale, lightTint);
        }
    }

    /** Injection point in the native watch-while layout, including when the player inflates later. */
    public static void onLightWatchLayoutInflated(View layout) {
        if (MusicLightTheme.isEnabled() && MINI_PLAYER != 0) {
            new LightMiniplayerChrome(layout);
        }
    }

    /** Injection point for both stock and swipeable miniplayer title binds. */
    @Nullable
    public static CharSequence useLightMiniplayerTitleColor(View view, @Nullable CharSequence title) {
        if (!MusicLightTheme.isEnabled() || !(title instanceof Spanned styledTitle)) return title;

        return LightMiniplayerChrome.useTitleViewColor(view.getContext(), styledTitle);
    }

    private static final class LightMiniplayerChrome implements View.OnAttachStateChangeListener,
            ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnPreDrawListener {
        private static final int[] LEGACY_SKIP_BUTTONS = {getId("TOP_START"), getId("TOP_END")};
        private static final int TITLE = getId("mini_player_title");
        private static final int SUBTITLE = getId("mini_player_subtitle");
        private static final int SWIPE_PAGER = getId("mini_player_view_pager_container");
        private static final int SWIPE_TITLE = getId("swipeable_mini_player_title");
        private static final int SWIPE_SUBTITLE = getId("swipeable_mini_player_subtitle");
        private static final int TITLE_WHITE = ResourceUtils.getIdentifier(ResourceType.COLOR, "ytm_color_white");
        private static final int TITLE_MUTED =
                ResourceUtils.getIdentifier(ResourceType.COLOR, "ytm_text_color_secondary_translucent");

        private final View layout;
        @Nullable
        private ViewTreeObserver observer;
        @Nullable
        private View miniplayer;
        @Nullable
        private View swipePager;
        @Nullable
        private TextView title;
        @Nullable
        private TextView subtitle;
        private final ImageView[] controls = new ImageView[BUTTONS.length + LEGACY_SKIP_BUTTONS.length];
        private int surface;
        private int primary;
        private int secondary;
        @Nullable
        private ColorStateList controlTint;

        LightMiniplayerChrome(View layout) {
            this.layout = layout;
            layout.addOnAttachStateChangeListener(this);
            if (layout.isAttachedToWindow()) onViewAttachedToWindow(layout);
        }

        @Override
        public void onViewAttachedToWindow(View view) {
            observer = view.getViewTreeObserver();
            observer.addOnGlobalLayoutListener(this);
            observer.addOnPreDrawListener(this);
        }

        @Override
        public void onViewDetachedFromWindow(View view) {
            if (observer != null && observer.isAlive()) {
                observer.removeOnGlobalLayoutListener(this);
                observer.removeOnPreDrawListener(this);
            }
            observer = null;
        }

        @Override
        public void onGlobalLayout() {
            if (miniplayer == null) {
                View found = layout.findViewById(MINI_PLAYER);
                if (found == null) return;
                bind(found);
            }

            updatePalette();
            tintControls();
        }

        @Override
        public boolean onPreDraw() {
            if (miniplayer != null && miniplayer.isShown() && updatePalette()) tintControls();
            return true;
        }

        private void bind(View view) {
            miniplayer = view;
            swipePager = SWIPE_PAGER == 0 ? null : layout.findViewById(SWIPE_PAGER);
            title = TITLE != 0 && view.findViewById(TITLE) instanceof TextView text ? text : null;
            subtitle = SUBTITLE != 0 && view.findViewById(SUBTITLE) instanceof TextView text ? text : null;
            bindButtons(view, BUTTONS, 0);
            bindButtons(view, LEGACY_SKIP_BUTTONS, BUTTONS.length);
        }

        private void bindButtons(View view, int[] ids, int start) {
            for (int i = 0; i < ids.length; i++) {
                if (ids[i] != 0 && view.findViewById(ids[i]) instanceof ImageView image) {
                    controls[start + i] = image;
                }
            }
        }

        private boolean updatePalette() {
            final int nextSurface = getSurface();
            if (surface == nextSurface) return false;

            surface = nextSurface;
            final int nextPrimary = MusicChromeColors.foreground(surface);
            final int nextSecondary = MusicChromeColors.secondary(surface, nextPrimary);
            if (controlTint != null && primary == nextPrimary && secondary == nextSecondary) return false;
            if (controlTint == null || primary != nextPrimary) {
                controlTint = MusicChromeColors.controlTint(nextPrimary);
            }

            primary = nextPrimary;
            secondary = nextSecondary;
            return true;
        }

        private int getSurface() {
            Drawable background = miniplayer.getBackground();
            if (background instanceof GlassCapsuleDrawable) return lightGlassSurface;

            Integer album = Settings.CHANGE_MINIPLAYER_COLOR.get() ? PlayerPatch.getLastMiniplayerColor() : null;
            final int defaultSurface = album == null ? MusicLightTheme.SURFACE : album | 0xFF000000;
            return MusicChromeColors.drawableSurface(background, defaultSurface);
        }

        private void tintControls() {
            tintText(title, primary);
            tintText(subtitle, secondary);

            for (ImageView control : controls) {
                if (control != null && control.getImageTintList() != controlTint) {
                    control.setImageTintList(controlTint);
                }
            }
            if (swipePager != null) tintSwipeMetadata(swipePager);
        }

        private void tintSwipeMetadata(View view) {
            if (view instanceof TextView text) {
                if (view.getId() == SWIPE_TITLE) tintText(text, primary);
                if (view.getId() == SWIPE_SUBTITLE) tintText(text, secondary);
            } else if (view instanceof ViewGroup group) {
                for (int i = 0, count = group.getChildCount(); i < count; i++) {
                    tintSwipeMetadata(group.getChildAt(i));
                }
            }
        }

        private static void tintText(@Nullable TextView view, int color) {
            if (view != null && view.getCurrentTextColor() != color) view.setTextColor(color);
        }

        private static Spanned useTitleViewColor(Context context, Spanned title) {
            final TextAppearanceSpan[] spans = title.getSpans(0, title.length(), TextAppearanceSpan.class);
            if (spans.length == 0) return title;

            final int white = TITLE_WHITE == 0 ? 0 : context.getColor(TITLE_WHITE);
            final int muted = TITLE_MUTED == 0 ? 0 : context.getColor(TITLE_MUTED);
            SpannableString tintedTitle = null;
            for (TextAppearanceSpan span : spans) {
                if (!isStockTitleColor(span, white, muted)) continue;

                // Keep all other spans and leave the native metadata object untouched. The title's
                // surface-dependent TextView color now also covers stock color runs on this line.
                if (tintedTitle == null) tintedTitle = new SpannableString(title);
                tintedTitle.removeSpan(span);
            }
            return tintedTitle == null ? title : tintedTitle;
        }

        private static boolean isStockTitleColor(TextAppearanceSpan span, int white, int muted) {
            final ColorStateList colors = span.getTextColor();
            if (colors == null || colors.isStateful() || span.getLinkTextColor() != null
                    || span.getFamily() != null || span.getTextSize() != 0 || span.getTextStyle() != 0) {
                return false;
            }

            final int color = colors.getDefaultColor();
            return color != 0 && (color == white || color == muted);
        }
    }

    /**
     * Looks for the miniplayer once the layout the anchor is in is inflated.
     */
    static void findMiniplayer(View anchor) {
        if (!ENABLED || lookupPosted) return;
        View miniplayer = currentMiniplayer.get();
        if (miniplayer != null && miniplayer.isAttachedToWindow()) return;

        lookupPosted = true;
        anchor.post(() -> {
            lookupPosted = false;
            try {
                View found = anchor.getRootView().findViewById(MINI_PLAYER);
                if (found != null) {
                    apply(found);
                }
            } catch (Exception ex) {
                Logger.printException(() -> "findMiniplayer failure", ex);
            }
        });
    }

    /**
     * @return The bottom of the collapsed miniplayer in the coordinates of the player page,
     *         or {@link Integer#MAX_VALUE} if the player is not collapsed into a glass miniplayer
     *         at the bottom of the screen.
     */
    static int getCollapsedBottom(View playerPage) {
        if (!styled) return Integer.MAX_VALUE;
        View miniplayer = currentMiniplayer.get();
        if (miniplayer == null || !isAtBottom(miniplayer)) return Integer.MAX_VALUE;

        miniplayer.getLocationInWindow(miniplayerLocation);
        playerPage.getLocationInWindow(location);
        return miniplayerLocation[1] - location[1] + miniplayer.getHeight();
    }

    private static void apply(View miniplayer) {
        if (miniplayer == currentMiniplayer.get()) return;
        restore();
        currentMiniplayer = new WeakReference<>(miniplayer);

        CardHost host = new CardHost(miniplayer);
        GlassCapsuleDrawable glass = new GlassCapsuleDrawable(miniplayer, host, opacityScale, lightTint, rimScale);
        updateGlassTint(glass);
        currentGlass = new WeakReference<>(glass);
        miniplayer.setBackground(glass);

        Logger.printDebug(() -> "Glass miniplayer applied");

        float[] lastPlayerPosition = {Float.NaN};

        // The page behind the card is blurred, so the glass is drawn again when the page scrolls.
        miniplayer.getViewTreeObserver().addOnScrollChangedListener(() -> {
            if (styled && currentMiniplayer.get() == miniplayer) {
                miniplayer.invalidate();
            }
        });

        // The settings may have changed while the app was in the background or showed the settings.
        miniplayer.getViewTreeObserver().addOnWindowFocusChangeListener(hasFocus -> {
            if (!hasFocus || currentMiniplayer.get() != miniplayer) return;
            readSettings();
            glass.setStyle(opacityScale, lightTint, rimScale);
            updateGlassTint(glass);
            if (styled) {
                style(miniplayer, getPlayerPage(miniplayer));
            }
            miniplayer.invalidate();
        });

        miniplayer.getViewTreeObserver().addOnPreDrawListener(() -> {
            if (currentMiniplayer.get() != miniplayer) return true;
            try {
                if (miniplayer.getBackground() != glass) {
                    miniplayer.setBackground(glass);
                }

                View playerPage = getPlayerPage(miniplayer);
                if (isCollapsed(miniplayer)) {
                    style(miniplayer, playerPage);
                } else {
                    restore();
                }

                fadePlayerBackground(miniplayer, playerPage);

                // The blurred page is drawn again while the player moves.
                final float playerPosition = playerPage == null
                        ? miniplayer.getTranslationY()
                        : playerPage.getTop() + playerPage.getTranslationY();
                if (playerPosition != lastPlayerPosition[0]) {
                    lastPlayerPosition[0] = playerPosition;
                    miniplayer.invalidate();
                }
            } catch (Exception ex) {
                Logger.printException(() -> "Glass miniplayer pre draw failure", ex);
            }
            return true;
        });
    }

    @Nullable
    private static View getPlayerPage(View miniplayer) {
        View playerPage = currentPlayerPage.get();
        if (playerPage != null && playerPage.isAttachedToWindow()) return playerPage;

        for (ViewParent parent = miniplayer.getParent(); parent instanceof View view; parent = view.getParent()) {
            if (view.getId() == PLAYER_PAGE) {
                currentPlayerPage = new WeakReference<>(view);
                return view;
            }
        }
        return null;
    }

    /**
     * @return If the player is collapsed into the miniplayer (either at the bottom of the screen
     *         or pinned at the top while the lyrics, comments, or queue sheets are open).
     *         Keeping the miniplayer styled while pinned at the top prevents the artwork from
     *         reverting to its unscaled square layout and overflowing the top glass capsule.
     */
    private static boolean isCollapsed(View miniplayer) {
        return miniplayer.isShown() && miniplayer.getAlpha() >= 0.85f && miniplayer.getHeight() > 0;
    }

    /**
     * The background of the player is behind the card, and is faded out while the player is collapsed
     * at the bottom, so the page shows around the rounded corners. It is opaque again while the player opens.
     */
    private static void fadePlayerBackground(View miniplayer, @Nullable View playerPage) {
        if (playerPage == null) return;

        // The miniplayer fades out while the player opens, and the background fades in.
        final int alpha = miniplayer.isShown() && isAtBottom(miniplayer)
                ? Math.round((1 - Math.min(1, miniplayer.getAlpha())) * 255)
                : 255;

        for (ViewParent parent = miniplayer.getParent(); parent instanceof View view; parent = view.getParent()) {
            Drawable background = view.getBackground();
            if (background != null) {
                if (alpha == 255) {
                    Integer original = fadedBackgrounds.remove(background);
                    if (original != null) background.setAlpha(original);
                } else {
                    if (!fadedBackgrounds.containsKey(background)) {
                        // The drawable can be shared with other views.
                        background = background.mutate();
                        fadedBackgrounds.put(background, background.getAlpha());
                    }
                    background.setAlpha(alpha);
                }
            }
            if (view == playerPage) break;
        }

        // Without the glass navigation bar, the player is cut at the bottom of the card.
        if (!MusicGlassNavigationBar.isGlassActive()) {
            if (styled && isAtBottom(miniplayer)) {
                final int bottom = getCollapsedBottom(playerPage);
                Rect clip = playerPage.getClipBounds();
                if (clip == null || clip.bottom != bottom || clip.right != playerPage.getWidth()) {
                    playerClip.set(0, 0, playerPage.getWidth(), bottom);
                    playerPage.setClipBounds(playerClip);
                }
            } else if (playerPage.getClipBounds() != null) {
                playerPage.setClipBounds(null);
            }
        }
    }

    private static boolean isAtBottom(View miniplayer) {
        miniplayer.getLocationInWindow(miniplayerLocation);
        return miniplayerLocation[1] > miniplayer.getRootView().getHeight() / 2;
    }

    private static boolean isRtl(View view) {
        return view.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
    }

    /**
     * Styles the artwork, the buttons and the progress bar for the collapsed player.
     */
    private static void style(View miniplayer, @Nullable View playerPage) {
        styled = true;
        hideScrim(miniplayer);

        final int height = miniplayer.getHeight();
        final float cardRadius = getCornerRadius(cornerRadius, height);
        final int horizontalInset = getHorizontalInset(miniplayer);
        final boolean rtl = isRtl(miniplayer);

        View root = playerPage != null ? playerPage : miniplayer.getRootView();
        for (int id : ARTWORKS) {
            View artwork = id == 0 ? null : root.findViewById(id);
            if (artwork != null && artwork.getWidth() > 0) {
                fitArtwork(miniplayer, artwork, horizontalInset, rtl);
                roundArtwork(artwork, getArtworkRadius(cardRadius, artworkPadding));
            }
        }

        updateSpinning();

        // The buttons stay away from the rounded end of the card (right in LTR, left in RTL).
        final float shift = (rtl ? 1f : -1f) * (horizontalInset + BUTTONS_END_ROOM);
        for (int id : BUTTONS) {
            View button = id == 0 ? null : miniplayer.findViewById(id);
            if (button != null && button.getTranslationX() != shift) {
                button.setTranslationX(shift);
            }
        }

        View timeBar = getTimeBar(miniplayer);
        if (timeBar != null) {
            clipTimeBar(miniplayer, timeBar, horizontalInset + cardRadius);
        }
    }

    /**
     * @return The room between the ends of the card and the ends of the miniplayer. Without margins of
     *         its own, the miniplayer is as wide as the screen and the card gets the room of the pages.
     */
    private static int getHorizontalInset(View miniplayer) {
        final int roomOnSides = miniplayer.getRootView().getWidth() - miniplayer.getWidth();
        return roomOnSides < MusicGlassNavigationBar.MARGIN_HORIZONTAL ? MusicGlassNavigationBar.MARGIN_HORIZONTAL : 0;
    }

    @Nullable
    private static View getTimeBar(View miniplayer) {
        if (miniplayer.getParent() instanceof ViewGroup parent) {
            for (int i = 0, count = parent.getChildCount(); i < count; i++) {
                View child = parent.getChildAt(i);
                if (child instanceof TimeBar) return child;
            }
        }
        return null;
    }

    /**
     * The artwork is made as tall as the card without the padding, and is moved to the padding from the start
     * of the card (left in LTR, right in RTL). It is scaled around its middle, which it also spins around.
     */
    private static void fitArtwork(View miniplayer, View artwork, int horizontalInset, boolean rtl) {
        final int width = artwork.getWidth();
        final float scale = Math.min(1, Math.max(Dim.dp(24), miniplayer.getHeight() - 2f * artworkPadding)
                / artwork.getHeight());

        // Where the start of the artwork is without the move, the scale and the spin.
        if (!(artwork.getParent() instanceof View parent)) return;
        parent.getLocationInWindow(location);
        final float unscaledLeft = location[0] + artwork.getLeft();
        miniplayer.getLocationInWindow(miniplayerLocation);

        final float targetScaledLeft = rtl
                ? miniplayerLocation[0] + miniplayer.getWidth() - horizontalInset - artworkPadding - width * scale
                : miniplayerLocation[0] + horizontalInset + artworkPadding;
        final float currentScaledLeftWithoutTranslation = unscaledLeft + width * (1 - scale) / 2f;
        final float translation = targetScaledLeft - currentScaledLeftWithoutTranslation;

        if (artwork.getScaleX() == scale && Math.abs(artwork.getTranslationX() - translation) < 0.5f) return;

        movedArtworks.put(artwork, true);
        artwork.setPivotX(width / 2f);
        artwork.setPivotY(artwork.getHeight() / 2f);
        artwork.setScaleX(scale);
        artwork.setScaleY(scale);
        artwork.setTranslationX(translation);
    }

    private static void roundArtwork(View artwork, float radius) {
        ViewOutlineProvider outline = artwork.getOutlineProvider();
        if (outline instanceof ArtworkOutline current) {
            if (current.radius == radius && current.round == spinningArtwork) return;
        } else {
            artworkOutlines.put(artwork, outline);
            artworkClips.put(artwork, artwork.getClipToOutline());
        }
        artwork.setOutlineProvider(new ArtworkOutline(radius, spinningArtwork));
        artwork.setClipToOutline(true);
    }

    private static void updateSpinning() {
        View miniplayer = currentMiniplayer.get();
        View artwork = miniplayer == null || ARTWORKS[0] == 0
                ? null : miniplayer.getRootView().findViewById(ARTWORKS[0]);
        if (artwork == null) return;

        ObjectAnimator animator = spinAnimators.get(artwork);
        if (styled && spinningArtwork && playing) {
            if (animator == null) {
                animator = ObjectAnimator.ofFloat(artwork, View.ROTATION, 0, 360);
                animator.setDuration(SPIN_MILLISECONDS);
                animator.setRepeatCount(ValueAnimator.INFINITE);
                animator.setInterpolator(new LinearInterpolator());
                spinAnimators.put(artwork, animator);
                animator.start();
            } else if (animator.isPaused()) {
                animator.resume();
            }
        } else if (animator != null) {
            if (styled && spinningArtwork) {
                // Paused songs keep the artwork where it stopped.
                animator.pause();
            } else {
                animator.cancel();
                spinAnimators.remove(artwork);
                artwork.setRotation(0);
            }
        }
    }

    /**
     * The progress bar of the player ends before the rounded corners of the card, or is hidden.
     */
    private static void clipTimeBar(View miniplayer, View timeBar, float inset) {
        clippedTimeBar = new WeakReference<>(timeBar);
        if (!progressBarShown) {
            if (timeBar.getClipBounds() == null || !timeBar.getClipBounds().isEmpty()) {
                timeBar.setClipBounds(new Rect());
            }
            return;
        }

        miniplayer.getLocationInWindow(miniplayerLocation);
        timeBar.getLocationInWindow(location);
        final int left = Math.round(miniplayerLocation[0] + inset - location[0]);
        final int right = Math.round(miniplayerLocation[0] + miniplayer.getWidth() - inset - location[0]);
        Rect clip = timeBar.getClipBounds();
        if (clip == null || clip.left != left || clip.right != right || clip.bottom != timeBar.getHeight()) {
            timeBar.setClipBounds(new Rect(left, 0, Math.max(left, right), timeBar.getHeight()));
        }
    }

    /**
     * Puts back the artwork, the buttons and the progress bar, such as when the player opens.
     */
    private static void restore() {
        if (!styled) return;
        styled = false;

        for (Map.Entry<View, ViewOutlineProvider> entry : artworkOutlines.entrySet()) {
            View artwork = entry.getKey();
            artwork.setOutlineProvider(entry.getValue());
            artwork.setClipToOutline(Boolean.TRUE.equals(artworkClips.get(artwork)));
        }
        artworkOutlines.clear();
        artworkClips.clear();

        for (View artwork : movedArtworks.keySet()) {
            artwork.setScaleX(1);
            artwork.setScaleY(1);
            artwork.setTranslationX(0);
        }
        movedArtworks.clear();

        updateSpinning();

        View miniplayer = currentMiniplayer.get();
        if (miniplayer != null) {
            for (int id : BUTTONS) {
                View button = id == 0 ? null : miniplayer.findViewById(id);
                if (button != null) button.setTranslationX(0);
            }
        }

        View timeBar = clippedTimeBar.get();
        if (timeBar != null) timeBar.setClipBounds(null);
    }

    private static void hideScrim(View miniplayer) {
        if (MINIPLAYER_SCRIM == 0) return;
        View scrim = miniplayer.getRootView().findViewById(MINIPLAYER_SCRIM);
        if (scrim != null && scrim.getVisibility() == View.VISIBLE) {
            scrim.setVisibility(View.INVISIBLE);
        }
    }

    /**
     * A square in the middle of the artwork with rounded corners, or a circle.
     */
    private static final class ArtworkOutline extends ViewOutlineProvider {
        final float radius;
        final boolean round;

        ArtworkOutline(float radius, boolean round) {
            this.radius = radius;
            this.round = round;
        }

        @Override
        public void getOutline(View view, Outline outline) {
            final int size = Math.min(view.getWidth(), view.getHeight());
            final int left = (view.getWidth() - size) / 2;
            final int top = (view.getHeight() - size) / 2;
            outline.setRoundRect(left, top, left + size, top + size, round ? size / 2f : Math.min(radius, size / 2f));
        }
    }

    /**
     * The card fills the miniplayer, without the room for the pages on its sides if it has none of its own.
     */
    private static final class CardHost implements GlassCapsuleDrawable.Host {
        private final View miniplayer;
        @Nullable
        private GlassBackdrop backdrop;

        CardHost(View miniplayer) {
            this.miniplayer = miniplayer;
        }

        @Override
        public void getCapsule(Rect bounds, RectF capsule) {
            final int inset = getHorizontalInset(miniplayer);
            capsule.set(bounds.left + inset, bounds.top, bounds.right - inset, bounds.bottom);
        }

        @Nullable
        @Override
        public View getSelectedTabView() {
            return null;
        }

        @Override
        public float getCornerRadius(RectF capsule) {
            return MusicGlassMiniplayer.getCornerRadius(cornerRadius, capsule.height());
        }

        @Override
        public void drawBackdrop(Canvas canvas) {
            // Only blur the underlying browse page when the miniplayer is at the bottom of the screen.
            if (styled && isAtBottom(miniplayer)) {
                backdrop = MusicGlassNavigationBar.drawPageBehind(canvas, miniplayer, blurRadius, true, backdrop,
                        "GlassMiniplayer");
            }
        }
    }
}
