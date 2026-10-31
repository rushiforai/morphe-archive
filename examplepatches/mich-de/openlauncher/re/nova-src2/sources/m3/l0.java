package m3;

import android.graphics.RectF;
import android.text.Layout;
import b.u4;
import e10.z2;
import f1.o2;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public final k0 f75927a;

    /* renamed from: b, reason: collision with root package name */
    public final p f75928b;

    /* renamed from: c, reason: collision with root package name */
    public final long f75929c;

    /* renamed from: d, reason: collision with root package name */
    public final float f75930d;

    /* renamed from: e, reason: collision with root package name */
    public final float f75931e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f75932f;

    public l0(k0 k0Var, p pVar, long j11) {
        this.f75927a = k0Var;
        this.f75928b = pVar;
        this.f75929c = j11;
        ArrayList arrayList = pVar.f75954h;
        float fD = 0.0f;
        this.f75930d = arrayList.isEmpty() ? 0.0f : ((r) arrayList.get(0)).f75962a.f75837d.d(0);
        if (!arrayList.isEmpty()) {
            r rVar = (r) b70.g.h1(arrayList);
            fD = rVar.f75962a.f75837d.d(r4.f77765g - 1) + rVar.f75967f;
        }
        this.f75931e = fD;
        this.f75932f = pVar.f75953g;
    }

    public final x3.j a(int i5) {
        p pVar = this.f75928b;
        ArrayList arrayList = pVar.f75954h;
        pVar.k(i5);
        r rVar = (r) arrayList.get(i5 == ((g) pVar.f75947a.f84307a).f75880b.length() ? ul.b.K(arrayList) : ab.e0.y(i5, arrayList));
        return rVar.f75962a.f75837d.f77764f.isRtlCharAt(rVar.d(i5)) ? x3.j.f95017b : x3.j.f95016a;
    }

    public final h2.c b(int i5) {
        float fI;
        float fI2;
        float fH;
        float fH2;
        p pVar = this.f75928b;
        pVar.j(i5);
        ArrayList arrayList = pVar.f75954h;
        r rVar = (r) arrayList.get(ab.e0.y(i5, arrayList));
        a aVar = rVar.f75962a;
        int iD = rVar.d(i5);
        CharSequence charSequence = aVar.f75838e;
        if (iD < 0 || iD >= charSequence.length()) {
            StringBuilder sbJ = u4.j(iD, "offset(", ") is out of bounds [0,");
            sbJ.append(charSequence.length());
            sbJ.append(')');
            s3.a.a(sbJ.toString());
        }
        n3.k kVar = aVar.f75837d;
        Layout layout = kVar.f77764f;
        int lineForOffset = layout.getLineForOffset(iD);
        float fG = kVar.g(lineForOffset);
        float fE = kVar.e(lineForOffset);
        boolean z11 = layout.getParagraphDirection(lineForOffset) == 1;
        boolean zIsRtlCharAt = layout.isRtlCharAt(iD);
        if (!z11 || zIsRtlCharAt) {
            if (z11 && zIsRtlCharAt) {
                fH = kVar.i(iD, false);
                fH2 = kVar.i(iD + 1, true);
            } else if (zIsRtlCharAt) {
                fH = kVar.h(iD, false);
                fH2 = kVar.h(iD + 1, true);
            } else {
                fI = kVar.i(iD, false);
                fI2 = kVar.i(iD + 1, true);
            }
            float f11 = fH;
            fI = fH2;
            fI2 = f11;
        } else {
            fI = kVar.h(iD, false);
            fI2 = kVar.h(iD + 1, true);
        }
        RectF rectF = new RectF(fI, fG, fI2, fE);
        return rVar.a(new h2.c(rectF.left, rectF.top, rectF.right, rectF.bottom));
    }

    public final h2.c c(int i5) {
        p pVar = this.f75928b;
        ArrayList arrayList = pVar.f75954h;
        pVar.k(i5);
        r rVar = (r) arrayList.get(i5 == ((g) pVar.f75947a.f84307a).f75880b.length() ? ul.b.K(arrayList) : ab.e0.y(i5, arrayList));
        a aVar = rVar.f75962a;
        int iD = rVar.d(i5);
        CharSequence charSequence = aVar.f75838e;
        n3.k kVar = aVar.f75837d;
        if (iD < 0 || iD > charSequence.length()) {
            StringBuilder sbJ = u4.j(iD, "offset(", ") is out of bounds [0,");
            sbJ.append(charSequence.length());
            sbJ.append(AbstractJsonLexerKt.END_LIST);
            s3.a.a(sbJ.toString());
        }
        float fH = kVar.h(iD, false);
        int lineForOffset = kVar.f77764f.getLineForOffset(iD);
        return rVar.a(new h2.c(fH, kVar.g(lineForOffset), fH, kVar.e(lineForOffset)));
    }

    public final float d(int i5) {
        p pVar = this.f75928b;
        pVar.l(i5);
        ArrayList arrayList = pVar.f75954h;
        r rVar = (r) arrayList.get(ab.e0.z(i5, arrayList));
        a aVar = rVar.f75962a;
        int i11 = i5 - rVar.f75965d;
        n3.k kVar = aVar.f75837d;
        return kVar.f77764f.getLineLeft(i11) + (i11 == kVar.f77765g + (-1) ? kVar.f77768j : 0.0f);
    }

    public final float e(int i5) {
        p pVar = this.f75928b;
        pVar.l(i5);
        ArrayList arrayList = pVar.f75954h;
        r rVar = (r) arrayList.get(ab.e0.z(i5, arrayList));
        a aVar = rVar.f75962a;
        int i11 = i5 - rVar.f75965d;
        n3.k kVar = aVar.f75837d;
        return kVar.f77764f.getLineRight(i11) + (i11 == kVar.f77765g + (-1) ? kVar.f77769k : 0.0f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l0)) {
            return false;
        }
        l0 l0Var = (l0) obj;
        return Intrinsics.b(this.f75927a, l0Var.f75927a) && this.f75928b.equals(l0Var.f75928b) && y3.m.a(this.f75929c, l0Var.f75929c) && this.f75930d == l0Var.f75930d && this.f75931e == l0Var.f75931e && Intrinsics.b(this.f75932f, l0Var.f75932f);
    }

    public final int f(int i5) {
        p pVar = this.f75928b;
        pVar.l(i5);
        ArrayList arrayList = pVar.f75954h;
        r rVar = (r) arrayList.get(ab.e0.z(i5, arrayList));
        a aVar = rVar.f75962a;
        return aVar.f75837d.f77764f.getLineStart(i5 - rVar.f75965d) + rVar.f75963b;
    }

    public final x3.j g(int i5) {
        p pVar = this.f75928b;
        ArrayList arrayList = pVar.f75954h;
        pVar.k(i5);
        r rVar = (r) arrayList.get(i5 == ((g) pVar.f75947a.f84307a).f75880b.length() ? ul.b.K(arrayList) : ab.e0.y(i5, arrayList));
        a aVar = rVar.f75962a;
        int iD = rVar.d(i5);
        n3.k kVar = aVar.f75837d;
        return kVar.f77764f.getParagraphDirection(kVar.f77764f.getLineForOffset(iD)) == 1 ? x3.j.f95016a : x3.j.f95017b;
    }

    public final i2.h h(int i5, int i11) {
        p pVar = this.f75928b;
        g gVar = (g) pVar.f75947a.f84307a;
        if (i5 < 0 || i5 > i11 || i11 > gVar.f75880b.length()) {
            StringBuilder sbT = b.c0.t(i5, "Start(", ") or End(", i11, ") is out of range [0..");
            sbT.append(gVar.f75880b.length());
            sbT.append("), or start > end!");
            s3.a.a(sbT.toString());
        }
        if (i5 == i11) {
            return i2.k.a();
        }
        i2.h hVarA = i2.k.a();
        ab.e0.B(pVar.f75954h, z2.u(i5, i11), new o2(hVarA, i5, i11));
        return hVarA;
    }

    public final int hashCode() {
        return this.f75932f.hashCode() + a80.m.d(this.f75931e, a80.m.d(this.f75930d, b.c0.d((this.f75928b.hashCode() + (this.f75927a.hashCode() * 31)) * 31, 31, this.f75929c), 31), 31);
    }

    public final long i(int i5) {
        p pVar = this.f75928b;
        ArrayList arrayList = pVar.f75954h;
        pVar.k(i5);
        r rVar = (r) arrayList.get(i5 == ((g) pVar.f75947a.f84307a).f75880b.length() ? ul.b.K(arrayList) : ab.e0.y(i5, arrayList));
        a aVar = rVar.f75962a;
        int iD = rVar.d(i5);
        fk.l lVarJ = aVar.f75837d.j();
        return rVar.b(z2.u(android.support.v4.media.session.b.d0(lVarJ, iD), android.support.v4.media.session.b.c0(lVarJ, iD)), false);
    }

    public final String toString() {
        return "TextLayoutResult(layoutInput=" + this.f75927a + ", multiParagraph=" + this.f75928b + ", size=" + ((Object) y3.m.b(this.f75929c)) + ", firstBaseline=" + this.f75930d + ", lastBaseline=" + this.f75931e + ", placeholderRects=" + this.f75932f + ')';
    }
}
