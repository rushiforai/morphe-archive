package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v1c {
    public int a;
    public final int[] b = new int[10];

    public final int a() {
        if ((this.a & 16) != 0) {
            return this.b[4];
        }
        return 65535;
    }

    public final void b(int i, int i2) {
        if (i >= 0) {
            int[] iArr = this.b;
            if (i >= iArr.length) {
                return;
            }
            this.a = (1 << i) | this.a;
            iArr[i] = i2;
        }
    }
}
