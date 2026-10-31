package gy;

import java.util.Iterator;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;

/* loaded from: classes4.dex */
public final class n implements c4.f0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f58438a;

    /* renamed from: b, reason: collision with root package name */
    public final y3.c f58439b;

    /* renamed from: c, reason: collision with root package name */
    public final Function2 f58440c;

    public n(long j11, y3.c cVar, Function2 function2) {
        this.f58438a = j11;
        this.f58439b = cVar;
        this.f58440c = function2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof n) {
            n nVar = (n) obj;
            if (this.f58438a == nVar.f58438a && Intrinsics.b(this.f58439b, nVar.f58439b) && Intrinsics.b(this.f58440c, nVar.f58440c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f58440c.hashCode() + ((this.f58439b.hashCode() + (Long.hashCode(this.f58438a) * 31)) * 31);
    }

    @Override // c4.f0
    public final long s(y3.l lVar, long j11, y3.n nVar, long j12) {
        Sequence sequenceN0;
        Object obj;
        Object next;
        long j13 = this.f58438a;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j13 >> 32));
        y3.c cVar = this.f58439b;
        int iMo96roundToPx0680j_4 = cVar.mo96roundToPx0680j_4(fIntBitsToFloat);
        int iMo96roundToPx0680j_42 = cVar.mo96roundToPx0680j_4(Float.intBitsToFloat((int) (j13 & 4294967295L)));
        int i5 = lVar.f96607a;
        int i11 = lVar.f96608b;
        int i12 = i5 + iMo96roundToPx0680j_4;
        int i13 = lVar.f96609c;
        int i14 = (int) (j12 >> 32);
        int iIntValue = (i13 - iMo96roundToPx0680j_4) - i14;
        int i15 = (int) (j11 >> 32);
        int i16 = i15 - i14;
        if (nVar == y3.n.f96612a) {
            Integer numValueOf = Integer.valueOf(i12);
            Integer numValueOf2 = Integer.valueOf(iIntValue);
            if (lVar.f96607a < 0) {
                i16 = 0;
            }
            sequenceN0 = kotlin.collections.c.n0(new Integer[]{numValueOf, numValueOf2, Integer.valueOf(i16)});
        } else {
            Integer numValueOf3 = Integer.valueOf(iIntValue);
            Integer numValueOf4 = Integer.valueOf(i12);
            if (i13 <= i15) {
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
        int iMax = Math.max(i11 + iMo96roundToPx0680j_42, 0);
        int i17 = lVar.f96610d - iMo96roundToPx0680j_42;
        int i18 = (int) (j12 & 4294967295L);
        int iIntValue3 = i17 - i18;
        int i19 = (int) (j11 & 4294967295L);
        Iterator f71970a2 = kotlin.collections.c.n0(new Integer[]{Integer.valueOf(iMax), Integer.valueOf(iIntValue3), Integer.valueOf(i11 - (i18 / 2)), Integer.valueOf(i19 - i18)}).getF71970a();
        while (true) {
            if (!f71970a2.hasNext()) {
                break;
            }
            Object next2 = f71970a2.next();
            int iIntValue4 = ((Number) next2).intValue();
            if (iIntValue4 >= 0 && iIntValue4 + i18 <= i19) {
                obj = next2;
                break;
            }
        }
        Integer num2 = (Integer) obj;
        if (num2 != null) {
            iIntValue3 = num2.intValue();
        }
        this.f58440c.invoke(lVar, new y3.l(iIntValue, iIntValue3, i14 + iIntValue, i18 + iIntValue3));
        return (iIntValue << 32) | (iIntValue3 & 4294967295L);
    }

    public final String toString() {
        return "DropdownMenuPositionProvider(contentOffset=" + y3.g.a(this.f58438a) + ", density=" + this.f58439b + ", onPositionCalculated=" + this.f58440c + ")";
    }
}
