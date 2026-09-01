package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o68 {
    public long[] a;
    public int b;

    public o68(int i) {
        this.a = i == 0 ? za7.a : new long[i];
    }

    public final void a(long j) {
        int i = this.b + 1;
        long[] jArrCopyOf = this.a;
        if (jArrCopyOf.length < i) {
            jArrCopyOf = Arrays.copyOf(jArrCopyOf, Math.max(i, (jArrCopyOf.length * 3) / 2));
            this.a = jArrCopyOf;
        }
        int i2 = this.b;
        jArrCopyOf[i2] = j;
        this.b = i2 + 1;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof o68) {
            o68 o68Var = (o68) obj;
            int i = o68Var.b;
            int i2 = this.b;
            if (i == i2) {
                long[] jArr = this.a;
                long[] jArr2 = o68Var.a;
                n46 n46VarW = iq7.W(0, i2);
                int i3 = n46VarW.a;
                int i4 = n46VarW.b;
                if (i3 > i4) {
                    return true;
                }
                while (jArr[i3] == jArr2[i3]) {
                    if (i3 == i4) {
                        return true;
                    }
                    i3++;
                }
                return false;
            }
        }
        return false;
    }

    public final int hashCode() {
        long[] jArr = this.a;
        int i = this.b;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            long j = jArr[i3];
            i2 += ((int) (j ^ (j >>> 32))) * 31;
        }
        return i2;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append((CharSequence) "[");
        long[] jArr = this.a;
        int i = this.b;
        int i2 = 0;
        while (true) {
            if (i2 >= i) {
                sb.append((CharSequence) "]");
                break;
            }
            long j = jArr[i2];
            if (i2 == -1) {
                sb.append((CharSequence) "...");
                break;
            }
            if (i2 != 0) {
                sb.append((CharSequence) ", ");
            }
            sb.append(j);
            i2++;
        }
        return sb.toString();
    }

    public /* synthetic */ o68() {
        this(16);
    }
}
