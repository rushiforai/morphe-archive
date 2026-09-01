package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class pt0 extends o0a {
    public boolean[] a;
    public int b;

    @Override // defpackage.o0a
    public final Object a() {
        return Arrays.copyOf(this.a, this.b);
    }

    @Override // defpackage.o0a
    public final void b(int i) {
        boolean[] zArr = this.a;
        if (zArr.length < i) {
            int length = zArr.length * 2;
            if (i < length) {
                i = length;
            }
            this.a = Arrays.copyOf(zArr, i);
        }
    }

    @Override // defpackage.o0a
    public final int d() {
        return this.b;
    }
}
