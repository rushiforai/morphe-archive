package o7;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class m extends p {

    /* renamed from: a, reason: collision with root package name */
    public final g f79677a = g.f79665c;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || m.class != obj.getClass()) {
            return false;
        }
        return this.f79677a.equals(((m) obj).f79677a);
    }

    public final int hashCode() {
        return this.f79677a.hashCode() + (m.class.getName().hashCode() * 31);
    }

    public final String toString() {
        return "Failure {mOutputData=" + this.f79677a + AbstractJsonLexerKt.END_OBJ;
    }
}
