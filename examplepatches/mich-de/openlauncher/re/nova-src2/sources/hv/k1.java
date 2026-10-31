package hv;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class k1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f60362t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ boolean f60363u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ m0.b0 f60364v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ int f60365w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k1(boolean z11, m0.b0 b0Var, int i5, Continuation continuation) {
        super(2, continuation);
        this.f60363u = z11;
        this.f60364v = b0Var;
        this.f60365w = i5;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new k1(this.f60363u, this.f60364v, this.f60365w, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((k1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x002a, code lost:
    
        if (m0.b0.j(r4, r1, r5) == r0) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0036, code lost:
    
        if (r4.f(r1, 0, r5) == r0) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0038, code lost:
    
        return r0;
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f60362t;
        if (i5 == 0) {
            ResultKt.b(obj);
            boolean z11 = this.f60363u;
            int i11 = this.f60365w;
            m0.b0 b0Var = this.f60364v;
            if (z11) {
                this.f60362t = 1;
            } else {
                this.f60362t = 2;
                ab.c0 c0Var = m0.b0.f75392x;
            }
        } else {
            if (i5 != 1 && i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
