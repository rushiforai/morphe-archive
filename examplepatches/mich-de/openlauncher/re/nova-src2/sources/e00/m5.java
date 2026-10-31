package e00;

import android.content.Context;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class m5 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.BooleanRef f50731t;

    /* renamed from: u, reason: collision with root package name */
    public int f50732u;

    /* renamed from: v, reason: collision with root package name */
    public int f50733v;

    /* renamed from: w, reason: collision with root package name */
    public int f50734w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f50735x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ Context f50736y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m5(Context context, Continuation continuation) {
        super(2, continuation);
        this.f50736y = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        m5 m5Var = new m5(this.f50736y, continuation);
        m5Var.f50735x = obj;
        return m5Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((m5) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0077  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x0068 -> B:17:0x006b). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        Ref.BooleanRef booleanRef;
        int i5;
        sx.i iVar;
        int i11;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = this.f50734w;
        if (i12 == 0) {
            ResultKt.b(obj);
            sx.a aVar = (sx.a) this.f50735x;
            for (int i13 = 0; i13 < 20; i13++) {
                aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t1", true, 5.0d);
            }
            sx.i iVar2 = new sx.i(this.f50736y, aVar, null, 12);
            booleanRef = new Ref.BooleanRef();
            i5 = 100;
            iVar = iVar2;
            i11 = 0;
            if (i11 < i5) {
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i11 = this.f50733v;
            i5 = this.f50732u;
            booleanRef = this.f50731t;
            iVar = (sx.i) this.f50735x;
            ResultKt.b(obj);
            if (((sx.j) obj).f87792a == sx.o.f87813d) {
                booleanRef.f71859a = true;
            }
            i11++;
            if (i11 < i5) {
                sx.b bVar = sx.b.f87746a;
                this.f50735x = iVar;
                this.f50731t = booleanRef;
                this.f50732u = i5;
                this.f50733v = i11;
                this.f50734w = 1;
                obj = iVar.h("ca-app-pub-4858839354660716/1043145278", bVar, "US", this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
                if (((sx.j) obj).f87792a == sx.o.f87813d) {
                }
                i11++;
                if (i11 < i5) {
                    if (booleanRef.f71859a) {
                        return new j6(true, "GAM was explored after ADMOB had 20 observations");
                    }
                    throw new IllegalStateException("GAM was never selected despite being available — starvation bug");
                }
            }
        }
    }
}
