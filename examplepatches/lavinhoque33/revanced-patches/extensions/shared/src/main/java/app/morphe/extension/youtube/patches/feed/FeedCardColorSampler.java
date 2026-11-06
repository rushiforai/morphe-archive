/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-04
 * Written by lavinhoque33, 2026-10-26.
 */

package app.morphe.extension.youtube.patches.feed;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Tints the background of the cards of the feed with a color sampled from their thumbnail, like the stock
 * app, which receives the sampled color from the server.
 * <p>
 * The thumbnail of a card is an image of the element of the card, which can be a bitmap drawable or a
 * drawable that draws the image itself, such as the drawable of the image library. Both are sampled:
 * the bitmap is read, and the other drawables are drawn in a small bitmap.
 * <p>
 * The color of a card is resolved once per card, from the thumbnail of the card that the view currently
 * shows, and it is kept in the state of the view together with every surface that it was applied to. The
 * state is reset when a recycled view shows another card, so no surface can keep the color of the card that
 * the view showed before. The surfaces are applied again before every frame, because the app mounts them
 * again while the list scrolls, and each surface is only written when it does not have the color of the
 * card that owns it: the tint of a surface is always the tint of the card of its view.
 * <p>
 * The surfaces of the card below the thumbnail are the ones that the app paints over the background of
 * the card, such as the band of the metadata and the image of the row of the channel, and the surface that
 * the patch draws for the cards that the app draws without one, such as the cards of the mixes.
 */
final class FeedCardColorSampler {
    /**
     * Number of samples of each side of a thumbnail.
     */
    private static final int GRID_SIZE = 8;
    /**
     * Saturation and brightness of the tint, for the dark and the light theme.
     * The values match the background of the cards of the stock app, which is a dark olive for a
     * green thumbnail in the dark theme, and a pale green in the light theme.
     */
    private static final float DARK_SATURATION = 0.9f;
    private static final float DARK_BRIGHTNESS = 0.11f;
    private static final float LIGHT_SATURATION = 0.22f;
    private static final float LIGHT_BRIGHTNESS = 0.97f;
    /**
     * Samples that are too dark or too gray to have the color of the thumbnail are ignored,
     * such as the black bars of a video.
     */
    private static final float MINIMUM_BRIGHTNESS = 0.1f;
    private static final float MINIMUM_SATURATION = 0.05f;
    /**
     * A thumbnail without at least this weight of colored samples is gray, and its card is not tinted.
     */
    private static final float MINIMUM_WEIGHT = 1.5f;
    /**
     * Smallest bitmap that is sampled, in pixels, which skips the avatars and the small placeholders.
     */
    private static final int MINIMUM_BITMAP_SIZE = 48;
    /**
     * Smallest image of a card, in pixels. The avatars and the icons are smaller, and they are square.
     */
    private static final int MINIMUM_THUMBNAIL_WIDTH = 96;
    /**
     * The thumbnail of a card is at least this share of its height, and it is landscape. This keeps the
     * thin images of the metadata, such as the image of the row of the channel, from being taken for
     * the thumbnail of a card whose thumbnail is not mounted.
     */
    private static final int MINIMUM_THUMBNAIL_HEIGHT_SHARE = 4;
    /**
     * Limits of the work of one frame, which keeps scrolling smooth.
     */
    private static final int MAXIMUM_SEARCHES_PER_FRAME = 4;
    private static final int MAXIMUM_SAMPLES_PER_FRAME = 4;
    private static final int MAXIMUM_DRAWN_SAMPLES_PER_FRAME = 2;
    private static final int MAXIMUM_HARDWARE_SAMPLES_PER_FRAME = 1;
    private static final int MAXIMUM_THUMBNAIL_DEPTH = 12;
    /**
     * A thumbnail that is not readable yet, such as a placeholder that the image replaces while it loads,
     * is sampled again after this delay, up to this number of times and this duration. The image can
     * replace the placeholder inside the same drawable, so the drawable is not enough to know that the
     * thumbnail changed.
     */
    private static final int MAXIMUM_SAMPLE_ATTEMPTS = 30;
    private static final long MAXIMUM_SAMPLE_MILLIS = 30_000;
    private static final long SAMPLE_RETRY_INTERVAL_MILLIS = 400;
    /**
     * Number of the filters of the tints that are kept, which is enough for the visible cards.
     */
    private static final int MAXIMUM_TINT_FILTERS = 64;
    /**
     * Number of the backgrounds of the cards that are kept, which is enough for the mounted cards,
     * also the ones of the cards that are not visible.
     */
    private static final int MAXIMUM_CARD_BACKGROUNDS = 64;
    /**
     * The color of the surface of the cards of YouTube that have no tint, such as the cards that the
     * app draws without a surface below the thumbnail.
     */
    private static final int CARD_COLOR_DARK = 0xFF212121;
    private static final int CARD_COLOR_LIGHT = 0xFFFFFFFF;
    /**
     * Number of the log lines that help diagnose the sampling. The logs are limited because they are
     * written for every card that is seen, while scrolling.
     */
    private static final int MAXIMUM_LOGS = 40;
    private static final int MAXIMUM_SURFACE_LOGS = 6;
    private static final int MAXIMUM_MISSING_THUMBNAIL_LOGS = 6;
    private static final int MAXIMUM_SHARED_IMAGE_LOGS = 4;
    private static final int MAXIMUM_FILL_LOGS = 12;
    private static final int MAXIMUM_SHORTS_ROW_LOGS = 6;
    private static final int MAXIMUM_STALE_ROW_LOGS = 12;
    /**
     * Number of the copies of the image of a row that are made for a card. The app replaces the image of
     * a row when it mounts the card again, and a card that replaces it before every frame keeps the filter
     * of the image of the app instead of a copy of its own.
     */
    private static final int MAXIMUM_ROW_COPIES = 4;
    private static final long SLOW_UPDATE_NANOS = 8_000_000L;
    private static final long SLOW_UPDATE_INTERVAL_MILLIS = 5_000;
    /**
     * A card without a tint, which keeps its own background color. The tints are opaque colors,
     * so they are never zero.
     */
    private static final int NO_TINT = 0;

    /**
     * Whether the item of a list is a card of the feed with a thumbnail, by the view of the item.
     */
    private static final Map<View, Boolean> cardItems = new WeakHashMap<>();
    /**
     * The color of the card that a view of the feed shows, with the surfaces that it was applied to.
     * <p>
     * This is the only source of truth of the tint of a card: the sampling, the color that was resolved
     * and the surfaces are kept together, and the state is reset when a recycled view shows another card,
     * so the color that is read from a surface is always the color of the card of its view.
     */
    private static final Map<View, CardState> cardStates = new WeakHashMap<>();
    /**
     * Backgrounds of the metadata of the cards, which the app paints in the color that the color hook
     * resolves. The app moves the drawables between the cards while the list scrolls, and it does not look
     * up the color of a drawable again when its bounds are the bounds of a card that the drawable already
     * had, so the card that owns a drawable is resolved from the view that the drawable is attached to
     * before it is written, and never from the card that the drawable was last seen in.
     */
    private static final List<WeakReference<Drawable>> cardBackgrounds = new ArrayList<>(8);
    /**
     * Filters of the tints, which are shared by the surfaces of the cards of the same color.
     */
    private static final Map<Integer, PorterDuffColorFilter> tintFilters = new HashMap<>();
    /**
     * Lists of the feed that were logged.
     */
    private static final Map<RecyclerView, Boolean> loggedLists = new WeakHashMap<>();
    private static final Map<View, Boolean> loggedCardSurfaces = new WeakHashMap<>();
    /**
     * Surfaces of a card that were looked up, reused before every draw so that the walk allocates nothing.
     */
    private static final List<Drawable> foundBackgrounds = new ArrayList<>(4);
    private static final List<View> foundImages = new ArrayList<>(4);
    /**
     * The filters that the patch set on the drawables of the images of the metadata of the cards, such as
     * the image of the row of the channel, with the view that showed the drawable. The filter is kept on the
     * drawable and not on the view, and a filter whose drawable is not an image of a card any more is removed.
     */
    private static final Map<Drawable, RowFilter> rowFilters = new WeakHashMap<>();
    /**
     * Images of the metadata of the cards of the list that was updated last, reused before every draw.
     */
    private static final Set<ImageView> activeRowImages = new HashSet<>();
    /**
     * Classes of the drawables that could not be sampled, which are logged once.
     */
    private static final Set<Class<?>> loggedDrawableClasses = new HashSet<>();
    /**
     * Row of pixels of a thumbnail, reused by the samplings.
     */
    private static int[] rowPixels = new int[0];
    private static final float[] sampleHsv = new float[3];
    private static final float[] tintHsv = new float[3];
    /**
     * Small bitmap that a drawable is drawn in, for the thumbnails which are not bitmap drawables.
     */
    private static Bitmap drawableBitmap;
    private static Canvas drawableCanvas;
    private static boolean darkMode;
    private static int searchesThisFrame;
    private static int samplesThisFrame;
    private static int drawnSamplesThisFrame;
    private static int hardwareSamplesThisFrame;
    private static int sampledThisFrame;
    private static int logs;
    private static int surfaceLogs;
    private static int missingThumbnailLogs;
    private static int sharedImageLogs;
    private static int fillLogs;
    private static int shortsRowLogs;
    private static int staleRowLogs;
    private static long slowUpdateLogTime;

    @Nullable
    private static Class<?> cardBackgroundClass;

    static void setCardBackgroundClass(Class<?> backgroundClass) {
        cardBackgroundClass = backgroundClass;
    }

    /**
     * The background's bounds can be set before it has a callback or belongs to a card. At draw time
     * its host and card are known, so mounted metadata backgrounds use the same state as View surfaces.
     */
    static void onCardDrawableDraw(Drawable drawable) {
        try {
            Drawable background = getCardBackground(drawable);
            if (background == null) {
                return;
            }

            View host = getDrawableView(drawable);
            View item = host == null ? null : FeedCardLayoutPatch.findCardListItem(host);
            if (item == null || !isCardItem(item)) {
                return;
            }

            // The host can draw before this list has run its first pre-draw sampling pass.
            CardState state = getCardState(item);

            Rect bounds = drawable.getBounds();
            if (bounds.width() * 20 < getCardContentWidth(item) * 17
                    || bounds.height() * 20 < item.getHeight()) {
                return;
            }

            int top = bounds.top;
            View current = host;
            while (current != item) {
                top += current.getTop();
                ViewParent parent = current.getParent();
                if (!(parent instanceof View parentView)) {
                    return;
                }
                current = parentView;
            }
            if (top < getThumbnailBottom(item, state)) {
                return;
            }

            // The first draw can precede the thumbnail. Remember the surface now so pre-draw can
            // tint and invalidate its cached Litho host as soon as the thumbnail's color is ready.
            addCardBackground(background);

            final boolean dynamicColors = Settings.FEED_CARD_LAYOUT_DYNAMIC_COLORS.get();
            final int color = dynamicColors ? state.sampledColour : NO_TINT;
            if (color != NO_TINT && background.getColorFilter() == getTintFilter(color)) {
                return;
            }

            applyCardBackgroundColour(background, state, dynamicColors);
            state.bandColour = color;
        } catch (Exception ex) {
            Logger.printException(() -> "onCardDrawableDraw failure", ex);
        }
    }

    /**
     * Litho wraps mounted backgrounds in a drawable that translates the canvas to the mounted bounds.
     * The standard getCurrent() API exposes its content without referring to the obfuscated wrapper.
     */
    @Nullable
    private static Drawable getCardBackground(Drawable drawable) {
        Drawable current = drawable.getCurrent();
        while (current != null && current != drawable) {
            drawable = current;
            current = drawable.getCurrent();
        }

        return drawable instanceof ColorDrawable || drawable instanceof GradientDrawable
                || drawable.getClass() == cardBackgroundClass ? drawable : null;
    }

    private FeedCardColorSampler() {
    }

    /**
     * Called when the list sets the spacing of an item, before the item is drawn, and again whenever
     * a recycled view shows another item.
     */
    static void setCardItem(View view, boolean card) {
        cardItems.put(view, card);

        if (!card && !FeedCardLayoutPatch.isCardLabel(view.getContentDescription())) {
            // A recycled view must not keep the tint of the card it showed.
            CardState state = cardStates.remove(view);
            if (state != null) {
                state.restore(view);
            }
        }
    }

    /**
     * Called when a card is laid out, which happens again when a recycled view shows another card, after
     * the label of the new card is set. The state of the card that the view showed before is dropped
     * before the next pre-draw, so its color is never applied to the surfaces of the new card.
     */
    static void onCardLayoutChanged(View view) {
        try {
            CardState state = cardStates.get(view);
            if (state != null && state.bind(view.getContentDescription())) {
                state.reset();
            }
        } catch (Exception ex) {
            Logger.printException(() -> "onCardLayoutChanged failure", ex);
        }
    }

    /**
     * @return Whether the item of the list is a card of the feed with a thumbnail.
     */
    static boolean isCardItem(View item) {
        // The cards converted by the patch have the label of the cards, also when the element of the item
        // is not a video, such as when the video plays in the card.
        if (FeedCardLayoutPatch.isCardLabel(item.getContentDescription())) {
            return true;
        }

        Boolean card = cardItems.get(item);
        final boolean marked = card != null && card;
        // The mark is not set again when the view is recycled for an item that the patch is not told about,
        // such as a row of Shorts, which would get the surface of a card over its inline video.
        final boolean shortsRow = marked && FeedCardLayoutPatch.isShortsRow(item);
        if (shortsRow) {
            cardItems.put(item, Boolean.FALSE);
            logShortsRow(item);
        }
        return FeedCardFill.isMarkedCardItem(marked, shortsRow);
    }

    /**
     * Called with the background of a drawable of an item, when its bounds are set, which is when the app
     * looks up the color that it paints the drawable with.
     *
     * @param item         The item of the feed of the card, or null if the drawable is not in a card.
     * @param drawableView The view of the drawable, which is the item if the drawable is the background
     *                     of the card.
     * @return The tint of the card, or null if the card has no tint.
     */
    @Nullable
    static Integer getCardColor(@Nullable View item, @Nullable View drawableView, Drawable drawable) {
        try {
            if (!Settings.FEED_CARD_LAYOUT_DYNAMIC_COLORS.get()) {
                return null;
            }
            if (item == null || drawableView == null || !isCardItem(item)) {
                logRejectedSurface(drawableView, drawable, "the item is not a card");
                return null;
            }

            final Rect bounds = getCardBounds(item, drawableView, drawable);
            if (bounds == null) {
                logRejectedSurface(drawableView, drawable, "the drawable is not in the item");
                return null;
            }
            // The band of the metadata is as wide as the card, or as wide as the card without the padding of
            // the metadata, and the chips and the buttons are much narrower.
            if (bounds.width() * 20 < getCardContentWidth(item) * 17) {
                logRejectedSurface(drawableView, drawable, "the drawable is narrower than the card");
                return null;
            }
            if (bounds.height() * 20 < item.getHeight()) {
                logRejectedSurface(drawableView, drawable, "the drawable is thinner than the card");
                return null;
            }

            // The color of the card that the view shows now, which is the card that owns the drawable.
            // The drawable keeps this color until the app looks it up again, so the sampler looks it up
            // again when the card changes, and the surfaces keep the color of their card with a filter.
            final CardState state = getCardState(item);
            addCardBackground(drawable);
            state.bandColour = state.sampledColour;
            state.dirty = true;
            return state.sampledColour == NO_TINT ? null : state.sampledColour;
        } catch (Exception ex) {
            Logger.printException(() -> "getCardColor failure", ex);
            return null;
        }
    }

    /**
     * Samples the thumbnails of the cards in the list and updates their tint, before the list is drawn.
     * Called for the feed and watch lists only; nested shelves and non-video rows are never sampled.
     */
    static void updateCardTints(RecyclerView list) {
        try {
            if (loggedLists.put(list, Boolean.TRUE) == null) {
                Logger.printDebug(() -> "Card colors: list with " + list.getChildCount() + " items");
            }

            final boolean dynamicColors = Settings.FEED_CARD_LAYOUT_DYNAMIC_COLORS.get();
            final boolean currentDarkMode = BaseThemeUtils.isDarkModeEnabled();
            if (currentDarkMode != darkMode) {
                // The tint of a thumbnail depends on the theme, so the cards sample their thumbnail again.
                darkMode = currentDarkMode;
                resetSamples();
                Logger.printDebug(() -> "Card colors: dark mode " + currentDarkMode);
            }

            searchesThisFrame = 0;
            samplesThisFrame = 0;
            drawnSamplesThisFrame = 0;
            hardwareSamplesThisFrame = 0;
            sampledThisFrame = 0;
            final long startTime = System.nanoTime();

            for (int i = 0, count = list.getChildCount(); i < count; i++) {
                View item = list.getChildAt(i);
                if (item.getHeight() <= 0) {
                    continue;
                }
                if (!isCardItem(item)) {
                    final CardState state = cardStates.remove(item);
                    if (state != null) {
                        state.restore(item);
                    }
                    continue;
                }

                final CardState state = getCardState(item);
                if (dynamicColors) {
                    sampleCard(item, state);
                }
                applyCardTint(item, state, dynamicColors);
                activeRowImages.addAll(state.lowerImages);
                logCardState(item, state);
            }

            // The backgrounds of the metadata are owned by the cards, so they are applied by the card that
            // the drawable is attached to now, not by the card that the drawable was last seen in.
            applyCardBackgroundColours(dynamicColors);
            clearStaleRowFilters();
            logSlowUpdate(startTime);
        } catch (Exception ex) {
            Logger.printException(() -> "updateCardTints failure", ex);
        }
    }

    /**
     * @return The state of the card of the item, which is reset when the view shows another card.
     */
    private static CardState getCardState(View item) {
        CardState state = cardStates.get(item);
        if (state == null) {
            state = new CardState();
            state.dirty = true;
            cardStates.put(item, state);
        }

        if (state.bind(item.getContentDescription())) {
            state.reset();
        }
        return state;
    }

    /**
     * Samples the thumbnail of the card of the item, when it's new or unreadable, and keeps the color of
     * the card while the thumbnail is missing, such as while a recycled card loads its image. The surfaces
     * keep the color of the card, so a thumbnail that is looked up again never leaves a surface without it.
     */
    private static void sampleCard(View item, CardState state) {
        ImageView imageView = state.getThumbnailView(item);
        if (imageView == null) {
            if (searchesThisFrame >= MAXIMUM_SEARCHES_PER_FRAME) {
                return;
            }
            searchesThisFrame++;

            imageView = findThumbnailView(item, item.getHeight(), 0);
            if (imageView == null) {
                logMissingThumbnail(item);
                return;
            }
            state.setThumbnailView(imageView);
        }

        final Drawable drawable = imageView.getDrawable();
        if (drawable == null) {
            // A recycled card loads its image again, and the card keeps the color that it has.
            return;
        }

        final long now = System.currentTimeMillis();
        if (!state.needsSample(drawable, now)) {
            return;
        }
        if (samplesThisFrame >= MAXIMUM_SAMPLES_PER_FRAME) {
            return;
        }

        final BitmapDrawable bitmapDrawable = getBitmapDrawable(drawable);
        final boolean drawn = bitmapDrawable == null;
        if (drawn && drawnSamplesThisFrame >= MAXIMUM_DRAWN_SAMPLES_PER_FRAME) {
            return;
        }
        if (bitmapDrawable != null && isHardware(bitmapDrawable)
                && hardwareSamplesThisFrame >= MAXIMUM_HARDWARE_SAMPLES_PER_FRAME) {
            return;
        }

        samplesThisFrame++;
        sampledThisFrame++;
        if (drawn) {
            drawnSamplesThisFrame++;
        }
        if (bitmapDrawable != null && isHardware(bitmapDrawable)) {
            hardwareSamplesThisFrame++;
        }

        final float hue = drawn ? sampleDrawn(drawable) : sampleBitmap(bitmapDrawable.getBitmap());
        state.sampled(drawable, now, hue, !drawn);
        if (Float.isNaN(hue)) {
            logUntinted(item, drawable);
        } else {
            logTint(item, hue, state.sampledColour);
        }
    }

    /**
     * Applies the color of the card of the item to every surface of the card: the band of the metadata,
     * the image of the row of the channel and the other surfaces below the thumbnail, and the surface that
     * the patch draws for a card that the app draws without one.
     */
    private static void applyCardTint(View item, CardState state, boolean dynamicColors) {
        final int color = dynamicColors ? state.sampledColour : NO_TINT;
        state.color = color;

        if (color == NO_TINT) {
            state.clearSurfaces();
            state.rowsFound = 0;
            state.rowsTinted = 0;
        } else {
            tintCardSurfaces(item, state, color);
        }
        updateCardSurface(item, state, color);
    }

    /**
     * Tints the surfaces of the card below the thumbnail. The views of a card are mounted again while the
     * list scrolls, so the surfaces are looked up again before every draw, which keeps the tint of the card
     * on the views that the app mounted again.
     */
    private static void tintCardSurfaces(View item, CardState state, int color) {
        foundBackgrounds.clear();
        foundImages.clear();
        collectCardSurfaces(item, item, 0, getThumbnailBottom(item, state), foundBackgrounds, foundImages);

        final PorterDuffColorFilter filter = getTintFilter(color);
        final List<Drawable> backgrounds = state.lowerBackgrounds;
        final List<ImageView> images = state.lowerImages;

        // The surfaces that the card no longer has keep no tint of the card.
        for (int i = backgrounds.size() - 1; i >= 0; i--) {
            Drawable drawable = backgrounds.get(i);
            if (foundBackgrounds.contains(drawable)) {
                continue;
            }
            clearCardFilter(drawable);
            backgrounds.remove(i);
        }
        for (int i = images.size() - 1; i >= 0; i--) {
            ImageView imageView = images.get(i);
            if (foundImages.contains(imageView)) {
                continue;
            }
            clearRowFilter(imageView);
            images.remove(i);
        }

        for (int i = 0, count = foundBackgrounds.size(); i < count; i++) {
            Drawable drawable = foundBackgrounds.get(i);
            if (drawable.getColorFilter() != filter) {
                drawable.setColorFilter(filter);
                state.dirty = true;
            }
            if (!backgrounds.contains(drawable)) {
                backgrounds.add(drawable);
            }
        }

        int tinted = 0;
        for (int i = 0, count = foundImages.size(); i < count; i++) {
            ImageView imageView = (ImageView) foundImages.get(i);
            if (tintRow(imageView, filter, state)) {
                tinted++;
            }
            if (!images.contains(imageView)) {
                images.add(imageView);
            }
        }
        state.rowsFound = foundImages.size();
        state.rowsTinted = tinted;
    }

    /**
     * Tints the image of a view of the metadata, such as the row of the channel, which the app paints over
     * the surface of the card. The filter is set on the drawable of the image, never on the view: the
     * filter of a view stays on every drawable that the view shows next, and the app mounts the same views
     * again as the icons of the buttons of other cards, which would keep the tint of this card. The app draws
     * the image of the row of a card in the rows of the other cards too, so the image is copied for the card
     * that draws it, and the tint of a card is not replaced by the tint of another card.
     *
     * @return Whether the image has the tint of the card.
     */
    private static boolean tintRow(ImageView imageView, PorterDuffColorFilter filter, CardState state) {
        Drawable image = imageView.getDrawable();
        if (image == null) {
            return false;
        }
        if (image.getCallback() != imageView) {
            // The app draws this image in another view, so the filter of this card would replace the
            // filter of the other card.
            Drawable copy = state.rowCopies < MAXIMUM_ROW_COPIES ? copyRowImage(image, imageView) : null;
            if (copy == null) {
                logSharedImage(imageView, image);
                return false;
            }
            state.rowCopies++;
            imageView.setImageDrawable(copy);
            image = copy;
            state.dirty = true;
        }

        final RowFilter applied = rowFilters.get(image);
        if (applied != null && applied.filter == filter && applied.view.get() == imageView) {
            return true;
        }

        // The filter of a bitmap is in a state that the drawables of the same image share, so the drawable
        // gets a state of its own before it has the tint of the card.
        image.mutate();
        image.setColorFilter(filter);
        rowFilters.put(image, new RowFilter(imageView, filter));
        state.dirty = true;
        return true;
    }

    /**
     * Removes the tint of a card from the drawable of an image of the metadata.
     *
     * @return Whether the drawable had the tint of a card.
     */
    private static boolean clearRowFilter(ImageView imageView) {
        final Drawable image = imageView.getDrawable();
        return image != null && clearRowFilter(image);
    }

    private static boolean clearRowFilter(Drawable image) {
        if (rowFilters.remove(image) == null) {
            return false;
        }
        image.setColorFilter(null);
        return true;
    }

    /**
     * Removes the tints that are on drawables that are not the image of the metadata of a card that is in the
     * list now: the app mounts the views of the image again as other images, such as the icons of the
     * buttons, and moves the drawables between the views, and a card that scrolled out of the list is not
     * updated again before its views are mounted. This runs after the cards of the list were updated.
     */
    private static void clearStaleRowFilters() {
        final Iterator<Map.Entry<Drawable, RowFilter>> entries = rowFilters.entrySet().iterator();
        while (entries.hasNext()) {
            final Map.Entry<Drawable, RowFilter> entry = entries.next();
            final Drawable image = entry.getKey();
            final ImageView imageView = entry.getValue().view.get();
            final boolean stale = FeedCardFill.isRowFilterStale(
                    imageView != null,
                    imageView != null && imageView.getDrawable() == image,
                    imageView != null && activeRowImages.contains(imageView),
                    imageView == null ? 0 : imageView.getWidth(),
                    MINIMUM_THUMBNAIL_WIDTH);
            if (!stale) {
                continue;
            }

            entries.remove();
            image.setColorFilter(null);
            logStaleRowFilter(imageView);
        }
        activeRowImages.clear();
    }

    /**
     * @return A copy of the image of a row that has its own filter, or null if the image cannot be copied,
     *         such as a drawable without a constant state.
     */
    @Nullable
    private static Drawable copyRowImage(Drawable image, ImageView imageView) {
        if (!(image instanceof BitmapDrawable) && !(image instanceof LayerDrawable)
                && !(image instanceof DrawableWrapper) && !(image instanceof GradientDrawable)
                && !(image instanceof ColorDrawable)) {
            return null;
        }

        final Drawable.ConstantState constantState = image.getConstantState();
        if (constantState == null) {
            return null;
        }

        try {
            Drawable copy = constantState.newDrawable();
            if (copy == null) {
                return null;
            }
            // The copy is drawn before the next layout of the view, so it takes the bounds of the image.
            copy.setBounds(0, 0, imageView.getWidth(), imageView.getHeight());
            copy.setAlpha(image.getAlpha());
            return copy;
        } catch (Exception ex) {
            Logger.printException(() -> "Copy of the row image failure", ex);
            return null;
        }
    }

    /**
     * Applies the color of the card to the backgrounds of the metadata, which are not in the tree of the
     * views of the card: the app mounts them as drawables of the hosts of the card.
     */
    private static void applyCardBackgroundColours(boolean dynamicColors) {
        int kept = 0;
        for (int i = 0, count = cardBackgrounds.size(); i < count; i++) {
            WeakReference<Drawable> reference = cardBackgrounds.get(i);
            Drawable drawable = reference.get();
            if (drawable == null) {
                continue;
            }

            applyCardBackgroundColour(drawable, dynamicColors);
            if (kept != i) {
                cardBackgrounds.set(kept, reference);
            }
            kept++;
        }

        for (int i = cardBackgrounds.size() - 1; i >= kept; i--) {
            cardBackgrounds.remove(i);
        }
    }

    private static void applyCardBackgroundColour(Drawable drawable, boolean dynamicColors) {
        final View host = getDrawableView(drawable);
        final View item = host == null ? null : FeedCardLayoutPatch.findCardListItem(host);
        final CardState state = item == null ? null : cardStates.get(item);
        applyCardBackgroundColour(drawable, state, dynamicColors);
    }

    private static void applyCardBackgroundColour(Drawable drawable, @Nullable CardState state, boolean dynamicColors) {
        final int color = dynamicColors && state != null ? state.sampledColour : NO_TINT;

        if (color == NO_TINT) {
            // The card has no tint now, so the app paints its surface in the color of the card, which it
            // looks up again when the bounds of the drawable are set.
            if (clearCardFilter(drawable) && state != null) {
                restartBackground(drawable);
                state.dirty = true;
            }
            return;
        }

        final PorterDuffColorFilter filter = getTintFilter(color);
        if (drawable.getColorFilter() == filter) {
            return;
        }

        drawable.setColorFilter(filter);
        // The app keeps the color of the drawable from the card that it was mounted in, and the drawable is
        // moved between the cards with the same bounds, so the color is looked up again for this card.
        restartBackground(drawable);
        state.dirty = true;
    }

    private static void addCardBackground(Drawable drawable) {
        for (int i = 0, count = cardBackgrounds.size(); i < count; i++) {
            if (cardBackgrounds.get(i).get() == drawable) {
                return;
            }
        }

        if (cardBackgrounds.size() >= MAXIMUM_CARD_BACKGROUNDS) {
            cardBackgrounds.remove(0);
        }
        cardBackgrounds.add(new WeakReference<>(drawable));
    }

    /**
     * Gives the card a surface of its own, because the app draws the cards of the mixes without any
     * surface of its own, so their metadata would lie on the background of the page. The surface is behind
     * the content of the card, so it's not visible on the cards that the app draws a surface of.
     */
    private static void updateCardSurface(View item, CardState state, int color) {
        if (item.getHeight() <= 0) {
            return;
        }

        final int surfaceColor = color == NO_TINT ? (darkMode ? CARD_COLOR_DARK : CARD_COLOR_LIGHT) : color;
        // The video of the card plays in the zone of the thumbnail, which the surface leaves transparent.
        final int videoZoneBottom = getVideoZoneBottom(item, state);
        CardSurface surface = state.surface;
        if (surface != null && item.getBackground() == surface.drawable) {
            if (surface.videoZoneBottom != videoZoneBottom) {
                logFillZone(item, videoZoneBottom);
            }
            surface.update(surfaceColor, videoZoneBottom);
            return;
        }

        // The view was rebound, and the app replaced the background of the card.
        state.surface = null;
        // The clip of the card rounds the surface to the card, with its corners.
        FeedCardLayoutPatch.setCardClip(item);
        surface = new CardSurface(surfaceColor, videoZoneBottom, item.getBackground());
        state.surface = surface;
        item.setBackground(surface.drawable);
        logFillZone(item, videoZoneBottom);
        if (loggedCardSurfaces.put(item, Boolean.TRUE) == null) {
            Logger.printDebug(() -> "Card background: the surface of the card is drawn by the patch");
        }
    }

    private static void removeCardSurface(View item, CardState state) {
        CardSurface surface = state.surface;
        state.surface = null;
        if (surface != null && item.getBackground() == surface.drawable) {
            item.setBackground(surface.background);
        }
    }

    /**
     * @return The bounds of the drawable of the view, relative to the item, or null if the view is not
     *         inside the item.
     */
    @Nullable
    private static Rect getCardBounds(View item, View drawableView, Drawable drawable) {
        // Mounted wrappers translate their content from local bounds into the host's coordinates.
        Drawable.Callback callback = drawable.getCallback();
        while (callback instanceof Drawable parent) {
            drawable = parent;
            callback = drawable.getCallback();
        }
        Rect bounds = drawable.copyBounds();
        View view = drawableView;
        while (view != item) {
            ViewParent parent = view.getParent();
            if (!(parent instanceof View parentView)) {
                return null;
            }
            bounds.offset(view.getLeft(), view.getTop());
            view = parentView;
        }
        return bounds;
    }

    /**
     * @return The view of the drawable, or null if the drawable is not attached to a view.
     */
    @Nullable
    private static View getDrawableView(Drawable drawable) {
        Drawable.Callback callback = drawable.getCallback();
        while (callback instanceof Drawable parent) {
            callback = parent.getCallback();
        }
        return callback instanceof View view ? view : null;
    }

    /**
     * The watch list's item includes margins around its card host. Compare metadata with that content,
     * not the full-width adapter item, so the card's own horizontal inset is not counted twice.
     */
    private static int getCardContentWidth(View item) {
        final int itemWidth = item.getWidth();
        int contentWidth = 0;
        if (item instanceof ViewGroup group) {
            for (int i = 0, count = group.getChildCount(); i < count; i++) {
                contentWidth = Math.max(contentWidth, group.getChildAt(i).getWidth());
            }
        }
        return contentWidth * 2 >= itemWidth && contentWidth <= itemWidth ? contentWidth : itemWidth;
    }

    private static boolean isInside(View view, View item) {
        while (view != null) {
            if (view == item) {
                return true;
            }
            ViewParent parent = view.getParent();
            view = parent instanceof View parentView ? parentView : null;
        }
        return false;
    }

    /**
     * Collects the surfaces of the card below the thumbnail that span its width: the backgrounds of its
     * views and the images of its ImageViews, such as the row of the channel.
     * Mounted Litho backgrounds are tracked separately by {@link #onCardDrawableDraw(Drawable)}.
     */
    private static void collectCardSurfaces(View item, View view, int topInItem, int thumbnailBottom,
                                            List<Drawable> backgrounds, List<View> images) {
        final int width = getCardContentWidth(item);
        final int height = item.getHeight();

        // Compare surfaces and the thumbnail in item coordinates, never in the scrolling list's coordinates.
        final int viewTop = view == item ? 0 : topInItem + view.getTop();

        // A surface of the card is as wide as the card, or the card without the padding of the metadata.
        final boolean spansCard = view.getWidth() * 20 >= width * 17;

        // The surfaces of the thumbnail are above the metadata, and the images thinner than the card are
        // the bars of the progress and the separators.
        if (spansCard && viewTop >= thumbnailBottom && view.getHeight() * 20 >= height) {
            Drawable background = view.getBackground();
            if (background != null && !backgrounds.contains(background)) {
                backgrounds.add(background);
            }

            if (view instanceof ImageView imageView && imageView.getDrawable() != null
                    && !images.contains(view)) {
                images.add(view);
            }
        }

        if (view instanceof ViewGroup group) {
            for (int i = 0, count = group.getChildCount(); i < count; i++) {
                collectCardSurfaces(item, group.getChildAt(i), viewTop, thumbnailBottom, backgrounds, images);
            }
        }
    }

    /**
     * @return The bottom of the thumbnail of the card in the card, which is the largest image of the card.
     *         The images of the metadata are in the lower part of the card, so an image that is not in the
     *         upper part is not the thumbnail, such as the row of the channel of a card with a long title.
     *         The cards whose thumbnail is drawn without a view keep the lower third for the metadata.
     */
    private static int getThumbnailBottom(View item, CardState state) {
        if (state.thumbnailBottom >= 0) {
            return state.thumbnailBottom;
        }

        final int thumbnailBottom = measureThumbnailBottom(item, state);
        if (thumbnailBottom >= 0) {
            state.thumbnailBottom = thumbnailBottom;
            return thumbnailBottom;
        }
        return item.getHeight() * 2 / 3;
    }

    /**
     * @return The bottom of the thumbnail view of the card in the card, or -1 if the card has no thumbnail
     *         view that is laid out in the upper part of the card. It is measured every time, because the
     *         surface of the card must never cover the thumbnail zone, where the video of the card plays.
     */
    private static int measureThumbnailBottom(View item, CardState state) {
        final ImageView thumbnail = state.getThumbnailView(item);
        if (thumbnail == null || thumbnail.getHeight() <= 0) {
            return -1;
        }

        final int top = getTopInItem(thumbnail, item);
        // The thumbnail starts above the metadata, which is the lower part of the card.
        return top * 4 <= item.getHeight() ? top + thumbnail.getHeight() : -1;
    }

    /**
     * @return The bottom of the zone of the card where its video plays, which is the thumbnail, in the card.
     *         A card without a thumbnail view, such as a card that plays, has the 16:9 box of its thumbnail.
     */
    private static int getVideoZoneBottom(View item, CardState state) {
        return FeedCardFill.getVideoZoneBottom(measureThumbnailBottom(item, state), item.getWidth(),
                Dim.dp(FeedCardLayoutPatch.CARD_HORIZONTAL_PADDING_DP),
                Dim.dp(FeedCardLayoutPatch.CARD_VERTICAL_PADDING_DP));
    }

    private static int getTopInItem(View view, View item) {
        int top = 0;
        View current = view;
        while (current != null && current != item) {
            top += current.getTop();
            ViewParent parent = current.getParent();
            current = parent instanceof View parentView ? parentView : null;
        }
        return top;
    }

    /**
     * @return The image of the item with the largest view, which is the thumbnail of a card,
     *         or null if the item has no image.
     */
    @Nullable
    private static ImageView findThumbnailView(View view, int cardHeight, int depth) {
        if (depth > MAXIMUM_THUMBNAIL_DEPTH || (depth > 0 && view instanceof RecyclerView)) {
            return null;
        }

        ImageView best = null;
        int bestArea = 0;
        if (view instanceof ImageView imageView && isThumbnailView(imageView, cardHeight)) {
            best = imageView;
            bestArea = imageView.getWidth() * imageView.getHeight();
        }

        if (view instanceof ViewGroup group) {
            for (int i = 0, count = group.getChildCount(); i < count; i++) {
                ImageView child = findThumbnailView(group.getChildAt(i), cardHeight, depth + 1);
                if (child == null) {
                    continue;
                }
                final int area = child.getWidth() * child.getHeight();
                if (area > bestArea) {
                    best = child;
                    bestArea = area;
                }
            }
        }

        return best;
    }

    /**
     * The thumbnail of a card is wide, tall and landscape, and the avatars and the icons are not.
     */
    private static boolean isThumbnailView(ImageView view, int cardHeight) {
        return view.getVisibility() == View.VISIBLE
                && view.getDrawable() != null
                && view.getWidth() > 0 && view.getHeight() > 0
                && view.getWidth() >= MINIMUM_THUMBNAIL_WIDTH
                && view.getWidth() * 5 >= view.getHeight() * 6
                && view.getHeight() * MINIMUM_THUMBNAIL_HEIGHT_SHARE >= cardHeight;
    }

    /**
     * @return The drawable of a bitmap, also of the cross fade of the images, or null if the drawable
     *         has no bitmap that is large enough and landscape, such as the thumbnail of a video.
     */
    @Nullable
    private static BitmapDrawable getBitmapDrawable(@Nullable Drawable drawable) {
        if (drawable instanceof BitmapDrawable bitmapDrawable) {
            Bitmap bitmap = bitmapDrawable.getBitmap();
            // The avatars and the icons of a card are smaller than its thumbnail, and they are not landscape.
            if (bitmap == null || bitmap.isRecycled()
                    || bitmap.getWidth() < MINIMUM_BITMAP_SIZE
                    || bitmap.getHeight() < MINIMUM_BITMAP_SIZE
                    || bitmap.getWidth() * 5 < bitmap.getHeight() * 6) {
                return null;
            }
            return bitmapDrawable;
        }

        if (drawable instanceof DrawableWrapper wrapper) {
            return getBitmapDrawable(wrapper.getDrawable());
        }

        if (drawable instanceof LayerDrawable layerDrawable) {
            BitmapDrawable best = null;
            int bestArea = 0;
            for (int i = 0, count = layerDrawable.getNumberOfLayers(); i < count; i++) {
                BitmapDrawable layer = getBitmapDrawable(layerDrawable.getDrawable(i));
                if (layer == null) {
                    continue;
                }
                Bitmap bitmap = layer.getBitmap();
                final int area = bitmap.getWidth() * bitmap.getHeight();
                // The last layer of a cross fade is the new image, which is preferred.
                if (area >= bestArea) {
                    best = layer;
                    bestArea = area;
                }
            }
            return best;
        }

        return null;
    }

    private static boolean isHardware(BitmapDrawable drawable) {
        Bitmap bitmap = drawable.getBitmap();
        return bitmap != null && bitmap.getConfig() == Bitmap.Config.HARDWARE;
    }

    /**
     * @return The hue of a thumbnail that is not a bitmap drawable, which is drawn in a small bitmap,
     *         or NaN if it has no bitmap to draw or it's gray.
     */
    private static float sampleDrawn(Drawable drawable) {
        if (!prepareDrawableCanvas()) {
            return Float.NaN;
        }

        Rect bounds = drawable.copyBounds();
        try {
            drawable.setBounds(0, 0, GRID_SIZE, GRID_SIZE);
            drawable.draw(drawableCanvas);
        } catch (Exception ex) {
            // A hardware bitmap can't be drawn in a software canvas, but the image library copies it
            // to a bitmap that can, and the ones that fail keep the color of the card.
            logUnreadableDrawable(drawable, ex);
            return Float.NaN;
        } finally {
            drawable.setBounds(bounds);
        }

        return sampleHue(drawableBitmap);
    }

    private static boolean prepareDrawableCanvas() {
        if (drawableBitmap == null || drawableBitmap.isRecycled()) {
            try {
                drawableBitmap = Bitmap.createBitmap(GRID_SIZE, GRID_SIZE, Bitmap.Config.ARGB_8888);
                drawableCanvas = new Canvas(drawableBitmap);
            } catch (Exception ex) {
                Logger.printException(() -> "Card colors: canvas failure", ex);
                return false;
            }
        }

        drawableCanvas.drawColor(Color.TRANSPARENT, PorterDuff.Mode.CLEAR);
        return true;
    }

    /**
     * @return The hue of the thumbnail, or NaN if the thumbnail is gray or too dark.
     */
    private static float sampleBitmap(Bitmap bitmap) {
        Bitmap readable = bitmap;

        // The pixels of a hardware bitmap can't be read, but it can be copied to a bitmap that can.
        if (bitmap.getConfig() == Bitmap.Config.HARDWARE) {
            try {
                readable = bitmap.copy(Bitmap.Config.ARGB_8888, false);
            } catch (Exception ex) {
                Logger.printException(() -> "Copy of a hardware bitmap failure", ex);
                return Float.NaN;
            }
            if (readable == null) {
                return Float.NaN;
            }
        }

        try {
            return sampleHue(readable);
        } finally {
            if (readable != bitmap) {
                readable.recycle();
            }
        }
    }

    /**
     * The hues of the samples are averaged as vectors, which keeps the hue of the dominant color
     * of a thumbnail that has more than one color, such as a red and a blue half.
     */
    private static float sampleHue(Bitmap bitmap) {
        final int width = bitmap.getWidth();
        final int height = bitmap.getHeight();
        if (width <= 0 || height <= 0) {
            return Float.NaN;
        }

        if (rowPixels.length < width) {
            rowPixels = new int[width];
        }

        float hueX = 0;
        float hueY = 0;
        float weight = 0;
        for (int rowIndex = 0; rowIndex < GRID_SIZE; rowIndex++) {
            final int y = height * (2 * rowIndex + 1) / (2 * GRID_SIZE);
            bitmap.getPixels(rowPixels, 0, width, 0, y, width, 1);

            for (int columnIndex = 0; columnIndex < GRID_SIZE; columnIndex++) {
                final int x = width * (2 * columnIndex + 1) / (2 * GRID_SIZE);
                final int color = rowPixels[x];
                Color.RGBToHSV(Color.red(color), Color.green(color), Color.blue(color), sampleHsv);

                // The bright and saturated pixels are the color of the thumbnail, and the dark or gray
                // ones, such as the black bars of a video, are not.
                if (sampleHsv[2] < MINIMUM_BRIGHTNESS || sampleHsv[1] < MINIMUM_SATURATION) {
                    continue;
                }

                final float sampleWeight = sampleHsv[1] * sampleHsv[2];
                final double radians = Math.toRadians(sampleHsv[0]);
                hueX += (float) Math.cos(radians) * sampleWeight;
                hueY += (float) Math.sin(radians) * sampleWeight;
                weight += sampleWeight;
            }
        }

        if (weight < MINIMUM_WEIGHT) {
            return Float.NaN;
        }

        final double hue = Math.toDegrees(Math.atan2(hueY, hueX));
        return (float) (hue < 0 ? hue + 360 : hue);
    }

    private static int getTint(float hue) {
        tintHsv[0] = hue;
        tintHsv[1] = darkMode ? DARK_SATURATION : LIGHT_SATURATION;
        tintHsv[2] = darkMode ? DARK_BRIGHTNESS : LIGHT_BRIGHTNESS;
        return Color.HSVToColor(tintHsv);
    }

    /**
     * @return The filter of a tint, which is shared by the surfaces of the cards of the same color.
     */
    private static PorterDuffColorFilter getTintFilter(int tint) {
        PorterDuffColorFilter filter = tintFilters.get(tint);
        if (filter == null) {
            if (tintFilters.size() >= MAXIMUM_TINT_FILTERS) {
                tintFilters.clear();
            }
            filter = new PorterDuffColorFilter(tint, PorterDuff.Mode.SRC_IN);
            tintFilters.put(tint, filter);
        }
        return filter;
    }

    private static boolean isOurFilter(@Nullable ColorFilter filter) {
        return filter != null && tintFilters.containsValue(filter);
    }

    /**
     * Removes the filter of the tint of a drawable, if the filter is not the filter of the app.
     */
    private static boolean clearCardFilter(Drawable drawable) {
        if (!isOurFilter(drawable.getColorFilter())) {
            return false;
        }
        drawable.setColorFilter(null);
        return true;
    }

    /**
     * The app resolves the color of a background only when its bounds are set, so the bounds are set
     * again to make it look up the color of the card that it's attached to.
     */
    private static void restartBackground(Drawable drawable) {
        Rect bounds = drawable.copyBounds();
        if (bounds.isEmpty()) {
            drawable.invalidateSelf();
            return;
        }

        drawable.setBounds(0, 0, 0, 0);
        drawable.setBounds(bounds);
        drawable.invalidateSelf();
    }

    /**
     * The tint of a thumbnail depends on the theme, so every card samples its thumbnail again.
     */
    private static void resetSamples() {
        for (CardState state : cardStates.values()) {
            state.sampledColour = NO_TINT;
            state.sampledDrawable = null;
            state.sampleAttempts = 0;
            state.sampleStart = 0;
            state.sampledTime = 0;
            state.sampleFinal = false;
            state.dirty = true;
        }
    }

    /**
     * Logs the state of a card, once per bind and per change of its color, which shows whether the band,
     * the row and the surface of the card have the color of the card or the color of another card.
     */
    private static void logCardState(View item, CardState state) {
        if (!state.dirty || logs >= MAXIMUM_LOGS) {
            return;
        }
        state.dirty = false;
        logs++;

        Logger.printDebug(() -> String.format(Locale.US,
                "Card tint: item #%08X \"%s\" tint %s, band %s, rows %d/%d, applied %s",
                System.identityHashCode(item), shorten(item.getContentDescription()),
                describeColor(state.sampledColour), describeColor(state.bandColour),
                state.rowsTinted, state.rowsFound, describeColor(state.color)));
    }

    private static String describeColor(int color) {
        return color == NO_TINT ? "none" : String.format(Locale.US, "#%06X", color & 0xFFFFFF);
    }

    private static void logTint(View item, float hue, int tint) {
        if (logs >= MAXIMUM_LOGS) {
            return;
        }
        logs++;

        CardState state = cardStates.get(item);
        ImageView imageView = state == null ? null : state.getThumbnailView(item);
        Drawable drawable = imageView == null ? null : imageView.getDrawable();
        Logger.printDebug(() -> String.format(Locale.US,
                "Card color: tint #%06X of hue %.1f, thumbnail %s with %s",
                tint & 0xFFFFFF, hue,
                imageView == null ? "none" : imageView.getClass().getSimpleName(),
                drawable == null ? "no drawable" : drawable.getClass().getSimpleName()));
    }

    private static void logUntinted(View item, Drawable drawable) {
        if (logs >= MAXIMUM_LOGS) {
            return;
        }
        logs++;

        Logger.printDebug(() -> "Card colors: no color in the thumbnail of "
                + drawable.getClass().getSimpleName() + " to tint the card with");
    }

    private static void logMissingThumbnail(View item) {
        if (missingThumbnailLogs >= MAXIMUM_MISSING_THUMBNAIL_LOGS) {
            return;
        }
        missingThumbnailLogs++;

        Logger.printDebug(() -> "Card colors: no thumbnail in " + describeChildren(item));
    }

    private static void logShortsRow(View item) {
        if (shortsRowLogs >= MAXIMUM_SHORTS_ROW_LOGS) {
            return;
        }
        shortsRowLogs++;

        Logger.printDebug(() -> "Card colors: the row of Shorts #" + Integer.toHexString(System.identityHashCode(item))
                + " is not a card, so it has no surface over its inline video");
    }

    private static void logFillZone(View item, int videoZoneBottom) {
        if (fillLogs >= MAXIMUM_FILL_LOGS) {
            return;
        }
        fillLogs++;

        Logger.printDebug(() -> String.format(Locale.US,
                "Card fill: item #%08X %dx%d leaves the video zone above %d transparent",
                System.identityHashCode(item), item.getWidth(), item.getHeight(), videoZoneBottom));
    }

    private static void logStaleRowFilter(@Nullable ImageView imageView) {
        if (staleRowLogs >= MAXIMUM_STALE_ROW_LOGS) {
            return;
        }
        staleRowLogs++;

        Logger.printDebug(() -> "Card tint: removed the tint of a card from an image that is not a row of a card, "
                + (imageView == null ? "its view is gone" : describeView(imageView)));
    }

    private static void logRejectedSurface(@Nullable View drawableView, Drawable drawable, String reason) {
        if (surfaceLogs >= MAXIMUM_SURFACE_LOGS) {
            return;
        }
        surfaceLogs++;

        Logger.printDebug(() -> "Card colors: " + drawable.getClass().getSimpleName() + " of "
                + (drawableView == null ? "an unknown view" : describeView(drawableView))
                + " is not the surface of a card: " + reason);
    }

    private static void logSharedImage(ImageView imageView, Drawable image) {
        if (sharedImageLogs >= MAXIMUM_SHARED_IMAGE_LOGS) {
            return;
        }
        sharedImageLogs++;

        Logger.printDebug(() -> "Card tint: the app draws the image " + image.getClass().getSimpleName()
                + " of " + describeView(imageView) + " in another view, so it was not copied");
    }

    private static void logUnreadableDrawable(Drawable drawable, Exception ex) {
        if (!loggedDrawableClasses.add(drawable.getClass())) {
            return;
        }

        Logger.printDebug(() -> "Card colors: cannot sample the thumbnail of "
                + drawable.getClass().getSimpleName() + ": " + ex);
    }

    /**
     * @return The view and the classes of the drawables and the backgrounds of the views inside it,
     *         which are the images that could be the thumbnail of a card.
     */
    private static String describeChildren(View item) {
        StringBuilder description = new StringBuilder(describeView(item));
        appendChildDescriptions(item, 0, description);
        return description.toString();
    }

    private static void appendChildDescriptions(View view, int depth, StringBuilder description) {
        if (depth > 3 || description.length() > 500 || !(view instanceof ViewGroup group)) {
            return;
        }

        for (int i = 0, count = group.getChildCount(); i < count; i++) {
            View child = group.getChildAt(i);
            description.append(", ").append(describeView(child));
            appendChildDescriptions(child, depth + 1, description);
            if (description.length() > 500) {
                return;
            }
        }
    }

    private static String describeView(View view) {
        StringBuilder description = new StringBuilder(view.getClass().getSimpleName())
                .append(' ').append(view.getWidth()).append('x').append(view.getHeight());
        if (view instanceof ImageView imageView && imageView.getDrawable() != null) {
            description.append(' ').append(imageView.getDrawable().getClass().getSimpleName());
        }
        if (view.getBackground() != null) {
            description.append(" on ").append(view.getBackground().getClass().getSimpleName());
        }
        return description.toString();
    }

    private static String shorten(@Nullable CharSequence text) {
        if (text == null) {
            return "";
        }
        return text.length() <= 32 ? text.toString() : text.subSequence(0, 32) + "...";
    }

    private static void logSlowUpdate(long startTime) {
        if (sampledThisFrame == 0) {
            return;
        }

        final long duration = System.nanoTime() - startTime;
        if (duration < SLOW_UPDATE_NANOS) {
            return;
        }

        final long now = System.currentTimeMillis();
        if (now - slowUpdateLogTime < SLOW_UPDATE_INTERVAL_MILLIS) {
            return;
        }
        slowUpdateLogTime = now;

        Logger.printDebug(() -> String.format(Locale.US,
                "Card colors: sampled %d thumbnails in %d ms", sampledThisFrame, duration / 1_000_000));
    }

    /**
     * The color of the card that a view of the feed shows, with the surfaces that it was applied to.
     */
    private static final class CardState {
        /**
         * Label of the card that the view showed when it was read, which is the title of the card.
         */
        @Nullable
        private CharSequence label;
        /**
         * Color applied to the surfaces of the card, which is the tint of the card or no tint.
         */
        private int color = NO_TINT;
        /**
         * Tint sampled from the thumbnail of the card, or no tint until the thumbnail is readable.
         */
        private int sampledColour = NO_TINT;
        /**
         * Color that the color hook returned for the last background of the card that was looked up,
         * which is logged to compare it with the tint that was applied.
         */
        private int bandColour = NO_TINT;
        @Nullable
        private WeakReference<ImageView> thumbnailView;
        @Nullable
        private WeakReference<Drawable> sampledDrawable;
        private long sampleStart;
        private long sampledTime;
        private int sampleAttempts;
        private boolean sampleFinal;
        private int thumbnailBottom = -1;
        /**
         * Surfaces of the card below the thumbnail that the tint was applied to, which keep no tint when
         * the card loses it, or when the app mounts other surfaces.
         */
        private final List<Drawable> lowerBackgrounds = new ArrayList<>(2);
        private final List<ImageView> lowerImages = new ArrayList<>(2);
        /**
         * Surface that the patch draws for the card, above the background of the card of the app.
         */
        @Nullable
        private CardSurface surface;
        private int rowsFound;
        private int rowsTinted;
        private int rowCopies;
        private boolean dirty;

        /**
         * @return Whether the view shows another card than the card that the state was read from.
         */
        boolean bind(@Nullable CharSequence label) {
            if (this.label == label) {
                return false;
            }

            final boolean rebound;
            if (this.label == null) {
                // The label of an item is set after its view is added to the list, so it is not a rebind.
                rebound = false;
            } else if (label == null) {
                // The app clears the label of a view before it sets the label of the card that the view
                // shows next, so the card of the view is not known now.
                rebound = true;
            } else {
                rebound = !TextUtils.equals(this.label, label);
            }

            this.label = label;
            return rebound;
        }

        /**
         * Removes the tint of the card from the images of the metadata, which the app mounts again.
         */
        void clearRowImages() {
            for (int i = 0, count = lowerImages.size(); i < count; i++) {
                if (clearRowFilter(lowerImages.get(i))) {
                    dirty = true;
                }
            }
            lowerImages.clear();
        }

        /**
         * Drops the color and the sampling of the card that the view showed before. The surfaces are
         * applied again with the color of the new card before the next pre-draw. The images of the metadata
         * lose the tint of the card, because the app mounts the view of an image again as another image.
         */
        void reset() {
            clearRowImages();

            color = NO_TINT;
            sampledColour = NO_TINT;
            bandColour = NO_TINT;
            sampledDrawable = null;
            sampleStart = 0;
            sampledTime = 0;
            sampleAttempts = 0;
            sampleFinal = false;
            thumbnailBottom = -1;
            rowsFound = 0;
            rowsTinted = 0;
            rowCopies = 0;
            dirty = true;
        }

        /**
         * Drops the surface that the patch draws and the tint of the surfaces, for an item that the app
         * no longer shows as a card.
         */
        void restore(View item) {
            clearSurfaces();
            removeCardSurface(item, this);
            reset();
            dirty = false;
        }

        /**
         * Removes the tint of the surfaces of the card, which keep the colors of the app.
         */
        void clearSurfaces() {
            for (int i = 0, count = lowerBackgrounds.size(); i < count; i++) {
                if (clearCardFilter(lowerBackgrounds.get(i))) {
                    dirty = true;
                }
            }
            lowerBackgrounds.clear();

            clearRowImages();
        }

        @Nullable
        ImageView getThumbnailView(View item) {
            ImageView imageView = thumbnailView == null ? null : thumbnailView.get();
            if (imageView == null || !isInside(imageView, item)) {
                return null;
            }
            return imageView;
        }

        void setThumbnailView(ImageView imageView) {
            thumbnailView = new WeakReference<>(imageView);
            thumbnailBottom = -1;
        }

        /**
         * @return Whether the thumbnail must be sampled again, because it's new or it was not readable yet.
         */
        boolean needsSample(Drawable drawable, long now) {
            if (sampledDrawable == null || drawable != sampledDrawable.get()) {
                return true;
            }
            if (sampleFinal) {
                return false;
            }

            // The image can replace the placeholder of the app inside the same drawable, so the drawable
            // is not enough to know that the thumbnail changed.
            return sampleAttempts < MAXIMUM_SAMPLE_ATTEMPTS
                    && now - sampleStart < MAXIMUM_SAMPLE_MILLIS
                    && now - sampledTime >= SAMPLE_RETRY_INTERVAL_MILLIS;
        }

        /**
         * Keeps the tint of the sampled thumbnail. A thumbnail without a color does not replace the tint of
         * the card that was sampled before, so a card whose image is replaced by a placeholder keeps its
         * tint instead of losing it.
         */
        void sampled(Drawable drawable, long now, float hue, boolean bitmap) {
            if (sampledDrawable == null || drawable != sampledDrawable.get()) {
                sampledDrawable = new WeakReference<>(drawable);
                sampleAttempts = 0;
                sampleStart = now;
                sampleFinal = false;
            }
            sampleAttempts++;
            sampledTime = now;

            if (!Float.isNaN(hue)) {
                sampledColour = getTint(hue);
                sampleFinal = true;
                dirty = true;
                return;
            }
            // A gray bitmap is a thumbnail without color, which is not sampled again, and the other
            // drawables can still be replaced by the image of the card while it loads.
            sampleFinal = bitmap;
        }
    }

    /**
     * The fill of the surface of a card: a rounded rectangle in the color of the card, inset like the
     * outline of the card, which keeps the corners of the card, also where the view does not clip it.
     * <p>
     * The fill does not paint the zone of the thumbnail, where the video of the card plays: the video is a
     * surface below the window of the app, so any opaque pixel that the window has over it hides the video.
     * The thumbnail of a card that does not play covers the zone, and the corners of the card are rounded by
     * the clip of the card.
     */
    private static final class CardFillDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final float radius = FeedCardLayoutPatch.CARD_CORNER_RADIUS;
        private final int horizontalPadding = Dim.dp(FeedCardLayoutPatch.CARD_HORIZONTAL_PADDING_DP);
        private final int verticalPadding = Dim.dp(FeedCardLayoutPatch.CARD_VERTICAL_PADDING_DP);
        private int color;
        /**
         * Bottom of the zone of the thumbnail, relative to the top of the bounds of the drawable.
         */
        private int videoZoneBottom;

        CardFillDrawable(int color, int videoZoneBottom) {
            this.videoZoneBottom = videoZoneBottom;
            setColor(color);
        }

        void setColor(int color) {
            if (this.color != color) {
                this.color = color;
                paint.setColor(color);
                invalidateSelf();
            }
        }

        void setVideoZoneBottom(int videoZoneBottom) {
            if (this.videoZoneBottom != videoZoneBottom) {
                this.videoZoneBottom = videoZoneBottom;
                invalidateSelf();
            }
        }

        @Override
        public void draw(@NonNull Canvas canvas) {
            final Rect bounds = getBounds();
            final int left = bounds.left + horizontalPadding;
            final int top = bounds.top + verticalPadding;
            final int right = bounds.right - horizontalPadding;
            final int bottom = bounds.bottom - verticalPadding;

            final int paintedTop = FeedCardFill.getFillTop(top, bottom, bounds.top + videoZoneBottom);
            if (paintedTop >= bottom) {
                return;
            }

            rect.set(left, top, right, bottom);
            canvas.save();
            canvas.clipRect(left, paintedTop, right, bottom);
            canvas.drawRoundRect(rect, radius, radius, paint);
            canvas.restore();
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(@Nullable ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * The surface that the patch draws for a card that the app draws without a surface of its own, above
     * the background of the card that the app set, if any.
     */
    private static final class CardSurface {
        private final CardFillDrawable fill;
        private final Drawable background;
        private final Drawable drawable;
        private int color;
        private int videoZoneBottom;

        CardSurface(int color, int videoZoneBottom, @Nullable Drawable background) {
            this.color = color;
            this.videoZoneBottom = videoZoneBottom;
            this.background = background;
            this.fill = new CardFillDrawable(color, videoZoneBottom);
            this.drawable = background == null ? fill : new LayerDrawable(new Drawable[]{fill, background});
        }

        void update(int color, int videoZoneBottom) {
            if (this.color != color) {
                this.color = color;
                fill.setColor(color);
            }
            if (this.videoZoneBottom != videoZoneBottom) {
                this.videoZoneBottom = videoZoneBottom;
                fill.setVideoZoneBottom(videoZoneBottom);
            }
        }
    }

    /**
     * The tint that the patch set on the drawable of an image of the metadata of a card, with the view that
     * showed the drawable.
     */
    private static final class RowFilter {
        private final WeakReference<ImageView> view;
        private final ColorFilter filter;

        RowFilter(ImageView view, ColorFilter filter) {
            this.view = new WeakReference<>(view);
            this.filter = filter;
        }
    }
}
