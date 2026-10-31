package fz;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import java.util.Iterator;
import java.util.List;
import kotlin.LazyKt;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import org.jetbrains.annotations.NotNull;

@Serializable(with = c.class)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class d {
    public static final d A;
    public static final d B;
    public static final d C;

    @NotNull
    public static final c Companion;
    public static final d D;
    public static final List E;
    public static final SerialDescriptor F;

    /* renamed from: j, reason: collision with root package name */
    public static final d f56189j;

    /* renamed from: k, reason: collision with root package name */
    public static final d f56190k;

    /* renamed from: l, reason: collision with root package name */
    public static final d f56191l;

    /* renamed from: m, reason: collision with root package name */
    public static final d f56192m;
    public static final d n;
    public static final d o;

    /* renamed from: p, reason: collision with root package name */
    public static final d f56193p;

    /* renamed from: q, reason: collision with root package name */
    public static final d f56194q;

    /* renamed from: r, reason: collision with root package name */
    public static final d f56195r;

    /* renamed from: s, reason: collision with root package name */
    public static final d f56196s;

    /* renamed from: t, reason: collision with root package name */
    public static final d f56197t;

    /* renamed from: u, reason: collision with root package name */
    public static final d f56198u;

    /* renamed from: v, reason: collision with root package name */
    public static final d f56199v;

    /* renamed from: w, reason: collision with root package name */
    public static final d f56200w;

    /* renamed from: x, reason: collision with root package name */
    public static final d f56201x;

    /* renamed from: y, reason: collision with root package name */
    public static final d f56202y;

    /* renamed from: z, reason: collision with root package name */
    public static final d f56203z;

    /* renamed from: a, reason: collision with root package name */
    public final r f56204a;

    /* renamed from: b, reason: collision with root package name */
    public final List f56205b;

    /* renamed from: c, reason: collision with root package name */
    public final float f56206c;

    /* renamed from: d, reason: collision with root package name */
    public final String f56207d;

    /* renamed from: e, reason: collision with root package name */
    public final float f56208e;

    /* renamed from: f, reason: collision with root package name */
    public final int f56209f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f56210g;

    /* renamed from: h, reason: collision with root package name */
    public final a70.d f56211h;

    /* renamed from: i, reason: collision with root package name */
    public final a70.d f56212i;

    static {
        c cVar = new c();
        Companion = cVar;
        i iVar = null;
        int i5 = 14;
        p pVar = new p(c.a(cVar, 0), iVar, i5);
        EmptyList emptyList = EmptyList.f71733a;
        d dVar = new d(pVar, emptyList, 1.0f, "NONE", 48);
        f56189j = dVar;
        d dVar2 = new d(b.f56180d, emptyList, 0.0f, "DEFAULT", 48);
        f56190k = dVar2;
        d dVar3 = new d(new p(c.a(cVar, 50), iVar, i5), ul.b.Q("M50 0A50 50,0,1,1,50 100A50 50,0,1,1,50 0", "M50 0C77.6 0 100 22.4 100 50C100 77.6 77.6 100 50 100C22.4 100 0 77.6 0 50C0 22.4 22.4 0 50 0Z"), 0.91f, "CIRCLE", 48);
        f56191l = dVar3;
        q qVar = q.f56342d;
        d dVar4 = new d(new p(new i(20, qVar), iVar, i5), ul.b.P("M50,0 C10,0 0,10 0,50 0,90 10,100 50,100 90,100 100,90 100,50 100,10 90,0 50,0 Z"), 0.86f, "SQUIRCLE", 48);
        f56192m = dVar4;
        d dVar5 = new d(new p(c.a(cVar, 30), iVar, i5), ul.b.P("M50 0h20a30 30 0 0 1 30 30v40a30 30 0 0 1-30 30H30A30 30 0 0 1 0 70V30A30 30 0 0 1 30 0z"), 0.84f, "ROUNDED_SQUARE", 48);
        n = dVar5;
        d dVar6 = new d(new p(c.a(cVar, 0), iVar, i5), ul.b.P("M50,0L100,0 100,100 0,100 0,0z"), 0.81f, "SQUARE", 48);
        o = dVar6;
        d dVar7 = new d(new p(c.a(cVar, 50), c.a(cVar, 15), 6), ul.b.P("M50 0a50 50 0 0 1 50 50v35a15 15 0 0 1-15 15H50A50 50 0 0 1 50 0z"), 0.88f, "TEARDROP", 48);
        f56193p = dVar7;
        f56194q = new d(new n0("M59 0c25 0 41 16 41 41v18c0 25-16 41-41 41H41C16 100 0 84 0 59V41C0 16 16 0 41 0h18z"), emptyList, 0.84f, "SAMSUNG_SQUIRCLE_LEGACY", 48);
        d dVar8 = new d(new n0("M99,50C99,6.935,77.063,1,50,1 C22.935,1,1,6.935,1,50c0,43.063,21.935,49,49,49C77.063,99,99,93.063,99,50z"), emptyList, 0.88f, "SAMSUNG_SQUIRCLE", 48);
        f56195r = new d(new n0("M28 0h43.6c9.8 0 13.4 1 17 2.9 3.6 1.9 6.4 4.7 8.3 8.3C99 14.8 100 18.4 100 28v43.6c0 9.8-1 13.4-2.9 16.9-1.9 3.6-4.7 6.4-8.3 8.3C85.1 99 81.6 100 71.8 100H28.2c-9.8 0-13.4-1-16.9-2.9-3.6-1.9-6.4-4.7-8.3-8.3C1 85.1 0 81.6 0 71.8V28.2c0-9.8 1-13.4 2.9-16.9C4.9 7.7 7.7 4.9 11.3 2.9 14.8 1 18.4 0 28.2 0z"), emptyList, 0.84f, "HUAWEI_SQUIRCLE", 48);
        d dVar9 = new d(new p(c.a(cVar, 10), iVar, i5), ul.b.P("M50,0L92,0C96.42,0 100,4.58 100 8L100,92C100, 96.42 96.42 100 92 100L8 100C4.58, 100 0 96.42 0 92L0 8 C 0 4.42 4.42 0 8 0L50 0Z"), 0.81f, "NEXUS_SQUARE", 48);
        f56196s = dVar9;
        d dVar10 = new d(r0.f56354a, emptyList, 1.0f, "FOLDER_PLATFORM", 48);
        f56197t = dVar10;
        d dVar11 = new d(new p(c.a(cVar, 25), iVar, i5), ul.b.P("M 22.58, 1.76 C 34.27, 0.76 65.73, 0.76 77.42, 1.76 89.11, 2.76 97.24, 10.89 98.24, 22.58 99.24, 34.27 99.24, 65.73 98.24, 77.42 97.24, 89.11 89.11, 97.24 77.42, 98.24 65.73, 99.24 34.27, 99.24 22.58, 98.24 10.89, 97.24, 2.76, 89.11 1.76, 77.42 0.76, 65.73 0.76, 34.27 1.76, 22.58 2.76, 10.89 10.89, 2.76 22.58, 1.76 Z"), 0.83f, "LG_SQUARE", 48);
        d dVar12 = new d(new n0("M50,0 C60.6,0 69.9,5.3 75.6,13.5 78.5,17.8 82.3,21.5 86.6,24.5 94.7,30.1 100,39.4 100,50 100,60.6 94.7,69.9 86.5,75.6 82.2,78.5 78.5,82.3 75.5,86.6 69.9,94.7 60.6,100 50,100 39.4,100 30.1,94.7 24.4,86.5 21.5,82.2 17.7,78.5 13.4,75.5 5.3,69.9 0,60.6 0,50 0,39.4 5.3,30.1 13.5,24.4 17.8,21.5 21.5,17.7 24.5,13.4 30.1,5.3 39.4,0 50,0 Z"), emptyList, 0.94f, "FLOWER", 32);
        f56198u = dVar12;
        d dVar13 = new d(new n0("M50,0 100,36.33 80.91,95.11 50,95.11 19.1,95.11 0,36.33z"), emptyList, 1.0f, "PENTAGON", 1.38f, 3);
        f56199v = dVar13;
        d dVar14 = new d(new n0("M100,50 75,93 25,93 0,50 25,7 50,7 75,7z"), emptyList, 1.0f, "HEXAGON", 32);
        f56200w = dVar14;
        d dVar15 = new d(new n0("M50,0 93,25 93,75 50,100 7,75 7,50 7,25z"), emptyList, 0.97f, "HEXAGON_90", 32);
        f56201x = dVar15;
        d dVar16 = new d(new n0("M50,1.25 90,20.6 100,64 72.25,98.75 27.75,98.75 0,64 10,20.6z"), emptyList, 0.94f, "HEPTAGON", 1.48f, 2);
        f56202y = dVar16;
        q qVar2 = q.f56340b;
        d dVar17 = new d(new p(new i(30, qVar2), iVar, i5), emptyList, 0.89f, "OCTAGON", 48);
        f56203z = dVar17;
        d dVar18 = new d(new n0("MM55,0 C25,0 0,25 0,50 0,78 28,100 55,100 85,100 100,85 100,58 100,30 86,0 55,0 Z"), emptyList, 0.91f, "PEBBLE", 48);
        A = dVar18;
        d dVar19 = new d(new n0("M12.97,0 C8.41,0 4.14,2.55 2.21,6.68 -1.03,13.61 -0.71,21.78 3.16,28.46 4.89,31.46 4.89,35.2 3.16,38.2 -1.05,45.48 -1.05,54.52 3.16,61.8 4.89,64.8 4.89,68.54 3.16,71.54 -0.71,78.22 -1.03,86.39 2.21,93.32 4.14,97.45 8.41,100 12.97,100 21.38,100 78.62,100 87.03,100 91.59,100 95.85,97.45 97.79,93.32 101.02,86.39 100.71,78.22 96.84,71.54 95.1,68.54 95.1,64.8 96.84,61.8 101.05,54.52 101.05,45.48 96.84,38.2 95.1,35.2 95.1,31.46 96.84,28.46 100.71,21.78 101.02,13.61 97.79,6.68 95.85,2.55 91.59,0 87.03,0 78.62,0 21.38,0 12.97,0 Z"), emptyList, 0.79f, "VESSEL", 48);
        B = dVar19;
        d dVar20 = new d(new p(new i(20, qVar2), iVar, i5), emptyList, 0.85f, "TAPERED", 48);
        C = dVar20;
        d dVar21 = new d(new p(c.a(cVar, 10), new i(50, qVar), c.a(cVar, 25), c.a(cVar, 0)), emptyList, 0.81f, "CUSTOM", 48);
        D = dVar21;
        E = ul.b.Q(dVar, dVar2, dVar3, dVar4, dVar5, dVar6, dVar7, dVar12, dVar17, dVar14, dVar15, dVar13, dVar16, dVar18, dVar19, dVar20, dVar8, dVar9, dVar11, dVar10, dVar21);
        F = SerialDescriptorsKt.PrimitiveSerialDescriptor("AdaptiveIconShape", PrimitiveKind.STRING.INSTANCE);
    }

    public d(r rVar, List list, float f11, String str, float f12, int i5) {
        this.f56204a = rVar;
        this.f56205b = list;
        this.f56206c = f11;
        this.f56207d = str;
        this.f56208e = f12;
        this.f56209f = i5;
        this.f56210g = rVar instanceof p;
        final int i11 = 0;
        this.f56211h = LazyKt.a(new Function0(this) { // from class: fz.a

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ d f56179b;

            {
                this.f56179b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        return this.f56179b.f56204a.e();
                    default:
                        d dVar = this.f56179b;
                        float f13 = dVar.f56206c;
                        if (f13 == 0.0f) {
                            Iterator it = d.E.iterator();
                            while (true) {
                                if (it.hasNext()) {
                                    d dVar2 = (d) it.next();
                                    if (!Intrinsics.b(dVar2, dVar) && !Intrinsics.b(dVar2, d.f56189j) && dVar2.f56206c != 0.0f && dVar2.i(dVar)) {
                                        f13 = dVar2.f56206c;
                                    }
                                } else {
                                    Bitmap bitmapCreateBitmap = Bitmap.createBitmap(100, 100, Bitmap.Config.ARGB_8888);
                                    Canvas canvas = new Canvas(bitmapCreateBitmap);
                                    Paint paint = new Paint(1);
                                    paint.setColor(-65536);
                                    canvas.drawPath(dVar.e(), paint);
                                    f13 = e0.a(new aa.n(bitmapCreateBitmap, 0, false), Math.max(bitmapCreateBitmap.getWidth(), bitmapCreateBitmap.getHeight()), new byte[bitmapCreateBitmap.getByteCount()], null, null).f56367a;
                                }
                            }
                        }
                        return Float.valueOf(f13);
                }
            }
        });
        final int i12 = 1;
        this.f56212i = LazyKt.a(new Function0(this) { // from class: fz.a

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ d f56179b;

            {
                this.f56179b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i12) {
                    case 0:
                        return this.f56179b.f56204a.e();
                    default:
                        d dVar = this.f56179b;
                        float f13 = dVar.f56206c;
                        if (f13 == 0.0f) {
                            Iterator it = d.E.iterator();
                            while (true) {
                                if (it.hasNext()) {
                                    d dVar2 = (d) it.next();
                                    if (!Intrinsics.b(dVar2, dVar) && !Intrinsics.b(dVar2, d.f56189j) && dVar2.f56206c != 0.0f && dVar2.i(dVar)) {
                                        f13 = dVar2.f56206c;
                                    }
                                } else {
                                    Bitmap bitmapCreateBitmap = Bitmap.createBitmap(100, 100, Bitmap.Config.ARGB_8888);
                                    Canvas canvas = new Canvas(bitmapCreateBitmap);
                                    Paint paint = new Paint(1);
                                    paint.setColor(-65536);
                                    canvas.drawPath(dVar.e(), paint);
                                    f13 = e0.a(new aa.n(bitmapCreateBitmap, 0, false), Math.max(bitmapCreateBitmap.getWidth(), bitmapCreateBitmap.getHeight()), new byte[bitmapCreateBitmap.getByteCount()], null, null).f56367a;
                                }
                            }
                        }
                        return Float.valueOf(f13);
                }
            }
        });
    }

    public final k0 a(Context context) {
        k0 k0Var = new k0(e());
        ColorStateList colorStateListB = o4.a.b(context, 2131099834);
        Intrinsics.d(colorStateListB);
        k0Var.b(colorStateListB);
        k0Var.c(d());
        int iK = w20.e.k(48);
        k0Var.setBounds(0, 0, iK, iK);
        return k0Var;
    }

    public final String b() {
        e10.w wVar = e10.w.f51855b;
        wVar.getClass();
        return wVar.encodeToString(Companion.serializer(), this);
    }

    public final p c() {
        r rVar = this.f56204a;
        if (rVar instanceof p) {
            return (p) rVar;
        }
        c cVar = Companion;
        String strB = rVar.b();
        cVar.getClass();
        d dVarC = c.c(strB);
        i iVar = null;
        if (!((dVarC != null ? dVarC.f56204a : null) instanceof p)) {
            int i5 = 14;
            return i(f56195r) ? new p(c.a(cVar, 20), iVar, i5) : new p(new i(30, q.f56342d), iVar, i5);
        }
        r rVar2 = dVarC.f56204a;
        Intrinsics.e(rVar2, "null cannot be cast to non-null type com.teslacoilsw.launcher.icon.CornerCustomShapePath");
        return (p) rVar2;
    }

    public final float d() {
        return ((Number) this.f56212i.getValue()).floatValue();
    }

    public final Path e() {
        return (Path) this.f56211h.getValue();
    }

    public final float f(com.teslacoilsw.launcher.icon.a aVar) {
        Drawable drawableI = aVar.i();
        InsetDrawable insetDrawable = drawableI instanceof InsetDrawable ? (InsetDrawable) drawableI : null;
        if ((insetDrawable != null ? insetDrawable.getDrawable() : null) instanceof com.teslacoilsw.launcher.icon.a) {
            return 1.5f;
        }
        return this.f56208e;
    }

    public final boolean g() {
        d dVar = f56191l;
        return equals(dVar) || i(dVar);
    }

    public final boolean h(String str) {
        return Intrinsics.b(this.f56204a.b(), str) || this.f56205b.contains(str);
    }

    public final boolean i(d dVar) {
        if (equals(dVar)) {
            return true;
        }
        r rVar = dVar.f56204a;
        r rVar2 = this.f56204a;
        return Intrinsics.b(rVar2, rVar) || dVar.h(rVar2.b()) || h(dVar.f56204a.b());
    }

    public final String toString() {
        return b.c0.n("AdaptiveIconShape{", this.f56207d, " `", this.f56204a.b(), "`}");
    }

    public d(r rVar, List list, float f11, String str, int i5) {
        this(rVar, (i5 & 2) != 0 ? EmptyList.f71733a : list, (i5 & 4) != 0 ? 0.0f : f11, (i5 & 8) != 0 ? null : str, (i5 & 16) != 0 ? 1.5f : 1.4f, 0);
    }
}
