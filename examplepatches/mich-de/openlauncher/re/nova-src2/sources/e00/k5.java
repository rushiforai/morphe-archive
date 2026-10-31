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
public final class k5 extends SuspendLambda implements Function2 {
    public final /* synthetic */ Context A;

    /* renamed from: t, reason: collision with root package name */
    public Object f50620t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.BooleanRef f50621u;

    /* renamed from: v, reason: collision with root package name */
    public sx.j f50622v;

    /* renamed from: w, reason: collision with root package name */
    public int f50623w;

    /* renamed from: x, reason: collision with root package name */
    public int f50624x;

    /* renamed from: y, reason: collision with root package name */
    public int f50625y;

    /* renamed from: z, reason: collision with root package name */
    public /* synthetic */ Object f50626z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k5(Context context, Continuation continuation) {
        super(2, continuation);
        this.A = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        k5 k5Var = new k5(this.A, continuation);
        k5Var.f50626z = obj;
        return k5Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((k5) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x013a, code lost:
    
        if (r4 != r1) goto L8;
     */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0104  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x015f  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x00ba -> B:19:0x00bc). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x013a -> B:8:0x0032). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        int i5;
        sx.i iVar;
        sx.a aVar;
        int i11;
        Ref.BooleanRef booleanRef;
        Ref.BooleanRef booleanRef2;
        int i12;
        sx.i iVar2;
        sx.i iVar3;
        Ref.BooleanRef booleanRef3;
        int i13;
        Object objH;
        int i14;
        sx.j jVar;
        Object objH2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i15 = this.f50625y;
        sx.j jVar2 = null;
        int i16 = 0;
        if (i15 == 0) {
            ResultKt.b(obj);
            sx.a aVar2 = (sx.a) this.f50626z;
            i5 = 20;
            iVar = new sx.i(this.A, aVar2, null, 12);
            aVar = aVar2;
            i11 = 0;
            if (i11 < i5) {
            }
        } else if (i15 == 1) {
            i11 = this.f50624x;
            int i17 = this.f50623w;
            sx.i iVar4 = (sx.i) this.f50620t;
            sx.a aVar3 = (sx.a) this.f50626z;
            ResultKt.b(obj);
            i5 = i17;
            aVar = aVar3;
            iVar = iVar4;
            i11++;
            if (i11 < i5) {
                sx.i iVar5 = iVar;
                sx.o oVar = sx.o.f87812c;
                int i18 = i5;
                aVar.f("ca-app-pub-4858839354660716/1043145278", oVar, "t2", false, 0.0d);
                sx.j jVar3 = new sx.j(oVar, "t2", "test", new sx.q(sx.b.f87746a, "ca-app-pub-4858839354660716/1043145278"));
                this.f50626z = aVar;
                this.f50620t = iVar5;
                this.f50623w = i18;
                this.f50624x = i11;
                this.f50625y = 1;
                if (iVar5.f(jVar3, false, null, this) != coroutineSingletons) {
                    iVar = iVar5;
                    i5 = i18;
                    i11++;
                    if (i11 < i5) {
                        sx.i iVar6 = iVar;
                        for (int i19 = 0; i19 < 10; i19++) {
                            sx.o oVar2 = sx.o.f87812c;
                            aVar.f("ca-app-pub-4858839354660716/5914434907", oVar2, "t1", true, 10.0d);
                            aVar.f("ca-app-pub-4858839354660716/5914434907", oVar2, "t2", true, 10.0d);
                            aVar.f("ca-app-pub-4858839354660716/5914434907", oVar2, "t3", true, 10.0d);
                        }
                        for (int i21 = 0; i21 < 10; i21++) {
                            aVar.f("ca-app-pub-4858839354660716/5914434907", sx.o.f87813d, "t1", true, 10.0d);
                        }
                        booleanRef = new Ref.BooleanRef();
                        booleanRef2 = new Ref.BooleanRef();
                        i12 = 50;
                        iVar2 = iVar6;
                        if (i16 < i12) {
                        }
                    }
                }
                return coroutineSingletons;
            }
        } else {
            if (i15 != 2) {
                if (i15 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                i14 = this.f50624x;
                i13 = this.f50623w;
                jVar = this.f50622v;
                Ref.BooleanRef booleanRef4 = this.f50621u;
                booleanRef3 = (Ref.BooleanRef) this.f50620t;
                iVar3 = (sx.i) this.f50626z;
                ResultKt.b(obj);
                booleanRef2 = booleanRef4;
                objH2 = obj;
                int i22 = i14;
                booleanRef = booleanRef3;
                iVar2 = iVar3;
                sx.j jVar4 = (sx.j) objH2;
                if (jVar.f87792a == sx.o.f87812c && Intrinsics.b(jVar.f87793b, "t2")) {
                    booleanRef.f71859a = true;
                }
                if (Intrinsics.b(jVar4.f87793b, "t2")) {
                    booleanRef2.f71859a = true;
                }
                i12 = i13;
                i16 = i22 + 1;
                jVar2 = null;
                if (i16 < i12) {
                    if (booleanRef.f71859a) {
                        throw new IllegalStateException("t2 should be dropped for DRAWER_BASE");
                    }
                    if (booleanRef2.f71859a) {
                        return new j6(true, "drawer t2 dropped, left_swipe t2 available");
                    }
                    throw new IllegalStateException("t2 should NOT be dropped for LEFT_SWIPE_BASE");
                }
                sx.b bVar = sx.b.f87746a;
                this.f50626z = iVar2;
                this.f50620t = booleanRef;
                this.f50621u = booleanRef2;
                this.f50622v = jVar2;
                this.f50623w = i12;
                this.f50624x = i16;
                this.f50625y = 2;
                objH = iVar2.h("ca-app-pub-4858839354660716/1043145278", bVar, "US", this);
                if (objH != coroutineSingletons) {
                    iVar3 = iVar2;
                    booleanRef3 = booleanRef;
                    i14 = i16;
                    i13 = i12;
                    jVar = (sx.j) objH;
                    sx.b bVar2 = sx.b.f87746a;
                    this.f50626z = iVar3;
                    this.f50620t = booleanRef3;
                    this.f50621u = booleanRef2;
                    this.f50622v = jVar;
                    this.f50623w = i13;
                    this.f50624x = i14;
                    this.f50625y = 3;
                    objH2 = iVar3.h("ca-app-pub-4858839354660716/5914434907", bVar2, "US", this);
                }
                return coroutineSingletons;
            }
            i14 = this.f50624x;
            i13 = this.f50623w;
            Ref.BooleanRef booleanRef5 = this.f50621u;
            Ref.BooleanRef booleanRef6 = (Ref.BooleanRef) this.f50620t;
            sx.i iVar7 = (sx.i) this.f50626z;
            ResultKt.b(obj);
            objH = obj;
            iVar3 = iVar7;
            booleanRef3 = booleanRef6;
            booleanRef2 = booleanRef5;
            jVar = (sx.j) objH;
            sx.b bVar22 = sx.b.f87746a;
            this.f50626z = iVar3;
            this.f50620t = booleanRef3;
            this.f50621u = booleanRef2;
            this.f50622v = jVar;
            this.f50623w = i13;
            this.f50624x = i14;
            this.f50625y = 3;
            objH2 = iVar3.h("ca-app-pub-4858839354660716/5914434907", bVar22, "US", this);
        }
    }
}
