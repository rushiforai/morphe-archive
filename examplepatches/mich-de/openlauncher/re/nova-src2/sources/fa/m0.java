package fa;

import android.util.Log;
import com.google.android.gms.internal.measurement.ag;

/* loaded from: classes2.dex */
public abstract class m0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final StackTraceElement[] f54441a = new Throwable().getStackTrace();

    /* renamed from: b, reason: collision with root package name */
    public final ag f54442b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p0 f54443c;

    public m0(p0 p0Var) {
        this.f54443c = p0Var;
        this.f54442b = new ag(p0Var);
    }

    public final void a(ga.e eVar, int i5) {
        int i11;
        synchronized (this.f54443c.f54457c) {
            try {
                this.f54443c.c(i5, eVar, this.f54441a);
                int i12 = eVar.f57291c;
                if (i12 != -100 && i12 != -101 && !this.f54443c.f54457c.f54467d.d(i12)) {
                    Log.e("ModelWriter", "item: " + eVar + " container being set to: " + eVar.f57291c + ", not in the list of folders");
                }
                ga.e eVar2 = (ga.e) this.f54443c.f54457c.f54464a.get(i5);
                if (eVar2 == null || !((i11 = eVar2.f57291c) == -100 || i11 == -101)) {
                    this.f54443c.f54457c.f54465b.remove(eVar2);
                } else {
                    int i13 = eVar2.f57290b;
                    if ((i13 == 0 || i13 == 1 || i13 == 2 || i13 == 6) && !this.f54443c.f54457c.f54465b.contains(eVar2)) {
                        this.f54443c.f54457c.f54465b.add(eVar2);
                    }
                }
                this.f54442b.v();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
