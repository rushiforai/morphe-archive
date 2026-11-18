package me.toidicakhia.extension.terabox;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Overlays for the task automation: a status card on the task-center activity
 * and a small pill on the ad activity that covers it.
 */
@SuppressWarnings("unused")
public final class TeraboxTaskHud {

    private static final int BACKGROUND = 0xD9101418;

    private static final int ACCENT = 0xFF7BE3A1;

    private static final int TEXT = 0xFFEDEFF2;

    private static final int MAX_LABEL_LENGTH = 60;

    private static final Map<Activity, Holder> HOLDERS =
            Collections.synchronizedMap(new WeakHashMap<Activity, Holder>());

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /**
     * The ad plays in its own Activity, which covers the task page and its HUD.
     * The pill is non-touchable, so the SDK's own skip/close controls still
     * receive every event.
     */
    private static WeakReference<Activity> adHost = new WeakReference<>(null);

    private static TextView adView;

    private TeraboxTaskHud() {
    }

    static void status(WebView webView, String status) {
        final Activity activity = activityOf(webView);
        final Holder holder = holder(activity, true);
        if (holder == null) {
            return;
        }
        holder.attachTo(activity);
        holder.setStatus(status);
    }

    static void clicked(WebView webView, final String label) {
        final Holder holder = holder(activityOf(webView), false);
        if (holder == null || label == null) {
            return;
        }
        holder.clicked(label);
    }

    static void note(WebView webView, final String reason) {
        final Holder holder = holder(activityOf(webView), false);
        if (holder == null || reason == null) {
            return;
        }
        holder.note(reason);
    }

    static void hide(WebView webView) {
        final Activity activity = activityOf(webView);
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

    /** The holder of an activity, created and registered only when asked. */
    private static Holder holder(Activity activity, boolean create) {
        if (activity == null) {
            return null;
        }
        synchronized (HOLDERS) {
            Holder holder = HOLDERS.get(activity);
            if (holder == null && create) {
                holder = Holder.create(activity);
                if (holder != null) {
                    HOLDERS.put(activity, holder);
                }
            }
            return holder;
        }
    }

    /**
     * Shows (or keeps) the "watching ad" pill on the Activity that is playing
     * the ad. It is re-added if the ad redraws its decor.
     */
    static void adOverlay(Activity activity, final String text) {
        if (activity == null) {
            return;
        }
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                try {
                    if (adHost.get() != activity) {
                        removeFromParent(adView);
                        adView = null;
                        adHost = new WeakReference<>(activity);
                    }
                    if (adView == null) {
                        // Application context so the pill does not keep the ad
                        // Activity alive after it is finished.
                        adView = createAdView(activity.getApplicationContext());
                    }
                    if (adView == null) {
                        return;
                    }
                    if (!text.equals(adView.getText().toString())) {
                        adView.setText(text);
                    }
                    final ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
                    if (decor == null) {
                        return;
                    }
                    if (adView.getParent() != decor) {
                        removeFromParent(adView);
                        decor.addView(adView, adParams(activity));
                        adView.bringToFront();
                    }
                } catch (Throwable ignored) {
                    // The ad window can go away between the post and this run.
                }
            }
        });
    }

    static void hideAdOverlay() {
        if (adView == null && adHost.get() == null) {
            return;
        }
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                removeFromParent(adView);
                adView = null;
                adHost = new WeakReference<>(null);
            }
        });
    }

    private static TextView createAdView(Context context) {
        try {
            final TextView view = new TextView(context);
            view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
            view.setTextColor(ACCENT);
            view.setPadding(dp(context, 12), dp(context, 5), dp(context, 12), dp(context, 5));
            view.setClickable(false);
            view.setFocusable(false);
            view.setFocusableInTouchMode(false);
            view.setSingleLine(true);

            final GradientDrawable background = new GradientDrawable();
            background.setColor(BACKGROUND);
            background.setCornerRadius(dp(context, 10));
            view.setBackground(background);
            return view;
        } catch (Throwable throwable) {
            return null;
        }
    }

    private static FrameLayout.LayoutParams adParams(Context context) {
        final FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        params.topMargin = dp(context, 28);
        return params;
    }

    private static void removeFromParent(View view) {
        try {
            if (view == null) {
                return;
            }
            final ViewGroup parent = (ViewGroup) view.getParent();
            if (parent != null) {
                parent.removeView(view);
            }
        } catch (Throwable ignored) {
        }
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }

    /** Walk a WebView's (possibly wrapped) context to the hosting Activity. */
    static Activity activityOf(WebView webView) {
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

                return new Holder(root, title, task, params);
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

        void clicked(final String label) {
            MAIN.post(new Runnable() {
                @Override
                public void run() {
                    clicks++;
                    task.setText(clicks + " · " + shorten(label));
                }
            });
        }

        void note(final String reason) {
            MAIN.post(new Runnable() {
                @Override
                public void run() {
                    task.setText(shorten(reason));
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
    }
}
