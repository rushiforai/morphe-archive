package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier$Node;
import b.c9;
import b3.j1;
import c3.q2;
import k0.g0;
import k0.l2;
import kotlin.Metadata;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/WrapContentElement;", "Lb3/j1;", "Lk0/l2;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class WrapContentElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final g0 f13964b;

    /* renamed from: c, reason: collision with root package name */
    public final Function2 f13965c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f13966d;

    /* renamed from: e, reason: collision with root package name */
    public final String f13967e;

    public WrapContentElement(g0 g0Var, Function2 function2, Object obj, String str) {
        this.f13964b = g0Var;
        this.f13965c = function2;
        this.f13966d = obj;
        this.f13967e = str;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        l2 l2Var = new l2();
        l2Var.f70673a = this.f13964b;
        l2Var.f70674b = this.f13965c;
        return l2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || WrapContentElement.class != obj.getClass()) {
            return false;
        }
        WrapContentElement wrapContentElement = (WrapContentElement) obj;
        return this.f13964b == wrapContentElement.f13964b && Intrinsics.b(this.f13966d, wrapContentElement.f13966d);
    }

    public final int hashCode() {
        return this.f13966d.hashCode() + c9.f(this.f13964b.hashCode() * 31, 31, false);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d(this.f13967e);
        q2Var.b().b("align", this.f13966d);
        q2Var.b().b("unbounded", Boolean.FALSE);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        l2 l2Var = (l2) modifier$Node;
        l2Var.f70673a = this.f13964b;
        l2Var.f70674b = this.f13965c;
    }
}
