package mx;

import android.content.res.Resources;
import android.graphics.Paint;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import kotlin.math.MathKt;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: k, reason: collision with root package name */
    public static final dy.k f77067k = new dy.k(2);

    /* renamed from: a, reason: collision with root package name */
    public final g f77068a;

    /* renamed from: b, reason: collision with root package name */
    public final j f77069b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f77070c;

    /* renamed from: d, reason: collision with root package name */
    public int f77071d;

    /* renamed from: e, reason: collision with root package name */
    public int f77072e;

    /* renamed from: f, reason: collision with root package name */
    public int f77073f;

    /* renamed from: g, reason: collision with root package name */
    public int f77074g;

    /* renamed from: h, reason: collision with root package name */
    public int f77075h;

    /* renamed from: i, reason: collision with root package name */
    public int f77076i;

    /* renamed from: j, reason: collision with root package name */
    public int f77077j = -65281;

    public f(g gVar, j jVar, boolean z11) {
        this.f77068a = gVar;
        this.f77069b = jVar;
        this.f77070c = z11;
    }

    public final void a(Resources resources, float f11) {
        b(resources.getDisplayMetrics(), resources.getDimensionPixelSize(2131165300), f11);
    }

    public final void b(DisplayMetrics displayMetrics, int i5, float f11) {
        j jVar = this.f77069b;
        this.f77071d = MathKt.b(jVar.b() * i5 * f11);
        this.f77076i = jVar.f77124b ? MathKt.b(TypedValue.applyDimension(2, jVar.f77125c * f11, displayMetrics)) : 0;
        this.f77075h = jVar.f77124b ? bh.g.L(4 * f11, displayMetrics) : 0;
        Paint paintC = f77067k.c();
        paintC.setTextSize(this.f77076i);
        Paint.FontMetrics fontMetrics = paintC.getFontMetrics();
        int iCeil = (int) Math.ceil(fontMetrics.bottom - fontMetrics.top);
        int iCeil2 = (int) Math.ceil((jVar.f77129g ? 1.0f : 2.02f) * iCeil);
        boolean z11 = this.f77068a == g.f77086d;
        int iL = this.f77071d + (jVar.f77124b ? this.f77075h + iCeil2 : 0) + (z11 ? bh.g.L(16 * f11, displayMetrics) : 0);
        this.f77074g = iL;
        if (jVar.f77124b) {
            iL = bh.g.L(8 * f11, displayMetrics) + this.f77071d + this.f77075h + iCeil;
        }
        this.f77073f = iL;
        this.f77072e = z11 ? jVar.f77124b ? kotlin.ranges.a.e0(MathKt.b(paintC.measureText("Calendar")), this.f77071d + this.f77075h, this.f77073f) : this.f77074g : this.f77071d;
    }

    public final String toString() {
        int i5 = this.f77071d;
        int i11 = this.f77072e;
        int i12 = this.f77073f;
        int i13 = this.f77074g;
        int i14 = this.f77075h;
        int i15 = this.f77076i;
        int i16 = this.f77077j;
        StringBuilder sb2 = new StringBuilder("CellIconSizeSpecs(type=");
        sb2.append(this.f77068a);
        sb2.append(", config=");
        sb2.append(this.f77069b);
        sb2.append(", iconSizePx=");
        b.c0.A(sb2, i5, ", minCellWidthPx=", i11, ", maxCellWidthPx=");
        b.c0.A(sb2, i12, ", cellHeightPx=", i13, ", iconDrawablePaddingPx=");
        b.c0.A(sb2, i14, ", iconTextSizePx=", i15, ", iconTextColor=");
        return b.c0.o(sb2, i16, ", rotate90Widgets=false)");
    }
}
