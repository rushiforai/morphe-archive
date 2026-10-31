package androidx.compose.foundation.layout;

import a80.m;
import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import k0.n1;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.SourceDebugExtension;
import y3.f;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/PaddingElement;", "Lb3/j1;", "Lk0/n1;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
final class PaddingElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final float f13948b;

    /* renamed from: c, reason: collision with root package name */
    public final float f13949c;

    /* renamed from: d, reason: collision with root package name */
    public final float f13950d;

    /* renamed from: e, reason: collision with root package name */
    public final float f13951e;

    /* renamed from: f, reason: collision with root package name */
    public final Function1 f13952f;

    public PaddingElement(float f11, float f12, float f13, float f14, Function1 function1) {
        this.f13948b = f11;
        this.f13949c = f12;
        this.f13950d = f13;
        this.f13951e = f14;
        this.f13952f = function1;
        boolean z11 = true;
        boolean z12 = (f11 >= 0.0f || Float.isNaN(f11)) & (f12 >= 0.0f || Float.isNaN(f12)) & (f13 >= 0.0f || Float.isNaN(f13));
        if (f14 < 0.0f && !Float.isNaN(f14)) {
            z11 = false;
        }
        if (!z12 || !z11) {
            l0.a.a("Padding must be non-negative");
        }
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        n1 n1Var = new n1();
        n1Var.f70685a = this.f13948b;
        n1Var.f70686b = this.f13949c;
        n1Var.f70687c = this.f13950d;
        n1Var.f70688d = this.f13951e;
        n1Var.f70689e = true;
        return n1Var;
    }

    public final boolean equals(Object obj) {
        PaddingElement paddingElement = obj instanceof PaddingElement ? (PaddingElement) obj : null;
        return paddingElement != null && f.a(this.f13948b, paddingElement.f13948b) && f.a(this.f13949c, paddingElement.f13949c) && f.a(this.f13950d, paddingElement.f13950d) && f.a(this.f13951e, paddingElement.f13951e);
    }

    public final int hashCode() {
        return Boolean.hashCode(true) + m.d(this.f13951e, m.d(this.f13950d, m.d(this.f13949c, Float.hashCode(this.f13948b) * 31, 31), 31), 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        this.f13952f.invoke(q2Var);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        n1 n1Var = (n1) modifier$Node;
        n1Var.f70685a = this.f13948b;
        n1Var.f70686b = this.f13949c;
        n1Var.f70687c = this.f13950d;
        n1Var.f70688d = this.f13951e;
        n1Var.f70689e = true;
    }
}
