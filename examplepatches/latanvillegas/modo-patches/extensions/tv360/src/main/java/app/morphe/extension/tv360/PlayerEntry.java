package app.morphe.extension.tv360;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.TextView;
import android.widget.FrameLayout;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * Adds an independent Media3 launcher on TV360's account screen only.
 * HomeBoxActivity also hosts the home feed and video playback, so the launcher
 * must be hidden everywhere except the visible account UI.
 */
public final class PlayerEntry {
    private static final String TAG = "morphe.tv360.external.entry";
    private static final WeakHashMap<Activity, EntryObserver> OBSERVERS = new WeakHashMap<>();

    private PlayerEntry() {}

    public static void install(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) return;
        FrameLayout root = (FrameLayout) content;

        // onResume may be called repeatedly; never add duplicate launchers.
        EntryObserver previous = OBSERVERS.get(activity);
        if (previous != null && previous.owns(root)) {
            previous.ensureVisible();
            return;
        }

        Button open = new Button(activity);
        open.setTag(TAG);
        open.setText("\u25B6 Mi reproductor");
        open.setVisibility(View.GONE);
        open.setAllCaps(false);
        open.setContentDescription("Abrir reproductor multimedia independiente");
        open.setTextColor(Color.WHITE);
        open.setTextSize(12f);
        open.setMinWidth(0);
        open.setMinimumWidth(0);
        open.setMinHeight(0);
        open.setMinimumHeight(0);
        open.setPadding(dp(activity, 12), dp(activity, 8),
                dp(activity, 12), dp(activity, 8));

        GradientDrawable background = new GradientDrawable();
        background.setColor(0xE6222222);
        background.setCornerRadius(dp(activity, 20));
        background.setStroke(dp(activity, 1), 0xFFE53935);
        open.setBackground(background);
        open.setElevation(dp(activity, 6));

        // The top bar already contains Subscribe, Alerts, Search and Profile.
        // Place the launcher immediately below it instead of covering controls.
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.END);
        params.topMargin = dp(activity, 60);
        params.rightMargin = dp(activity, 12);

        open.setOnClickListener(v -> {
            if (!activity.isFinishing() && !activity.isDestroyed()) {
                activity.startActivity(new Intent(activity, ExternalPlayerActivity.class));
            }
        });
        root.addView(open, params);

        EntryObserver observer = new EntryObserver(activity, root, open, params);
        OBSERVERS.put(activity, observer);
        root.getViewTreeObserver().addOnGlobalLayoutListener(observer);
    }

    // Match visible account-specific controls, never hidden fragments or video overlays.
    // Looking for two independent labels prevents the button from appearing on Inicio.
    private static boolean isAccountScreen(View root) {
        AccountMarkers markers = new AccountMarkers();
        findAccountMarkers(root, markers, 0);
        return markers.password && (markers.account || markers.profiles);
    }

    private static final class AccountMarkers {
        boolean account;
        boolean password;
        boolean profiles;
    }

    private static void findAccountMarkers(View view, AccountMarkers markers, int depth) {
        if (view == null || !view.isShown() || depth > 40 ||
                (markers.password && (markers.account || markers.profiles))) return;
        if (view instanceof TextView) {
            CharSequence value = ((TextView) view).getText();
            if (value != null) {
                String label = value.toString().trim();
                if ("Cuenta".equals(label)) markers.account = true;
                if ("Cambiar la contraseña".equals(label)) markers.password = true;
                if ("Gestión de perfiles".equals(label)) markers.profiles = true;
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                findAccountMarkers(group.getChildAt(index), markers, depth + 1);
            }
        }
    }

    private static int dp(Activity activity, int value) {
        return (int) (activity.getResources().getDisplayMetrics().density * value + 0.5f);
    }

    private static final class EntryObserver implements ViewTreeObserver.OnGlobalLayoutListener {
        private final WeakReference<Activity> activity;
        private final WeakReference<FrameLayout> root;
        private final WeakReference<Button> button;
        private final FrameLayout.LayoutParams params;

        EntryObserver(Activity activity, FrameLayout root, Button button,
                FrameLayout.LayoutParams params) {
            this.activity = new WeakReference<>(activity);
            this.root = new WeakReference<>(root);
            this.button = new WeakReference<>(button);
            this.params = params;
        }

        boolean owns(FrameLayout container) {
            return root.get() == container && button.get() != null;
        }

        void ensureVisible() {
            FrameLayout r = root.get();
            Button b = button.get();
            if (r == null || b == null) return;

            // Some TV360 navigation transitions replace the content child.
            // Reattach only to the same Android content root if it was removed.
            if (b.getParent() == null) {
                r.addView(b, params);
            }
            if (b.getParent() != r) return;
            int wanted = isAccountScreen(r) ? View.VISIBLE : View.GONE;
            if (b.getVisibility() != wanted) b.setVisibility(wanted);
            if (wanted == View.VISIBLE && r.getChildCount() > 0 &&
                    r.getChildAt(r.getChildCount() - 1) != b) {
                b.bringToFront();
            }
        }

        @Override public void onGlobalLayout() {
            Activity a = activity.get();
            FrameLayout r = root.get();
            if (a == null || r == null || button.get() == null ||
                    a.isFinishing() || a.isDestroyed()) {
                if (r != null && r.getViewTreeObserver().isAlive()) {
                    r.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
                return;
            }
            ensureVisible();
        }
    }
}
