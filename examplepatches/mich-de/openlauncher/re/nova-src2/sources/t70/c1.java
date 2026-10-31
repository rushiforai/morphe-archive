package t70;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class c1 implements n1 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f88779a;

    public c1(boolean z11) {
        this.f88779a = z11;
    }

    @Override // t70.n1
    public final boolean b() {
        return this.f88779a;
    }

    @Override // t70.n1
    public final b2 c() {
        return null;
    }

    public final String toString() {
        return h6.c1.t(new StringBuilder("Empty{"), this.f88779a ? "Active" : "New", AbstractJsonLexerKt.END_OBJ);
    }
}
