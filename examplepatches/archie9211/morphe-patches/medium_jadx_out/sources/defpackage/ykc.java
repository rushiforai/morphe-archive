package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ykc extends g46 {
    public int a;
    public final /* synthetic */ xkc b;

    public ykc(xkc xkcVar) {
        this.b = xkcVar;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.a < this.b.e();
    }

    @Override // defpackage.g46
    public final int nextInt() {
        int i = this.a;
        this.a = i + 1;
        return this.b.c(i);
    }
}
