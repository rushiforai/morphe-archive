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
public final class o5 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Object f50848t;

    /* renamed from: u, reason: collision with root package name */
    public int f50849u;

    /* renamed from: v, reason: collision with root package name */
    public int f50850v;

    /* renamed from: w, reason: collision with root package name */
    public int f50851w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f50852x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ Context f50853y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o5(Context context, Continuation continuation) {
        super(2, continuation);
        this.f50853y = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        o5 o5Var = new o5(this.f50853y, continuation);
        o5Var.f50852x = obj;
        return o5Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((o5) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x00d2, code lost:
    
        if (r6 == r1) goto L25;
     */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00e3  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x00b0 -> B:20:0x00b1). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:24:0x00d2 -> B:26:0x00d5). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        sx.a aVar;
        int i5;
        sx.i iVar;
        int i11;
        Ref.BooleanRef booleanRef;
        int i12;
        sx.i iVar2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = this.f50851w;
        int i14 = 0;
        if (i13 == 0) {
            ResultKt.b(obj);
            sx.a aVar2 = (sx.a) this.f50852x;
            for (int i15 = 0; i15 < 10; i15++) {
                sx.o oVar = sx.o.f87812c;
                aVar2.f("ca-app-pub-4858839354660716/1043145278", oVar, "t1", true, 10.0d);
                aVar2.f("ca-app-pub-4858839354660716/1043145278", oVar, "t3", true, 5.0d);
            }
            sx.i iVar3 = new sx.i(this.f50853y, aVar2, null, 12);
            aVar = aVar2;
            i5 = 20;
            iVar = iVar3;
            i11 = 0;
            if (i11 < i5) {
            }
        } else if (i13 == 1) {
            i11 = this.f50850v;
            i5 = this.f50849u;
            sx.i iVar4 = (sx.i) this.f50848t;
            sx.a aVar3 = (sx.a) this.f50852x;
            ResultKt.b(obj);
            iVar = iVar4;
            aVar = aVar3;
            i11++;
            if (i11 < i5) {
                sx.o oVar2 = sx.o.f87812c;
                sx.i iVar5 = iVar;
                aVar.f("ca-app-pub-4858839354660716/1043145278", oVar2, "t2", false, 0.0d);
                sx.j jVar = new sx.j(oVar2, "t2", "test", new sx.q(sx.b.f87746a, "ca-app-pub-4858839354660716/1043145278"));
                this.f50852x = aVar;
                this.f50848t = iVar5;
                this.f50849u = i5;
                this.f50850v = i11;
                this.f50851w = 1;
                if (iVar5.f(jVar, false, null, this) != coroutineSingletons) {
                    iVar = iVar5;
                    i11++;
                    if (i11 < i5) {
                        booleanRef = new Ref.BooleanRef();
                        i12 = 30;
                        iVar2 = iVar;
                        if (i14 < i12) {
                        }
                    }
                }
                return coroutineSingletons;
            }
        } else {
            if (i13 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            int i16 = this.f50850v;
            i12 = this.f50849u;
            Ref.BooleanRef booleanRef2 = (Ref.BooleanRef) this.f50848t;
            iVar2 = (sx.i) this.f50852x;
            ResultKt.b(obj);
            i14 = i16;
            booleanRef = booleanRef2;
            Object objH = obj;
            if (Intrinsics.b(((sx.j) objH).f87793b, "t2")) {
                booleanRef.f71859a = true;
            }
            i14++;
            if (i14 < i12) {
                if (booleanRef.f71859a) {
                    throw new IllegalStateException("t2 was selected despite being dropped");
                }
                return new j6(true, "t2 correctly dropped");
            }
            sx.b bVar = sx.b.f87746a;
            this.f50852x = iVar2;
            this.f50848t = booleanRef;
            this.f50849u = i12;
            this.f50850v = i14;
            this.f50851w = 2;
            objH = iVar2.h("ca-app-pub-4858839354660716/1043145278", bVar, "US", this);
        }
    }
}
