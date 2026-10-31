package ya;

import java.util.Arrays;
import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class r implements Iterable {

    /* renamed from: a, reason: collision with root package name */
    public final p f97209a = new p();

    public static r e(p pVar) {
        r rVar = new r();
        int i5 = pVar.f97194b;
        p pVar2 = rVar.f97209a;
        pVar2.g(i5);
        System.arraycopy(pVar.f97193a, 0, pVar2.f97193a, pVar2.f97194b, i5);
        int i11 = pVar2.f97194b + i5;
        pVar2.f97194b = i11;
        Arrays.sort(pVar2.f97193a, 0, i11);
        return rVar;
    }

    public final void c(int i5) {
        p pVar = this.f97209a;
        if (Arrays.binarySearch(pVar.f97193a, 0, pVar.f97194b, i5) < 0) {
            pVar.d((-r1) - 1, i5);
        }
    }

    public final boolean d(int i5) {
        p pVar = this.f97209a;
        return Arrays.binarySearch(pVar.f97193a, 0, pVar.f97194b, i5) >= 0;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        return (obj instanceof r) && ((r) obj).f97209a.equals(this.f97209a);
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        p pVar = this.f97209a;
        pVar.getClass();
        return new com.google.android.gms.internal.measurement.u(pVar, 2);
    }

    public final String toString() {
        return "IntSet{" + this.f97209a.r() + AbstractJsonLexerKt.END_OBJ;
    }
}
