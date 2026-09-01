package defpackage;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bqe implements v41 {
    public final boolean a;
    public final v41 b;
    public final Member c;
    public final vwa d;
    public final n46[] e;
    public final boolean f;

    /* JADX WARN: Removed duplicated region for block: B:127:0x025b  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x006e A[LOOP:1: B:23:0x0068->B:25:0x006e, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x010e  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01af  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public bqe(defpackage.f41 r11, defpackage.v41 r12, boolean r13) {
        /*
            Method dump skipped, instruction units count: 819
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bqe.<init>(f41, v41, boolean):void");
    }

    @Override // defpackage.v41
    public final List a() {
        return this.b.a();
    }

    @Override // defpackage.v41
    public final Member b() {
        return this.c;
    }

    @Override // defpackage.v41
    public final boolean c() {
        return this.b instanceof g51;
    }

    @Override // defpackage.v41
    public final Object call(Object[] objArr) throws IllegalAccessException, InvocationTargetException {
        Object objInvoke;
        Object objE;
        Object objE2;
        objArr.getClass();
        vwa vwaVar = this.d;
        n46 n46Var = (n46) vwaVar.b;
        List[] listArr = (List[]) vwaVar.c;
        Method method = (Method) vwaVar.d;
        boolean zIsEmpty = n46Var.isEmpty();
        int i = n46Var.b;
        int i2 = n46Var.a;
        if (!zIsEmpty) {
            if (this.f) {
                f17 f17Var = new f17(objArr.length);
                for (int i3 = 0; i3 < i2; i3++) {
                    f17Var.add(objArr[i3]);
                }
                if (i2 <= i) {
                    while (true) {
                        List<Method> list = listArr[i2];
                        Object obj = objArr[i2];
                        if (list != null) {
                            for (Method method2 : list) {
                                if (obj != null) {
                                    objE2 = method2.invoke(obj, null);
                                } else {
                                    Class<?> returnType = method2.getReturnType();
                                    returnType.getClass();
                                    objE2 = bpe.e(returnType);
                                }
                                f17Var.add(objE2);
                            }
                        } else {
                            f17Var.add(obj);
                        }
                        if (i2 == i) {
                            break;
                        }
                        i2++;
                    }
                }
                int i4 = i + 1;
                int length = objArr.length - 1;
                if (i4 <= length) {
                    while (true) {
                        f17Var.add(objArr[i4]);
                        if (i4 == length) {
                            break;
                        }
                        i4++;
                    }
                }
                objArr = d46.w(f17Var).toArray(new Object[0]);
            } else {
                int length2 = objArr.length;
                Object[] objArr2 = new Object[length2];
                for (int i5 = 0; i5 < length2; i5++) {
                    if (i5 > i || i2 > i5) {
                        objE = objArr[i5];
                    } else {
                        List list2 = listArr[i5];
                        Method method3 = list2 != null ? (Method) bu1.a1(list2) : null;
                        objE = objArr[i5];
                        if (method3 != null) {
                            if (objE != null) {
                                objE = method3.invoke(objE, null);
                            } else {
                                Class<?> returnType2 = method3.getReturnType();
                                returnType2.getClass();
                                objE = bpe.e(returnType2);
                            }
                        }
                    }
                    objArr2[i5] = objE;
                }
                objArr = objArr2;
            }
        }
        Object objCall = this.b.call(objArr);
        return (objCall == tb2.COROUTINE_SUSPENDED || method == null || (objInvoke = method.invoke(null, objCall)) == null) ? objCall : objInvoke;
    }

    public final n46 d(int i) {
        n46[] n46VarArr = this.e;
        if (i >= 0 && i < n46VarArr.length) {
            return n46VarArr[i];
        }
        if (n46VarArr.length == 0) {
            return new n46(i, i, 1);
        }
        int length = ((n46) k80.E0(n46VarArr)).b + 1 + (i - n46VarArr.length);
        return new n46(length, length, 1);
    }

    @Override // defpackage.v41
    public final Type getReturnType() {
        return this.b.getReturnType();
    }
}
