package ads_mobile_sdk;

import tm.o;

/* loaded from: classes2.dex */
public final class n80 implements b.m5 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f7452a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f7453b;

    public /* synthetic */ n80(Object obj, int i5) {
        this.f7453b = i5;
        this.f7452a = obj;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f7453b) {
            case 0:
                return new u80(((r80) this.f7452a).f8952a);
            case 1:
                return new s80(((r80) this.f7452a).f8952a);
            default:
                o oVar = (o) this.f7452a;
                return new b90((r80) oVar.f89493b, (o) oVar.f89494c);
        }
    }
}
