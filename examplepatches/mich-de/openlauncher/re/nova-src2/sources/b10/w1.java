package b10;

import com.amplitude.core.events.Plan;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class w1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ g2 f16952t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ m1 f16953u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ boolean f16954v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ String f16955w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ cy.g f16956x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w1(g2 g2Var, m1 m1Var, boolean z11, String str, cy.g gVar, Continuation continuation) {
        super(2, continuation);
        this.f16952t = g2Var;
        this.f16953u = m1Var;
        this.f16954v = z11;
        this.f16955w = str;
        this.f16956x = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new w1(this.f16952t, this.f16953u, this.f16954v, this.f16955w, this.f16956x, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((w1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        g2 g2Var = this.f16952t;
        cy.m0 m0Var = g2Var.f16693f;
        String str = m0Var.f48512a;
        b2 b2Var = this.f16953u.f16785a;
        zy.c cVar = zy.c.f98823a;
        Pair pair = new Pair(Plan.AMP_PLAN_SOURCE, this.f16955w);
        Pair pair2 = new Pair("position", b2Var.name());
        boolean z11 = false;
        cy.g gVar = this.f16956x;
        if (gVar != null && gVar.f48473e) {
            z11 = true;
        }
        zy.c.i("paywall_shown", MapsKt.j0(pair, pair2, new Pair("has_trial", Boolean.valueOf(z11)), new Pair("tier", m0Var.f48512a), new Pair("upsell_mode", Boolean.valueOf(g2Var.f16695h)), new Pair("ai_mode", Boolean.valueOf(this.f16954v))));
        return Unit.f71706a;
    }
}
