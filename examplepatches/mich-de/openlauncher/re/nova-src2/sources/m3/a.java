package m3;

import android.graphics.Paint;
import android.graphics.RectF;
import android.os.Build;
import android.text.Layout;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import androidx.compose.ui.graphics.Canvas;
import cw.l2;
import e10.z2;
import hv.z1;
import i2.u0;
import java.util.ArrayList;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.ArrayIteratorKt;
import kotlin.jvm.internal.Intrinsics;
import p1.s2;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final u3.e f75834a;

    /* renamed from: b, reason: collision with root package name */
    public final int f75835b;

    /* renamed from: c, reason: collision with root package name */
    public final long f75836c;

    /* renamed from: d, reason: collision with root package name */
    public final n3.k f75837d;

    /* renamed from: e, reason: collision with root package name */
    public final CharSequence f75838e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f75839f;

    /* JADX WARN: Removed duplicated region for block: B:102:0x0141  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0198  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x01d1  */
    /* JADX WARN: Removed duplicated region for block: B:140:0x020f  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x0211  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x0247  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x0280  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x0284  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00e5  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0119  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0122  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public a(u3.e eVar, int i5, int i11, long j11) {
        int i12;
        CharSequence charSequence;
        int i13;
        int i14;
        int i15;
        int i16;
        g0 g0Var;
        int i17;
        int i18;
        int i19;
        char c11;
        g0 g0Var2;
        TextUtils.TruncateAt truncateAt;
        TextUtils.TruncateAt truncateAt2;
        int i21;
        int i22;
        a aVar;
        int i23;
        int i24;
        int i25;
        Layout layout;
        w3.b[] bVarArr;
        CharSequence charSequence2;
        Object obj;
        int i26;
        h2.c cVar;
        float fH;
        float fD;
        int iB;
        float fG;
        float fB;
        float fD2;
        this.f75834a = eVar;
        this.f75835b = i5;
        this.f75836c = j11;
        if (y3.a.i(j11) != 0 || y3.a.j(j11) != 0) {
            s3.a.a("Setting Constraints.minWidth and Constraints.minHeight is not supported, these should be the default zero values instead.");
        }
        if (i5 < 1) {
            s3.a.a("maxLines should be greater than 0");
        }
        p0 p0Var = eVar.f90522b;
        CharSequence charSequence3 = eVar.f90528h;
        if (i11 == 2) {
            i12 = 0;
            charSequence = charSequence3;
            if (!y3.p.a(p0Var.f75956a.f75890h, w20.h.j(0))) {
                charSequence = charSequence3;
                if (!y3.p.a(p0Var.f75956a.f75890h, y3.p.f96617c)) {
                    int i27 = p0Var.f75957b.f75973a;
                    charSequence = charSequence3;
                    charSequence = charSequence3;
                    charSequence = charSequence3;
                    if (i27 != Integer.MIN_VALUE && i27 != 5 && i27 != 4) {
                        int length = charSequence3.length();
                        charSequence = charSequence3;
                        if (length != 0) {
                            Spannable spannable = charSequence3 instanceof Spannable ? (Spannable) charSequence3 : null;
                            Spannable spannableString = spannable == null ? new SpannableString(charSequence3) : spannable;
                            boolean zB = n3.h.b(spannableString, p3.b.class);
                            charSequence = spannableString;
                            if (!zB) {
                                spannableString.setSpan(new p3.b(), spannableString.length() - 1, spannableString.length() - 1, 33);
                                charSequence = spannableString;
                            }
                        }
                    }
                }
            }
        } else {
            i12 = 0;
            charSequence = charSequence3;
        }
        CharSequence charSequence4 = charSequence;
        this.f75838e = charSequence4;
        u uVar = p0Var.f75957b;
        g0 g0Var3 = p0Var.f75956a;
        int i28 = uVar.f75973a;
        int i29 = 3;
        int i31 = i28 == 1 ? 3 : i28 == 2 ? 4 : i28 == 3 ? 2 : (i28 != 5 && i28 == 6) ? 1 : i12;
        int i32 = i28 == 4 ? 1 : i12;
        int i33 = uVar.f75980h == 2 ? Build.VERSION.SDK_INT <= 32 ? 2 : 4 : i12;
        int i34 = uVar.f75979g;
        int i35 = i34 & 255;
        if (i35 != 1) {
            if (i35 == 2) {
                i13 = i34;
                i14 = i32;
                i15 = 1;
            } else if (i35 == 3) {
                i13 = i34;
                i14 = i32;
                i15 = 2;
            } else {
                i13 = i34;
                i14 = i32;
                i15 = i12;
            }
        }
        int i36 = (i13 >> 8) & 255;
        if (i36 != 1) {
            if (i36 == 2) {
                i29 = 1;
            } else if (i36 == 3) {
                i29 = 2;
            } else if (i36 != 4) {
                i29 = i12;
            }
        }
        int i37 = (i13 >> 16) & 255;
        if (i37 != 1) {
            i16 = 2;
            if (i37 == 2) {
                g0Var = g0Var3;
                i17 = i31;
                i18 = 1;
            }
            if (i11 != i16) {
                truncateAt2 = TextUtils.TruncateAt.END;
            } else if (i11 == 5) {
                truncateAt2 = TextUtils.TruncateAt.MIDDLE;
            } else {
                if (i11 != 4) {
                    i19 = i33;
                    c11 = ' ';
                    g0Var2 = g0Var;
                    truncateAt = null;
                    n3.k kVarA = a(i17, i14, truncateAt, i5, i19, i15, i29, i18, charSequence4);
                    Layout layout2 = kVarA.f77764f;
                    i21 = i17;
                    if (Build.VERSION.SDK_INT >= 35 || eVar.f90527g.getLetterSpacing() == 0.0f || (!(i11 == 4 || i11 == 5) || layout2.getEllipsisCount(0) <= 0)) {
                        i22 = 2;
                        aVar = this;
                        i23 = i5;
                        i24 = i21;
                    } else {
                        int ellipsisStart = layout2.getEllipsisStart(0);
                        i22 = 2;
                        CharSequence[] charSequenceArr = {charSequence4.subSequence(0, ellipsisStart), "…", charSequence4.subSequence(layout2.getEllipsisCount(0) + ellipsisStart, charSequence4.length())};
                        aVar = this;
                        i23 = i5;
                        i24 = i21;
                        kVarA = aVar.a(i24, i14, truncateAt, i23, i19, i15, i29, i18, TextUtils.concat(charSequenceArr));
                    }
                    int i38 = kVarA.f77765g;
                    if (i11 == i22) {
                        i25 = i22;
                        if (kVarA.a() > y3.a.g(j11) && i23 > 1) {
                            int iG = y3.a.g(j11);
                            int i39 = 0;
                            while (true) {
                                if (i39 >= i38) {
                                    i39 = i38;
                                    break;
                                } else if (kVarA.e(i39) > iG) {
                                    break;
                                } else {
                                    i39++;
                                }
                            }
                            if (i39 >= 0 && i39 != aVar.f75835b) {
                                kVarA = aVar.a(i24, i14, truncateAt, i39 < 1 ? 1 : i39, i19, i15, i29, i18, aVar.f75838e);
                            }
                            aVar.f75837d = kVarA;
                        }
                        aVar.f75834a.f90527g.c(g0Var2.f75883a.c(), (Float.floatToRawIntBits(aVar.b()) & 4294967295L) | (Float.floatToRawIntBits(aVar.d()) << c11), g0Var2.f75883a.a());
                        layout = aVar.f75837d.f77764f;
                        if (layout.getText() instanceof Spanned) {
                            bVarArr = null;
                        } else {
                            CharSequence text = layout.getText();
                            Intrinsics.e(text, "null cannot be cast to non-null type android.text.Spanned");
                            Spanned spanned = (Spanned) text;
                            if (spanned.nextSpanTransition(-1, spanned.length(), w3.b.class) != spanned.length()) {
                                CharSequence text2 = layout.getText();
                                Intrinsics.e(text2, "null cannot be cast to non-null type android.text.Spanned");
                                bVarArr = (w3.b[]) ((Spanned) text2).getSpans(0, layout.getText().length(), w3.b.class);
                            }
                        }
                        if (bVarArr != null) {
                            b70.a aVarA = ArrayIteratorKt.a(bVarArr);
                            while (aVarA.hasNext()) {
                                ((s2) ((w3.b) aVarA.next()).f93741c).setValue(new h2.e((Float.floatToRawIntBits(aVar.b()) & 4294967295L) | (Float.floatToRawIntBits(aVar.d()) << c11)));
                            }
                        }
                        charSequence2 = aVar.f75838e;
                        if (charSequence2 instanceof Spanned) {
                            obj = EmptyList.f71733a;
                        } else {
                            Spanned spanned2 = (Spanned) charSequence2;
                            Object[] spans = spanned2.getSpans(0, charSequence2.length(), p3.h.class);
                            ArrayList arrayList = new ArrayList(spans.length);
                            int length2 = spans.length;
                            int i40 = 0;
                            while (i40 < length2) {
                                p3.h hVar = (p3.h) spans[i40];
                                int spanStart = spanned2.getSpanStart(hVar);
                                int spanEnd = spanned2.getSpanEnd(hVar);
                                int lineForOffset = aVar.f75837d.f77764f.getLineForOffset(spanStart);
                                boolean z11 = lineForOffset >= aVar.f75835b;
                                boolean z12 = aVar.f75837d.f77764f.getEllipsisCount(lineForOffset) > 0 && spanEnd > aVar.f75837d.f77764f.getEllipsisStart(lineForOffset) + aVar.f75837d.f77764f.getLineStart(lineForOffset);
                                boolean z13 = spanEnd > aVar.f75837d.f(lineForOffset);
                                if (z12 || z13 || z11) {
                                    i26 = i25;
                                    cVar = null;
                                } else {
                                    int iOrdinal = (aVar.f75837d.f77764f.isRtlCharAt(spanStart) ? x3.j.f95017b : x3.j.f95016a).ordinal();
                                    if (iOrdinal == 0) {
                                        fH = aVar.f75837d.h(spanStart, false);
                                    } else {
                                        if (iOrdinal != 1) {
                                            throw new NoWhenBranchMatchedException();
                                        }
                                        float fH2 = aVar.f75837d.h(spanStart, false);
                                        if (!hVar.f82058j) {
                                            s3.a.c("PlaceholderSpan is not laid out yet.");
                                        }
                                        fH = fH2 - hVar.f82056h;
                                    }
                                    if (!hVar.f82058j) {
                                        s3.a.c("PlaceholderSpan is not laid out yet.");
                                    }
                                    float f11 = hVar.f82056h + fH;
                                    n3.k kVar = aVar.f75837d;
                                    switch (hVar.f82054f) {
                                        case 0:
                                            i26 = i25;
                                            fD = kVar.d(lineForOffset);
                                            iB = hVar.b();
                                            fG = fD - iB;
                                            cVar = new h2.c(fH, fG, f11, hVar.b() + fG);
                                            break;
                                        case 1:
                                            i26 = i25;
                                            fG = kVar.g(lineForOffset);
                                            cVar = new h2.c(fH, fG, f11, hVar.b() + fG);
                                            break;
                                        case 2:
                                            i26 = i25;
                                            fD = kVar.e(lineForOffset);
                                            iB = hVar.b();
                                            fG = fD - iB;
                                            cVar = new h2.c(fH, fG, f11, hVar.b() + fG);
                                            break;
                                        case 3:
                                            i26 = i25;
                                            fG = ((kVar.e(lineForOffset) + kVar.g(lineForOffset)) - hVar.b()) / i26;
                                            cVar = new h2.c(fH, fG, f11, hVar.b() + fG);
                                            break;
                                        case 4:
                                            fB = hVar.a().ascent;
                                            fD2 = kVar.d(lineForOffset);
                                            fG = fD2 + fB;
                                            i26 = i25;
                                            cVar = new h2.c(fH, fG, f11, hVar.b() + fG);
                                            break;
                                        case 5:
                                            fG = (kVar.d(lineForOffset) + hVar.a().descent) - hVar.b();
                                            i26 = i25;
                                            cVar = new h2.c(fH, fG, f11, hVar.b() + fG);
                                            break;
                                        case 6:
                                            Paint.FontMetricsInt fontMetricsIntA = hVar.a();
                                            fB = ((fontMetricsIntA.ascent + fontMetricsIntA.descent) - hVar.b()) / 2;
                                            fD2 = kVar.d(lineForOffset);
                                            fG = fD2 + fB;
                                            i26 = i25;
                                            cVar = new h2.c(fH, fG, f11, hVar.b() + fG);
                                            break;
                                        default:
                                            throw new IllegalStateException("unexpected verticalAlignment");
                                    }
                                }
                                arrayList.add(cVar);
                                i40++;
                                i25 = i26;
                            }
                            obj = arrayList;
                        }
                        aVar.f75839f = obj;
                    }
                    i25 = i22;
                    aVar.f75837d = kVarA;
                    aVar.f75834a.f90527g.c(g0Var2.f75883a.c(), (Float.floatToRawIntBits(aVar.b()) & 4294967295L) | (Float.floatToRawIntBits(aVar.d()) << c11), g0Var2.f75883a.a());
                    layout = aVar.f75837d.f77764f;
                    if (layout.getText() instanceof Spanned) {
                    }
                    if (bVarArr != null) {
                    }
                    charSequence2 = aVar.f75838e;
                    if (charSequence2 instanceof Spanned) {
                    }
                    aVar.f75839f = obj;
                }
                truncateAt2 = TextUtils.TruncateAt.START;
            }
            i19 = i33;
            c11 = ' ';
            g0Var2 = g0Var;
            truncateAt = truncateAt2;
            n3.k kVarA2 = a(i17, i14, truncateAt, i5, i19, i15, i29, i18, charSequence4);
            Layout layout22 = kVarA2.f77764f;
            i21 = i17;
            if (Build.VERSION.SDK_INT >= 35) {
                i22 = 2;
                aVar = this;
                i23 = i5;
                i24 = i21;
            }
            int i382 = kVarA2.f77765g;
            if (i11 == i22) {
            }
            aVar.f75837d = kVarA2;
            aVar.f75834a.f90527g.c(g0Var2.f75883a.c(), (Float.floatToRawIntBits(aVar.b()) & 4294967295L) | (Float.floatToRawIntBits(aVar.d()) << c11), g0Var2.f75883a.a());
            layout = aVar.f75837d.f77764f;
            if (layout.getText() instanceof Spanned) {
            }
            if (bVarArr != null) {
            }
            charSequence2 = aVar.f75838e;
            if (charSequence2 instanceof Spanned) {
            }
            aVar.f75839f = obj;
        }
        i16 = 2;
        g0Var = g0Var3;
        i17 = i31;
        i18 = i12;
        if (i11 != i16) {
        }
        i19 = i33;
        c11 = ' ';
        g0Var2 = g0Var;
        truncateAt = truncateAt2;
        n3.k kVarA22 = a(i17, i14, truncateAt, i5, i19, i15, i29, i18, charSequence4);
        Layout layout222 = kVarA22.f77764f;
        i21 = i17;
        if (Build.VERSION.SDK_INT >= 35) {
        }
        int i3822 = kVarA22.f77765g;
        if (i11 == i22) {
        }
        aVar.f75837d = kVarA22;
        aVar.f75834a.f90527g.c(g0Var2.f75883a.c(), (Float.floatToRawIntBits(aVar.b()) & 4294967295L) | (Float.floatToRawIntBits(aVar.d()) << c11), g0Var2.f75883a.a());
        layout = aVar.f75837d.f77764f;
        if (layout.getText() instanceof Spanned) {
        }
        if (bVarArr != null) {
        }
        charSequence2 = aVar.f75838e;
        if (charSequence2 instanceof Spanned) {
        }
        aVar.f75839f = obj;
    }

    public final n3.k a(int i5, int i11, TextUtils.TruncateAt truncateAt, int i12, int i13, int i14, int i15, int i16, CharSequence charSequence) {
        x xVar;
        float fD = d();
        u3.e eVar = this.f75834a;
        u3.g gVar = eVar.f90527g;
        int i17 = eVar.f90532l;
        n3.f fVar = eVar.f90529i;
        p0 p0Var = eVar.f90522b;
        u3.b bVar = u3.c.f90519a;
        z zVar = p0Var.f75958c;
        return new n3.k(charSequence, fD, gVar, i5, truncateAt, i17, (zVar == null || (xVar = zVar.f75991b) == null) ? false : xVar.f75988a, i12, i14, i15, i16, i13, i11, fVar);
    }

    public final float b() {
        return this.f75837d.a();
    }

    public final long c(h2.c cVar, int i5, ge.d dVar) {
        int[] iArrW;
        RectF rectFM0 = g90.k.m0(cVar);
        int i11 = (!f0.b(i5, 0) && f0.b(i5, 1)) ? 1 : 0;
        z1 z1Var = new z1(dVar, 5);
        int i12 = Build.VERSION.SDK_INT;
        n3.k kVar = this.f75837d;
        if (i12 >= 34) {
            kVar.getClass();
            iArrW = vh.a.z(kVar, rectFM0, i11, z1Var);
        } else {
            iArrW = l2.w(kVar, kVar.f77764f, kVar.c(), rectFM0, i11, z1Var);
        }
        return iArrW == null ? o0.f75944b : z2.u(iArrW[0], iArrW[1]);
    }

    public final float d() {
        return y3.a.h(this.f75836c);
    }

    public final void e(Canvas canvas) {
        android.graphics.Canvas canvasA = i2.c.a(canvas);
        n3.k kVar = this.f75837d;
        if (kVar.f77762d) {
            canvasA.save();
            canvasA.clipRect(0.0f, 0.0f, d(), b());
        }
        int i5 = kVar.f77766h;
        if (canvasA.getClipBounds(kVar.f77772p)) {
            if (i5 != 0) {
                canvasA.translate(0.0f, i5);
            }
            n3.j jVar = n3.l.f77774a;
            jVar.f77758a = canvasA;
            kVar.f77764f.draw(jVar);
            if (i5 != 0) {
                canvasA.translate(0.0f, (-1) * i5);
            }
        }
        if (kVar.f77762d) {
            canvasA.restore();
        }
    }

    public final void f(Canvas canvas, long j11, u0 u0Var, x3.l lVar, k2.g gVar) {
        u3.g gVar2 = this.f75834a.f90527g;
        int i5 = gVar2.f90537c;
        gVar2.d(j11);
        gVar2.f(u0Var);
        gVar2.g(lVar);
        gVar2.e(gVar);
        gVar2.b(3);
        e(canvas);
        gVar2.b(i5);
    }

    public final void g(Canvas canvas, i2.p pVar, float f11, u0 u0Var, x3.l lVar, k2.g gVar) {
        u3.g gVar2 = this.f75834a.f90527g;
        int i5 = gVar2.f90537c;
        float fD = d();
        float fB = b();
        gVar2.c(pVar, (Float.floatToRawIntBits(fB) & 4294967295L) | (Float.floatToRawIntBits(fD) << 32), f11);
        gVar2.f(u0Var);
        gVar2.g(lVar);
        gVar2.e(gVar);
        gVar2.b(3);
        e(canvas);
        gVar2.b(i5);
    }
}
