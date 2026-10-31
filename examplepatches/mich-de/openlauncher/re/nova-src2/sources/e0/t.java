package e0;

import androidx.compose.ui.node.DelegatingNode;
import b3.p2;

/* loaded from: classes.dex */
public final class t extends DelegatingNode implements p2 {

    /* renamed from: a, reason: collision with root package name */
    public p f50125a;

    /* renamed from: b, reason: collision with root package name */
    public float f50126b;

    /* renamed from: c, reason: collision with root package name */
    public i2.p f50127c;

    /* renamed from: d, reason: collision with root package name */
    public i2.v0 f50128d;

    /* renamed from: e, reason: collision with root package name */
    public final f2.b f50129e = (f2.b) delegate(new f2.b(new f2.c(), new b00.t(this, 10)));

    public t(float f11, i2.p pVar, i2.v0 v0Var) {
        this.f50126b = f11;
        this.f50127c = pVar;
        this.f50128d = v0Var;
    }

    @Override // b3.p2
    public final void applySemantics(j3.b0 b0Var) {
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // b3.p2
    public final boolean isImportantForBounds() {
        return false;
    }
}
