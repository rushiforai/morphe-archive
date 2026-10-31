package hf;

import android.net.Uri;
import fe.e;
import ge.d;
import java.util.Arrays;
import wf.v;

/* loaded from: classes3.dex */
public final class b implements e {

    /* renamed from: f, reason: collision with root package name */
    public static final b f59845f = new b(new a[0], 0, -9223372036854775807L, 0);

    /* renamed from: g, reason: collision with root package name */
    public static final a f59846g;

    /* renamed from: h, reason: collision with root package name */
    public static final d f59847h;

    /* renamed from: a, reason: collision with root package name */
    public final int f59848a;

    /* renamed from: b, reason: collision with root package name */
    public final long f59849b;

    /* renamed from: c, reason: collision with root package name */
    public final long f59850c;

    /* renamed from: d, reason: collision with root package name */
    public final int f59851d;

    /* renamed from: e, reason: collision with root package name */
    public final a[] f59852e;

    static {
        int iMax = Math.max(0, 0);
        int[] iArrCopyOf = Arrays.copyOf(new int[0], iMax);
        Arrays.fill(iArrCopyOf, 0, iMax, 0);
        int iMax2 = Math.max(0, 0);
        long[] jArrCopyOf = Arrays.copyOf(new long[0], iMax2);
        Arrays.fill(jArrCopyOf, 0, iMax2, -9223372036854775807L);
        f59846g = new a(0L, 0, -1, iArrCopyOf, (Uri[]) Arrays.copyOf(new Uri[0], 0), jArrCopyOf, 0L, false);
        f59847h = new d(11);
    }

    public b(a[] aVarArr, long j11, long j12, int i5) {
        this.f59849b = j11;
        this.f59850c = j12;
        this.f59848a = aVarArr.length + i5;
        this.f59852e = aVarArr;
        this.f59851d = i5;
    }

    public final a a(int i5) {
        int i11 = this.f59851d;
        return i5 < i11 ? f59846g : this.f59852e[i5 - i11];
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || b.class != obj.getClass()) {
            return false;
        }
        b bVar = (b) obj;
        int i5 = v.f94376a;
        return this.f59848a == bVar.f59848a && this.f59849b == bVar.f59849b && this.f59850c == bVar.f59850c && this.f59851d == bVar.f59851d && Arrays.equals(this.f59852e, bVar.f59852e);
    }

    public final int hashCode() {
        return (((((((this.f59848a * 961) + ((int) this.f59849b)) * 31) + ((int) this.f59850c)) * 31) + this.f59851d) * 31) + Arrays.hashCode(this.f59852e);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AdPlaybackState(adsId=null, adResumePositionUs=");
        sb2.append(this.f59849b);
        sb2.append(", adGroups=[");
        int i5 = 0;
        while (true) {
            a[] aVarArr = this.f59852e;
            if (i5 >= aVarArr.length) {
                sb2.append("])");
                return sb2.toString();
            }
            sb2.append("adGroup(timeUs=");
            sb2.append(aVarArr[i5].f59837a);
            sb2.append(", ads=[");
            for (int i11 = 0; i11 < aVarArr[i5].f59841e.length; i11++) {
                sb2.append("ad(state=");
                int i12 = aVarArr[i5].f59841e[i11];
                if (i12 == 0) {
                    sb2.append('_');
                } else if (i12 == 1) {
                    sb2.append('R');
                } else if (i12 == 2) {
                    sb2.append('S');
                } else if (i12 == 3) {
                    sb2.append('P');
                } else if (i12 != 4) {
                    sb2.append('?');
                } else {
                    sb2.append('!');
                }
                sb2.append(", durationUs=");
                sb2.append(aVarArr[i5].f59842f[i11]);
                sb2.append(')');
                if (i11 < aVarArr[i5].f59841e.length - 1) {
                    sb2.append(", ");
                }
            }
            sb2.append("])");
            if (i5 < aVarArr.length - 1) {
                sb2.append(", ");
            }
            i5++;
        }
    }
}
