package jk;

import android.os.RemoteException;
import android.util.Log;
import kk.m;

/* loaded from: classes3.dex */
public final class f extends kk.h {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f69578b = 0;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ fi.j f69579c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f69580d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f69581e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(h hVar, fi.j jVar, String str, fi.j jVar2) {
        super(jVar);
        this.f69581e = hVar;
        this.f69580d = str;
        this.f69579c = jVar2;
    }

    @Override // kk.h
    public final void a() {
        switch (this.f69578b) {
            case 0:
                fi.j jVar = this.f69579c;
                h hVar = (h) this.f69581e;
                String str = (String) this.f69580d;
                try {
                    hVar.f69588a.f71555m.N(hVar.f69589b, h.a(hVar, str), new g(hVar, jVar, str));
                    return;
                } catch (RemoteException e3) {
                    ex.a aVar = h.f69586e;
                    Object[] objArr = {str};
                    if (Log.isLoggable("PlayCore", 6)) {
                        Log.e("PlayCore", ex.a.m(aVar.f53057b, "requestUpdateInfo(%s)", objArr), e3);
                    } else {
                        aVar.getClass();
                    }
                    jVar.b(new RuntimeException(e3));
                    return;
                }
            default:
                synchronized (((m) this.f69581e).f71548f) {
                    try {
                        m mVar = (m) this.f69581e;
                        fi.j jVar2 = this.f69579c;
                        mVar.f71547e.add(jVar2);
                        jVar2.f55135a.b(new c10.a(24, mVar, jVar2));
                        if (((m) this.f69581e).f71553k.getAndIncrement() > 0) {
                            ((m) this.f69581e).f71544b.i("Already connected to the service.", new Object[0]);
                        }
                        m.b((m) this.f69581e, (f) this.f69580d);
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(m mVar, fi.j jVar, fi.j jVar2, f fVar) {
        super(jVar);
        this.f69581e = mVar;
        this.f69579c = jVar2;
        this.f69580d = fVar;
    }
}
