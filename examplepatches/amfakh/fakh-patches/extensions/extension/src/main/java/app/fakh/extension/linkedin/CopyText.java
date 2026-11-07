package app.fakh.extension.linkedin;

import android.app.Activity;
import android.app.Dialog;
import android.app.Application;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.Gravity;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Copy text: pressing and holding on text opens a sheet with the whole text, which can be selected and copied. LinkedIn
 * does not let people copy what others write. Compose text is read from the semantics tree of the screen, by
 * reflection, since the screen draws it itself; other screens use the TextView under the finger.
 */
@SuppressWarnings("unused")
public final class CopyText {
    private static final WeakHashMap<Activity, Boolean> wrapped = new WeakHashMap<>();
    private static final Handler handler = new Handler(Looper.getMainLooper());
    private static boolean registered;

    private CopyText() {
    }

    /**
     * Injected at the start of the Application's attachBaseContext. The Application does not exist yet then, so the
     * registration runs on the main thread right after it has started, before the first activity is created.
     */
    public static void attach(Context context) {
        if (registered) return;
        registered = true;
        handler.post(CopyText::register);
    }

    private static void register() {
        Application app = Settings.app();
        if (app == null) {
            handler.postDelayed(CopyText::register, 20);
            return;
        }
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, Bundle state) {
                watch(activity);
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityResumed(Activity activity) {
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle state) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
            }
        });
    }

    /** Wraps the window callback of an activity, once, so its touches are seen before the screen gets them. */
    private static void watch(Activity activity) {
        if (wrapped.put(activity, true) != null) return;
        Window window = activity.getWindow();
        Window.Callback original = window.getCallback();
        if (original == null) return;
        Press press = new Press(activity, original);
        window.setCallback((Window.Callback) Proxy.newProxyInstance(Window.Callback.class.getClassLoader(),
                new Class<?>[]{Window.Callback.class}, (proxy, method, args) -> {
                    if (method.getName().equals("dispatchTouchEvent") && args != null && args.length == 1
                            && args[0] instanceof MotionEvent) {
                        return press.onTouch((MotionEvent) args[0]);
                    }
                    try {
                        return method.invoke(original, args);
                    } catch (InvocationTargetException e) {
                        throw e.getCause();
                    }
                }));
    }

    /** The touch being watched: a press that is held long enough opens the sheet. */
    private static final class Press {
        private final Activity activity;
        private final Window.Callback original;
        private final int slop;
        private float downX;
        private float downY;
        private long downTime;
        private boolean swallowing;
        private final Runnable longPress = this::fire;

        Press(Activity activity, Window.Callback original) {
            this.activity = activity;
            this.original = original;
            this.slop = ViewConfiguration.get(activity).getScaledTouchSlop();
        }

        boolean onTouch(MotionEvent event) {
            int action = event.getActionMasked();
            if (swallowing) {
                // The press already became a copy: the app does not get the rest of it, so lifting does not open the post.
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) swallowing = false;
                return true;
            }
            switch (action) {
                case MotionEvent.ACTION_DOWN:
                    downX = event.getRawX();
                    downY = event.getRawY();
                    downTime = event.getDownTime();
                    handler.removeCallbacks(longPress);
                    if (Settings.copyText()) handler.postDelayed(longPress, ViewConfiguration.getLongPressTimeout());
                    break;
                case MotionEvent.ACTION_MOVE:
                    if (Math.abs(event.getRawX() - downX) > slop || Math.abs(event.getRawY() - downY) > slop) {
                        handler.removeCallbacks(longPress);
                    }
                    break;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                case MotionEvent.ACTION_POINTER_DOWN:
                    handler.removeCallbacks(longPress);
                    break;
                default:
                    break;
            }
            try {
                return original.dispatchTouchEvent(event);
            } catch (Throwable t) {
                Diagnostics.error("dispatchTouchEvent failed", t);
                return false;
            }
        }

        private void fire() {
            try {
                String text = textAt(activity, downX, downY);
                if (text == null || text.trim().isEmpty()) return;
                MotionEvent cancel = MotionEvent.obtain(downTime, SystemClock.uptimeMillis(), MotionEvent.ACTION_CANCEL,
                        downX, downY, 0);
                original.dispatchTouchEvent(cancel);
                cancel.recycle();
                swallowing = true;
                show(activity, text);
            } catch (Throwable t) {
                Diagnostics.error("copy text failed", t);
            }
        }
    }

    /** The text under a point in screen coordinates, or null when there is none. */
    private static String textAt(Activity activity, float x, float y) {
        View decor = activity.getWindow().getDecorView();
        View hit = viewAt(decor, x, y);
        for (View v = hit; v != null; v = v.getParent() instanceof View ? (View) v.getParent() : null) {
            if (v.getClass().getName().endsWith("AndroidComposeView")) {
                int[] screen = new int[2];
                int[] window = new int[2];
                v.getLocationOnScreen(screen);
                v.getLocationInWindow(window);
                return composeTextAt(v, x - (screen[0] - window[0]), y - (screen[1] - window[1]));
            }
        }
        if (hit instanceof TextView && !(hit instanceof android.widget.EditText)) {
            CharSequence text = ((TextView) hit).getText();
            return text == null ? null : text.toString();
        }
        return null;
    }

    /** The innermost visible view that contains a point in screen coordinates. */
    private static View viewAt(View view, float x, float y) {
        if (!(view instanceof ViewGroup)) return view;
        ViewGroup group = (ViewGroup) view;
        Rect rect = new Rect();
        int[] location = new int[2];
        for (int i = group.getChildCount() - 1; i >= 0; i--) {
            View child = group.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE) continue;
            child.getLocationOnScreen(location);
            rect.set(location[0], location[1], location[0] + child.getWidth(), location[1] + child.getHeight());
            if (rect.contains((int) x, (int) y)) return viewAt(child, x, y);
        }
        return view;
    }

    // region Compose semantics

    /** The text of the innermost node of a Compose screen that holds text at a point, in window coordinates. */
    private static String composeTextAt(View composeView, float x, float y) {
        try {
            Object owner = composeView.getClass().getMethod("getSemanticsOwner").invoke(composeView);
            Object root = owner.getClass().getMethod("getUnmergedRootSemanticsNode").invoke(owner);
            return find(root, x, y, 0);
        } catch (Throwable t) {
            Diagnostics.error("semantics tree unreadable", t);
            return null;
        }
    }

    private static String find(Object node, float x, float y, int depth) throws Exception {
        if (depth > 60 || !contains(node, x, y)) return null;
        Map<String, Object> props = properties(node);
        String best = null;
        if (!props.containsKey("OnLongClick") && props.get("Text") instanceof List) {
            StringBuilder text = new StringBuilder();
            for (Object part : (List<?>) props.get("Text")) {
                if (text.length() > 0) text.append('\n');
                text.append(part);
            }
            if (text.length() > 0) best = text.toString();
        }
        Method children = node.getClass().getMethod("getChildren$ui", boolean.class, boolean.class, boolean.class);
        for (Object child : (List<?>) children.invoke(node, true, false, false)) {
            String deeper = find(child, x, y, depth + 1);
            if (deeper != null) best = deeper;
        }
        return best;
    }

    private static boolean contains(Object node, float x, float y) throws Exception {
        Object rect = node.getClass().getMethod("getBoundsInWindow").invoke(node);
        Class<?> c = rect.getClass();
        return x >= c.getField("left").getFloat(rect) && x <= c.getField("right").getFloat(rect)
                && y >= c.getField("top").getFloat(rect) && y <= c.getField("bottom").getFloat(rect);
    }

    /** The properties of a SemanticsNode by name, such as Text and OnLongClick. */
    private static Map<String, Object> properties(Object node) throws Exception {
        Map<String, Object> result = new java.util.HashMap<>();
        Object config = node.getClass().getMethod("getConfig").invoke(node);
        Iterator<?> it = (Iterator<?>) config.getClass().getMethod("iterator").invoke(config);
        while (it.hasNext()) {
            Map.Entry<?, ?> entry = (Map.Entry<?, ?>) it.next();
            Field name = entry.getKey().getClass().getField("name");
            result.put((String) name.get(entry.getKey()), entry.getValue());
        }
        return result;
    }

    // endregion

    /** A scroll view that grows with its text up to a height, so the buttons under it always stay on screen. */
    private static final class LimitedScrollView extends ScrollView {
        private final int maxHeight;

        LimitedScrollView(Context context, int maxHeight) {
            super(context);
            this.maxHeight = maxHeight;
        }

        @Override
        protected void onMeasure(int widthSpec, int heightSpec) {
            super.onMeasure(widthSpec, View.MeasureSpec.makeMeasureSpec(maxHeight, View.MeasureSpec.AT_MOST));
        }
    }

    /**
     * A dialog with the text, which can be selected with the usual handles, and a Copy all button. It is built by hand
     * with its own colors: the system alert theme can hide its buttons below a long text or on the app's own colors.
     */
    private static void show(Activity activity, String text) {
        float density = activity.getResources().getDisplayMetrics().density;
        boolean night = (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        int background = night ? (Settings.pitchBlack() ? 0xFF0D0D0D : 0xFF26262A) : 0xFFFFFFFF;
        int foreground = night ? 0xFFEDEDF0 : 0xFF1B1B1F;
        int accent = night ? 0xFFC3BFFF : 0xFF4B43A8;
        int screenHeight = activity.getResources().getDisplayMetrics().heightPixels;
        int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        TextView body = new TextView(activity);
        body.setText(text);
        body.setTextSize(16);
        body.setTextColor(foreground);
        body.setTextIsSelectable(true);
        int pad = Math.round(20 * density);
        body.setPadding(pad, pad, pad, pad);
        ScrollView scroll = new LimitedScrollView(activity, Math.round(screenHeight * 0.6f));
        scroll.addView(body);

        LinearLayout buttons = new LinearLayout(activity);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.setGravity(Gravity.END);
        buttons.setPadding(pad / 2, 0, pad / 2, pad / 2);
        TextView close = button(activity, I18n.tr("Close"), accent);
        close.setOnClickListener(v -> dialog.dismiss());
        TextView copy = button(activity, I18n.tr("Copy all"), accent);
        copy.setOnClickListener(v -> {
            ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText("text", text));
            Downloads.toast(activity, "Text copied");
            dialog.dismiss();
        });
        buttons.addView(close);
        buttons.addView(copy);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(background);
        shape.setCornerRadius(24 * density);
        root.setBackground(shape);
        root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(buttons, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        dialog.setContentView(root);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setLayout(Math.round(screenWidth * 0.92f), ViewGroup.LayoutParams.WRAP_CONTENT);
        }
        dialog.show();
    }

    private static TextView button(Context context, String label, int color) {
        float density = context.getResources().getDisplayMetrics().density;
        TextView view = new TextView(context);
        view.setText(label);
        view.setTextSize(15);
        view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setTextColor(color);
        view.setGravity(Gravity.CENTER);
        view.setPadding(Math.round(18 * density), Math.round(12 * density), Math.round(18 * density),
                Math.round(12 * density));
        view.setClickable(true);
        return view;
    }
}
