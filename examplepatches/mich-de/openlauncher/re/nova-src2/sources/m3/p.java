package m3;

import android.text.Layout;
import android.text.TextUtils;
import androidx.compose.ui.graphics.Canvas;
import b.u4;
import e10.z2;
import i2.u0;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import kotlin.jvm.internal.Ref;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final qp.i f75947a;

    /* renamed from: b, reason: collision with root package name */
    public final int f75948b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f75949c;

    /* renamed from: d, reason: collision with root package name */
    public final float f75950d;

    /* renamed from: e, reason: collision with root package name */
    public final float f75951e;

    /* renamed from: f, reason: collision with root package name */
    public final int f75952f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f75953g;

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f75954h;

    /* JADX WARN: Type inference failed for: r7v1, types: [java.lang.Object, java.util.List] */
    public p(qp.i iVar, long j11, int i5, int i11) {
        boolean z11;
        int i12;
        int iG;
        int i13;
        this.f75947a = iVar;
        this.f75948b = i5;
        if (y3.a.j(j11) != 0 || y3.a.i(j11) != 0) {
            s3.a.a("Setting Constraints.minWidth and Constraints.minHeight is not supported, these should be the default zero values instead.");
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = (ArrayList) iVar.f84311e;
        int size = arrayList2.size();
        float f11 = 0.0f;
        int i14 = 0;
        int i15 = 0;
        while (i14 < size) {
            s sVar = (s) arrayList2.get(i14);
            u3.e eVar = sVar.f75970a;
            int iH = y3.a.h(j11);
            if (y3.a.c(j11)) {
                i12 = i14;
                iG = y3.a.g(j11) - ((int) Math.ceil(f11));
                if (iG < 0) {
                    iG = 0;
                }
            } else {
                i12 = i14;
                iG = y3.a.g(j11);
            }
            a aVar = new a(eVar, this.f75948b - i15, i11, y3.b.b(iH, iG, 5));
            float fB = aVar.b() + f11;
            n3.k kVar = aVar.f75837d;
            int i16 = i15 + kVar.f77765g;
            arrayList.add(new r(aVar, sVar.f75971b, sVar.f75972c, i15, i16, f11, fB));
            if (!kVar.f77762d) {
                if (i16 == this.f75948b) {
                    i13 = i12;
                    if (i13 != ul.b.K((ArrayList) this.f75947a.f84311e)) {
                    }
                } else {
                    i13 = i12;
                }
                i14 = i13 + 1;
                i15 = i16;
                f11 = fB;
            }
            z11 = true;
            i15 = i16;
            f11 = fB;
            break;
        }
        z11 = false;
        this.f75951e = f11;
        this.f75952f = i15;
        this.f75949c = z11;
        this.f75954h = arrayList;
        this.f75950d = y3.a.h(j11);
        ArrayList arrayList3 = new ArrayList(arrayList.size());
        int size2 = arrayList.size();
        for (int i17 = 0; i17 < size2; i17++) {
            r rVar = (r) arrayList.get(i17);
            ?? r72 = rVar.f75962a.f75839f;
            ArrayList arrayList4 = new ArrayList(r72.size());
            int size3 = ((Collection) r72).size();
            for (int i18 = 0; i18 < size3; i18++) {
                h2.c cVar = (h2.c) r72.get(i18);
                arrayList4.add(cVar != null ? rVar.a(cVar) : null);
            }
            b70.d.z0(arrayList4, arrayList3);
        }
        if (arrayList3.size() < ((List) this.f75947a.f84308b).size()) {
            int size4 = ((List) this.f75947a.f84308b).size() - arrayList3.size();
            ArrayList arrayList5 = new ArrayList(size4);
            for (int i19 = 0; i19 < size4; i19++) {
                arrayList5.add(null);
            }
            arrayList3 = b70.g.t1(arrayList5, arrayList3);
        }
        this.f75953g = arrayList3;
    }

    public static void i(p pVar, Canvas canvas, long j11, u0 u0Var, x3.l lVar, k2.g gVar) {
        canvas.save();
        ArrayList arrayList = pVar.f75954h;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            r rVar = (r) arrayList.get(i5);
            rVar.f75962a.f(canvas, j11, u0Var, lVar, gVar);
            canvas.translate(0.0f, rVar.f75962a.b());
        }
        canvas.restore();
    }

    public final void a(long j11, float[] fArr) {
        j(o0.f(j11));
        k(o0.e(j11));
        Ref.IntRef intRef = new Ref.IntRef();
        intRef.f71861a = 0;
        ab.e0.B(this.f75954h, j11, new e0.s(j11, fArr, intRef, new Ref.FloatRef()));
    }

    public final float b(int i5) {
        l(i5);
        ArrayList arrayList = this.f75954h;
        r rVar = (r) arrayList.get(ab.e0.z(i5, arrayList));
        a aVar = rVar.f75962a;
        return aVar.f75837d.e(i5 - rVar.f75965d) + rVar.f75967f;
    }

    public final int c(int i5, boolean z11) {
        int iF;
        l(i5);
        ArrayList arrayList = this.f75954h;
        r rVar = (r) arrayList.get(ab.e0.z(i5, arrayList));
        a aVar = rVar.f75962a;
        int i11 = i5 - rVar.f75965d;
        n3.k kVar = aVar.f75837d;
        if (z11) {
            Layout layout = kVar.f77764f;
            n3.j jVar = n3.l.f77774a;
            if (layout.getEllipsisCount(i11) <= 0 || kVar.f77760b != TextUtils.TruncateAt.END) {
                qp.i iVarC = kVar.c();
                Layout layout2 = (Layout) iVarC.f84307a;
                iF = iVarC.p(layout2.getLineEnd(i11), layout2.getLineStart(i11));
            } else {
                iF = layout.getEllipsisStart(i11) + layout.getLineStart(i11);
            }
        } else {
            iF = kVar.f(i11);
        }
        return iF + rVar.f75963b;
    }

    public final int d(int i5) {
        int length = ((g) this.f75947a.f84307a).f75880b.length();
        ArrayList arrayList = this.f75954h;
        r rVar = (r) arrayList.get(i5 >= length ? ul.b.K(arrayList) : i5 < 0 ? 0 : ab.e0.y(i5, arrayList));
        return rVar.f75962a.f75837d.f77764f.getLineForOffset(rVar.d(i5)) + rVar.f75965d;
    }

    public final int e(float f11) {
        ArrayList arrayList = this.f75954h;
        r rVar = (r) arrayList.get(ab.e0.A(f11, arrayList));
        int i5 = rVar.f75964c - rVar.f75963b;
        int i11 = rVar.f75965d;
        if (i5 == 0) {
            return i11;
        }
        a aVar = rVar.f75962a;
        float f12 = f11 - rVar.f75967f;
        n3.k kVar = aVar.f75837d;
        return kVar.f77764f.getLineForVertical(((int) f12) - kVar.f77766h) + i11;
    }

    public final float f(int i5) {
        l(i5);
        ArrayList arrayList = this.f75954h;
        r rVar = (r) arrayList.get(ab.e0.z(i5, arrayList));
        a aVar = rVar.f75962a;
        return aVar.f75837d.g(i5 - rVar.f75965d) + rVar.f75967f;
    }

    public final int g(long j11) {
        int i5 = (int) (j11 & 4294967295L);
        float fIntBitsToFloat = Float.intBitsToFloat(i5);
        ArrayList arrayList = this.f75954h;
        r rVar = (r) arrayList.get(ab.e0.A(fIntBitsToFloat, arrayList));
        int i11 = rVar.f75964c;
        int i12 = rVar.f75963b;
        if (i11 - i12 == 0) {
            return i12;
        }
        a aVar = rVar.f75962a;
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 >> 32));
        float fIntBitsToFloat3 = Float.intBitsToFloat(i5) - rVar.f75967f;
        long jFloatToRawIntBits = (Float.floatToRawIntBits(fIntBitsToFloat3) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat2) << 32);
        n3.k kVar = aVar.f75837d;
        int lineForVertical = kVar.f77764f.getLineForVertical(((int) Float.intBitsToFloat((int) (4294967295L & jFloatToRawIntBits))) - kVar.f77766h);
        return kVar.f77764f.getOffsetForHorizontal(lineForVertical, (kVar.b(lineForVertical) * (-1)) + Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32))) + i12;
    }

    public final long h(h2.c cVar, int i5, ge.d dVar) {
        long jB;
        long j11;
        float f11 = cVar.f59019b;
        ArrayList arrayList = this.f75954h;
        int iA = ab.e0.A(f11, arrayList);
        float f12 = ((r) arrayList.get(iA)).f75968g;
        float f13 = cVar.f59021d;
        if (f12 >= f13 || iA == ul.b.K(arrayList)) {
            r rVar = (r) arrayList.get(iA);
            return rVar.b(rVar.f75962a.c(rVar.c(cVar), i5, dVar), true);
        }
        int iA2 = ab.e0.A(f13, arrayList);
        long jB2 = o0.f75944b;
        while (true) {
            jB = o0.f75944b;
            if (!o0.b(jB2, jB) || iA > iA2) {
                break;
            }
            r rVar2 = (r) arrayList.get(iA);
            jB2 = rVar2.b(rVar2.f75962a.c(rVar2.c(cVar), i5, dVar), true);
            iA++;
        }
        if (o0.b(jB2, jB)) {
            return jB;
        }
        while (true) {
            j11 = o0.f75944b;
            if (!o0.b(jB, j11) || iA > iA2) {
                break;
            }
            r rVar3 = (r) arrayList.get(iA2);
            jB = rVar3.b(rVar3.f75962a.c(rVar3.c(cVar), i5, dVar), true);
            iA2--;
        }
        return o0.b(jB, j11) ? jB2 : z2.u((int) (jB2 >> 32), (int) (4294967295L & jB));
    }

    public final void j(int i5) {
        boolean z11 = false;
        qp.i iVar = this.f75947a;
        if (i5 >= 0 && i5 < ((g) iVar.f84307a).f75880b.length()) {
            z11 = true;
        }
        if (z11) {
            return;
        }
        StringBuilder sbJ = u4.j(i5, "offset(", ") is out of bounds [0, ");
        sbJ.append(((g) iVar.f84307a).f75880b.length());
        sbJ.append(')');
        s3.a.a(sbJ.toString());
    }

    public final void k(int i5) {
        boolean z11 = false;
        qp.i iVar = this.f75947a;
        if (i5 >= 0 && i5 <= ((g) iVar.f84307a).f75880b.length()) {
            z11 = true;
        }
        if (z11) {
            return;
        }
        StringBuilder sbJ = u4.j(i5, "offset(", ") is out of bounds [0, ");
        sbJ.append(((g) iVar.f84307a).f75880b.length());
        sbJ.append(AbstractJsonLexerKt.END_LIST);
        s3.a.a(sbJ.toString());
    }

    public final void l(int i5) {
        boolean z11 = false;
        int i11 = this.f75952f;
        if (i5 >= 0 && i5 < i11) {
            z11 = true;
        }
        if (z11) {
            return;
        }
        s3.a.a("lineIndex(" + i5 + ") is out of bounds [0, " + i11 + ')');
    }
}
