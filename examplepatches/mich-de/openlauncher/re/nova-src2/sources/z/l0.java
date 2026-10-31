package z;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.sequences.SequenceScope;

/* loaded from: classes2.dex */
public final class l0 extends RestrictedSuspendLambda implements Function2 {
    public final /* synthetic */ m0 A;

    /* renamed from: t, reason: collision with root package name */
    public m0 f97787t;

    /* renamed from: u, reason: collision with root package name */
    public n0 f97788u;

    /* renamed from: v, reason: collision with root package name */
    public long[] f97789v;

    /* renamed from: w, reason: collision with root package name */
    public int f97790w;

    /* renamed from: x, reason: collision with root package name */
    public int f97791x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f97792y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ n0 f97793z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l0(n0 n0Var, m0 m0Var, Continuation continuation) {
        super(2, continuation);
        this.f97793z = n0Var;
        this.A = m0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        l0 l0Var = new l0(this.f97793z, this.A, continuation);
        l0Var.f97792y = obj;
        return l0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((l0) create((SequenceScope) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        SequenceScope sequenceScope;
        n0 n0Var;
        long[] jArr;
        int i5;
        m0 m0Var;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = this.f97791x;
        if (i11 == 0) {
            ResultKt.b(obj);
            sequenceScope = (SequenceScope) this.f97792y;
            n0Var = this.f97793z;
            k0 k0Var = n0Var.f97805b;
            jArr = k0Var.f97852c;
            i5 = k0Var.f97854e;
            m0Var = this.A;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = this.f97790w;
            jArr = this.f97789v;
            n0Var = this.f97788u;
            m0Var = this.f97787t;
            sequenceScope = (SequenceScope) this.f97792y;
            ResultKt.b(obj);
        }
        if (i5 == Integer.MAX_VALUE) {
            return Unit.f71706a;
        }
        int i12 = (int) ((jArr[i5] >> 31) & 2147483647L);
        m0Var.f97800b = i5;
        Object obj2 = n0Var.f97805b.f97851b[i5];
        this.f97792y = sequenceScope;
        this.f97787t = m0Var;
        this.f97788u = n0Var;
        this.f97789v = jArr;
        this.f97790w = i12;
        this.f97791x = 1;
        sequenceScope.c(obj2, this);
        return coroutineSingletons;
    }
}
