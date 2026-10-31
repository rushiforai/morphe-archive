package nb0;

/* loaded from: classes5.dex */
public final class r extends ib0.h {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f78148e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f78149f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f78150g;

    /* renamed from: h, reason: collision with root package name */
    public final mb0.b f78151h;

    public r(mb0.b bVar) {
        this.f78148e = 1;
        this.f78149f = bVar;
        this.f78150g = rb0.b.f85776a;
        this.f78151h = mb0.d.f76202a;
    }

    @Override // ib0.e
    public final void c(Object obj) {
        switch (this.f78148e) {
            case 0:
                ((ib0.h) this.f78149f).c(obj);
                break;
            default:
                ((mb0.b) this.f78149f).mo5b(obj);
                break;
        }
    }

    public void h() {
        ((t) this.f78151h).f78158d.lock();
        try {
            if (((t) this.f78151h).f78156b == ((xb0.c) this.f78150g)) {
                Object obj = ((t) this.f78151h).f78155a;
                if (obj instanceof ib0.i) {
                    ((ib0.i) obj).b();
                }
                ((t) this.f78151h).f78156b.b();
                ((t) this.f78151h).f78156b = new xb0.c();
                ((t) this.f78151h).f78157c.set(0);
            }
            ((t) this.f78151h).f78158d.unlock();
        } catch (Throwable th2) {
            ((t) this.f78151h).f78158d.unlock();
            throw th2;
        }
    }

    @Override // ib0.e
    public final void onCompleted() {
        switch (this.f78148e) {
            case 0:
                h();
                ((ib0.h) this.f78149f).onCompleted();
                break;
            default:
                ((mb0.c) this.f78151h).getClass();
                break;
        }
    }

    @Override // ib0.e
    public final void onError(Throwable th2) {
        switch (this.f78148e) {
            case 0:
                h();
                ((ib0.h) this.f78149f).onError(th2);
                return;
            default:
                ((br.c) this.f78150g).mo5b(th2);
                throw null;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(t tVar, ib0.h hVar, ib0.h hVar2, xb0.c cVar) {
        super(hVar, true);
        this.f78148e = 0;
        this.f78151h = tVar;
        this.f78149f = hVar2;
        this.f78150g = cVar;
    }
}
