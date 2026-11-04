package app.linkedin.extension;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Long pressing text selects it in place, with Android's selection handles and Copy / Select all / Share toolbar.
 * <p>
 * LinkedIn draws its screens with Compose and R8 removed Compose's SelectionContainer, so the Compose text itself
 * can't be made selectable. Instead every touch that enters a Compose view passes through {@link #onTouchEvent}. A
 * long press looks up the text under the finger in Compose's semantics tree, through the accessibility node provider
 * every Compose view has (it works with accessibility off), and {@link TextSelectionOverlay} lays a native
 * selectable copy of it over the original. Text without a layout of its own opens in a sheet instead.
 */
@SuppressWarnings("unused")
public final class CopyTextPatch {
    private static final Handler HANDLER = new Handler(Looper.getMainLooper());

    /** Down time of the current gesture, to tell nested Compose views of one gesture from a new gesture. */
    private static long gestureDownTime = -1;
    /** Compose views that got the down event of the current gesture, outermost first. */
    private static final List<WeakReference<View>> gestureViews = new ArrayList<>();
    private static float downRawX;
    private static float downRawY;
    private static Runnable pendingLongPress;
    /** Set once the sheet opened: the rest of the gesture must not reach LinkedIn, or lifting the finger is a tap. */
    private static boolean swallowGesture;
    private static boolean dispatchingCancel;

    private CopyTextPatch() {
    }

    /**
     * Injection point, at the start of AndroidComposeView.dispatchTouchEvent.
     *
     * @return true to drop the event.
     */
    public static boolean onTouchEvent(View view, MotionEvent event) {
        try {
            if (dispatchingCancel || !Settings.copyText()) return false;
            int action = event.getActionMasked();
            if (swallowGesture) {
                if (event.getDownTime() == gestureDownTime) return true;
                swallowGesture = false;
            }
            switch (action) {
                case MotionEvent.ACTION_DOWN:
                    if (event.getDownTime() != gestureDownTime) {
                        cancelLongPress();
                        gestureViews.clear();
                        gestureDownTime = event.getDownTime();
                        downRawX = event.getRawX();
                        downRawY = event.getRawY();
                        pendingLongPress = CopyTextPatch::onLongPress;
                        HANDLER.postDelayed(pendingLongPress, ViewConfiguration.getLongPressTimeout());
                    }
                    // Nested Compose views get the same down event after the view that contains them.
                    gestureViews.add(new WeakReference<>(view));
                    break;
                case MotionEvent.ACTION_MOVE:
                    if (pendingLongPress != null) {
                        float slop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
                        if (Math.abs(event.getRawX() - downRawX) > slop || Math.abs(event.getRawY() - downRawY) > slop) {
                            cancelLongPress();
                        }
                    }
                    break;
                default: // Lifted, cancelled, or a second finger.
                    cancelLongPress();
            }
        } catch (Throwable t) {
            Diagnostics.error("copy text touch failed", t);
        }
        return false;
    }

    private static void cancelLongPress() {
        if (pendingLongPress != null) {
            HANDLER.removeCallbacks(pendingLongPress);
            pendingLongPress = null;
        }
    }

    private static void onLongPress() {
        pendingLongPress = null;
        try {
            // Innermost view first: the text under the finger is most likely its own.
            for (int i = gestureViews.size() - 1; i >= 0; i--) {
                View view = gestureViews.get(i).get();
                if (view == null || !view.isAttachedToWindow()) continue;
                Hit hit = textAt(view, (int) downRawX, (int) downRawY);
                if (hit == null) continue;
                view.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                cancelGesture(view);
                String text = hit.text.toString();
                // Select in place, like Reddit; text without a layout (a merged block) opens in the sheet.
                if (!TextSelectionOverlay.show(view, hit.provider, hit.id, hit.info, text,
                        (int) downRawX, (int) downRawY)) {
                    show(view.getContext(), text);
                }
                return;
            }
        } catch (Throwable t) {
            Diagnostics.error("copy text long press failed", t);
        }
    }

    /** Ends the gesture for LinkedIn, so lifting the finger later doesn't open the post or press a link. */
    private static void cancelGesture(View view) {
        swallowGesture = true;
        View root = view.getRootView();
        long now = SystemClock.uptimeMillis();
        MotionEvent cancel = MotionEvent.obtain(gestureDownTime, now, MotionEvent.ACTION_CANCEL, 0, 0, 0);
        dispatchingCancel = true;
        try {
            root.dispatchTouchEvent(cancel);
        } finally {
            dispatchingCancel = false;
            cancel.recycle();
        }
    }

    // region Text lookup

    private static Field delegateField;
    private static Field invalidatedField;
    private static Method currentNodesMethod;
    private static Field keysField;
    private static Field valuesField;

    private static final class Hit {
        final AccessibilityNodeProvider provider;
        final int id;
        final AccessibilityNodeInfo info;
        final CharSequence text;

        Hit(AccessibilityNodeProvider provider, int id, AccessibilityNodeInfo info, CharSequence text) {
            this.provider = provider;
            this.id = id;
            this.info = info;
            this.text = text;
        }
    }

    /** The smallest text element at the given screen point, or null when there is none. */
    private static Hit textAt(View view, int rawX, int rawY) throws ReflectiveOperationException {
        AccessibilityNodeProvider provider = view.getAccessibilityNodeProvider();
        if (provider == null) provider = providerOfDelegate(view);
        if (provider == null) return null;
        int[] ids = semanticsNodeIds(view);
        if (ids == null) return null;

        Rect bounds = new Rect();
        Hit best = null;
        long bestArea = Long.MAX_VALUE;
        for (int id : ids) {
            AccessibilityNodeInfo info = provider.createAccessibilityNodeInfo(id);
            if (info == null) continue;
            CharSequence text = info.getText();
            // Long pressing these already does something in LinkedIn (reactions, editing).
            boolean usable = !TextUtils.isEmpty(text) && !info.isEditable() && !info.isPassword()
                    && !info.isLongClickable() && info.isVisibleToUser();
            if (usable) {
                info.getBoundsInScreen(bounds);
                long area = (long) bounds.width() * bounds.height();
                if (bounds.contains(rawX, rawY) && area < bestArea) {
                    best = new Hit(provider, id, info, text);
                    bestArea = area;
                }
            }
        }
        return best;
    }

    /**
     * Ids of the semantics nodes of a Compose view: the keys of
     * AndroidComposeViewAccessibilityDelegateCompat.getCurrentSemanticsNodes(), an IntObjectMap.
     */
    private static int[] semanticsNodeIds(View view) throws ReflectiveOperationException {
        if (delegateField == null) {
            delegateField = fieldOfType(view.getClass(), "AndroidComposeViewAccessibilityDelegateCompat");
            if (delegateField == null) return null;
        }
        Object delegate = delegateField.get(view);
        if (delegate == null) return null;
        if (currentNodesMethod == null) {
            currentNodesMethod = delegate.getClass().getMethod("getCurrentSemanticsNodes");
            invalidatedField = field(delegate.getClass(), "currentSemanticsNodesInvalidated");
        }
        // Compose only refreshes the nodes for accessibility services, so make it rebuild them now.
        if (invalidatedField != null) invalidatedField.setBoolean(delegate, true);
        Object map = currentNodesMethod.invoke(delegate);
        if (map == null) return null;
        if (keysField == null) {
            keysField = field(map.getClass(), "keys");
            valuesField = field(map.getClass(), "values");
            if (keysField == null || valuesField == null) return null;
        }
        int[] keys = (int[]) keysField.get(map);
        Object[] values = (Object[]) valuesField.get(map);
        int count = 0;
        int[] ids = new int[keys.length];
        for (int i = 0; i < keys.length && i < values.length; i++) {
            if (values[i] != null) ids[count++] = keys[i];
        }
        int[] result = new int[count];
        System.arraycopy(ids, 0, result, 0, count);
        return result;
    }

    /** The node provider straight from Compose's delegate, for a view that has not handed it to Android. */
    private static AccessibilityNodeProvider providerOfDelegate(View view) throws ReflectiveOperationException {
        if (delegateField == null) {
            delegateField = fieldOfType(view.getClass(), "AndroidComposeViewAccessibilityDelegateCompat");
            if (delegateField == null) return null;
        }
        Object delegate = delegateField.get(view);
        if (delegate == null) return null;
        Object compat = delegate.getClass().getMethod("getAccessibilityNodeProvider", View.class).invoke(delegate, view);
        if (compat == null) return null;
        // R8 removed AccessibilityNodeProviderCompat.getProvider(), the field is left.
        Field providerField = fieldOfType(compat.getClass(), "AccessibilityNodeProvider");
        Object provider = providerField == null ? null : providerField.get(compat);
        return provider instanceof AccessibilityNodeProvider ? (AccessibilityNodeProvider) provider : null;
    }

    private static Field field(Class<?> type, String name) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) {
            }
        }
        return null;
    }

    private static Field fieldOfType(Class<?> type, String simpleTypeName) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (f.getType().getSimpleName().equals(simpleTypeName)) {
                    f.setAccessible(true);
                    return f;
                }
            }
        }
        return null;
    }

    // endregion

    // region Sheet

    private static void show(Context context, String text) {
        boolean night = (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        int theme = night ? AlertDialog.THEME_DEVICE_DEFAULT_DARK : AlertDialog.THEME_DEVICE_DEFAULT_LIGHT;
        AlertDialog.Builder builder = new AlertDialog.Builder(context, theme);

        TextView textView = new TextView(builder.getContext());
        textView.setText(text);
        textView.setTextIsSelectable(true);
        textView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        int padding = Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 24,
                context.getResources().getDisplayMetrics()));
        textView.setPadding(padding, padding / 2, padding, 0);
        ScrollView scroll = new ScrollView(builder.getContext());
        scroll.addView(textView);

        builder.setTitle(I18n.tr("Select text"))
                .setView(scroll)
                .setPositiveButton(I18n.tr("Copy all"), (dialog, which) -> TextSelectionOverlay.copy(context, text))
                .setNegativeButton(I18n.tr("Close"), null)
                .show();
    }

    // endregion
}
