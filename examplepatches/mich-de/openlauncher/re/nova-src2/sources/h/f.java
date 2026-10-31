package h;

import g.s;
import kotlin.jvm.functions.Function0;
import p1.e1;

/* loaded from: classes2.dex */
public final class f extends s {
    public final /* synthetic */ e1 Y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(e1 e1Var, boolean z11) {
        super(z11);
        this.Y = e1Var;
    }

    @Override // g.s
    public final void handleOnBackPressed() {
        ((Function0) this.Y.getValue()).invoke();
    }
}
