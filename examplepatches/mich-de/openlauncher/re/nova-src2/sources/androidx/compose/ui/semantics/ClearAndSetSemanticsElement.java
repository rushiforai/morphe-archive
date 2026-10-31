package androidx.compose.ui.semantics;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import j3.c;
import j3.k;
import j3.m;
import j3.n;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u0003¨\u0006\u0004"}, d2 = {"Landroidx/compose/ui/semantics/ClearAndSetSemanticsElement;", "Lb3/j1;", "Lj3/c;", "Lj3/m;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ClearAndSetSemanticsElement extends j1 implements m {

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f14174b;

    public ClearAndSetSemanticsElement(Function1 function1) {
        this.f14174b = function1;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new c(this.f14174b, false, true);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ClearAndSetSemanticsElement) {
            return this.f14174b == ((ClearAndSetSemanticsElement) obj).f14174b;
        }
        return false;
    }

    @Override // j3.m
    public final k getSemanticsConfiguration() {
        k kVar = new k();
        kVar.f68814c = false;
        kVar.f68815d = true;
        this.f14174b.invoke(kVar);
        return kVar;
    }

    public final int hashCode() {
        return this.f14174b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "clearAndSetSemantics";
        n.a(q2Var, getSemanticsConfiguration());
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((c) modifier$Node).f68773c = this.f14174b;
    }
}
