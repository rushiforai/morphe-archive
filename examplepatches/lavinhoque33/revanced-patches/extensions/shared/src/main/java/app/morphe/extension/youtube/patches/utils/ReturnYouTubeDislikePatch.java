/*
 * Copyright (C) 2022-2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - anddea (https://github.com/anddea)
 * - inotia00 (https://github.com/inotia00)
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-20.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Additional Terms & Attribution Requirements
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Source Credit Preservation (Section 7(b)): This specific copyright notice
 *    and the list of original authors above must be preserved in any copy
 *    or derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin & Modification Marking (Section 7(c)): Modified versions must be
 *    clearly marked as such (e.g., by adding a "Modified by" line or a new
 *    copyright notice) and must not be misrepresented as the original work.
 *
 * 3. Version Control Attribution (Section 7(b)): Any ports or substantial
 *    modifications must retain historical authorship credit in version control
 *    systems (e.g., Git), listing original author(s) appropriately and
 *    modifiers as committers or co-authors.
 *
 * 4. User Interface Attribution (Section 7(b)): Any works containing or
 *    derived from this material must maintain a visible credit or
 *    acknowledgment to the original author(s) within the application's
 *    user interface (e.g., in an "About" or "Credits" section).
 */

package app.morphe.extension.youtube.patches.utils;

import static app.morphe.extension.shared.returnyoutubedislike.ReturnYouTubeDislike.Vote;

import android.app.Activity;
import android.graphics.Rect;
import android.text.Layout;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import androidx.annotation.GuardedBy;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import app.morphe.extension.shared.returnyoutubedislike.requests.ReturnYouTubeDislikeApi;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.components.ActionButtonsFilter;
import app.morphe.extension.youtube.patches.player.VideoActionBarLayoutPatch;
import app.morphe.extension.youtube.returnyoutubedislike.DislikePill;
import app.morphe.extension.youtube.returnyoutubedislike.ReturnYouTubeDislike;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoInformation;
import app.morphe.extension.youtube.utils.ThemeUtils;
import kotlin.Unit;

/**
 * Handles all interaction of UI patch components.
 */
@SuppressWarnings("unused")
public class ReturnYouTubeDislikePatch {

    /**
     * A playback session, not a request ID. Revisiting the same video can share its fetch but
     * must never revive a binding created during an earlier visit.
     */
    @Nullable
    private static volatile WatchBinding currentWatch;

    /**
     * Last video id prefetched. Field is to prevent prefetching the same video id multiple times in a row.
     */
    @Nullable
    private static volatile String lastPrefetchedVideoId;

    private static final String VIDEO_ACTION_BAR_PREFIX = "video_action_bar.";
    private static final String COMPACTIFY_VIDEO_ACTION_BAR_PREFIX = "compactify_video_action_bar.";
    private static final String ACTION_BUTTON_COUNT_TAG_PREFIX = "revanced_ryd_regular_action_button_count_";
    private static final Spannable ACTION_BUTTON_COUNT_PLACEHOLDER = new SpannableString("");
    private static final int ACTION_BUTTON_COUNT_VERTICAL_SPACING_PIXELS = -Utils.dipToPixels(11);
    private static final int ACTION_BUTTON_COUNT_HORIZONTAL_SPACING_PIXELS = Utils.dipToPixels(4);
    private static final int ACTION_BUTTON_COUNT_RESERVED_HEIGHT_PIXELS = Utils.dipToPixels(18);
    private static final float ACTION_BUTTON_COUNT_DEFAULT_TEXT_SIZE_SP = 12;
    private static final float ACTION_BUTTON_COUNT_MINIMUM_TEXT_SIZE_SP = 9;
    private static final float ACTION_BUTTON_COUNT_TEXT_SIZE_STEP_SP = 0.5f;
    private static final CountLabelMeasurement likeCountMeasurement = new CountLabelMeasurement();
    private static final CountLabelMeasurement dislikeCountMeasurement = new CountLabelMeasurement();
    @Nullable
    private static WeakReference<ViewGroup> regularActionButtonCountRoot;
    @Nullable
    private static WeakReference<View> regularLikeActionButton;
    @Nullable
    private static WeakReference<View> regularDislikeActionButton;
    @Nullable
    private static WeakReference<TextView> regularLikeActionButtonCountLabel;
    @Nullable
    private static WeakReference<TextView> regularDislikeActionButtonCountLabel;
    @Nullable
    private static ViewTreeObserver.OnPreDrawListener regularActionButtonCountPositionListener;
    private static int regularActionButtonCountRevision = -1;
    @Nullable
    private static Long regularActionButtonCountOriginalLikes;
    @Nullable
    private static CharSequence regularLikeActionButtonCountText;
    @Nullable
    private static CharSequence regularDislikeActionButtonCountText;
    @Nullable
    private static WeakReference<ViewGroup> regularActionButtonCountSearchRoot;
    @Nullable
    private static ViewTreeObserver.OnPreDrawListener regularActionButtonCountSearchListener;
    private static int regularActionButtonCountSearchRetries;
    private static boolean regularActionButtonCountSearchExhausted;

    private static final View.OnAttachStateChangeListener positionRootAttachment = new OverlayRootAttachment(false);
    private static final View.OnAttachStateChangeListener searchRootAttachment = new OverlayRootAttachment(true);

    private record OverlayRootAttachment(boolean search) implements View.OnAttachStateChangeListener {
        @Override
        public void onViewAttachedToWindow(View view) {
        }

        @Override
        public void onViewDetachedFromWindow(View view) {
            WeakReference<ViewGroup> owner = search ? regularActionButtonCountSearchRoot : regularActionButtonCountRoot;
            if (owner == null || owner.get() != view) {
                return;
            }
            if (search) {
                removeRegularActionButtonCountSearchUpdates();
            } else {
                removeTrackedRegularActionButtonCountLabels();
                removeRegularActionButtonCountPositionUpdates();
            }
        }
    }

    /**
     * Accessibility text parsed for the last action-bar video. YouTube can reuse the same button
     * view while a playlist item is changing, so equal text from the previous video is not safe to
     * parse until the action bar has had a chance to rebind.
     */
    @Nullable
    private static String lastParsedRegularLikeButtonContentDescription;
    @Nullable
    private static WeakReference<CharSequence> lastParsedRegularLikeButtonDescriptionSource;
    @Nullable
    private static WeakReference<WatchBinding> lastParsedRegularLikeButtonWatch;
    @Nullable
    private static WeakReference<View> lastParsedRegularLikeButtonView;

    static final class WatchBinding implements Runnable {
        final ReturnYouTubeDislike data;
        final WatchCountText text = new WatchCountText(this);

        WatchBinding(ReturnYouTubeDislike data) {
            this.data = data;
        }

        boolean isCurrent() {
            if (currentWatch != this || !Settings.RYD_ENABLED.get()) {
                return false;
            }
            String videoId = VideoInformation.getVideoId();
            return videoId.isEmpty() || videoId.equals(data.getVideoId());
        }

        boolean canShowCounts() {
            return isCurrent() && PlayerType.getCurrent() == PlayerType.WATCH_WHILE_MAXIMIZED;
        }

        @Override
        public void run() {
            if (canShowCounts()) {
                text.refreshSegmentedViews();
                text.refreshRollingViews();
                scheduleRegularActionButtonCountOverlayUpdates();
            }
        }
    }

    @Nullable
    private static ReturnYouTubeDislike getCurrentVideoData() {
        WatchBinding watch = currentWatch;
        return watch == null ? null : watch.data;
    }

    static {
        PlayerType.getOnChange().addObserver((PlayerType type) -> {
            Utils.runOnMainThreadNowOrLater(ReturnYouTubeDislikePatch::onPlayerTypeChangedForRegularActionButtonCounts);
            return Unit.INSTANCE;
        });
    }

    public static void onRYDStatusChange() {
        ReturnYouTubeDislikeApi.resetRateLimits();
        // Must remove all values to protect against using stale data
        // if the user enables RYD while a video is on screen.
        clearData();
    }

    private static void clearData() {
        WatchBinding watch = currentWatch;
        currentWatch = null;
        if (watch != null) {
            watch.data.removeDataListener(watch);
            watch.text.refreshSegmentedViews();
            watch.text.clearRollingViews();
        }
        DislikePill.setWatchSession(null);
        regularActionButtonCountRevision = -1;
        regularActionButtonCountOriginalLikes = null;
        regularLikeActionButtonCountText = null;
        regularDislikeActionButtonCountText = null;
        removeRegularActionButtonCountOverlays();
    }

    //
    // Litho player for regular videos.
    //

    /**
     * Injection point.
     * <p>
     * For Litho segmented buttons.
     */
    @NonNull
    public static CharSequence onLithoTextLoaded(@NonNull Object conversionContext,
                                                 @NonNull CharSequence original) {
        try {
            WatchBinding watch = currentWatch;
            if (watch != null && watch.isCurrent()
                    && conversionContext.toString().contains("segmented_like_dislike_button.")) {
                return watch.text.markSegmented(original);
            }
        } catch (Exception ex) {
            Logger.printException(() -> "onLithoTextLoaded failure", ex);
        }
        return original;
    }

    /** Resolves only a marked segmented label in the native text component's measure/layout passes. */
    public static CharSequence resolveSegmentedCount(CharSequence original) {
        return WatchCountText.resolveSegmented(original);
    }

    /** Validates only cached layouts for the marked presentation supplied by the sizing pass. */
    @Nullable
    public static Layout reuseSegmentedCountLayout(@Nullable Layout cached, CharSequence text) {
        return WatchCountText.reuseSegmentedLayout(cached, text);
    }

    //
    // Rolling Number
    //

    /** Marks the String passed to the native model builder, leaving its displayed content intact. */
    public static String onRollingNumberLoaded(Object conversionContext, String original) {
        try {
            WatchBinding watch = currentWatch;
            if (watch != null && watch.isCurrent()) {
                String path = conversionContext.toString();
                if (path.contains(VIDEO_ACTION_BAR_PREFIX) && path.contains("segmented_like_dislike_button.")) {
                    return watch.text.markRolling(original);
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "onRollingNumberLoaded failure", ex);
        }
        return original;
    }

    public static String rollingNumberTextForMeasure(String original) {
        WatchBinding watch = currentWatch;
        return watch == null ? original : watch.text.rollingTextForMeasure(original);
    }

    /**
     * Injection point.
     * <p>
     * Called for all usage of Rolling Number.
     * Modifies the measured String text width to include the left separator and padding, if needed.
     */
    public static float onRollingNumberMeasured(String text, float measuredTextWidth) {
        try {
            if (Settings.RYD_ENABLED.get()) {
                if (ReturnYouTubeDislike.isPreviouslyCreatedSegmentedSpan(text)) {
                    // +1 pixel is needed for some foreign languages that measure
                    // the text different from what is used for layout (Greek in particular).
                    // Probably a bug in Android, but who knows.
                    // Single line mode is also used as an additional fix for this issue.
                    if (Settings.RYD_COMPACT_LAYOUT.get()) {
                        return measuredTextWidth + 1;
                    }

                    return measuredTextWidth + 1
                            + ReturnYouTubeDislike.leftSeparatorBounds.right
                            + ReturnYouTubeDislike.leftSeparatorShapePaddingPixels;
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "onRollingNumberMeasured failure", ex);
        }

        return measuredTextWidth;
    }

    /** The native initial bind supplies the exact String owned by its rolling model. */
    public static void bindRollingNumber(TextView view, CharSequence original) {
        setRollingNumberText(view, original, true);
    }

    /** Native animation may supply an ImageSpan instead of the original String instance. */
    public static void updateRollingNumber(TextView view, CharSequence original) {
        setRollingNumberText(view, original, false);
    }

    private static void setRollingNumberText(TextView view, CharSequence original, boolean initial) {
        try {
            WatchBinding watch = currentWatch;
            if (watch != null) {
                watch.text.setRollingText(view, original, initial);
                return;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "setRollingNumberText failure", ex);
        }
        view.setText(original);
    }

    /**
     * Injection point.
     * <p>
     * Called when a regular video EML action bar has lazily converted its action buttons.
     * This hook can be invoked from Litho background work, so the view-tree search is always
     * dispatched to the main thread before touching Android views.
     */
    public static void onLazilyConvertedElementLoaded(@NonNull List<Object> treeNodeResultList,
                                                      @NonNull String identifier) {
        WatchBinding watch = currentWatch;
        if (watch == null || !isRegularVideoActionBar(identifier)) {
            return;
        }

        Utils.runOnMainThreadNowOrLater(() -> {
            if (watch.isCurrent()) {
                scheduleRegularActionButtonCountOverlayUpdates();
            }
        });
    }

    private static boolean isRegularVideoActionBar(@NonNull String identifier) {
        return identifier.startsWith(VIDEO_ACTION_BAR_PREFIX)
                || identifier.startsWith(COMPACTIFY_VIDEO_ACTION_BAR_PREFIX);
    }

    private static void onPlayerTypeChangedForRegularActionButtonCounts() {
        WatchBinding watch = currentWatch;
        if (watch == null) {
            return;
        }
        if (!watch.canShowCounts()) {
            watch.data.removeDataListener(watch);
            watch.text.refreshRollingViews();
            watch.text.refreshSegmentedViews();
            removeRegularActionButtonCountOverlays();
            return;
        }

        watch.data.addDataListener(watch);
        watch.run();
    }

    @SuppressWarnings("BooleanMethodIsAlwaysInverted")
    private static boolean canShowRegularActionButtonCountOverlays() {
        return !regularActionButtonCountOverlaysAreUnsupported()
                && PlayerType.getCurrent() == PlayerType.WATCH_WHILE_MAXIMIZED;
    }

    /**
     * New count overlays belong to the maximized new-layout action row only. Existing overlays are
     * retained during fullscreen/minimized transitions, but no new anchors may be discovered.
     */
    private static boolean regularActionButtonCountOverlaysAreUnsupported() {
        return Settings.DISABLE_LAYOUT_UPDATES.get()
                // Minimal splits server-sent segmented buttons, so it needs regular count overlays.
                || VideoActionBarLayoutPatch.getLayout().usesSegmentedCounts(
                        ActionButtonsFilter.hasCurrentVideoSegmentedButton());
    }

    /**
     * Schedules updates to the regular video action bar overlays (likes and dislikes count).
     * Reads the latest available counts and binds only the current, rebound action row.
     * The native like count can be rendered before the network response arrives.
     */
    private static void scheduleRegularActionButtonCountOverlayUpdates() {
        if (!Utils.isCurrentlyOnMainThread()) {
            Utils.runOnMainThreadNowOrLater(ReturnYouTubeDislikePatch::scheduleRegularActionButtonCountOverlayUpdates);
            return;
        }

        WatchBinding watch = currentWatch;
        if (watch == null || !watch.canShowCounts()) {
            removeRegularActionButtonCountOverlays();
            return;
        }
        ReturnYouTubeDislike videoData = watch.data;

        if (regularActionButtonCountOverlaysAreUnsupported()) {
            if (regularActionButtonCountRoot != null || regularActionButtonCountSearchRoot != null) {
                removeRegularActionButtonCountOverlays();
            }
            return;
        }

        ViewGroup decorViewRoot = getDecorViewRoot();
        if (decorViewRoot == null || !decorViewRoot.isAttachedToWindow()) {
            return;
        }
        RegularActionButtonAnchors anchors = findRegularActionButtonAnchors(decorViewRoot);
        if (anchors == null || !updateUserVoteAndParseLikes(watch, anchors)) {
            if (!regularActionButtonCountSearchExhausted) {
                ensureRegularActionButtonCountSearchUpdates(decorViewRoot);
            }
            return;
        }

        int revision = videoData.getRevision();
        Long originalLikes = VideoInformation.getOriginalLikeCount();
        if (regularActionButtonCountRevision != revision
                || !Objects.equals(regularActionButtonCountOriginalLikes, originalLikes)) {
            regularActionButtonCountRevision = revision;
            regularActionButtonCountOriginalLikes = originalLikes;
            regularLikeActionButtonCountText =
                    videoData.getLikeSpanForRegularVideoActionButton(ACTION_BUTTON_COUNT_PLACEHOLDER);
            regularDislikeActionButtonCountText =
                    videoData.getDislikeSpanForRegularVideoActionButton(ACTION_BUTTON_COUNT_PLACEHOLDER);
        }

        updateRegularActionButtonCountOverlays(decorViewRoot, anchors);
    }

    private static void updateRegularActionButtonCountOverlays(
            ViewGroup decorViewRoot, RegularActionButtonAnchors anchors) {
        try {

            ViewGroup overlayHost = findSuitableOverlayHost(anchors.getVisibleButton(), decorViewRoot);

            ViewGroup previousRoot = regularActionButtonCountRoot == null
                    ? null
                    : regularActionButtonCountRoot.get();
            if (previousRoot != null && previousRoot != overlayHost) {
                removeTrackedRegularActionButtonCountLabels();
                removeRegularActionButtonCountPositionUpdates();
            }

            removeRegularActionButtonCountSearchUpdates();
            TextView likeLabel;
            TextView dislikeLabel;
            if (anchors.likeButton() != null) {
                likeLabel = getOrCreateRegularActionButtonCountLabel(overlayHost, true);
            } else {
                likeLabel = getTrackedRegularActionButtonCountLabel(true);
            }
            if (anchors.dislikeButton() != null) {
                dislikeLabel = getOrCreateRegularActionButtonCountLabel(overlayHost, false);
            } else {
                dislikeLabel = getTrackedRegularActionButtonCountLabel(false);
            }
            setRegularActionButtonCountAnchors(
                    overlayHost,
                    anchors.likeButton(),
                    anchors.dislikeButton(),
                    likeLabel,
                    dislikeLabel
            );
            positionRegularActionButtonCountLabels(
                    overlayHost,
                    anchors.likeButton(),
                    likeLabel,
                    regularLikeActionButtonCountText,
                    anchors.dislikeButton(),
                    dislikeLabel,
                    regularDislikeActionButtonCountText
            );
        } catch (Exception ex) {
            Logger.printException(() -> "updateRegularActionButtonCountOverlays failure", ex);
        }
    }

    @Nullable
    private static RegularActionButtonAnchors findRegularActionButtonAnchors(@NonNull ViewGroup root) {
        if (!canShowRegularActionButtonCountOverlays() || !isViewVisibleOnScreen(root)) {
            return null;
        }

        return findRegularActionButtonAnchorsByTag(root);
    }

    @Nullable
    private static RegularActionButtonAnchors findRegularActionButtonAnchorsByTag(@NonNull ViewGroup root) {
        int tagId = ResourceUtils.getIdIdentifier("elements_accessibility_view_tag_id");
        if (tagId == 0) {
            // Logger.printDebug(() -> "findRegularActionButtonAnchorsByTag: tagId 'elements_accessibility_view_tag_id' not found");
            return null;
        }

        List<View> taggedButtons = new ArrayList<>();
        collectTaggedVideoActionButtons(root, tagId, taggedButtons);

        // Logger.printDebug(() -> "findRegularActionButtonAnchorsByTag: collected " + taggedButtons.size() + " total tagged button candidates");

        View likeButton = null;
        View dislikeButton = null;

        for (View button : taggedButtons) {
            String tag = getElementAccessibilityTag(button, tagId);
            if (tag != null) {
                if (tag.contains("id.video.like") && likeButton == null) {
                    likeButton = button;
                } else if (tag.contains("id.video.dislike") && dislikeButton == null) {
                    dislikeButton = button;
                }
            }
        }

        if (likeButton != null && dislikeButton != null) {
            final View finalLike = likeButton;
            final View finalDislike = dislikeButton;
            // Logger.printDebug(() -> "findRegularActionButtonAnchorsByTag: matched anchors by Litho tag: like=" + finalLike + ", dislike=" + finalDislike);
            return new RegularActionButtonAnchors(likeButton, dislikeButton);
        }

        final View finalLike = likeButton;
        final View finalDislike = dislikeButton;
        /* Uncomment for testing
        if (taggedButtons.isEmpty()) {
            Logger.printDebug(() -> "findRegularActionButtonAnchorsByTag: no views with like/dislike tags found");
        } else {
            Logger.printDebug(() -> "findRegularActionButtonAnchorsByTag: failed to resolve complete pair (likeFound=" + (finalLike != null) + ", dislikeFound=" + (finalDislike != null) + ")");
        }
        */

        return null;
    }

    private static boolean isPlayerOverlayView(@Nullable View view) {
        if (view == null) {
            return false;
        }

        String className = view.getClass().getName();
        return className.contains("YouTubePlayerOverlaysLayout");
    }

    private static void collectTaggedVideoActionButtons(@Nullable View view, int tagId, @NonNull List<View> result) {
        if (!isViewValid(view) || !isViewVisibleOnScreen(view) || isRegularActionButtonCountOverlay(view) || isPlayerOverlayView(view)) {
            return;
        }

        String tag = getElementAccessibilityTag(view, tagId);
        if (tag != null && (tag.contains("id.video.like") || tag.contains("id.video.dislike"))) {
            final String finalTag = tag;
            final View finalView = view;
            // Logger.printDebug(() -> "collectTaggedVideoActionButtons: matched candidate button=" + finalView + ", tag=" + finalTag + ", parent=" + (finalView.getParent() != null ? finalView.getParent().getClass().getName() : "null"));
            result.add(view);
        }

        if (view instanceof ViewGroup viewGroup) {
            for (int i = 0, childCount = viewGroup.getChildCount(); i < childCount; i++) {
                collectTaggedVideoActionButtons(viewGroup.getChildAt(i), tagId, result);
            }
        }
    }

    @Nullable
    private static String getElementAccessibilityTag(@Nullable View view, int tagId) {
        if (view == null || tagId == 0) {
            return null;
        }
        Object tag = view.getTag(tagId);
        return tag != null ? tag.toString() : null;
    }

    @NonNull
    private static ViewGroup findSuitableOverlayHost(@NonNull View anchor, @NonNull ViewGroup fallbackRoot) {
        ViewGroup current = anchor.getParent() instanceof ViewGroup ? (ViewGroup) anchor.getParent() : null;
        while (current != null && current != fallbackRoot) {
            String name = current.getClass().getName();
            // We want a standard ViewGroup that can host our overlays properly without overriding absolute positioning.
            if (!name.contains("ComponentHost") && !name.contains("LithoView") && !name.contains("RecyclerView") && !name.contains("LinearLayout")) {
                if (current instanceof android.widget.FrameLayout || current instanceof android.widget.RelativeLayout) {
                    return current;
                }
            }
            current = current.getParent() instanceof ViewGroup ? (ViewGroup) current.getParent() : null;
        }
        return fallbackRoot;
    }

    private static boolean isDescendantOf(@NonNull View view, @NonNull ViewGroup ancestor) {
        ViewParent parent = view.getParent();
        while (parent instanceof View parentView) {
            if (parentView == ancestor) {
                return true;
            }
            parent = parentView.getParent();
        }

        return false;
    }

    /**
     * Temporarily hides count labels while the player is transitioning without discarding the
     * labels or the action-button state needed when the same video is reopened.
     */
    private static void hideTrackedRegularActionButtonCountLabels() {
        TextView likeLabel = regularLikeActionButtonCountLabel == null
                ? null
                : regularLikeActionButtonCountLabel.get();
        TextView dislikeLabel = regularDislikeActionButtonCountLabel == null
                ? null
                : regularDislikeActionButtonCountLabel.get();

        if (likeLabel != null) {
            likeLabel.setVisibility(View.GONE);
        }
        if (dislikeLabel != null) {
            dislikeLabel.setVisibility(View.GONE);
        }
    }

    @NonNull
    private static TextView getOrCreateRegularActionButtonCountLabel(@NonNull ViewGroup root,
                                                                     boolean likeButton) {
        TextView textView = getTrackedRegularActionButtonCountLabel(likeButton);
        ViewGroup trackedRoot = regularActionButtonCountRoot == null
                ? null
                : regularActionButtonCountRoot.get();
        if (textView != null && trackedRoot == root) {
            return textView;
        }

        if (textView != null && trackedRoot != null) {
            trackedRoot.getOverlay().remove(textView);
        }

        if (textView == null) {
            textView = new TextView(root.getContext());
            textView.setTag(getRegularActionButtonCountOverlayTag(likeButton));
            textView.setGravity(Gravity.CENTER);
            textView.setIncludeFontPadding(false);
            textView.setSingleLine(true);
            textView.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
            textView.setTextSize(TypedValue.COMPLEX_UNIT_SP, ACTION_BUTTON_COUNT_DEFAULT_TEXT_SIZE_SP);
            textView.setTextColor(ThemeUtils.getAppForegroundColor());
            textView.setElevation(Utils.dipToPixels(8));

            if (likeButton) {
                regularLikeActionButtonCountLabel = new WeakReference<>(textView);
            } else {
                regularDislikeActionButtonCountLabel = new WeakReference<>(textView);
            }
        } else if (textView.getParent() instanceof ViewGroup previousParent) {
            previousParent.removeView(textView);
        }

        root.getOverlay().add(textView);
        return textView;
    }

    @Nullable
    private static TextView getTrackedRegularActionButtonCountLabel(boolean likeButton) {
        WeakReference<TextView> textViewReference = likeButton
                ? regularLikeActionButtonCountLabel
                : regularDislikeActionButtonCountLabel;
        return textViewReference == null ? null : textViewReference.get();
    }

    private static void setRegularActionButtonCountAnchors(@NonNull ViewGroup root,
                                                           @Nullable View likeButton,
                                                           @Nullable View dislikeButton,
                                                           @Nullable TextView likeLabel,
                                                           @Nullable TextView dislikeLabel) {
        ViewGroup previousRoot = regularActionButtonCountRoot == null
                ? null
                : regularActionButtonCountRoot.get();
        if (previousRoot != root) {
            removeRegularActionButtonCountPositionUpdates();
        }

        regularActionButtonCountRoot = new WeakReference<>(root);
        regularLikeActionButton = likeButton == null ? null : new WeakReference<>(likeButton);
        regularDislikeActionButton = dislikeButton == null ? null : new WeakReference<>(dislikeButton);
        regularLikeActionButtonCountLabel = likeLabel == null ? null : new WeakReference<>(likeLabel);
        regularDislikeActionButtonCountLabel = dislikeLabel == null ? null : new WeakReference<>(dislikeLabel);

        if (regularActionButtonCountPositionListener == null) {
            WatchBinding watch = currentWatch;
            WeakReference<ViewGroup> owner = new WeakReference<>(root);
            regularActionButtonCountPositionListener = () -> {
                if (watch != null && watch.canShowCounts() && regularActionButtonCountRoot != null
                        && owner.get() == regularActionButtonCountRoot.get()) {
                    updateTrackedRegularActionButtonCountLabelPositions();
                }
                return true;
            };
            root.getViewTreeObserver().addOnPreDrawListener(regularActionButtonCountPositionListener);
            root.addOnAttachStateChangeListener(positionRootAttachment);
        }
    }

    private static void updateTrackedRegularActionButtonCountLabelPositions() {
        ViewGroup root = regularActionButtonCountRoot == null
                ? null
                : regularActionButtonCountRoot.get();
        View likeButton = regularLikeActionButton == null
                ? null
                : regularLikeActionButton.get();
        View dislikeButton = regularDislikeActionButton == null
                ? null
                : regularDislikeActionButton.get();
        TextView likeLabel = regularLikeActionButtonCountLabel == null
                ? null
                : regularLikeActionButtonCountLabel.get();
        TextView dislikeLabel = regularDislikeActionButtonCountLabel == null
                ? null
                : regularDislikeActionButtonCountLabel.get();

        if (root == null || (likeLabel == null && dislikeLabel == null)) {
            removeRegularActionButtonCountPositionUpdates();
            return;
        }

        ReturnYouTubeDislike videoData = getCurrentVideoData();
        if (videoData == null) {
            removeRegularActionButtonCountOverlays();
            return;
        }
        if (regularActionButtonCountOverlaysAreUnsupported()) {
            removeRegularActionButtonCountOverlays();
            return;
        }
        if (!canShowRegularActionButtonCountOverlays()) {
            hideTrackedRegularActionButtonCountLabels();
            return;
        }

        boolean likeAttached = likeButton != null && likeButton.isAttachedToWindow() && isDescendantOf(likeButton, root);
        boolean dislikeAttached = dislikeButton != null && dislikeButton.isAttachedToWindow() && isDescendantOf(dislikeButton, root);

        if ((likeButton != null && !likeAttached) || (dislikeButton != null && !dislikeAttached)) {
            likeButton = null;
            dislikeButton = null;
            regularLikeActionButton = null;
            regularDislikeActionButton = null;
        }

        if (likeButton == null && dislikeButton == null) {
            RegularActionButtonAnchors anchors = findRegularActionButtonAnchors(root);
            if (anchors == null) {
                hideTrackedRegularActionButtonCountLabels();
                return;
            }

            likeButton = anchors.likeButton();
            dislikeButton = anchors.dislikeButton();
            regularLikeActionButton = likeButton == null ? null : new WeakReference<>(likeButton);
            regularDislikeActionButton = dislikeButton == null ? null : new WeakReference<>(dislikeButton);
        }

        if (!trackedRegularActionButtonCountAnchorsAreValid(root, likeButton, dislikeButton)) {
            hideTrackedRegularActionButtonCountLabels();
            return;
        }

        // Always fit from the full cached value. Reusing an ellipsized label would permanently
        // retain truncation after rotation or any other layout expansion.
        CharSequence likeText = Objects.requireNonNullElse(
                regularLikeActionButtonCountText,
                ACTION_BUTTON_COUNT_PLACEHOLDER
        );
        CharSequence dislikeText = Objects.requireNonNullElse(
                regularDislikeActionButtonCountText,
                ACTION_BUTTON_COUNT_PLACEHOLDER
        );
        positionRegularActionButtonCountLabels(
                root,
                likeButton,
                likeLabel,
                likeText,
                dislikeButton,
                dislikeLabel,
                dislikeText
        );
    }

    private static boolean trackedRegularActionButtonCountAnchorsAreValid(@NonNull ViewGroup root,
                                                                           @Nullable View likeButton,
                                                                           @Nullable View dislikeButton) {
        boolean likeValid = likeButton == null || (
                likeButton.getWidth() > 0
                        && likeButton.getHeight() > 0
                        && isDescendantOf(likeButton, root)
                        && isViewVisibleOnScreen(likeButton)
        );
        boolean dislikeValid = dislikeButton == null || (
                dislikeButton.getWidth() > 0
                        && dislikeButton.getHeight() > 0
                        && isDescendantOf(dislikeButton, root)
                        && isViewVisibleOnScreen(dislikeButton)
        );
        return (likeButton != null || dislikeButton != null) && likeValid && dislikeValid;
    }

    private static void removeRegularActionButtonCountPositionUpdates() {
        ViewGroup root = regularActionButtonCountRoot == null
                ? null
                : regularActionButtonCountRoot.get();
        ViewTreeObserver.OnPreDrawListener listener = regularActionButtonCountPositionListener;
        if (root != null && listener != null) {
            root.removeOnAttachStateChangeListener(positionRootAttachment);
            ViewTreeObserver observer = root.getViewTreeObserver();
            if (observer.isAlive()) {
                observer.removeOnPreDrawListener(listener);
            }
        }

        regularActionButtonCountRoot = null;
        regularLikeActionButton = null;
        regularDislikeActionButton = null;
        regularActionButtonCountPositionListener = null;
        likeCountMeasurement.clear();
        dislikeCountMeasurement.clear();
    }

    private static void ensureRegularActionButtonCountSearchUpdates(@NonNull ViewGroup root) {
        ViewGroup previousRoot = regularActionButtonCountSearchRoot == null
                ? null
                : regularActionButtonCountSearchRoot.get();
        if (previousRoot != null && previousRoot != root) {
            removeRegularActionButtonCountSearchUpdates();
        }
        if (regularActionButtonCountSearchListener != null) {
            return;
        }

        WeakReference<ViewGroup> owner = new WeakReference<>(root);
        regularActionButtonCountSearchRoot = owner;
        regularActionButtonCountSearchRetries = 0;
        WatchBinding watch = currentWatch;
        regularActionButtonCountSearchListener = () -> {
            if (currentWatch != watch || regularActionButtonCountSearchRoot != owner) {
                return true;
            }
            if (watch == null || !watch.canShowCounts() || !canShowRegularActionButtonCountOverlays()) {
                removeRegularActionButtonCountSearchUpdates();
                return true;
            }

            scheduleRegularActionButtonCountOverlayUpdates();
            if (regularActionButtonCountSearchListener != null && ++regularActionButtonCountSearchRetries > 15) {
                regularActionButtonCountSearchExhausted = true;
                removeRegularActionButtonCountSearchUpdates();
            }
            return true;
        };
        root.getViewTreeObserver().addOnPreDrawListener(regularActionButtonCountSearchListener);
        root.addOnAttachStateChangeListener(searchRootAttachment);
    }

    private static void removeRegularActionButtonCountSearchUpdates() {
        ViewGroup root = regularActionButtonCountSearchRoot == null
                ? null
                : regularActionButtonCountSearchRoot.get();
        ViewTreeObserver.OnPreDrawListener listener = regularActionButtonCountSearchListener;
        if (root != null && listener != null) {
            root.removeOnAttachStateChangeListener(searchRootAttachment);
            ViewTreeObserver observer = root.getViewTreeObserver();
            if (observer.isAlive()) {
                observer.removeOnPreDrawListener(listener);
            }
        }

        regularActionButtonCountSearchRoot = null;
        regularActionButtonCountSearchListener = null;
        regularActionButtonCountSearchRetries = 0;
    }

    private static void positionRegularActionButtonCountLabels(@NonNull ViewGroup root,
                                                               @Nullable View likeButton,
                                                               @Nullable TextView likeLabel,
                                                               @NonNull CharSequence likeCount,
                                                               @Nullable View dislikeButton,
                                                               @Nullable TextView dislikeLabel,
                                                               @NonNull CharSequence dislikeCount) {
        Rect likeButtonBounds = likeButton == null ? null : getRegularActionButtonVisualBounds(root, likeButton);
        Rect dislikeButtonBounds = dislikeButton == null ? null : getRegularActionButtonVisualBounds(root, dislikeButton);
        int countTop = getRegularActionButtonCountTop(likeButtonBounds, dislikeButtonBounds);

        int rootWidth = Math.max(1, root.getWidth());
        int likeAvailableWidth = likeButtonBounds == null
                ? 0
                : getRegularActionButtonCountAvailableWidth(
                        rootWidth,
                        likeButtonBounds,
                        dislikeButtonBounds
                );

        int dislikeAvailableWidth = dislikeButtonBounds == null
                ? 0
                : getRegularActionButtonCountAvailableWidth(
                        rootWidth,
                        dislikeButtonBounds,
                        likeButtonBounds
                );

        boolean refit = !likeCountMeasurement.matches(likeLabel, likeCount, likeAvailableWidth)
                || !dislikeCountMeasurement.matches(dislikeLabel, dislikeCount, dislikeAvailableWidth);
        float sharedTextSizeSp = refit
                ? getRegularActionButtonCountTextSizeSp(
                        likeLabel, likeCount, likeAvailableWidth, dislikeLabel, dislikeCount, dislikeAvailableWidth)
                : 0;
        int textColor = ThemeUtils.getAppForegroundColor();
        boolean repaint = false;

        if (refit) {
            likeCountMeasurement.bind(likeLabel, likeCount, likeAvailableWidth);
            dislikeCountMeasurement.bind(dislikeLabel, dislikeCount, dislikeAvailableWidth);
        }

        if (likeButtonBounds != null && likeLabel != null) {
            repaint = positionRegularActionButtonCountLabel(
                    likeButtonBounds, likeLabel, likeCount, countTop, likeCountMeasurement,
                    refit, sharedTextSizeSp, textColor);
        }
        if (dislikeButtonBounds != null && dislikeLabel != null) {
            repaint |= positionRegularActionButtonCountLabel(
                    dislikeButtonBounds, dislikeLabel, dislikeCount, countTop, dislikeCountMeasurement,
                    refit, sharedTextSizeSp, textColor);
        }

        if (repaint) {
            root.invalidate();
        }
    }

    private static int getRegularActionButtonCountTop(@Nullable Rect likeButtonBounds,
                                                      @Nullable Rect dislikeButtonBounds) {
        if (likeButtonBounds == null && dislikeButtonBounds == null) {
            return 0;
        }
        if (likeButtonBounds == null) {
            return Objects.requireNonNull(dislikeButtonBounds).bottom
                    + ACTION_BUTTON_COUNT_VERTICAL_SPACING_PIXELS;
        }
        if (dislikeButtonBounds == null) {
            return likeButtonBounds.bottom + ACTION_BUTTON_COUNT_VERTICAL_SPACING_PIXELS;
        }

        return Math.min(likeButtonBounds.bottom, dislikeButtonBounds.bottom)
                + ACTION_BUTTON_COUNT_VERTICAL_SPACING_PIXELS;
    }

    private static boolean positionRegularActionButtonCountLabel(@NonNull Rect buttonVisualBounds,
                                                                 @NonNull TextView textView,
                                                                 @NonNull CharSequence text,
                                                                 int top,
                                                                 @NonNull CountLabelMeasurement measurement,
                                                                 boolean refit,
                                                                 float textSizeSp,
                                                                 int textColor) {
        if (text.length() == 0) {
            if (textView.getVisibility() == View.GONE) {
                return false;
            }
            textView.setVisibility(View.GONE);
            return true;
        }

        if (refit) {
            measurement.measure(textView, text, textSizeSp);
        }

        boolean repaint = refit;
        if (textView.getCurrentTextColor() != textColor) {
            textView.setTextColor(textColor);
            repaint = true;
        }

        int labelWidth = measurement.measuredWidth;
        int baseline = measurement.baseline;
        int layoutTop = baseline > 0 ? top + Utils.dipToPixels(12) - baseline : top;
        int left = buttonVisualBounds.centerX() - labelWidth / 2;
        int right = left + labelWidth;
        int bottom = layoutTop + ACTION_BUTTON_COUNT_RESERVED_HEIGHT_PIXELS;

        // Keep sampling the native anchors on pre-draw: they can move without a layout request.
        // A moved overlay child invalidates its new and old bounds through ViewGroupOverlay.
        if (refit || textView.getLeft() != left || textView.getTop() != layoutTop
                || textView.getRight() != right || textView.getBottom() != bottom) {
            textView.layout(left, layoutTop, right, bottom);
        }

        if (textView.getVisibility() != View.VISIBLE) {
            textView.setVisibility(View.VISIBLE);
            repaint = true;
        }
        return repaint;
    }

    /** Text metrics are independent of position until the count, slot, or label's layout inputs change. */
    @SuppressWarnings("deprecation") // scaledDensity is used for SP conversion on older Android versions.
    private static final class CountLabelMeasurement {
        private WeakReference<TextView> labelReference;
        private CharSequence sourceText;
        private CharSequence fittedText;
        private int availableWidth;
        private float fontScale;
        private float density;
        private float scaledDensity;
        private int layoutDirection;
        private int textDirection;
        private float textSizePixels;
        private int measuredWidth;
        private int baseline;

        boolean matches(@Nullable TextView label, @NonNull CharSequence text, int width) {
            TextView previousLabel = labelReference == null ? null : labelReference.get();
            if (label != previousLabel || text != sourceText || width != availableWidth) {
                return false;
            }
            if (label == null || width == 0 || text.length() == 0) {
                return true;
            }

            var resources = label.getResources();
            DisplayMetrics metrics = resources.getDisplayMetrics();
            return !label.isLayoutRequested()
                    && label.getLayout() != null
                    && label.getMeasuredWidth() == measuredWidth
                    && label.getMeasuredHeight() == ACTION_BUTTON_COUNT_RESERVED_HEIGHT_PIXELS
                    && label.getLayoutDirection() == layoutDirection
                    && label.getTextDirection() == textDirection
                    && label.getTextSize() == textSizePixels
                    && resources.getConfiguration().fontScale == fontScale
                    && metrics.density == density
                    && metrics.scaledDensity == scaledDensity
                    && TextUtils.equals(label.getText(), fittedText);
        }

        void bind(@Nullable TextView label, @NonNull CharSequence text, int width) {
            if (label == null) {
                labelReference = null;
            } else if (labelReference == null || labelReference.get() != label) {
                labelReference = new WeakReference<>(label);
            }
            sourceText = text;
            availableWidth = width;
            fittedText = null;
        }

        void measure(@NonNull TextView label, @NonNull CharSequence text, float textSizeSp) {
            fittedText = fitRegularActionButtonCountText(label, text, availableWidth, textSizeSp);
            if (!TextUtils.equals(label.getText(), fittedText)) {
                label.setText(fittedText);
            }

            int heightSpec = View.MeasureSpec.makeMeasureSpec(
                    ACTION_BUTTON_COUNT_RESERVED_HEIGHT_PIXELS, View.MeasureSpec.EXACTLY);
            label.measure(View.MeasureSpec.makeMeasureSpec(availableWidth, View.MeasureSpec.AT_MOST), heightSpec);
            measuredWidth = Math.max(1, label.getMeasuredWidth());
            label.measure(View.MeasureSpec.makeMeasureSpec(measuredWidth, View.MeasureSpec.EXACTLY), heightSpec);
            baseline = label.getBaseline();

            var resources = label.getResources();
            DisplayMetrics metrics = resources.getDisplayMetrics();
            density = metrics.density;
            scaledDensity = metrics.scaledDensity;
            fontScale = resources.getConfiguration().fontScale;
            layoutDirection = label.getLayoutDirection();
            textDirection = label.getTextDirection();
            textSizePixels = label.getTextSize();
        }

        void clear() {
            labelReference = null;
            sourceText = null;
            fittedText = null;
        }
    }

    /**
     * Returns the horizontal slot available to one count. Paired labels share the distance
     * between button centers, leaving a small gap so localized compact suffixes cannot overlap.
     */
    private static int getRegularActionButtonCountAvailableWidth(int rootWidth,
                                                                 @NonNull Rect buttonVisualBounds,
                                                                 @Nullable Rect adjacentButtonVisualBounds) {
        if (adjacentButtonVisualBounds == null) {
            return rootWidth;
        }

        int centerDistance = Math.abs(
                buttonVisualBounds.centerX() - adjacentButtonVisualBounds.centerX()
        );
        return Math.max(1, Math.min(
                rootWidth,
                centerDistance - ACTION_BUTTON_COUNT_HORIZONTAL_SPACING_PIXELS
        ));
    }

    /**
     * Returns one text size for the count pair. If either localized count needs a smaller size,
     * both labels use it so Like and Dislike remain visually balanced.
     */
    private static float getRegularActionButtonCountTextSizeSp(@Nullable TextView likeLabel,
                                                               @NonNull CharSequence likeText,
                                                               int likeAvailableWidth,
                                                               @Nullable TextView dislikeLabel,
                                                               @NonNull CharSequence dislikeText,
                                                               int dislikeAvailableWidth) {
        return Math.min(
                getRegularActionButtonCountTextSizeSp(likeLabel, likeText, likeAvailableWidth),
                getRegularActionButtonCountTextSizeSp(dislikeLabel, dislikeText, dislikeAvailableWidth)
        );
    }

    private static float getRegularActionButtonCountTextSizeSp(@Nullable TextView textView,
                                                               @NonNull CharSequence text,
                                                               int availableWidth) {
        if (textView == null || text.length() == 0) {
            return ACTION_BUTTON_COUNT_DEFAULT_TEXT_SIZE_SP;
        }

        TextPaint measurementPaint = new TextPaint(textView.getPaint());
        float textSizeSp = ACTION_BUTTON_COUNT_DEFAULT_TEXT_SIZE_SP;
        while (textSizeSp > ACTION_BUTTON_COUNT_MINIMUM_TEXT_SIZE_SP) {
            measurementPaint.setTextSize(TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_SP,
                    textSizeSp,
                    textView.getResources().getDisplayMetrics()
            ));
            if (measurementPaint.measureText(text.toString()) <= availableWidth) {
                break;
            }
            textSizeSp -= ACTION_BUTTON_COUNT_TEXT_SIZE_STEP_SP;
        }
        return textSizeSp;
    }

    /**
     * Applies the shared size selected for the pair, then ellipsizes as a final guard at 9sp.
     */
    @NonNull
    private static CharSequence fitRegularActionButtonCountText(@NonNull TextView textView,
                                                                @NonNull CharSequence text,
                                                                int availableWidth,
                                                                float textSizeSp) {
        float selectedTextSizePixels = TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_SP,
                textSizeSp,
                textView.getResources().getDisplayMetrics()
        );
        if (Math.abs(textView.getTextSize() - selectedTextSizePixels) > 0.5f) {
            textView.setTextSize(TypedValue.COMPLEX_UNIT_PX, selectedTextSizePixels);
        }

        TextPaint paint = textView.getPaint();
        return paint.measureText(text.toString()) <= availableWidth
                ? text
                : TextUtils.ellipsize(text, paint, availableWidth, TextUtils.TruncateAt.END);
    }

    @NonNull
    private static Rect getRegularActionButtonVisualBounds(@NonNull ViewGroup root,
                                                           @NonNull View button) {
        int[] rootLocation = new int[2];
        int[] buttonLocation = new int[2];
        root.getLocationInWindow(rootLocation);
        button.getLocationInWindow(buttonLocation);

        float visualScaleX = Math.max(0.1f, Math.min(button.getScaleX(), 1.0f));
        float visualScaleY = Math.max(0.1f, Math.min(button.getScaleY(), 1.0f));
        int visualLeft = buttonLocation[0] - rootLocation[0]
                + Math.round(button.getPivotX() * (1 - visualScaleX));
        int visualTop = buttonLocation[1] - rootLocation[1]
                + Math.round(button.getPivotY() * (1 - visualScaleY));
        int visualWidth = Math.max(1, Math.round(button.getWidth() * visualScaleX));
        int visualHeight = Math.max(1, Math.round(button.getHeight() * visualScaleY));
        return new Rect(visualLeft, visualTop, visualLeft + visualWidth, visualTop + visualHeight);
    }

    private static void removeRegularActionButtonCountOverlays() {
        regularActionButtonCountSearchExhausted = false;
        ViewGroup decorViewRoot = getDecorViewRoot();
        removeRegularActionButtonCountSearchUpdates();
        removeTrackedRegularActionButtonCountLabels();
        removeRegularActionButtonCountPositionUpdates();
        if (decorViewRoot != null) {
            removeRegularActionButtonCountLabels(decorViewRoot);
        }
    }

    private static void removeRegularActionButtonCountLabels(@NonNull ViewGroup root) {
        for (int i = root.getChildCount() - 1; i > -1; i--) {
            View child = root.getChildAt(i);
            if (isRegularActionButtonCountOverlay(child)) {
                root.removeViewAt(i);
            } else if (child instanceof ViewGroup viewGroup) {
                removeRegularActionButtonCountLabels(viewGroup);
            }
        }
    }

    private static void removeTrackedRegularActionButtonCountLabels() {
        removeRegularActionButtonCountLabel(true);
        removeRegularActionButtonCountLabel(false);
    }

    private static void removeRegularActionButtonCountLabel(boolean likeButton) {
        WeakReference<TextView> labelReference = likeButton
                ? regularLikeActionButtonCountLabel
                : regularDislikeActionButtonCountLabel;
        TextView label = labelReference == null ? null : labelReference.get();
        ViewGroup overlayRoot = regularActionButtonCountRoot == null
                ? null
                : regularActionButtonCountRoot.get();
        if (overlayRoot != null && label != null) {
            overlayRoot.getOverlay().remove(label);
        }
        if (label != null && label.getParent() instanceof ViewGroup parent) {
            parent.removeView(label);
        }

        if (likeButton) {
            regularLikeActionButtonCountLabel = null;
        } else {
            regularDislikeActionButtonCountLabel = null;
        }
    }

    @Nullable
    private static ViewGroup getDecorViewRoot() {
        Activity activity = Utils.getActivity();
        if (activity == null || !(activity.getWindow().getDecorView() instanceof ViewGroup root)) {
            return null;
        }
        return root;
    }

    private record RegularActionButtonAnchors(@Nullable View likeButton,
                                              @Nullable View dislikeButton) {
        @NonNull
        private View getVisibleButton() {
            return likeButton != null ? likeButton : Objects.requireNonNull(dislikeButton);
        }
    }

    private static boolean isRegularActionButtonCountOverlay(@Nullable View view) {
        if (view == null) {
            return false;
        }

        Object tag = view.getTag();
        return tag instanceof String && ((String) tag).startsWith(ACTION_BUTTON_COUNT_TAG_PREFIX);
    }

    @NonNull
    private static String getRegularActionButtonCountOverlayTag(boolean likeButton) {
        return ACTION_BUTTON_COUNT_TAG_PREFIX + (likeButton ? "like" : "dislike");
    }

    @SuppressWarnings("BooleanMethodIsAlwaysInverted")
    private static boolean isViewValid(@Nullable View view) {
        if (view == null || !view.isShown() || view.getWidth() <= 0 || view.getHeight() <= 0) {
            return false;
        }

        View current = view;
        while (current != null) {
            if (current.getAlpha() < 0.1f) {
                return false;
            }
            ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }

        return true;
    }

    private static boolean isViewVisibleOnScreen(@Nullable View view) {
        if (!isViewValid(view)) {
            return false;
        }
        Rect bounds = getViewWindowBounds(view);
        if (bounds.isEmpty() || bounds.bottom <= 0 || bounds.right <= 0) {
            return false;
        }
        View root = view.getRootView();
        if (root != null && (bounds.top >= root.getHeight() || bounds.left >= root.getWidth())) {
            return false;
        }
        return view.getLocalVisibleRect(new Rect());
    }

    @NonNull
    private static Rect getViewWindowBounds(@NonNull View view) {
        int[] location = new int[2];
        view.getLocationInWindow(location);
        return new Rect(location[0], location[1],
                location[0] + view.getWidth(), location[1] + view.getHeight());
    }

    //
    // Video ID and voting hooks (all players).
    //

    /**
     * Video ads in the regular video player are not hooked to {@link #preloadVideoId(String, boolean)}.
     * Therefore, video ads in the regular video player are not prefetched.
     * This can be used to identify whether a video id is a video ad or not.
     */
    @GuardedBy("itself")
    private static final Map<String, Boolean> playerResponseVideoIds = new LinkedHashMap<>() {
        private static final int NUMBER_OF_LAST_VIDEO_IDS_TO_TRACK = 5;

        @Override
        protected boolean removeEldestEntry(Entry eldest) {
            return size() > NUMBER_OF_LAST_VIDEO_IDS_TO_TRACK;
        }
    };

    /**
     * Injection point.  Uses 'playback response' video id hook to preload RYD.
     * <p>
     * Prefetching can happen before the current video ends. Keep its visible counts until
     * {@link #newVideoLoaded(String)} receives the next video's ID and clears them.
     */
    public static void preloadVideoId(@NonNull String videoId, boolean isShortAndOpeningOrPlaying) {
        try {
            if (!Settings.RYD_ENABLED.get()) {
                return;
            }
            if (videoId.equals(lastPrefetchedVideoId)) {
                return;
            }
            synchronized (playerResponseVideoIds) {
                // Add all prefetched video ids to 'playerResponseVideoIds'.
                playerResponseVideoIds.putIfAbsent(videoId, VideoInformation.lastPlayerResponseIsShort());
            }
            if (!Utils.isNetworkConnected()) {
                Logger.printDebug(() -> "Cannot pre-fetch RYD, network is not connected");
                lastPrefetchedVideoId = null;
                return;
            }

            // Do not preload Shorts shelf items. Shorts opened in the regular player are fetched
            // by newVideoLoaded() after the active player is known.
            // YouTube removed the Shorts dislike button in 2026, and RYD estimates for Shorts
            // are unreliable because API submissions can still heavily bias the ratio toward likes.
            if (VideoInformation.lastPlayerResponseIsShort()) {
                Logger.printDebug(() -> "Ignoring short video id: " + videoId);
                lastPrefetchedVideoId = videoId;
                return;
            }

            Logger.printDebug(() -> "Prefetching RYD for video: " + videoId);
            ReturnYouTubeDislike.getFetchForVideoId(videoId);

            lastPrefetchedVideoId = videoId;
        } catch (Exception ex) {
            Logger.printException(() -> "preloadVideoId failure", ex);
        }
    }

    /**
     * Injection point.  Uses 'current playing' video id hook.  Always called on main thread.
     */
    public static void newVideoLoaded(@NonNull String videoId) {
        try {
            if (!Settings.RYD_ENABLED.get()) {
                return;
            }
            Objects.requireNonNull(videoId);

            if (!videoIdIsSame(getCurrentVideoData(), videoId)) {
                clearData();
            }

            final PlayerType currentPlayerType = PlayerType.getCurrent();
            final boolean isNoneHiddenOrMinimized = currentPlayerType.isNoneHiddenOrMinimized();
            if (isNoneHiddenOrMinimized) {
                removeRegularActionButtonCountSearchUpdates();
                removeRegularActionButtonCountOverlays();
                return;
            }

            if (videoIdIsSame(getCurrentVideoData(), videoId)) {
                return;
            }
            synchronized (playerResponseVideoIds) {
                // All video ids except those in the regular video player have been prefetched.
                // Video ids not present in 'playerResponseVideoIds' are video ads from the regular video player.
                if (!playerResponseVideoIds.containsKey(videoId)) {
                    // When a regular video player video ad is fetched,
                    // the dislike count of the video ad is used instead of the dislike count of the original video.
                    Logger.printDebug(() -> "Skip video ads: " + videoId);
                    return;
                }
            }

            ReturnYouTubeDislike request = ReturnYouTubeDislike.getFetchForVideoIdOrNull(videoId);
            if (request == null && !Utils.isNetworkConnected()) {
                Logger.printDebug(() -> "Cannot fetch RYD, network is not connected");
                return;
            }

            Logger.printDebug(() -> "New video id: " + videoId + " playerType: " + currentPlayerType);

            // The player-type guard excludes the Shorts feed. Fetch on demand so Shorts opened
            // in the regular player receive counts without prefetching Shorts shelf items.
            regularActionButtonCountSearchExhausted = false;
            WatchBinding watch = new WatchBinding(
                    request != null ? request : ReturnYouTubeDislike.getFetchForVideoId(videoId));
            DislikePill.setWatchSession(watch);
            currentWatch = watch;
            if (watch.canShowCounts()) {
                watch.data.addDataListener(watch);
                watch.run();
            }
        } catch (Exception ex) {
            Logger.printException(() -> "newVideoLoaded failure", ex);
        }
    }

    private static boolean videoIdIsSame(@Nullable ReturnYouTubeDislike fetch, @Nullable String videoId) {
        return (fetch == null && videoId == null)
                || (fetch != null && fetch.getVideoId().equals(videoId));
    }

    /**
     * Injection point.
     * <p>
     * Called when the user likes or dislikes.
     *
     * @param endpoint string that matches {@link Vote#endpoint}
     * @param videoId  video ID included in the endpoint request body
     */
    public static void sendVote(@NonNull String endpoint, @Nullable String videoId) {
        try {
            if (!Settings.RYD_ENABLED.get()) {
                return;
            }
            if (videoId == null || videoId.isEmpty()) {
                Logger.printDebug(() -> "Ignore playlist votes");
                return;
            }

            if (PlayerType.getCurrent().isNoneHiddenOrMinimized()) {
                return;
            }

            WatchBinding watch = currentWatch;
            if (watch == null || !watch.isCurrent() || !videoId.equals(watch.data.getVideoId())) {
                Logger.printDebug(() -> "Ignore vote for non-current video: " + videoId);
                return;
            }

            for (Vote v : Vote.values()) {
                if (v.endpoint.equals(endpoint)) {
                    Utils.runOnMainThreadNowOrLater(() -> {
                        if (watch.isCurrent()) {
                            watch.data.sendVote(v);
                        }
                    });
                    return;
                }
            }
            Logger.printException(() -> "Unknown endpoint: " + endpoint);
        } catch (Exception ex) {
            Logger.printException(() -> "sendVote failure", ex);
        }
    }

    private static boolean updateUserVoteAndParseLikes(WatchBinding watch, RegularActionButtonAnchors anchors) {
        View likeButton = anchors.likeButton();
        if (likeButton == null) {
            return true;
        }

        CharSequence contentDesc = likeButton.getContentDescription();
        String contentDescription = contentDesc == null ? null : contentDesc.toString();
        boolean sameAnchor = lastParsedRegularLikeButtonView != null
                && lastParsedRegularLikeButtonView.get() == likeButton;
        boolean sameWatch = lastParsedRegularLikeButtonWatch != null && lastParsedRegularLikeButtonWatch.get() == watch;
        if (sameAnchor && Objects.equals(contentDescription, lastParsedRegularLikeButtonContentDescription)) {
            // A timeout is not evidence that the previous row was rebound, including A -> B -> A.
            if (sameWatch) {
                return true;
            }
            if (lastParsedRegularLikeButtonDescriptionSource != null
                    && lastParsedRegularLikeButtonDescriptionSource.get() == contentDesc) {
                return false;
            }
        }
        ReturnYouTubeDislike videoData = watch.data;

        if (videoData.getUserVote() == null) {
            if (isLikeButtonLiked(anchors.likeButton())) {
                videoData.setUserVote(Vote.LIKE);
            } else if (anchors.dislikeButton() != null && isDislikeButtonDisliked(anchors.dislikeButton())) {
                videoData.setUserVote(Vote.DISLIKE);
            } else {
                videoData.setUserVote(Vote.LIKE_REMOVE);
            }
        }

        lastParsedRegularLikeButtonContentDescription = contentDescription;
        lastParsedRegularLikeButtonDescriptionSource = new WeakReference<>(contentDesc);
        lastParsedRegularLikeButtonWatch = new WeakReference<>(watch);
        lastParsedRegularLikeButtonView = new WeakReference<>(likeButton);
        parseAndSetOriginalLikeCount(contentDesc);
        return true;
    }

    /**
     * Parses the original like count from the like button's accessibility content description.
     * <p>
     * Instead of using fragile regex patterns or checking language-specific suffixes, this method
     * implements a completely universal digits-only parsing algorithm:
     * 1. Finds the first digit in the string.
     * 2. Extracts all digit characters, ignoring separators (like commas, dots, and spaces).
     * 3. Normalizes Unicode digits (like Arabic-Indic digits) to standard ASCII 0-9 values.
     * 4. Parses the resulting string directly into a Long value.
     * This is robust because accessibility guidelines require screen readers to receive the full,
     * un-compactified count (e.g. 5,497,262 instead of 5.5M), and the likes count is the only
     * variable number present in the like button's content description.
     * <p>
     * The contentDescription always indicates that the video is already liked and never changes,
     * even after the user toggles the like button.
     * This causes issues with the like count, particularly after restarting the app.
     *
     * @param contentDescription The raw content description of the like button.
     * @return The extracted likes count, or null if parsing failed.
     */
    @Nullable
    private static Long tryParseLikesFromContentDescription(@Nullable CharSequence contentDescription) {
        if (contentDescription == null) {
            Logger.printDebug(() -> "tryParseLikesFromContentDescription: contentDescription is null");
            return null;
        }
        String desc = contentDescription.toString();
        Logger.printDebug(() -> "tryParseLikesFromContentDescription: contentDescription='" + desc + "'");
        
        StringBuilder digits = new StringBuilder();
        for (int i = 0; i < desc.length(); i++) {
            char c = desc.charAt(i);
            if (Character.isDigit(c)) {
                int digitVal = Character.getNumericValue(c);
                if (digitVal >= 0 && digitVal <= 9) {
                    digits.append(digitVal);
                }
            }
        }
        
        if (digits.length() == 0) {
            Logger.printDebug(() -> "tryParseLikesFromContentDescription: No digits found");
            return null;
        }
        
        try {
            Long val = Long.parseLong(digits.toString());
            Logger.printDebug(() -> "tryParseLikesFromContentDescription: parsed val=" + val);
            return val;
        } catch (NumberFormatException e) {
            Logger.printDebug(() -> "tryParseLikesFromContentDescription: Failed to parse digits='" + digits + "'");
            return null;
        }
    }

    private static void parseAndSetOriginalLikeCount(@Nullable CharSequence contentDesc) {
        Long parsedLikes = tryParseLikesFromContentDescription(contentDesc);
        if (parsedLikes != null) {
            long baseCount = Math.max(0L, parsedLikes - 1);
            Long currentOriginal = VideoInformation.getOriginalLikeCount();
            if (!Objects.equals(currentOriginal, baseCount)) {
                Logger.printDebug(() -> "parseAndSetOriginalLikeCount: parsedLikes=" + parsedLikes + " -> setting original unliked baseCount=" + baseCount);
                VideoInformation.setOriginalLikeCount(baseCount, true);
                ReturnYouTubeDislike videoData = getCurrentVideoData();
                if (videoData != null) {
                    videoData.clearUICache();
                }
            }
        }
    }

    private static boolean isLikeButtonLiked(@NonNull View likeButton) {
        return likeButton.isSelected();
    }

    private static boolean isDislikeButtonDisliked(@NonNull View dislikeButton) {
        return dislikeButton.isSelected();
    }
}
