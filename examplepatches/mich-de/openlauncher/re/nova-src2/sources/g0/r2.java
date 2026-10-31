package g0;

import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class r2 extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f56677t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56678u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ v2.n f56679v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f56680w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r2(v2.n nVar, Ref.ObjectRef objectRef, Continuation continuation) {
        super(2, continuation);
        this.f56679v = nVar;
        this.f56680w = objectRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        r2 r2Var = new r2(this.f56679v, this.f56680w, continuation);
        r2Var.f56678u = obj;
        return r2Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((r2) create((v2.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x005e, code lost:
    
        if (r7.f91977c != 2) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0060, code lost:
    
        r4.f71863a = g0.t0.f56702a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0066, code lost:
    
        r7 = r8.size();
        r9 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x006e, code lost:
    
        if (r9 >= r7) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0070, code lost:
    
        r10 = (v2.t) r8.get(r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x007a, code lost:
    
        if (r10.l() != false) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x007c, code lost:
    
        r11 = (v2.j0) r1;
        r15 = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x008c, code lost:
    
        if (v2.g0.i(r10, r11.f91952f.f91974j, r11.j()) == false) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x008f, code lost:
    
        r9 = r9 + 1;
        r7 = r15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0094, code lost:
    
        r4.f71863a = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0097, code lost:
    
        r6 = v2.n.f91982c;
        r14.f56678u = r1;
        r14.f56677t = 2;
        r1 = (v2.j0) r1;
        r6 = r1.f(r6, r14);
        r1 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00a3, code lost:
    
        if (r6 != r0) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00c0, code lost:
    
        r4.f71863a = r2;
     */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0042 A[PHI: r1 r7
      0x0042: PHI (r1v3 v2.b) = (r1v19 v2.b), (r1v20 v2.b) binds: [B:12:0x003f, B:9:0x0023] A[DONT_GENERATE, DONT_INLINE]
      0x0042: PHI (r7v0 java.lang.Object) = (r7v9 java.lang.Object), (r7v13 java.lang.Object) binds: [B:12:0x003f, B:9:0x0023] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00cd A[SYNTHETIC] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x00a3 -> B:33:0x00a6). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        Object objF;
        v2.b bVar;
        int size;
        int i5;
        v2.b bVar2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = this.f56677t;
        r0 r0Var = r0.f56676a;
        Ref.ObjectRef objectRef = this.f56680w;
        int i12 = 1;
        if (i11 == 0) {
            ResultKt.b(obj);
            bVar2 = (v2.b) this.f56678u;
            this.f56678u = bVar2;
            this.f56677t = i12;
            v2.j0 j0Var = (v2.j0) bVar2;
            objF = j0Var.f(this.f56679v, this);
            bVar = j0Var;
            if (objF != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            v2.b bVar3 = (v2.b) this.f56678u;
            ResultKt.b(obj);
            objF = obj;
            bVar = bVar3;
            v2.m mVar = (v2.m) objF;
            List list = mVar.f91975a;
            size = list.size();
            i5 = 0;
            while (true) {
                if (i5 >= size) {
                }
                i5++;
            }
            return Unit.f71706a;
        }
        if (i11 != 2) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        v2.b bVar4 = (v2.b) this.f56678u;
        ResultKt.b(obj);
        Object objF2 = obj;
        v2.b bVar5 = bVar4;
        List list2 = ((v2.m) objF2).f91975a;
        int size2 = list2.size();
        for (int i13 = 0; i13 < size2; i13++) {
            if (((v2.t) list2.get(i13)).l()) {
                break;
            }
        }
        i12 = 1;
        bVar2 = bVar5;
        this.f56678u = bVar2;
        this.f56677t = i12;
        v2.j0 j0Var2 = (v2.j0) bVar2;
        objF = j0Var2.f(this.f56679v, this);
        bVar = j0Var2;
        if (objF != coroutineSingletons) {
            v2.m mVar2 = (v2.m) objF;
            List list3 = mVar2.f91975a;
            size = list3.size();
            i5 = 0;
            while (true) {
                if (i5 >= size) {
                    objectRef.f71863a = new s0((v2.t) list3.get(0));
                    break;
                }
                if (!v2.g0.c((v2.t) list3.get(i5))) {
                    break;
                }
                i5++;
            }
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }
}
