package me.toidicakhia.extension.terabox;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Small overlay added to the task-center activity that reports what the clicker
 * is doing: whether it is clicking, paused behind an ad, and which control it
 * pressed last.
 */
@SuppressWarnings("unused")
public final class TeraboxTaskHud {

    private static final int BACKGROUND = 0xD9101418;

    private static final int ACCENT = 0xFF7BE3A1;

    private static final int TEXT = 0xFFEDEFF2;

    private static final int MAX_LABEL_LENGTH = 60;

    private static final Map<Activity, Holder> HOLDERS =
            Collections.synchronizedMap(new WeakHashMap<Activity, Holder>());

    private TeraboxTaskHud() {
    }

    static void status(WebView webView, String status) {
        final Activity activity = activity(webView);
        if (activity == null) {
            return;
        }

        Holder holder;
        synchronized (HOLDERS) {
            holder = HOLDERS.get(activity);
            if (holder == null) {
                holder = Holder.create(activity);
                if (holder == null) {
                    return;
                }
                HOLDERS.put(activity, holder);
            }
        }
        holder.attachTo(activity);
        holder.setStatus(status);
    }

    static void clicked(WebView webView, final String label) {
        final Activity activity = activity(webView);
        if (activity == null || label == null) {
            return;
        }

        final Holder holder;
        synchronized (HOLDERS) {
            holder = HOLDERS.get(activity);
        }
        if (holder == null) {
            return;
        }
        holder.post(activity, label);
    }

    static void hide(WebView webView) {
        final Activity activity = activity(webView);
        if (activity == null) {
            return;
        }

        final Holder holder;
        synchronized (HOLDERS) {
            holder = HOLDERS.remove(activity);
        }
        if (holder != null) {
            holder.detach();
        }
    }

    private static Activity activity(WebView webView) {
        if (webView == null) {
            return null;
        }

        Context context = webView.getContext();
        while (context != null) {
            if (context instanceof Activity) {
                return (Activity) context;
            }
            if (!(context instanceof ContextWrapper)) {
                return null;
            }
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static final class Holder {

        private final LinearLayout root;

        private final TextView title;

        private final TextView task;

        private final FrameLayout.LayoutParams params;

        private int clicks;

        private Holder(LinearLayout root, TextView title, TextView task,
                      FrameLayout.LayoutParams params) {
            this.root = root;
            this.title = title;
            this.task = task;
            this.params = params;
        }

        static Holder create(Activity activity) {
            try {
                // Application context so the view does not keep the activity
                // alive through the holder map.
                final Context context = activity.getApplicationContext();

                final LinearLayout root = new LinearLayout(context);
                root.setOrientation(LinearLayout.VERTICAL);
                root.setPadding(dp(context, 10), dp(context, 6), dp(context, 10), dp(context, 6));
                root.setClickable(false);
                root.setFocusable(false);

                final GradientDrawable background = new GradientDrawable();
                background.setColor(BACKGROUND);
                background.setCornerRadius(dp(context, 8));
                root.setBackground(background);

                final TextView title = new TextView(context);
                title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
                title.setTextColor(ACCENT);
                title.setText("Auto task");

                final TextView task = new TextView(context);
                task.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10);
                task.setTextColor(TEXT);
                task.setText("waiting for a task button");

                root.addView(title);
                root.addView(task);

                final FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
                params.gravity = Gravity.TOP | Gravity.START;
                params.leftMargin = dp(context, 8);
                params.topMargin = dp(context, 40);

                final Holder holder = new Holder(root, title, task, params);
                holder.attachTo(activity);
                return holder;
            } catch (Throwable throwable) {
                return null;
            }
        }

        void attachTo(Activity activity) {
            if (root.getParent() != null) {
                return;
            }
            try {
                final ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
                decor.addView(root, params);
            } catch (Throwable ignored) {
            }
        }

        void setStatus(String status) {
            title.setText("Auto task · " + status);
        }

        void post(Activity activity, final String label) {
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    clicks++;
                    task.setText(clicks + " · " + shorten(label));
                }
            });
        }

        void detach() {
            try {
                final ViewGroup parent = (ViewGroup) root.getParent();
                if (parent != null) {
                    parent.removeView(root);
                }
            } catch (Throwable ignored) {
            }
        }

        private static String shorten(String label) {
            final String value = label.replaceAll("\\s+", " ").trim();
            return value.length() > MAX_LABEL_LENGTH
                    ? value.substring(0, MAX_LABEL_LENGTH) + "…"
                    : value;
        }

        private static int dp(Context context, int value) {
            return Math.round(TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
        }
    }
}
