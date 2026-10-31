package gf;

import b.o4;
import java.io.IOException;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes3.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f57451a;

    /* renamed from: b, reason: collision with root package name */
    public final w f57452b;

    /* renamed from: c, reason: collision with root package name */
    public final CopyOnWriteArrayList f57453c;

    public /* synthetic */ a0(CopyOnWriteArrayList copyOnWriteArrayList, int i5, w wVar) {
        this.f57453c = copyOnWriteArrayList;
        this.f57451a = i5;
        this.f57452b = wVar;
    }

    public long a(long j11) {
        long jF = wf.v.F(j11);
        if (jF == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        return jF;
    }

    public void b(r rVar) {
        Iterator it = this.f57453c.iterator();
        while (it.hasNext()) {
            z zVar = (z) it.next();
            wf.v.B(zVar.f57669a, new androidx.fragment.app.d(20, this, zVar.f57670b, rVar));
        }
    }

    public void c(m mVar, r rVar) {
        Iterator it = this.f57453c.iterator();
        while (it.hasNext()) {
            z zVar = (z) it.next();
            wf.v.B(zVar.f57669a, new y(this, zVar.f57670b, mVar, rVar, 1));
        }
    }

    public void d(m mVar, r rVar) {
        Iterator it = this.f57453c.iterator();
        while (it.hasNext()) {
            z zVar = (z) it.next();
            wf.v.B(zVar.f57669a, new y(this, zVar.f57670b, mVar, rVar, 0));
        }
    }

    public void e(m mVar, r rVar, IOException iOException, boolean z11) {
        Iterator it = this.f57453c.iterator();
        while (it.hasNext()) {
            z zVar = (z) it.next();
            wf.v.B(zVar.f57669a, new o4(this, zVar.f57670b, mVar, rVar, iOException, z11));
        }
    }

    public void f(m mVar, r rVar) {
        Iterator it = this.f57453c.iterator();
        while (it.hasNext()) {
            z zVar = (z) it.next();
            wf.v.B(zVar.f57669a, new y(this, zVar.f57670b, mVar, rVar, 2));
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public a0(int i5) {
        this(new CopyOnWriteArrayList(), 0, null);
        switch (i5) {
            case 1:
                this(new CopyOnWriteArrayList(), 0, null);
                break;
            default:
                break;
        }
    }
}
