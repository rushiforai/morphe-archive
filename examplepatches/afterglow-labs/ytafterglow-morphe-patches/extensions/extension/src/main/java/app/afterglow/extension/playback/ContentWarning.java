package app.afterglow.extension.playback;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;

/**
 * iOS {@code noContentWarning} ("Skip content warning"; tweak "content-warning"). iOS
 * confirms YouTube's sensitive content alert as soon as it would show; here the viewer
 * discretion answers read as "allowed", which is what YouTube records when the viewer
 * accepts the dialog.
 */
@SuppressWarnings("unused")
public final class ContentWarning {
    private ContentWarning() {}

    /** Injection point: adult or controversial content allowed by the viewer. */
    public static boolean allowContent(boolean original) {
        try {
            return original || (InstalledTweaks.has("content-warning") && LiteMode.effectiveBool("noContentWarning"));
        } catch (Throwable error) {
            Afterglow.error("ContentWarning.allowContent", error);
            return original;
        }
    }
}
