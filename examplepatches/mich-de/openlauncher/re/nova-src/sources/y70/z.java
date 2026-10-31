package y70;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlin.jvm.internal.Intrinsics;
import t70.f1;
import t70.g1;

/* loaded from: classes.dex */
public class z {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f96837b = AtomicIntegerFieldUpdater.newUpdater(z.class, "_size$volatile");
    private volatile /* synthetic */ int _size$volatile;

    /* renamed from: a, reason: collision with root package name */
    public f1[] f96838a;

    public final void a(f1 f1Var) {
        f1Var.c((g1) this);
        f1[] f1VarArr = this.f96838a;
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = f96837b;
        if (f1VarArr == null) {
            f1VarArr = new f1[4];
            this.f96838a = f1VarArr;
        } else if (atomicIntegerFieldUpdater.get(this) >= f1VarArr.length) {
            Object[] objArrCopyOf = Arrays.copyOf(f1VarArr, atomicIntegerFieldUpdater.get(this) * 2);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            f1VarArr = (f1[]) objArrCopyOf;
            this.f96838a = f1VarArr;
        }
        int i5 = atomicIntegerFieldUpdater.get(this);
        atomicIntegerFieldUpdater.set(this, i5 + 1);
        f1VarArr[i5] = f1Var;
        f1Var.f88793b = i5;
        c(i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:26:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final f1 b(int i5) {
        Object[] objArr = this.f96838a;
        Intrinsics.d(objArr);
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = f96837b;
        atomicIntegerFieldUpdater.set(this, atomicIntegerFieldUpdater.get(this) - 1);
        if (i5 < atomicIntegerFieldUpdater.get(this)) {
            d(i5, atomicIntegerFieldUpdater.get(this));
            int i11 = (i5 - 1) / 2;
            if (i5 > 0) {
                f1 f1Var = objArr[i5];
                Intrinsics.d(f1Var);
                Object obj = objArr[i11];
                Intrinsics.d(obj);
                if (f1Var.compareTo(obj) < 0) {
                    d(i5, i11);
                    c(i11);
                } else {
                    while (true) {
                        int i12 = i5 * 2;
                        int i13 = i12 + 1;
                        if (i13 >= atomicIntegerFieldUpdater.get(this)) {
                            break;
                        }
                        Object[] objArr2 = this.f96838a;
                        Intrinsics.d(objArr2);
                        int i14 = i12 + 2;
                        if (i14 < atomicIntegerFieldUpdater.get(this)) {
                            Comparable comparable = objArr2[i14];
                            Intrinsics.d(comparable);
                            Object obj2 = objArr2[i13];
                            Intrinsics.d(obj2);
                            if (comparable.compareTo(obj2) >= 0) {
                                i14 = i13;
                            }
                            Comparable comparable2 = objArr2[i5];
                            Intrinsics.d(comparable2);
                            Comparable comparable3 = objArr2[i14];
                            Intrinsics.d(comparable3);
                            if (comparable2.compareTo(comparable3) <= 0) {
                                break;
                            }
                            d(i5, i14);
                            i5 = i14;
                        }
                    }
                }
            }
        }
        f1 f1Var2 = objArr[atomicIntegerFieldUpdater.get(this)];
        Intrinsics.d(f1Var2);
        f1Var2.c(null);
        f1Var2.f88793b = -1;
        objArr[atomicIntegerFieldUpdater.get(this)] = null;
        return f1Var2;
    }

    public final void c(int i5) {
        while (i5 > 0) {
            f1[] f1VarArr = this.f96838a;
            Intrinsics.d(f1VarArr);
            int i11 = (i5 - 1) / 2;
            f1 f1Var = f1VarArr[i11];
            Intrinsics.d(f1Var);
            f1 f1Var2 = f1VarArr[i5];
            Intrinsics.d(f1Var2);
            if (f1Var.compareTo(f1Var2) <= 0) {
                return;
            }
            d(i5, i11);
            i5 = i11;
        }
    }

    public final void d(int i5, int i11) {
        f1[] f1VarArr = this.f96838a;
        Intrinsics.d(f1VarArr);
        f1 f1Var = f1VarArr[i11];
        Intrinsics.d(f1Var);
        f1 f1Var2 = f1VarArr[i5];
        Intrinsics.d(f1Var2);
        f1VarArr[i5] = f1Var;
        f1VarArr[i11] = f1Var2;
        f1Var.f88793b = i5;
        f1Var2.f88793b = i11;
    }
}
