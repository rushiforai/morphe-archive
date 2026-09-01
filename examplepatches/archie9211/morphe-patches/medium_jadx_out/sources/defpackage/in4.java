package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class in4 extends o0a {
    public float[] a;
    public int b;

    @Override // defpackage.o0a
    public final Object a() {
        return Arrays.copyOf(this.a, this.b);
    }

    @Override // defpackage.o0a
    public final void b(int i) {
        float[] fArr = this.a;
        if (fArr.length < i) {
            int length = fArr.length * 2;
            if (i < length) {
                i = length;
            }
            this.a = Arrays.copyOf(fArr, i);
        }
    }

    @Override // defpackage.o0a
    public final int d() {
        return this.b;
    }
}
