package app.matthew.chrome.extension;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.ViewTreeObserver;

/** Remembers only a mode bit; tab restoration and authentication remain native. */
public final class ModeRouting {
    private ModeRouting() {}

    private static boolean enabled() {
        return NativeBridge.rememberModeFeatureEnabled() && PatchSettings.enabled(PatchSettings.REMEMBER_MODE);
    }

    private static boolean launcher(Intent intent) {
        return intent != null && Intent.ACTION_MAIN.equals(intent.getAction())
                && intent.hasCategory(Intent.CATEGORY_LAUNCHER);
    }

    public static void remember(Activity activity) {
        if (!NativeBridge.rememberModeFeatureEnabled() || !activity.getClass().getName().startsWith(
                "org.chromium.chrome.browser.ChromeTabbedActivity")) return;
        // A pause can occur during startup. Never replace the remembered choice
        // with the temporary regular model before Chrome finishes restoration.
        if (NativeBridge.tabsReady(activity)) {
            PatchSettings.rememberMode(NativeBridge.isIncognito(activity));
        }
    }

    public static boolean initialIncognito(Activity activity, boolean original) {
        return original || (enabled() && launcher(activity.getIntent())
                && Boolean.TRUE.equals(PatchSettings.lastMode()) && NativeBridge.incognitoAllowed(activity));
    }

    public static boolean externalIncognito(Activity activity, boolean original, Intent intent) {
        if (original) return true; // Keep explicit, natively validated private requests.
        if (!enabled() || intent == null || !Intent.ACTION_VIEW.equals(intent.getAction())) return false;
        String scheme = intent.getScheme();
        if (!"https".equalsIgnoreCase(scheme) && !"http".equalsIgnoreCase(scheme)) return false;
        Boolean remembered = PatchSettings.lastMode();
        boolean incognito = remembered != null ? remembered
                : NativeBridge.tabsReady(activity) && NativeBridge.isIncognito(activity);
        return incognito && NativeBridge.incognitoAllowed(activity);
    }

    public static void onLauncher(Activity activity) {
        Intent intent = activity.getIntent();
        if (!enabled() || !launcher(intent)) return;
        Boolean remembered = PatchSettings.lastMode();
        if (remembered == null) return; // First use retains Chrome's restored/default mode.
        View decor = activity.getWindow().getDecorView();
        decor.post(() -> {
            ViewTreeObserver.OnPreDrawListener restore = new ViewTreeObserver.OnPreDrawListener() {
                @Override public boolean onPreDraw() {
                    boolean cancelled = activity.isFinishing() || activity.isDestroyed()
                            || activity.getIntent() != intent || !enabled();
                    if (!cancelled && !NativeBridge.tabsReady(activity)) return true;
                    if (decor.getViewTreeObserver().isAlive()) {
                        decor.getViewTreeObserver().removeOnPreDrawListener(this);
                    }
                    if (cancelled) return true;
                    boolean target = remembered && NativeBridge.incognitoAllowed(activity);
                    if (NativeBridge.isIncognito(activity) == target) return true;
                    if (NativeBridge.tabCount(activity, target) == 0) {
                        String name = target ? "new_incognito_tab_menu_id" : "new_tab_menu_id";
                        int id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
                        if (id != 0) NativeBridge.newTab(activity, id);
                    } else {
                        NativeBridge.selectModel(activity, target);
                    }
                    return true;
                }
            };
            decor.getViewTreeObserver().addOnPreDrawListener(restore);
            restore.onPreDraw();
        });
    }
}
