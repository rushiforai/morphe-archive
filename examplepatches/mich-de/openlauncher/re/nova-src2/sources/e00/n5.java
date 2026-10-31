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
public final class n5 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.IntRef f50789t;

    /* renamed from: u, reason: collision with root package name */
    public int f50790u;

    /* renamed from: v, reason: collision with root package name */
    public int f50791v;

    /* renamed from: w, reason: collision with root package name */
    public int f50792w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f50793x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ Context f50794y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n5(Context context, Continuation continuation) {
        super(2, continuation);
        this.f50794y = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        n5 n5Var = new n5(this.f50794y, continuation);
        n5Var.f50793x = obj;
        return n5Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((n5) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
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
        int i12 = this.f50792w;
        if (i12 == 0) {
            ResultKt.b(obj);
            sx.a aVar = (sx.a) this.f50793x;
            for (int i13 = 0; i13 < 40; i13++) {
                aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t1", true, 15.0d);
            }
            for (int i14 = 0; i14 < 40; i14++) {
                aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t2", true, 5.0d);
            }
            for (int i15 = 0; i15 < 40; i15++) {
                aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t3", true, 2.0d);
            }
            sx.i iVar2 = new sx.i(this.f50794y, aVar, null, 12);
            intRef = new Ref.IntRef();
            i5 = 30;
            iVar = iVar2;
            i11 = 0;
            if (i11 < i5) {
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i11 = this.f50791v;
            i5 = this.f50790u;
            intRef = this.f50789t;
            iVar = (sx.i) this.f50793x;
            ResultKt.b(obj);
            if (Intrinsics.b(((sx.j) obj).f87793b, "t1")) {
                intRef.f71861a++;
            }
            i11++;
            if (i11 < i5) {
                sx.b bVar = sx.b.f87746a;
                this.f50793x = iVar;
                this.f50789t = intRef;
                this.f50790u = i5;
                this.f50791v = i11;
                this.f50792w = 1;
                obj = iVar.h("ca-app-pub-4858839354660716/1043145278", bVar, "US", this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
                if (Intrinsics.b(((sx.j) obj).f87793b, "t1")) {
                }
                i11++;
                if (i11 < i5) {
                    int i16 = intRef.f71861a;
                    if (i16 > 15) {
                        return new j6(true, b.c0.i(i16, "t1 selected ", "/30"));
                    }
                    throw new IllegalStateException(b.c0.i(i16, "t1 selected only ", "/30 times").toString());
                }
            }
        }
    }
}
