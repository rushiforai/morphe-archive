package f1;

import java.util.Iterator;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;

/* loaded from: classes2.dex */
public final class x1 implements c4.f0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f54090a;

    /* renamed from: b, reason: collision with root package name */
    public final y3.c f54091b;

    /* renamed from: c, reason: collision with root package name */
    public final Function2 f54092c;

    public x1(long j11, y3.c cVar, Function2 function2) {
        this.f54090a = j11;
        this.f54091b = cVar;
        this.f54092c = function2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof x1) {
            x1 x1Var = (x1) obj;
            if (this.f54090a == x1Var.f54090a && Intrinsics.b(this.f54091b, x1Var.f54091b) && Intrinsics.b(this.f54092c, x1Var.f54092c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f54092c.hashCode() + ((this.f54091b.hashCode() + (Long.hashCode(this.f54090a) * 31)) * 31);
    }

    @Override // c4.f0
    public final long s(y3.l lVar, long j11, y3.n nVar, long j12) {
        Sequence sequenceN0;
        Object obj;
        Object next;
        float f11 = n2.f53796b;
        y3.c cVar = this.f54091b;
        int iMo96roundToPx0680j_4 = cVar.mo96roundToPx0680j_4(f11);
        long j13 = this.f54090a;
        int iMo96roundToPx0680j_42 = cVar.mo96roundToPx0680j_4(Float.intBitsToFloat((int) (j13 >> 32)));
        y3.n nVar2 = y3.n.f96612a;
        int i5 = iMo96roundToPx0680j_42 * (nVar == nVar2 ? 1 : -1);
        int iMo96roundToPx0680j_43 = cVar.mo96roundToPx0680j_4(Float.intBitsToFloat((int) (j13 & 4294967295L)));
        int i11 = lVar.f96607a;
        int i12 = lVar.f96609c;
        int i13 = i11 + i5;
        int i14 = (int) (j12 >> 32);
        int iIntValue = (i12 - i14) + i5;
        int i15 = (int) (j11 >> 32);
        int i16 = i15 - i14;
        if (nVar == nVar2) {
            Integer numValueOf = Integer.valueOf(i13);
            Integer numValueOf2 = Integer.valueOf(iIntValue);
            if (lVar.f96607a < 0) {
                i16 = 0;
            }
            sequenceN0 = kotlin.collections.c.n0(new Integer[]{numValueOf, numValueOf2, Integer.valueOf(i16)});
        } else {
            Integer numValueOf3 = Integer.valueOf(iIntValue);
            Integer numValueOf4 = Integer.valueOf(i13);
            if (i12 <= i15) {
                i16 = 0;
            }
            sequenceN0 = kotlin.collections.c.n0(new Integer[]{numValueOf3, numValueOf4, Integer.valueOf(i16)});
        }
        Iterator f71970a = sequenceN0.getF71970a();
        while (true) {
            obj = null;
            if (!f71970a.hasNext()) {
                next = null;
                break;
            }
            next = f71970a.next();
            int iIntValue2 = ((Number) next).intValue();
            if (iIntValue2 >= 0 && iIntValue2 + i14 <= i15) {
                break;
            }
        }
        Integer num = (Integer) next;
        if (num != null) {
            iIntValue = num.intValue();
        }
        int iMax = Math.max(lVar.f96610d + iMo96roundToPx0680j_43, iMo96roundToPx0680j_4);
        int i17 = lVar.f96608b;
        int i18 = (int) (j12 & 4294967295L);
        int iIntValue3 = (i17 - i18) + iMo96roundToPx0680j_43;
        int i19 = (i17 - (i18 / 2)) + iMo96roundToPx0680j_43;
        int i21 = (int) (j11 & 4294967295L);
        Iterator f71970a2 = kotlin.collections.c.n0(new Integer[]{Integer.valueOf(iMax), Integer.valueOf(iIntValue3), Integer.valueOf(i19), Integer.valueOf((i21 - i18) - iMo96roundToPx0680j_4)}).getF71970a();
        while (true) {
            if (!f71970a2.hasNext()) {
                break;
            }
            Object next2 = f71970a2.next();
            int iIntValue4 = ((Number) next2).intValue();
            if (iIntValue4 >= iMo96roundToPx0680j_4 && iIntValue4 + i18 <= i21 - iMo96roundToPx0680j_4) {
                obj = next2;
                break;
            }
        }
        Integer num2 = (Integer) obj;
        if (num2 != null) {
            iIntValue3 = num2.intValue();
        }
        this.f54092c.invoke(lVar, new y3.l(iIntValue, iIntValue3, i14 + iIntValue, i18 + iIntValue3));
        return (iIntValue << 32) | (iIntValue3 & 4294967295L);
    }

    public final String toString() {
        return "DropdownMenuPositionProvider(contentOffset=" + ((Object) y3.g.a(this.f54090a)) + ", density=" + this.f54091b + ", onPositionCalculated=" + this.f54092c + ')';
    }
}
