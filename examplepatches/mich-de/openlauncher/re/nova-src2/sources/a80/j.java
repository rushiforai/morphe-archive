package a80;

import h6.c1;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import t70.m0;

/* loaded from: classes.dex */
public final class j extends i {

    /* renamed from: c, reason: collision with root package name */
    public final Runnable f495c;

    public j(Runnable runnable, long j11, boolean z11) {
        super(j11, z11);
        this.f495c = runnable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f495c.run();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Task[");
        Runnable runnable = this.f495c;
        sb2.append(runnable.getClass().getSimpleName());
        sb2.append('@');
        sb2.append(m0.m(runnable));
        sb2.append(", ");
        sb2.append(this.f493a);
        sb2.append(", ");
        return c1.t(sb2, this.f494b ? "Blocking" : "Non-blocking", AbstractJsonLexerKt.END_LIST);
    }
}
