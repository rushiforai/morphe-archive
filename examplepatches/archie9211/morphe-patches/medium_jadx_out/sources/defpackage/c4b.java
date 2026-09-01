package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c4b implements e8a {
    public final /* synthetic */ int a = 0;
    public final e8a b;
    public final e8a c;
    public final e8a d;
    public final e8a e;
    public final e8a f;

    public c4b(e8a e8aVar, e8a e8aVar2, e8a e8aVar3, e8a e8aVar4, e8a e8aVar5) {
        this.b = e8aVar;
        this.c = e8aVar2;
        this.d = e8aVar3;
        this.e = e8aVar4;
        this.f = e8aVar5;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        e8a e8aVar = this.e;
        e8a e8aVar2 = this.d;
        e8a e8aVar3 = this.c;
        e8a e8aVar4 = this.b;
        e8a e8aVar5 = this.f;
        switch (i) {
            case 0:
                return new a4b((bmd) e8aVar4.get(), (hk4) e8aVar3.get(), (w60) e8aVar2.get(), (b4b) e8aVar.get(), (b2c) e8aVar5.get());
            default:
                return new d1c((xj4) ((v0c) e8aVar5).b, (hk4) e8aVar4.get(), (o1c) e8aVar3.get(), (h34) e8aVar2.get(), (ib2) e8aVar.get());
        }
    }

    public c4b(v0c v0cVar, e8a e8aVar, e8a e8aVar2, e8a e8aVar3, e8a e8aVar4) {
        this.f = v0cVar;
        this.b = e8aVar;
        this.c = e8aVar2;
        this.d = e8aVar3;
        this.e = e8aVar4;
    }
}
