package fa;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import xk.b2;
import xk.i2;
import xk.n2;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f54360a;

    public a0(int i5) {
        switch (i5) {
            case 1:
                this.f54360a = new ArrayList();
                break;
            default:
                this.f54360a = new ArrayList();
                break;
        }
    }

    public xk.c1 a() {
        n2 n2Var;
        n2 n2Var2 = n2.f95978c;
        xk.v vVar = new xk.v(b2.f95870a, i2.f95938c);
        ArrayList arrayList = this.f54360a;
        Collections.sort(arrayList, vVar);
        int size = arrayList.size();
        w20.e.e(size, "initialCapacity");
        Object[] objArrCopyOf = new Object[size];
        int size2 = arrayList.size();
        w20.e.e(size2, "initialCapacity");
        Object[] objArrCopyOf2 = new Object[size2];
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        while (i5 < arrayList.size()) {
            n2 n2Var3 = (n2) ((Map.Entry) arrayList.get(i5)).getKey();
            if (i5 > 0) {
                n2 n2Var4 = (n2) ((Map.Entry) arrayList.get(i5 - 1)).getKey();
                xk.j0 j0Var = n2Var3.f95979a;
                xk.j0 j0Var2 = n2Var3.f95980b;
                xk.j0 j0Var3 = n2Var4.f95980b;
                xk.j0 j0Var4 = n2Var4.f95979a;
                if (j0Var.compareTo(j0Var3) <= 0 && j0Var4.compareTo(j0Var2) <= 0) {
                    xk.j0 j0Var5 = n2Var3.f95979a;
                    int iCompareTo = j0Var5.compareTo(j0Var4);
                    xk.j0 j0Var6 = n2Var4.f95980b;
                    int iCompareTo2 = j0Var2.compareTo(j0Var6);
                    if (iCompareTo >= 0 && iCompareTo2 <= 0) {
                        n2Var = n2Var3;
                    } else if (iCompareTo > 0 || iCompareTo2 < 0) {
                        if (iCompareTo >= 0) {
                            j0Var4 = j0Var5;
                        }
                        if (iCompareTo2 > 0) {
                            j0Var2 = j0Var6;
                        }
                        if (!(j0Var4.compareTo(j0Var2) <= 0)) {
                            throw new IllegalArgumentException(vk.b0.p("intersection is undefined for disconnected ranges %s and %s", n2Var3, n2Var4));
                        }
                        n2Var = new n2(j0Var4, j0Var2);
                    } else {
                        n2Var = n2Var4;
                    }
                    if (!n2Var.f95979a.equals(n2Var.f95980b)) {
                        throw new IllegalArgumentException("Overlapping ranges: range " + n2Var4 + " overlaps with entry " + n2Var3);
                    }
                }
            }
            n2Var3.getClass();
            int i13 = i11 + 1;
            if (objArrCopyOf.length < i13) {
                objArrCopyOf = Arrays.copyOf(objArrCopyOf, rg.m.c(objArrCopyOf.length, i13));
            }
            objArrCopyOf[i11] = n2Var3;
            Object value = ((Map.Entry) arrayList.get(i5)).getValue();
            value.getClass();
            int i14 = i12 + 1;
            if (objArrCopyOf2.length < i14) {
                objArrCopyOf2 = Arrays.copyOf(objArrCopyOf2, rg.m.c(objArrCopyOf2.length, i14));
            }
            objArrCopyOf2[i12] = value;
            i5++;
            i12 = i14;
            i11 = i13;
        }
        return new xk.c1(xk.v0.k(i11, objArrCopyOf), xk.v0.k(i12, objArrCopyOf2));
    }

    public void b(n2 n2Var, Short sh) {
        n2Var.getClass();
        vk.b0.d(!n2Var.f95979a.equals(n2Var.f95980b), "Range must not be empty, but was %s", n2Var);
        this.f54360a.add(new xk.r0(n2Var, sh));
    }
}
