package app.aidan.extension.blackjack;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import java.io.File;
import java.io.FileInputStream;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import org.json.JSONObject;

public final class SkipLevelDialog {
    private static final String TAG = "SkipLevelDialog";
    private static long lastDialogTime = 0L;

    private SkipLevelDialog() {
    }

    /**
     * Installs a window callback on the UI thread to intercept taps on the level indicator.
     * Unhandled events are forwarded to the previous callback. A null activity, missing
     * window or callback, and failures during installation are ignored. Repeated calls
     * wrap the current callback again.
     */
    public static void install(final Activity activity) {
        if (activity == null) {
            return;
        }

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try {
                    final Window window = activity.getWindow();
                    if (window == null) {
                        Log.w(TAG, "Window is null, cannot install touch interceptor");
                        return;
                    }

                    final Window.Callback originalCallback = window.getCallback();
                    if (originalCallback == null) {
                        Log.w(TAG, "Original Window.Callback is null");
                        return;
                    }

                    InvocationHandler handler = new InvocationHandler() {
                        /**
                         * Consumes handled level-indicator taps and forwards all other calls to the original
                         * window callback, returning its result.
                         *
                         * @throws Throwable if touch handling or reflective callback invocation fails
                         */
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                            if ("dispatchTouchEvent".equals(method.getName()) && args != null && args.length == 1) {
                                MotionEvent ev = (MotionEvent) args[0];
                                if (handleTouch(activity, ev)) {
                                    return Boolean.TRUE;
                                }
                            }
                            return method.invoke(originalCallback, args);
                        }
                    };

                    Window.Callback proxyCallback = (Window.Callback) Proxy.newProxyInstance(
                            Window.Callback.class.getClassLoader(),
                            new Class<?>[]{Window.Callback.class},
                            handler
                    );
                    window.setCallback(proxyCallback);
                    Log.i(TAG, "Successfully installed touch interceptor for Skip to Next Level");
                } catch (Throwable t) {
                    Log.e(TAG, "Failed to install touch interceptor", t);
                }
            }
        });
    }

    /**
     * Requests a skip-level dialog for ACTION_UP within the inclusive safe-area-relative
     * next-level badge rectangle x = 75–85%, y = -2–5%. Unity anchors the HUD below
     * the top system inset, which varies with a device's status bar and display cutout.
     * Requests are throttled to one per 1,500 ms across activities. Returns true for a
     * matching request, otherwise false, including for null events or nonpositive
     * decor-view dimensions.
     *
     * @param activity non-null activity supplying the window and dialog
     */
    public static boolean handleTouch(Activity activity, MotionEvent event) {
        if (event == null || event.getAction() != MotionEvent.ACTION_UP) {
            return false;
        }

        long now = System.currentTimeMillis();
        if (now - lastDialogTime < 1500L) {
            return false;
        }

        View decorView = activity.getWindow().getDecorView();
        int w = decorView.getWidth();
        int h = decorView.getHeight();
        WindowInsets insets = decorView.getRootWindowInsets();
        int topInset = insets == null ? 0 : insets.getSystemWindowInsetTop();
        int bottomInset = insets == null ? 0 : insets.getSystemWindowInsetBottom();
        int contentHeight = h - topInset - bottomInset;
        if (w <= 0 || contentHeight <= 0) {
            return false;
        }

        float normX = event.getX() / (float) w;
        float safeAreaY = (event.getY() - topInset) / (float) contentHeight;

        // The level badge is anchored at the top of Unity's safe-area layout.
        if (normX >= 0.75f && normX <= 0.85f && safeAreaY >= -0.02f && safeAreaY <= 0.05f) {
            lastDialogTime = now;
            show(activity);
            return true;
        }

        return false;
    }

    /**
     * Shows a confirmation on the UI thread for the saved level plus one. Confirming
     * sends the skip-level command to Unity. Does nothing if the activity is null or
     * already finishing when called.
     */
    public static void show(final Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                int currentLevel = loadCurrentLevel(activity);
                final int nextLevel = currentLevel + 1;

                new AlertDialog.Builder(activity)
                        .setTitle("Skip to Next Level")
                        .setMessage("Do you want to skip to Level " + nextLevel + "?")
                        .setPositiveButton("Skip", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                skipLevel();
                            }
                        })
                        .setNegativeButton("Cancel", null)
                        .show();
            }
        });
    }

    /**
     * Reads Level from the first readable player-data candidate, trying the fixed
     * external path before app-specific external and internal storage. Missing files
     * and failures while reading or parsing are skipped; defaults to level 1.
     */
    private static int loadCurrentLevel(Activity activity) {
        File[] candidates = new File[]{
                new File("/sdcard/Android/data/com.tripledot.blackjack/files/SimpleStorage/PlayerData.json"),
                new File(activity.getExternalFilesDir(null), "SimpleStorage/PlayerData.json"),
                new File(activity.getFilesDir(), "SimpleStorage/PlayerData.json")
        };

        for (File file : candidates) {
            if (!file.exists()) {
                continue;
            }

            try (FileInputStream fis = new FileInputStream(file)) {
                byte[] data = new byte[(int) file.length()];
                int read = fis.read(data);
                String jsonStr = new String(data, 0, read, "UTF-8");
                JSONObject json = new JSONObject(jsonStr);
                JSONObject valueObj = json.getJSONObject("value");
                return valueObj.getInt("Level");
            } catch (Throwable t) {
                Log.e(TAG, "Failed reading " + file.getAbsolutePath(), t);
            }
        }

        return 1;
    }

    /**
     * Sends the skip-level command to the patched Unity message handler.
     * Reflection and invocation failures are suppressed; delivery is not confirmed.
     */
    private static void skipLevel() {
        try {
            Log.i(TAG, "Sending Unity message to skip level");
            Class<?> unityPlayerClass = Class.forName("com.unity3d.player.UnityPlayer");
            Method sendMethod = unityPlayerClass.getMethod(
                    "UnitySendMessage",
                    String.class,
                    String.class,
                    String.class
            );
            sendMethod.invoke(null, "BlackjackApplication", "CheckUpdateToVersion", "skip_level");
        } catch (Throwable t) {
            Log.e(TAG, "Failed to send Unity message to skip level", t);
        }
    }
}
