package ag;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class c implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public int f12782a;

    /* renamed from: b, reason: collision with root package name */
    public int f12783b;

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        c cVar = (c) obj;
        int i5 = this.f12783b;
        int i11 = cVar.f12783b;
        return i5 != i11 ? i5 - i11 : this.f12782a - cVar.f12782a;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Order{order=");
        sb2.append(this.f12783b);
        sb2.append(", index=");
        return a2.c.m(sb2, this.f12782a, AbstractJsonLexerKt.END_OBJ);
    }
}
