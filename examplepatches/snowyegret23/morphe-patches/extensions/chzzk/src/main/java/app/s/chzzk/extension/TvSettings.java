package app.s.chzzk.extension;

import android.app.Activity;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Toast;
import java.lang.ref.WeakReference;

public final class TvSettings {
    private static WeakReference<Activity> activity = new WeakReference<>(null);
    private static WeakReference<View> player = new WeakReference<>(null);
    static boolean active;

    private TvSettings() {}

    public static void attach(Activity host) {
        active = true;
        activity = new WeakReference<>(host);
        ChzzkSettings.attach(host);
    }

    public static boolean onKey(KeyEvent event) {
        if (event.getKeyCode() != KeyEvent.KEYCODE_MENU) return false;
        Activity host = activity.get();
        if (host == null || host.isFinishing() || host.isDestroyed()) return false;
        if (event.getAction() == KeyEvent.ACTION_DOWN && event.getRepeatCount() == 0) {
            ChzzkSettings.showSettings(host);
        }
        return true;
    }

    public static void renderEntry(Object composer) {}
    public static Object playerModel(Object view) { return null; }
    public static void bindPlayer(View view) { player = new WeakReference<>(view); }

    public static float minVideoWidth(float windowWidth) { return Math.min(96f, windowWidth / 2f); }
    public static float maxChatWidth(float windowWidth) { return Math.max(0f, windowWidth - minVideoWidth(windowWidth)); }

    static void prepareFocus(View root) {
        prepareChildren(root);
        View first = firstControl(root);
        if (first != null) first.requestFocus();
    }

    private static void prepareChildren(View view) {
        if (view.isClickable() || view instanceof android.widget.SeekBar || view instanceof android.widget.EditText) {
            view.setFocusable(true);
            view.setFocusableInTouchMode(true);
            android.graphics.drawable.GradientDrawable ring = new android.graphics.drawable.GradientDrawable();
            ring.setColor(android.graphics.Color.TRANSPARENT);
            ring.setCornerRadius(10 * view.getResources().getDisplayMetrics().density);
            ring.setStroke(Math.max(2, Math.round(2 * view.getResources().getDisplayMetrics().density)), 0xff00efa3);
            android.graphics.drawable.StateListDrawable focus = new android.graphics.drawable.StateListDrawable();
            focus.addState(new int[] {android.R.attr.state_focused}, ring);
            focus.addState(new int[0], new android.graphics.drawable.ColorDrawable(android.graphics.Color.TRANSPARENT));
            view.setForeground(focus);
        }
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) prepareChildren(group.getChildAt(i));
        }
    }

    private static View firstControl(View view) {
        if (view.getVisibility() != View.VISIBLE) return null;
        if (view.isFocusable() && (view.isClickable() || view instanceof android.widget.SeekBar)) return view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View control = firstControl(group.getChildAt(i));
                if (control != null) return control;
            }
        }
        return null;
    }

    static void seek(boolean forward) {
        Activity host = activity.get();
        View view = player.get();
        if (host == null) return;
        if (view == null || !view.isAttachedToWindow() || !view.isShown()) {
            Toast.makeText(host, "방송 재생 중에 사용할 수 있습니다", Toast.LENGTH_SHORT).show();
            return;
        }
        Object model = playerModel(view);
        Object action = forward ? ChatUi.catchUpClick(model) : ChatUi.rewindClick(model);
        try {
            Class.forName("kotlin.jvm.functions.Function0").getMethod("invoke").invoke(action);
        } catch (ReflectiveOperationException e) {
            Toast.makeText(host, "재생 위치를 변경하지 못했습니다", Toast.LENGTH_SHORT).show();
        }
    }
}
