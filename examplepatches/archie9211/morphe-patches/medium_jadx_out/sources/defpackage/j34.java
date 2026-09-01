package defpackage;

import android.util.Log;
import android.view.autofill.AutofillValue;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class j34 implements ha4, m33 {
    public static final j34 a = new j34();

    public static /* bridge */ /* synthetic */ AutofillValue a(Object obj) {
        return (AutofillValue) obj;
    }

    @Override // defpackage.ha4
    public void c(boolean z) {
        if (z) {
            fq1 fq1Var = fq1.a;
            if (ec2.a.contains(fq1.class)) {
                return;
            }
            try {
                fq1.f.set(true);
                return;
            } catch (Throwable th) {
                ec2.a(fq1.class, th);
                return;
            }
        }
        fq1 fq1Var2 = fq1.a;
        if (ec2.a.contains(fq1.class)) {
            return;
        }
        try {
            fq1.f.set(false);
        } catch (Throwable th2) {
            ec2.a(fq1.class, th2);
        }
    }

    @Override // defpackage.m33
    public void e(h8a h8aVar) {
        if (Log.isLoggable("FirebaseCrashlytics", 3)) {
            Log.d("FirebaseCrashlytics", "AnalyticsConnector now available.", null);
        }
        h8aVar.get().getClass();
        throw new ClassCastException();
    }
}
