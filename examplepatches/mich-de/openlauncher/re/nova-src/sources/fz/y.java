package fz;

import android.graphics.drawable.LayerDrawable;
import java.util.Calendar;

/* loaded from: classes4.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public int f56387a;

    /* renamed from: b, reason: collision with root package name */
    public int f56388b;

    /* renamed from: c, reason: collision with root package name */
    public int f56389c;

    /* renamed from: d, reason: collision with root package name */
    public int f56390d;

    /* renamed from: e, reason: collision with root package name */
    public int f56391e;

    /* renamed from: f, reason: collision with root package name */
    public int f56392f;

    /* renamed from: g, reason: collision with root package name */
    public Object f56393g;

    /* JADX WARN: Removed duplicated region for block: B:7:0x0046  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean a(Calendar calendar, LayerDrawable layerDrawable) {
        boolean z11;
        calendar.setTimeInMillis(System.currentTimeMillis());
        int i5 = ((12 - this.f56390d) + calendar.get(10)) % 12;
        int i11 = ((60 - this.f56391e) + calendar.get(12)) % 60;
        int i12 = ((60 - this.f56392f) + calendar.get(13)) % 60;
        int i13 = this.f56387a;
        if (i13 != -1) {
            z11 = layerDrawable.getDrawable(i13).setLevel(calendar.get(12) + (i5 * 60));
        }
        int i14 = this.f56388b;
        if (i14 != -1 && layerDrawable.getDrawable(i14).setLevel((calendar.get(10) * 60) + i11)) {
            z11 = true;
        }
        int i15 = this.f56389c;
        if (i15 == -1 || !layerDrawable.getDrawable(i15).setLevel(i12 * 10)) {
            return z11;
        }
        return true;
    }

    public boolean b(int i5) {
        int i11;
        int i12;
        int i13;
        int i14;
        if ((i5 & (-2097152)) != -2097152 || (i11 = (i5 >>> 19) & 3) == 1 || (i12 = (i5 >>> 17) & 3) == 0 || (i13 = (i5 >>> 12) & 15) == 0 || i13 == 15 || (i14 = (i5 >>> 10) & 3) == 3) {
            return false;
        }
        this.f56387a = i11;
        this.f56393g = he.a.f59666m[3 - i12];
        int i15 = he.a.n[i14];
        this.f56389c = i15;
        if (i11 == 2) {
            this.f56389c = i15 / 2;
        } else if (i11 == 0) {
            this.f56389c = i15 / 4;
        }
        int i16 = (i5 >>> 9) & 1;
        int i17 = 1152;
        if (i12 != 1) {
            if (i12 != 2) {
                if (i12 != 3) {
                    throw new IllegalArgumentException();
                }
                i17 = 384;
            }
        } else if (i11 != 3) {
            i17 = 576;
        }
        this.f56392f = i17;
        if (i12 == 3) {
            int i18 = i11 == 3 ? he.a.o[i13 - 1] : he.a.f59667p[i13 - 1];
            this.f56391e = i18;
            this.f56388b = (((i18 * 12) / this.f56389c) + i16) * 4;
        } else {
            if (i11 == 3) {
                int i19 = i12 == 2 ? he.a.f59668q[i13 - 1] : he.a.f59669r[i13 - 1];
                this.f56391e = i19;
                this.f56388b = ((i19 * 144) / this.f56389c) + i16;
            } else {
                int i21 = he.a.f59670s[i13 - 1];
                this.f56391e = i21;
                this.f56388b = (((i12 == 1 ? 72 : 144) * i21) / this.f56389c) + i16;
            }
        }
        this.f56390d = ((i5 >> 6) & 3) == 3 ? 1 : 2;
        return true;
    }
}
