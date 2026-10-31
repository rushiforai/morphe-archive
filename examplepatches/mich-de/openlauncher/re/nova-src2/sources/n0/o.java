package n0;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import kotlin.collections.EmptyList;
import kotlin.ranges.IntRange;

/* loaded from: classes.dex */
public abstract class o {
    public static final List a(d0 d0Var, k0 k0Var, j jVar) {
        IntRange intRange;
        r1.e eVar = jVar.f77433a;
        if (!(eVar.f85079c != 0) && k0Var.f77443a.isEmpty()) {
            return EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList();
        if (jVar.f77433a.f85079c != 0) {
            int i5 = eVar.f85079c;
            if (i5 == 0) {
                throw new NoSuchElementException("MutableVector is empty.");
            }
            Object[] objArr = eVar.f85077a;
            int i11 = ((i) objArr[0]).f77427a;
            for (int i12 = 0; i12 < i5; i12++) {
                int i13 = ((i) objArr[i12]).f77427a;
                if (i13 < i11) {
                    i11 = i13;
                }
            }
            if (i11 < 0) {
                j0.b.a("negative minIndex");
            }
            int i14 = eVar.f85079c;
            if (i14 == 0) {
                throw new NoSuchElementException("MutableVector is empty.");
            }
            Object[] objArr2 = eVar.f85077a;
            int i15 = ((i) objArr2[0]).f77428b;
            for (int i16 = 0; i16 < i14; i16++) {
                int i17 = ((i) objArr2[i16]).f77428b;
                if (i17 > i15) {
                    i15 = i17;
                }
            }
            intRange = new IntRange(i11, Math.min(i15, d0Var.a() - 1), 1);
        } else {
            IntRange.f71913e.getClass();
            intRange = IntRange.f71914f;
        }
        int size = k0Var.f77443a.size();
        for (int i18 = 0; i18 < size; i18++) {
            j0 j0Var = (j0) k0Var.get(i18);
            int iG = z.g(d0Var, j0Var.f77434a, j0Var.f77436c);
            int i19 = intRange.f71906a;
            if ((iG > intRange.f71907b || i19 > iG) && iG >= 0 && iG < d0Var.a()) {
                arrayList.add(Integer.valueOf(iG));
            }
        }
        int i21 = intRange.f71906a;
        int i22 = intRange.f71907b;
        if (i21 <= i22) {
            while (true) {
                arrayList.add(Integer.valueOf(i21));
                if (i21 == i22) {
                    break;
                }
                i21++;
            }
        }
        return arrayList;
    }
}
