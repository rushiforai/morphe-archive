package jf;

import java.util.ArrayDeque;
import java.util.List;

/* loaded from: classes3.dex */
public final class d extends ie.a implements f {

    /* renamed from: c, reason: collision with root package name */
    public long f69523c;

    /* renamed from: d, reason: collision with root package name */
    public f f69524d;

    /* renamed from: e, reason: collision with root package name */
    public long f69525e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f69526f;

    /* renamed from: g, reason: collision with root package name */
    public Object f69527g;

    public /* synthetic */ d() {
        this.f69526f = 2;
    }

    @Override // jf.f
    public final int a(long j11) {
        f fVar = this.f69524d;
        fVar.getClass();
        return fVar.a(j11 - this.f69525e);
    }

    @Override // jf.f
    public final List h(long j11) {
        f fVar = this.f69524d;
        fVar.getClass();
        return fVar.h(j11 - this.f69525e);
    }

    @Override // jf.f
    public final long p(int i5) {
        f fVar = this.f69524d;
        fVar.getClass();
        return fVar.p(i5) + this.f69525e;
    }

    public final void q() {
        switch (this.f69526f) {
            case 0:
                ArrayDeque arrayDeque = (ArrayDeque) ((ck.e) this.f69527g).f19980e;
                wf.a.i(arrayDeque.size() < 2);
                wf.a.e(!arrayDeque.contains(this));
                this.f61556b = 0;
                this.f69524d = null;
                arrayDeque.addFirst(this);
                return;
            case 1:
                e eVar = (e) this.f69527g;
                synchronized (eVar.f69529b) {
                    this.f61556b = 0;
                    this.f69524d = null;
                    d[] dVarArr = eVar.f69533f;
                    int i5 = eVar.f69535h;
                    eVar.f69535h = i5 + 1;
                    dVarArr[i5] = this;
                    if (!eVar.f69530c.isEmpty() && eVar.f69535h > 0) {
                        eVar.f69529b.notify();
                    }
                }
                return;
            default:
                kf.h hVar = (kf.h) ((k30.e) this.f69527g).f70933b;
                this.f61556b = 0;
                this.f69524d = null;
                hVar.f71517b.add(this);
                return;
        }
    }

    @Override // jf.f
    public final int r() {
        f fVar = this.f69524d;
        fVar.getClass();
        return fVar.r();
    }

    public final void t(long j11, f fVar, long j12) {
        this.f69523c = j11;
        this.f69524d = fVar;
        if (j12 != Long.MAX_VALUE) {
            j11 = j12;
        }
        this.f69525e = j11;
    }

    public /* synthetic */ d(g gVar, int i5) {
        this.f69526f = i5;
        this.f69527g = gVar;
    }
}
