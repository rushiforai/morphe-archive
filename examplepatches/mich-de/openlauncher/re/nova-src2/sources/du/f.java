package du;

import com.stripe.android.core.networking.ApiRequest$Options;
import java.util.List;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import t70.j0;
import t70.t0;

/* loaded from: classes4.dex */
public final class f extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f49539t;

    /* renamed from: u, reason: collision with root package name */
    public int f49540u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f49541v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ i f49542w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ String f49543x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ ApiRequest$Options f49544y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ Ref.LongRef f49545z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(Ref.ObjectRef objectRef, i iVar, String str, ApiRequest$Options apiRequest$Options, Ref.LongRef longRef, Continuation continuation) {
        super(2, continuation);
        this.f49541v = objectRef;
        this.f49542w = iVar;
        this.f49543x = str;
        this.f49544y = apiRequest$Options;
        this.f49545z = longRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new f(this.f49541v, this.f49542w, this.f49543x, this.f49544y, this.f49545z, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((f) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x008d  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x0084 -> B:26:0x0085). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        Object objG;
        Ref.ObjectRef objectRef;
        Object objG2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f49540u;
        Ref.LongRef longRef = this.f49545z;
        ApiRequest$Options apiRequest$Options = this.f49544y;
        String str = this.f49543x;
        i iVar = this.f49542w;
        Ref.ObjectRef objectRef2 = this.f49541v;
        if (i5 == 0) {
            ResultKt.b(obj);
            List list = i.f49555f;
            this.f49539t = objectRef2;
            this.f49540u = 1;
            objG = iVar.g(str, apiRequest$Options, list, this);
            if (objG != coroutineSingletons) {
                objectRef = objectRef2;
            }
            return coroutineSingletons;
        }
        if (i5 == 1) {
            objectRef = this.f49539t;
            ResultKt.b(obj);
            objG = ((Result) obj).f71688a;
        } else {
            if (i5 == 2) {
                ResultKt.b(obj);
                longRef.f71862a = System.currentTimeMillis();
                List list2 = i.f49555f;
                this.f49539t = objectRef2;
                this.f49540u = 3;
                objG2 = iVar.g(str, apiRequest$Options, list2, this);
                if (objG2 != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Ref.ObjectRef objectRef3 = this.f49539t;
            ResultKt.b(obj);
            objG2 = ((Result) obj).f71688a;
            objectRef3.f71863a = new Result(objG2);
            if (i.h((Result) objectRef2.f71863a)) {
                long jCurrentTimeMillis = 1000 - (System.currentTimeMillis() - longRef.f71862a);
                this.f49539t = null;
                this.f49540u = 2;
                if (t0.b(jCurrentTimeMillis, this) != coroutineSingletons) {
                    longRef.f71862a = System.currentTimeMillis();
                    List list22 = i.f49555f;
                    this.f49539t = objectRef2;
                    this.f49540u = 3;
                    objG2 = iVar.g(str, apiRequest$Options, list22, this);
                    if (objG2 != coroutineSingletons) {
                        objectRef3 = objectRef2;
                        objectRef3.f71863a = new Result(objG2);
                        if (i.h((Result) objectRef2.f71863a)) {
                            return Unit.f71706a;
                        }
                    }
                }
                return coroutineSingletons;
            }
        }
        objectRef.f71863a = new Result(objG);
        if (i.h((Result) objectRef2.f71863a)) {
        }
    }
}
