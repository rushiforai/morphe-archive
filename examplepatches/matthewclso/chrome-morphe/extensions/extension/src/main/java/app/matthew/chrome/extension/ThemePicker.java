package app.matthew.chrome.extension;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;

public final class ThemePicker {
    private static int binding;
    private ThemePicker() {}
    public static void beginBinding() { binding++; }
    public static void nativeChoice(Object preference) {
        if (binding != 0 || !PatchSettings.enabled(PatchSettings.BLACK)) return;
        PatchSettings.set(PatchSettings.BLACK, false);
        View choice = NativeBridge.themeChoices(preference).get(0);
        choice.post(() -> {
            // Black and Dark share Chrome's dark setting, so selecting Dark need not trigger
            // Chrome's configuration observer. Recreate to restore its original drawables.
            Activity activity = activity(choice.getContext());
            if (NativeBridge.themeSetting() == 2 && activity != null && !activity.isDestroyed()) activity.recreate();
        });
    }
    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper && !(context instanceof Activity)) context = ((ContextWrapper)context).getBaseContext();
        return context instanceof Activity ? (Activity)context : null;
    }
    public static void finishBinding(Object preference) { binding = Math.max(0, binding - 1); }
}
