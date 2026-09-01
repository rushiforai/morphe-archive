package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mzd extends o0a {
    public short[] a;
    public int b;

    @Override // defpackage.o0a
    public final Object a() {
        return new lzd(Arrays.copyOf(this.a, this.b));
    }

    @Override // defpackage.o0a
    public final void b(int i) {
        short[] sArr = this.a;
        if (sArr.length < i) {
            int length = sArr.length * 2;
            if (i < length) {
                i = length;
            }
            this.a = Arrays.copyOf(sArr, i);
        }
    }

    @Override // defpackage.o0a
    public final int d() {
        return this.b;
    }
}
