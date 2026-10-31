package x8;

import android.content.Context;
import android.graphics.Bitmap;
import b.c0;
import b.c9;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final Context f95352a;

    /* renamed from: b, reason: collision with root package name */
    public final Bitmap.Config f95353b;

    /* renamed from: c, reason: collision with root package name */
    public final y8.f f95354c;

    /* renamed from: d, reason: collision with root package name */
    public final int f95355d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f95356e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f95357f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f95358g;

    /* renamed from: h, reason: collision with root package name */
    public final x80.u f95359h;

    /* renamed from: i, reason: collision with root package name */
    public final s f95360i;

    /* renamed from: j, reason: collision with root package name */
    public final p f95361j;

    /* renamed from: k, reason: collision with root package name */
    public final int f95362k;

    /* renamed from: l, reason: collision with root package name */
    public final int f95363l;

    /* renamed from: m, reason: collision with root package name */
    public final int f95364m;

    public n(Context context, Bitmap.Config config, y8.f fVar, int i5, boolean z11, boolean z12, boolean z13, x80.u uVar, s sVar, p pVar, int i11, int i12, int i13) {
        this.f95352a = context;
        this.f95353b = config;
        this.f95354c = fVar;
        this.f95355d = i5;
        this.f95356e = z11;
        this.f95357f = z12;
        this.f95358g = z13;
        this.f95359h = uVar;
        this.f95360i = sVar;
        this.f95361j = pVar;
        this.f95362k = i11;
        this.f95363l = i12;
        this.f95364m = i13;
    }

    public static n a(n nVar) {
        Bitmap.Config config = Bitmap.Config.ARGB_8888;
        Context context = nVar.f95352a;
        nVar.getClass();
        y8.f fVar = nVar.f95354c;
        int i5 = nVar.f95355d;
        boolean z11 = nVar.f95356e;
        boolean z12 = nVar.f95357f;
        boolean z13 = nVar.f95358g;
        nVar.getClass();
        x80.u uVar = nVar.f95359h;
        s sVar = nVar.f95360i;
        p pVar = nVar.f95361j;
        int i11 = nVar.f95362k;
        int i12 = nVar.f95363l;
        int i13 = nVar.f95364m;
        nVar.getClass();
        return new n(context, config, fVar, i5, z11, z12, z13, uVar, sVar, pVar, i11, i12, i13);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        return Intrinsics.b(this.f95352a, nVar.f95352a) && this.f95353b == nVar.f95353b && Intrinsics.b(this.f95354c, nVar.f95354c) && this.f95355d == nVar.f95355d && this.f95356e == nVar.f95356e && this.f95357f == nVar.f95357f && this.f95358g == nVar.f95358g && Intrinsics.b(this.f95359h, nVar.f95359h) && this.f95360i.equals(nVar.f95360i) && this.f95361j.equals(nVar.f95361j) && this.f95362k == nVar.f95362k && this.f95363l == nVar.f95363l && this.f95364m == nVar.f95364m;
    }

    public final int hashCode() {
        return c0.F(this.f95364m) + ((c0.F(this.f95363l) + ((c0.F(this.f95362k) + h.c(this.f95361j.f95366a, h.c(this.f95360i.f95375a, (c9.f(c9.f(c9.f((c0.F(this.f95355d) + ((this.f95354c.hashCode() + ((this.f95353b.hashCode() + (this.f95352a.hashCode() * 31)) * 961)) * 31)) * 31, 31, this.f95356e), 31, this.f95357f), 961, this.f95358g) + Arrays.hashCode(this.f95359h.f95615a)) * 31, 31), 31)) * 31)) * 31);
    }
}
