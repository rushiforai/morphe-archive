package dev.jason.gboardpatches.extension.swipedismiss;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.inputmethodservice.InputMethodService;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;

import java.util.Map;
import java.util.WeakHashMap;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

public final class GboardSwipeDownDismissRuntime {
    private static final String HEADER_ID_NAME = "keyboard_header_view_holder";
    private static final Map<View, GboardSwipeDownDismissGestureState> GESTURES = new WeakHashMap<>();
    private static final ThreadLocal<Boolean> CANCELLING = ThreadLocal.withInitial(() -> false);
    private static volatile boolean toolbarEditMode;
    private static int headerId;

    private GboardSwipeDownDismissRuntime() {
    }

    public static void onToolbarEditModeChanged(boolean editing) {
        toolbarEditMode = editing;
    }

    static boolean isToolbarEditModeForTesting() {
        return toolbarEditMode;
    }

    public static boolean onHeaderTouch(View holder, MotionEvent event) {
        if (holder == null || event == null || Boolean.TRUE.equals(CANCELLING.get())
                || !isHeaderHolder(holder)) {
            return false;
        }
        GboardSwipeDownDismissGestureState gesture = GESTURES.get(holder);
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            if (gesture == null) {
                gesture = new GboardSwipeDownDismissGestureState();
                GESTURES.put(holder, gesture);
            }
            boolean admitted = !toolbarEditMode && holder.isShown()
                    && startsInsideHeader(holder, event) && isEnabled(holder.getContext())
                    && !containsNativeGestureSurface(holder.getRootView(), event.getRawX(), event.getRawY())
                    && !containsNativeDragPopup(holder.getRootView());
            gesture.begin(admitted, event.getRawX(), event.getRawY(), event.getEventTime(),
                    ViewConfiguration.get(holder.getContext()).getScaledTouchSlop(),
                    ViewConfiguration.getLongPressTimeout());
            return false;
        }
        if (gesture == null) {
            return false;
        }
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
            boolean consumed = gesture.isConsumed();
            gesture.reset();
            return consumed;
        }
        if (gesture.isConsumed()) {
            return true;
        }
        if (action == MotionEvent.ACTION_POINTER_DOWN || event.getPointerCount() != 1) {
            gesture.reset();
            return false;
        }
        if (action != MotionEvent.ACTION_MOVE || !gesture.isTracking()) {
            return false;
        }
        if (toolbarEditMode || !holder.isShown() || containsNativeDragPopup(holder.getRootView())) {
            gesture.reset();
            return false;
        }
        float density = holder.getResources().getDisplayMetrics().density;
        if (!gesture.move(event.getRawX(), event.getRawY(), density, event.getEventTime())) {
            return false;
        }
        InputMethodService service = resolveInputMethodService(holder.getContext());
        if (service == null) {
            gesture.reset();
            return false;
        }
        MotionEvent cancel = MotionEvent.obtain(event);
        cancel.setAction(MotionEvent.ACTION_CANCEL);
        CANCELLING.set(true);
        try {
            holder.dispatchTouchEvent(cancel);
        } finally {
            CANCELLING.remove();
            cancel.recycle();
        }
        try {
            service.requestHideSelf(0);
        } catch (Throwable failure) {
            Log.w("GboardPatches", "[swipe-down-dismiss] failed to dismiss keyboard", failure);
        }
        return true;
    }

    private static boolean isHeaderHolder(View holder) {
        if (headerId != 0) {
            return holder.getId() == headerId;
        }
        if (holder.getId() == View.NO_ID) {
            return false;
        }
        try {
            if (HEADER_ID_NAME.equals(holder.getResources().getResourceEntryName(holder.getId()))) {
                headerId = holder.getId();
                return true;
            }
        } catch (Resources.NotFoundException ignored) {
        }
        return false;
    }

    private static boolean startsInsideHeader(View holder, MotionEvent event) {
        int[] location = new int[2];
        holder.getLocationOnScreen(location);
        return GboardSwipeDownDismissGestureState.isHeaderStart(event.getRawX(), event.getRawY(),
                location[0], location[1], holder.getWidth(), holder.getHeight());
    }

    private static InputMethodService resolveInputMethodService(Context context) {
        while (context instanceof ContextWrapper wrapper) {
            if (context instanceof InputMethodService service) {
                return service;
            }
            Context base = wrapper.getBaseContext();
            if (base == null || base == context) {
                break;
            }
            context = base;
        }
        return null;
    }

    private static boolean isEnabled(Context context) {
        try {
            return GboardSwipeDownDismissSettings.readEnabled(GboardPatchesSettings.preferences(context));
        } catch (Throwable failure) {
            return false;
        }
    }

    private static boolean containsNativeGestureSurface(View view, float rawX, float rawY) {
        if (view == null || view.getVisibility() != View.VISIBLE) {
            return false;
        }
        int[] location = new int[2];
        view.getLocationOnScreen(location);
        if (!GboardSwipeDownDismissGestureState.isHeaderStart(rawX, rawY,
                location[0], location[1], view.getWidth(), view.getHeight())) {
            return false;
        }
        if (view.getClass().getName().endsWith("DragDetectionLayer")
                || view.canScrollVertically(-1) || view.canScrollVertically(1)) {
            return true;
        }
        if (view instanceof ViewGroup group) {
            for (int index = group.getChildCount() - 1; index >= 0; index--) {
                if (containsNativeGestureSurface(group.getChildAt(index), rawX, rawY)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean containsNativeDragPopup(View view) {
        if (view == null || view.getVisibility() != View.VISIBLE) {
            return false;
        }
        String name = view.getClass().getName();
        if (name.endsWith("DragConfirmationPopupView") || name.endsWith("AccessPointDragPopupView")) {
            return true;
        }
        if (view instanceof ViewGroup group) {
            for (int index = 0; index < group.getChildCount(); index++) {
                if (containsNativeDragPopup(group.getChildAt(index))) {
                    return true;
                }
            }
        }
        return false;
    }
}
