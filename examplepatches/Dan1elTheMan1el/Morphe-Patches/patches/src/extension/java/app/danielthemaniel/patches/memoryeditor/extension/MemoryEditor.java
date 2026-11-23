package app.danielthemaniel.patches.memoryeditor.extension;

import android.app.Activity;
import android.app.Application;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.WindowManager;
import android.widget.TextView;

import java.io.File;
import java.util.EnumSet;

/**
 * Entry point. Installed from {@link MemoryEditorProvider} before Application.onCreate, so it
 * works in any app without knowing its classes. Shows a draggable bubble on every resumed
 * activity; tapping it opens the {@link Panel}.
 */
public final class MemoryEditor {
    static final String TAG = "MemoryEditor";

    static Scanner scanner;
    static SavedStore saved;
    static Panel panel;

    // UI state that survives closing the panel / switching activities.
    static int lastTab;
    static String lastValue = "";
    static ValueType lastType = ValueType.DWORD;
    static Scanner.Mode lastMode = Scanner.Mode.EQUAL;
    static final EnumSet<MemMaps.Category> cats = EnumSet.of(
            MemMaps.Category.JAVA_HEAP, MemMaps.Category.C_HEAP, MemMaps.Category.C_DATA, MemMaps.Category.ANON);

    private static boolean installed;
    private static View bubble;
    private static Activity bubbleOwner;
    private static int bubbleX = -1, bubbleY = -1;

    private MemoryEditor() { }

    public static synchronized void install(Application app) {
        if (installed) return;
        installed = true;
        try {
            File scratch = new File(app.getCacheDir(), "memeditor");
            MemIO.init(scratch);
            scanner = new Scanner(scratch);
            saved = new SavedStore(new File(app.getFilesDir(), "memeditor_saved.json"));
        } catch (Throwable t) {
            Log.e(TAG, "Memory editor failed to start", t);
            return;
        }
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(Activity a, Bundle b) { }
            @Override public void onActivityStarted(Activity a) { }
            @Override public void onActivityStopped(Activity a) { }
            @Override public void onActivitySaveInstanceState(Activity a, Bundle b) { }
            @Override public void onActivityDestroyed(Activity a) { }

            @Override
            public void onActivityResumed(Activity a) {
                View decor = a.getWindow() != null ? a.getWindow().getDecorView() : null;
                if (decor != null) decor.post(() -> showBubble(a));
            }

            @Override
            public void onActivityPaused(Activity a) {
                hideBubble(a);
                if (panel != null && panel.activity == a) panel.dismiss();
            }
        });
        Log.i(TAG, "Memory editor installed in " + app.getPackageName());
    }

    private static void showBubble(Activity a) {
        if (a.isFinishing() || bubbleOwner == a) return;
        hideBubble(bubbleOwner);
        float density = a.getResources().getDisplayMetrics().density;
        int size = (int) (46 * density);
        if (bubbleX < 0) {
            bubbleX = (int) (8 * density);
            bubbleY = a.getResources().getDisplayMetrics().heightPixels / 3;
        }

        TextView v = new TextView(a);
        v.setText("M");
        v.setTextColor(0xFFFFFFFF);
        v.setTextSize(18);
        v.setTypeface(Typeface.DEFAULT_BOLD);
        v.setGravity(Gravity.CENTER);
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.OVAL);
        bg.setColor(0xCC5E35B1);
        bg.setStroke((int) (2 * density), 0x88FFFFFF);
        v.setBackground(bg);

        WindowManager.LayoutParams lp = new WindowManager.LayoutParams(size, size,
                WindowManager.LayoutParams.TYPE_APPLICATION,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                        | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                        | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                PixelFormat.TRANSLUCENT);
        lp.gravity = Gravity.TOP | Gravity.START;
        lp.x = bubbleX;
        lp.y = bubbleY;

        WindowManager wm = a.getWindowManager();
        int slop = ViewConfiguration.get(a).getScaledTouchSlop();
        v.setOnTouchListener(new View.OnTouchListener() {
            float downX, downY;
            int startX, startY;
            boolean dragging;

            @Override
            public boolean onTouch(View view, MotionEvent e) {
                switch (e.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        downX = e.getRawX();
                        downY = e.getRawY();
                        startX = lp.x;
                        startY = lp.y;
                        dragging = false;
                        return true;
                    case MotionEvent.ACTION_MOVE:
                        float dx = e.getRawX() - downX, dy = e.getRawY() - downY;
                        if (!dragging && Math.hypot(dx, dy) > slop) dragging = true;
                        if (dragging) {
                            lp.x = bubbleX = startX + (int) dx;
                            lp.y = bubbleY = startY + (int) dy;
                            try {
                                wm.updateViewLayout(view, lp);
                            } catch (RuntimeException ignored) {
                            }
                        }
                        return true;
                    case MotionEvent.ACTION_UP:
                        if (!dragging) openPanel(a);
                        return true;
                    default:
                        return false;
                }
            }
        });

        try {
            wm.addView(v, lp);
            bubble = v;
            bubbleOwner = a;
        } catch (RuntimeException e) {
            Log.w(TAG, "Couldn't add bubble to " + a.getClass().getName(), e);
        }
    }

    private static void hideBubble(Activity a) {
        if (a == null || a != bubbleOwner || bubble == null) return;
        try {
            a.getWindowManager().removeViewImmediate(bubble);
        } catch (RuntimeException ignored) {
        }
        bubble = null;
        bubbleOwner = null;
    }

    private static void openPanel(Activity a) {
        if (panel != null) return;
        try {
            panel = new Panel(a);
            panel.show();
        } catch (RuntimeException e) {
            panel = null;
            Log.e(TAG, "Couldn't open panel", e);
        }
    }
}
