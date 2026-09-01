package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iyf extends ugf {
    public final Object b;
    public boolean c;

    public iyf(Object obj) {
        super(4);
        this.b = obj;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return !this.c;
    }

    @Override // defpackage.ugf, java.util.Iterator
    public final Object next() {
        if (this.c) {
            ywb.n();
            return null;
        }
        this.c = true;
        return this.b;
    }
}
