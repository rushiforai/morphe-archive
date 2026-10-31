package q3;

import java.util.List;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import p1.e1;
import p1.s2;
import p1.y2;
import t70.p2;

/* loaded from: classes2.dex */
public final class h implements y2 {

    /* renamed from: a, reason: collision with root package name */
    public final List f83561a;

    /* renamed from: b, reason: collision with root package name */
    public final m0 f83562b;

    /* renamed from: c, reason: collision with root package name */
    public final i50.c f83563c;

    /* renamed from: d, reason: collision with root package name */
    public final Function1 f83564d;

    /* renamed from: e, reason: collision with root package name */
    public final jx.v f83565e;

    /* renamed from: f, reason: collision with root package name */
    public final e1 f83566f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f83567g = true;

    public h(List list, Object obj, m0 m0Var, i50.c cVar, Function1 function1, jx.v vVar) {
        this.f83561a = list;
        this.f83562b = m0Var;
        this.f83563c = cVar;
        this.f83564d = function1;
        this.f83565e = vVar;
        this.f83566f = androidx.compose.runtime.d.k(obj);
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x00d8, code lost:
    
        if (t70.m0.z(r2) == r3) goto L37;
     */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0067 A[Catch: all -> 0x003d, TryCatch #0 {all -> 0x003d, blocks: (B:13:0x0038, B:25:0x0067, B:27:0x0073, B:32:0x0099, B:35:0x00c6, B:20:0x0052, B:23:0x005b), top: B:44:0x002a }] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0099 A[Catch: all -> 0x003d, TRY_LEAVE, TryCatch #0 {all -> 0x003d, blocks: (B:13:0x0038, B:25:0x0067, B:27:0x0073, B:32:0x0099, B:35:0x00c6, B:20:0x0052, B:23:0x005b), top: B:44:0x002a }] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00c6 A[Catch: all -> 0x003d, TRY_ENTER, TRY_LEAVE, TryCatch #0 {all -> 0x003d, blocks: (B:13:0x0038, B:25:0x0067, B:27:0x0073, B:32:0x0099, B:35:0x00c6, B:20:0x0052, B:23:0x005b), top: B:44:0x002a }] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x0071 -> B:39:0x00dc). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x00d8 -> B:38:0x00db). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        f fVar;
        List list;
        int size;
        int i5;
        List list2;
        n nVar;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i11 = fVar.f83555z;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                fVar.f83555z = i11 - Integer.MIN_VALUE;
            } else {
                fVar = new f(this, continuationImpl);
            }
        }
        Object obj = fVar.f83553x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = fVar.f83555z;
        Continuation continuation = null;
        Function1 function1 = this.f83564d;
        int i13 = 2;
        e1 e1Var = this.f83566f;
        try {
            if (i12 == 0) {
                ResultKt.b(obj);
                list = this.f83561a;
                size = list.size();
                i5 = 0;
                if (i5 < size) {
                }
            } else if (i12 == 1) {
                size = fVar.f83552w;
                i5 = fVar.f83551v;
                n nVar2 = fVar.f83550u;
                List list3 = fVar.f83549t;
                ResultKt.b(obj);
                nVar = nVar2;
                list2 = list3;
                if (obj == null) {
                }
            } else {
                if (i12 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                size = fVar.f83552w;
                i5 = fVar.f83551v;
                list2 = fVar.f83549t;
                ResultKt.b(obj);
                list = list2;
                i5++;
                if (i5 < size) {
                    n nVar3 = (n) list.get(i5);
                    if (nVar3.b() == i13) {
                        i50.c cVar = this.f83563c;
                        jx.v vVar = this.f83565e;
                        a1.c cVar2 = new a1.c(this, nVar3, continuation, 4);
                        fVar.f83549t = list;
                        fVar.f83550u = nVar3;
                        fVar.f83551v = i5;
                        fVar.f83552w = size;
                        fVar.f83555z = 1;
                        Object objW = cVar.w(nVar3, vVar, cVar2, fVar);
                        if (objW == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        list2 = list;
                        obj = objW;
                        nVar = nVar3;
                        if (obj == null) {
                            m0 m0Var = this.f83562b;
                            ((s2) e1Var).setValue(ps.f.u(m0Var.f83581d, obj, nVar, m0Var.f83579b, m0Var.f83580c));
                            return Unit.f71706a;
                        }
                        fVar.f83549t = list2;
                        fVar.f83550u = null;
                        fVar.f83551v = i5;
                        fVar.f83552w = size;
                        i13 = 2;
                        fVar.f83555z = 2;
                    }
                    i5++;
                    if (i5 < size) {
                        boolean zQ = t70.m0.q(fVar.getContext());
                        this.f83567g = false;
                        function1.invoke(new o0(((s2) e1Var).getValue(), zQ));
                        return Unit.f71706a;
                    }
                }
            }
        } finally {
            boolean zQ2 = t70.m0.q(fVar.getContext());
            this.f83567g = false;
            function1.invoke(new o0(((s2) e1Var).getValue(), zQ2));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(n nVar, ContinuationImpl continuationImpl) {
        g gVar;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.f83559w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f83559w = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, continuationImpl);
            }
        }
        Object obj = gVar.f83557u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar.f83559w;
        Continuation continuation = null;
        try {
            if (i11 != 0) {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                n nVar2 = gVar.f83556t;
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            pu.q qVar = new pu.q(this, nVar, continuation, 11);
            gVar.f83556t = nVar;
            gVar.f83559w = 1;
            Object objD = p2.d(15000L, qVar, gVar);
            return objD == coroutineSingletons ? coroutineSingletons : objD;
        } catch (CancellationException e3) {
            if (!t70.m0.q(gVar.getContext())) {
                throw e3;
            }
            return null;
        } catch (Exception e11) {
            t70.f0 f0Var = (t70.f0) gVar.getContext().get(t70.e0.f88787a);
            if (f0Var != null) {
                f0Var.handleException(gVar.getContext(), new IllegalStateException("Unable to load font " + nVar, e11));
            }
            return null;
        }
    }

    @Override // p1.y2
    public final Object getValue() {
        return ((s2) this.f83566f).getValue();
    }
}
