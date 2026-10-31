package p10;

import b.u4;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class q extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f81872t;

    /* renamed from: u, reason: collision with root package name */
    public int f81873u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ s f81874v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ long f81875w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ String f81876x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(s sVar, long j11, String str, Continuation continuation) {
        super(2, continuation);
        this.f81874v = sVar;
        this.f81875w = j11;
        this.f81876x = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new q(this.f81874v, this.f81875w, this.f81876x, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((q) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Ref.ObjectRef objectRef;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f81873u;
        if (i5 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            s sVar = this.f81874v;
            t5.g gVar = sVar.f81895a;
            p pVar = new p(this.f81875w, objectRefL, sVar, this.f81876x, null);
            this.f81872t = objectRefL;
            this.f81873u = 1;
            if (vm.d.e(gVar, pVar, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = this.f81872t;
            ResultKt.b(obj);
        }
        Object obj2 = objectRef.f71863a;
        Intrinsics.d(obj2);
        return obj2;
    }
}
