package hf;

import android.net.Uri;
import fe.e;
import ge.d;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class a implements e {

    /* renamed from: i, reason: collision with root package name */
    public static final d f59836i = new d(12);

    /* renamed from: a, reason: collision with root package name */
    public final long f59837a;

    /* renamed from: b, reason: collision with root package name */
    public final int f59838b;

    /* renamed from: c, reason: collision with root package name */
    public final int f59839c;

    /* renamed from: d, reason: collision with root package name */
    public final Uri[] f59840d;

    /* renamed from: e, reason: collision with root package name */
    public final int[] f59841e;

    /* renamed from: f, reason: collision with root package name */
    public final long[] f59842f;

    /* renamed from: g, reason: collision with root package name */
    public final long f59843g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f59844h;

    public a(long j11, int i5, int i11, int[] iArr, Uri[] uriArr, long[] jArr, long j12, boolean z11) {
        wf.a.e(iArr.length == uriArr.length);
        this.f59837a = j11;
        this.f59838b = i5;
        this.f59839c = i11;
        this.f59841e = iArr;
        this.f59840d = uriArr;
        this.f59842f = jArr;
        this.f59843g = j12;
        this.f59844h = z11;
    }

    public final int a(int i5) {
        int i11;
        int i12 = i5 + 1;
        while (true) {
            int[] iArr = this.f59841e;
            if (i12 >= iArr.length || this.f59844h || (i11 = iArr[i12]) == 0 || i11 == 1) {
                break;
            }
            i12++;
        }
        return i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && a.class == obj.getClass()) {
            a aVar = (a) obj;
            if (this.f59837a == aVar.f59837a && this.f59838b == aVar.f59838b && this.f59839c == aVar.f59839c && Arrays.equals(this.f59840d, aVar.f59840d) && Arrays.equals(this.f59841e, aVar.f59841e) && Arrays.equals(this.f59842f, aVar.f59842f) && this.f59843g == aVar.f59843g && this.f59844h == aVar.f59844h) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = ((this.f59838b * 31) + this.f59839c) * 31;
        long j11 = this.f59837a;
        int iHashCode = (Arrays.hashCode(this.f59842f) + ((Arrays.hashCode(this.f59841e) + ((((i5 + ((int) (j11 ^ (j11 >>> 32)))) * 31) + Arrays.hashCode(this.f59840d)) * 31)) * 31)) * 31;
        long j12 = this.f59843g;
        return ((iHashCode + ((int) (j12 ^ (j12 >>> 32)))) * 31) + (this.f59844h ? 1 : 0);
    }
}
