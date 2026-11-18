/*
 * Copyright 2026 Morphe. Modified for Afterglow.
 * Afterglow for Android. Temporary adapter of "Open system share sheet" from
 * Morphe patches v2.2.0 (GPLv3), https://github.com/MorpheApp/morphe-patches.
 * See NOTICE. Rewired to the default-OFF iOS nativeShare key and native-share
 * ownership. Failed launches keep native sharing; pending placeholder dismissal
 * captures its controller and native-show token. Not an official Morphe file.
 * Portions provided "AS IS" without express or implied warranties, including
 * merchantability and fitness for a particular purpose.
 */
package app.afterglow.extension.navigation;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import java.lang.ref.WeakReference;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;

@SuppressWarnings("unused")
public final class MorpheFallbackNativeShare {
    public interface ActionSheetController {
        void afterglow_dismissShareSheet();
    }

    private static volatile WeakReference<ActionSheetController> controller = new WeakReference<>(null);

    private MorpheFallbackNativeShare() {}

    public static boolean isEnabled() {
        try {
            return InstalledTweaks.has("native-share") && LiteMode.effectiveBool("nativeShare");
        } catch (Throwable error) {
            Afterglow.error("MorpheFallbackNativeShare.isEnabled", error);
            return false;
        }
    }

    public static void setActionSheetController(ActionSheetController value) {
        // A controller is reused for multiple sheets. The new reference also acts
        // as a per-show token, including when the controller object stays the same.
        controller = new WeakReference<>(value);
    }

    /** True only once Android accepted the chooser launch; false preserves native sharing. */
    public static boolean openSystemShareSheet(byte[] endpoint) {
        if (!isEnabled()) return false;
        boolean launched = false;
        try {
            String url = MorpheFallbackShareEntity.url(endpoint);
            if (url == null) return false;
            Activity activity = Afterglow.mainActivity();
            Context context = activity;
            boolean newTask = activity == null || activity.isFinishing() || activity.isDestroyed();
            if (newTask) context = Afterglow.context();
            if (context == null) return false;
            Intent share = new Intent(Intent.ACTION_SEND).setType("text/plain")
                    .putExtra(Intent.EXTRA_TEXT, url);
            Intent chooser = Intent.createChooser(share, "");
            chooser.addFlags(Intent.FLAG_ACTIVITY_NO_USER_ACTION);
            if (newTask) chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            WeakReference<ActionSheetController> show = controller;
            ActionSheetController pending = show.get();
            context.startActivity(chooser);
            launched = true;

            // Always post: the same native command may still be showing its placeholder.
            // Capture before launch, and never dismiss a subsequent native sheet, even
            // when it reuses the same controller. The chooser can remain on screen.
            if (pending != null) Afterglow.runOnMainDelayed(() -> {
                if (controller != show) return;
                try { pending.afterglow_dismissShareSheet(); }
                catch (Throwable error) { Afterglow.error("MorpheFallbackNativeShare.dismiss", error); }
            }, 0);
        } catch (Throwable error) {
            Afterglow.error("MorpheFallbackNativeShare.openSystemShareSheet", error);
        }
        return launched;
    }
}
