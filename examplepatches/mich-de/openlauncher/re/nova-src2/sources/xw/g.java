package xw;

import com.google.android.gms.tasks.Task;
import com.stripe.attestation.AttestationError;
import fi.t;
import j00.k0;
import java.util.Objects;
import kotlin.LazyKt;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import ok.k;
import ok.n;
import ok.o;
import ps.i0;
import t5.d0;
import tk.j;

/* loaded from: classes4.dex */
public final class g implements c {

    /* renamed from: a, reason: collision with root package name */
    public final long f96469a;

    /* renamed from: b, reason: collision with root package name */
    public final k0 f96470b;

    /* renamed from: c, reason: collision with root package name */
    public final d0 f96471c;

    /* renamed from: d, reason: collision with root package name */
    public final c80.a f96472d;

    /* renamed from: e, reason: collision with root package name */
    public final a70.d f96473e;

    /* renamed from: f, reason: collision with root package name */
    public k f96474f;

    public g(k0 k0Var, d0 d0Var) {
        c80.d dVar = new c80.d();
        this.f96469a = 577365562050L;
        this.f96470b = k0Var;
        this.f96471c = d0Var;
        this.f96472d = dVar;
        this.f96473e = LazyKt.a(new xu.d(this, 2));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00eb A[Catch: all -> 0x0032, TryCatch #1 {all -> 0x0032, blocks: (B:13:0x002d, B:51:0x00df, B:53:0x00eb, B:54:0x00f0), top: B:77:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x011f A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:86:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        d dVar;
        g gVar;
        Object objA;
        g gVar2;
        Throwable thA;
        g gVar3;
        c80.a aVar;
        c80.a aVar2;
        Throwable th2;
        Object objB;
        if (continuationImpl instanceof d) {
            d dVar2 = (d) continuationImpl;
            int i5 = dVar2.f96460y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar2.f96460y = i5 - Integer.MIN_VALUE;
                dVar = dVar2;
            } else {
                dVar = new d(this, continuationImpl);
            }
        }
        Object obj = dVar.f96458w;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = dVar.f96460y;
        try {
        } catch (Throwable th3) {
            th = th3;
            gVar = dVar;
        }
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                try {
                    int i12 = Result.f71687b;
                    c80.a aVar3 = this.f96472d;
                    dVar.f96455t = this;
                    dVar.f96456u = this;
                    dVar.f96457v = aVar3;
                    dVar.f96460y = 1;
                    c80.d dVar3 = (c80.d) aVar3;
                    if (dVar3.e(dVar) != obj2) {
                        gVar3 = this;
                        gVar = gVar3;
                        aVar = dVar3;
                    }
                    return obj2;
                } catch (Throwable th4) {
                    th = th4;
                    gVar = this;
                    int i13 = Result.f71687b;
                    objA = ResultKt.a(th);
                    gVar2 = gVar;
                    if (!(objA instanceof Result.Failure)) {
                    }
                    thA = Result.a(objA);
                    if (thA != null) {
                    }
                }
            } else {
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    aVar2 = dVar.f96457v;
                    gVar3 = dVar.f96456u;
                    gVar2 = dVar.f96455t;
                    try {
                        ResultKt.b(obj);
                        objB = h.b((Task) obj);
                        int i14 = Result.f71687b;
                        if (!(objB instanceof Result.Failure)) {
                            gVar3.f96474f = (k) objB;
                        }
                        ResultKt.b(objB);
                        objA = (k) objB;
                        ((c80.d) aVar2).g(null);
                        if (!(objA instanceof Result.Failure)) {
                            objA = Unit.f71706a;
                        }
                        thA = Result.a(objA);
                        if (thA != null) {
                            return objA;
                        }
                        try {
                            gVar2.f96470b.invoke("Integrity - Failed to prepare integrity token", thA);
                            Object obj3 = AttestationError.f45518a;
                            throw i0.k(thA);
                        } catch (Throwable th5) {
                            int i15 = Result.f71687b;
                            return ResultKt.a(th5);
                        }
                    } catch (Throwable th6) {
                        th2 = th6;
                        ((c80.d) aVar2).g(null);
                        throw th2;
                    }
                }
                c80.a aVar4 = dVar.f96457v;
                g gVar4 = dVar.f96456u;
                gVar = dVar.f96455t;
                try {
                    ResultKt.b(obj);
                    aVar = aVar4;
                    gVar3 = gVar4;
                } catch (Throwable th7) {
                    th = th7;
                    int i132 = Result.f71687b;
                    objA = ResultKt.a(th);
                    gVar2 = gVar;
                    if (!(objA instanceof Result.Failure)) {
                    }
                    thA = Result.a(objA);
                    if (thA != null) {
                    }
                }
            }
            k kVar = gVar3.f96474f;
            a70.d dVar4 = gVar3.f96473e;
            if (kVar != null) {
                Objects.toString((ok.b) dVar4.getValue());
                int i16 = Result.f71687b;
                Unit unit = Unit.f71706a;
                ((c80.d) aVar).g(null);
                return unit;
            }
            Objects.toString((ok.b) dVar4.getValue());
            ok.b bVar = (ok.b) dVar4.getValue();
            long j11 = gVar3.f96469a;
            byte b11 = (byte) (1 | ((byte) 2));
            if (b11 != 3) {
                StringBuilder sb2 = new StringBuilder();
                if ((b11 & 1) == 0) {
                    sb2.append(" cloudProjectNumber");
                }
                if ((b11 & 2) == 0) {
                    sb2.append(" webViewRequestMode");
                }
                throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
            }
            Task taskA = bVar.a(new n(j11));
            dVar.f96455t = gVar;
            dVar.f96456u = gVar3;
            dVar.f96457v = aVar;
            dVar.f96460y = 2;
            Object objA2 = h.a(taskA, dVar);
            if (objA2 != obj2) {
                aVar2 = aVar;
                obj = objA2;
                gVar2 = gVar;
                objB = h.b((Task) obj);
                int i142 = Result.f71687b;
                if (!(objB instanceof Result.Failure)) {
                }
                ResultKt.b(objB);
                objA = (k) objB;
                ((c80.d) aVar2).g(null);
                if (!(objA instanceof Result.Failure)) {
                }
                thA = Result.a(objA);
                if (thA != null) {
                }
            }
            return obj2;
        } catch (Throwable th8) {
            aVar2 = aVar;
            th2 = th8;
            ((c80.d) aVar2).g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x006d A[Catch: all -> 0x0044, TryCatch #2 {all -> 0x0044, blocks: (B:20:0x003c, B:31:0x0060, B:35:0x0069, B:37:0x006d, B:39:0x0073, B:45:0x009e, B:46:0x00a5, B:47:0x00a6, B:48:0x00ad), top: B:65:0x003c }] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00a6 A[Catch: all -> 0x0044, TryCatch #2 {all -> 0x0044, blocks: (B:20:0x003c, B:31:0x0060, B:35:0x0069, B:37:0x006d, B:39:0x0073, B:45:0x009e, B:46:0x00a5, B:47:0x00a6, B:48:0x00ad), top: B:65:0x003c }] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00c3 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:68:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        e eVar;
        g gVar;
        g gVar2;
        g gVar3;
        Object objA;
        k kVar;
        Object objA2;
        Throwable thA;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f96465x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f96465x = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object objA3 = eVar.f96463v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f96465x;
        if (i11 == 0) {
            ResultKt.b(objA3);
            try {
                int i12 = Result.f71687b;
                if (this.f96474f == null) {
                    eVar.f96461t = this;
                    eVar.f96462u = this;
                    eVar.f96465x = 1;
                    objA = a(eVar);
                    if (objA != coroutineSingletons) {
                        gVar2 = this;
                        gVar3 = gVar2;
                        ResultKt.b(objA);
                        kVar = gVar2.f96474f;
                        if (kVar == null) {
                        }
                    }
                    return coroutineSingletons;
                }
                gVar2 = this;
                gVar3 = gVar2;
                kVar = gVar2.f96474f;
                if (kVar == null) {
                }
            } catch (Throwable th2) {
                th = th2;
                gVar = this;
                int i13 = Result.f71687b;
                objA2 = ResultKt.a(th);
                if (!(objA2 instanceof Result.Failure)) {
                }
                thA = Result.a(objA2);
                if (thA != null) {
                }
            }
        } else if (i11 == 1) {
            gVar2 = eVar.f96462u;
            gVar3 = eVar.f96461t;
            try {
                ResultKt.b(objA3);
                objA = ((Result) objA3).f71688a;
                ResultKt.b(objA);
                kVar = gVar2.f96474f;
                if (kVar == null) {
                    throw new IllegalArgumentException("Integrity token provider is not initialized after prepare()");
                }
                int i14 = tk.h.f89422c;
                j jVar = j.f89427g;
                if (jVar == null) {
                    throw new NullPointerException("Null verdictOptOut");
                }
                t tVarA = kVar.a(new o(null, jVar));
                Intrinsics.f(tVarA, "request(...)");
                eVar.f96461t = gVar3;
                eVar.f96462u = null;
                eVar.f96465x = 2;
                objA3 = h.a(tVarA, eVar);
                if (objA3 != coroutineSingletons) {
                    gVar = gVar3;
                    Object objB = h.b((Task) objA3);
                    ResultKt.b(objB);
                    objA2 = (ok.j) objB;
                    int i15 = Result.f71687b;
                }
                return coroutineSingletons;
            } catch (Throwable th3) {
                th = th3;
                gVar = gVar3;
                int i132 = Result.f71687b;
                objA2 = ResultKt.a(th);
                if (!(objA2 instanceof Result.Failure)) {
                }
                thA = Result.a(objA2);
                if (thA != null) {
                }
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            gVar = eVar.f96461t;
            try {
                ResultKt.b(objA3);
                Object objB2 = h.b((Task) objA3);
                ResultKt.b(objB2);
                objA2 = (ok.j) objB2;
                int i152 = Result.f71687b;
            } catch (Throwable th4) {
                th = th4;
                int i1322 = Result.f71687b;
                objA2 = ResultKt.a(th);
                if (!(objA2 instanceof Result.Failure)) {
                }
                thA = Result.a(objA2);
                if (thA != null) {
                }
            }
        }
        if (!(objA2 instanceof Result.Failure)) {
            objA2 = ((ok.j) objA2).f80480a;
        }
        thA = Result.a(objA2);
        if (thA != null) {
            return objA2;
        }
        try {
            gVar.f96470b.invoke("Integrity - Failed to request integrity token", thA);
            Object obj = AttestationError.f45518a;
            throw i0.k(thA);
        } catch (Throwable th5) {
            int i16 = Result.f71687b;
            return ResultKt.a(th5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) {
        f fVar;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i5 = fVar.f96468v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f96468v = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(this, continuationImpl);
            }
        }
        Object obj = fVar.f96466t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = fVar.f96468v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        fVar.f96468v = 1;
        Object objB = b(fVar);
        return objB == obj2 ? obj2 : objB;
    }
}
