package y70;

import androidx.compose.ui.node.LayoutNode;
import b.c0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlinx.coroutines.DispatchException;
import t70.i1;
import t70.k2;
import t70.q1;
import t70.r1;
import t70.r2;

/* loaded from: classes.dex */
public abstract class g {

    /* renamed from: a, reason: collision with root package name */
    public static final w50.g f96797a = new w50.g("UNDEFINED", 1);

    /* renamed from: b, reason: collision with root package name */
    public static final w50.g f96798b = new w50.g("REUSABLE_CLAIMED", 1);

    public static final void a(int i5) {
        if (i5 < 1) {
            throw new IllegalArgumentException(c0.h(i5, "Expected positive parallelism level, but got ").toString());
        }
    }

    public static final t b(Object obj) {
        if (obj != b.f96787a) {
            return (t) obj;
        }
        throw new IllegalStateException("Does not contain segment");
    }

    public static final boolean c(Object obj) {
        return obj == b.f96787a;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x008c A[Catch: all -> 0x0069, DONT_GENERATE, TryCatch #1 {all -> 0x0069, blocks: (B:16:0x0049, B:18:0x0057, B:20:0x005d, B:33:0x008f, B:23:0x006b, B:25:0x0079, B:30:0x0086, B:32:0x008c, B:38:0x009c, B:41:0x00a5, B:40:0x00a2, B:28:0x007f), top: B:52:0x0049, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void d(Object obj, Continuation continuation) throws DispatchException {
        r1 r1Var;
        if (!(continuation instanceof f)) {
            continuation.resumeWith(obj);
            return;
        }
        f fVar = (f) continuation;
        t70.c0 c0Var = fVar.f96793d;
        ContinuationImpl continuationImpl = fVar.f96794e;
        Throwable thA = Result.a(obj);
        Object vVar = thA == null ? obj : new t70.v(false, thA);
        if (f(c0Var, continuationImpl.getContext())) {
            fVar.f96795f = vVar;
            fVar.f88870c = 1;
            e(c0Var, continuationImpl.getContext(), fVar);
            return;
        }
        i1 i1VarA = k2.a();
        if (i1VarA.f88806c >= 4294967296L) {
            fVar.f96795f = vVar;
            fVar.f88870c = 1;
            i1VarA.h0(fVar);
            return;
        }
        i1VarA.j0(true);
        try {
            r1Var = (r1) continuationImpl.getContext().get(q1.f88853a);
        } finally {
            try {
            } finally {
            }
        }
        if (r1Var == null || r1Var.b()) {
            Object obj2 = fVar.f96796g;
            CoroutineContext context = continuationImpl.getContext();
            Object objC = w.c(context, obj2);
            r2 r2VarC = objC != w.f96829a ? t70.z.c(continuationImpl, context, objC) : null;
            try {
                continuationImpl.resumeWith(obj);
                Unit unit = Unit.f71706a;
            } finally {
                if (r2VarC == null || r2VarC.n0()) {
                    w.a(context, objC);
                }
            }
        }
        fVar.resumeWith(ResultKt.a(r1Var.h()));
        while (i1VarA.l0()) {
        }
    }

    public static final void e(t70.c0 c0Var, CoroutineContext coroutineContext, Runnable runnable) throws DispatchException {
        try {
            c0Var.c0(coroutineContext, runnable);
        } catch (Throwable th2) {
            throw new DispatchException(th2, c0Var, coroutineContext);
        }
    }

    public static final boolean f(t70.c0 c0Var, CoroutineContext coroutineContext) throws DispatchException {
        try {
            return c0Var.e0(coroutineContext);
        } catch (Throwable th2) {
            throw new DispatchException(th2, c0Var, coroutineContext);
        }
    }

    public static final long g(String str, long j11, long j12, long j13) {
        String property;
        int i5 = v.f96828a;
        try {
            property = System.getProperty(str);
        } catch (SecurityException unused) {
            property = null;
        }
        if (property == null) {
            return j11;
        }
        Long lV0 = r70.i.v0(property);
        if (lV0 == null) {
            throw new IllegalStateException(("System property '" + str + "' has unrecognized value '" + property + '\'').toString());
        }
        long jLongValue = lV0.longValue();
        if (j12 <= jLongValue && jLongValue <= j13) {
            return jLongValue;
        }
        StringBuilder sb2 = new StringBuilder("System property '");
        sb2.append(str);
        sb2.append("' should be in range ");
        sb2.append(j12);
        c0.B(sb2, "..", j13, ", but is '");
        sb2.append(jLongValue);
        sb2.append('\'');
        throw new IllegalStateException(sb2.toString().toString());
    }

    public static int h(int i5, int i11, String str) {
        return (int) g(str, i5, 1, (i11 & 8) != 0 ? LayoutNode.NotPlacedPlaceOrder : 2097150);
    }
}
