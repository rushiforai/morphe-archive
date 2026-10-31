package app.ahmedyarub.extension.instagram;

import android.app.Activity;
import android.app.Application;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;

/**
 * Interested and Not interested buttons above the Reels side bar. A tap opens the reel's ⋯ menu
 * and taps the option of the same name in it, so the app handles it as if picked from the menu.
 * Should the menu not list the option, the options helper the menu bound to the reel runs it.
 *
 * The side bar is drawn by Litho, which does not take views of its own, so the buttons are a
 * column of their own, kept above the like button of the reel on screen as it scrolls. It starts
 * over the activity's content; when a bottom sheet such as the ⋯ menu is attached in the same
 * window, the column moves to where the sheet's branch and the side bar's branch meet, between
 * the two, so it draws over the reels like their own buttons and under the sheet like them.
 */
@SuppressWarnings("unused")
public final class ReelsButtons {
    private static final String MORE_TAG = "clips_ufi_more_button_component";
    private static final String LIKE_TAG = "clips_ufi_like_button_component";
    /** The options the Reels menu's Interested and Not interested rows run. */
    private static final String INTERESTED = "SEE_MORE";
    private static final String NOT_INTERESTED = "SEE_FEWER";
    private static final String OPTION_CLASS = "com.instagram.feed.media.mediaoption.MediaOption$Option";
    private static final String COLUMN_TAG = "morphe_reels_buttons";
    private static final long PENDING_TIMEOUT_MS = 4000;

    private static volatile WeakReference<LinearLayout> currentColumn = new WeakReference<>(null);
    private static volatile WeakReference<View> currentLike = new WeakReference<>(null);

    private static volatile WeakReference<Object> menuHelper = new WeakReference<>(null);
    private static volatile String interestedLabel;
    private static volatile String notInterestedLabel;
    private static final long LABEL_WAIT_MS = 1500;
    private static volatile String pendingAction;
    private static volatile long pendingSince;
    private static volatile long menuBuiltAt;

    private ReelsButtons() {
    }

    /** The options helper's method running an option. Rewritten by the patch. */
    private static String optionHandler() {
        return "optionHandler";
    }

    /** The integer tag the ⋯ button may carry instead of its name. Rewritten by the patch. */
    private static int moreTagId() {
        return 0;
    }

    // region Buttons

    /** Injection point: the application's onCreate. */
    public static void install(Application application) {
        try {
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity activity) {
                    attach(activity);
                }

                @Override
                public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                }

                @Override
                public void onActivityStarted(Activity activity) {
                }

                @Override
                public void onActivityPaused(Activity activity) {
                }

                @Override
                public void onActivityStopped(Activity activity) {
                }

                @Override
                public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                }
            });
        } catch (Throwable ex) {
            Logger.printException(() -> "ReelsButtons install failed", ex);
        }
    }

    /** One side bar: the reel's ⋯ and like buttons. */
    private static final class SideBar {
        final WeakReference<View> more;
        final WeakReference<View> like;

        SideBar(View more, View like) {
            this.more = new WeakReference<>(more);
            this.like = new WeakReference<>(like);
        }
    }

    private static void attach(Activity activity) {
        try {
            View decor = activity.getWindow().getDecorView();
            ViewGroup content = activity.findViewById(android.R.id.content);
            if (content == null || decor.findViewWithTag(COLUMN_TAG) != null) return;

            List<SideBar> sideBars = new ArrayList<>();
            SideBar[] shown = new SideBar[1];
            LinearLayout column = new LinearLayout(activity);
            column.setTag(COLUMN_TAG);
            column.setOrientation(LinearLayout.VERTICAL);
            column.setVisibility(View.GONE);
            column.addView(button(activity, "instagram_thumb_up_outline_24", "Interested", () -> request(INTERESTED, shown[0])));
            column.addView(button(activity, "instagram_thumb_down_outline_24", "Not interested", () -> request(NOT_INTERESTED, shown[0])));
            content.addView(column, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            ViewTreeObserver observer = decor.getViewTreeObserver();
            observer.addOnGlobalLayoutListener(() -> {
                sideBars.clear();
                collect(decor, sideBars);
            });
            observer.addOnPreDrawListener(() -> {
                shown[0] = place(column, sideBars);
                if (shown[0] != null) {
                    currentColumn = new WeakReference<>(column);
                    currentLike = shown[0].like;
                }
                return true;
            });
        } catch (Throwable ex) {
            Logger.printException(() -> "ReelsButtons attach failed", ex);
        }
    }

    private static ImageView button(Activity activity, String drawable, String description, Runnable action) {
        int size = dp(activity, 44);
        int padding = dp(activity, 9);
        ImageView view = new ImageView(activity);
        int id = activity.getResources().getIdentifier(drawable, "drawable", activity.getPackageName());
        if (id != 0) view.setImageResource(id);
        view.setColorFilter(Color.WHITE, PorterDuff.Mode.SRC_IN);
        view.setPadding(padding, padding, padding, padding);
        view.setContentDescription(description);
        view.setLayoutParams(new LinearLayout.LayoutParams(size, size));
        view.setOnClickListener(v -> action.run());
        return view;
    }

    private static int dp(Activity activity, int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, activity.getResources().getDisplayMetrics());
    }

    /** Every Reels side bar in the window: a ⋯ button and the like button beside it. */
    private static void collect(View root, List<SideBar> sideBars) {
        List<View> mores = new ArrayList<>();
        findTagged(root, MORE_TAG, moreTagId(), mores);
        for (View more : mores) {
            // The like button is in the same side bar: the nearest ancestor holding one.
            View parent = (View) more.getParent();
            View like = null;
            while (parent instanceof ViewGroup && like == null) {
                like = parent.findViewWithTag(LIKE_TAG);
                parent = parent.getParent() instanceof View ? (View) parent.getParent() : null;
            }
            if (like != null) sideBars.add(new SideBar(more, like));
        }
    }

    private static void findTagged(View view, String tag, int tagId, List<View> found) {
        if (view.getVisibility() != View.VISIBLE) return;
        Object viewTag = view.getTag();
        if (tag.equals(viewTag) || (tagId != 0 && viewTag instanceof Integer && (Integer) viewTag == tagId)) found.add(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) findTagged(group.getChildAt(i), tag, tagId, found);
        }
    }

    /**
     * Moves the column to where the sheet's branch and the side bar's branch meet, right before
     * the sheet's, so the sheet draws over it as it does over the side bar. A sheet in a window of
     * its own already does.
     */
    private static void placeBelow(View sheet) {
        LinearLayout column = currentColumn.get();
        View like = currentLike.get();
        if (column == null || like == null) return;
        List<View> sheetPath = new ArrayList<>();
        for (View view = sheet; view != null; view = view.getParent() instanceof View ? (View) view.getParent() : null) {
            sheetPath.add(view);
        }
        View sideBarBranch = like;
        for (View view = like; view != null; view = view.getParent() instanceof View ? (View) view.getParent() : null) {
            int at = sheetPath.indexOf(view);
            if (at > 0) {
                ViewGroup meeting = (ViewGroup) view;
                View sheetBranch = sheetPath.get(at - 1);
                // A LinearLayout would make room for the column, moving the app's views.
                if (meeting instanceof LinearLayout) return;
                if (meeting.indexOfChild(sideBarBranch) > meeting.indexOfChild(sheetBranch)) return;
                if (column.getParent() == meeting && meeting.indexOfChild(column) == meeting.indexOfChild(sheetBranch) - 1) return;
                if (column.getParent() instanceof ViewGroup) ((ViewGroup) column.getParent()).removeView(column);
                meeting.addView(column, meeting.indexOfChild(sheetBranch),
                        new ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                return;
            }
            sideBarBranch = view;
        }
    }

    /** Puts the column above the like button of the side bar most on screen, or hides it. */
    private static SideBar place(LinearLayout column, List<SideBar> sideBars) {
        SideBar best = null;
        int bestVisible = 0;
        Rect rect = new Rect();
        for (SideBar sideBar : sideBars) {
            View like = sideBar.like.get();
            if (like == null || !like.isShown() || !like.getGlobalVisibleRect(rect)) continue;
            if (rect.height() > bestVisible) {
                bestVisible = rect.height();
                best = sideBar;
            }
        }
        View like = best == null ? null : best.like.get();
        View container = column.getParent() instanceof View ? (View) column.getParent() : null;
        if (like == null || container == null) {
            if (column.getVisibility() != View.GONE) column.setVisibility(View.GONE);
            return null;
        }
        int[] likeAt = new int[2];
        int[] containerAt = new int[2];
        like.getLocationOnScreen(likeAt);
        container.getLocationOnScreen(containerAt);
        int width = column.getWidth() > 0 ? column.getWidth() : column.getMeasuredWidth();
        int height = column.getHeight() > 0 ? column.getHeight() : column.getMeasuredHeight();
        float x = likeAt[0] - containerAt[0] - column.getLeft() + (like.getWidth() - width) / 2f;
        float y = likeAt[1] - containerAt[1] - column.getTop() - height;
        if (column.getTranslationX() != x) column.setTranslationX(x);
        if (column.getTranslationY() != y) column.setTranslationY(y);
        if (column.getVisibility() != View.VISIBLE) column.setVisibility(View.VISIBLE);
        return best;
    }

    private static void request(String action, SideBar sideBar) {
        View more = sideBar == null ? null : sideBar.more.get();
        if (more == null) return;
        pendingAction = action;
        pendingSince = SystemClock.uptimeMillis();
        tap(more);
    }

    // endregion

    // region Menu

    /** Injection point: the ⋯ menu's options helper, bound to the reel whose menu is being built. */
    public static void onMenuHelper(Object helper) {
        menuHelper = new WeakReference<>(helper);
        menuBuiltAt = SystemClock.uptimeMillis();
    }

    /** Injection point: a bottom sheet's view was created. Runs the requested option of a ⋯ menu. */
    public static void onActionSheetCreated(Object fragment) {
        try {
            Method getView = fragment.getClass().getMethod("getView");
            View root = (View) getView.invoke(fragment);
            if (root == null) return;
            if (root.isAttachedToWindow()) placeBelow(root);
            else root.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View view) {
                    view.removeOnAttachStateChangeListener(this);
                    placeBelow(view);
                }

                @Override
                public void onViewDetachedFromWindow(View view) {
                }
            });

            // Only the Reels menu the button opened: its helper built the rows since the tap.
            // Any other sheet is left alone.
            String action = pendingAction;
            if (action == null || menuBuiltAt < pendingSince) return;
            pendingAction = null;
            if (SystemClock.uptimeMillis() - pendingSince > PENDING_TIMEOUT_MS) return;

            boolean[] done = new boolean[1];
            ViewTreeObserver.OnGlobalLayoutListener tapOption = new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override
                public void onGlobalLayout() {
                    String label = INTERESTED.equals(action) ? interestedLabel : notInterestedLabel;
                    TextView option = label == null ? null : findText(root, label);
                    if (done[0] || option == null) return;
                    done[0] = true;
                    root.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                    tap(option);
                }
            };
            root.getViewTreeObserver().addOnGlobalLayoutListener(tapOption);
            // A menu without the option: the helper runs it, and the menu closes.
            root.postDelayed(() -> {
                if (done[0]) return;
                done[0] = true;
                root.getViewTreeObserver().removeOnGlobalLayoutListener(tapOption);
                runThroughHelper(action);
                try {
                    fragment.getClass().getMethod("dismissAllowingStateLoss").invoke(fragment);
                } catch (Throwable ignored) {
                }
            }, LABEL_WAIT_MS);
        } catch (Throwable ex) {
            Logger.printException(() -> "ReelsButtons onActionSheetCreated failed", ex);
        }
    }

    private static void runThroughHelper(String action) {
        try {
            Object helper = menuHelper.get();
            if (helper == null) return;
            Class<?> optionClass = Class.forName(OPTION_CLASS, false, helper.getClass().getClassLoader());
            @SuppressWarnings({"unchecked", "rawtypes"})
            Object option = Enum.valueOf((Class) optionClass, action);
            Method handler = helper.getClass().getDeclaredMethod(optionHandler(), optionClass);
            handler.setAccessible(true);
            handler.invoke(helper, option);
        } catch (Throwable ex) {
            Logger.printException(() -> "ReelsButtons could not run " + action, ex);
        }
    }

    /** Injection point: the overflow menu's options as it is presented, for their labels. */
    public static void onMenuOptions(List<Object> options) {
        try {
            if (options == null) return;
            for (Object option : options) {
                List<String> strings = new ArrayList<>();
                for (Field field : option.getClass().getDeclaredFields()) {
                    if (field.getType() != String.class) continue;
                    field.setAccessible(true);
                    Object value = field.get(option);
                    if (value != null) strings.add((String) value);
                }
                if (strings.size() != 2) continue;
                if (strings.remove("interested")) interestedLabel = strings.get(0);
                else if (strings.remove("not_interested")) notInterestedLabel = strings.get(0);
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "ReelsButtons onMenuOptions failed", ex);
        }
    }

    private static TextView findText(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return (TextView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = findText(group.getChildAt(i), text);
                if (found != null) return found;
            }
        }
        return null;
    }

    // endregion

    /** A tap at the view's centre, delivered to its window, as a finger would. */
    private static void tap(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        float x = at[0] + view.getWidth() / 2f;
        float y = at[1] + view.getHeight() / 2f;
        long now = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, x, y, 0);
        MotionEvent up = MotionEvent.obtain(now, now + 50, MotionEvent.ACTION_UP, x, y, 0);
        View root = view.getRootView();
        root.dispatchTouchEvent(down);
        root.dispatchTouchEvent(up);
        down.recycle();
        up.recycle();
    }
}
