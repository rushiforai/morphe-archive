package pb0;

import java.util.LinkedList;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes5.dex */
public final class k extends AtomicBoolean implements ib0.i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f82531a;

    /* renamed from: b, reason: collision with root package name */
    public final l f82532b;

    /* renamed from: c, reason: collision with root package name */
    public final ib0.i f82533c;

    public /* synthetic */ k(l lVar, ib0.i iVar, int i5) {
        this.f82531a = i5;
        this.f82532b = lVar;
        this.f82533c = iVar;
    }

    @Override // ib0.i
    public final boolean a() {
        switch (this.f82531a) {
        }
        return this.f82532b.f82534a.f85789b;
    }

    @Override // ib0.i
    public final void b() {
        switch (this.f82531a) {
            case 0:
                if (compareAndSet(false, true)) {
                    rb0.h hVar = (rb0.h) this.f82533c;
                    l lVar = this.f82532b;
                    if (hVar.f85789b) {
                        return;
                    }
                    synchronized (hVar) {
                        LinkedList linkedList = hVar.f85788a;
                        if (!hVar.f85789b && linkedList != null) {
                            boolean zRemove = linkedList.remove(lVar);
                            if (zRemove) {
                                lVar.b();
                            }
                        }
                    }
                    return;
                }
                return;
            default:
                if (compareAndSet(false, true)) {
                    ((xb0.c) this.f82533c).d(this.f82532b);
                    return;
                }
                return;
        }
    }
}
