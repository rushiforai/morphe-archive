package lw;

import c3.b2;
import f1.c3;
import fr.b0;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.p1;
import w70.u1;

/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final c3 f75147a;

    /* renamed from: b, reason: collision with root package name */
    public final d f75148b;

    /* renamed from: c, reason: collision with root package name */
    public g f75149c;

    public l(c3 modalBottomSheetState, d keyboardHandler) {
        Intrinsics.g(modalBottomSheetState, "modalBottomSheetState");
        Intrinsics.g(keyboardHandler, "keyboardHandler");
        this.f75147a = modalBottomSheetState;
        this.f75148b = keyboardHandler;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Enum a(ContinuationImpl continuationImpl) {
        h hVar;
        l lVar;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i5 = hVar.f75135w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f75135w = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object obj = hVar.f75133u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar.f75135w;
        if (i11 == 0) {
            ResultKt.b(obj);
            p1 p1VarN = androidx.compose.runtime.d.n(new f(this, 0));
            c cVar = new c(2, (Continuation) null, 1);
            hVar.f75132t = this;
            hVar.f75135w = 1;
            if (u1.p(p1VarN, cVar, hVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            lVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            lVar = hVar.f75132t;
            ResultKt.b(obj);
        }
        g gVar = lVar.f75149c;
        return gVar == null ? g.f75130b : gVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x009c, code lost:
    
        if (zg.a.p(10, r7, r0) == r1) goto L36;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        i iVar;
        Object objP;
        l lVar;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f75139w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f75139w = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuationImpl);
            }
        }
        Object obj = iVar.f75137u;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = iVar.f75139w;
        Continuation continuation = null;
        int i12 = 2;
        if (i11 == 0) {
            ResultKt.b(obj);
            this.f75149c = g.f75129a;
            iVar.f75136t = this;
            iVar.f75139w = 1;
            d dVar = this.f75148b;
            if (((Boolean) dVar.f75123b.getValue()).booleanValue()) {
                c3.c3 c3Var = dVar.f75122a;
                if (c3Var != null) {
                    ((b2) c3Var).a();
                }
                objP = u1.p(androidx.compose.runtime.d.n(new b0(dVar, 27)), new c(i12, continuation, 0), iVar);
                if (objP != obj2) {
                    objP = Unit.f71706a;
                }
                if (objP != obj2) {
                    objP = Unit.f71706a;
                }
            } else {
                objP = Unit.f71706a;
            }
            if (objP != obj2) {
                lVar = this;
            }
            return obj2;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        lVar = iVar.f75136t;
        ResultKt.b(obj);
        if (!lVar.f75147a.c()) {
            return Unit.f71706a;
        }
        j jVar = new j(lVar, continuation, 0);
        iVar.f75136t = null;
        iVar.f75139w = 2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0068, code lost:
    
        if (w70.u1.p(r7, r2, r0) == r1) goto L22;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) {
        k kVar;
        l lVar;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f75146w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f75146w = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuationImpl);
            }
        }
        Object obj = kVar.f75144u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar.f75146w;
        Continuation continuation = null;
        int i12 = 2;
        if (i11 == 0) {
            ResultKt.b(obj);
            j jVar = new j(this, continuation, 1);
            kVar.f75143t = this;
            kVar.f75146w = 1;
            if (zg.a.p(10, jVar, kVar) != coroutineSingletons) {
                lVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        lVar = kVar.f75143t;
        ResultKt.b(obj);
        p1 p1VarN = androidx.compose.runtime.d.n(new f(lVar, 1));
        c cVar = new c(i12, continuation, 2);
        kVar.f75143t = null;
        kVar.f75146w = 2;
    }
}
