package j$.util.stream;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class i6 extends w5 {
    public double[] c;
    public int d;

    @Override // j$.util.stream.i5, j$.util.stream.l5
    public final void accept(double d) {
        double[] dArr = this.c;
        int i = this.d;
        this.d = i + 1;
        dArr[i] = d;
    }

    @Override // j$.util.stream.e5, j$.util.stream.l5
    public final void c(long j) {
        if (j < 2147483639) {
            this.c = new double[(int) j];
        } else {
            j$.time.h.c("Stream size exceeds max array size");
        }
    }

    @Override // j$.util.stream.e5, j$.util.stream.l5
    public final void end() {
        int i = 0;
        Arrays.sort(this.c, 0, this.d);
        long j = this.d;
        l5 l5Var = this.a;
        l5Var.c(j);
        if (this.b) {
            while (i < this.d && !l5Var.e()) {
                l5Var.accept(this.c[i]);
                i++;
            }
        } else {
            while (i < this.d) {
                l5Var.accept(this.c[i]);
                i++;
            }
        }
        l5Var.end();
        this.c = null;
    }
}
