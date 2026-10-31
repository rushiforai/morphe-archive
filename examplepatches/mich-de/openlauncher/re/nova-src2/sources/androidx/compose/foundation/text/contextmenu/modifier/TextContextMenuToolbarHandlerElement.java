package androidx.compose.foundation.text.contextmenu.modifier;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import e1.p0;
import e1.q0;
import e1.r0;
import kotlin.Metadata;
import y90.f;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/text/contextmenu/modifier/TextContextMenuToolbarHandlerElement;", "Lb3/j1;", "Lz0/f;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class TextContextMenuToolbarHandlerElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final f f14043b;

    /* renamed from: c, reason: collision with root package name */
    public final q0 f14044c;

    /* renamed from: d, reason: collision with root package name */
    public final r0 f14045d;

    /* renamed from: e, reason: collision with root package name */
    public final p0 f14046e;

    public TextContextMenuToolbarHandlerElement(f fVar, q0 q0Var, r0 r0Var, p0 p0Var) {
        this.f14043b = fVar;
        this.f14044c = q0Var;
        this.f14045d = r0Var;
        this.f14046e = p0Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new z0.f(this.f14043b, this.f14044c, this.f14045d, this.f14046e);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof TextContextMenuToolbarHandlerElement)) {
            return false;
        }
        TextContextMenuToolbarHandlerElement textContextMenuToolbarHandlerElement = (TextContextMenuToolbarHandlerElement) obj;
        return this.f14043b == textContextMenuToolbarHandlerElement.f14043b && this.f14044c == textContextMenuToolbarHandlerElement.f14044c && this.f14045d == textContextMenuToolbarHandlerElement.f14045d && this.f14046e == textContextMenuToolbarHandlerElement.f14046e;
    }

    public final int hashCode() {
        return this.f14046e.hashCode() + ((this.f14045d.hashCode() + ((this.f14044c.hashCode() + (this.f14043b.hashCode() * 31)) * 31)) * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        z0.f fVar = (z0.f) modifier$Node;
        fVar.f97883a.f97028a = null;
        f fVar2 = this.f14043b;
        fVar.f97883a = fVar2;
        fVar2.f97028a = fVar;
        fVar.f97884b = this.f14044c;
        fVar.f97885c = this.f14045d;
        fVar.f97886d = this.f14046e;
    }
}
