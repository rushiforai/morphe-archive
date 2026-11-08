package app.morphe.extension.boost;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.SeekBar;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

/** Framework-only gestures: the original button listeners perform the actual actions. */
public final class CommentSwipeActions {
    public static final int NONE = 0, UPVOTE = 1, DOWNVOTE = 2, REPLY = 3, SAVE = 4, HIDE = 5;
    private static final WeakHashMap<View, WeakReference<Object>> HOLDERS = new WeakHashMap<>();
    // Sessions hold weak references to views/holders so they cannot retain the Activity key.
    private static final WeakHashMap<Activity, Session> SESSIONS = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> POSTS = new WeakHashMap<>();
    private static boolean forwardingCancel;
    private CommentSwipeActions() { }

    /** Bind entry is safe even if another source wraps Boost's original binder. */
    public static boolean postSwipesEnabled() { return false; }
    public static void bindPost(Object holder) {
        MediaPreviewTweaks.bindPost(holder);
        MaterialYouTweaks.bindPost(holder);
        if (!postSwipesEnabled()) return;
        Object value = CommentsChromeTweaks.field(holder, "a");
        if (value instanceof View) POSTS.put((View)value, true);
        bind(holder);
    }
    public static void onActivityDestroy(Object value) {
        Session session = SESSIONS.remove(value);
        if (session != null) session.finish();
    }
    public static void bind(Object holder) {
        Object value = CommentsChromeTweaks.field(holder, "a");
        if (!(value instanceof View)) return;
        View row = (View) value;
        HOLDERS.put(row, new WeakReference<>(holder));
        Activity activity = CommentsChromeTweaks.activity(row.getContext());
        Session active = SESSIONS.get(activity);
        if (active != null && active.row.get() == row) active.abort();
    }

    public static void onPause(Object fragment) {
        Object recycler = CommentsChromeTweaks.field(fragment, "mRecyclerView");
        if (!(recycler instanceof View)) return;
        Activity activity = CommentsChromeTweaks.activity(((View) recycler).getContext());
        Session session = SESSIONS.remove(activity);
        if (session != null) session.finish();
    }

    /** True consumes only a recognized horizontal drag and its remaining pointer sequence. */
    public static boolean onTouch(Object instance, MotionEvent event) {
        if (!(instance instanceof Activity) || forwardingCancel) return false;
        Activity activity = (Activity) instance;
        try {
            int action = event.getActionMasked();
            Session session = SESSIONS.get(activity);
            if (action == MotionEvent.ACTION_DOWN) {
                if (session != null) session.finish();
                SESSIONS.remove(activity);
                if (event.getPointerCount() != 1 || !awayFromEdges(activity, event)) return false;
                Session next = findSession(activity, event);
                if (next != null) SESSIONS.put(activity, next);
                return false; // Give the original view its DOWN for normal clicks/long presses.
            }
            if (session == null) return false;
            if (action == MotionEvent.ACTION_POINTER_DOWN || event.getPointerCount() > 1) {
                boolean consume = session.captured;
                session.abort();
                if (!consume) SESSIONS.remove(activity);
                return consume;
            }
            if (action == MotionEvent.ACTION_CANCEL) {
                boolean consume = session.captured;
                session.finish();
                SESSIONS.remove(activity);
                return consume;
            }
            View row = session.row.get();
            Object holder = session.holder.get();
            if (row == null || holder == null || !row.isAttachedToWindow() ||
                    CommentsChromeTweaks.field(holder, session.modelField) != session.model.get()) session.abort();
            if (action == MotionEvent.ACTION_MOVE && !session.aborted) {
                float dx = event.getRawX() - session.downX;
                float dy = event.getRawY() - session.downY;
                if (!session.captured) {
                    // Yield permanently once scrolling or a long press has begun.
                    if ((Math.abs(dy) > session.slop && Math.abs(dy) * 1.8f >= Math.abs(dx)) ||
                            event.getEventTime() - session.downTime >= ViewConfiguration.getLongPressTimeout()) {
                        session.finish();
                        SESSIONS.remove(activity);
                        return false;
                    }
                    // Rightward drags keep their original behaviour. All actions live on a left swipe.
                    if (dx > session.slop && dx > Math.abs(dy) * 1.8f) {
                        session.finish();
                        SESSIONS.remove(activity);
                        return false;
                    }
                    session.disallow(true);
                    if (Math.abs(dx) <= session.slop * 2 || Math.abs(dx) <= Math.abs(dy) * 1.8f)
                        return false;
                    session.captured = true;
                    // Cancel the existing child stream, so UP cannot also collapse/click the comment.
                    MotionEvent cancel = MotionEvent.obtain(event);
                    cancel.setAction(MotionEvent.ACTION_CANCEL);
                    forwardingCancel = true;
                    try { activity.dispatchTouchEvent(cancel); }
                    finally { forwardingCancel = false; cancel.recycle(); }
                    session.disallow(true);
                    if (session.aborted) return true;
                    session.startHint();
                }
                session.preview(dx);
                return true;
            }
            if (action == MotionEvent.ACTION_UP) {
                boolean consume = session.captured;
                int selected = consume && !session.aborted
                        ? session.choose(event.getRawX() - session.downX) : NONE;
                // Keep holder/model identity stable, then release all touch/visual state before dispatching.
                View button = session.button(selected);
                boolean sameModel = holder != null && session.model.get() != null &&
                        CommentsChromeTweaks.field(holder, session.modelField) == session.model.get();
                session.finish();
                SESSIONS.remove(activity);
                if (sameModel && selected != NONE && button != null && button.isEnabled() &&
                        (session.post || button.getVisibility() == View.VISIBLE))
                    button.performClick();
                return consume;
            }
            return session.captured;
        } catch (RuntimeException | LinkageError error) {
            Session session = SESSIONS.remove(activity);
            boolean consume = session != null && session.captured;
            if (session != null) session.finish();
            return consume;
        }
    }
    /** Threshold kernel also exercised by the independent gesture regression tests. */
    public static int chooseAction(float dx, float shortDistance, float mediumDistance, float longDistance) {
        float distance = -dx;
        if (distance < shortDistance) return NONE;
        if (distance >= longDistance) return REPLY;
        return distance >= mediumDistance ? DOWNVOTE : UPVOTE;
    }
    private static boolean awayFromEdges(Activity activity, MotionEvent event) {
        View decor = activity.getWindow().getDecorView();
        float density = decor.getResources().getDisplayMetrics().density;
        int left = Math.round(24 * density), right = left;
        WindowInsets insets = decor.getRootWindowInsets();
        if (insets != null && Build.VERSION.SDK_INT >= 29) {
            left = Math.max(left, insets.getSystemGestureInsets().left);
            right = Math.max(right, insets.getSystemGestureInsets().right);
        }
        int[] origin = new int[2];
        decor.getLocationOnScreen(origin);
        float x = event.getRawX() - origin[0];
        return x > left && x < decor.getWidth() - right;
    }
    private static Session findSession(Activity activity, MotionEvent event) {
        Rect hit = new Rect();
        for (Map.Entry<View, WeakReference<Object>> entry : HOLDERS.entrySet()) {
            View row = entry.getKey();
            Object holder = entry.getValue().get();
            if (row == null || holder == null || !row.isShown() || !row.isAttachedToWindow() ||
                    CommentsChromeTweaks.activity(row.getContext()) != activity ||
                    !row.getGlobalVisibleRect(hit) || !hit.contains((int) event.getRawX(), (int) event.getRawY()))
                continue;
            if (protectedChild(row, event.getRawX(), event.getRawY(), hit)) return null;
            Object model = CommentsChromeTweaks.field(holder, POSTS.containsKey(row) ? "b0" : "c0");
            if (model == null || !SurfaceSettingsActivity.enabled(activity,POSTS.containsKey(row) ? "post_swipes":"comment_swipes")) return null;
            Session session = new Session(row, holder, model, event);
            // Fully collapsed layouts omit the original action buttons: retain their tap-to-expand path.
            if (session.button(UPVOTE) == null || session.button(DOWNVOTE) == null || (!session.post && session.button(REPLY) == null))
                return null;
            return session;
        }
        return null;
    }
    private static boolean protectedChild(View view, float x, float y, Rect hit) {
        if (view.getVisibility() != View.VISIBLE || !view.getGlobalVisibleRect(hit) ||
                !hit.contains((int) x, (int) y)) return false;
        if (view instanceof Button || view instanceof EditText || view instanceof ImageView ||
                view instanceof SeekBar || view instanceof WebView || view instanceof HorizontalScrollView)
            return true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = group.getChildCount() - 1; i >= 0; i--)
                if (protectedChild(group.getChildAt(i), x, y, hit)) return true;
        }
        return false;
    }
    private static final class Session {
        final boolean post;
        final String modelField;
        final WeakReference<View> row;
        final WeakReference<Object> holder, model;
        final float downX, downY, slop, shortDistance, mediumDistance, longDistance, hideDistance, baseTranslation;
        final long downTime;
        WeakReference<ViewGroup> hintParent;
        Hint hint;
        boolean captured, aborted;
        int previewAction;
        Session(View row, Object holder, Object model, MotionEvent down) {
            post = POSTS.containsKey(row);
            modelField = post ? "b0" : "c0";
            this.row = new WeakReference<>(row);
            this.holder = new WeakReference<>(holder);
            this.model = new WeakReference<>(model);
            downX = down.getRawX(); downY = down.getRawY(); downTime = down.getEventTime();
            float density = row.getResources().getDisplayMetrics().density;
            slop = ViewConfiguration.get(row.getContext()).getScaledTouchSlop();
            float width=row.getRootView().getWidth();if(width<=0)width=row.getResources().getDisplayMetrics().widthPixels;
            float budget=Math.max(1,width)*SurfaceSettingsActivity.number(row.getContext(),"swipe_travel",90,50,95)/100f;
            shortDistance=Math.min(Math.max(48*density,2*slop),budget*.25f);
            float zone=(budget-shortDistance)/(post ? 4:3);
            mediumDistance=shortDistance+zone;
            longDistance=shortDistance+2*zone;
            hideDistance=shortDistance+3*zone;
            baseTranslation = row.getTranslationX();
        }
        int choose(float dx) {
            if (post && -dx >= longDistance) return -dx >= hideDistance ? HIDE : SAVE;
            return chooseAction(dx, shortDistance, mediumDistance, longDistance);
        }
        View button(int action) {
            Object owner = holder.get();
            String field = action == UPVOTE ? "voteUpButton" : action == DOWNVOTE ? "voteDownButton" :
                    action == REPLY ? "commentReplyButton" : action == SAVE ? "saveButton" : action == HIDE ? "hideButton" : null;
            Object value = field == null ? null : CommentsChromeTweaks.field(owner, field);
            return value instanceof View ? (View) value : null;
        }
        void disallow(boolean value) {
            View view = row.get();
            ViewParent parent = view == null ? null : view.getParent();
            if (parent != null) parent.requestDisallowInterceptTouchEvent(value);
        }
        void startHint() {
            View view = row.get();
            if (view == null || !(view.getParent() instanceof ViewGroup)) return;
            ViewGroup parent = (ViewGroup) view.getParent();
            hint = new Hint(view.getContext());
            int offset = Math.round(view.getTranslationY());
            hint.setBounds(view.getLeft(), view.getTop() + offset, view.getRight(), view.getBottom() + offset);
            hintParent = new WeakReference<>(parent);
            parent.getOverlay().add(hint);
        }
        void preview(float dx) {
            View view = row.get();
            if (view == null) return;
            // Keep the row under the finger; action thresholds are independent of visual travel.
            float travel = Math.min(0, dx);
            view.setTranslationX(baseTranslation + travel);
            int action = choose(dx);
            if (action != NONE && action != previewAction)
                if(SurfaceSettingsActivity.enabled(view.getContext(),"swipe_haptics"))view.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            if (hint != null) {
                if (action != previewAction) {
                    hint.icon = null;
                    View button = button(action);
                    Drawable source = button instanceof ImageView ? ((ImageView) button).getDrawable() : null;
                    Drawable.ConstantState state = source == null ? null : source.getConstantState();
                    if (state != null) {
                        hint.icon = state.newDrawable(view.getResources()).mutate();
                        hint.icon.setTint(hint.foreground(action));
                    }
                }
                hint.travel = travel;
                hint.action = action;
                hint.invalidateSelf();
            }
            previewAction = action;
        }
        void abort() { aborted = true; resetVisuals(); disallow(false); }
        void finish() { resetVisuals(); disallow(false); }
        void resetVisuals() {
            View view = row.get();
            if (view != null && captured) view.setTranslationX(baseTranslation);
            ViewGroup parent = hintParent == null ? null : hintParent.get();
            if (parent != null && hint != null) parent.getOverlay().remove(hint);
            hint = null;
        }
    }
    private static final class Hint extends Drawable {
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Path path = new Path();
        final float density;
        float travel;
        int action;
        Drawable icon;
        final android.content.Context context;
        Hint(android.content.Context context) { this.context=context;this.density = context.getResources().getDisplayMetrics().density; }
        int background(int value) {
            if (!CommentsChromeTweaks.materialYouEnabled()) return value == UPVOTE ? 0xFFE76525 : value == DOWNVOTE ? 0xFF4776C5 :
                value == REPLY ? 0xFF197D72 : value == SAVE ? 0xFF7656A6 : value == HIDE ? 0xFF9A3940 : 0xFF656565;
            return MaterialYouTweaks.color(context,value==UPVOTE ? "colorPrimary":value==DOWNVOTE ? "colorTertiary":value==REPLY ? "colorSecondary":value==SAVE ? "colorPrimaryContainer":value==HIDE ? "colorErrorContainer":"colorSurfaceContainerHigh",android.R.attr.colorAccent);
        }
        int foreground(int value) {
            if (!CommentsChromeTweaks.materialYouEnabled()) return Color.WHITE;
            return MaterialYouTweaks.color(context,value==UPVOTE ? "colorOnPrimary":value==DOWNVOTE ? "colorOnTertiary":value==REPLY ? "colorOnSecondary":value==SAVE ? "colorOnPrimaryContainer":value==HIDE ? "colorOnErrorContainer":"colorOnSurface",android.R.attr.textColorPrimary);
        }
        @Override public void draw(Canvas canvas) {
            if (travel >= 0) return;
            Rect bounds = getBounds();
            float left = bounds.right + travel, right = bounds.right;
            canvas.save();
            canvas.clipRect(left, bounds.top, right, bounds.bottom);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(background(action));
            canvas.drawRect(left, bounds.top, right, bounds.bottom, paint);
            if (action != NONE) {
                float size = Math.min(24 * density, Math.max(0, right - left - 8 * density));
                float x = (left + right) / 2;
                float y = bounds.exactCenterY();
                if (icon != null) {
                    icon.setBounds(Math.round(x-size/2), Math.round(y-size/2), Math.round(x+size/2), Math.round(y+size/2));
                    icon.draw(canvas);
                } else {
                    // Framework fallback for a button whose drawable cannot be safely cloned.
                    canvas.save();
                    canvas.translate(x-size/2, y-size/2);
                    canvas.scale(size/24f, size/24f);
                    path.reset();
                    if (action == SAVE) {
                        path.moveTo(6,3); path.lineTo(18,3); path.lineTo(18,21);
                        path.lineTo(12,16); path.lineTo(6,21); path.close();
                    } else if (action == HIDE) {
                        path.moveTo(4,6); path.lineTo(6,4); path.lineTo(20,18); path.lineTo(18,20); path.close();
                        path.moveTo(18,4); path.lineTo(20,6); path.lineTo(6,20); path.lineTo(4,18); path.close();
                    } else if (action == REPLY) {
                        path.moveTo(10, 5); path.lineTo(3, 12); path.lineTo(10, 19);
                        path.lineTo(10, 15); path.cubicTo(15, 15, 18, 16, 21, 20);
                        path.cubicTo(20, 13, 16, 9, 10, 9); path.close();
                    } else {
                        if (action == DOWNVOTE) canvas.rotate(180, 12, 12);
                        path.moveTo(12, 3); path.lineTo(3, 12); path.lineTo(8, 12);
                        path.lineTo(8, 21); path.lineTo(16, 21); path.lineTo(16, 12);
                        path.lineTo(21, 12); path.close();
                    }
                    paint.setColor(foreground(action));
                    canvas.drawPath(path, paint);
                    canvas.restore();
                }
            }
            canvas.restore();
        }
        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
