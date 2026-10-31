package t5;

import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class v extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f88711t;

    /* renamed from: u, reason: collision with root package name */
    public int f88712u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ boolean f88713v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ c0 f88714w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ int f88715x;

    /* renamed from: y, reason: collision with root package name */
    public Object f88716y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v(c0 c0Var, int i5, Continuation continuation, int i11) {
        super(2, continuation);
        this.f88711t = i11;
        this.f88714w = c0Var;
        this.f88715x = i5;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f88711t) {
            case 0:
                v vVar = new v(this.f88714w, this.f88715x, continuation, 0);
                vVar.f88713v = ((Boolean) obj).booleanValue();
                return vVar;
            default:
                v vVar2 = new v(this.f88714w, this.f88715x, continuation, 1);
                vVar2.f88713v = ((Boolean) obj).booleanValue();
                return vVar2;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f88711t;
        Boolean bool = (Boolean) obj;
        bool.booleanValue();
        Continuation continuation = (Continuation) obj2;
        switch (i5) {
        }
        return ((v) create(bool, continuation)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:24:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x005f  */
    /* JADX WARN: Type inference failed for: r1v0, types: [int] */
    /* JADX WARN: Type inference failed for: r1v10 */
    /* JADX WARN: Type inference failed for: r1v22 */
    /* JADX WARN: Type inference failed for: r1v23 */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        Throwable th2;
        int iIntValue;
        boolean z11;
        i1 i1Var;
        boolean z12;
        boolean z13;
        Object obj2;
        int iIntValue2;
        switch (this.f88711t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                boolean z14 = this.f88712u;
                c0 c0Var = this.f88714w;
                try {
                } catch (Throwable th3) {
                    if (z14 != 0) {
                        p0 p0VarG = c0Var.g();
                        this.f88716y = th3;
                        this.f88713v = z14;
                        this.f88712u = 2;
                        Object objD = p0VarG.d(this);
                        if (objD == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        z11 = z14;
                        th2 = th3;
                        obj = objD;
                    } else {
                        boolean z15 = z14;
                        th2 = th3;
                        iIntValue = this.f88715x;
                        z11 = z15;
                    }
                }
                if (z14 == 0) {
                    ResultKt.b(obj);
                    boolean z16 = this.f88713v;
                    this.f88713v = z16;
                    this.f88712u = 1;
                    obj = c0.f(c0Var, z16, this);
                    z14 = z16;
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (z14 != 1) {
                        if (z14 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        z11 = this.f88713v;
                        th2 = (Throwable) this.f88716y;
                        ResultKt.b(obj);
                        iIntValue = ((Number) obj).intValue();
                        z0 z0Var = new z0(iIntValue, th2);
                        z12 = z11;
                        i1Var = z0Var;
                        return new Pair(i1Var, Boolean.valueOf(z12));
                    }
                    boolean z17 = this.f88713v;
                    ResultKt.b(obj);
                    z14 = z17;
                }
                i1Var = (i1) obj;
                z12 = z14;
                return new Pair(i1Var, Boolean.valueOf(z12));
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i5 = this.f88712u;
                c0 c0Var2 = this.f88714w;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    z13 = this.f88713v;
                    this.f88713v = z13;
                    this.f88712u = 1;
                    obj = c0Var2.i(this);
                    if (obj == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i5 != 1) {
                        if (i5 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        obj2 = this.f88716y;
                        ResultKt.b(obj);
                        iIntValue2 = ((Number) obj).intValue();
                        return new c(obj2, obj2 != null ? obj2.hashCode() : 0, iIntValue2);
                    }
                    z13 = this.f88713v;
                    ResultKt.b(obj);
                }
                if (!z13) {
                    obj2 = obj;
                    iIntValue2 = this.f88715x;
                    return new c(obj2, obj2 != null ? obj2.hashCode() : 0, iIntValue2);
                }
                p0 p0VarG2 = c0Var2.g();
                this.f88716y = obj;
                this.f88712u = 2;
                Object objD2 = p0VarG2.d(this);
                if (objD2 == coroutineSingletons2) {
                    return coroutineSingletons2;
                }
                obj2 = obj;
                obj = objD2;
                iIntValue2 = ((Number) obj).intValue();
                return new c(obj2, obj2 != null ? obj2.hashCode() : 0, iIntValue2);
        }
    }
}
