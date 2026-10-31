package ads_mobile_sdk;

import c80.d;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class kl implements b.w5 {

    /* renamed from: a, reason: collision with root package name */
    public final b.c7 f5762a;

    /* renamed from: b, reason: collision with root package name */
    public final d f5763b;

    /* renamed from: c, reason: collision with root package name */
    public Boolean f5764c;

    public kl(t70.j0 uiScope, b.c7 refreshListener) {
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(refreshListener, "refreshListener");
        this.f5762a = refreshListener;
        this.f5763b = new d();
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x008e, code lost:
    
        if (r7.a(false, r0) == r1) goto L47;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v4, types: [c80.a] */
    @Override // b.w5
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, Continuation continuation) throws Throwable {
        jl jlVar;
        d dVar;
        kl klVar;
        c80.a aVar;
        kl klVar2;
        if (continuation instanceof jl) {
            jlVar = (jl) continuation;
            int i5 = jlVar.f5295f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jlVar.f5295f = i5 - Integer.MIN_VALUE;
            } else {
                jlVar = new jl(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = jlVar.f5293d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jlVar.f5295f;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                jlVar.f5290a = this;
                dVar = this.f5763b;
                jlVar.f5291b = dVar;
                jlVar.f5292c = z11;
                jlVar.f5295f = 1;
                if (dVar.e(jlVar) != coroutineSingletons) {
                    klVar = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2 && i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                z11 = jlVar.f5292c;
                aVar = jlVar.f5291b;
                klVar2 = jlVar.f5290a;
                try {
                    ResultKt.b(obj);
                    klVar2.f5764c = Boolean.valueOf(z11);
                    Unit unit = Unit.f71706a;
                    ((d) aVar).g(null);
                    return unit;
                } catch (Throwable th2) {
                    th = th2;
                    ((d) aVar).g(null);
                    throw th;
                }
            }
            z11 = jlVar.f5292c;
            ?? r22 = jlVar.f5291b;
            klVar = jlVar.f5290a;
            ResultKt.b(obj);
            dVar = r22;
            Boolean bool = klVar.f5764c;
            b.c7 c7Var = klVar.f5762a;
            if (bool != null) {
                if (z11) {
                    jlVar.f5290a = klVar;
                    jlVar.f5291b = dVar;
                    jlVar.f5292c = z11;
                    jlVar.f5295f = 2;
                    if (c7Var.b(false, jlVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    jlVar.f5290a = klVar;
                    jlVar.f5291b = dVar;
                    jlVar.f5292c = z11;
                    jlVar.f5295f = 3;
                }
            }
            aVar = dVar;
            klVar2 = klVar;
            klVar2.f5764c = Boolean.valueOf(z11);
            Unit unit2 = Unit.f71706a;
            ((d) aVar).g(null);
            return unit2;
        } catch (Throwable th3) {
            th = th3;
            aVar = dVar;
            ((d) aVar).g(null);
            throw th;
        }
    }
}
