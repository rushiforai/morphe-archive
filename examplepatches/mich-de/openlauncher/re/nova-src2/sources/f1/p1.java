package f1;

import androidx.compose.ui.node.DelegatingNode;

/* loaded from: classes2.dex */
public final class p1 extends DelegatingNode implements b3.m, b3.z1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53844a;

    /* renamed from: b, reason: collision with root package name */
    public final i0.i f53845b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f53846c;

    /* renamed from: d, reason: collision with root package name */
    public final float f53847d;

    /* renamed from: e, reason: collision with root package name */
    public final i2.v f53848e;

    /* renamed from: f, reason: collision with root package name */
    public b3.n f53849f;

    public /* synthetic */ p1(i0.i iVar, boolean z11, float f11, i2.v vVar, int i5) {
        this.f53844a = i5;
        this.f53845b = iVar;
        this.f53846c = z11;
        this.f53847d = f11;
        this.f53848e = vVar;
    }

    @Override // b3.z1
    public final void k() {
        switch (this.f53844a) {
            case 0:
                b3.g.f(this, new n1(this, 0));
                break;
            default:
                b3.g.f(this, new l1.t1(this, 1));
                break;
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        switch (this.f53844a) {
            case 0:
                b3.g.f(this, new n1(this, 0));
                break;
            default:
                b3.g.f(this, new l1.t1(this, 1));
                break;
        }
    }
}
