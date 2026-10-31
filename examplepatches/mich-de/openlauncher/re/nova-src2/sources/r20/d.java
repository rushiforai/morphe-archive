package r20;

import com.tiktok.util.TTConst;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function4;
import x80.v;

/* loaded from: classes4.dex */
public final class d extends SuspendLambda implements Function4 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f85348t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ v f85349u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(int i5, Continuation continuation, int i11) {
        super(i5, continuation);
        this.f85348t = i11;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        v vVar = (v) obj;
        Continuation continuation = (Continuation) obj4;
        switch (this.f85348t) {
            case 0:
                d dVar = new d(4, continuation, 0);
                dVar.f85349u = vVar;
                return dVar.invokeSuspend(Unit.f71706a);
            default:
                d dVar2 = new d(4, continuation, 1);
                dVar2.f85349u = vVar;
                return dVar2.invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f85348t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                v vVar = this.f85349u;
                vVar.g("period", "day");
                return vVar;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                v vVar2 = this.f85349u;
                vVar2.g(TTConst.TRACK_TYPE, "live");
                vVar2.g("first", "4");
                return vVar2;
        }
    }
}
