package b3;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public final class r2 extends Modifier$Node {

    /* renamed from: a, reason: collision with root package name */
    public boolean f17327a;

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        this.f17327a = true;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        this.f17327a = false;
    }

    public final String toString() {
        return "<tail>";
    }
}
