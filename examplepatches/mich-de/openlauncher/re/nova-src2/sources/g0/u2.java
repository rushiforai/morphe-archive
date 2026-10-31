package g0;

import java.util.List;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public abstract class u2 {

    /* renamed from: a, reason: collision with root package name */
    public static final f1.o0 f56720a = new f1.o0(21);

    /* JADX WARN: Removed duplicated region for block: B:20:0x0065 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x0063 -> B:21:0x0066). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(v2.b bVar, v2.n nVar, BaseContinuationImpl baseContinuationImpl) {
        o0 o0Var;
        int size;
        int i5;
        if (baseContinuationImpl instanceof o0) {
            o0Var = (o0) baseContinuationImpl;
            int i11 = o0Var.f56642w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                o0Var.f56642w = i11 - Integer.MIN_VALUE;
            } else {
                o0Var = new o0(baseContinuationImpl);
            }
        }
        Object objF = o0Var.f56641v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = o0Var.f56642w;
        if (i12 == 0) {
            ResultKt.b(objF);
            List list = ((v2.j0) bVar).f91952f.f91969e.f91975a;
            int size2 = list.size();
            for (int i13 = 0; i13 < size2; i13++) {
                if (((v2.t) list.get(i13)).f91993d) {
                    o0Var.f56639t = bVar;
                    o0Var.f56640u = nVar;
                    o0Var.f56642w = 1;
                    v2.j0 j0Var = (v2.j0) bVar;
                    objF = j0Var.f(nVar, o0Var);
                    bVar = j0Var;
                    if (objF == coroutineSingletons) {
                    }
                    List list2 = ((v2.m) objF).f91975a;
                    size = list2.size();
                    i5 = 0;
                    while (i5 < size) {
                    }
                    return Unit.f71706a;
                }
            }
            return Unit.f71706a;
        }
        if (i12 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        v2.n nVar2 = o0Var.f56640u;
        v2.b bVar2 = o0Var.f56639t;
        ResultKt.b(objF);
        nVar = nVar2;
        bVar = bVar2;
        List list22 = ((v2.m) objF).f91975a;
        size = list22.size();
        i5 = 0;
        while (i5 < size) {
            if (((v2.t) list22.get(i5)).f91993d) {
                o0Var.f56639t = bVar;
                o0Var.f56640u = nVar;
                o0Var.f56642w = 1;
                v2.j0 j0Var2 = (v2.j0) bVar;
                objF = j0Var2.f(nVar, o0Var);
                bVar = j0Var2;
                if (objF == coroutineSingletons) {
                    return coroutineSingletons;
                }
                List list222 = ((v2.m) objF).f91975a;
                size = list222.size();
                i5 = 0;
                while (i5 < size) {
                }
            } else {
                i5++;
            }
        }
        return Unit.f71706a;
    }

    public static final Object b(v2.x xVar, Function2 function2, Continuation continuation) {
        Object objB = ((v2.l0) xVar).B(new p0(continuation.getContext(), function2, (Continuation) null), continuation);
        return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00a5, code lost:
    
        if (r11 == r1) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00d4, code lost:
    
        if (kotlin.Unit.f71706a != r1) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x004d, code lost:
    
        if (kotlin.Unit.f71706a == r1) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x004d, code lost:
    
        if (r11 != r1) goto L18;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00a3 A[Catch: CancellationException -> 0x0050, TRY_LEAVE, TryCatch #0 {CancellationException -> 0x0050, blocks: (B:31:0x0084, B:34:0x00a3, B:17:0x004a, B:22:0x005c), top: B:50:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00d8  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x006d A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v12 */
    /* JADX WARN: Type inference failed for: r2v13 */
    /* JADX WARN: Type inference failed for: r2v15, types: [v2.x] */
    /* JADX WARN: Type inference failed for: r2v16, types: [v2.x] */
    /* JADX WARN: Type inference failed for: r2v17 */
    /* JADX WARN: Type inference failed for: r2v2, types: [v2.x] */
    /* JADX WARN: Type inference failed for: r2v3, types: [v2.x] */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r9v0, types: [v2.x] */
    /* JADX WARN: Type inference failed for: r9v1 */
    /* JADX WARN: Type inference failed for: r9v13, types: [kotlin.coroutines.CoroutineContext] */
    /* JADX WARN: Type inference failed for: r9v16, types: [kotlin.coroutines.CoroutineContext] */
    /* JADX WARN: Type inference failed for: r9v18 */
    /* JADX WARN: Type inference failed for: r9v2, types: [kotlin.coroutines.CoroutineContext] */
    /* JADX WARN: Type inference failed for: r9v3 */
    /* JADX WARN: Type inference failed for: r9v5 */
    /* JADX WARN: Type inference failed for: r9v6 */
    /* JADX WARN: Type inference failed for: r9v8 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(v2.x xVar, Function2 function2, Continuation continuation) {
        q0 q0Var;
        Object objB;
        CoroutineContext context;
        v2.x xVar2;
        if (continuation instanceof q0) {
            q0Var = (q0) continuation;
            int i5 = q0Var.f56668x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                q0Var.f56668x = i5 - Integer.MIN_VALUE;
            } else {
                q0Var = new q0(continuation);
            }
        }
        Object obj = q0Var.f56667w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        v2.l0 l0Var = q0Var.f56668x;
        try {
        } catch (CancellationException e3) {
            e = e3;
            if (t70.m0.q(xVar)) {
                throw e;
            }
            q0Var.f56664t = l0Var;
            q0Var.f56665u = function2;
            q0Var.f56666v = xVar;
            q0Var.f56668x = 3;
            Object objB2 = l0Var.B(new n0(2, null), q0Var);
            if (objB2 == CoroutineSingletons.f71806a) {
            }
            if (t70.m0.q(context)) {
            }
        }
        if (l0Var == 0) {
            ResultKt.b(obj);
            context = q0Var.getContext();
            xVar2 = xVar;
            function2 = function2;
            if (t70.m0.q(context)) {
            }
        } else if (l0Var != 1) {
            if (l0Var == 2) {
                xVar = q0Var.f56666v;
                function2 = q0Var.f56665u;
                l0Var = q0Var.f56664t;
                ResultKt.b(obj);
            } else {
                if (l0Var != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                xVar = q0Var.f56666v;
                function2 = q0Var.f56665u;
                l0Var = q0Var.f56664t;
                ResultKt.b(obj);
            }
            context = xVar;
            xVar2 = l0Var;
            function2 = function2;
            if (t70.m0.q(context)) {
                try {
                } catch (CancellationException e11) {
                    l0Var = xVar2;
                    xVar = context;
                    e = e11;
                    if (t70.m0.q(xVar)) {
                    }
                }
                q0Var.f56664t = xVar2;
                q0Var.f56665u = function2;
                q0Var.f56666v = context;
                q0Var.f56668x = 1;
                if (function2.invoke(xVar2, q0Var) != coroutineSingletons) {
                    l0Var = xVar2;
                    xVar = context;
                    function2 = function2;
                    q0Var.f56664t = l0Var;
                    q0Var.f56665u = function2;
                    q0Var.f56666v = xVar;
                    q0Var.f56668x = 2;
                    objB = l0Var.B(new n0(2, null), q0Var);
                    if (objB != CoroutineSingletons.f71806a) {
                    }
                    context = xVar;
                    xVar2 = l0Var;
                    function2 = function2;
                    if (t70.m0.q(context)) {
                        return Unit.f71706a;
                    }
                }
                return coroutineSingletons;
            }
        } else {
            CoroutineContext coroutineContext = q0Var.f56666v;
            Function2 function22 = q0Var.f56665u;
            v2.x xVar3 = q0Var.f56664t;
            ResultKt.b(obj);
            l0Var = xVar3;
            xVar = coroutineContext;
            function2 = function22;
            q0Var.f56664t = l0Var;
            q0Var.f56665u = function2;
            q0Var.f56666v = xVar;
            q0Var.f56668x = 2;
            objB = l0Var.B(new n0(2, null), q0Var);
            if (objB != CoroutineSingletons.f71806a) {
            }
            context = xVar;
            xVar2 = l0Var;
            function2 = function2;
            if (t70.m0.q(context)) {
            }
        }
    }
}
