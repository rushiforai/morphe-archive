package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ctd extends atd {
    public final p89 d;

    public ctd(p89 p89Var) {
        this.d = p89Var;
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i = this.c;
        this.c = i + 2;
        Object[] objArr = this.a;
        return new r68(this.d, objArr[i], objArr[i + 1]);
    }
}
