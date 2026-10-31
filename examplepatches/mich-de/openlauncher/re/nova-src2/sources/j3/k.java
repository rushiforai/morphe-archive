package j3;

import b.c9;
import java.util.Iterator;
import kotlin.Function;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import z.o0;
import z.z0;

/* loaded from: classes.dex */
public final class k implements b0, Iterable, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final o0 f68812a;

    /* renamed from: b, reason: collision with root package name */
    public z.z f68813b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f68814c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f68815d;

    public k() {
        long[] jArr = z0.f97875a;
        this.f68812a = new o0();
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x005d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final k c() {
        k kVar = new k();
        kVar.f68814c = this.f68814c;
        kVar.f68815d = this.f68815d;
        o0 o0Var = kVar.f68812a;
        o0Var.getClass();
        o0 from = this.f68812a;
        Intrinsics.g(from, "from");
        Object[] objArr = from.f97867b;
        Object[] objArr2 = from.f97868c;
        long[] jArr = from.f97866a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i5 = 0;
            while (true) {
                long j11 = jArr[i5];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i11 = 8 - ((~(i5 - length)) >>> 31);
                    for (int i12 = 0; i12 < i11; i12++) {
                        if ((255 & j11) < 128) {
                            int i13 = (i5 << 3) + i12;
                            o0Var.m(objArr[i13], objArr2[i13]);
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
        return kVar;
    }

    public final Object d(a0 a0Var) {
        Object objD = this.f68812a.d(a0Var);
        if (objD != null) {
            return objD;
        }
        throw new IllegalStateException("Key not present: " + a0Var + " - consider getOrElse or getOrNull");
    }

    public final void e(k kVar) {
        o0 o0Var = kVar.f68812a;
        Object[] objArr = o0Var.f97867b;
        Object[] objArr2 = o0Var.f97868c;
        long[] jArr = o0Var.f97866a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i5 = 0;
        while (true) {
            long j11 = jArr[i5];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i11 = 8 - ((~(i5 - length)) >>> 31);
                for (int i12 = 0; i12 < i11; i12++) {
                    if ((255 & j11) < 128) {
                        int i13 = (i5 << 3) + i12;
                        Object obj = objArr[i13];
                        Object obj2 = objArr2[i13];
                        a0 a0Var = (a0) obj;
                        o0 o0Var2 = this.f68812a;
                        Object objD = o0Var2.d(a0Var);
                        Intrinsics.e(a0Var, "null cannot be cast to non-null type androidx.compose.ui.semantics.SemanticsPropertyKey<kotlin.Any?>");
                        Object objInvoke = a0Var.f68767b.invoke(objD, obj2);
                        if (objInvoke != null) {
                            o0Var2.m(a0Var, objInvoke);
                        }
                    }
                    j11 >>= 8;
                }
                if (i11 != 8) {
                    return;
                }
            }
            if (i5 == length) {
                return;
            } else {
                i5++;
            }
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return Intrinsics.b(this.f68812a, kVar.f68812a) && this.f68814c == kVar.f68814c && this.f68815d == kVar.f68815d;
    }

    public final void f(a0 a0Var, Object obj) {
        boolean z11 = obj instanceof a;
        o0 o0Var = this.f68812a;
        if (z11 && o0Var.b(a0Var)) {
            Object objD = o0Var.d(a0Var);
            Intrinsics.e(objD, "null cannot be cast to non-null type androidx.compose.ui.semantics.AccessibilityAction<*>");
            a aVar = (a) objD;
            a aVar2 = (a) obj;
            String str = aVar2.f68764a;
            if (str == null) {
                str = aVar.f68764a;
            }
            Function function = aVar2.f68765b;
            if (function == null) {
                function = aVar.f68765b;
            }
            o0Var.m(a0Var, new a(str, function));
        } else {
            o0Var.m(a0Var, obj);
        }
        a0Var.getClass();
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f68815d) + c9.f(this.f68812a.hashCode() * 31, 31, this.f68814c);
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        z.z zVar = this.f68813b;
        if (zVar == null) {
            o0 o0Var = this.f68812a;
            o0Var.getClass();
            z.z zVar2 = new z.z(o0Var);
            this.f68813b = zVar2;
            zVar = zVar2;
        }
        return ((z.g) zVar.entrySet()).iterator();
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0078 A[PHI: r2
      0x0078: PHI (r2v6 java.lang.String) = (r2v5 java.lang.String), (r2v7 java.lang.String) binds: [B:13:0x003f, B:20:0x0076] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String toString() {
        String str;
        StringBuilder sb2 = new StringBuilder();
        if (this.f68814c) {
            sb2.append("mergeDescendants=true");
            str = ", ";
        } else {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (this.f68815d) {
            sb2.append(str);
            sb2.append("isClearingSemantics=true");
            str = ", ";
        }
        o0 o0Var = this.f68812a;
        Object[] objArr = o0Var.f97867b;
        Object[] objArr2 = o0Var.f97868c;
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
                            int i13 = (i5 << 3) + i12;
                            Object obj = objArr[i13];
                            Object obj2 = objArr2[i13];
                            sb2.append(str);
                            sb2.append(((a0) obj).f68766a);
                            sb2.append(" : ");
                            sb2.append(obj2);
                            str = ", ";
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
        return i30.j.T(this) + "{ " + ((Object) sb2) + " }";
    }
}
