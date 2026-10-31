package x8;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import b.c9;
import kotlin.jvm.internal.Intrinsics;
import t70.c0;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final c0 f95280a;

    /* renamed from: b, reason: collision with root package name */
    public final c0 f95281b;

    /* renamed from: c, reason: collision with root package name */
    public final c0 f95282c;

    /* renamed from: d, reason: collision with root package name */
    public final c0 f95283d;

    /* renamed from: e, reason: collision with root package name */
    public final b9.e f95284e;

    /* renamed from: f, reason: collision with root package name */
    public final int f95285f;

    /* renamed from: g, reason: collision with root package name */
    public final Bitmap.Config f95286g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f95287h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f95288i;

    /* renamed from: j, reason: collision with root package name */
    public final Drawable f95289j;

    /* renamed from: k, reason: collision with root package name */
    public final Drawable f95290k;

    /* renamed from: l, reason: collision with root package name */
    public final Drawable f95291l;

    /* renamed from: m, reason: collision with root package name */
    public final int f95292m;
    public final int n;
    public final int o;

    public b(c0 c0Var, c0 c0Var2, c0 c0Var3, c0 c0Var4, b9.e eVar, int i5, Bitmap.Config config, boolean z11, boolean z12, Drawable drawable, Drawable drawable2, Drawable drawable3, int i11, int i12, int i13) {
        this.f95280a = c0Var;
        this.f95281b = c0Var2;
        this.f95282c = c0Var3;
        this.f95283d = c0Var4;
        this.f95284e = eVar;
        this.f95285f = i5;
        this.f95286g = config;
        this.f95287h = z11;
        this.f95288i = z12;
        this.f95289j = drawable;
        this.f95290k = drawable2;
        this.f95291l = drawable3;
        this.f95292m = i11;
        this.n = i12;
        this.o = i13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f95280a, bVar.f95280a) && Intrinsics.b(this.f95281b, bVar.f95281b) && Intrinsics.b(this.f95282c, bVar.f95282c) && Intrinsics.b(this.f95283d, bVar.f95283d) && Intrinsics.b(this.f95284e, bVar.f95284e) && this.f95285f == bVar.f95285f && this.f95286g == bVar.f95286g && this.f95287h == bVar.f95287h && this.f95288i == bVar.f95288i && Intrinsics.b(this.f95289j, bVar.f95289j) && Intrinsics.b(this.f95290k, bVar.f95290k) && Intrinsics.b(this.f95291l, bVar.f95291l) && this.f95292m == bVar.f95292m && this.n == bVar.n && this.o == bVar.o;
    }

    public final int hashCode() {
        int iF = c9.f(c9.f((this.f95286g.hashCode() + ((b.c0.F(this.f95285f) + ((this.f95284e.hashCode() + ((this.f95283d.hashCode() + ((this.f95282c.hashCode() + ((this.f95281b.hashCode() + (this.f95280a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31, 31, this.f95287h), 31, this.f95288i);
        Drawable drawable = this.f95289j;
        int iHashCode = (iF + (drawable != null ? drawable.hashCode() : 0)) * 31;
        Drawable drawable2 = this.f95290k;
        int iHashCode2 = (iHashCode + (drawable2 != null ? drawable2.hashCode() : 0)) * 31;
        Drawable drawable3 = this.f95291l;
        return b.c0.F(this.o) + ((b.c0.F(this.n) + ((b.c0.F(this.f95292m) + ((iHashCode2 + (drawable3 != null ? drawable3.hashCode() : 0)) * 31)) * 31)) * 31);
    }
}
