package androidx.compose.ui.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import com.google.android.gms.internal.measurement.k2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import z2.z;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/layout/LayoutIdElement;", "Lb3/j1;", "Lz2/z;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final /* data */ class LayoutIdElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final Object f14157b;

    public LayoutIdElement(Object obj) {
        this.f14157b = obj;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        z zVar = new z();
        zVar.f98181a = this.f14157b;
        return zVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof LayoutIdElement) && Intrinsics.b(this.f14157b, ((LayoutIdElement) obj).f14157b);
    }

    public final int hashCode() {
        return this.f14157b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "layoutId";
        q2Var.f19406b = this.f14157b;
    }

    public final String toString() {
        return k2.j(new StringBuilder("LayoutIdElement(layoutId="), this.f14157b, ')');
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((z) modifier$Node).f98181a = this.f14157b;
    }
}
