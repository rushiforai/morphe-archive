package q0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public final class c extends Modifier$Node {

    /* renamed from: a, reason: collision with root package name */
    public b f83314a;

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        b bVar = this.f83314a;
        if (bVar instanceof b) {
            bVar.f83313a.j(this);
        }
        if (bVar instanceof b) {
            bVar.f83313a.b(this);
        }
        this.f83314a = bVar;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        b bVar = this.f83314a;
        if (bVar instanceof b) {
            bVar.f83313a.j(this);
        }
    }
}
