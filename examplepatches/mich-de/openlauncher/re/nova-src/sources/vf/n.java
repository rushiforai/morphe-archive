package vf;

import android.os.SystemClock;

/* loaded from: classes3.dex */
public final /* synthetic */ class n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p f92704a;

    public final void a(int i5) {
        p pVar = this.f92704a;
        synchronized (pVar) {
            int i11 = pVar.f92723i;
            if (i11 == 0 || pVar.f92719e) {
                if (i11 == i5) {
                    return;
                }
                pVar.f92723i = i5;
                if (i5 != 1 && i5 != 0 && i5 != 8) {
                    pVar.f92726l = pVar.a(i5);
                    pVar.f92718d.getClass();
                    long jElapsedRealtime = SystemClock.elapsedRealtime();
                    pVar.b(pVar.f92720f > 0 ? (int) (jElapsedRealtime - pVar.f92721g) : 0, pVar.f92722h, pVar.f92726l);
                    pVar.f92721g = jElapsedRealtime;
                    pVar.f92722h = 0L;
                    pVar.f92725k = 0L;
                    pVar.f92724j = 0L;
                    e0 e0Var = pVar.f92717c;
                    e0Var.f92658b.clear();
                    e0Var.f92660d = -1;
                    e0Var.f92661e = 0;
                    e0Var.f92662f = 0;
                }
            }
        }
    }
}
