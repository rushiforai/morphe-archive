package r1;

import kotlin.jvm.internal.Intrinsics;
import z.j0;
import z.o0;
import z.v0;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final o0 f85068a;

    public static final void a(o0 o0Var, Object obj, Object obj2) {
        int i5 = o0Var.i(obj);
        boolean z11 = i5 < 0;
        Object obj3 = z11 ? null : o0Var.f97868c[i5];
        if (obj3 != null) {
            if (obj3 instanceof j0) {
                j0 j0Var = (j0) obj3;
                j0Var.g(obj2);
                obj2 = j0Var;
            } else {
                Object[] objArr = v0.f97846a;
                j0 j0Var2 = new j0(2);
                j0Var2.g(obj3);
                j0Var2.g(obj2);
                obj2 = j0Var2;
            }
        }
        if (!z11) {
            o0Var.f97868c[i5] = obj2;
            return;
        }
        int i11 = ~i5;
        o0Var.f97867b[i11] = obj;
        o0Var.f97868c[i11] = obj2;
    }

    public static final Object b(o0 o0Var) {
        Object objD = o0Var.d(null);
        if (objD == null) {
            return null;
        }
        if (!(objD instanceof j0)) {
            o0Var.k(null);
            return objD;
        }
        j0 j0Var = (j0) objD;
        Object objM = ps.f.m(j0Var);
        Intrinsics.e(objM, "null cannot be cast to non-null type V of androidx.compose.runtime.collection.MultiValueMap");
        if (j0Var.d()) {
            o0Var.k(null);
        }
        if (j0Var.f97841b == 1) {
            o0Var.m(null, j0Var.a());
        }
        return objM;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0083  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final j0 c(o0 o0Var) {
        if (o0Var.e()) {
            j0 j0Var = v0.f97847b;
            Intrinsics.e(j0Var, "null cannot be cast to non-null type androidx.collection.ObjectList<E of androidx.collection.ObjectListKt.emptyObjectList>");
            return j0Var;
        }
        j0 j0Var2 = new j0();
        Object[] objArr = o0Var.f97868c;
        long[] jArr = o0Var.f97866a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i5 = 0;
            while (true) {
                long j11 = jArr[i5];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i11 = 8 - ((~(i5 - length)) >>> 31);
                    for (int i12 = 0; i12 < i11; i12++) {
                        if ((255 & j11) < 128) {
                            Object obj = objArr[(i5 << 3) + i12];
                            if (obj instanceof j0) {
                                j0 j0Var3 = (j0) obj;
                                if (!j0Var3.d()) {
                                    int i13 = j0Var2.f97841b + j0Var3.f97841b;
                                    Object[] objArr2 = j0Var2.f97840a;
                                    if (objArr2.length < i13) {
                                        j0Var2.m(i13, objArr2);
                                    }
                                    u90.b.t(j0Var3.f97840a, j0Var2.f97841b, j0Var2.f97840a, 0, j0Var3.f97841b);
                                    j0Var2.f97841b += j0Var3.f97841b;
                                }
                            } else {
                                Intrinsics.e(obj, "null cannot be cast to non-null type V of androidx.compose.runtime.collection.MultiValueMap");
                                j0Var2.g(obj);
                            }
                        }
                        j11 >>= 8;
                    }
                    if (i11 != 8) {
                        break;
                    }
                    if (i5 == length) {
                        break;
                    }
                    i5++;
                }
            }
        }
        return j0Var2;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof a) {
            return Intrinsics.b(this.f85068a, ((a) obj).f85068a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f85068a.hashCode();
    }

    public final String toString() {
        return "MultiValueMap(map=" + this.f85068a + ')';
    }
}
