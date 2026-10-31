package r;

import android.view.View;

/* loaded from: classes2.dex */
public final class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final e f84707a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i f84708b;

    public g(i iVar, e eVar) {
        this.f84708b = iVar;
        this.f84707a = eVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        q.i iVar;
        i iVar2 = this.f84708b;
        q.k kVar = iVar2.f84727c;
        if (kVar != null && (iVar = kVar.f83236e) != null) {
            iVar.c(kVar);
        }
        View view = (View) iVar2.f84732h;
        if (view != null && view.getWindowToken() != null) {
            e eVar = this.f84707a;
            if (eVar.b()) {
                iVar2.f84739q = eVar;
            } else if (eVar.f83298e != null) {
                eVar.d(0, 0, false, false);
                iVar2.f84739q = eVar;
            }
        }
        iVar2.f84741s = null;
    }
}
