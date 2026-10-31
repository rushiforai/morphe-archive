package p50;

import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final q50.c f82095a;

    /* renamed from: b, reason: collision with root package name */
    public int f82096b;

    /* renamed from: c, reason: collision with root package name */
    public int f82097c;

    /* renamed from: d, reason: collision with root package name */
    public c f82098d;

    public d(q50.c builder) {
        Intrinsics.g(builder, "builder");
        this.f82095a = builder;
        this.f82098d = (c) e.f82100b.J();
    }

    public final q50.b a(String str) {
        if (this.f82096b == 0) {
            return null;
        }
        int i5 = q50.f.f83688a;
        int iAbs = Math.abs(q50.f.a(str, 0, str.length()));
        int i11 = this.f82097c;
        while (true) {
            int i12 = iAbs % i11;
            int i13 = i12 * 6;
            if (this.f82098d.a(i13) == -1) {
                return null;
            }
            if (b(i13, str)) {
                return (q50.b) this.f82095a.subSequence(this.f82098d.a(i13 + 3), this.f82098d.a(i13 + 4));
            }
            iAbs = i12 + 1;
            i11 = this.f82097c;
        }
    }

    public final boolean b(int i5, CharSequence charSequence) {
        int iA = this.f82098d.a(i5 + 1);
        int iA2 = this.f82098d.a(i5 + 2);
        int i11 = q50.f.f83688a;
        q50.c cVar = this.f82095a;
        Intrinsics.g(cVar, "<this>");
        if (iA2 - iA != charSequence.length()) {
            return false;
        }
        for (int i12 = iA; i12 < iA2; i12++) {
            int iCharAt = cVar.charAt(i12);
            if (65 <= iCharAt && iCharAt < 91) {
                iCharAt += 32;
            }
            int iCharAt2 = charSequence.charAt(i12 - iA);
            if (65 <= iCharAt2 && iCharAt2 < 91) {
                iCharAt2 += 32;
            }
            if (iCharAt != iCharAt2) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Type inference failed for: r2v8, types: [kotlin.coroutines.jvm.internal.RestrictedSuspendLambda, kotlin.jvm.functions.Function2] */
    public final void c(int i5, int i11, int i12, int i13) {
        int i14;
        int i15 = this.f82096b;
        double d5 = i15;
        int i16 = this.f82097c;
        if (d5 >= i16 * 0.75d) {
            c cVar = this.f82098d;
            this.f82096b = 0;
            this.f82097c = (i16 * 2) | 128;
            c cVar2 = (c) e.f82100b.J();
            int size = (cVar.f82094a.size() * 2) | 1;
            for (int i17 = 0; i17 < size; i17++) {
                cVar2.f82094a.add(e.f82099a.J());
            }
            this.f82098d = cVar2;
            q70.c cVarO = u90.b.O(new SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1(new b(cVar, null)).f71969a);
            while (cVarO.hasNext()) {
                int iIntValue = ((Number) cVarO.next()).intValue();
                c(cVar.a(iIntValue + 1), cVar.a(iIntValue + 2), cVar.a(iIntValue + 3), cVar.a(iIntValue + 4));
            }
            e.f82100b.W(cVar);
            if (i15 != this.f82096b) {
                throw new IllegalArgumentException("Failed requirement.");
            }
        }
        q50.c cVar3 = this.f82095a;
        int iAbs = Math.abs(q50.f.a(cVar3, i5, i11));
        CharSequence charSequenceSubSequence = cVar3.subSequence(i5, i11);
        int i18 = iAbs % this.f82097c;
        int i19 = -1;
        while (true) {
            i14 = i18 * 6;
            if (this.f82098d.a(i14) == -1) {
                break;
            }
            if (b(i14, charSequenceSubSequence)) {
                i19 = i18;
            }
            i18 = (i18 + 1) % this.f82097c;
        }
        this.f82098d.b(i14, iAbs);
        this.f82098d.b(i14 + 1, i5);
        this.f82098d.b(i14 + 2, i11);
        this.f82098d.b(i14 + 3, i12);
        this.f82098d.b(i14 + 4, i13);
        this.f82098d.b(i14 + 5, -1);
        if (i19 != -1) {
            this.f82098d.b((i19 * 6) + 5, i18);
        }
        this.f82096b++;
    }

    public final void d() {
        this.f82096b = 0;
        this.f82097c = 0;
        b60.a aVar = e.f82100b;
        aVar.W(this.f82098d);
        this.f82098d = (c) aVar.J();
    }

    /* JADX WARN: Type inference failed for: r1v3, types: [kotlin.coroutines.jvm.internal.RestrictedSuspendLambda, kotlin.jvm.functions.Function2] */
    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        b60.a aVar = e.f82099a;
        c cVar = this.f82098d;
        cVar.getClass();
        q70.c cVarO = u90.b.O(new SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1(new b(cVar, null)).f71969a);
        while (cVarO.hasNext()) {
            int iIntValue = ((Number) cVarO.next()).intValue();
            sb2.append((CharSequence) com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            int iA = this.f82098d.a(iIntValue + 1);
            int iA2 = this.f82098d.a(iIntValue + 2);
            sb2.append(this.f82095a.subSequence(iA, iA2));
            sb2.append((CharSequence) " => ");
            sb2.append(r5.subSequence(this.f82098d.a(iIntValue + 3), this.f82098d.a(iIntValue + 4)));
            sb2.append((CharSequence) "\n");
        }
        return sb2.toString();
    }
}
