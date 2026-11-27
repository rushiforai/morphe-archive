/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */
package app.pomee4.extension.commentswipe;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;


/**
 * Sync for Reddit style swipe actions on comments: swiping a comment left or right slides it and
 * reveals the first or second action of that direction, picked by how far it is swiped.
 * <p>
 * Reddit draws comments with an obfuscated copy of Jetpack Compose, so the swipe itself is done
 * with plain Android views: the window's touch events are watched, and once a sideways drag starts
 * on a comment, a copy of the comment's pixels slides over it. The comment row only tells this
 * class where it is (its touch scope and press position) and how to send its events.
 */
@SuppressWarnings("unused")
public final class CommentSwipeActionsPatch {

    public enum SwipeAction {
        NONE,
        UPVOTE,
        DOWNVOTE,
        REPLY,
        SAVE,
        SHARE,
        /**
         * Collapses the comment and its replies, or expands it if it is collapsed, like a tap on it.
         */
        TOGGLE_COLLAPSE,
        COLLAPSE,
        OVERFLOW,
        PROFILE
    }

    /**
     * Swipe distance, as a fraction of the comment width, where the first and second action start.
     */
    private static final float[] STAGE_STARTS = {0.18f, 0.45f};
    private static final float MAX_SWIPE_FRACTION = 0.85f;
    private static final int EDGE_EXCLUSION_DP = 24;
    private static final long RELEASE_ANIMATION_MILLIS = 180;
    private static final int MAX_CACHED_COMMENTS = 3000;

    /**
     * Comment rows by the tap callback the row gives its press handler.
     */
    private static final Map<Object, Row> rows = Collections.synchronizedMap(new WeakHashMap<>());

    /**
     * Comments by id and by kind with id, to read the saved state and the author.
     */
    private static final Map<String, WeakReference<Object>> comments = Collections.synchronizedMap(
            new LinkedHashMap<>(256, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, WeakReference<Object>> eldest) {
                    return size() > MAX_CACHED_COMMENTS;
                }
            });

    private static final Map<Class<?>, RowFields> rowFieldsByClass = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Class<?>, Field> sizeFieldByClass = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Class<?>, Method> onEventByClass = Collections.synchronizedMap(new WeakHashMap<>());
    private static volatile Field onFirstTapField;

    /**
     * The comment last pressed, set when Reddit's tap detector sees the finger go down.
     */
    private static volatile Press lastPress;

    private static final class Row {
        final WeakReference<Object> scope;
        /**
         * Weak: the rows map is weak by the row's callbacks, and a strong sink can reach them back,
         * which keeps every comment page ever opened in memory.
         */
        final WeakReference<Object> sink;
        final String commentId;

        Row(Object scope, Object sink, String commentId) {
            this.scope = new WeakReference<>(scope);
            this.sink = new WeakReference<>(sink);
            this.commentId = commentId;
        }
    }

    private static final class Press {
        final Row row;
        final float x;
        final float y;
        final int width;
        final int height;
        final long time;

        Press(Row row, float x, float y, int width, int height) {
            this.row = row;
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
            this.time = SystemClock.uptimeMillis();
        }
    }

    /**
     * The fields of a comment row callback that hold the row's event sink and comment id.
     */
    private static final class RowFields {
        final Field sink;
        final Field commentId;

        RowFields(Field sink, Field commentId) {
            this.sink = sink;
            this.commentId = commentId;
        }
    }

    private static boolean isEnabled() {
        return Settings.COMMENT_SWIPE_ACTIONS.get();
    }

    // region Events, created during patching

    // Each factory has an unused parameter as a scratch register for the generated code,
    // because the compiler leaves these stubs no local registers.

    private static Object createVoteEvent(boolean upvote, String commentId, Object scratch) {
        return null;  // Modified during patching.
    }

    private static Object createReplyEvent(String commentId, Object scratch) {
        return null;  // Modified during patching.
    }

    private static Object createSaveEvent(String commentId, Object scratch) {
        return null;  // Modified during patching.
    }

    private static Object createUnsaveEvent(String commentId, Object scratch) {
        return null;  // Modified during patching.
    }

    private static Object createShareEvent(String commentId, int scratch1, Object scratch2,
                                           Object scratch3) {
        return null;  // Modified during patching.
    }

    private static Object createCollapseEvent(String commentId, Object scratch) {
        return null;  // Modified during patching.
    }

    private static Object createOverflowEvent(String commentId, Object scratch) {
        return null;  // Modified during patching.
    }

    private static Object createToggleCollapseEvent(String commentId, Object scratch) {
        return null;  // Modified during patching.
    }

    // endregion

    // region Injection points

    /**
     * Injection point.
     * <p>
     * Called by MainActivity.onCreate().
     */
    public static void onActivityCreated(Activity activity) {
        try {
            Settings.init(activity);
            currentActivity = new WeakReference<>(activity);
            SettingsActivity.removeOldShortcut(activity);
            if (!lifecycleCallbacksRegistered) {
                lifecycleCallbacksRegistered = true;
                // Comments also show in other activities, such as the full screen media player.
                activity.getApplication().registerActivityLifecycleCallbacks(new ActivityCreatedCallbacks());
            }
            watchTouches(activity);
        } catch (Exception ex) {
            Logger.printException(() -> "onActivityCreated failure", ex);
        }
    }

    private static boolean lifecycleCallbacksRegistered;

    private static volatile WeakReference<Activity> currentActivity = new WeakReference<>(null);

    /**
     * @return The activity that was last created or resumed, or null.
     */
    static Activity currentActivity() {
        return currentActivity.get();
    }

    /**
     * Windows already watched. AppCompat wraps the window callback after it is first watched,
     * so the callback type can not tell.
     */
    private static final java.util.Set<Window> watchedWindows =
            Collections.newSetFromMap(new WeakHashMap<>());

    private static void watchTouches(Activity activity) {
        Window window = activity.getWindow();
        Window.Callback callback = window.getCallback();
        if (callback == null || !watchedWindows.add(window)) return;
        window.setCallback(new SwipeWindowCallback(activity, callback));
    }

    private static final class ActivityCreatedCallbacks implements android.app.Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityCreated(Activity activity, android.os.Bundle savedInstanceState) {
            try {
                watchTouches(activity);
            } catch (Exception ex) {
                Logger.printException(() -> "watchTouches failure", ex);
            }
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityResumed(Activity activity) {
            currentActivity = new WeakReference<>(activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, android.os.Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
        }
    }

    /**
     * Injection point.
     * <p>
     * Called when a comment row's press handler starts, with the row's pointer input scope.
     *
     * @param handler The comment row's PointerInputEventHandler.
     * @param scope   The row's PointerInputScope.
     */
    public static void onCommentGestureScope(Object handler, Object scope) {
        try {
            if (!isEnabled()) return;
            // The callbacks of the row. Some hold the event sink and comment id, and the press
            // callback gets one of the others, so the row is found by any of them.
            java.util.List<Object> callbacks = new java.util.ArrayList<>();
            Row row = null;
            for (Field field : handler.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())
                        || !field.getType().getName().equals("kotlin.jvm.functions.Function0")) continue;
                field.setAccessible(true);
                Object callback = field.get(handler);
                if (callback == null) continue;
                callbacks.add(callback);
                if (row != null) continue;

                RowFields rowFields = getRowFields(callback.getClass());
                if (rowFields.sink == null || rowFields.commentId == null) continue;
                Object sink = rowFields.sink.get(callback);
                Object commentId = rowFields.commentId.get(callback);
                if (sink != null && commentId instanceof String) {
                    row = new Row(scope, sink, (String) commentId);
                }
            }
            if (row == null) return;
            for (Object callback : callbacks) rows.put(callback, row);
        } catch (Exception ex) {
            Logger.printException(() -> "onCommentGestureScope failure", ex);
        }
    }

    /**
     * Injection point.
     * <p>
     * Called when the finger goes down on a comment.
     *
     * @param pressLambda The press callback of the comment row.
     * @param offset      Packed Compose Offset of the press, in the row.
     */
    public static void onCommentPress(Object pressLambda, long offset) {
        try {
            if (!isEnabled()) return;

            Field field = onFirstTapField;
            if (field == null) {
                field = pressLambda.getClass().getDeclaredField("$onFirstTapComment");
                field.setAccessible(true);
                onFirstTapField = field;
            }
            Row row = rows.get(field.get(pressLambda));
            if (row == null) return;

            Object scope = row.scope.get();
            if (scope == null) return;
            long size = readSize(scope);
            // Packed IntSize: width in the high bits, height in the low bits.
            int width = (int) (size >> 32);
            int height = (int) size;
            if (width <= 0 || height <= 0) return;

            // Packed Offset: x in the high bits, y in the low bits, as float bits.
            float x = Float.intBitsToFloat((int) (offset >> 32));
            float y = Float.intBitsToFloat((int) offset);
            lastPress = new Press(row, x, y, width, height);
        } catch (Exception ex) {
            Logger.printException(() -> "onCommentPress failure", ex);
        }
    }

    /**
     * Injection point.
     * <p>
     * Called when Reddit creates a comment.
     */
    public static void onCommentCreated(Object comment) {
        try {
            WeakReference<Object> reference = new WeakReference<>(comment);
            String id = CommentAccess.getId(comment);
            if (id != null) comments.put(id, reference);
            String kindWithId = CommentAccess.getKindWithId(comment);
            if (kindWithId != null) comments.put(kindWithId, reference);
        } catch (Exception ex) {
            Logger.printException(() -> "onCommentCreated failure", ex);
        }
    }

    // endregion

    // region Reflection

    private static RowFields getRowFields(Class<?> callbackClass) {
        RowFields cached = rowFieldsByClass.get(callbackClass);
        if (cached != null) return cached;

        Field sink = null;
        Field commentId = null;
        for (Field field : callbackClass.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            Class<?> type = field.getType();
            if (type == String.class) {
                commentId = field;
            } else if (!type.isPrimitive() && findOnEventMethod(type) != null) {
                sink = field;
            }
        }
        if (sink != null) sink.setAccessible(true);
        if (commentId != null) commentId.setAccessible(true);

        RowFields rowFields = new RowFields(sink, commentId);
        rowFieldsByClass.put(callbackClass, rowFields);
        return rowFields;
    }

    private static Method findOnEventMethod(Class<?> type) {
        if (onEventByClass.containsKey(type)) return onEventByClass.get(type);
        Method found = null;
        for (Method method : type.getMethods()) {
            if (method.getName().equals("onEvent") && method.getParameterTypes().length == 1) {
                found = method;
                break;
            }
        }
        onEventByClass.put(type, found);
        return found;
    }

    /**
     * @return The size of a pointer input scope. The Compose node keeps it in its only long field.
     */
    private static long readSize(Object scope) throws IllegalAccessException {
        Class<?> scopeClass = scope.getClass();
        Field field = sizeFieldByClass.get(scopeClass);
        if (field == null) {
            for (Class<?> c = scopeClass; c != null && field == null; c = c.getSuperclass()) {
                for (Field candidate : c.getDeclaredFields()) {
                    if (candidate.getType() == long.class && !Modifier.isStatic(candidate.getModifiers())) {
                        if (field != null) {
                            throw new IllegalStateException("More than one long field in " + scopeClass);
                        }
                        field = candidate;
                    }
                }
            }
            if (field == null) throw new IllegalStateException("No size field in " + scopeClass);
            field.setAccessible(true);
            sizeFieldByClass.put(scopeClass, field);
        }
        return field.getLong(scope);
    }

    // endregion

    // region Actions

    /**
     * @param leftSwipe If the comment is swiped from right to left.
     * @return The actions of the direction that are not None: none, one or two. One action is done at
     * any swipe distance, so a long swipe never ends on nothing.
     */
    private static Enum<?>[] commentActions(boolean leftSwipe) {
        return actions((leftSwipe ? Settings.LEFT_FIRST : Settings.RIGHT_FIRST).get(),
                (leftSwipe ? Settings.LEFT_SECOND : Settings.RIGHT_SECOND).get());
    }

    /**
     * @see #commentActions(boolean)
     */
    private static Enum<?>[] postActions(boolean leftSwipe) {
        return actions((leftSwipe ? Settings.POST_LEFT_FIRST : Settings.POST_RIGHT_FIRST).get(),
                (leftSwipe ? Settings.POST_LEFT_SECOND : Settings.POST_RIGHT_SECOND).get());
    }

    private static Enum<?>[] actions(Enum<?> first, Enum<?> second) {
        if (isNone(first) && isNone(second)) return new Enum<?>[0];
        if (isNone(first)) return new Enum<?>[]{second};
        if (isNone(second)) return new Enum<?>[]{first};
        return new Enum<?>[]{first, second};
    }

    static boolean isNone(Enum<?> action) {
        return action == null || action.name().equals("NONE");
    }

    private static void perform(Activity activity, Row row, SwipeAction action) {
        try {
            String id = row.commentId;
            Object event;
            switch (action) {
                case UPVOTE:
                    event = createVoteEvent(true, id, null);
                    break;
                case DOWNVOTE:
                    event = createVoteEvent(false, id, null);
                    break;
                case REPLY:
                    event = createReplyEvent(id, null);
                    break;
                case SAVE:
                    Object comment = getComment(id);
                    event = comment != null && CommentAccess.getSaved(comment)
                            ? createUnsaveEvent(id, null)
                            : createSaveEvent(id, null);
                    break;
                case SHARE:
                    event = createShareEvent(id, 0, null, null);
                    break;
                case COLLAPSE:
                    event = createCollapseEvent(id, null);
                    break;
                case OVERFLOW:
                    event = createOverflowEvent(id, null);
                    break;
                case TOGGLE_COLLAPSE:
                    event = createToggleCollapseEvent(id, null);
                    break;
                case PROFILE:
                    openProfile(activity, id);
                    return;
                default:
                    return;
            }
            if (event == null) return;

            Object sink = row.sink.get();
            if (sink == null) return;
            Method onEvent = findOnEventMethod(sink.getClass());
            if (onEvent == null) throw new IllegalStateException("No onEvent in " + sink.getClass());
            onEvent.invoke(sink, event);
            Logger.printDebug(() -> "Swipe action " + action + " on " + id);
        } catch (Exception ex) {
            Logger.printException(() -> "Swipe action failure: " + action, ex);
        }
    }

    private static Object getComment(String id) {
        WeakReference<Object> reference = comments.get(id);
        if (reference == null && id.startsWith("t1_")) reference = comments.get(id.substring(3));
        return reference == null ? null : reference.get();
    }

    private static void openProfile(Activity activity, String commentId) {
        Object comment = getComment(commentId);
        String author = comment == null ? null : CommentAccess.getAuthor(comment);
        if (author == null || author.isEmpty() || author.equals("[deleted]")) return;

        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.reddit.com/user/" + author));
        intent.setPackage(activity.getPackageName());
        activity.startActivity(intent);
    }

    /**
     * Background color of an action of a comment or a post, by its name.
     */
    private static int actionColor(Enum<?> action) {
        switch (action == null ? "NONE" : action.name()) {
            case "UPVOTE":
                return 0xFFFF4500;
            case "DOWNVOTE":
                return 0xFF7193FF;
            case "REPLY":
            case "OPEN_COMMENTS":
                return 0xFF46D160;
            case "SAVE":
                return 0xFFFFB000;
            case "SHARE":
            case "SUBREDDIT":
                return 0xFF0079D3;
            case "PROFILE":
                return 0xFF9C6ADE;
            case "HIDE":
                return 0xFFD93A00;
            case "TOGGLE_COLLAPSE":
            case "COLLAPSE":
            case "OVERFLOW":
                return 0xFF878A8C;
            default:
                return 0xFF5C5C5C;
        }
    }

    // endregion

    /**
     * Watches the window's touch events and handles a sideways swipe on a comment.
     */
    private static final class SwipeWindowCallback extends WindowCallbackWrapper {
        private static final int IDLE = 0;
        private static final int SWIPING = 1;
        private static final int IGNORED = 2;

        private final Activity activity;
        private final int touchSlop;
        private final int edgeExclusion;
        private final Handler handler = new Handler(Looper.getMainLooper());

        private int state = IDLE;
        private float downX;
        private float downY;
        private long downTime;
        private Press press;
        private PostSwipe.Target post;
        private SwipeOverlay overlay;

        SwipeWindowCallback(Activity activity, Window.Callback wrapped) {
            super(wrapped);
            this.activity = activity;
            this.touchSlop = ViewConfiguration.get(activity).getScaledTouchSlop();
            this.edgeExclusion = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP,
                    EDGE_EXCLUSION_DP, activity.getResources().getDisplayMetrics());
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            try {
                if (handleTouch(event)) return true;
            } catch (Throwable ex) {
                Logger.printException(() -> "Swipe touch failure", ex);
                state = IGNORED;
                removeOverlay();
            }
            return super.dispatchTouchEvent(event);
        }

        private boolean handleTouch(MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN: {
                    removeOverlay();
                    lastPress = null;
                    press = null;
                    post = null;
                    downX = event.getX();
                    downY = event.getY();
                    downTime = SystemClock.uptimeMillis();
                    View decor = activity.getWindow().getDecorView();
                    boolean atEdge = downX < edgeExclusion || downX > decor.getWidth() - edgeExclusion;
                    boolean enabled = isEnabled() || Settings.POST_SWIPE_ACTIONS.get();
                    // Nothing behind an open side menu, sheet, menu, modal or dialog is swiped.
                    boolean covered = enabled && !atEdge && (!activity.hasWindowFocus()
                            || PostSwipe.isOverlayOpen(decor) || PostSwipe.isDrawerOpen(activity));
                    state = !enabled || atEdge || covered ? IGNORED : IDLE;
                    return false;
                }
                case MotionEvent.ACTION_POINTER_DOWN:
                    if (state == SWIPING) return true;
                    state = IGNORED;
                    return false;

                case MotionEvent.ACTION_MOVE: {
                    if (state == IGNORED) return false;
                    float dx = event.getX() - downX;
                    float dy = event.getY() - downY;
                    if (state == SWIPING) {
                        if (overlay != null) overlay.update(dx);
                        return true;
                    }
                    if (Math.abs(dy) > touchSlop && Math.abs(dy) > Math.abs(dx)) {
                        state = IGNORED;
                        return false;
                    }
                    if (Math.abs(dx) < touchSlop * 1.5f || Math.abs(dx) < Math.abs(dy) * 2) return false;

                    boolean rightToLeft = dx < 0;
                    Press current = lastPress;
                    if (current != null && current.time >= downTime && isEnabled()) {
                        // A comment: its row told where the finger went down.
                        if (commentActions(rightToLeft).length == 0) {
                            state = IGNORED;
                            return false;
                        }
                        int left = Math.round(downX - current.x);
                        int top = Math.round(downY - current.y);
                        // The part of the comment under a bar of the screen is not swiped.
                        Rect visible = PostSwipe.withoutBars(
                                new Rect(left, top, left + current.width, top + current.height), downY,
                                activity.getWindow().getDecorView());
                        if (visible == null) {
                            state = IGNORED;
                            return false;
                        }
                        press = current;
                        startSwipe(event, visible, commentActions(true), commentActions(false));
                    } else {
                        // A post: the card under the finger.
                        PostSwipe.Target target = Settings.POST_SWIPE_ACTIONS.get()
                                ? PostSwipe.findTarget(activity, downX, downY) : null;
                        // Only the part on screen slides: a post card can reach past the window.
                        View decor = activity.getWindow().getDecorView();
                        Rect visible = target == null ? null : new Rect(target.bounds);
                        if (visible == null || !visible.intersect(0, 0, decor.getWidth(), decor.getHeight())
                                || postActions(rightToLeft).length == 0) {
                            state = IGNORED;
                            return false;
                        }
                        post = target;
                        startSwipe(event, visible, postActions(true), postActions(false));
                    }
                    if (overlay != null) overlay.update(dx);
                    return true;
                }
                case MotionEvent.ACTION_UP:
                    if (state != SWIPING) return false;
                    finishSwipe(true);
                    return true;

                case MotionEvent.ACTION_CANCEL:
                    if (state != SWIPING) return false;
                    finishSwipe(false);
                    return true;

                default:
                    return state == SWIPING;
            }
        }

        private void startSwipe(MotionEvent event, Rect bounds, Enum<?>[] leftActions, Enum<?>[] rightActions) {
            state = SWIPING;

            // The comment list, the post pager and the tap detector stop following this touch.
            MotionEvent cancel = MotionEvent.obtain(event);
            cancel.setAction(MotionEvent.ACTION_CANCEL);
            super.dispatchTouchEvent(cancel);
            cancel.recycle();

            overlay = new SwipeOverlay(activity, bounds, leftActions, rightActions);
        }

        private void finishSwipe(boolean perform) {
            SwipeOverlay finished = overlay;
            Press finishedPress = press;
            PostSwipe.Target finishedPost = post;
            overlay = null;
            press = null;
            post = null;
            state = IGNORED;
            if (finished == null) return;

            Enum<?> action = finished.action();
            finished.release(() -> {
                if (!perform || isNone(action)) return;
                if (finishedPress != null) {
                    perform(activity, finishedPress.row, (SwipeAction) action);
                } else if (finishedPost != null) {
                    PostSwipe.perform(activity, finishedPost, (PostSwipe.PostAction) action);
                }
            });
        }

        private void removeOverlay() {
            if (overlay != null) {
                overlay.remove();
                overlay = null;
            }
        }
    }

    /**
     * A copy of the swiped comment that slides over it, with the stage's color and label behind.
     */
    private static final class SwipeOverlay {
        private final Activity activity;
        /**
         * The actions of each swipe direction, one per stage: none, one or two.
         */
        private final Enum<?>[] leftActions;
        private final Enum<?>[] rightActions;
        /**
         * The direction the comment is swiped now. It changes when the finger crosses the start.
         */
        private boolean rightToLeft;
        private Enum<?>[] actions;
        private final int width;
        private final FrameLayout container;
        private final ImageView copy;
        private final TextView label;
        int stage;

        SwipeOverlay(Activity activity, Rect bounds, Enum<?>[] leftActions, Enum<?>[] rightActions) {
            this.activity = activity;
            this.leftActions = leftActions;
            this.rightActions = rightActions;
            this.rightToLeft = leftActions.length > 0;
            this.actions = rightToLeft ? leftActions : rightActions;
            this.width = bounds.width();

            container = new FrameLayout(activity);
            container.setClipChildren(true);
            container.setBackgroundColor(Color.TRANSPARENT);

            int padding = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 24,
                    activity.getResources().getDisplayMetrics());
            label = new TextView(activity);
            label.setTextColor(Color.WHITE);
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
            label.setPadding(padding, 0, padding, 0);
            setLabelSide();
            container.addView(label, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            copy = new ImageView(activity);
            copy.setScaleType(ImageView.ScaleType.FIT_XY);
            container.addView(copy, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            // Hidden until the copy of the comment is ready, so the real comment does not jump.
            container.setVisibility(View.INVISIBLE);
            ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(bounds.width(), bounds.height());
            container.setX(bounds.left);
            container.setY(bounds.top);
            decor.addView(container, params);

            Bitmap bitmap = Bitmap.createBitmap(bounds.width(), bounds.height(), Bitmap.Config.ARGB_8888);
            PixelCopy.request(activity.getWindow(), bounds, bitmap, result -> {
                if (result == PixelCopy.SUCCESS && container.getParent() != null) {
                    copy.setImageBitmap(bitmap);
                    container.setVisibility(View.VISIBLE);
                }
            }, new Handler(Looper.getMainLooper()));

            setStage(0);
        }

        void update(float dx) {
            // The finger can cross the start of the swipe and go on to the other direction.
            boolean directionChanged = false;
            if (dx != 0 && (dx < 0) != rightToLeft) {
                rightToLeft = dx < 0;
                actions = rightToLeft ? leftActions : rightActions;
                setLabelSide();
                directionChanged = true;
            }

            // A direction with no actions does not move: the comment stays at its start.
            float max = width * MAX_SWIPE_FRACTION;
            float distance = actions.length == 0 ? 0 : Math.min(Math.abs(dx), max);
            copy.setTranslationX(rightToLeft ? -distance : distance);

            int newStage = 0;
            for (int i = 0; i < actions.length; i++) {
                if (distance >= width * STAGE_STARTS[i]) newStage = i + 1;
            }
            if (newStage != stage || directionChanged) {
                boolean vibrate = newStage != stage || newStage > 0;
                setStage(newStage);
                if (vibrate && Settings.COMMENT_SWIPE_VIBRATE.get()) {
                    container.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK,
                            HapticFeedbackConstants.FLAG_IGNORE_GLOBAL_SETTING);
                }
            }
        }

        /**
         * The action label is on the side the swiped comment uncovers.
         */
        private void setLabelSide() {
            label.setGravity(Gravity.CENTER_VERTICAL | (rightToLeft ? Gravity.END : Gravity.START));
        }

        /**
         * @return The action of the current stage, or None before the first stage.
         */
        Enum<?> action() {
            return stage > 0 ? actions[stage - 1] : null;
        }

        private void setStage(int newStage) {
            stage = newStage;
            Enum<?> action = action();
            boolean active = !isNone(action);
            container.setBackgroundColor(actionColor(action));
            label.setText(active ? Labels.action(action) : "");
        }

        void release(Runnable onReleased) {
            float start = copy.getTranslationX();
            ValueAnimator animator = ValueAnimator.ofFloat(start, 0f);
            animator.setDuration(RELEASE_ANIMATION_MILLIS);
            animator.addUpdateListener(a -> copy.setTranslationX((float) a.getAnimatedValue()));
            animator.addListener(new android.animation.AnimatorListenerAdapter() {
                @Override
                public void onAnimationEnd(android.animation.Animator animation) {
                    remove();
                }
            });
            // The action runs at once, so the comment shows its new state when the copy is removed.
            onReleased.run();
            animator.start();
        }

        void remove() {
            ViewGroup parent = (ViewGroup) container.getParent();
            if (parent != null) parent.removeView(container);
        }
    }
}
