package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class d9a implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ v7c b;

    public /* synthetic */ d9a(v7c v7cVar, int i) {
        this.a = i;
        this.b = v7cVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        v7c v7cVar = this.b;
        switch (i) {
            case 0:
                return Boolean.valueOf(v7cVar.c() == w7c.Hidden);
            default:
                return v7cVar.d;
        }
    }
}
