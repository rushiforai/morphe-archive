package z;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class w0 {

    /* renamed from: a, reason: collision with root package name */
    public long[] f97850a;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f97851b;

    /* renamed from: c, reason: collision with root package name */
    public long[] f97852c;

    /* renamed from: d, reason: collision with root package name */
    public int f97853d;

    /* renamed from: e, reason: collision with root package name */
    public int f97854e;

    /* renamed from: f, reason: collision with root package name */
    public int f97855f;

    /* renamed from: g, reason: collision with root package name */
    public int f97856g;

    /* JADX WARN: Code restructure failed: missing block: B:15:0x006e, code lost:
    
        if (((r7 & ((~r7) << 6)) & (-9187201950435737472L)) == 0) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0070, code lost:
    
        r11 = -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(Object obj) {
        int iNumberOfTrailingZeros;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * (-862048943);
        int i5 = iHashCode ^ (iHashCode << 16);
        int i11 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i12 = this.f97855f;
        int i13 = (i5 >>> 7) & i12;
        int i14 = 0;
        loop0: while (true) {
            long[] jArr = this.f97850a;
            int i15 = i13 >> 3;
            int i16 = (i13 & 7) << 3;
            long j11 = ((jArr[i15 + 1] << (64 - i16)) & ((-i16) >> 63)) | (jArr[i15] >>> i16);
            long j12 = (i11 * 72340172838076673L) ^ j11;
            long j13 = (~j12) & (j12 - 72340172838076673L) & (-9187201950435737472L);
            while (true) {
                if (j13 == 0) {
                    break;
                }
                iNumberOfTrailingZeros = ((Long.numberOfTrailingZeros(j13) >> 3) + i13) & i12;
                if (Intrinsics.b(this.f97851b[iNumberOfTrailingZeros], obj)) {
                    break loop0;
                }
                j13 &= j13 - 1;
            }
            i14 += 8;
            i13 = (i13 + i14) & i12;
        }
        return iNumberOfTrailingZeros >= 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0058  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof w0)) {
            return false;
        }
        w0 w0Var = (w0) obj;
        if (w0Var.f97856g != this.f97856g) {
            return false;
        }
        Object[] objArr = this.f97851b;
        long[] jArr = this.f97850a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i5 = 0;
            while (true) {
                long j11 = jArr[i5];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i11 = 8 - ((~(i5 - length)) >>> 31);
                    for (int i12 = 0; i12 < i11; i12++) {
                        if ((255 & j11) < 128 && !w0Var.a(objArr[(i5 << 3) + i12])) {
                            return false;
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
        return true;
    }

    public final int hashCode() {
        int iHashCode = (this.f97855f * 31) + this.f97856g;
        Object[] objArr = this.f97851b;
        long[] jArr = this.f97850a;
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
                            if (!Intrinsics.b(obj, this)) {
                                iHashCode += obj != null ? obj.hashCode() : 0;
                            }
                        }
                        j11 >>= 8;
                    }
                    if (i11 != 8) {
                        return iHashCode;
                    }
                }
                if (i5 == length) {
                    break;
                }
                i5++;
            }
        }
        return iHashCode;
    }

    public final String toString() {
        v2.k0 k0Var = new v2.k0(this, 2);
        StringBuilder sb2 = new StringBuilder("[");
        Object[] objArr = this.f97851b;
        long[] jArr = this.f97852c;
        int i5 = this.f97854e;
        int i11 = 0;
        while (true) {
            if (i5 == Integer.MAX_VALUE) {
                sb2.append((CharSequence) "]");
                break;
            }
            int i12 = (int) ((jArr[i5] >> 31) & 2147483647L);
            Object obj = objArr[i5];
            if (i11 == -1) {
                sb2.append((CharSequence) "...");
                break;
            }
            if (i11 != 0) {
                sb2.append((CharSequence) ", ");
            }
            sb2.append((CharSequence) k0Var.invoke(obj));
            i11++;
            i5 = i12;
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
