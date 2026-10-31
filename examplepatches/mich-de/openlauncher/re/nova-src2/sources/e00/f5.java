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
public final class f5 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.IntRef f50371t;

    /* renamed from: u, reason: collision with root package name */
    public int f50372u;

    /* renamed from: v, reason: collision with root package name */
    public int f50373v;

    /* renamed from: w, reason: collision with root package name */
    public int f50374w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f50375x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ Context f50376y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f5(Context context, Continuation continuation) {
        super(2, continuation);
        this.f50376y = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        f5 f5Var = new f5(this.f50376y, continuation);
        f5Var.f50375x = obj;
        return f5Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((f5) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00b5  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x009f -> B:27:0x00a2). Please report as a decompilation issue!!! */
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
        int i12 = this.f50374w;
        if (i12 == 0) {
            ResultKt.b(obj);
            sx.a aVar = (sx.a) this.f50375x;
            for (int i13 = 0; i13 < 30; i13++) {
                aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t1", true, 10.0d);
            }
            for (int i14 = 0; i14 < 30; i14++) {
                aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t2", true, 10.0d);
            }
            for (int i15 = 0; i15 < 30; i15++) {
                aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t3", true, 10.0d);
            }
            for (int i16 = 0; i16 < 50; i16++) {
                aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t2", false, 0.0d);
            }
            sx.i iVar2 = new sx.i(this.f50376y, aVar, null, 12);
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
            i11 = this.f50373v;
            i5 = this.f50372u;
            intRef = this.f50371t;
            iVar = (sx.i) this.f50375x;
            ResultKt.b(obj);
            if (Intrinsics.b(((sx.j) obj).f87793b, "t2")) {
                intRef.f71861a++;
            }
            i11++;
            if (i11 < i5) {
                sx.b bVar = sx.b.f87746a;
                this.f50375x = iVar;
                this.f50371t = intRef;
                this.f50372u = i5;
                this.f50373v = i11;
                this.f50374w = 1;
                obj = iVar.h("ca-app-pub-4858839354660716/1043145278", bVar, "US", this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
                if (Intrinsics.b(((sx.j) obj).f87793b, "t2")) {
                }
                i11++;
                if (i11 < i5) {
                    int i17 = intRef.f71861a;
                    if (i17 < 25) {
                        return new j6(true, b.c0.i(i17, "t2=", "/50 (deprioritized)"));
                    }
                    throw new IllegalStateException(b.c0.i(i17, "t2 with 50 no-fills should be deprioritized, got ", "/50").toString());
                }
            }
        }
    }
}
