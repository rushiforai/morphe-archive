package z;

import java.lang.reflect.Array;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class e1 {

    /* renamed from: a, reason: collision with root package name */
    public static final Object f97763a = new Object();

    public static final void a(d1 d1Var) {
        int i5 = d1Var.f97759d;
        int[] iArr = d1Var.f97757b;
        Object[] objArr = d1Var.f97758c;
        int i11 = 0;
        for (int i12 = 0; i12 < i5; i12++) {
            Object obj = objArr[i12];
            if (obj != f97763a) {
                if (i12 != i11) {
                    iArr[i11] = iArr[i12];
                    objArr[i11] = obj;
                    objArr[i12] = null;
                }
                i11++;
            }
        }
        d1Var.f97756a = false;
        d1Var.f97759d = i11;
    }

    public static final Object b(d1 d1Var, int i5) {
        Object obj;
        Intrinsics.g(d1Var, "<this>");
        int iA = a0.a.a(d1Var.f97759d, i5, d1Var.f97757b);
        if (iA < 0 || (obj = d1Var.f97758c[iA]) == f97763a) {
            return null;
        }
        return obj;
    }

    public static Object[] c(int i5, Object[] objArr) {
        if (objArr.length < i5) {
            return (Object[]) Array.newInstance(objArr.getClass().getComponentType(), i5);
        }
        if (objArr.length > i5) {
            objArr[i5] = null;
        }
        return objArr;
    }
}
