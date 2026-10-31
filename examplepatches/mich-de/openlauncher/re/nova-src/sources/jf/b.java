package jf;

import android.graphics.Bitmap;
import android.text.Layout;
import android.text.Spanned;
import android.text.SpannedString;
import android.text.TextUtils;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class b implements fe.e {

    /* renamed from: r, reason: collision with root package name */
    public static final b f69504r = new b(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null, null, null, -3.4028235E38f, Integer.MIN_VALUE, Integer.MIN_VALUE, -3.4028235E38f, Integer.MIN_VALUE, Integer.MIN_VALUE, -3.4028235E38f, -3.4028235E38f, -3.4028235E38f, false, -16777216, Integer.MIN_VALUE, 0.0f);

    /* renamed from: s, reason: collision with root package name */
    public static final ge.d f69505s = new ge.d(21);

    /* renamed from: a, reason: collision with root package name */
    public final CharSequence f69506a;

    /* renamed from: b, reason: collision with root package name */
    public final Layout.Alignment f69507b;

    /* renamed from: c, reason: collision with root package name */
    public final Layout.Alignment f69508c;

    /* renamed from: d, reason: collision with root package name */
    public final Bitmap f69509d;

    /* renamed from: e, reason: collision with root package name */
    public final float f69510e;

    /* renamed from: f, reason: collision with root package name */
    public final int f69511f;

    /* renamed from: g, reason: collision with root package name */
    public final int f69512g;

    /* renamed from: h, reason: collision with root package name */
    public final float f69513h;

    /* renamed from: i, reason: collision with root package name */
    public final int f69514i;

    /* renamed from: j, reason: collision with root package name */
    public final float f69515j;

    /* renamed from: k, reason: collision with root package name */
    public final float f69516k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f69517l;

    /* renamed from: m, reason: collision with root package name */
    public final int f69518m;
    public final int n;
    public final float o;

    /* renamed from: p, reason: collision with root package name */
    public final int f69519p;

    /* renamed from: q, reason: collision with root package name */
    public final float f69520q;

    public b(CharSequence charSequence, Layout.Alignment alignment, Layout.Alignment alignment2, Bitmap bitmap, float f11, int i5, int i11, float f12, int i12, int i13, float f13, float f14, float f15, boolean z11, int i14, int i15, float f16) {
        if (charSequence == null) {
            bitmap.getClass();
        } else {
            wf.a.e(bitmap == null);
        }
        if (charSequence instanceof Spanned) {
            this.f69506a = SpannedString.valueOf(charSequence);
        } else if (charSequence != null) {
            this.f69506a = charSequence.toString();
        } else {
            this.f69506a = null;
        }
        this.f69507b = alignment;
        this.f69508c = alignment2;
        this.f69509d = bitmap;
        this.f69510e = f11;
        this.f69511f = i5;
        this.f69512g = i11;
        this.f69513h = f12;
        this.f69514i = i12;
        this.f69515j = f14;
        this.f69516k = f15;
        this.f69517l = z11;
        this.f69518m = i14;
        this.n = i13;
        this.o = f13;
        this.f69519p = i15;
        this.f69520q = f16;
    }

    public final a a() {
        a aVar = new a();
        aVar.f69489a = this.f69506a;
        aVar.f69490b = this.f69509d;
        aVar.f69491c = this.f69507b;
        aVar.f69492d = this.f69508c;
        aVar.f69493e = this.f69510e;
        aVar.f69494f = this.f69511f;
        aVar.f69495g = this.f69512g;
        aVar.f69496h = this.f69513h;
        aVar.f69497i = this.f69514i;
        aVar.f69498j = this.n;
        aVar.f69499k = this.o;
        aVar.f69500l = this.f69515j;
        aVar.f69501m = this.f69516k;
        aVar.n = this.f69517l;
        aVar.o = this.f69518m;
        aVar.f69502p = this.f69519p;
        aVar.f69503q = this.f69520q;
        return aVar;
    }

    public final boolean equals(Object obj) {
        Bitmap bitmap;
        if (this == obj) {
            return true;
        }
        if (obj != null && b.class == obj.getClass()) {
            b bVar = (b) obj;
            Bitmap bitmap2 = bVar.f69509d;
            if (TextUtils.equals(this.f69506a, bVar.f69506a) && this.f69507b == bVar.f69507b && this.f69508c == bVar.f69508c && ((bitmap = this.f69509d) != null ? !(bitmap2 == null || !bitmap.sameAs(bitmap2)) : bitmap2 == null) && this.f69510e == bVar.f69510e && this.f69511f == bVar.f69511f && this.f69512g == bVar.f69512g && this.f69513h == bVar.f69513h && this.f69514i == bVar.f69514i && this.f69515j == bVar.f69515j && this.f69516k == bVar.f69516k && this.f69517l == bVar.f69517l && this.f69518m == bVar.f69518m && this.n == bVar.n && this.o == bVar.o && this.f69519p == bVar.f69519p && this.f69520q == bVar.f69520q) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f69506a, this.f69507b, this.f69508c, this.f69509d, Float.valueOf(this.f69510e), Integer.valueOf(this.f69511f), Integer.valueOf(this.f69512g), Float.valueOf(this.f69513h), Integer.valueOf(this.f69514i), Float.valueOf(this.f69515j), Float.valueOf(this.f69516k), Boolean.valueOf(this.f69517l), Integer.valueOf(this.f69518m), Integer.valueOf(this.n), Float.valueOf(this.o), Integer.valueOf(this.f69519p), Float.valueOf(this.f69520q)});
    }
}
