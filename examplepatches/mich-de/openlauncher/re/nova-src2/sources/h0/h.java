package h0;

import c0.l1;
import c0.y;
import g0.d2;
import g0.m0;
import g0.n1;
import g0.p1;
import g0.u2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class h implements m0 {

    /* renamed from: a, reason: collision with root package name */
    public final b f58740a;

    /* renamed from: b, reason: collision with root package name */
    public final y f58741b;

    /* renamed from: c, reason: collision with root package name */
    public final l1 f58742c;

    /* renamed from: d, reason: collision with root package name */
    public final p1 f58743d = androidx.compose.foundation.gestures.a.f13931c;

    public h(b bVar, y yVar, l1 l1Var) {
        this.f58740a = bVar;
        this.f58741b = yVar;
        this.f58742c = l1Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(h hVar, n1 n1Var, float f11, float f12, d dVar, ContinuationImpl continuationImpl) {
        g gVar;
        Object objA;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.f58739v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f58739v = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(hVar, continuationImpl);
            }
        }
        g gVar2 = gVar;
        Object obj = gVar2.f58737t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar2.f58739v;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (Math.abs(f11) == 0.0f || Math.abs(f12) == 0.0f) {
                return c0.f.b(28, f11, f12);
            }
            gVar2.f58739v = 1;
            y yVar = hVar.f58741b;
            gu.j jVar = Math.abs(c0.f.c(yVar, f12)) >= Math.abs(f11) ? new gu.j(yVar, 1) : new gu.j(hVar.f58742c, 2);
            Float f13 = new Float(f11);
            Float f14 = new Float(f12);
            switch (jVar.f57835a) {
                case 1:
                    objA = l.a(n1Var, f13.floatValue(), c0.f.b(28, 0.0f, f14.floatValue()), (y) jVar.f57836b, dVar, gVar2);
                    if (objA != CoroutineSingletons.f71806a) {
                        objA = (a) objA;
                        break;
                    }
                    break;
                default:
                    float fFloatValue = f13.floatValue();
                    float fFloatValue2 = f14.floatValue();
                    objA = l.b(n1Var, Math.signum(fFloatValue2) * Math.abs(fFloatValue), fFloatValue, c0.f.b(28, 0.0f, fFloatValue2), (l1) jVar.f57836b, dVar, gVar2);
                    if (objA != CoroutineSingletons.f71806a) {
                        objA = (a) objA;
                        break;
                    }
                    break;
            }
            obj = objA;
            if (obj == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return ((a) obj).f58718b;
    }

    @Override // g0.m0
    public Object a(d2 d2Var, float f11, Continuation continuation) {
        return d(d2Var, f11, u2.f56720a, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(n1 n1Var, float f11, Function1 function1, ContinuationImpl continuationImpl) throws Throwable {
        c cVar;
        Function1 function12;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f58724w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f58724w = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object objY = cVar.f58722u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f58724w;
        if (i11 == 0) {
            ResultKt.b(objY);
            e eVar = new e(this, f11, function1, n1Var, null);
            cVar.f58721t = function1;
            cVar.f58724w = 1;
            objY = t70.m0.y(this.f58743d, eVar, cVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
            function12 = function1;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            function12 = cVar.f58721t;
            ResultKt.b(objY);
        }
        a aVar = (a) objY;
        function12.invoke(new Float(0.0f));
        return aVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(n1 n1Var, float f11, Function1 function1, ContinuationImpl continuationImpl) throws Throwable {
        f fVar;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i5 = fVar.f58736v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f58736v = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(this, continuationImpl);
            }
        }
        Object objC = fVar.f58734t;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = fVar.f58736v;
        if (i11 == 0) {
            ResultKt.b(objC);
            fVar.f58736v = 1;
            objC = c(n1Var, f11, function1, fVar);
            if (objC == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objC);
        }
        a aVar = (a) objC;
        return new Float(aVar.f58717a.floatValue() != 0.0f ? ((Number) aVar.f58718b.a()).floatValue() : 0.0f);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return hVar.f58742c.equals(this.f58742c) && Intrinsics.b(hVar.f58741b, this.f58741b) && hVar.f58740a.equals(this.f58740a);
    }

    public final int hashCode() {
        return this.f58740a.hashCode() + ((this.f58741b.hashCode() + (this.f58742c.hashCode() * 31)) * 31);
    }
}
