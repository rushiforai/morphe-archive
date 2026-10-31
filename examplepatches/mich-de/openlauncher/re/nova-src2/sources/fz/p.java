package fz;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.view.View;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
@SourceDebugExtension
/* loaded from: classes.dex */
public final class p extends r {

    @NotNull
    public static final m Companion = new m();

    /* renamed from: j, reason: collision with root package name */
    public static final p f56326j;

    /* renamed from: k, reason: collision with root package name */
    public static final p f56327k;

    /* renamed from: d, reason: collision with root package name */
    public final i f56328d;

    /* renamed from: e, reason: collision with root package name */
    public final i f56329e;

    /* renamed from: f, reason: collision with root package name */
    public final i f56330f;

    /* renamed from: g, reason: collision with root package name */
    public final i f56331g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f56332h;

    /* renamed from: i, reason: collision with root package name */
    public final float[] f56333i;

    static {
        h hVar = i.Companion;
        hVar.getClass();
        i iVar = i.f56257d;
        hVar.getClass();
        hVar.getClass();
        hVar.getClass();
        f56326j = new p(iVar, iVar, iVar, iVar);
        q qVar = q.f56341c;
        f56327k = new p(new i(20, qVar), new i(20, qVar), new i(0, qVar), new i(0, qVar));
    }

    public p(i iVar, i iVar2, i iVar3, i iVar4) {
        this.f56328d = iVar;
        this.f56329e = iVar2;
        this.f56330f = iVar3;
        this.f56331g = iVar4;
        this.f56332h = (iVar.f56259a == 0 && iVar2.f56259a == 0 && iVar3.f56259a == 0 && iVar4.f56259a == 0) || (Intrinsics.b(iVar, iVar2) && Intrinsics.b(iVar, iVar3) && Intrinsics.b(iVar, iVar4));
        this.f56333i = new float[8];
    }

    public static void g(Path path, float f11, float f12, float f13, float f14) {
        float f15;
        float f16;
        float f17;
        float f18;
        float f19;
        path.rLineTo(-f14, 0.0f);
        float f21 = f11 - f13;
        float f22 = f14 * 2;
        float f23 = (f11 + f13) - f22;
        if (f21 > f23) {
            f15 = 180.0f;
            f17 = f23;
            f16 = f21;
        } else {
            f15 = 270.0f;
            f16 = f23;
            f17 = f21;
        }
        float f24 = f12 - f13;
        float f25 = (f13 + f12) - f22;
        if (f24 > f25) {
            f15 -= 90.0f;
            f19 = f24;
            f18 = f25;
        } else {
            f18 = f24;
            f19 = f25;
        }
        path.arcTo(f17, f18, f16, f19, f15, -90.0f, false);
        path.lineTo(f21, f12);
    }

    public static void h(Path path, float f11, float f12, float f13, float f14, float f15) {
        Path path2;
        path.rLineTo(-f14, 0.0f);
        if (f15 == 0.0f) {
            path.lineTo(f11 - f13, f12 - f14);
            path2 = path;
        } else {
            float f16 = f11 - f13;
            path2 = path;
            path2.cubicTo((f11 - f15) - f14, f12 - f13, f16, (f12 - f15) - f14, f16, f12 - f14);
        }
        path2.lineTo(f11 - f13, f12);
    }

    public static void i(Path path, float f11, float f12, float f13, float f14) {
        float f15;
        float f16;
        float f17;
        path.rLineTo(0.0f, f14);
        float f18 = f11 - f13;
        float f19 = f14 * 2;
        float f21 = (f11 + f13) - f19;
        if (f18 > f21) {
            f21 = f18;
            f18 = f21;
            f15 = 90.0f;
        } else {
            f15 = 180.0f;
        }
        float f22 = (f12 - f13) + f19;
        float f23 = f12 + f13;
        if (f22 > f23) {
            f16 = f15 - 90.0f;
            f17 = f22;
            f22 = f23;
        } else {
            f16 = f15;
            f17 = f23;
        }
        path.arcTo(f18, f22, f21, f17, f16, -90.0f, false);
        path.lineTo(f11, f23);
    }

    public static void j(Path path, float f11, float f12, float f13, float f14, float f15) {
        Path path2;
        path.rLineTo(0.0f, f14);
        if (f15 == 0.0f) {
            path.lineTo(f11 - f14, f12 + f13);
            path2 = path;
        } else {
            float f16 = f12 + f13;
            path2 = path;
            path2.cubicTo(f11 - f13, f12 + f15 + f14, (f11 - f15) - f14, f16, f11 - f14, f16);
        }
        path2.lineTo(f11, f12 + f13);
    }

    @Override // fz.r
    public final void a(Path path, float f11, float f12, float f13) {
        float f14 = f13 * 2.0f;
        m(path, f14, f14);
        path.offset(f11, f12);
    }

    @Override // fz.r
    public final String b() {
        e10.w wVar = e10.w.f51855b;
        wVar.getClass();
        return b.c0.k("SHAPE:", wVar.encodeToString(Companion.serializer(), this));
    }

    @Override // fz.r
    public final Animator c(View view, Rect rect, Rect rect2, float f11, boolean z11, boolean z12) {
        ValueAnimator valueAnimatorOfFloat;
        i iVar = this.f56328d;
        if (!z12 && this.f56332h && (iVar.f56259a == 0 || iVar.f56260b == q.f56341c)) {
            return new n((Math.min(rect.width(), rect.height()) * iVar.f56259a) / 100.0f, f11, rect, rect2).a(view, z11);
        }
        Path path = new Path();
        float fWidth = rect.width() / 2.0f;
        float fD = iVar.f56260b.d() * (fWidth - ((iVar.f56259a * fWidth) / 100.0f));
        float fD2 = this.f56329e.f56260b.d() * (fWidth - ((r7.f56259a * fWidth) / 100.0f));
        float fD3 = this.f56330f.f56260b.d() * (fWidth - ((r9.f56259a * fWidth) / 100.0f));
        k kVar = new k(this, path, rect.exactCenterX(), rect.exactCenterY(), fWidth, fD, fD2, fD3, this.f56331g.f56260b.d() * (fWidth - ((r5.f56259a * fWidth) / 100.0f)), rect2.exactCenterX(), rect2.exactCenterY(), f11, 0.55191505f * f11, (rect2.width() / 2.0f) - f11, (rect2.height() / 2.0f) - f11);
        float[] fArr = {0.0f, 1.0f};
        if (z11) {
            // fill-array-data instruction
            fArr[0] = 1.0f;
            fArr[1] = 0.0f;
            valueAnimatorOfFloat = ValueAnimator.ofFloat(fArr);
        } else {
            valueAnimatorOfFloat = ValueAnimator.ofFloat(fArr);
        }
        valueAnimatorOfFloat.addListener(new o(view, 0));
        valueAnimatorOfFloat.addUpdateListener(new j(0, path, kVar, view));
        return valueAnimatorOfFloat;
    }

    @Override // fz.r
    public final void d(Canvas canvas, float f11, float f12, float f13, Paint paint) {
        float f14 = 2 * f13;
        k(canvas, new Path(), f14, f14, f11, f12, 1.0f, paint);
    }

    @Override // fz.r
    public final Path e() {
        Path path = new Path();
        m(path, 100.0f, 100.0f);
        return path;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return Intrinsics.b(this.f56328d, pVar.f56328d) && Intrinsics.b(this.f56329e, pVar.f56329e) && Intrinsics.b(this.f56330f, pVar.f56330f) && Intrinsics.b(this.f56331g, pVar.f56331g);
    }

    public final int hashCode() {
        return this.f56331g.hashCode() + ((this.f56330f.hashCode() + ((this.f56329e.hashCode() + (this.f56328d.hashCode() * 31)) * 31)) * 31);
    }

    public final void k(Canvas canvas, Path path, float f11, float f12, float f13, float f14, float f15, Paint paint) {
        float fMin = Math.min(f11, f12);
        i iVar = this.f56328d;
        int i5 = iVar.f56259a;
        q qVar = iVar.f56260b;
        float f16 = ((i5 * fMin) / 100.0f) * f15;
        i iVar2 = this.f56329e;
        float f17 = ((iVar2.f56259a * fMin) / 100.0f) * f15;
        i iVar3 = this.f56330f;
        float f18 = ((iVar3.f56259a * fMin) / 100.0f) * f15;
        i iVar4 = this.f56331g;
        float f19 = ((fMin * iVar4.f56259a) / 100.0f) * f15;
        cl.k0.l(iVar);
        cl.k0.l(iVar2);
        cl.k0.l(iVar3);
        cl.k0.l(iVar4);
        if (f16 == f17 && f18 == f19 && f16 == f18 && f16 == 0.0f) {
            canvas.drawRect(f13, f14, f13 + f11, f14 + f12, paint);
            return;
        }
        boolean z11 = this.f56332h;
        if (z11 && qVar == q.f56341c && iVar.f56259a == 50 && f15 == 1.0f && f11 == f12) {
            float f21 = f11 / 2.0f;
            canvas.drawCircle(f13 + f21, (f12 / 2.0f) + f14, f21, paint);
        } else {
            if (z11 && qVar == q.f56341c) {
                canvas.drawRoundRect(f13, f14, f11 + f13, f12 + f14, f16, f16, paint);
                return;
            }
            m(path, f11, f12);
            path.offset(f13, f14);
            canvas.drawPath(path, paint);
        }
    }

    public final void l(Path path, float f11, float f12, float f13) {
        float f14;
        int i5;
        float f15;
        float f16;
        Path path2 = path;
        path2.rewind();
        i iVar = this.f56328d;
        float f17 = iVar.f56259a * f13;
        i iVar2 = this.f56329e;
        float f18 = iVar2.f56259a * f13;
        i iVar3 = this.f56330f;
        float f19 = iVar3.f56259a * f13;
        i iVar4 = this.f56331g;
        float f21 = iVar4.f56259a * f13;
        path2.moveTo(0.0f, f17);
        int iOrdinal = iVar.f56260b.ordinal();
        if (iOrdinal != 0) {
            if (iOrdinal == 1) {
                float f22 = 2 * f17;
                i5 = 1;
                path2 = path;
                path2.arcTo(0.0f, 0.0f, f22, f22, -180.0f, 90.0f, false);
            } else {
                if (iOrdinal != 2) {
                    throw new NoWhenBranchMatchedException();
                }
                float f23 = f17 * 0.2f;
                path2.cubicTo(0.0f, f23, f23, 0.0f, f17, 0.0f);
                path2 = path;
                i5 = 1;
            }
            f14 = 0.0f;
        } else {
            f14 = 0.0f;
            i5 = 1;
            path2.lineTo(f17, 0.0f);
        }
        path2.lineTo(f11 - f18, f14);
        int iOrdinal2 = iVar2.f56260b.ordinal();
        if (iOrdinal2 == 0) {
            f15 = f11;
            path2.lineTo(f15, f18);
        } else if (iOrdinal2 == i5) {
            float f24 = 2 * f18;
            path2 = path;
            f15 = f11;
            path2.arcTo(f11 - f24, 0.0f, f15, f24, -90.0f, 90.0f, false);
        } else {
            if (iOrdinal2 != 2) {
                throw new NoWhenBranchMatchedException();
            }
            float f25 = f18 * 0.2f;
            f15 = f11;
            path2.cubicTo(f11 - f25, 0.0f, f15, f25, f11, f18);
            path2 = path;
        }
        path2.lineTo(f15, f12 - f21);
        int iOrdinal3 = iVar4.f56260b.ordinal();
        if (iOrdinal3 == 0) {
            f16 = f12;
            path2.lineTo(f11 - f21, f16);
        } else if (iOrdinal3 == i5) {
            float f26 = 2 * f21;
            float f27 = f11 - f26;
            float f28 = f12 - f26;
            path2 = path;
            f16 = f12;
            path2.arcTo(f27, f28, f11, f16, 0.0f, 90.0f, false);
        } else {
            if (iOrdinal3 != 2) {
                throw new NoWhenBranchMatchedException();
            }
            float f29 = f21 * 0.2f;
            f16 = f12;
            path2.cubicTo(f15, f12 - f29, f15 - f29, f16, f15 - f21, f12);
            path2 = path;
        }
        path2.lineTo(f19, f16);
        int iOrdinal4 = iVar3.f56260b.ordinal();
        if (iOrdinal4 == 0) {
            path2.lineTo(0.0f, f12 - f19);
        } else if (iOrdinal4 == i5) {
            float f31 = 2 * f19;
            path2 = path;
            path2.arcTo(0.0f, f12 - f31, f31, f12, 90.0f, 90.0f, false);
        } else {
            if (iOrdinal4 != 2) {
                throw new NoWhenBranchMatchedException();
            }
            float f32 = f19 * 0.2f;
            path2.cubicTo(f32, f12, 0.0f, f12 - f32, 0.0f, f12 - f19);
            path2 = path;
        }
        path2.close();
    }

    public final void m(Path path, float f11, float f12) {
        path.reset();
        float f13 = f11 / 2.0f;
        float f14 = f12 / 2.0f;
        float fMin = Math.min(f13, f14);
        n(path, f13, f14, fMin, (fMin - ((r1.f56259a * fMin) / 100.0f)) * this.f56328d.f56260b.d(), this.f56329e.f56260b.d() * (fMin - ((r1.f56259a * fMin) / 100.0f)), this.f56330f.f56260b.d() * (fMin - ((r7.f56259a * fMin) / 100.0f)), this.f56331g.f56260b.d() * (fMin - ((r8.f56259a * fMin) / 100.0f)), 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f);
    }

    public final void n(Path path, float f11, float f12, float f13, float f14, float f15, float f16, float f17, float f18, float f19, float f21, float f22, float f23, float f24, float f25) {
        float f26;
        Path path2;
        float f27 = 1 - f25;
        float f28 = (f25 * f18) + (f27 * f11);
        float f29 = (f25 * f19) + (f27 * f12);
        float f31 = f27 * 0.0f;
        float f32 = (f25 * f23) + f31;
        float f33 = (f25 * f24) + f31;
        float f34 = (f25 * f21) + (f27 * f13);
        float f35 = f29 - f33;
        float f36 = f35 - f34;
        path.moveTo(f28, f36);
        float f37 = f25 * f22;
        float f38 = (f27 * f14) + f37;
        path.rLineTo(-f32, 0.0f);
        float f39 = 1.0f - f25;
        float f40 = ((((50.0f - r15.f56259a) * f39) * f13) * 2.0f) / 100.0f;
        int iOrdinal = this.f56328d.f56260b.ordinal();
        if (iOrdinal == 0) {
            f26 = f35;
            path2 = path;
            h(path2, f28 - f32, f26, f34, f40, f38);
        } else if (iOrdinal == 1) {
            f26 = f35;
            path2 = path;
            g(path2, f28 - f32, f26, f34, f40);
        } else {
            if (iOrdinal != 2) {
                throw new NoWhenBranchMatchedException();
            }
            float f41 = f28 - f32;
            float f42 = f41 - f38;
            float f43 = f41 - f34;
            path.cubicTo(f42, f36, f43, f35 - f38, f43, f35);
            path2 = path;
            f26 = f35;
        }
        i iVar = this.f56330f;
        float f44 = ((((50.0f - iVar.f56259a) * f39) * f13) * 2.0f) / 100.0f;
        float f45 = (f27 * f16) + f37;
        path2.rLineTo(0.0f, f33 + f33);
        int iOrdinal2 = iVar.f56260b.ordinal();
        if (iOrdinal2 == 0) {
            j(path2, f28 - f32, f29 + f33, f34, f44, f45);
        } else if (iOrdinal2 == 1) {
            i(path2, f28 - f32, f29 + f33, f34, f44);
        } else {
            if (iOrdinal2 != 2) {
                throw new NoWhenBranchMatchedException();
            }
            float f46 = f28 - f32;
            float f47 = f29 + f33;
            float f48 = f47 + f34;
            path2.cubicTo(f46 - f34, f47 + f45, f46 - f45, f48, f46, f48);
        }
        float f49 = (f27 * f17) + f37;
        path2.rLineTo(f32 + f32, 0.0f);
        float f51 = ((((50.0f - r2.f56259a) * f39) * f13) * 2.0f) / 100.0f;
        int iOrdinal3 = this.f56331g.f56260b.ordinal();
        if (iOrdinal3 == 0) {
            h(path2, f28 + f32, f29 + f33, -f34, -f51, -f49);
        } else if (iOrdinal3 == 1) {
            g(path2, f28 + f32, f29 + f33, -f34, -f51);
        } else {
            if (iOrdinal3 != 2) {
                throw new NoWhenBranchMatchedException();
            }
            float f52 = f28 + f32;
            float f53 = f29 + f33;
            float f54 = -f34;
            float f55 = -f49;
            float f56 = f52 - f54;
            path2.cubicTo(f52 - f55, f53 - f54, f56, f53 - f55, f56, f53);
        }
        i iVar2 = this.f56329e;
        float f57 = ((((50.0f - iVar2.f56259a) * f39) * f13) * 2.0f) / 100.0f;
        float f58 = (f27 * f15) + f37;
        path2.rLineTo(0.0f, (-f33) - f33);
        int iOrdinal4 = iVar2.f56260b.ordinal();
        if (iOrdinal4 == 0) {
            j(path2, f28 + f32, f26, -f34, -f57, -f58);
        } else if (iOrdinal4 == 1) {
            i(path2, f28 + f32, f26, -f34, -f57);
        } else {
            if (iOrdinal4 != 2) {
                throw new NoWhenBranchMatchedException();
            }
            float f59 = f28 + f32;
            float f61 = -f34;
            float f62 = -f58;
            float f63 = f61 + f26;
            path2.cubicTo(f59 - f61, f26 + f62, f59 - f62, f63, f59, f63);
        }
        path.close();
    }

    public final String toString() {
        return "CornerCustomShapePath(topLeft=" + this.f56328d + ", topRight=" + this.f56329e + ", bottomLeft=" + this.f56330f + ", bottomRight=" + this.f56331g + ")";
    }

    public p(int i5, i iVar, i iVar2, i iVar3, i iVar4, boolean z11, float[] fArr) {
        boolean z12 = true;
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, l.f56295a.getDescriptor());
        }
        this.f56328d = iVar;
        if ((i5 & 2) == 0) {
            this.f56329e = iVar;
        } else {
            this.f56329e = iVar2;
        }
        if ((i5 & 4) == 0) {
            this.f56330f = iVar;
        } else {
            this.f56330f = iVar3;
        }
        if ((i5 & 8) == 0) {
            this.f56331g = iVar;
        } else {
            this.f56331g = iVar4;
        }
        if ((i5 & 16) == 0) {
            if ((iVar.f56259a != 0 || this.f56329e.f56259a != 0 || this.f56330f.f56259a != 0 || this.f56331g.f56259a != 0) && (!iVar.equals(this.f56329e) || !iVar.equals(this.f56330f) || !iVar.equals(this.f56331g))) {
                z12 = false;
            }
            this.f56332h = z12;
        } else {
            this.f56332h = z11;
        }
        if ((i5 & 32) == 0) {
            this.f56333i = new float[8];
        } else {
            this.f56333i = fArr;
        }
    }

    public /* synthetic */ p(i iVar, i iVar2, int i5) {
        this(iVar, iVar, iVar, (i5 & 8) != 0 ? iVar : iVar2);
    }
}
