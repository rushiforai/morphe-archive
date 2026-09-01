package androidx.profileinstaller;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Process;
import android.util.Log;
import defpackage.b70;
import defpackage.n01;
import defpackage.o6;
import defpackage.pwd;
import defpackage.zm7;
import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ProfileInstallReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        Bundle extras;
        if (intent == null) {
            return;
        }
        String action = intent.getAction();
        if ("androidx.profileinstaller.action.INSTALL_PROFILE".equals(action)) {
            n01.i0(context, new b70(1), new zm7(22, this), true);
            return;
        }
        if ("androidx.profileinstaller.action.SKIP_FILE".equals(action)) {
            Bundle extras2 = intent.getExtras();
            if (extras2 != null) {
                String string = extras2.getString("EXTRA_SKIP_FILE_OPERATION");
                if (!"WRITE_SKIP_FILE".equals(string)) {
                    if ("DELETE_SKIP_FILE".equals(string)) {
                        new File(context.getFilesDir(), "profileinstaller_profileWrittenFor_lastUpdateTime.dat").delete();
                        Log.d("ProfileInstaller", "RESULT_DELETE_SKIP_FILE_SUCCESS");
                        setResultCode(11);
                        return;
                    }
                    return;
                }
                zm7 zm7Var = new zm7(22, this);
                try {
                    n01.b0(context.getPackageManager().getPackageInfo(context.getApplicationContext().getPackageName(), 0), context.getFilesDir());
                    zm7Var.Q(10, null);
                    return;
                } catch (PackageManager.NameNotFoundException e) {
                    zm7Var.Q(7, e);
                    return;
                }
            }
            return;
        }
        if ("androidx.profileinstaller.action.SAVE_PROFILE".equals(action)) {
            zm7 zm7Var2 = new zm7(22, this);
            int iMyPid = Process.myPid();
            if (Build.VERSION.SDK_INT < 24) {
                zm7Var2.Q(13, null);
                return;
            } else {
                Process.sendSignal(iMyPid, 10);
                zm7Var2.Q(12, null);
                return;
            }
        }
        if (!"androidx.profileinstaller.action.BENCHMARK_OPERATION".equals(action) || (extras = intent.getExtras()) == null) {
            return;
        }
        String string2 = extras.getString("EXTRA_BENCHMARK_OPERATION");
        zm7 zm7Var3 = new zm7(22, this);
        if ("DROP_SHADER_CACHE".equals(string2)) {
            int i = Build.VERSION.SDK_INT;
            if (pwd.H(i >= 34 ? o6.d(context).getCacheDir() : i >= 24 ? o6.d(context).getCodeCacheDir() : i == 23 ? context.getCodeCacheDir() : context.getCacheDir())) {
                zm7Var3.Q(14, null);
                return;
            } else {
                zm7Var3.Q(15, null);
                return;
            }
        }
        if (!"SAVE_PROFILE".equals(string2)) {
            zm7Var3.Q(16, null);
            return;
        }
        int i2 = extras.getInt("EXTRA_PID", Process.myPid());
        if (Build.VERSION.SDK_INT < 24) {
            zm7Var3.Q(13, null);
        } else {
            Process.sendSignal(i2, 10);
            zm7Var3.Q(12, null);
        }
    }
}
