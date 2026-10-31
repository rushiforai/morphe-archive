package e00;

import android.content.Context;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class c5 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.IntRef f50257t;

    /* renamed from: u, reason: collision with root package name */
    public int f50258u;

    /* renamed from: v, reason: collision with root package name */
    public int f50259v;

    /* renamed from: w, reason: collision with root package name */
    public int f50260w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f50261x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ Context f50262y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c5(Context context, Continuation continuation) {
        super(2, continuation);
        this.f50262y = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        c5 c5Var = new c5(this.f50262y, continuation);
        c5Var.f50261x = obj;
        return c5Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((c5) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00a3  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x008d -> B:23:0x0090). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        Ref.IntRef intRef;
        int i5;
        sx.i iVar;
        int i11;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = this.f50260w;
        if (i12 == 0) {
            ResultKt.b(obj);
            sx.a aVar = (sx.a) this.f50261x;
            for (int i13 = 0; i13 < 100; i13++) {
                aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t1", true, 20.0d);
            }
            for (int i14 = 0; i14 < 100; i14++) {
                aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t2", true, 5.0d);
            }
            for (int i15 = 0; i15 < 100; i15++) {
                aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t3", true, 1.0d);
            }
            sx.i iVar2 = new sx.i(this.f50262y, aVar, null, 12);
            intRef = new Ref.IntRef();
            i5 = 50;
            iVar = iVar2;
            i11 = 0;
            if (i11 < i5) {
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i11 = this.f50259v;
            i5 = this.f50258u;
            intRef = this.f50257t;
            iVar = (sx.i) this.f50261x;
            ResultKt.b(obj);
            if (Intrinsics.b(((sx.j) obj).f87793b, "t1")) {
                intRef.f71861a++;
            }
            i11++;
            if (i11 < i5) {
                sx.b bVar = sx.b.f87746a;
                this.f50261x = iVar;
                this.f50257t = intRef;
                this.f50258u = i5;
                this.f50259v = i11;
                this.f50260w = 1;
                obj = iVar.h("ca-app-pub-4858839354660716/1043145278", bVar, "US", this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
                if (Intrinsics.b(((sx.j) obj).f87793b, "t1")) {
                }
                i11++;
                if (i11 < i5) {
                    int i16 = intRef.f71861a;
                    if (i16 > 30) {
                        return new j6(true, b.c0.i(i16, "t1=", "/50"));
                    }
                    throw new IllegalStateException(b.c0.i(i16, "t1 should dominate after 300 obs, got ", "/50").toString());
                }
            }
        }
    }
}
