package app.template.extension.firefoxfocus;

import android.app.Activity;
import android.app.AlertDialog;
import android.util.Log;

import org.mozilla.geckoview.AllowOrDeny;
import org.mozilla.geckoview.GeckoResult;
import org.mozilla.geckoview.WebExtension;
import org.mozilla.geckoview.WebExtensionController;

/**
 * Answers GeckoView's add-on prompts, which Focus's own delegate (Android Components) would leave
 * waiting forever. The controller registers its prompt listeners on the UI thread, so every
 * method here runs there.
 *
 * <ul>
 *   <li>Install, started from the Extensions manager: allowed, with private browsing (every Focus
 *   tab is private) and without the optional technical-data collection.</li>
 *   <li>Install from anywhere else (e.g. a web page): a dialog lists the permissions; denied when
 *   Focus is not on screen.</li>
 *   <li>Update that needs new permissions, optional permission request: a dialog; denied when
 *   Focus is not on screen (an update is retried at the next check).</li>
 * </ul>
 *
 * The 158.0 PromptDelegate interface has only these three methods, so there is nothing left to
 * forward to the wrapped delegate.
 */
final class AddonPromptDelegate implements WebExtensionController.PromptDelegate {

    @Override
    public GeckoResult<WebExtension.PermissionPromptResponse> onInstallPromptRequest(
            WebExtension extension, String[] permissions, String[] origins, String[] dataCollectionPermissions) {
        GeckoResult<WebExtension.PermissionPromptResponse> result = new GeckoResult<>();
        try {
            if (extension != null && AddonsManager.isPendingInstall(extension.id)) {
                result.complete(response(true));
                return result;
            }
            Activity activity = FocusAddons.foregroundActivity();
            if (activity == null) {
                result.complete(response(false));
                return result;
            }
            String name = FocusAddons.nameOf(extension);
            confirm(activity, "Add " + name + "?",
                    permissionText("It requests:", permissions, origins, dataCollectionPermissions)
                            + "\n\nAdd-ons run in private mode, like every Focus tab.",
                    "Add",
                    allowed -> result.complete(response(allowed)));
        } catch (Throwable t) {
            Log.e(FocusAddons.TAG, "onInstallPromptRequest", t);
            completeQuietly(result, response(false));
        }
        return result;
    }

    @Override
    public GeckoResult<AllowOrDeny> onUpdatePrompt(
            WebExtension extension, String[] newPermissions, String[] newOrigins, String[] newDataCollectionPermissions) {
        GeckoResult<AllowOrDeny> result = new GeckoResult<>();
        try {
            if (isEmpty(newPermissions) && isEmpty(newOrigins) && isEmpty(newDataCollectionPermissions)) {
                result.complete(AllowOrDeny.ALLOW);
                return result;
            }
            Activity activity = FocusAddons.foregroundActivity();
            if (activity == null) {
                result.complete(AllowOrDeny.DENY);
                return result;
            }
            confirm(activity, "Update " + FocusAddons.nameOf(extension) + "?",
                    permissionText("The new version also requests:", newPermissions, newOrigins,
                            newDataCollectionPermissions),
                    "Update",
                    allowed -> result.complete(allowed ? AllowOrDeny.ALLOW : AllowOrDeny.DENY));
        } catch (Throwable t) {
            Log.e(FocusAddons.TAG, "onUpdatePrompt", t);
            completeQuietly(result, AllowOrDeny.DENY);
        }
        return result;
    }

    @Override
    public GeckoResult<AllowOrDeny> onOptionalPrompt(
            WebExtension extension, String[] permissions, String[] origins, String[] dataCollectionPermissions) {
        GeckoResult<AllowOrDeny> result = new GeckoResult<>();
        try {
            Activity activity = FocusAddons.foregroundActivity();
            if (activity == null) {
                result.complete(AllowOrDeny.DENY);
                return result;
            }
            confirm(activity, FocusAddons.nameOf(extension) + " asks for more access",
                    permissionText("It requests:", permissions, origins, dataCollectionPermissions),
                    "Allow",
                    allowed -> result.complete(allowed ? AllowOrDeny.ALLOW : AllowOrDeny.DENY));
        } catch (Throwable t) {
            Log.e(FocusAddons.TAG, "onOptionalPrompt", t);
            completeQuietly(result, AllowOrDeny.DENY);
        }
        return result;
    }

    // ---------------------------------------------------------------------------------------

    interface Answer {
        void onAnswer(boolean allowed);
    }

    /**
     * A yes/no dialog that answers exactly once: true for the positive button, false for the
     * negative button, back, a tap outside, the Activity being destroyed (its dialog's dismiss
     * listener does not fire then), or a dialog that cannot be shown.
     */
    static void confirm(Activity activity, String title, String message, String positive, Answer answer) {
        boolean[] answered = {false};
        Runnable[] cancelDestroyHook = {null};
        Answer once = allowed -> {
            if (answered[0]) return;
            answered[0] = true;
            if (cancelDestroyHook[0] != null) cancelDestroyHook[0].run();
            try {
                answer.onAnswer(allowed);
            } catch (Throwable t) {
                Log.e(FocusAddons.TAG, "confirm answer", t);
            }
        };
        try {
            AlertDialog shown = AddonsManager.show(new AlertDialog.Builder(activity, AddonsManager.alertTheme(activity))
                    .setTitle(title)
                    .setMessage(message)
                    .setPositiveButton(positive, (dialog, which) -> once.onAnswer(true))
                    .setNegativeButton("Cancel", (dialog, which) -> once.onAnswer(false))
                    .setOnDismissListener(dialog -> once.onAnswer(false)), activity);
            if (!answered[0]) {
                cancelDestroyHook[0] = FocusAddons.onDestroyed(activity, () -> {
                    once.onAnswer(false);
                    AddonsManager.dismissQuietly(shown);
                });
            }
        } catch (Throwable t) {
            Log.e(FocusAddons.TAG, "confirm", t);
            once.onAnswer(false);
        }
    }

    private static WebExtension.PermissionPromptResponse response(boolean allowed) {
        Boolean granted = allowed ? Boolean.TRUE : Boolean.FALSE;
        return new WebExtension.PermissionPromptResponse(granted, granted, Boolean.FALSE);
    }

    private static <T> void completeQuietly(GeckoResult<T> result, T value) {
        try {
            result.complete(value);
        } catch (Throwable ignored) {
            // Already completed.
        }
    }

    private static boolean isEmpty(String[] values) {
        return values == null || values.length == 0;
    }

    private static String permissionText(String heading, String[] permissions, String[] origins, String[] data) {
        StringBuilder text = new StringBuilder();
        append(text, permissions);
        append(text, origins);
        append(text, data);
        if (text.length() == 0) return "It requests no special permissions.";
        return heading + text;
    }

    private static void append(StringBuilder text, String[] values) {
        if (values == null) return;
        for (String value : values) {
            if (value != null && !value.isEmpty()) text.append("\n• ").append(value);
        }
    }
}
