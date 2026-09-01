package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class au6 implements upc {
    public final int a;
    public final int b;
    public final k49 c;
    public int d;

    public au6(int i, int i2, int i3) {
        this.a = i2;
        this.b = i3;
        int i4 = (i / i2) * i2;
        this.c = new k49(iq7.W(Math.max(i4 - i3, 0), i4 + i2 + i3), xsa.h);
        this.d = i;
    }

    public final void c(int i) {
        if (i != this.d) {
            this.d = i;
            int i2 = this.a;
            int i3 = (i / i2) * i2;
            int i4 = this.b;
            this.c.setValue(iq7.W(Math.max(i3 - i4, 0), i3 + i2 + i4));
        }
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return (n46) this.c.getValue();
    }
}
