package u2;

import androidx.compose.ui.Modifier$Node;
import b3.u2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import t70.j0;
import t70.k0;
import x7.h;
import y3.r;

/* loaded from: classes.dex */
public final class f extends Modifier$Node implements u2, a {

    /* renamed from: a, reason: collision with root package name */
    public a f90452a;

    /* renamed from: b, reason: collision with root package name */
    public h f90453b;

    /* renamed from: c, reason: collision with root package name */
    public f f90454c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90455d;

    public f(a aVar, h hVar) {
        this.f90452a = aVar;
        this.f90453b = hVar == null ? new h(9) : hVar;
        this.f90455d = "androidx.compose.ui.input.nestedscroll.NestedScrollNode";
    }

    public final j0 B() {
        f fVar = getIsAttached() ? (f) t2.c.t(this) : null;
        j0 j0VarB = fVar != null ? fVar.B() : null;
        if (j0VarB != null && k0.f(j0VarB)) {
            return j0VarB;
        }
        j0 j0Var = (j0) this.f90453b.f95140e;
        if (j0Var != null) {
            return j0Var;
        }
        throw new IllegalStateException("in order to access nested coroutine scope you need to attach dispatcher to the `Modifier.nestedScroll` first.");
    }

    @Override // b3.u2
    public final Object a() {
        return this.f90455d;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // u2.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(long j11, long j12, Continuation continuation) {
        d dVar;
        long j13;
        long j14;
        long j15;
        f fVar;
        long j16;
        long j17;
        if (continuation instanceof d) {
            dVar = (d) continuation;
            int i5 = dVar.f90447x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f90447x = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, (ContinuationImpl) continuation);
            }
        }
        d dVar2 = dVar;
        Object objB = dVar2.f90445v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar2.f90447x;
        if (i11 == 0) {
            ResultKt.b(objB);
            a aVar = this.f90452a;
            dVar2.f90443t = j11;
            dVar2.f90444u = j12;
            dVar2.f90447x = 1;
            objB = aVar.b(j11, j12, dVar2);
            if (objB != coroutineSingletons) {
                j13 = j11;
                j14 = j12;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j17 = dVar2.f90443t;
            ResultKt.b(objB);
            j16 = ((r) objB).j();
            j15 = j17;
            return r.a(r.g(j15, j16));
        }
        j14 = dVar2.f90444u;
        j13 = dVar2.f90443t;
        ResultKt.b(objB);
        j15 = ((r) objB).j();
        if (getIsAttached()) {
            fVar = null;
            if (getIsAttached() && getIsAttached()) {
                fVar = (f) t2.c.t(this);
            }
        } else {
            fVar = this.f90454c;
        }
        if (fVar == null) {
            j16 = 0;
            return r.a(r.g(j15, j16));
        }
        long jG = r.g(j13, j15);
        long jF = r.f(j14, j15);
        dVar2.f90443t = j15;
        dVar2.f90447x = 2;
        objB = fVar.b(jG, jF, dVar2);
        if (objB != coroutineSingletons) {
            j17 = j15;
            j16 = ((r) objB).j();
            j15 = j17;
            return r.a(r.g(j15, j16));
        }
        return coroutineSingletons;
    }

    @Override // u2.a
    public final long g(int i5, long j11) {
        f fVar = null;
        if (getIsAttached() && getIsAttached()) {
            fVar = (f) t2.c.t(this);
        }
        long jG = fVar != null ? fVar.g(i5, j11) : 0L;
        return h2.b.g(jG, this.f90452a.g(i5, h2.b.f(j11, jG)));
    }

    @Override // u2.a
    public final long m(int i5, long j11, long j12) {
        long jM = this.f90452a.m(i5, j11, j12);
        f fVar = null;
        if (getIsAttached() && getIsAttached()) {
            fVar = (f) t2.c.t(this);
        }
        f fVar2 = fVar;
        return h2.b.g(jM, fVar2 != null ? fVar2.m(i5, h2.b.g(j11, jM), h2.b.f(j12, jM)) : 0L);
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        h hVar = this.f90453b;
        hVar.f95137b = this;
        hVar.f95138c = null;
        this.f90454c = null;
        hVar.f95139d = new a3.e(this, 27);
        hVar.f95140e = getCoroutineScope();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        t2.c.R(this, new g(objectRef));
        f fVar = (f) ((u2) objectRef.f71863a);
        this.f90454c = fVar;
        h hVar = this.f90453b;
        hVar.f95138c = fVar;
        if (((f) hVar.f95137b) == this) {
            hVar.f95137b = null;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x005d, code lost:
    
        if (r11 == r1) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x007b, code lost:
    
        if (r11 != r1) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x007d, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // u2.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object t(long j11, Continuation continuation) {
        e eVar;
        long j12;
        long j13;
        if (continuation instanceof e) {
            eVar = (e) continuation;
            int i5 = eVar.f90451w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f90451w = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, (ContinuationImpl) continuation);
            }
        }
        Object objT = eVar.f90449u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f90451w;
        if (i11 == 0) {
            ResultKt.b(objT);
            f fVar = null;
            if (getIsAttached() && getIsAttached()) {
                fVar = (f) t2.c.t(this);
            }
            if (fVar != null) {
                eVar.f90448t = j11;
                eVar.f90451w = 1;
                objT = fVar.t(j11, eVar);
            } else {
                j12 = 0;
                long j14 = j12;
                long j15 = j11;
                j13 = j14;
                a aVar = this.f90452a;
                long jF = r.f(j15, j13);
                eVar.f90448t = j13;
                eVar.f90451w = 2;
                objT = aVar.t(jF, eVar);
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                j13 = eVar.f90448t;
                ResultKt.b(objT);
                return r.a(r.g(j13, ((r) objT).j()));
            }
            j11 = eVar.f90448t;
            ResultKt.b(objT);
        }
        j12 = ((r) objT).j();
        long j142 = j12;
        long j152 = j11;
        j13 = j142;
        a aVar2 = this.f90452a;
        long jF2 = r.f(j152, j13);
        eVar.f90448t = j13;
        eVar.f90451w = 2;
        objT = aVar2.t(jF2, eVar);
    }
}
