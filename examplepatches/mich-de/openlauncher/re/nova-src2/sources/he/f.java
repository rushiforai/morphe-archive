package he;

import android.util.Pair;
import fe.k0;
import java.util.Arrays;
import xk.x0;

/* loaded from: classes3.dex */
public final class f {

    /* renamed from: c, reason: collision with root package name */
    public static final f f59690c = new f(new int[]{2}, 8);

    /* renamed from: d, reason: collision with root package name */
    public static final f f59691d = new f(new int[]{2, 5, 6}, 8);

    /* renamed from: e, reason: collision with root package name */
    public static final x0 f59692e;

    /* renamed from: a, reason: collision with root package name */
    public final int[] f59693a;

    /* renamed from: b, reason: collision with root package name */
    public final int f59694b;

    static {
        c30.c cVar = new c30.c(4);
        cVar.p(5, 6);
        cVar.p(17, 6);
        cVar.p(7, 6);
        cVar.p(18, 6);
        cVar.p(6, 8);
        cVar.p(8, 8);
        cVar.p(14, 8);
        f59692e = cVar.c(true);
    }

    public f(int[] iArr, int i5) {
        if (iArr != null) {
            int[] iArrCopyOf = Arrays.copyOf(iArr, iArr.length);
            this.f59693a = iArrCopyOf;
            Arrays.sort(iArrCopyOf);
        } else {
            this.f59693a = new int[0];
        }
        this.f59694b = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00a3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Pair a(k0 k0Var) {
        int iIntValue;
        int iK;
        String str = k0Var.f54883l;
        str.getClass();
        int iA = wf.j.a(str, k0Var.f54880i);
        Integer numValueOf = Integer.valueOf(iA);
        x0 x0Var = f59692e;
        if (x0Var.containsKey(numValueOf)) {
            int[] iArr = this.f59693a;
            int i5 = 6;
            if (iA == 18 && Arrays.binarySearch(iArr, 18) < 0) {
                iA = 6;
            } else if (iA == 8 && Arrays.binarySearch(iArr, 8) < 0) {
                iA = 7;
            }
            if (Arrays.binarySearch(iArr, iA) < 0) {
                return null;
            }
            int i11 = k0Var.f54894y;
            if (i11 == -1 || iA == 18) {
                int i12 = k0Var.f54895z;
                if (i12 == -1) {
                    i12 = 48000;
                }
                if (wf.v.f94376a >= 29) {
                    iIntValue = e.b(iA, i12);
                } else {
                    Object obj = x0Var.get(Integer.valueOf(iA));
                    iIntValue = ((Integer) (obj != null ? obj : 0)).intValue();
                }
                i11 = iIntValue;
            } else if (i11 <= this.f59694b) {
            }
            int i13 = wf.v.f94376a;
            if (i13 > 28) {
                i5 = i11;
                if (i13 <= 26 && "fugu".equals(wf.v.f94377b) && i5 == 1) {
                    i5 = 2;
                }
                iK = wf.v.k(i5);
                if (iK != 0) {
                    return Pair.create(Integer.valueOf(iA), Integer.valueOf(iK));
                }
            } else {
                if (i11 == 7) {
                    i5 = 8;
                } else if (i11 != 3 && i11 != 4 && i11 != 5) {
                }
                if (i13 <= 26) {
                    i5 = 2;
                }
                iK = wf.v.k(i5);
                if (iK != 0) {
                }
            }
        }
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return Arrays.equals(this.f59693a, fVar.f59693a) && this.f59694b == fVar.f59694b;
    }

    public final int hashCode() {
        return (Arrays.hashCode(this.f59693a) * 31) + this.f59694b;
    }

    public final String toString() {
        return "AudioCapabilities[maxChannelCount=" + this.f59694b + ", supportedEncodings=" + Arrays.toString(this.f59693a) + "]";
    }
}
