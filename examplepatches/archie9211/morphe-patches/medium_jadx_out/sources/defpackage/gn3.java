package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gn3 implements gd9 {
    public final long a;
    public final m73 b;
    public final b55 c;

    public gn3(long j, m73 m73Var, b55 b55Var) {
        this.a = j;
        this.b = m73Var;
        this.c = b55Var;
    }

    @Override // defpackage.gd9
    public final long C(o46 o46Var, long j, ip6 ip6Var, long j2) {
        mzb mzbVarB0;
        Object next;
        Object obj;
        m73 m73Var = this.b;
        int iI0 = m73Var.i0(48.0f);
        long j3 = this.a;
        int iI02 = m73Var.i0(xj3.a(j3));
        ip6 ip6Var2 = ip6.Ltr;
        int i = iI02 * (ip6Var == ip6Var2 ? 1 : -1);
        int iI03 = m73Var.i0(xj3.b(j3));
        int i2 = o46Var.a;
        int i3 = o46Var.c;
        int i4 = i2 + i;
        int i5 = (int) (j2 >> 32);
        int iIntValue = (i3 - i5) + i;
        int i6 = (int) (j >> 32);
        int i7 = i6 - i5;
        if (ip6Var == ip6Var2) {
            Integer numValueOf = Integer.valueOf(i4);
            Integer numValueOf2 = Integer.valueOf(iIntValue);
            if (o46Var.a < 0) {
                i7 = 0;
            }
            mzbVarB0 = k80.b0(new Integer[]{numValueOf, numValueOf2, Integer.valueOf(i7)});
        } else {
            Integer numValueOf3 = Integer.valueOf(iIntValue);
            Integer numValueOf4 = Integer.valueOf(i4);
            if (i3 <= i6) {
                i7 = 0;
            }
            mzbVarB0 = k80.b0(new Integer[]{numValueOf3, numValueOf4, Integer.valueOf(i7)});
        }
        Iterator it2 = mzbVarB0.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            int iIntValue2 = ((Number) next).intValue();
            if (iIntValue2 >= 0 && iIntValue2 + i5 <= i6) {
                break;
            }
        }
        Integer num = (Integer) next;
        if (num != null) {
            iIntValue = num.intValue();
        }
        int iMax = Math.max(o46Var.d + iI03, iI0);
        int i8 = o46Var.b;
        int i9 = (int) (j2 & 4294967295L);
        int iIntValue3 = (i8 - i9) + iI03;
        int i10 = (int) (j & 4294967295L);
        Iterator it3 = k80.b0(new Integer[]{Integer.valueOf(iMax), Integer.valueOf(iIntValue3), Integer.valueOf((i8 - (i9 / 2)) + iI03), Integer.valueOf((i10 - i9) - iI0)}).iterator();
        while (true) {
            if (!it3.hasNext()) {
                obj = null;
                break;
            }
            Object next2 = it3.next();
            int iIntValue4 = ((Number) next2).intValue();
            if (iIntValue4 >= iI0 && iIntValue4 + i9 <= i10 - iI0) {
                obj = next2;
                break;
            }
        }
        Integer num2 = (Integer) obj;
        if (num2 != null) {
            iIntValue3 = num2.intValue();
        }
        this.c.invoke(o46Var, new o46(iIntValue, iIntValue3, i5 + iIntValue, iIntValue3 + i9));
        return (((long) iIntValue) << 32) | (((long) iIntValue3) & 4294967295L);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof gn3) {
            gn3 gn3Var = (gn3) obj;
            if (this.a == gn3Var.a && g76.L(this.b, gn3Var.b) && g76.L(this.c, gn3Var.c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        long j = this.a;
        return this.c.hashCode() + ((this.b.hashCode() + (((int) (j ^ (j >>> 32))) * 31)) * 31);
    }

    public final String toString() {
        return "DropdownMenuPositionProvider(contentOffset=" + ((Object) xj3.c(this.a)) + ", density=" + this.b + ", onPositionCalculated=" + this.c + ')';
    }
}
