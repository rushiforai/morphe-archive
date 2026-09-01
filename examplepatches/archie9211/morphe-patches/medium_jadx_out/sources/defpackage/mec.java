package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mec implements f8a {
    public static final Object c = new Object();
    public volatile f8a a;
    public volatile Object b;

    public static f8a a(f8a f8aVar) {
        if ((f8aVar instanceof mec) || (f8aVar instanceof yi3)) {
            return f8aVar;
        }
        mec mecVar = new mec();
        mecVar.b = c;
        mecVar.a = f8aVar;
        return mecVar;
    }

    @Override // defpackage.g8a
    public final Object get() {
        Object obj = this.b;
        if (obj != c) {
            return obj;
        }
        f8a f8aVar = this.a;
        if (f8aVar == null) {
            return this.b;
        }
        Object obj2 = f8aVar.get();
        this.b = obj2;
        this.a = null;
        return obj2;
    }
}
