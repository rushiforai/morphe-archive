package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class v0a implements m45 {
    public final /* synthetic */ int a;
    public final x0a b;

    public /* synthetic */ v0a(x0a x0aVar, int i) {
        this.a = i;
        this.b = x0aVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        x0a x0aVar = this.b;
        switch (i) {
            case 0:
                return mnc.k.a(x0aVar.a);
            default:
                return mnc.k.a(x0aVar.b);
        }
    }
}
