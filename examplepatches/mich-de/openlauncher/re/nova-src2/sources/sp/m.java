package sp;

/* loaded from: classes4.dex */
public final class m implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ k f87610a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f87611b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f87612c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ n f87613d;

    public m(n nVar, k kVar, boolean z11, boolean z12) {
        this.f87613d = nVar;
        this.f87610a = kVar;
        this.f87611b = z11;
        this.f87612c = z12;
    }

    @Override // java.lang.Runnable
    public final void run() {
        n nVar = n.f87629j;
        k kVar = this.f87610a;
        kVar.h();
        boolean z11 = this.f87611b;
        n nVar2 = this.f87613d;
        if (!z11 || !kVar.f()) {
            kVar.f();
            nVar2.f87635f.getClass();
            m0.f87615q.f87617b.a(kVar);
            return;
        }
        try {
            n.a(nVar2, kVar);
        } catch (Throwable th2) {
            n nVar3 = n.f87629j;
            th2.getMessage();
            if (this.f87612c) {
                return;
            }
            nVar2.f87635f.getClass();
            m0.f87615q.f87617b.a(kVar);
        }
    }
}
