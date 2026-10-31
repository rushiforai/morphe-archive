package xk;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class i0 extends j0 {
    @Override // xk.j0
    public final void b(StringBuilder sb2) {
        sb2.append('(');
        sb2.append(this.f95941a);
    }

    @Override // xk.j0
    public final void c(StringBuilder sb2) {
        sb2.append(this.f95941a);
        sb2.append(AbstractJsonLexerKt.END_LIST);
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Comparable, java.lang.Object] */
    @Override // xk.j0
    public final boolean d(Comparable comparable) {
        n2 n2Var = n2.f95978c;
        return this.f95941a.compareTo(comparable) < 0;
    }

    @Override // xk.j0
    public final int hashCode() {
        return ~this.f95941a.hashCode();
    }

    public final String toString() {
        return "/" + this.f95941a + "\\";
    }
}
