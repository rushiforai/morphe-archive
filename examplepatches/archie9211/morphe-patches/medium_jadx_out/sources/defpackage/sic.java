package defpackage;

import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sic implements Iterable, th6 {
    public static final sic e = new sic(0, 0, 0, null);
    public final long a;
    public final long b;
    public final long c;
    public final long[] d;

    public sic(long j, long j2, long j3, long[] jArr) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = jArr;
    }

    public final sic d(sic sicVar) {
        long[] jArr;
        sic sicVarF = this;
        sic sicVar2 = e;
        if (sicVar == sicVar2) {
            return sicVarF;
        }
        if (sicVarF == sicVar2) {
            return sicVar2;
        }
        long j = sicVar.c;
        long j2 = sicVar.c;
        long[] jArr2 = sicVar.d;
        long j3 = sicVar.b;
        long j4 = sicVar.a;
        long j5 = sicVarF.c;
        if (j == j5 && jArr2 == (jArr = sicVarF.d)) {
            return new sic(sicVarF.a & (~j4), sicVarF.b & (~j3), j5, jArr);
        }
        if (jArr2 != null) {
            for (long j6 : jArr2) {
                sicVarF = sicVarF.f(j6);
            }
        }
        if (j3 != 0) {
            for (int i = 0; i < 64; i++) {
                if (((1 << i) & j3) != 0) {
                    sicVarF = sicVarF.f(((long) i) + j2);
                }
            }
        }
        if (j4 != 0) {
            for (int i2 = 0; i2 < 64; i2++) {
                if (((1 << i2) & j4) != 0) {
                    sicVarF = sicVarF.f(((long) i2) + j2 + 64);
                }
            }
        }
        return sicVarF;
    }

    public final sic f(long j) {
        long[] jArr;
        int iE;
        long[] jArr2;
        long j2 = j - this.c;
        if (g76.R(j2, 0L) >= 0 && g76.R(j2, 64L) < 0) {
            long j3 = 1 << ((int) j2);
            long j4 = this.b;
            if ((j4 & j3) != 0) {
                return new sic(this.a, j4 & (~j3), this.c, this.d);
            }
        } else if (g76.R(j2, 64L) >= 0 && g76.R(j2, 128L) < 0) {
            long j5 = 1 << (((int) j2) - 64);
            long j6 = this.a;
            if ((j6 & j5) != 0) {
                return new sic(j6 & (~j5), this.b, this.c, this.d);
            }
        } else if (g76.R(j2, 0L) < 0 && (jArr = this.d) != null && (iE = mo7.E(jArr, j)) >= 0) {
            int length = jArr.length;
            int i = length - 1;
            if (i == 0) {
                jArr2 = null;
            } else {
                long[] jArr3 = new long[i];
                if (iE > 0) {
                    k80.i0(jArr, jArr3, 0, 0, iE);
                }
                if (iE < i) {
                    k80.i0(jArr, jArr3, iE, iE + 1, length);
                }
                jArr2 = jArr3;
            }
            return new sic(this.a, this.b, this.c, jArr2);
        }
        return this;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return vn7.F(new ric(this, null));
    }

    public final boolean m(long j) {
        long[] jArr;
        long j2 = j - this.c;
        return (g76.R(j2, 0L) < 0 || g76.R(j2, 64L) >= 0) ? (g76.R(j2, 64L) < 0 || g76.R(j2, 128L) >= 0) ? g76.R(j2, 0L) <= 0 && (jArr = this.d) != null && mo7.E(jArr, j) >= 0 : ((1 << (((int) j2) + (-64))) & this.a) != 0 : ((1 << ((int) j2)) & this.b) != 0;
    }

    public final sic p(sic sicVar) {
        sic sicVarQ;
        long[] jArr;
        sic sicVarQ2 = this;
        sic sicVar2 = e;
        if (sicVar == sicVar2) {
            return sicVarQ2;
        }
        if (sicVarQ2 == sicVar2) {
            return sicVar;
        }
        long j = sicVar.c;
        long j2 = sicVar.c;
        long[] jArr2 = sicVar.d;
        long j3 = sicVar.b;
        long j4 = sicVar.a;
        long j5 = sicVarQ2.c;
        long j6 = sicVarQ2.b;
        long j7 = sicVarQ2.a;
        if (j == j5 && jArr2 == (jArr = sicVarQ2.d)) {
            return new sic(j7 | j4, j6 | j3, j5, jArr);
        }
        long[] jArr3 = sicVarQ2.d;
        if (jArr3 != null) {
            if (jArr2 != null) {
                for (long j8 : jArr2) {
                    sicVarQ2 = sicVarQ2.q(j8);
                }
            }
            if (j3 != 0) {
                for (int i = 0; i < 64; i++) {
                    if (((1 << i) & j3) != 0) {
                        sicVarQ2 = sicVarQ2.q(((long) i) + j2);
                    }
                }
            }
            if (j4 != 0) {
                for (int i2 = 0; i2 < 64; i2++) {
                    if (((1 << i2) & j4) != 0) {
                        sicVarQ2 = sicVarQ2.q(((long) i2) + j2 + 64);
                    }
                }
            }
            return sicVarQ2;
        }
        if (jArr3 != null) {
            sicVarQ = sicVar;
            for (long j9 : jArr3) {
                sicVarQ = sicVarQ.q(j9);
            }
        } else {
            sicVarQ = sicVar;
        }
        long j10 = sicVarQ2.c;
        if (j6 != 0) {
            for (int i3 = 0; i3 < 64; i3++) {
                if (((1 << i3) & j6) != 0) {
                    sicVarQ = sicVarQ.q(((long) i3) + j10);
                }
            }
        }
        if (j7 != 0) {
            for (int i4 = 0; i4 < 64; i4++) {
                if (((1 << i4) & j7) != 0) {
                    sicVarQ = sicVarQ.q(((long) i4) + j10 + 64);
                }
            }
        }
        return sicVarQ;
    }

    /* JADX WARN: Removed duplicated region for block: B:58:0x00fa  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.sic q(long r30) {
        /*
            Method dump skipped, instruction units count: 323
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sic.q(long):sic");
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append(" [");
        ArrayList arrayList = new ArrayList(cu1.k0(this, 10));
        Iterator it2 = iterator();
        while (it2.hasNext()) {
            arrayList.add(String.valueOf(((Number) it2.next()).longValue()));
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append((CharSequence) "");
        int size = arrayList.size();
        int i = 0;
        for (int i2 = 0; i2 < size; i2++) {
            Object obj = arrayList.get(i2);
            i++;
            if (i > 1) {
                sb2.append((CharSequence) ", ");
            }
            if (obj != null ? obj instanceof CharSequence : true) {
                sb2.append((CharSequence) obj);
            } else if (obj instanceof Character) {
                sb2.append(((Character) obj).charValue());
            } else {
                sb2.append((CharSequence) obj.toString());
            }
        }
        sb2.append((CharSequence) "");
        sb.append(sb2.toString());
        sb.append(']');
        return sb.toString();
    }
}
