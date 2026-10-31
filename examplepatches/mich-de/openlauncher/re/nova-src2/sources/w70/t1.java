package w70;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class t1 extends x70.a implements l1, d, x70.s {

    /* renamed from: e, reason: collision with root package name */
    public final int f94021e;

    /* renamed from: f, reason: collision with root package name */
    public final int f94022f;

    /* renamed from: g, reason: collision with root package name */
    public final v70.a f94023g;

    /* renamed from: h, reason: collision with root package name */
    public Object[] f94024h;

    /* renamed from: i, reason: collision with root package name */
    public long f94025i;

    /* renamed from: j, reason: collision with root package name */
    public long f94026j;

    /* renamed from: k, reason: collision with root package name */
    public int f94027k;

    /* renamed from: l, reason: collision with root package name */
    public int f94028l;

    public t1(int i5, int i11, v70.a aVar) {
        this.f94021e = i5;
        this.f94022f = i11;
        this.f94023g = aVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0085 A[Catch: all -> 0x003a, TryCatch #0 {all -> 0x003a, blocks: (B:15:0x0033, B:32:0x007d, B:34:0x0085, B:38:0x009b, B:41:0x00a2, B:42:0x00a6, B:43:0x00a7, B:22:0x004f), top: B:50:0x0020 }] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0099 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r5v1, types: [x70.a] */
    /* JADX WARN: Type inference failed for: r5v12 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v4, types: [w70.t1] */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r5v7 */
    /* JADX WARN: Type inference failed for: r9v0, types: [w70.n] */
    /* JADX WARN: Type inference failed for: r9v1 */
    /* JADX WARN: Type inference failed for: r9v16 */
    /* JADX WARN: Type inference failed for: r9v17 */
    /* JADX WARN: Type inference failed for: r9v18 */
    /* JADX WARN: Type inference failed for: r9v2, types: [x70.c] */
    /* JADX WARN: Type inference failed for: r9v3 */
    /* JADX WARN: Type inference failed for: r9v4 */
    /* JADX WARN: Type inference failed for: r9v5, types: [w70.v1] */
    /* JADX WARN: Type inference failed for: r9v8, types: [w70.v1] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x00b8 -> B:16:0x0036). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void k(t1 t1Var, n nVar, Continuation continuation) throws Throwable {
        s1 s1Var;
        ?? r52;
        n nVar2;
        t70.r1 r1Var;
        t70.r1 r1Var2;
        n nVar3;
        Object objS;
        v1 v1Var;
        if (continuation instanceof s1) {
            s1Var = (s1) continuation;
            int i5 = s1Var.f94015z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                s1Var.f94015z = i5 - Integer.MIN_VALUE;
            } else {
                s1Var = new s1(t1Var, continuation);
            }
        }
        Object obj = s1Var.f94013x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = s1Var.f94015z;
        try {
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                nVar2 = nVar;
                nVar = (v1) t1Var.b();
            } else {
                if (i11 != 1) {
                    if (i11 == 2) {
                        r1Var2 = s1Var.f94012w;
                        v1 v1Var2 = s1Var.f94011v;
                        nVar3 = s1Var.f94010u;
                        t1 t1Var2 = s1Var.f94009t;
                        ResultKt.b(obj);
                        r52 = t1Var2;
                        nVar = v1Var2;
                        do {
                            objS = r52.s(nVar);
                            if (objS == u1.f94041a) {
                            }
                        } while (r52.i(nVar, s1Var) != coroutineSingletons);
                    }
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    r1Var2 = s1Var.f94012w;
                    v1 v1Var3 = s1Var.f94011v;
                    nVar3 = s1Var.f94010u;
                    t1 t1Var3 = s1Var.f94009t;
                    ResultKt.b(obj);
                    t1 t1Var4 = t1Var3;
                    v1 v1Var4 = v1Var3;
                    nVar2 = nVar3;
                    r1Var = r1Var2;
                    t1Var = t1Var4;
                    v1Var = v1Var4;
                    r52 = t1Var;
                    r1Var2 = r1Var;
                    nVar3 = nVar2;
                    nVar = v1Var;
                    do {
                        objS = r52.s(nVar);
                        if (objS == u1.f94041a) {
                            if (r1Var2 != null && !r1Var2.b()) {
                                throw r1Var2.h();
                            }
                            s1Var.f94009t = r52;
                            s1Var.f94010u = nVar3;
                            s1Var.f94011v = nVar;
                            s1Var.f94012w = r1Var2;
                            s1Var.f94015z = 3;
                            t1Var4 = r52;
                            v1Var4 = nVar;
                            if (nVar3.emit(objS, s1Var) == coroutineSingletons) {
                                return;
                            }
                            nVar2 = nVar3;
                            r1Var = r1Var2;
                            t1Var = t1Var4;
                            v1Var = v1Var4;
                            r52 = t1Var;
                            r1Var2 = r1Var;
                            nVar3 = nVar2;
                            nVar = v1Var;
                            objS = r52.s(nVar);
                            if (objS == u1.f94041a) {
                                s1Var.f94009t = r52;
                                s1Var.f94010u = nVar3;
                                s1Var.f94011v = nVar;
                                s1Var.f94012w = r1Var2;
                                s1Var.f94015z = 2;
                            }
                        }
                    } while (r52.i(nVar, s1Var) != coroutineSingletons);
                }
                nVar = s1Var.f94011v;
                n nVar4 = s1Var.f94010u;
                t1 t1Var5 = s1Var.f94009t;
                try {
                    ResultKt.b(obj);
                    nVar2 = nVar4;
                    t1Var = t1Var5;
                    nVar = nVar;
                } catch (Throwable th3) {
                    th = th3;
                    r52 = t1Var5;
                    r52.g(nVar);
                    throw th;
                }
            }
            r1Var = (t70.r1) s1Var.getContext().get(t70.q1.f88853a);
            v1Var = nVar;
            r52 = t1Var;
            r1Var2 = r1Var;
            nVar3 = nVar2;
            nVar = v1Var;
            do {
                objS = r52.s(nVar);
                if (objS == u1.f94041a) {
                }
            } while (r52.i(nVar, s1Var) != coroutineSingletons);
        } catch (Throwable th4) {
            r52 = t1Var;
            th = th4;
            r52.g(nVar);
            throw th;
        }
    }

    @Override // x70.s
    public final m a(CoroutineContext coroutineContext, int i5, v70.a aVar) {
        return u1.t(this, coroutineContext, i5, aVar);
    }

    @Override // w70.l1
    public final boolean c(Object obj) {
        int i5;
        boolean z11;
        Continuation[] continuationArrN = x70.b.f95215a;
        synchronized (this) {
            if (q(obj)) {
                continuationArrN = n(continuationArrN);
                z11 = true;
            } else {
                z11 = false;
            }
        }
        for (Continuation continuation : continuationArrN) {
            if (continuation != null) {
                int i11 = Result.f71687b;
                continuation.resumeWith(Unit.f71706a);
            }
        }
        return z11;
    }

    @Override // w70.m
    public final Object collect(n nVar, Continuation continuation) throws Throwable {
        k(this, nVar, continuation);
        return CoroutineSingletons.f71806a;
    }

    @Override // w70.l1
    public final void d() throws Throwable {
        synchronized (this) {
            try {
                try {
                    t(o() + this.f94027k, this.f94026j, o() + this.f94027k, o() + this.f94027k + this.f94028l);
                    Unit unit = Unit.f71706a;
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    @Override // x70.a
    public final x70.c e() {
        v1 v1Var = new v1();
        v1Var.f94050a = -1L;
        return v1Var;
    }

    @Override // w70.l1, w70.n
    public final Object emit(Object obj, Continuation continuation) throws Throwable {
        Throwable th2;
        Continuation[] continuationArrN;
        r1 r1Var;
        if (c(obj)) {
            return Unit.f71706a;
        }
        int i5 = 1;
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        Continuation[] continuationArrN2 = x70.b.f95215a;
        synchronized (this) {
            try {
                if (q(obj)) {
                    try {
                        int i11 = Result.f71687b;
                        mVar.resumeWith(Unit.f71706a);
                        continuationArrN = n(continuationArrN2);
                        r1Var = null;
                    } catch (Throwable th3) {
                        th2 = th3;
                        throw th2;
                    }
                } else {
                    try {
                        r1 r1Var2 = new r1(this, o() + this.f94027k + this.f94028l, obj, mVar);
                        m(r1Var2);
                        this.f94028l++;
                        if (this.f94022f == 0) {
                            continuationArrN2 = n(continuationArrN2);
                        }
                        continuationArrN = continuationArrN2;
                        r1Var = r1Var2;
                    } catch (Throwable th4) {
                        th = th4;
                        th2 = th;
                        throw th2;
                    }
                }
                if (r1Var != null) {
                    mVar.w(new t70.j(r1Var, i5));
                }
                for (Continuation continuation2 : continuationArrN) {
                    if (continuation2 != null) {
                        int i12 = Result.f71687b;
                        continuation2.resumeWith(Unit.f71706a);
                    }
                }
                Object objS = mVar.s();
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                if (objS != coroutineSingletons) {
                    objS = Unit.f71706a;
                }
                return objS == coroutineSingletons ? objS : Unit.f71706a;
            } catch (Throwable th5) {
                th = th5;
            }
        }
    }

    @Override // x70.a
    public final x70.c[] f() {
        return new v1[2];
    }

    @Override // w70.q1
    public final List getReplayCache() {
        synchronized (this) {
            int iO = (int) ((o() + this.f94027k) - this.f94025i);
            if (iO == 0) {
                return EmptyList.f71733a;
            }
            ArrayList arrayList = new ArrayList(iO);
            Object[] objArr = this.f94024h;
            Intrinsics.d(objArr);
            for (int i5 = 0; i5 < iO; i5++) {
                arrayList.add(objArr[((int) (this.f94025i + i5)) & (objArr.length - 1)]);
            }
            return arrayList;
        }
    }

    public final Object i(v1 v1Var, s1 s1Var) {
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(s1Var));
        mVar.t();
        synchronized (this) {
            try {
                if (r(v1Var) < 0) {
                    v1Var.f94051b = mVar;
                } else {
                    int i5 = Result.f71687b;
                    mVar.resumeWith(Unit.f71706a);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        Object objS = mVar.s();
        return objS == CoroutineSingletons.f71806a ? objS : Unit.f71706a;
    }

    public final void j() {
        if (this.f94022f != 0 || this.f94028l > 1) {
            Object[] objArr = this.f94024h;
            Intrinsics.d(objArr);
            while (this.f94028l > 0) {
                long jO = o();
                int i5 = this.f94027k;
                int i11 = this.f94028l;
                if (objArr[((int) ((jO + (i5 + i11)) - 1)) & (objArr.length - 1)] != u1.f94041a) {
                    return;
                }
                this.f94028l = i11 - 1;
                u1.d(objArr, o() + this.f94027k + this.f94028l, null);
            }
        }
    }

    public final void l() {
        x70.c[] cVarArr;
        Object[] objArr = this.f94024h;
        Intrinsics.d(objArr);
        u1.d(objArr, o(), null);
        this.f94027k--;
        long jO = o() + 1;
        if (this.f94025i < jO) {
            this.f94025i = jO;
        }
        if (this.f94026j < jO) {
            if (this.f95212b != 0 && (cVarArr = this.f95211a) != null) {
                for (x70.c cVar : cVarArr) {
                    if (cVar != null) {
                        v1 v1Var = (v1) cVar;
                        long j11 = v1Var.f94050a;
                        if (j11 >= 0 && j11 < jO) {
                            v1Var.f94050a = jO;
                        }
                    }
                }
            }
            this.f94026j = jO;
        }
    }

    public final void m(Object obj) {
        int i5 = this.f94027k + this.f94028l;
        Object[] objArrP = this.f94024h;
        if (objArrP == null) {
            objArrP = p(null, 0, 2);
        } else if (i5 >= objArrP.length) {
            objArrP = p(objArrP, i5, objArrP.length * 2);
        }
        u1.d(objArrP, o() + i5, obj);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r11v6, types: [java.lang.Object, java.lang.Object[]] */
    public final Continuation[] n(Continuation[] continuationArr) {
        x70.c[] cVarArr;
        v1 v1Var;
        t70.m mVar;
        int length = continuationArr.length;
        if (this.f95212b != 0 && (cVarArr = this.f95211a) != null) {
            int length2 = cVarArr.length;
            int i5 = 0;
            continuationArr = continuationArr;
            while (i5 < length2) {
                x70.c cVar = cVarArr[i5];
                if (cVar != null && (mVar = (v1Var = (v1) cVar).f94051b) != null && r(v1Var) >= 0) {
                    int length3 = continuationArr.length;
                    continuationArr = continuationArr;
                    if (length >= length3) {
                        ?? CopyOf = Arrays.copyOf(continuationArr, Math.max(2, continuationArr.length * 2));
                        Intrinsics.f(CopyOf, "copyOf(...)");
                        continuationArr = CopyOf;
                    }
                    continuationArr[length] = mVar;
                    v1Var.f94051b = null;
                    length++;
                }
                i5++;
                continuationArr = continuationArr;
            }
        }
        return continuationArr;
    }

    public final long o() {
        return Math.min(this.f94026j, this.f94025i);
    }

    public final Object[] p(Object[] objArr, int i5, int i11) {
        if (i11 <= 0) {
            throw new IllegalStateException("Buffer size overflow");
        }
        Object[] objArr2 = new Object[i11];
        this.f94024h = objArr2;
        if (objArr != null) {
            long jO = o();
            for (int i12 = 0; i12 < i5; i12++) {
                long j11 = i12 + jO;
                u1.d(objArr2, j11, objArr[((int) j11) & (objArr.length - 1)]);
            }
        }
        return objArr2;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0047  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean q(Object obj) {
        int i5 = this.f95212b;
        int i11 = this.f94021e;
        if (i5 != 0) {
            int i12 = this.f94027k;
            int i13 = this.f94022f;
            if (i12 < i13 || this.f94026j > this.f94025i) {
                m(obj);
                int i14 = this.f94027k + 1;
                this.f94027k = i14;
                if (i14 > i13) {
                    l();
                }
                long jO = o() + this.f94027k;
                long j11 = this.f94025i;
                if (((int) (jO - j11)) > i11) {
                    t(1 + j11, this.f94026j, o() + this.f94027k, o() + this.f94027k + this.f94028l);
                }
            } else {
                int iOrdinal = this.f94023g.ordinal();
                if (iOrdinal == 0) {
                    return false;
                }
                if (iOrdinal != 1) {
                    if (iOrdinal != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                }
            }
        } else if (i11 != 0) {
            m(obj);
            int i15 = this.f94027k + 1;
            this.f94027k = i15;
            if (i15 > i11) {
                l();
            }
            this.f94026j = o() + this.f94027k;
            return true;
        }
        return true;
    }

    public final long r(v1 v1Var) {
        long j11 = v1Var.f94050a;
        if (j11 < o() + this.f94027k) {
            return j11;
        }
        if (this.f94022f <= 0 && j11 <= o() && this.f94028l != 0) {
            return j11;
        }
        return -1L;
    }

    public final Object s(v1 v1Var) {
        Object obj;
        Continuation[] continuationArrU = x70.b.f95215a;
        synchronized (this) {
            try {
                long jR = r(v1Var);
                if (jR < 0) {
                    obj = u1.f94041a;
                } else {
                    long j11 = v1Var.f94050a;
                    Object[] objArr = this.f94024h;
                    Intrinsics.d(objArr);
                    Object obj2 = objArr[((int) jR) & (objArr.length - 1)];
                    if (obj2 instanceof r1) {
                        obj2 = ((r1) obj2).f94001c;
                    }
                    v1Var.f94050a = jR + 1;
                    Object obj3 = obj2;
                    continuationArrU = u(j11);
                    obj = obj3;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        for (Continuation continuation : continuationArrU) {
            if (continuation != null) {
                int i5 = Result.f71687b;
                continuation.resumeWith(Unit.f71706a);
            }
        }
        return obj;
    }

    public final void t(long j11, long j12, long j13, long j14) {
        long jMin = Math.min(j12, j11);
        for (long jO = o(); jO < jMin; jO++) {
            Object[] objArr = this.f94024h;
            Intrinsics.d(objArr);
            u1.d(objArr, jO, null);
        }
        this.f94025i = j11;
        this.f94026j = j12;
        this.f94027k = (int) (j13 - jMin);
        this.f94028l = (int) (j14 - j13);
    }

    public final Continuation[] u(long j11) {
        long j12;
        long j13;
        long j14;
        Continuation[] continuationArr;
        Continuation[] continuationArr2;
        x70.c[] cVarArr;
        w50.g gVar = u1.f94041a;
        Continuation[] continuationArr3 = x70.b.f95215a;
        if (j11 <= this.f94026j) {
            long jO = o();
            long j15 = this.f94027k + jO;
            int i5 = this.f94022f;
            if (i5 == 0 && this.f94028l > 0) {
                j15++;
            }
            int i11 = 0;
            if (this.f95212b != 0 && (cVarArr = this.f95211a) != null) {
                for (x70.c cVar : cVarArr) {
                    if (cVar != null) {
                        long j16 = ((v1) cVar).f94050a;
                        if (j16 >= 0 && j16 < j15) {
                            j15 = j16;
                        }
                    }
                }
            }
            if (j15 > this.f94026j) {
                long jO2 = o() + this.f94027k;
                int iMin = this.f95212b > 0 ? Math.min(this.f94028l, i5 - ((int) (jO2 - j15))) : this.f94028l;
                long j17 = this.f94028l + jO2;
                if (iMin > 0) {
                    j14 = 1;
                    Object[] objArr = this.f94024h;
                    Intrinsics.d(objArr);
                    j12 = jO;
                    Continuation[] continuationArr4 = new Continuation[iMin];
                    long j18 = jO2;
                    while (true) {
                        if (jO2 >= j17) {
                            continuationArr2 = continuationArr4;
                            j13 = j15;
                            break;
                        }
                        continuationArr2 = continuationArr4;
                        Object obj = objArr[(objArr.length - 1) & ((int) jO2)];
                        if (obj != gVar) {
                            Intrinsics.e(obj, "null cannot be cast to non-null type kotlinx.coroutines.flow.SharedFlowImpl.Emitter");
                            r1 r1Var = (r1) obj;
                            int i12 = i11 + 1;
                            j13 = j15;
                            continuationArr2[i11] = r1Var.f94002d;
                            u1.d(objArr, jO2, gVar);
                            u1.d(objArr, j18, r1Var.f94001c);
                            j18++;
                            if (i12 >= iMin) {
                                break;
                            }
                            i11 = i12;
                        } else {
                            j13 = j15;
                        }
                        jO2++;
                        continuationArr4 = continuationArr2;
                        j15 = j13;
                    }
                    jO2 = j18;
                    continuationArr = continuationArr2;
                } else {
                    j12 = jO;
                    j13 = j15;
                    j14 = 1;
                    continuationArr = continuationArr3;
                }
                int i13 = (int) (jO2 - j12);
                long j19 = this.f95212b == 0 ? jO2 : j13;
                long jMax = Math.max(this.f94025i, jO2 - Math.min(this.f94021e, i13));
                if (i5 == 0 && jMax < j17) {
                    Object[] objArr2 = this.f94024h;
                    Intrinsics.d(objArr2);
                    if (Intrinsics.b(objArr2[((int) jMax) & (objArr2.length - 1)], gVar)) {
                        jO2 += j14;
                        jMax += j14;
                    }
                }
                t(jMax, j19, jO2, j17);
                j();
                return continuationArr.length == 0 ? continuationArr : n(continuationArr);
            }
        }
        return continuationArr3;
    }
}
