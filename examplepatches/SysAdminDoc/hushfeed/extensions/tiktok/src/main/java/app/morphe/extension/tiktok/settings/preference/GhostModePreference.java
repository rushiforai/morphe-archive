/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.settings.preference;

import android.content.Context;
import android.os.Build;
import android.view.View;

import app.morphe.extension.tiktok.ghostmode.GhostMode;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.Settings;

/** The switch stays usable when a hook fails, while its process-local warning stays visible. */
@SuppressWarnings("deprecation")
public final class GhostModePreference extends TogglePreference {
    private final Runnable changed = this::notifyChanged;

    public GhostModePreference(Context context) {
        super(context, "Ghost mode", "", Settings.GHOST_MODE);
    }

    @Override public CharSequence getSummary() {
        String text;
        switch (GhostMode.status()) {
            case OFF:
                text = "Off. TikTok can report views and typing.";
                break;
            case PAUSED:
                text = "Hushfeed is paused. Ghost mode isn't active.";
                break;
            case PROBLEM:
                text = "Problem detected. Story views may still be reported. Check Ghost mode diagnostics. The warning stays until TikTok restarts.";
                break;
            case BLOCKED:
                text = "Reporting calls were blocked here. Viewer-list privacy hasn't been verified.";
                break;
            default:
                text = "On. No reporting call has been observed in this process.";
                break;
        }
        return L10n.t(getContext(), text);
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        GhostMode.observe(changed);
        if (Build.VERSION.SDK_INT >= 30) {
            view.setStateDescription(GhostMode.status() == GhostMode.Status.PROBLEM
                    ? L10n.t(getContext(), "Problem detected.") : null);
        }
    }
}
