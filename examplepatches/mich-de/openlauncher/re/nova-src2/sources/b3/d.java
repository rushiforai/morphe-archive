package b3;

import androidx.compose.ui.node.BackwardsCompatNode;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class d extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f17174j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ BackwardsCompatNode f17175k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(BackwardsCompatNode backwardsCompatNode, int i5) {
        super(0);
        this.f17174j = i5;
        this.f17175k = backwardsCompatNode;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f17174j) {
            case 0:
                this.f17175k.updateModifierLocalConsumer();
                break;
            default:
                BackwardsCompatNode backwardsCompatNode = this.f17175k;
                b2.s element = backwardsCompatNode.getElement();
                Intrinsics.e(element, "null cannot be cast to non-null type androidx.compose.ui.modifier.ModifierLocalConsumer");
                ((a3.d) element).b(backwardsCompatNode);
                break;
        }
        return Unit.f71706a;
    }
}
