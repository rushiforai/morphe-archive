package defpackage;

import android.content.res.AssetFileDescriptor;
import android.util.Log;
import androidx.work.impl.WorkDatabase;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.Callable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lc2 implements Callable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ lc2(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        int i = this.a;
        boolean z = true;
        int i2 = 0;
        Object obj = this.b;
        switch (i) {
            case 0:
                jc2 jc2Var = ((nc2) obj).g;
                jc2Var.getClass();
                m50.l();
                s26 s26Var = jc2Var.c;
                bh4 bh4Var = (bh4) s26Var.c;
                String str = (String) s26Var.b;
                if (new File((File) bh4Var.c, str).exists()) {
                    if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                        Log.v("FirebaseCrashlytics", "Found previous crash marker.", null);
                    }
                    new File((File) ((bh4) s26Var.c).c, str).delete();
                } else if (jc2Var.d() == null || !jc2Var.j.c()) {
                    z = false;
                }
                return Boolean.valueOf(z);
            case 1:
                WorkDatabase workDatabase = (WorkDatabase) ((pkf) obj).a;
                Long lA = workDatabase.t().a("next_job_scheduler_id");
                int iLongValue = lA != null ? (int) lA.longValue() : 0;
                int i3 = iLongValue == Integer.MAX_VALUE ? 0 : iLongValue + 1;
                ky9 ky9VarT = workDatabase.t();
                int i4 = 25;
                n01.c0(ky9VarT.a, false, true, new q58(ky9VarT, i4, new jy9("next_job_scheduler_id", Long.valueOf(i3))));
                if (iLongValue < 0 || iLongValue > Integer.MAX_VALUE) {
                    ky9 ky9VarT2 = workDatabase.t();
                    n01.c0(ky9VarT2.a, false, true, new q58(ky9VarT2, i4, new jy9("next_job_scheduler_id", 1L)));
                } else {
                    i2 = iLongValue;
                }
                return Integer.valueOf(i2);
            case 2:
                iv2 iv2Var = (iv2) ((a1a) obj).c;
                d1g d1gVar = (d1g) iv2Var.e;
                m2c m2cVar = (m2c) iv2Var.b;
                String str2 = d1gVar.b;
                m50.p();
                try {
                    HashMap mapC = d1g.c(m2cVar);
                    ku3 ku3Var = new ku3(str2, mapC);
                    ku3Var.D("User-Agent", "Crashlytics Android SDK/20.0.6");
                    ku3Var.D("X-CRASHLYTICS-DEVELOPER-TOKEN", "470fa2b4ae81cd56ecbcda9735803434cec591fa");
                    d1g.b(ku3Var, m2cVar);
                    String strConcat = "Requesting settings from ".concat(str2);
                    if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                        Log.d("FirebaseCrashlytics", strConcat, null);
                    }
                    String str3 = "Settings query params were: " + mapC;
                    if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                        Log.v("FirebaseCrashlytics", str3, null);
                    }
                    return d1gVar.d(ku3Var.r());
                } catch (IOException e) {
                    Log.e("FirebaseCrashlytics", "Settings request failed.", e);
                    return null;
                }
            default:
                return (AssetFileDescriptor) obj;
        }
    }
}
