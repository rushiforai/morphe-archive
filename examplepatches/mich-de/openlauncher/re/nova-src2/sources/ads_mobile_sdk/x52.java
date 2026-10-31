package ads_mobile_sdk;

import android.content.Context;
import android.view.View;
import b.ed;
import b3.b1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import t70.s1;

/* loaded from: classes.dex */
public final class x52 extends c61 {

    /* renamed from: c, reason: collision with root package name */
    public final Context f11577c;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f11578d;

    /* renamed from: e, reason: collision with root package name */
    public final t70.j0 f11579e;

    /* renamed from: f, reason: collision with root package name */
    public final ci3 f11580f;

    /* renamed from: g, reason: collision with root package name */
    public final kz2 f11581g;

    /* renamed from: h, reason: collision with root package name */
    public final String f11582h;

    /* renamed from: i, reason: collision with root package name */
    public final s1 f11583i;

    /* renamed from: j, reason: collision with root package name */
    public final c10.a f11584j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x52(Context applicationContext, CoroutineContext uiContext, t70.j0 backgroundScope, ci3 traceLogger, kz2 rootTraceCreator, String gmaVersion) {
        super((wv0) null, 3);
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(gmaVersion, "gmaVersion");
        this.f11577c = applicationContext;
        this.f11578d = uiContext;
        this.f11579e = backgroundScope;
        this.f11580f = traceLogger;
        this.f11581g = rootTraceCreator;
        this.f11582h = gmaVersion;
        this.f11583i = m0.c();
        this.f11584j = c10.a.a("Google", gmaVersion);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(x52 x52Var, ContinuationImpl continuationImpl) {
        p52 p52Var;
        if (continuationImpl instanceof p52) {
            p52Var = (p52) continuationImpl;
            int i5 = p52Var.f8102c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                p52Var.f8102c = i5 - Integer.MIN_VALUE;
            } else {
                p52Var = new p52(x52Var, continuationImpl);
            }
        }
        Object obj = p52Var.f8100a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = p52Var.f8102c;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            ci3 ci3Var = x52Var.f11580f;
            c0.g0 g0Var = new c0.g0(x52Var, continuation, 2);
            p52Var.f8102c = 1;
            ci3Var.getClass();
            if (ci3.a(ci3Var, "ActivateOmid", g0Var, p52Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        if (!ed.f15830r.f17888a) {
            zi3.a(6, "OMSDK failed to activate.", null);
        }
        return Unit.f71706a;
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        androidx.room.q qVar = new androidx.room.q(this, (Continuation) null, 15);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f11579e;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(qVar, null), 2);
        return new xu0(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(x52 x52Var, tx0 tx0Var, ha2 ha2Var, q31 q31Var, d00 d00Var, ha2 ha2Var2, String str, ContinuationImpl continuationImpl) {
        h52 h52Var;
        x52 x52Var2;
        ha2 ha2Var3;
        tx0 tx0Var2;
        ha2 ha2Var4;
        String str2;
        if (continuationImpl instanceof h52) {
            h52Var = (h52) continuationImpl;
            int i5 = h52Var.f4228j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h52Var.f4228j = i5 - Integer.MIN_VALUE;
            } else {
                h52Var = new h52(x52Var, continuationImpl);
            }
        }
        Object obj = h52Var.f4226h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h52Var.f4228j;
        if (i11 == 0) {
            ResultKt.b(obj);
            s1 s1Var = x52Var.f11583i;
            h52Var.f4219a = x52Var;
            h52Var.f4220b = tx0Var;
            h52Var.f4221c = ha2Var;
            h52Var.f4222d = q31Var;
            h52Var.f4223e = d00Var;
            h52Var.f4224f = ha2Var2;
            h52Var.f4225g = str;
            h52Var.f4228j = 1;
            if (s1Var.K(h52Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            x52Var2 = x52Var;
            ha2Var3 = ha2Var;
            tx0Var2 = tx0Var;
            ha2Var4 = ha2Var2;
            str2 = str;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            String str3 = h52Var.f4225g;
            ha2 ha2Var5 = h52Var.f4224f;
            d00Var = h52Var.f4223e;
            q31Var = h52Var.f4222d;
            ha2 ha2Var6 = h52Var.f4221c;
            tx0 tx0Var3 = h52Var.f4220b;
            x52 x52Var3 = h52Var.f4219a;
            ResultKt.b(obj);
            str2 = str3;
            ha2Var4 = ha2Var5;
            ha2Var3 = ha2Var6;
            x52Var2 = x52Var3;
            tx0Var2 = tx0Var3;
        }
        if (!ed.f15830r.f17888a) {
            return null;
        }
        q31 q31Var2 = q31Var;
        return x52Var2.f11580f.b("CreateOmidSession", new i52(x52Var2, tx0Var2, str2, d00Var, q31Var2, ha2Var3, ha2Var4));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(x52 x52Var, tx0 tx0Var, String str, String str2, d00 d00Var, q31 q31Var, ha2 ha2Var, ha2 ha2Var2, ContinuationImpl continuationImpl) {
        k52 k52Var;
        String str3;
        d00 d00Var2;
        q31 q31Var2;
        ha2 ha2Var3;
        tx0 tx0Var2;
        String str4;
        x52 x52Var2;
        ha2 ha2Var4;
        if (continuationImpl instanceof k52) {
            k52Var = (k52) continuationImpl;
            int i5 = k52Var.f5518k;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k52Var.f5518k = i5 - Integer.MIN_VALUE;
            } else {
                k52Var = new k52(x52Var, continuationImpl);
            }
        }
        Object obj = k52Var.f5516i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k52Var.f5518k;
        if (i11 == 0) {
            ResultKt.b(obj);
            s1 s1Var = x52Var.f11583i;
            k52Var.f5508a = x52Var;
            k52Var.f5509b = tx0Var;
            k52Var.f5510c = str;
            k52Var.f5511d = str2;
            k52Var.f5512e = d00Var;
            k52Var.f5513f = q31Var;
            k52Var.f5514g = ha2Var;
            k52Var.f5515h = ha2Var2;
            k52Var.f5518k = 1;
            if (s1Var.K(k52Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            str3 = str2;
            d00Var2 = d00Var;
            q31Var2 = q31Var;
            ha2Var3 = ha2Var;
            tx0Var2 = tx0Var;
            str4 = str;
            x52Var2 = x52Var;
            ha2Var4 = ha2Var2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ha2Var4 = k52Var.f5515h;
            ha2 ha2Var5 = k52Var.f5514g;
            q31 q31Var3 = k52Var.f5513f;
            d00 d00Var3 = k52Var.f5512e;
            str3 = k52Var.f5511d;
            String str5 = k52Var.f5510c;
            tx0 tx0Var3 = k52Var.f5509b;
            x52 x52Var3 = k52Var.f5508a;
            ResultKt.b(obj);
            ha2Var3 = ha2Var5;
            q31Var2 = q31Var3;
            x52Var2 = x52Var3;
            str4 = str5;
            d00Var2 = d00Var3;
            tx0Var2 = tx0Var3;
        }
        if (!ed.f15830r.f17888a) {
            return null;
        }
        return x52Var2.f11580f.b("CreateJavascriptAdSession", new l52(str4, x52Var2, tx0Var2, str3, d00Var2, q31Var2, ha2Var3, ha2Var4));
    }

    public final Unit a(b.v3 adSession, View view) {
        Intrinsics.g(adSession, "adSession");
        Intrinsics.g(view, "view");
        return (Unit) this.f11580f.b("RegisterOmidAdView", new b1(2, adSession, view));
    }
}
