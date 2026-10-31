package io.github.emotionbug.patches.runtime;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import java.io.IOException;

/** Model discovery is based only on pinned hashes, never download state or inference backend. */
final class ModelUpdateBadge {
    static final String ACKNOWLEDGED = "acknowledged_summary_models";
    private static final State UNAVAILABLE = new State("", false);

    private ModelUpdateBadge() { }

    /** Worker thread only. A recording-only patch does not even open summary assets. */
    static State observe(Context context) {
        try {
            if (!context.getPackageManager().getActivityInfo(new ComponentName(context,
                    SummarySettingsActivity.class), 0).enabled) return UNAVAILABLE;
            return state(context, identity(SummaryModel.get(context, SummaryModel.Role.GEMMA).sha256,
                    SummaryModel.get(context, SummaryModel.Role.WHISPER).sha256));
        } catch (PackageManager.NameNotFoundException | IOException | RuntimeException | LinkageError unavailable) {
            return UNAVAILABLE;
        }
    }

    static String identity(String gemma, String whisper) {
        if (gemma == null || whisper == null || !gemma.matches("[0-9a-f]{64}")
                || !whisper.matches("[0-9a-f]{64}")) return "";
        return gemma + ":" + whisper;
    }

    static State state(Context context, String identity) {
        return new State(identity, !identity.isEmpty()
                && !identity.equals(ExtensionSettings.local(context).getString(ACKNOWLEDGED, "")));
    }

    /** Called on a worker only after that exact model pair has rendered in model settings. */
    static boolean acknowledge(Context context, String displayedIdentity) {
        if (displayedIdentity == null || displayedIdentity.isEmpty()) return false;
        return ExtensionSettings.local(context).edit().putString(ACKNOWLEDGED, displayedIdentity).commit();
    }

    static final class State {
        final String identity;
        final boolean unseen;
        State(String identity, boolean unseen) { this.identity = identity; this.unseen = unseen; }
        boolean available() { return !identity.isEmpty(); }
    }
}
