package kf;

import android.graphics.Color;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.style.UnderlineSpan;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class e {
    public static final int[] A;
    public static final boolean[] B;
    public static final int[] C;
    public static final int[] D;
    public static final int[] E;
    public static final int[] F;

    /* renamed from: w, reason: collision with root package name */
    public static final int f71483w = c(2, 2, 2, 0);

    /* renamed from: x, reason: collision with root package name */
    public static final int f71484x;

    /* renamed from: y, reason: collision with root package name */
    public static final int[] f71485y;

    /* renamed from: z, reason: collision with root package name */
    public static final int[] f71486z;

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f71487a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final SpannableStringBuilder f71488b = new SpannableStringBuilder();

    /* renamed from: c, reason: collision with root package name */
    public boolean f71489c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f71490d;

    /* renamed from: e, reason: collision with root package name */
    public int f71491e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f71492f;

    /* renamed from: g, reason: collision with root package name */
    public int f71493g;

    /* renamed from: h, reason: collision with root package name */
    public int f71494h;

    /* renamed from: i, reason: collision with root package name */
    public int f71495i;

    /* renamed from: j, reason: collision with root package name */
    public int f71496j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f71497k;

    /* renamed from: l, reason: collision with root package name */
    public int f71498l;

    /* renamed from: m, reason: collision with root package name */
    public int f71499m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public int f71500p;

    /* renamed from: q, reason: collision with root package name */
    public int f71501q;

    /* renamed from: r, reason: collision with root package name */
    public int f71502r;

    /* renamed from: s, reason: collision with root package name */
    public int f71503s;

    /* renamed from: t, reason: collision with root package name */
    public int f71504t;

    /* renamed from: u, reason: collision with root package name */
    public int f71505u;

    /* renamed from: v, reason: collision with root package name */
    public int f71506v;

    static {
        int iC = c(0, 0, 0, 0);
        f71484x = iC;
        int iC2 = c(0, 0, 0, 3);
        f71485y = new int[]{0, 0, 0, 0, 0, 2, 0};
        f71486z = new int[]{0, 0, 0, 0, 0, 0, 2};
        A = new int[]{3, 3, 3, 3, 3, 3, 1};
        B = new boolean[]{false, false, false, true, true, true, false};
        C = new int[]{iC, iC2, iC, iC, iC2, iC, iC};
        D = new int[]{0, 1, 2, 3, 4, 3, 4};
        E = new int[]{0, 0, 0, 0, 0, 3, 3};
        F = new int[]{iC, iC, iC, iC, iC, iC2, iC2};
    }

    public e() {
        d();
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int c(int i5, int i11, int i12, int i13) {
        int i14;
        wf.a.h(i5, 4);
        wf.a.h(i11, 4);
        wf.a.h(i12, 4);
        wf.a.h(i13, 4);
        if (i13 == 0 || i13 == 1) {
            i14 = 255;
        } else if (i13 == 2) {
            i14 = Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        } else if (i13 == 3) {
            i14 = 0;
        }
        return Color.argb(i14, i5 > 1 ? 255 : 0, i11 > 1 ? 255 : 0, i12 <= 1 ? 0 : 255);
    }

    public final void a(char c11) {
        SpannableStringBuilder spannableStringBuilder = this.f71488b;
        if (c11 != '\n') {
            spannableStringBuilder.append(c11);
            return;
        }
        SpannableString spannableStringB = b();
        ArrayList arrayList = this.f71487a;
        arrayList.add(spannableStringB);
        spannableStringBuilder.clear();
        if (this.f71500p != -1) {
            this.f71500p = 0;
        }
        if (this.f71501q != -1) {
            this.f71501q = 0;
        }
        if (this.f71502r != -1) {
            this.f71502r = 0;
        }
        if (this.f71504t != -1) {
            this.f71504t = 0;
        }
        while (true) {
            if ((!this.f71497k || arrayList.size() < this.f71496j) && arrayList.size() < 15) {
                return;
            } else {
                arrayList.remove(0);
            }
        }
    }

    public final SpannableString b() {
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(this.f71488b);
        int length = spannableStringBuilder.length();
        if (length > 0) {
            if (this.f71500p != -1) {
                spannableStringBuilder.setSpan(new StyleSpan(2), this.f71500p, length, 33);
            }
            if (this.f71501q != -1) {
                spannableStringBuilder.setSpan(new UnderlineSpan(), this.f71501q, length, 33);
            }
            if (this.f71502r != -1) {
                spannableStringBuilder.setSpan(new ForegroundColorSpan(this.f71503s), this.f71502r, length, 33);
            }
            if (this.f71504t != -1) {
                spannableStringBuilder.setSpan(new BackgroundColorSpan(this.f71505u), this.f71504t, length, 33);
            }
        }
        return new SpannableString(spannableStringBuilder);
    }

    public final void d() {
        this.f71487a.clear();
        this.f71488b.clear();
        this.f71500p = -1;
        this.f71501q = -1;
        this.f71502r = -1;
        this.f71504t = -1;
        this.f71506v = 0;
        this.f71489c = false;
        this.f71490d = false;
        this.f71491e = 4;
        this.f71492f = false;
        this.f71493g = 0;
        this.f71494h = 0;
        this.f71495i = 0;
        this.f71496j = 15;
        this.f71497k = true;
        this.f71498l = 0;
        this.f71499m = 0;
        this.n = 0;
        int i5 = f71484x;
        this.o = i5;
        this.f71503s = f71483w;
        this.f71505u = i5;
    }

    public final void e(boolean z11, boolean z12) {
        int i5 = this.f71500p;
        SpannableStringBuilder spannableStringBuilder = this.f71488b;
        if (i5 != -1) {
            if (!z11) {
                spannableStringBuilder.setSpan(new StyleSpan(2), this.f71500p, spannableStringBuilder.length(), 33);
                this.f71500p = -1;
            }
        } else if (z11) {
            this.f71500p = spannableStringBuilder.length();
        }
        if (this.f71501q == -1) {
            if (z12) {
                this.f71501q = spannableStringBuilder.length();
            }
        } else {
            if (z12) {
                return;
            }
            spannableStringBuilder.setSpan(new UnderlineSpan(), this.f71501q, spannableStringBuilder.length(), 33);
            this.f71501q = -1;
        }
    }

    public final void f(int i5, int i11) {
        int i12 = this.f71502r;
        SpannableStringBuilder spannableStringBuilder = this.f71488b;
        if (i12 != -1 && this.f71503s != i5) {
            spannableStringBuilder.setSpan(new ForegroundColorSpan(this.f71503s), this.f71502r, spannableStringBuilder.length(), 33);
        }
        if (i5 != f71483w) {
            this.f71502r = spannableStringBuilder.length();
            this.f71503s = i5;
        }
        if (this.f71504t != -1 && this.f71505u != i11) {
            spannableStringBuilder.setSpan(new BackgroundColorSpan(this.f71505u), this.f71504t, spannableStringBuilder.length(), 33);
        }
        if (i11 != f71484x) {
            this.f71504t = spannableStringBuilder.length();
            this.f71505u = i11;
        }
    }
}
