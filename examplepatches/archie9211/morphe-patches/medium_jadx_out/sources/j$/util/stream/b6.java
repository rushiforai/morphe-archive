package j$.util.stream;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class b6 extends x5 {
    public q6 c;

    @Override // j$.util.stream.j5, j$.util.stream.l5
    public final void accept(int i) {
        this.c.accept(i);
    }

    @Override // j$.util.stream.f5, j$.util.stream.l5
    public final void c(long j) {
        if (j < 2147483639) {
            this.c = j > 0 ? new q6((int) j) : new q6();
        } else {
            j$.time.h.c("Stream size exceeds max array size");
        }
    }

    @Override // j$.util.stream.f5, j$.util.stream.l5
    public final void end() {
        int[] iArr = (int[]) this.c.b();
        Arrays.sort(iArr);
        long length = iArr.length;
        l5 l5Var = this.a;
        l5Var.c(length);
        int i = 0;
        if (this.b) {
            int length2 = iArr.length;
            while (i < length2) {
                int i2 = iArr[i];
                if (l5Var.e()) {
                    break;
                }
                l5Var.accept(i2);
                i++;
            }
        } else {
            int length3 = iArr.length;
            while (i < length3) {
                l5Var.accept(iArr[i]);
                i++;
            }
        }
        l5Var.end();
    }
}
