/*
 * Derived from zeldrisho/morphe-patches (GPL-3.0):
 * extensions/zalo/src/main/java/com/zeldrisho/zalo/extension/ZaloMicroGSupport.java
 * Modified by Nezumi-2711 on <2026-10-20>: simplified (no test seams, no refresh coalescing),
 * repackaged as app.template.extension.zalo.backup.
 */

package app.template.extension.zalo.backup;

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

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;

public final class ZaloMicroGSupport {
    private static final String PACKAGE = "app.revanced.android.gms";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private ZaloMicroGSupport() {}

    public static boolean checkGmsCore(Activity activity) {
        if (activity == null) return true;
        try {
            PackageInfo info = activity.getPackageManager().getPackageInfo(PACKAGE, 0);
            if (info.applicationInfo != null && info.applicationInfo.enabled) return true;
        } catch (PackageManager.NameNotFoundException missing) {
            NezumiLog.i(Patch.DRIVE_BACKUP_VIA_MICROG, "ZaloMicroGSupport", "microG (" + PACKAGE + ") not installed");
        } catch (RuntimeException failure) {
            NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, "ZaloMicroGSupport", "microG lookup failed, assuming installed", failure);
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
                        } catch (ActivityNotFoundException failure) {
                            NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, "ZaloMicroGSupport", "no browser for the microG page", failure);
                        }
                    })
                    .show();
            } catch (RuntimeException failure) {
                NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, "ZaloMicroGSupport", "microG dialog failed", failure);
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
                java.lang.reflect.Method refresh = target.getClass().getMethod("R6", String.class);
                refresh.invoke(target, accountName);
            } catch (ReflectiveOperationException | RuntimeException failure) {
                NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, "ZaloMicroGSupport", "account list refresh unavailable (R6)", failure);
            }
        }, 250);
    }
}