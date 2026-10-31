package androidx.compose.ui.semantics;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import j3.d;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/semantics/EmptySemanticsElement;", "Lb3/j1;", "Lj3/d;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final class EmptySemanticsElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final d f14175b;

    public EmptySemanticsElement(d dVar) {
        this.f14175b = dVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return this.f14175b;
    }

    public final boolean equals(Object obj) {
        return obj == this;
    }

    public final int hashCode() {
        return System.identityHashCode(this);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
    }

    @Override // b3.j1
    public final /* bridge */ /* synthetic */ void update(Modifier$Node modifier$Node) {
    }
}
