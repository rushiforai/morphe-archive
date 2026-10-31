package b0;

import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.Owner;
import androidx.compose.ui.platform.AndroidComposeView;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import p1.y2;

/* loaded from: classes.dex */
public final class v0 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16256j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f16257k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f16258l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Object f16259m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v0(int i5, Object obj, Object obj2, Object obj3) {
        super(1);
        this.f16256j = i5;
        this.f16257k = obj;
        this.f16258l = obj2;
        this.f16259m = obj3;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f16256j) {
            case 0:
                i2.a0 a0Var = (i2.a0) obj;
                y2 y2Var = (y2) this.f16258l;
                y2 y2Var2 = (y2) this.f16257k;
                i2.s0 s0Var = (i2.s0) a0Var;
                s0Var.a(y2Var2 != null ? ((Number) y2Var2.getValue()).floatValue() : 1.0f);
                s0Var.i(y2Var != null ? ((Number) y2Var.getValue()).floatValue() : 1.0f);
                s0Var.j(y2Var != null ? ((Number) y2Var.getValue()).floatValue() : 1.0f);
                y2 y2Var3 = (y2) this.f16259m;
                s0Var.o(y2Var3 != null ? ((i2.y0) y2Var3.getValue()).f61193a : i2.y0.f61191b);
                break;
            default:
                b4.m mVar = (b4.m) this.f16257k;
                LayoutNode layoutNode = (LayoutNode) this.f16258l;
                b4.m mVar2 = (b4.m) this.f16259m;
                Canvas canvas = ((k2.f) obj).getDrawContext().getCanvas();
                if (mVar.f17482b.getVisibility() != 8) {
                    mVar.f17502x = true;
                    Owner owner = layoutNode.getOwner();
                    AndroidComposeView androidComposeView = owner instanceof AndroidComposeView ? (AndroidComposeView) owner : null;
                    if (androidComposeView != null) {
                        androidComposeView.drawAndroidView(mVar2, i2.c.a(canvas));
                    }
                    mVar.f17502x = false;
                }
                break;
        }
        return Unit.f71706a;
    }
}
