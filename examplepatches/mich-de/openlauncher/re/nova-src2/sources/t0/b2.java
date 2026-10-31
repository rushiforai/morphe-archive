package t0;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class b2 {

    /* renamed from: a, reason: collision with root package name */
    public static final bg.e f87929a = new bg.e(r3.r.f85456a, 0, 0);

    public static final r3.f0 a(r3.i0 i0Var, m3.g gVar) {
        r3.f0 f0VarA = i0Var.a(gVar);
        int length = gVar.f75880b.length();
        m3.g gVar2 = f0VarA.f85439a;
        r3.s sVar = f0VarA.f85440b;
        int length2 = gVar2.f75880b.length();
        int iMin = Math.min(length, 100);
        for (int i5 = 0; i5 < iMin; i5++) {
            b(sVar.o(i5), length2, i5);
        }
        b(sVar.o(length), length2, length);
        int iMin2 = Math.min(length2, 100);
        for (int i11 = 0; i11 < iMin2; i11++) {
            c(sVar.m(i11), length, i11);
        }
        c(sVar.m(length2), length, length2);
        return new r3.f0(gVar2, new bg.e(sVar, gVar.f75880b.length(), gVar2.f75880b.length()));
    }

    public static final void b(int i5, int i11, int i12) {
        boolean z11 = false;
        if (i5 >= 0 && i5 <= i11) {
            z11 = true;
        }
        if (z11) {
            return;
        }
        StringBuilder sbT = b.c0.t(i12, "OffsetMapping.originalToTransformed returned invalid mapping: ", " -> ", i5, " is not in range of transformed text [0, ");
        sbT.append(i11);
        sbT.append(AbstractJsonLexerKt.END_LIST);
        j0.b.c(sbT.toString());
    }

    public static final void c(int i5, int i11, int i12) {
        boolean z11 = false;
        if (i5 >= 0 && i5 <= i11) {
            z11 = true;
        }
        if (z11) {
            return;
        }
        StringBuilder sbT = b.c0.t(i12, "OffsetMapping.transformedToOriginal returned invalid mapping: ", " -> ", i5, " is not in range of original text [0, ");
        sbT.append(i11);
        sbT.append(AbstractJsonLexerKt.END_LIST);
        j0.b.c(sbT.toString());
    }
}
