package m0;

import androidx.compose.ui.node.LayoutNode;
import g0.b2;
import z2.m1;

/* loaded from: classes.dex */
public final class z implements m1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75514a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2 f75515b;

    public /* synthetic */ z(b2 b2Var, int i5) {
        this.f75514a = i5;
        this.f75515b = b2Var;
    }

    @Override // z2.m1
    public final void c(LayoutNode layoutNode) {
        switch (this.f75514a) {
            case 0:
                ((b0) this.f75515b).f75403k = layoutNode;
                break;
            default:
                ((o0.z) this.f75515b).f78840h = layoutNode;
                break;
        }
    }
}
