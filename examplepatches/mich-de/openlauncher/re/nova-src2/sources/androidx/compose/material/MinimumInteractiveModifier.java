package androidx.compose.material;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import f1.p2;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Landroidx/compose/material/MinimumInteractiveModifier;", "Lb3/j1;", "Lf1/p2;", "<init>", "()V", "material"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class MinimumInteractiveModifier extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public static final MinimumInteractiveModifier f14082b = new MinimumInteractiveModifier();

    private MinimumInteractiveModifier() {
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new p2();
    }

    public final boolean equals(Object obj) {
        return obj == this;
    }

    public final int hashCode() {
        return System.identityHashCode(this);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "minimumInteractiveComponentSize";
        q2Var.f19407c.b("README", "Reserves at least 48.dp in size to disambiguate touch interactions if the element would measure smaller");
    }

    @Override // b3.j1
    public final /* bridge */ /* synthetic */ void update(Modifier$Node modifier$Node) {
    }
}
