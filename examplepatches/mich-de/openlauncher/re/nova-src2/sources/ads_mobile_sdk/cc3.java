package ads_mobile_sdk;

import b.x2;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes2.dex */
public abstract class cc3 extends c61 implements x2 {

    /* renamed from: c, reason: collision with root package name */
    public b.a1 f1810c;

    public cc3(wv0 wv0Var) {
        super(wv0Var, 2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(cc3 cc3Var, ContinuationImpl continuationImpl) {
        bc3 bc3Var;
        if (continuationImpl instanceof bc3) {
            bc3Var = (bc3) continuationImpl;
            int i5 = bc3Var.f1373d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bc3Var.f1373d = i5 - Integer.MIN_VALUE;
            } else {
                bc3Var = new bc3(cc3Var, continuationImpl);
            }
        }
        Object objD = bc3Var.f1371b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bc3Var.f1373d;
        if (i11 == 0) {
            ResultKt.b(objD);
            bc3Var.f1370a = cc3Var;
            bc3Var.f1373d = 1;
            objD = cc3Var.d(bc3Var);
            if (objD == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            cc3Var = bc3Var.f1370a;
            ResultKt.b(objD);
        }
        cc3Var.f1810c = (b.a1) objD;
        return new xu0(Unit.f71706a);
    }

    @Override // b.x2
    public final Object c(Continuation continuation) {
        WeakHashMap weakHashMap = ji3.f5253a;
        th3 th3VarA = ji3.a(wv0.CUI_NAME_SIGNAL, EmptyList.f71733a, true);
        try {
            ji3.a().e().f1804t = new u73(a(), 4);
            b.a1 a1Var = this.f1810c;
            if (a1Var == null) {
                Intrinsics.m("result");
                throw null;
            }
            if (a1Var instanceof pu0) {
                zi3.a((pu0) a1Var, false);
            }
            th3VarA.close();
            return a1Var;
        } catch (Throwable th2) {
            try {
                th3VarA.b(th2);
                if (th2 instanceof b.a4) {
                    throw th2;
                }
                if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                    th3VarA.a(th2);
                }
                if (th2 instanceof TimeoutCancellationException) {
                    throw new lw0(th2);
                }
                if (th2 instanceof CancellationException) {
                    throw new du0(th2);
                }
                if (th2 instanceof dv0) {
                    throw th2;
                }
                throw new iu0(th2);
            } finally {
            }
        }
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        return a(this, (ContinuationImpl) continuation);
    }
}
