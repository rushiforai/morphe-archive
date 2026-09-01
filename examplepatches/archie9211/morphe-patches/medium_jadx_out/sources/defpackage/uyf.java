package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uyf extends ugf {
    public static final Object c = new Object();
    public Object b;

    public uyf(Object obj) {
        super(5);
        this.b = obj;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.b != c;
    }

    @Override // defpackage.ugf, java.util.Iterator
    public final Object next() {
        Object obj = this.b;
        Object obj2 = c;
        if (obj != obj2) {
            this.b = obj2;
            return obj;
        }
        ywb.n();
        return null;
    }
}
