package dev.skulldogged.cobalt.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.util.HashSet;
import java.util.Set;
import java.util.WeakHashMap;

final class CobaltDownloadsPageHook implements Application.ActivityLifecycleCallbacks {
    private static final String MAIN_ACTIVITY =
            "com.google.android.apps.youtube.app.watchwhile.MainActivity";
    private static final String ORIGINAL_PACKAGE = "com.google.android.youtube";
    private static final String DOWNLOADS_ENTRY_ID = "downloads_page_entry_point_container";
    private static final String[] DOWNLOADS_LABELS = {
            "fallback_downloads_top_link_title",
            "offline_videos_title"
    };

    private final Application application;
    private final WeakHashMap<Activity, ViewTreeObserver.OnGlobalLayoutListener> listeners =
            new WeakHashMap<>();

    private CobaltDownloadsPageHook(Application application) {
        this.application = application;
    }

    static void install(Object value) {
        if (value instanceof Application) {
            Application application = (Application) value;
            application.registerActivityLifecycleCallbacks(
                    new CobaltDownloadsPageHook(application)
            );
        }
    }

    static void open(Activity activity) {
        activity.startActivity(new Intent(activity, CobaltDownloadsActivity.class));
    }

    private void attach(Activity activity) {
        if (!MAIN_ACTIVITY.equals(activity.getClass().getName())
                || listeners.containsKey(activity)) {
            return;
        }
        View root = activity.getWindow().getDecorView();
        int entryId = resourceIdentifier(DOWNLOADS_ENTRY_ID, "id");
        Set<String> labels = localizedDownloadsLabels();
        long[] lastTextScan = {0};
        ViewTreeObserver.OnGlobalLayoutListener listener = () -> {
            View entry = entryId == 0 ? null : root.findViewById(entryId);
            if (entry != null) {
                intercept(entry, activity);
            }
            long now = System.currentTimeMillis();
            if (now - lastTextScan[0] >= 250) {
                lastTextScan[0] = now;
                interceptMatchingText(root, labels, activity);
            }
        };
        listeners.put(activity, listener);
        root.getViewTreeObserver().addOnGlobalLayoutListener(listener);
        listener.onGlobalLayout();
    }

    private Set<String> localizedDownloadsLabels() {
        Set<String> labels = new HashSet<>();
        labels.add("downloads");
        for (String resourceName : DOWNLOADS_LABELS) {
            int labelId = resourceIdentifier(resourceName, "string");
            if (labelId == 0) {
                continue;
            }
            String label = application.getString(labelId).trim();
            if (!label.isEmpty()) {
                labels.add(label.toLowerCase(java.util.Locale.ROOT));
            }
        }
        return labels;
    }

    private void interceptMatchingText(
            View view,
            Set<String> labels,
            Activity activity
    ) {
        CharSequence text = view instanceof TextView ? ((TextView) view).getText() : null;
        CharSequence description = view.getContentDescription();
        if (matches(labels, text) || matches(labels, description)) {
            intercept(clickTarget(view), activity);
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                interceptMatchingText(group.getChildAt(index), labels, activity);
            }
        }
    }

    private boolean matches(Set<String> labels, CharSequence actual) {
        if (actual == null) {
            return false;
        }
        String value = actual.toString().trim().toLowerCase(java.util.Locale.ROOT);
        for (String label : labels) {
            if (value.equals(label)
                    || value.startsWith(label + ",")
                    || value.startsWith(label + "\n")) {
                return true;
            }
        }
        return false;
    }

    private int resourceIdentifier(String name, String type) {
        int identifier = application.getResources().getIdentifier(
                name,
                type,
                application.getPackageName()
        );
        return identifier != 0
                ? identifier
                : application.getResources().getIdentifier(name, type, ORIGINAL_PACKAGE);
    }

    private View clickTarget(View match) {
        View current = match;
        View best = match;
        int maximumRowHeight = Math.round(
                160 * application.getResources().getDisplayMetrics().density
        );
        for (int depth = 0; depth < 8; depth++) {
            if (current.isClickable()) {
                return current;
            }
            if (!(current.getParent() instanceof View)) {
                break;
            }
            View parent = (View) current.getParent();
            if (parent.getHeight() > maximumRowHeight) {
                break;
            }
            best = parent;
            current = parent;
        }
        return best;
    }

    private void intercept(View target, Activity activity) {
        if (target == null || !target.isShown()) {
            return;
        }
        target.setOnClickListener(ignored -> open(activity));
        target.setClickable(true);
    }

    private void detach(Activity activity) {
        ViewTreeObserver.OnGlobalLayoutListener listener = listeners.remove(activity);
        if (listener == null) {
            return;
        }
        ViewTreeObserver observer = activity.getWindow().getDecorView().getViewTreeObserver();
        if (observer.isAlive()) {
            observer.removeOnGlobalLayoutListener(listener);
        }
    }

    @Override public void onActivityResumed(Activity activity) { attach(activity); }
    @Override public void onActivityPaused(Activity activity) { detach(activity); }
    @Override public void onActivityDestroyed(Activity activity) { detach(activity); }
    @Override public void onActivityCreated(Activity activity, Bundle state) { }
    @Override public void onActivityStarted(Activity activity) { }
    @Override public void onActivityStopped(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
}
