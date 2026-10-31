package t70;

import kotlin.jvm.functions.Function1;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class j implements k {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88809a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f88810b;

    public /* synthetic */ j(Object obj, int i5) {
        this.f88809a = i5;
        this.f88810b = obj;
    }

    @Override // t70.k
    public final void a(Throwable th2) {
        switch (this.f88809a) {
            case 0:
                ((Function1) this.f88810b).invoke(th2);
                break;
            default:
                ((a1) this.f88810b).dispose();
                break;
        }
    }

    public final String toString() {
        switch (this.f88809a) {
            case 0:
                return "CancelHandler.UserSupplied[" + ((Function1) this.f88810b).getClass().getSimpleName() + '@' + m0.m(this) + AbstractJsonLexerKt.END_LIST;
            default:
                return "DisposeOnCancel[" + ((a1) this.f88810b) + AbstractJsonLexerKt.END_LIST;
        }
    }
}
