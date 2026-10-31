package g2;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public final class u extends Modifier$Node implements t {

    /* renamed from: a, reason: collision with root package name */
    public s f56903a;

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        super.onAttach();
        this.f56903a.f56902a.b(this);
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        this.f56903a.f56902a.j(this);
        super.onDetach();
    }
}
