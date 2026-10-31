package j3;

import androidx.compose.ui.Modifier$Node;
import b3.p2;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class c extends Modifier$Node implements p2 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f68771a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f68772b;

    /* renamed from: c, reason: collision with root package name */
    public Function1 f68773c;

    public c(Function1 function1, boolean z11, boolean z12) {
        this.f68771a = z11;
        this.f68772b = z12;
        this.f68773c = function1;
    }

    @Override // b3.p2
    public final void applySemantics(b0 b0Var) {
        this.f68773c.invoke(b0Var);
    }

    @Override // b3.p2
    public final boolean getShouldClearDescendantSemantics() {
        return this.f68772b;
    }

    @Override // b3.p2
    public final boolean getShouldMergeDescendantSemantics() {
        return this.f68771a;
    }
}
