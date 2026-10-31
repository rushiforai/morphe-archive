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
public final class i5 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Object f50515t;

    /* renamed from: u, reason: collision with root package name */
    public sx.j f50516u;

    /* renamed from: v, reason: collision with root package name */
    public int f50517v;

    /* renamed from: w, reason: collision with root package name */
    public int f50518w;

    /* renamed from: x, reason: collision with root package name */
    public int f50519x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f50520y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ Context f50521z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i5(Context context, Continuation continuation) {
        super(2, continuation);
        this.f50521z = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        i5 i5Var = new i5(this.f50521z, continuation);
        i5Var.f50520y = obj;
        return i5Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((i5) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x00be, code lost:
    
        if (r14.f(r13, false, null, r24) == r1) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00f3, code lost:
    
        if (r13.f(r12, true, r8, r24) == r1) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0132, code lost:
    
        if (r2 == r1) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0134, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:21:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0143  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x00be -> B:24:0x00c2). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:28:0x00f3 -> B:30:0x00f6). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x0132 -> B:39:0x0135). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        int i5;
        sx.j jVar;
        sx.i iVar;
        int i11;
        sx.a aVar;
        int i12;
        int i13;
        sx.j jVar2;
        int i14;
        sx.i iVar2;
        sx.a aVar2;
        Ref.BooleanRef booleanRef;
        int i15;
        sx.i iVar3;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i16 = this.f50519x;
        int i17 = 0;
        if (i16 == 0) {
            ResultKt.b(obj);
            sx.a aVar3 = (sx.a) this.f50520y;
            int i18 = 0;
            while (true) {
                if (i18 >= 10) {
                    break;
                }
                aVar3.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t2", true, 8.0d);
                i18++;
            }
            int i19 = 0;
            for (i5 = 10; i19 < i5; i5 = i5) {
                aVar3.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87813d, "t1", true, 10.0d);
                i19++;
            }
            sx.i iVar4 = new sx.i(this.f50521z, aVar3, null, 12);
            jVar = new sx.j(sx.o.f87812c, "t2", "test", new sx.q(sx.b.f87746a, "ca-app-pub-4858839354660716/1043145278"));
            iVar = iVar4;
            i11 = 0;
            aVar = aVar3;
            i12 = 20;
            if (i11 >= i12) {
            }
        } else if (i16 == 1) {
            i11 = this.f50518w;
            i12 = this.f50517v;
            jVar = this.f50516u;
            iVar = (sx.i) this.f50515t;
            aVar = (sx.a) this.f50520y;
            ResultKt.b(obj);
            i11++;
            if (i11 >= i12) {
                this.f50520y = aVar;
                this.f50515t = iVar;
                this.f50516u = jVar;
                this.f50517v = i12;
                this.f50518w = i11;
                this.f50519x = 1;
            } else {
                i13 = 110;
                jVar2 = new sx.j(sx.o.f87812c, "t1", "test", new sx.q(sx.b.f87746a, "ca-app-pub-4858839354660716/1043145278"));
                i14 = 0;
                iVar2 = iVar;
                aVar2 = aVar;
                if (i14 >= i13) {
                }
            }
        } else if (i16 == 2) {
            i14 = this.f50518w;
            i13 = this.f50517v;
            jVar2 = this.f50516u;
            iVar2 = (sx.i) this.f50515t;
            aVar2 = (sx.a) this.f50520y;
            ResultKt.b(obj);
            i14++;
            if (i14 >= i13) {
                Double d5 = new Double(10.0d);
                this.f50520y = aVar2;
                this.f50515t = iVar2;
                this.f50516u = jVar2;
                this.f50517v = i13;
                this.f50518w = i14;
                this.f50519x = 2;
            } else {
                for (int i21 = 0; i21 < 20; i21++) {
                    aVar2.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t2", true, 12.0d);
                }
                booleanRef = new Ref.BooleanRef();
                i15 = 200;
                iVar3 = iVar2;
                if (i17 < i15) {
                }
            }
        } else {
            if (i16 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            int i22 = this.f50518w;
            i15 = this.f50517v;
            booleanRef = (Ref.BooleanRef) this.f50515t;
            iVar3 = (sx.i) this.f50520y;
            ResultKt.b(obj);
            i17 = i22;
            Object objH = obj;
            if (Intrinsics.b(((sx.j) objH).f87793b, "t2")) {
                booleanRef.f71859a = true;
            }
            i17++;
            if (i17 < i15) {
                if (booleanRef.f71859a) {
                    return new j6(true, "t2 recovered and selectable");
                }
                throw new IllegalStateException("t2 should be recovered and selectable");
            }
            sx.b bVar = sx.b.f87746a;
            this.f50520y = iVar3;
            this.f50515t = booleanRef;
            this.f50516u = null;
            this.f50517v = i15;
            this.f50518w = i17;
            this.f50519x = 3;
            objH = iVar3.h("ca-app-pub-4858839354660716/1043145278", bVar, "US", this);
        }
    }
}
