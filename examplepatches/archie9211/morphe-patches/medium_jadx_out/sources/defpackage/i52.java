package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i52 extends pq6 {
    public final Object b;
    public final w52 c;
    public final v52 d;
    public final w52 e;
    public final v52 f;

    public i52(Object obj) {
        super(obj);
        this.b = obj;
        this.c = new w52(obj, -2, this);
        this.d = new v52(obj, 0, this);
        this.e = new w52(obj, -1, this);
        this.f = new v52(obj, 1, this);
    }

    @Override // defpackage.pq6
    public final Object a() {
        return this.b;
    }
}
