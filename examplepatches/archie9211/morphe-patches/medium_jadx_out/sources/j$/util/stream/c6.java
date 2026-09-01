package j$.util.stream;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class c6 extends y5 {
    public s6 c;

    @Override // j$.util.stream.k5, j$.util.stream.l5
    public final void accept(long j) {
        this.c.accept(j);
    }

    @Override // j$.util.stream.g5, j$.util.stream.l5
    public final void c(long j) {
        if (j < 2147483639) {
            this.c = j > 0 ? new s6((int) j) : new s6();
        } else {
            j$.time.h.c("Stream size exceeds max array size");
        }
    }

    @Override // j$.util.stream.g5, j$.util.stream.l5
    public final void end() {
        long[] jArr = (long[]) this.c.b();
        Arrays.sort(jArr);
        long length = jArr.length;
        l5 l5Var = this.a;
        l5Var.c(length);
        int i = 0;
        if (this.b) {
            int length2 = jArr.length;
            while (i < length2) {
                long j = jArr[i];
                if (l5Var.e()) {
                    break;
                }
                l5Var.accept(j);
                i++;
            }
        } else {
            int length3 = jArr.length;
            while (i < length3) {
                l5Var.accept(jArr[i]);
                i++;
            }
        }
        l5Var.end();
    }
}
