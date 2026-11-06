package io.agrokenga.extension;

import android.app.Activity;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Small, touch-through log console for the bottom of the game screen.
 *
 * <p>The panel is added to the activity's own content view, so no
 * {@code SYSTEM_ALERT_WINDOW} permission is needed. It shows the logcat output
 * of this process only, which includes Unity's {@code Debug.Log}, native
 * {@code __android_log_print}, and Java {@code Log} messages.</p>
 */
public final class GameLogOverlay {
    private static final int MAX_LINES = 2000;
    private static final long FLUSH_INTERVAL_MS = 120L;
    private static final int PANEL_HEIGHT_PERCENT = 30;
    private static final int EDGE_PADDING_DP = 8;
    private static final int INNER_PADDING_DP = 4;
    private static final float TEXT_SIZE_SP = 9f;

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final Object LOCK = new Object();
    private static final ArrayDeque<String> PENDING = new ArrayDeque<>();

    private static WeakReference<Activity> activityRef;
    private static FrameLayout panel;
    private static ScrollView scrollView;
    private static TextView outputView;
    private static int lineCount;
    private static boolean logcatStarted;
    private static boolean flushScheduled;

    private GameLogOverlay() {
    }

    /**
     * Called from the patched {@code UnityPlayerActivity.onCreate}. The actual
     * view is posted so it is added after the Unity content view exists.
     */
    public static void attach(Activity activity) {
        if (activity == null) {
            return;
        }
        synchronized (GameLogOverlay.class) {
            Activity installed = activityRef == null ? null : activityRef.get();
            if (installed == activity) {
                return;
            }
            activityRef = new WeakReference<>(activity);
        }

        // Do not touch the window decor here: onCreate has not called
        // requestWindowFeature()/setContentView() yet, and forcing decor
        // creation early would make the game's requestWindowFeature() throw.
        // Posting to the main looper runs after onCreate/onResume completes.
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                Activity current = activityRef.get();
                if (current == null || current.isFinishing()) {
                    return;
                }
                install(current);
                enqueue("--- game log (pid " + android.os.Process.myPid() + ") ---");
                startLogcat();
            }
        });
    }

    private static void install(final Activity activity) {
        if (panel != null && panel.getContext() == activity) {
            return;
        }

        lineCount = 0;
        final float density = activity.getResources().getDisplayMetrics().density;
        final int edge = Math.round(EDGE_PADDING_DP * density);
        final int inner = Math.max(2, Math.round(INNER_PADDING_DP * density));

        // Returning false from dispatchTouchEvent lets touches continue to the
        // Unity view underneath, so the panel never blocks gameplay input.
        panel = new FrameLayout(activity) {
            @Override
            public boolean dispatchTouchEvent(MotionEvent event) {
                return false;
            }
        };
        panel.setBackgroundColor(0xCC000000);
        panel.setPadding(inner, inner, inner, inner);

        int initialHeight = Math.max(
                1,
                Math.round(activity.getResources().getDisplayMetrics().heightPixels
                        * PANEL_HEIGHT_PERCENT / 100f)
        );
        FrameLayout.LayoutParams panelParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                initialHeight,
                Gravity.BOTTOM
        );
        panelParams.setMargins(edge, edge, edge, edge);
        panel.setLayoutParams(panelParams);

        scrollView = new ScrollView(activity);
        scrollView.setFillViewport(true);
        scrollView.setVerticalScrollBarEnabled(true);

        outputView = new TextView(activity);
        outputView.setTextColor(0xFF7CFF7C);
        outputView.setTextSize(TypedValue.COMPLEX_UNIT_SP, TEXT_SIZE_SP);
        outputView.setTypeface(Typeface.MONOSPACE);
        outputView.setHorizontallyScrolling(false);
        outputView.setTextIsSelectable(false);
        scrollView.addView(outputView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        panel.addView(scrollView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));

        final ViewGroup root;
        View content = activity.findViewById(android.R.id.content);
        if (content instanceof ViewGroup) {
            root = (ViewGroup) content;
        } else {
            root = (ViewGroup) activity.getWindow().getDecorView();
        }
        root.addView(panel);
        panel.bringToFront();

        root.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(
                    View view,
                    int left,
                    int top,
                    int right,
                    int bottom,
                    int oldLeft,
                    int oldTop,
                    int oldRight,
                    int oldBottom
            ) {
                int height = bottom - top;
                if (height <= 0 || panel == null) {
                    return;
                }
                int target = Math.max(1, Math.round(height * PANEL_HEIGHT_PERCENT / 100f));
                ViewGroup.LayoutParams params = panel.getLayoutParams();
                if (params.height != target) {
                    params.height = target;
                    panel.setLayoutParams(params);
                }
            }
        });
    }

    private static void startLogcat() {
        synchronized (GameLogOverlay.class) {
            if (logcatStarted) {
                return;
            }
            logcatStarted = true;
        }
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                final int pid = android.os.Process.myPid();
                final boolean canUsePid = Build.VERSION.SDK_INT >= Build.VERSION_CODES.N;
                try {
                    ProcessBuilder builder = canUsePid
                            ? new ProcessBuilder("logcat", "-v", "threadtime", "--pid=" + pid)
                            : new ProcessBuilder("logcat", "-v", "brief");
                    builder.redirectErrorStream(true);

                    Process process = builder.start();
                    BufferedReader reader = new BufferedReader(
                            new InputStreamReader(process.getInputStream())
                    );
                    Pattern pidPattern = Pattern.compile("\\(\\s*(\\d+)\\s*\\)");
                    String line;
                    while ((line = reader.readLine()) != null) {
                        if (!canUsePid) {
                            Matcher matcher = pidPattern.matcher(line);
                            if (!matcher.find()
                                    || Integer.parseInt(matcher.group(1)) != pid) {
                                continue;
                            }
                        }
                        enqueue(line);
                    }
                } catch (Throwable throwable) {
                    enqueue("logcat unavailable: " + throwable);
                }
            }
        }, "GameLogOverlay-logcat");
        thread.setDaemon(true);
        thread.start();
    }

    private static void enqueue(String line) {
        if (line == null) {
            return;
        }
        synchronized (LOCK) {
            if (PENDING.size() >= MAX_LINES) {
                PENDING.removeFirst();
            }
            PENDING.addLast(line);
            if (flushScheduled) {
                return;
            }
            flushScheduled = true;
        }
        MAIN_HANDLER.postDelayed(FLUSH_RUNNABLE, FLUSH_INTERVAL_MS);
    }

    private static final Runnable FLUSH_RUNNABLE = new Runnable() {
        @Override
        public void run() {
            final String batch;
            synchronized (LOCK) {
                if (PENDING.isEmpty()) {
                    flushScheduled = false;
                    return;
                }
                StringBuilder builder = new StringBuilder();
                while (!PENDING.isEmpty()) {
                    builder.append(PENDING.removeFirst()).append('\n');
                }
                batch = builder.toString();
                flushScheduled = false;
            }

            final TextView view = outputView;
            if (view == null) {
                return;
            }
            view.append(batch);
            lineCount += countLines(batch);
            trim(view);

            final ScrollView scroller = scrollView;
            if (scroller != null) {
                scroller.post(new Runnable() {
                    @Override
                    public void run() {
                        scroller.fullScroll(View.FOCUS_DOWN);
                    }
                });
            }
        }
    };

    private static int countLines(String text) {
        int count = 0;
        for (int i = 0; i < text.length(); i++) {
            if (text.charAt(i) == '\n') {
                count++;
            }
        }
        return count;
    }

    private static void trim(TextView view) {
        if (lineCount <= MAX_LINES) {
            return;
        }
        CharSequence text = view.getText();
        int toRemove = lineCount - MAX_LINES;
        int index = 0;
        int removed = 0;
        while (removed < toRemove && index < text.length()) {
            if (text.charAt(index) == '\n') {
                removed++;
            }
            index++;
        }
        if (index > 0) {
            view.setText(text.subSequence(index, text.length()));
            lineCount -= removed;
        }
    }
}
