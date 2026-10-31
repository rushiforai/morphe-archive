package sf;

import android.text.Layout;
import com.google.android.gms.internal.measurement.k2;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: c, reason: collision with root package name */
    public CharSequence f87399c;

    /* renamed from: a, reason: collision with root package name */
    public long f87397a = 0;

    /* renamed from: b, reason: collision with root package name */
    public long f87398b = 0;

    /* renamed from: d, reason: collision with root package name */
    public int f87400d = 2;

    /* renamed from: e, reason: collision with root package name */
    public float f87401e = -3.4028235E38f;

    /* renamed from: f, reason: collision with root package name */
    public int f87402f = 1;

    /* renamed from: g, reason: collision with root package name */
    public int f87403g = 0;

    /* renamed from: h, reason: collision with root package name */
    public float f87404h = -3.4028235E38f;

    /* renamed from: i, reason: collision with root package name */
    public int f87405i = Integer.MIN_VALUE;

    /* renamed from: j, reason: collision with root package name */
    public float f87406j = 1.0f;

    /* renamed from: k, reason: collision with root package name */
    public int f87407k = Integer.MIN_VALUE;

    /* JADX WARN: Removed duplicated region for block: B:20:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x006b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final jf.a a() {
        Layout.Alignment alignment;
        float f11 = this.f87404h;
        float f12 = -3.4028235E38f;
        if (f11 == -3.4028235E38f) {
            int i5 = this.f87400d;
            f11 = i5 != 4 ? i5 != 5 ? 0.5f : 1.0f : 0.0f;
        }
        int i11 = this.f87405i;
        if (i11 == Integer.MIN_VALUE) {
            int i12 = this.f87400d;
            if (i12 == 1) {
                i11 = 0;
            } else if (i12 == 3) {
                i11 = 2;
            } else if (i12 != 4) {
                if (i12 != 5) {
                    i11 = 1;
                }
            }
        }
        jf.a aVar = new jf.a();
        int i13 = this.f87400d;
        if (i13 == 1) {
            alignment = Layout.Alignment.ALIGN_NORMAL;
        } else if (i13 == 2) {
            alignment = Layout.Alignment.ALIGN_CENTER;
        } else if (i13 == 3) {
            alignment = Layout.Alignment.ALIGN_OPPOSITE;
        } else if (i13 != 4) {
            if (i13 != 5) {
                k2.t(i13, "Unknown textAlignment: ", "WebvttCueParser");
                alignment = null;
            }
        }
        aVar.f69491c = alignment;
        float f13 = this.f87401e;
        int i14 = this.f87402f;
        if (f13 == -3.4028235E38f || i14 != 0 || (f13 >= 0.0f && f13 <= 1.0f)) {
            if (f13 != -3.4028235E38f) {
                f12 = f13;
            } else if (i14 == 0) {
                f12 = 1.0f;
            }
        }
        aVar.f69493e = f12;
        aVar.f69494f = i14;
        aVar.f69495g = this.f87403g;
        aVar.f69496h = f11;
        aVar.f69497i = i11;
        float f14 = this.f87406j;
        if (i11 == 0) {
            f11 = 1.0f - f11;
        } else if (i11 == 1) {
            f11 = f11 <= 0.5f ? f11 * 2.0f : (1.0f - f11) * 2.0f;
        } else if (i11 != 2) {
            throw new IllegalStateException(String.valueOf(i11));
        }
        aVar.f69500l = Math.min(f14, f11);
        aVar.f69502p = this.f87407k;
        CharSequence charSequence = this.f87399c;
        if (charSequence != null) {
            aVar.f69489a = charSequence;
        }
        return aVar;
    }
}
