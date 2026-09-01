package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h57 implements kn8 {
    public Object a = null;
    public final /* synthetic */ xfd b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ y3b d;
    public final /* synthetic */ hn7 e;

    public h57(xfd xfdVar, Object obj, y3b y3bVar, hn7 hn7Var) {
        this.b = xfdVar;
        this.c = obj;
        this.d = y3bVar;
        this.e = hn7Var;
    }

    @Override // defpackage.kn8
    public final void onChanged(Object obj) {
        ((q7f) this.b).a(new p0g(this, obj, false, 10));
    }
}
