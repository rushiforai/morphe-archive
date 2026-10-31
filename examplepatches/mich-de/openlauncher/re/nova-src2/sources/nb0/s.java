package nb0;

/* loaded from: classes5.dex */
public final class s implements mb0.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78152a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f78153b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f78154c;

    public /* synthetic */ s(int i5, Object obj, Object obj2) {
        this.f78152a = i5;
        this.f78154c = obj;
        this.f78153b = obj2;
    }

    @Override // mb0.a
    public final void call() {
        switch (this.f78152a) {
            case 0:
                ((t) this.f78154c).f78158d.lock();
                try {
                    if (((t) this.f78154c).f78156b == ((xb0.c) this.f78153b) && ((t) this.f78154c).f78157c.decrementAndGet() == 0) {
                        Object obj = ((t) this.f78154c).f78155a;
                        if (obj instanceof ib0.i) {
                            ((ib0.i) obj).b();
                        }
                        ((t) this.f78154c).f78156b.b();
                        ((t) this.f78154c).f78156b = new xb0.c();
                    }
                    ((t) this.f78154c).f78158d.unlock();
                    return;
                } catch (Throwable th2) {
                    ((t) this.f78154c).f78158d.unlock();
                    throw th2;
                }
            case 1:
                if (((pb0.b) this.f78154c).f82501a.f95757b) {
                    return;
                }
                ((mb0.a) this.f78153b).call();
                return;
            case 2:
                if (((pb0.e) this.f78154c).f82512b.f85789b) {
                    return;
                }
                ((mb0.a) this.f78153b).call();
                return;
            case 3:
                ib0.g gVar = (ib0.g) this.f78154c;
                try {
                    ((mb0.a) this.f78153b).call();
                    return;
                } finally {
                    gVar.b();
                }
            default:
                ((wb0.d) this.f78154c).a((wb0.c) this.f78153b);
                return;
        }
    }

    public s(mb0.a aVar, ib0.g gVar) {
        this.f78152a = 3;
        this.f78153b = aVar;
        this.f78154c = gVar;
    }
}
