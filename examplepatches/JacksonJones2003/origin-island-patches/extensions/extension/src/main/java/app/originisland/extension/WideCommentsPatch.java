package app.originisland.extension;

import android.content.res.Resources;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.animation.ValueAnimator;
import android.view.animation.DecelerateInterpolator;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Shows the comments of a video under the video in the wide layout of the watch page, as on a
 * tablet or an opened foldable phone held sideways.
 *
 * That layout has the player with the title, buttons and a teaser of the comments under it on
 * the left, and the videos YouTube suggests on the right. The panels of a video, such as the
 * comments and the description, open over the suggested videos. The patch moves them under
 * the player instead, opens the comments there as a video is opened, and shows them below the
 * buttons, where the teaser was. Dragging the header of a panel up expands it over the title
 * and buttons, and dragging it down brings them back.
 *
 * The watch page lays out and draws its parts itself, and clips each part to where it put it,
 * so the panels are drawn without that clip once moved.
 */
@SuppressWarnings("unused")
public final class WideCommentsPatch {

    private static final String TAG = "WideComments";

    private static final String APP_RESOURCES_PACKAGE = "com.google.android.youtube";

    /**
     * The text of the teaser of the comments, the first line of which is the word.
     */
    private static final String COMMENTS = "comments";

    /**
     * The least of the comments that is shown under the title and buttons, in dp.
     */
    private static final int MIN_PANEL_HEIGHT_DP = 200;

    /**
     * How fast a header is flung to expand or shrink a panel, in dp per second.
     */
    private static final int FLING_VELOCITY_DP = 800;

    /**
     * How long the app takes to slide a closed panel away.
     */
    private static final long CLOSING_MS = 1000;

    private static int infoPanelId;
    private static int infoListId;
    private static int metadataId;
    private static int wrapperId;
    private static int panelId;
    private static int headerId;
    private static int suggestionsId;
    private static int suggestionsScrimId;
    private static int scrimId;

    private static Method getTextContent;
    private static Method getTextItems;

    private static final State state = new State();

    private WideCommentsPatch() {
    }

    private static final class State {
        ViewGroup layout;
        View info;
        View infoList;
        View metadata;
        View wrapper;
        View panel;
        View suggestions;
        View suggestionsScrim;
        final java.util.Map<View, int[]> panelSizes = new java.util.HashMap<>();
        final List<View> scrims = new ArrayList<>();
        View teaser;

        /**
         * If the panels are moved under the player.
         */
        boolean moved;
        float appliedX = Float.NaN;
        float appliedY = Float.NaN;
        float appFromX;
        float appFromY;

        boolean panelOpen;
        /**
         * How far below the top of the space under the player the panels start. It is
         * {@link #maxSlide} as a panel opens, and 0 once it is expanded over the title.
         */
        int slide;
        int maxSlide;

        /**
         * The title of the video the comments were opened for, or closed by the user for.
         */
        String handledVideo;
        long closedAt;
        String openingVideo;

        boolean tracking;
        boolean dragging;
        float downX;
        float downY;
        float lastY;
        int touchSlop;
        VelocityTracker velocityTracker;
        ValueAnimator settle;
    }

    /**
     * Injection point. Called as the layout of the watch page is inflated.
     */
    public static void onWatchLayoutInflated(ViewGroup layout) {
        try {
            state.layout = layout;
            state.touchSlop = ViewConfiguration.get(layout.getContext()).getScaledTouchSlop();

            Resources resources = layout.getResources();
            String packageName = layout.getContext().getPackageName();
            infoPanelId = getId(resources, packageName, "watch_info_panel");
            infoListId = getId(resources, packageName, "watch_info_watch_list");
            metadataId = getId(resources, packageName, "video_metadata_layout");
            wrapperId = getId(resources, packageName, "engagement_panel_wrapper");
            panelId = getId(resources, packageName, "engagement_panel");
            headerId = getId(resources, packageName, "header_container");
            suggestionsId = getId(resources, packageName, "video_info_loading_layout");
            suggestionsScrimId = getId(resources, packageName, "watch_panel_scrim");
            scrimId = getId(resources, packageName, "scrim");
            if (infoPanelId == 0 || infoListId == 0 || metadataId == 0 || wrapperId == 0 || panelId == 0) {
                Log.e(TAG, "Views of the watch page not found");
                return;
            }

            ViewTreeObserver observer = layout.getViewTreeObserver();
            observer.addOnPreDrawListener(() -> {
                try {
                    update(layout, false);
                } catch (Throwable ex) {
                    Log.e(TAG, "onPreDraw failure", ex);
                }
                return true;
            });
            layout.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
                try {
                    update(layout, true);
                } catch (Throwable ex) {
                    Log.e(TAG, "onLayoutChange failure", ex);
                }
            });
        } catch (Throwable ex) {
            Log.e(TAG, "onWatchLayoutInflated failure", ex);
        }
    }

    /**
     * Injection point. Called in place of the watch page measuring one of its views, so that
     * the moved panels are measured for the space under the player. Measured for the space of
     * the suggested videos as well, the comments would be laid out for both, by turns.
     */
    public static void measureChild(View child, int widthMeasureSpec, int heightMeasureSpec) {
        if (isMovedWrapper(child) || isInMovedWrapper(child)) {
            widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(state.info.getWidth(), View.MeasureSpec.EXACTLY);
            heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(panelHeight(), View.MeasureSpec.EXACTLY);
        }
        child.measure(widthMeasureSpec, heightMeasureSpec);
    }

    /**
     * Injection point. Called in place of the watch page laying out one of its parts.
     */
    public static void layoutChild(View child, int left, int top, int right, int bottom) {
        if (isMovedWrapper(child)) {
            right = left + state.info.getWidth();
            bottom = top + panelHeight();
            measureMovedWrapper();
        } else if (isInMovedWrapper(child)) {
            right = left + state.info.getWidth();
            bottom = top + panelHeight();
        }
        child.layout(left, top, right, bottom);
    }

    /**
     * The app does not always measure its parts again before laying them out.
     */
    private static void measureMovedWrapper() {
        View wrapper = state.wrapper;
        if (wrapper.getMeasuredWidth() != state.info.getWidth()
                || wrapper.getMeasuredHeight() != panelHeight()) {
            wrapper.measure(
                    View.MeasureSpec.makeMeasureSpec(state.info.getWidth(), View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(panelHeight(), View.MeasureSpec.EXACTLY));
        }
    }

    /**
     * Injection point. Called as the watch page puts one of its parts where it goes.
     *
     * @return If the part is the moved panels, which are put under the player instead.
     */
    public static boolean placesChild(View child) {
        try {
            if (child == null || !isMovedWrapper(child)) {
                return false;
            }
            applyPosition();
            return true;
        } catch (Throwable ex) {
            Log.e(TAG, "placesChild failure", ex);
            return false;
        }
    }

    /**
     * The watch page also measures and lays out the panels themselves, for the space of the
     * suggested videos.
     */
    private static boolean isInMovedWrapper(View child) {
        return state.wrapper != null && child.getParent() == state.wrapper && isMovedWrapper(state.wrapper);
    }

    /**
     * The panels end at the bottom of the space under the player.
     */
    private static int panelHeight() {
        return Math.max(1, state.info.getHeight() - (state.panelOpen ? state.slide : 0));
    }

    private static boolean isMovedWrapper(View child) {
        return state.moved && child == state.wrapper && state.info != null
                && state.info.getWidth() > 0 && state.info.getHeight() > 0;
    }

    /**
     * Injection point. Called as the watch page draws one of its parts.
     *
     * @return If the part is drawn without the clip of the watch page.
     */
    public static boolean drawsUnclipped(ViewGroup layout, View child) {
        return state.moved && child == state.wrapper && layout == state.layout;
    }

    /**
     * Injection point.
     *
     * @return If the touch is taken to drag the header of the panel under the player.
     */
    public static boolean onInterceptTouchEvent(ViewGroup layout, MotionEvent event) {
        try {
            if (layout != state.layout) {
                return false;
            }

            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    state.dragging = false;
                    state.tracking = isActive() && inHeader(event.getX(), event.getY());
                    if (state.tracking) {
                        if (state.settle != null) {
                            state.settle.cancel();
                        }
                        state.downX = event.getX();
                        state.downY = event.getY();
                        state.lastY = event.getY();
                        startVelocity(event);
                    }
                    return false;

                case MotionEvent.ACTION_MOVE:
                    if (!state.tracking || state.dragging) {
                        return state.dragging;
                    }
                    addVelocity(event);

                    float dx = event.getX() - state.downX;
                    float dy = event.getY() - state.downY;
                    if (Math.abs(dy) <= state.touchSlop || Math.abs(dy) <= Math.abs(dx)) {
                        return false;
                    }
                    state.dragging = true;
                    state.lastY = event.getY();
                    return true;

                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    state.tracking = false;
                    return false;
            }
        } catch (Throwable ex) {
            Log.e(TAG, "onInterceptTouchEvent failure", ex);
        }
        return false;
    }

    /**
     * Injection point.
     *
     * @return If the touch is used to drag the header of the panel under the player.
     */
    public static boolean onTouchEvent(ViewGroup layout, MotionEvent event) {
        try {
            if (layout != state.layout || !state.dragging) {
                return false;
            }

            addVelocity(event);
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_MOVE:
                    setSlide(state.slide + Math.round(event.getY() - state.lastY));
                    state.lastY = event.getY();
                    break;

                case MotionEvent.ACTION_UP:
                    state.velocityTracker.computeCurrentVelocity(1000);
                    float velocity = state.velocityTracker.getYVelocity();
                    stopDragging();
                    settle(velocity);
                    break;

                case MotionEvent.ACTION_CANCEL:
                    stopDragging();
                    settle(0);
                    break;
            }
            return true;
        } catch (Throwable ex) {
            Log.e(TAG, "onTouchEvent failure", ex);
            return false;
        }
    }

    private static void stopDragging() {
        state.dragging = false;
        state.tracking = false;
        if (state.velocityTracker != null) {
            state.velocityTracker.recycle();
            state.velocityTracker = null;
        }
    }

    private static void startVelocity(MotionEvent event) {
        if (state.velocityTracker != null) {
            state.velocityTracker.recycle();
        }
        state.velocityTracker = VelocityTracker.obtain();
        state.velocityTracker.addMovement(event);
    }

    private static void addVelocity(MotionEvent event) {
        if (state.velocityTracker != null) {
            state.velocityTracker.addMovement(event);
        }
    }

    /**
     * Expands the panel over the title, or shrinks it below the title, whichever it was dragged
     * or flung closer to.
     *
     * @param velocity How fast the header was dragged down, or up if negative.
     */
    private static void settle(float velocity) {
        float fling = FLING_VELOCITY_DP * state.layout.getResources().getDisplayMetrics().density;
        boolean expand;
        if (velocity < -fling) {
            expand = true;
        } else if (velocity > fling) {
            expand = false;
        } else {
            expand = state.slide < state.maxSlide / 2;
        }

        int target = expand ? 0 : state.maxSlide;
        state.settle = ValueAnimator.ofInt(state.slide, target);
        state.settle.setDuration(200);
        state.settle.setInterpolator(new DecelerateInterpolator());
        state.settle.addUpdateListener(animator -> {
            if (isActive()) {
                setSlide((Integer) animator.getAnimatedValue());
            }
        });
        state.settle.start();
    }

    private static void setSlide(int slide) {
        state.slide = Math.max(0, Math.min(state.maxSlide, slide));
        applyPosition();
    }

    private static boolean isActive() {
        return state.moved && state.panelOpen;
    }

    /**
     * @return If the point is on the header of the panel, with its title and filters.
     */
    private static boolean inHeader(float x, float y) {
        View info = state.info;
        float left = info.getLeft() + info.getTranslationX();
        float top = panelTop();
        return x >= left && x < left + info.getWidth() && y >= top && y < top + headerHeight();
    }

    private static int headerHeight() {
        View header = headerId == 0 ? null : state.panel.findViewById(headerId);
        if (header != null && header.getHeight() > 0) {
            return header.getHeight();
        }
        return Math.round(100 * state.info.getResources().getDisplayMetrics().density);
    }

    private static float panelTop() {
        return state.info.getTop() + state.info.getTranslationY() + state.slide;
    }

    private static void update(ViewGroup layout, boolean laidOut) {
        if (layout != state.layout) {
            return;
        }
        if (state.wrapper == null || !state.wrapper.isAttachedToWindow()) {
            state.info = layout.findViewById(infoPanelId);
            state.metadata = layout.findViewById(metadataId);
            state.wrapper = layout.findViewById(wrapperId);
            state.panel = state.wrapper == null ? null : state.wrapper.findViewById(panelId);
            state.infoList = state.info == null ? null : state.info.findViewById(infoListId);
            state.suggestions = state.metadata == null || suggestionsId == 0
                    ? null : state.metadata.findViewById(suggestionsId);
            state.suggestionsScrim = state.metadata == null || suggestionsScrimId == 0
                    ? null : state.metadata.findViewById(suggestionsScrimId);
            if (state.info == null || state.metadata == null || state.wrapper == null
                    || state.panel == null || state.infoList == null) {
                state.wrapper = null;
                return;
            }
        }

        View info = state.info;
        View wrapper = state.wrapper;
        float infoX = info.getLeft() + info.getTranslationX();
        float metadataX = state.metadata.getLeft() + state.metadata.getTranslationX();
        boolean wide = info.getVisibility() == View.VISIBLE && info.getWidth() > 0 && info.getHeight() > 0
                && state.metadata.getVisibility() == View.VISIBLE
                && metadataX >= infoX + info.getWidth() - 1;

        // Keeps where the app puts the panels, to put them back.
        if (wrapper.getTranslationX() != state.appliedX || wrapper.getTranslationY() != state.appliedY) {
            state.appFromX = wrapper.getTranslationX();
            state.appFromY = wrapper.getTranslationY();
        }

        if (!wide) {
            if (state.moved) {
                state.moved = false;
                closeInline();
                restoreWrapper();
                wrapper.setTranslationX(state.appFromX);
                wrapper.setTranslationY(state.appFromY);
                state.appliedX = Float.NaN;
                state.appliedY = Float.NaN;
                wrapper.requestLayout();
            }
            return;
        }
        state.moved = true;

        boolean panelOpen = state.panel.getVisibility() == View.VISIBLE;
        String video = videoTitle();
        if (laidOut || !panelOpen) {
            updateMaxSlide();
        }

        if (panelOpen && !state.panelOpen) {
            state.panelOpen = true;
            state.slide = state.maxSlide;
            state.handledVideo = video;
        } else if (!panelOpen && state.panelOpen) {
            closeInline();
            // The title may have loaded since the panel opened, and a closed panel stays closed.
            state.handledVideo = video;
            state.closedAt = android.os.SystemClock.uptimeMillis();
        }

        if (!panelOpen && laidOut && video != null && !video.equals(state.handledVideo)
                && !video.equals(state.openingVideo)) {
            openComments(video);
        }

        // The app hides and darkens the suggested videos while a panel covers them, and until
        // a closed panel has slid away.
        boolean covered = state.panelOpen
                || android.os.SystemClock.uptimeMillis() - state.closedAt < CLOSING_MS;
        if (covered && state.suggestions != null && state.suggestions.getVisibility() == View.GONE) {
            state.suggestions.setVisibility(View.VISIBLE);
        }
        if (covered) {
            if (laidOut || state.scrims.isEmpty()) {
                state.scrims.clear();
                findScrims(state.metadata);
            }
            for (View scrim : state.scrims) {
                if (scrim.getAlpha() != 0) {
                    scrim.setAlpha(0);
                }
            }
        }
        fillWrapper();
        remeasurePanels();

        applyPosition();
    }

    /**
     * Finds what the app darkens the suggested videos with.
     */
    private static void findScrims(View view) {
        int id = view.getId();
        if (id != View.NO_ID && (id == suggestionsScrimId || id == scrimId)) {
            state.scrims.add(view);
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                findScrims(group.getChildAt(i));
            }
        }
    }

    /**
     * The app gives the panels the size of the space of the suggested videos.
     */
    private static void fillWrapper() {
        ViewGroup wrapper = (ViewGroup) state.wrapper;
        for (int i = 0; i < wrapper.getChildCount(); i++) {
            View child = wrapper.getChildAt(i);
            ViewGroup.LayoutParams params = child.getLayoutParams();
            if (params == null || (params.width == ViewGroup.LayoutParams.MATCH_PARENT
                    && params.height == ViewGroup.LayoutParams.MATCH_PARENT)) {
                continue;
            }
            state.panelSizes.put(child, new int[]{params.width, params.height});
            params.width = ViewGroup.LayoutParams.MATCH_PARENT;
            params.height = ViewGroup.LayoutParams.MATCH_PARENT;
            child.setLayoutParams(params);
        }
    }

    private static int mismatchedFrames;

    /**
     * The panels were measured for the space of the suggested videos before they were moved,
     * and are not measured again unless asked to.
     */
    private static void remeasurePanels() {
        ViewGroup wrapper = (ViewGroup) state.wrapper;
        int width = wrapper.getMeasuredWidth();
        int height = wrapper.getMeasuredHeight();
        boolean mismatched = false;
        for (int i = 0; i < wrapper.getChildCount(); i++) {
            View child = wrapper.getChildAt(i);
            if (child.getVisibility() != View.GONE
                    && (child.getMeasuredWidth() != width || child.getMeasuredHeight() != height)) {
                mismatched = true;
                if (mismatchedFrames < 3) {
                    child.requestLayout();
                } else {
                    child.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                            View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
                    child.layout(0, 0, width, height);
                }
            }
        }
        mismatchedFrames = mismatched ? mismatchedFrames + 1 : 0;
    }

    private static void restoreWrapper() {
        for (java.util.Map.Entry<View, int[]> entry : state.panelSizes.entrySet()) {
            ViewGroup.LayoutParams params = entry.getKey().getLayoutParams();
            if (params != null) {
                params.width = entry.getValue()[0];
                params.height = entry.getValue()[1];
                entry.getKey().setLayoutParams(params);
            }
        }
        state.panelSizes.clear();
    }

    private static void closeInline() {
        state.panelOpen = false;
        if (state.settle != null) {
            state.settle.cancel();
        }
        state.slide = state.maxSlide;
    }

    /**
     * The comments start where the teaser of the comments is, or below the title and buttons.
     */
    private static void updateMaxSlide() {
        ViewGroup list = (ViewGroup) state.infoList;
        if (list.getChildCount() == 0) {
            return;
        }
        int top = list.getChildAt(list.getChildCount() - 1).getBottom();
        int teaser = state.teaser == null ? -1 : list.indexOfChild(state.teaser);
        if (teaser > 0) {
            top = list.getChildAt(teaser - 1).getBottom();
        }
        top += list.getTop();

        int min = Math.round(MIN_PANEL_HEIGHT_DP * list.getResources().getDisplayMetrics().density);
        int max = Math.max(0, Math.min(top, state.info.getHeight() - min));

        boolean atMax = state.slide >= state.maxSlide;
        state.maxSlide = max;
        if (atMax || state.slide > max) {
            state.slide = max;
        }
    }

    private static void applyPosition() {
        View info = state.info;
        View wrapper = state.wrapper;
        float x = info.getLeft() + info.getTranslationX() - wrapper.getLeft();
        float y = info.getTop() + info.getTranslationY() - wrapper.getTop()
                + (state.panelOpen ? state.slide : 0);
        if (wrapper.getTranslationX() != x) {
            wrapper.setTranslationX(x);
        }
        if (wrapper.getTranslationY() != y) {
            wrapper.setTranslationY(y);
        }
        state.appliedX = x;
        state.appliedY = y;

        if (wrapper.getWidth() != info.getWidth() || wrapper.getHeight() != panelHeight()
                || wrapper.getMeasuredWidth() != info.getWidth()
                || wrapper.getMeasuredHeight() != panelHeight()) {
            measureMovedWrapper();
            wrapper.layout(wrapper.getLeft(), wrapper.getTop(),
                    wrapper.getLeft() + info.getWidth(), wrapper.getTop() + panelHeight());
        }
    }

    /**
     * Opens the comments of the video by tapping their teaser.
     */
    private static void openComments(String video) {
        ViewGroup list = (ViewGroup) state.infoList;
        for (int i = 0; i < list.getChildCount(); i++) {
            View item = list.getChildAt(i);
            List<String> texts = new ArrayList<>();
            collectTexts(item, texts);
            if (texts.isEmpty() || !texts.get(0).trim().toLowerCase().startsWith(COMMENTS)) {
                continue;
            }

            View clickable = findClickable(item);
            if (clickable == null) {
                return;
            }
            state.teaser = item;
            state.openingVideo = video;
            updateMaxSlide();
            clickable.post(() -> {
                if (!state.panelOpen && clickable.isAttachedToWindow()) {
                    clickable.performClick();
                }
            });
            return;
        }
    }

    private static View findClickable(View view) {
        if (view.isClickable()) {
            return view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findClickable(group.getChildAt(i));
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    /**
     * @return The title of the video the watch page shows, the first text of its list.
     */
    private static String videoTitle() {
        ViewGroup list = (ViewGroup) state.infoList;
        if (list.getChildCount() == 0) {
            return null;
        }
        List<String> texts = new ArrayList<>();
        collectTexts(list.getChildAt(0), texts);
        return texts.isEmpty() ? null : texts.get(0);
    }

    /**
     * Collects the texts the components of the app draw, which are not views of their own.
     */
    private static void collectTexts(View view, List<String> texts) {
        try {
            if (getTextContent == null) {
                Class<?> hostClass = Class.forName("com.facebook.litho.ComponentHost");
                getTextContent = hostClass.getMethod("getTextContent");
                getTextItems = Class.forName("com.facebook.litho.TextContent").getMethod("getTextItems");
            }
            if (getTextContent.getDeclaringClass().isInstance(view)) {
                Object content = getTextContent.invoke(view);
                Object items = content == null ? null : getTextItems.invoke(content);
                if (items instanceof List) {
                    for (Object item : (List<?>) items) {
                        if (item != null && !item.toString().trim().isEmpty()) {
                            texts.add(item.toString());
                        }
                    }
                }
            }
        } catch (Throwable ex) {
            Log.e(TAG, "collectTexts failure", ex);
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                collectTexts(group.getChildAt(i), texts);
            }
        }
    }

    private static int getId(Resources resources, String packageName, String name) {
        for (String resourcesPackage : new String[]{packageName, APP_RESOURCES_PACKAGE}) {
            int id = resources.getIdentifier(name, "id", resourcesPackage);
            if (id != 0) {
                return id;
            }
        }
        return 0;
    }
}
