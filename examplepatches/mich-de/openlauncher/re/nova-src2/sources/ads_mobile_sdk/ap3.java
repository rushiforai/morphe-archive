package ads_mobile_sdk;

import android.app.AppOpsManager$OnOpActiveChangedListener;

/* loaded from: classes2.dex */
public final class ap3 implements AppOpsManager$OnOpActiveChangedListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ bp3 f1059a;

    public ap3(bp3 bp3Var) {
        this.f1059a = bp3Var;
    }

    public final void onOpActiveChanged(String str, int i5, String str2, boolean z11) {
        synchronized (this.f1059a) {
            try {
                if (z11) {
                    bp3 bp3Var = this.f1059a;
                    bp3Var.f1481a.getClass();
                    bp3Var.f1484d = System.currentTimeMillis();
                    this.f1059a.f1487g = true;
                } else {
                    this.f1059a.f1481a.getClass();
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    bp3 bp3Var2 = this.f1059a;
                    long j11 = bp3Var2.f1485e;
                    if (j11 > 0 && jCurrentTimeMillis >= j11) {
                        bp3Var2.f1486f = jCurrentTimeMillis - j11;
                    }
                    bp3Var2.f1487g = false;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
