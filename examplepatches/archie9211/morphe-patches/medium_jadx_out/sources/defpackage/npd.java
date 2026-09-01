package defpackage;

import android.content.SharedPreferences;
import android.text.TextUtils;
import java.lang.ref.WeakReference;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class npd {
    public static WeakReference d;
    public final SharedPreferences a;
    public vwa b;
    public final ScheduledThreadPoolExecutor c;

    public npd(SharedPreferences sharedPreferences, ScheduledThreadPoolExecutor scheduledThreadPoolExecutor) {
        this.c = scheduledThreadPoolExecutor;
        this.a = sharedPreferences;
    }

    public final synchronized cpd a() {
        cpd cpdVar;
        String strZ = this.b.z();
        Pattern pattern = cpd.d;
        cpdVar = null;
        if (!TextUtils.isEmpty(strZ)) {
            String[] strArrSplit = strZ.split("!", -1);
            if (strArrSplit.length == 2) {
                cpdVar = new cpd(strArrSplit[0], strArrSplit[1]);
            }
        }
        return cpdVar;
    }

    public final synchronized void b() {
        this.b = vwa.j(this.a, this.c);
    }

    public final synchronized void c(cpd cpdVar) {
        this.b.D(cpdVar.c);
    }
}
