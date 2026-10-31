package z;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class s0 {

    /* renamed from: a, reason: collision with root package name */
    public long[] f97829a;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f97830b;

    /* renamed from: c, reason: collision with root package name */
    public int[] f97831c;

    /* renamed from: d, reason: collision with root package name */
    public int f97832d;

    /* renamed from: e, reason: collision with root package name */
    public int f97833e;

    public final int a(Object obj) {
        int i5 = 0;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * (-862048943);
        int i11 = iHashCode ^ (iHashCode << 16);
        int i12 = i11 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i13 = this.f97832d;
        int i14 = i11 >>> 7;
        while (true) {
            int i15 = i14 & i13;
            long[] jArr = this.f97829a;
            int i16 = i15 >> 3;
            int i17 = (i15 & 7) << 3;
            long j11 = ((jArr[i16 + 1] << (64 - i17)) & ((-i17) >> 63)) | (jArr[i16] >>> i17);
            long j12 = (i12 * 72340172838076673L) ^ j11;
            for (long j13 = (~j12) & (j12 - 72340172838076673L) & (-9187201950435737472L); j13 != 0; j13 &= j13 - 1) {
                int iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j13) >> 3) + i15) & i13;
                if (Intrinsics.b(this.f97830b[iNumberOfTrailingZeros], obj)) {
                    return iNumberOfTrailingZeros;
                }
            }
            if ((j11 & ((~j11) << 6) & (-9187201950435737472L)) != 0) {
                return -1;
            }
            i5 += 8;
            i14 = i15 + i5;
        }
    }

    public final int b(Object obj) {
        int iA = a(obj);
        if (iA >= 0) {
            return this.f97831c[iA];
        }
        android.support.v4.media.session.b.n0("There is no key " + obj + " in the map");
        throw null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x005d, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean equals(Object obj) {
        boolean z11;
        boolean z12;
        boolean z13 = true;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof s0)) {
            return false;
        }
        s0 s0Var = (s0) obj;
        if (s0Var.f97833e != this.f97833e) {
            return false;
        }
        Object[] objArr = this.f97830b;
        int[] iArr = this.f97831c;
        long[] jArr = this.f97829a;
        int length = jArr.length - 2;
        if (length < 0) {
            return true;
        }
        int i5 = 0;
        loop0: while (true) {
            long j11 = jArr[i5];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i11 = 8 - ((~(i5 - length)) >>> 31);
                int i12 = 0;
                while (i12 < i11) {
                    if ((255 & j11) < 128) {
                        int i13 = (i5 << 3) + i12;
                        Object obj2 = objArr[i13];
                        int i14 = iArr[i13];
                        int iA = s0Var.a(obj2);
                        if (iA < 0) {
                            break loop0;
                        }
                        z12 = z13;
                        if (i14 != s0Var.f97831c[iA]) {
                            break loop0;
                        }
                    } else {
                        z12 = z13;
                    }
                    j11 >>= 8;
                    i12++;
                    z13 = z12;
                }
                z11 = z13;
                if (i11 != 8) {
                    return z11;
                }
            } else {
                z11 = z13;
            }
            if (i5 == length) {
                return z11;
            }
            i5++;
            z13 = z11;
        }
    }

    public final int hashCode() {
        Object[] objArr = this.f97830b;
        int[] iArr = this.f97831c;
        long[] jArr = this.f97829a;
        int length = jArr.length - 2;
        if (length < 0) {
            return 0;
        }
        int i5 = 0;
        int iHashCode = 0;
        while (true) {
            long j11 = jArr[i5];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i11 = 8 - ((~(i5 - length)) >>> 31);
                for (int i12 = 0; i12 < i11; i12++) {
                    if ((255 & j11) < 128) {
                        int i13 = (i5 << 3) + i12;
                        Object obj = objArr[i13];
                        iHashCode += Integer.hashCode(iArr[i13]) ^ (obj != null ? obj.hashCode() : 0);
                    }
                    j11 >>= 8;
                }
                if (i11 != 8) {
                    return iHashCode;
                }
            }
            if (i5 == length) {
                return iHashCode;
            }
            i5++;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x006a A[PHI: r8
      0x006a: PHI (r8v2 int) = (r8v1 int), (r8v3 int) binds: [B:10:0x002c, B:22:0x0068] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String toString() {
        if (this.f97833e == 0) {
            return "{}";
        }
        StringBuilder sb2 = new StringBuilder("{");
        Object[] objArr = this.f97830b;
        int[] iArr = this.f97831c;
        long[] jArr = this.f97829a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i5 = 0;
            int i11 = 0;
            while (true) {
                long j11 = jArr[i5];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i12 = 8 - ((~(i5 - length)) >>> 31);
                    for (int i13 = 0; i13 < i12; i13++) {
                        if ((255 & j11) < 128) {
                            int i14 = (i5 << 3) + i13;
                            Object obj = objArr[i14];
                            int i15 = iArr[i14];
                            if (obj == this) {
                                obj = "(this)";
                            }
                            sb2.append(obj);
                            sb2.append("=");
                            sb2.append(i15);
                            i11++;
                            if (i11 < this.f97833e) {
                                sb2.append(", ");
                            }
                        }
                        j11 >>= 8;
                    }
                    if (i12 != 8) {
                        break;
                    }
                    if (i5 == length) {
                        break;
                    }
                    i5++;
                }
            }
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
