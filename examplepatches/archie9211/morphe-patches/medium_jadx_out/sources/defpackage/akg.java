package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class akg {
    public final long[] a;
    public final long[] b;
    public final long[] c;

    public akg() {
        akg akgVar = ht2.l;
        this.a = Arrays.copyOf(akgVar.a, 10);
        this.b = Arrays.copyOf(akgVar.b, 10);
        this.c = Arrays.copyOf(akgVar.c, 10);
    }

    public void a(long[] jArr, long[] jArr2) {
        System.arraycopy(jArr2, 0, jArr, 0, 10);
    }

    public final void b(akg akgVar, int i) {
        lk7.I(this.a, akgVar.a, i);
        lk7.I(this.b, akgVar.b, i);
        lk7.I(this.c, akgVar.c, i);
    }

    public akg(long[] jArr, long[] jArr2, long[] jArr3) {
        this.a = jArr;
        this.b = jArr2;
        this.c = jArr3;
    }
}
