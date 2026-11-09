package software.santodan.extension.nuviomenu;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Process;

/** A separate process relaunches the app after terminating its cached runtime. */
public final class SettingsRestartActivity extends Activity {
    /** Native application startup is skipped only in the private restart process. */
    public static boolean isRestartProcess(Context context) {
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        if (manager == null) return false;
        java.util.List<ActivityManager.RunningAppProcessInfo> processes = manager.getRunningAppProcesses();
        if (processes != null) for (ActivityManager.RunningAppProcessInfo process : processes)
            if (process.pid == Process.myPid()) return (context.getPackageName() + ":santodan_restart").equals(process.processName);
        return false;
    }
    private static Intent launcher(Context context) {
        Intent launch = context.getPackageManager().getLeanbackLaunchIntentForPackage(context.getPackageName());
        if (launch == null) launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        if (launch == null || launch.getComponent() == null) throw new IllegalStateException("NuvioTV launcher is unavailable");
        return Intent.makeRestartActivityTask(launch.getComponent());
    }
    static void restart(Context context) {
        launcher(context); // Fail before leaving the native dialog if no launcher is enabled.
        context.startActivity(new Intent(context, SettingsRestartActivity.class)
            .putExtra("previousProcess", Process.myPid()).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
    }
    @Override public void onCreate(Bundle saved) {
        super.onCreate(saved);
        Intent launch = launcher(this);
        int previous = getIntent().getIntExtra("previousProcess", -1);
        if (previous > 0 && previous != Process.myPid()) Process.killProcess(previous);
        startActivity(launch);
        finish();
    }
}
