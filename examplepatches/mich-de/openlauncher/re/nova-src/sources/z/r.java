package z;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class r {

    /* renamed from: a, reason: collision with root package name */
    public long[] f97822a;

    /* renamed from: b, reason: collision with root package name */
    public long[] f97823b;

    /* renamed from: c, reason: collision with root package name */
    public Object[] f97824c;

    /* renamed from: d, reason: collision with root package name */
    public int f97825d;

    /* renamed from: e, reason: collision with root package name */
    public int f97826e;

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0066, code lost:
    
        if (((r6 & ((~r6) << 6)) & (-9187201950435737472L)) == 0) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0068, code lost:
    
        r10 = -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(long j11) {
        int iNumberOfTrailingZeros;
        int iHashCode = Long.hashCode(j11) * (-862048943);
        int i5 = iHashCode ^ (iHashCode << 16);
        int i11 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i12 = this.f97825d;
        int i13 = (i5 >>> 7) & i12;
        int i14 = 0;
        loop0: while (true) {
            long[] jArr = this.f97822a;
            int i15 = i13 >> 3;
            int i16 = (i13 & 7) << 3;
            long j12 = ((jArr[i15 + 1] << (64 - i16)) & ((-i16) >> 63)) | (jArr[i15] >>> i16);
            long j13 = (i11 * 72340172838076673L) ^ j12;
            long j14 = (~j13) & (j13 - 72340172838076673L) & (-9187201950435737472L);
            while (true) {
                if (j14 == 0) {
                    break;
                }
                iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j14) >> 3) + i13) & i12;
                if (this.f97823b[iNumberOfTrailingZeros] == j11) {
                    break loop0;
                }
                j14 &= j14 - 1;
            }
            i14 += 8;
            i13 = (i13 + i14) & i12;
        }
        return iNumberOfTrailingZeros >= 0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0063, code lost:
    
        if (((r4 & ((~r4) << 6)) & (-9187201950435737472L)) == 0) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0065, code lost:
    
        r10 = -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(long j11) {
        int iNumberOfTrailingZeros;
        int iHashCode = Long.hashCode(j11) * (-862048943);
        int i5 = iHashCode ^ (iHashCode << 16);
        int i11 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i12 = this.f97825d;
        int i13 = (i5 >>> 7) & i12;
        int i14 = 0;
        loop0: while (true) {
            long[] jArr = this.f97822a;
            int i15 = i13 >> 3;
            int i16 = (i13 & 7) << 3;
            long j12 = ((jArr[i15 + 1] << (64 - i16)) & ((-i16) >> 63)) | (jArr[i15] >>> i16);
            long j13 = (i11 * 72340172838076673L) ^ j12;
            long j14 = (~j13) & (j13 - 72340172838076673L) & (-9187201950435737472L);
            while (true) {
                if (j14 == 0) {
                    break;
                }
                iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j14) >> 3) + i13) & i12;
                if (this.f97823b[iNumberOfTrailingZeros] == j11) {
                    break loop0;
                }
                j14 &= j14 - 1;
            }
            i14 += 8;
            i13 = (i13 + i14) & i12;
        }
        if (iNumberOfTrailingZeros >= 0) {
            return this.f97824c[iNumberOfTrailingZeros];
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0060, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean equals(Object obj) {
        boolean z11;
        long[] jArr;
        boolean z12;
        long[] jArr2;
        boolean z13 = true;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        if (rVar.f97826e != this.f97826e) {
            return false;
        }
        long[] jArr3 = this.f97823b;
        Object[] objArr = this.f97824c;
        long[] jArr4 = this.f97822a;
        int length = jArr4.length - 2;
        if (length < 0) {
            return true;
        }
        int i5 = 0;
        loop0: while (true) {
            long j11 = jArr4[i5];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i11 = 8 - ((~(i5 - length)) >>> 31);
                int i12 = 0;
                while (i12 < i11) {
                    if ((255 & j11) < 128) {
                        int i13 = (i5 << 3) + i12;
                        z12 = z13;
                        jArr2 = jArr3;
                        long j12 = jArr2[i13];
                        Object obj2 = objArr[i13];
                        if (obj2 == null) {
                            if (rVar.b(j12) != null || !rVar.a(j12)) {
                                break loop0;
                            }
                        } else if (!obj2.equals(rVar.b(j12))) {
                            return false;
                        }
                    } else {
                        z12 = z13;
                        jArr2 = jArr3;
                    }
                    j11 >>= 8;
                    i12++;
                    z13 = z12;
                    jArr3 = jArr2;
                }
                z11 = z13;
                jArr = jArr3;
                if (i11 != 8) {
                    return z11;
                }
            } else {
                z11 = z13;
                jArr = jArr3;
            }
            if (i5 == length) {
                return z11;
            }
            i5++;
            z13 = z11;
            jArr3 = jArr;
        }
    }

    public final int hashCode() {
        long[] jArr = this.f97823b;
        Object[] objArr = this.f97824c;
        long[] jArr2 = this.f97822a;
        int length = jArr2.length - 2;
        if (length < 0) {
            return 0;
        }
        int i5 = 0;
        int iHashCode = 0;
        while (true) {
            long j11 = jArr2[i5];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i11 = 8 - ((~(i5 - length)) >>> 31);
                for (int i12 = 0; i12 < i11; i12++) {
                    if ((255 & j11) < 128) {
                        int i13 = (i5 << 3) + i12;
                        long j12 = jArr[i13];
                        Object obj = objArr[i13];
                        iHashCode += (obj != null ? obj.hashCode() : 0) ^ Long.hashCode(j12);
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

    public final String toString() {
        int i5;
        int i11;
        if (this.f97826e == 0) {
            return "{}";
        }
        StringBuilder sb2 = new StringBuilder("{");
        long[] jArr = this.f97823b;
        Object[] objArr = this.f97824c;
        long[] jArr2 = this.f97822a;
        int length = jArr2.length - 2;
        if (length >= 0) {
            int i12 = 0;
            int i13 = 0;
            while (true) {
                long j11 = jArr2[i12];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i14 = 8 - ((~(i12 - length)) >>> 31);
                    int i15 = 0;
                    while (i15 < i14) {
                        if ((255 & j11) < 128) {
                            int i16 = (i12 << 3) + i15;
                            i11 = i12;
                            long j12 = jArr[i16];
                            Object obj = objArr[i16];
                            sb2.append(j12);
                            sb2.append("=");
                            if (obj == this) {
                                obj = "(this)";
                            }
                            sb2.append(obj);
                            i13++;
                            if (i13 < this.f97826e) {
                                sb2.append(", ");
                            }
                        } else {
                            i11 = i12;
                        }
                        j11 >>= 8;
                        i15++;
                        i12 = i11;
                    }
                    int i17 = i12;
                    if (i14 != 8) {
                        break;
                    }
                    i5 = i17;
                } else {
                    i5 = i12;
                }
                if (i5 == length) {
                    break;
                }
                i12 = i5 + 1;
            }
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
