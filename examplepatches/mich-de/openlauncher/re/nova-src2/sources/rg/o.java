package rg;

/* loaded from: classes3.dex */
public final class o implements b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e f85902a;

    public o(e eVar) {
        this.f85902a = eVar;
    }

    @Override // rg.b
    public final void a(boolean z11) {
        Boolean boolValueOf = Boolean.valueOf(z11);
        e eVar = this.f85902a;
        eVar.n.sendMessage(eVar.n.obtainMessage(1, boolValueOf));
    }
}
