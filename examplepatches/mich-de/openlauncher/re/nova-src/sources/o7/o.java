package o7;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class o extends p {

    /* renamed from: a, reason: collision with root package name */
    public final g f79678a;

    public o(g gVar) {
        this.f79678a = gVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || o.class != obj.getClass()) {
            return false;
        }
        return this.f79678a.equals(((o) obj).f79678a);
    }

    public final int hashCode() {
        return this.f79678a.hashCode() + (o.class.getName().hashCode() * 31);
    }

    public final String toString() {
        return "Success {mOutputData=" + this.f79678a + AbstractJsonLexerKt.END_OBJ;
    }
}
