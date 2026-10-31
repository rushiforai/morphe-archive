package l1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class t2 {

    /* renamed from: a, reason: collision with root package name */
    public float f73991a;

    /* renamed from: b, reason: collision with root package name */
    public float f73992b;

    /* renamed from: c, reason: collision with root package name */
    public float f73993c;

    /* renamed from: d, reason: collision with root package name */
    public float f73994d;

    /* renamed from: e, reason: collision with root package name */
    public final c0.e f73995e;

    /* renamed from: f, reason: collision with root package name */
    public i0.h f73996f;

    /* renamed from: g, reason: collision with root package name */
    public i0.h f73997g;

    public t2(float f11, float f12, float f13, float f14) {
        this.f73991a = f11;
        this.f73992b = f12;
        this.f73993c = f13;
        this.f73994d = f14;
        this.f73995e = new c0.e(new y3.f(f11), c0.f.f18786k, null, 12);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(i0.h hVar, ContinuationImpl continuationImpl) throws Throwable {
        r2 r2Var;
        t2 t2Var;
        c0.e eVar = this.f73995e;
        if (continuationImpl instanceof r2) {
            r2Var = (r2) continuationImpl;
            int i5 = r2Var.f73899x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                r2Var.f73899x = i5 - Integer.MIN_VALUE;
            } else {
                r2Var = new r2(this, continuationImpl);
            }
        }
        Object obj = r2Var.f73897v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = r2Var.f73899x;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            hVar = r2Var.f73896u;
            t2Var = r2Var.f73895t;
            try {
                ResultKt.b(obj);
                t2Var.f73996f = hVar;
                return Unit.f71706a;
            } catch (Throwable th2) {
                th = th2;
                t2Var.f73996f = hVar;
                throw th;
            }
        }
        ResultKt.b(obj);
        float f11 = hVar instanceof i0.k ? this.f73992b : hVar instanceof i0.f ? this.f73993c : hVar instanceof i0.d ? this.f73994d : this.f73991a;
        this.f73997g = hVar;
        try {
            if (!y3.f.a(((y3.f) ((p1.s2) eVar.f18758e).getValue()).f96602a, f11)) {
                i0.h hVar2 = this.f73996f;
                r2Var.f73895t = this;
                r2Var.f73896u = hVar;
                r2Var.f73899x = 1;
                if (m1.u.a(eVar, f11, hVar2, hVar, r2Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            t2Var = this;
            t2Var.f73996f = hVar;
            return Unit.f71706a;
        } catch (Throwable th3) {
            th = th3;
            t2Var = this;
            t2Var.f73996f = hVar;
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) throws Throwable {
        s2 s2Var;
        t2 t2Var;
        if (continuationImpl instanceof s2) {
            s2Var = (s2) continuationImpl;
            int i5 = s2Var.f73936w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                s2Var.f73936w = i5 - Integer.MIN_VALUE;
            } else {
                s2Var = new s2(this, continuationImpl);
            }
        }
        Object obj = s2Var.f73934u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = s2Var.f73936w;
        if (i11 == 0) {
            ResultKt.b(obj);
            i0.h hVar = this.f73997g;
            float f11 = hVar instanceof i0.k ? this.f73992b : hVar instanceof i0.f ? this.f73993c : hVar instanceof i0.d ? this.f73994d : this.f73991a;
            c0.e eVar = this.f73995e;
            if (!y3.f.a(((y3.f) ((p1.s2) eVar.f18758e).getValue()).f96602a, f11)) {
                try {
                    y3.f fVar = new y3.f(f11);
                    s2Var.f73933t = this;
                    s2Var.f73936w = 1;
                    if (eVar.g(fVar, s2Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    t2Var = this;
                    t2Var.f73996f = t2Var.f73997g;
                } catch (Throwable th2) {
                    th = th2;
                    t2Var = this;
                    t2Var.f73996f = t2Var.f73997g;
                    throw th;
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            t2Var = s2Var.f73933t;
            try {
                ResultKt.b(obj);
                t2Var.f73996f = t2Var.f73997g;
            } catch (Throwable th3) {
                th = th3;
                t2Var.f73996f = t2Var.f73997g;
                throw th;
            }
        }
        return Unit.f71706a;
    }
}
