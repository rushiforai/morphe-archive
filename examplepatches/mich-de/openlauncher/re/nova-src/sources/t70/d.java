package t70;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class d implements k {

    /* renamed from: a, reason: collision with root package name */
    public final c[] f88781a;

    public d(c[] cVarArr) {
        this.f88781a = cVarArr;
    }

    @Override // t70.k
    public final void a(Throwable th2) {
        b();
    }

    public final void b() {
        for (c cVar : this.f88781a) {
            a1 a1Var = cVar.f88776f;
            if (a1Var == null) {
                Intrinsics.m("handle");
                throw null;
            }
            a1Var.dispose();
        }
    }

    public final String toString() {
        return "DisposeHandlersOnCancel[" + this.f88781a + AbstractJsonLexerKt.END_LIST;
    }
}
