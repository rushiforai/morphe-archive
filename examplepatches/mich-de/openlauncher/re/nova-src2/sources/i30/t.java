package i30;

import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicBoolean f61338a = new AtomicBoolean(false);

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ u f61339b;

    public t(u uVar) {
        this.f61339b = uVar;
    }

    public final boolean a(i iVar, boolean z11) {
        r rVar;
        if (!z11) {
            int i5 = 1;
            while (true) {
                synchronized (this.f61339b) {
                    s sVar = this.f61339b.f61350s;
                    rVar = (r) sVar.f61337a;
                    if (rVar != null) {
                        sVar.f61337a = rVar.f61333t;
                    }
                }
                if (rVar == null || i5 <= 0) {
                    break;
                }
                if (!rVar.j()) {
                    f30.f.a(rVar.f61335v == 8);
                    rVar.m(iVar);
                    i5--;
                }
            }
            this.f61338a.set(rVar != null);
            if (rVar != null) {
                return true;
            }
        }
        return false;
    }
}
