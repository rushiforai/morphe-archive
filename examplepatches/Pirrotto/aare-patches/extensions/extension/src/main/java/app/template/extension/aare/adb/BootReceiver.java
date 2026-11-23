package app.template.extension.aare.adb;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

import app.template.extension.aare.PatchSettings;

/** Starts AARE's integrated Shizuku after the phone starts, once it was paired and started once. */
public final class BootReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        if (!Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) return;
        if (!PatchSettings.isEnabled(context, PatchSettings.INTEGRATED_SHIZUKU)) return;
        if (!IntegratedShizuku.autoStart(context) || !IntegratedShizuku.isPaired(context)) return;
        if (!IntegratedShizuku.canWriteSecureSettings(context)) return;
        IntegratedShizukuService.bootStart(context);
    }
}
