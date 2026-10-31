package androidx.compose.foundation.text.contextmenu.modifier;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import e1.q0;
import kotlin.Metadata;
import z0.e;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/text/contextmenu/modifier/TextContextMenuGestureElement;", "Lb3/j1;", "Lz0/e;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class TextContextMenuGestureElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final q0 f14042b;

    public TextContextMenuGestureElement(q0 q0Var) {
        this.f14042b = q0Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new e(this.f14042b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof TextContextMenuGestureElement) {
            return this.f14042b == ((TextContextMenuGestureElement) obj).f14042b;
        }
        return false;
    }

    public final int hashCode() {
        return this.f14042b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "TextContextMenuGestures";
        q2Var.f19407c.b("onPreShowContextMenu", this.f14042b);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((e) modifier$Node).f97881a = this.f14042b;
    }
}
