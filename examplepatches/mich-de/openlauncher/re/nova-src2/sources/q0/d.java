package q0;

import b3.b1;
import b3.t1;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class d extends FunctionReferenceImpl implements Function0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e f83315d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ t1 f83316e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ b1 f83317f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, t1 t1Var, b1 b1Var) {
        super(0, Intrinsics.Kotlin.class, "localRect", "bringIntoView$localRect(Landroidx/compose/foundation/relocation/BringIntoViewResponderNode;Landroidx/compose/ui/layout/LayoutCoordinates;Lkotlin/jvm/functions/Function0;)Landroidx/compose/ui/geometry/Rect;", 0);
        this.f83315d = eVar;
        this.f83316e = t1Var;
        this.f83317f = b1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return e.B(this.f83315d, this.f83316e, this.f83317f);
    }
}
