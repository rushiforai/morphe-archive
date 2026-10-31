package x8;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import b.c9;
import b.u4;
import java.util.Arrays;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import t70.c0;

/* loaded from: classes.dex */
public final class k {
    public final int A;
    public final int B;
    public final int C;
    public final int D;
    public final int E;

    /* renamed from: a, reason: collision with root package name */
    public final Context f95326a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f95327b;

    /* renamed from: c, reason: collision with root package name */
    public final z8.b f95328c;

    /* renamed from: d, reason: collision with root package name */
    public final j f95329d;

    /* renamed from: e, reason: collision with root package name */
    public final Bitmap.Config f95330e;

    /* renamed from: f, reason: collision with root package name */
    public final List f95331f;

    /* renamed from: g, reason: collision with root package name */
    public final b9.e f95332g;

    /* renamed from: h, reason: collision with root package name */
    public final x80.u f95333h;

    /* renamed from: i, reason: collision with root package name */
    public final s f95334i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f95335j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f95336k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f95337l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f95338m;
    public final c0 n;
    public final c0 o;

    /* renamed from: p, reason: collision with root package name */
    public final c0 f95339p;

    /* renamed from: q, reason: collision with root package name */
    public final c0 f95340q;

    /* renamed from: r, reason: collision with root package name */
    public final h6.u f95341r;

    /* renamed from: s, reason: collision with root package name */
    public final y8.g f95342s;

    /* renamed from: t, reason: collision with root package name */
    public final p f95343t;

    /* renamed from: u, reason: collision with root package name */
    public final Integer f95344u;

    /* renamed from: v, reason: collision with root package name */
    public final Drawable f95345v;

    /* renamed from: w, reason: collision with root package name */
    public final Integer f95346w;

    /* renamed from: x, reason: collision with root package name */
    public final Drawable f95347x;

    /* renamed from: y, reason: collision with root package name */
    public final c f95348y;

    /* renamed from: z, reason: collision with root package name */
    public final b f95349z;

    public k(Context context, Object obj, z8.b bVar, j jVar, Bitmap.Config config, int i5, List list, b9.e eVar, x80.u uVar, s sVar, boolean z11, boolean z12, boolean z13, boolean z14, int i11, int i12, int i13, c0 c0Var, c0 c0Var2, c0 c0Var3, c0 c0Var4, h6.u uVar2, y8.g gVar, int i14, p pVar, Integer num, Drawable drawable, Integer num2, Drawable drawable2, c cVar, b bVar2) {
        this.f95326a = context;
        this.f95327b = obj;
        this.f95328c = bVar;
        this.f95329d = jVar;
        this.f95330e = config;
        this.A = i5;
        this.f95331f = list;
        this.f95332g = eVar;
        this.f95333h = uVar;
        this.f95334i = sVar;
        this.f95335j = z11;
        this.f95336k = z12;
        this.f95337l = z13;
        this.f95338m = z14;
        this.B = i11;
        this.C = i12;
        this.D = i13;
        this.n = c0Var;
        this.o = c0Var2;
        this.f95339p = c0Var3;
        this.f95340q = c0Var4;
        this.f95341r = uVar2;
        this.f95342s = gVar;
        this.E = i14;
        this.f95343t = pVar;
        this.f95344u = num;
        this.f95345v = drawable;
        this.f95346w = num2;
        this.f95347x = drawable2;
        this.f95348y = cVar;
        this.f95349z = bVar2;
    }

    public static i a(k kVar) {
        Context context = kVar.f95326a;
        kVar.getClass();
        return new i(kVar, context);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return Intrinsics.b(this.f95326a, kVar.f95326a) && this.f95327b.equals(kVar.f95327b) && Intrinsics.b(this.f95328c, kVar.f95328c) && Intrinsics.b(this.f95329d, kVar.f95329d) && this.f95330e == kVar.f95330e && this.A == kVar.A && Intrinsics.b(this.f95331f, kVar.f95331f) && Intrinsics.b(this.f95332g, kVar.f95332g) && Intrinsics.b(this.f95333h, kVar.f95333h) && this.f95334i.equals(kVar.f95334i) && this.f95335j == kVar.f95335j && this.f95336k == kVar.f95336k && this.f95337l == kVar.f95337l && this.f95338m == kVar.f95338m && this.B == kVar.B && this.C == kVar.C && this.D == kVar.D && Intrinsics.b(this.n, kVar.n) && Intrinsics.b(this.o, kVar.o) && Intrinsics.b(this.f95339p, kVar.f95339p) && Intrinsics.b(this.f95340q, kVar.f95340q) && Intrinsics.b(this.f95344u, kVar.f95344u) && Intrinsics.b(this.f95345v, kVar.f95345v) && Intrinsics.b(this.f95346w, kVar.f95346w) && Intrinsics.b(this.f95347x, kVar.f95347x) && Intrinsics.b(this.f95341r, kVar.f95341r) && this.f95342s.equals(kVar.f95342s) && this.E == kVar.E && this.f95343t.equals(kVar.f95343t) && this.f95348y.equals(kVar.f95348y) && Intrinsics.b(this.f95349z, kVar.f95349z);
    }

    public final int hashCode() {
        int iHashCode = (this.f95327b.hashCode() + (this.f95326a.hashCode() * 31)) * 31;
        z8.b bVar = this.f95328c;
        int iHashCode2 = (iHashCode + (bVar != null ? bVar.hashCode() : 0)) * 31;
        j jVar = this.f95329d;
        int iC = h.c(this.f95343t.f95366a, (b.c0.F(this.E) + ((this.f95342s.hashCode() + ((this.f95341r.hashCode() + ((this.f95340q.hashCode() + ((this.f95339p.hashCode() + ((this.o.hashCode() + ((this.n.hashCode() + ((b.c0.F(this.D) + ((b.c0.F(this.C) + ((b.c0.F(this.B) + c9.f(c9.f(c9.f(c9.f(h.c(this.f95334i.f95375a, (((this.f95332g.hashCode() + u4.c((b.c0.F(this.A) + ((this.f95330e.hashCode() + ((iHashCode2 + (jVar != null ? jVar.hashCode() : 0)) * 29791)) * 961)) * 29791, 31, this.f95331f)) * 31) + Arrays.hashCode(this.f95333h.f95615a)) * 31, 31), 31, this.f95335j), 31, this.f95336k), 31, this.f95337l), 31, this.f95338m)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31, 961);
        Integer num = this.f95344u;
        int iHashCode3 = (iC + (num != null ? num.hashCode() : 0)) * 31;
        Drawable drawable = this.f95345v;
        int iHashCode4 = (iHashCode3 + (drawable != null ? drawable.hashCode() : 0)) * 31;
        Integer num2 = this.f95346w;
        int iHashCode5 = (iHashCode4 + (num2 != null ? num2.hashCode() : 0)) * 31;
        Drawable drawable2 = this.f95347x;
        return this.f95349z.hashCode() + ((this.f95348y.hashCode() + ((iHashCode5 + (drawable2 != null ? drawable2.hashCode() : 0)) * 29791)) * 31);
    }
}
