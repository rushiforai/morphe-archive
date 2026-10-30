/*
 * Derived from zeldrisho/morphe-patches (GPL-3.0):
 * extensions/zalo/src/main/java/com/zeldrisho/zalo/extension/ZaloMicroGSupport.java
 * Modified by Nezumi-2711 on <2026-10-20>: simplified (no test seams, no refresh coalescing),
 * repackaged as app.template.extension.extension.
 */

package app.template.extension.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;

public final class ZaloMicroGSupport {
    private static final String PACKAGE = "app.revanced.android.gms";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private ZaloMicroGSupport() {}

    public static boolean checkGmsCore(Activity activity) {
        if (activity == null) return true;
        try {
            PackageInfo info = activity.getPackageManager().getPackageInfo(PACKAGE, 0);
            if (info.applicationInfo != null && info.applicationInfo.enabled) return true;
        } catch (PackageManager.NameNotFoundException ignored) {
        } catch (RuntimeException ignored) {
            return true;
        }
        if (!activity.isFinishing() && !activity.isDestroyed()) {
            try {
                new AlertDialog.Builder(activity)
                    .setTitle("microG required")
                    .setMessage("Google Drive backup and restore needs microG-RE.")
                    .setNegativeButton("Cancel", null)
                    .setPositiveButton("Install", (dialog, which) -> {
                        try {
                            activity.startActivity(new Intent(Intent.ACTION_VIEW,
                                Uri.parse("https://morphe.software/microg")));
                        } catch (ActivityNotFoundException ignored) {
                        }
                    })
                    .show();
            } catch (RuntimeException ignored) {
            }
        }
        return false;
    }

    public static void scheduleAccountRefresh(Object view, String accountName) {
        if (view == null || accountName == null || accountName.isEmpty()) return;
        WeakReference<Object> reference = new WeakReference<>(view);
        MAIN.postDelayed(() -> {
            Object target = reference.get();
            if (target == null) return;
            try {
                java.lang.reflect.Method refresh;
                try {
                    refresh = target.getClass().getMethod("P6", String.class);
                } catch (NoSuchMethodException ignored) {
                    refresh = target.getClass().getMethod("A6", String.class);
                }
                refresh.invoke(target, accountName);
            } catch (ReflectiveOperationException | RuntimeException ignored) {
            }
        }, 250);
    }
}