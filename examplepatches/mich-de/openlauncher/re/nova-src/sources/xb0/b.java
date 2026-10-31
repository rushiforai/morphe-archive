package xb0;

import ib0.i;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes5.dex */
public final class b implements i {

    /* renamed from: c, reason: collision with root package name */
    public static final a f95753c = new a();

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f95754a;

    /* renamed from: b, reason: collision with root package name */
    public final AtomicReference f95755b;

    public b() {
        this.f95754a = 1;
        this.f95755b = new qb0.a();
    }

    @Override // ib0.i
    public final boolean a() {
        switch (this.f95754a) {
            case 0:
                return this.f95755b.get() == f95753c;
            default:
                return ((qb0.a) this.f95755b).a();
        }
    }

    @Override // ib0.i
    public final void b() {
        mb0.a aVar;
        switch (this.f95754a) {
            case 0:
                AtomicReference atomicReference = this.f95755b;
                mb0.a aVar2 = (mb0.a) atomicReference.get();
                a aVar3 = f95753c;
                if (aVar2 != aVar3 && (aVar = (mb0.a) atomicReference.getAndSet(aVar3)) != null && aVar != aVar3) {
                    aVar.call();
                    break;
                }
                break;
            default:
                ((qb0.a) this.f95755b).b();
                break;
        }
    }

    public void c(i iVar) {
        i iVar2;
        qb0.a aVar = (qb0.a) this.f95755b;
        do {
            iVar2 = (i) aVar.get();
            if (iVar2 == qb0.b.f83911a) {
                iVar.b();
                return;
            }
        } while (!aVar.compareAndSet(iVar2, iVar));
        if (iVar2 != null) {
            iVar2.b();
        }
    }

    public b(mb0.a aVar) {
        this.f95754a = 0;
        this.f95755b = new AtomicReference(aVar);
    }
}
