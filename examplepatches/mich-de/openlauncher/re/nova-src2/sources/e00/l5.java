package e00;

import android.content.Context;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class l5 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.IntRef f50682t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.IntRef f50683u;

    /* renamed from: v, reason: collision with root package name */
    public int f50684v;

    /* renamed from: w, reason: collision with root package name */
    public int f50685w;

    /* renamed from: x, reason: collision with root package name */
    public int f50686x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f50687y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ Context f50688z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l5(Context context, Continuation continuation) {
        super(2, continuation);
        this.f50688z = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        l5 l5Var = new l5(this.f50688z, continuation);
        l5Var.f50687y = obj;
        return l5Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((l5) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x007f  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x005d -> B:13:0x0060). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        Ref.IntRef intRef;
        int i5;
        sx.i iVar;
        int i11;
        Ref.IntRef intRef2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = this.f50686x;
        if (i12 == 0) {
            ResultKt.b(obj);
            sx.i iVar2 = new sx.i(this.f50688z, (sx.a) this.f50687y, null, 12);
            Ref.IntRef intRef3 = new Ref.IntRef();
            intRef = new Ref.IntRef();
            i5 = 50;
            iVar = iVar2;
            i11 = 0;
            intRef2 = intRef3;
            if (i11 < i5) {
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i11 = this.f50685w;
            i5 = this.f50684v;
            intRef = this.f50683u;
            intRef2 = this.f50682t;
            iVar = (sx.i) this.f50687y;
            ResultKt.b(obj);
            int iOrdinal = ((sx.j) obj).f87792a.ordinal();
            if (iOrdinal == 0) {
                intRef.f71861a++;
            } else {
                if (iOrdinal != 1) {
                    throw new NoWhenBranchMatchedException();
                }
                intRef2.f71861a++;
            }
            i11++;
            if (i11 < i5) {
                sx.b bVar = sx.b.f87746a;
                this.f50687y = iVar;
                this.f50682t = intRef2;
                this.f50683u = intRef;
                this.f50684v = i5;
                this.f50685w = i11;
                this.f50686x = 1;
                obj = iVar.h("ca-app-pub-4858839354660716/1043145278", bVar, "US", this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
                int iOrdinal2 = ((sx.j) obj).f87792a.ordinal();
                if (iOrdinal2 == 0) {
                }
                i11++;
                if (i11 < i5) {
                    int i13 = intRef2.f71861a;
                    if (i13 <= 0) {
                        throw new IllegalStateException(h6.c1.n(intRef.f71861a, "GAM was never selected in 50 attempts (admob=", ", gam=", i13, ")").toString());
                    }
                    int i14 = intRef.f71861a;
                    if (i14 > 0) {
                        return new j6(true, h6.c1.n(i14, "admob=", ", gam=", i13, " out of 50 selections"));
                    }
                    throw new IllegalStateException(h6.c1.n(i14, "ADMOB was never selected in 50 attempts (admob=", ", gam=", i13, ")").toString());
                }
            }
        }
    }
}
