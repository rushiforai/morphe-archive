package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f1c implements e8a {
    public final /* synthetic */ int a;
    public final e8a b;
    public final e8a c;

    public /* synthetic */ f1c(e8a e8aVar, e8a e8aVar2, int i) {
        this.a = i;
        this.b = e8aVar;
        this.c = e8aVar2;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        e8a e8aVar = this.c;
        e8a e8aVar2 = this.b;
        switch (i) {
            case 0:
                return new e1c((bmd) e8aVar2.get(), (upe) e8aVar.get());
            default:
                return new o1c((g2c) e8aVar2.get(), (g2c) e8aVar.get());
        }
    }
}
