package ads_mobile_sdk;

import android.content.Context;
import android.content.res.Resources;
import cw.q1;
import java.util.LinkedHashMap;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.k0;
import t70.p2;

/* loaded from: classes2.dex */
public final class wt1 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f11384a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f11385b;

    /* renamed from: c, reason: collision with root package name */
    public final jx1 f11386c;

    /* renamed from: d, reason: collision with root package name */
    public final c7 f11387d;

    /* renamed from: e, reason: collision with root package name */
    public final ui.q f11388e;

    /* renamed from: f, reason: collision with root package name */
    public final jr0 f11389f;

    /* renamed from: g, reason: collision with root package name */
    public final ci3 f11390g;

    public wt1(Context context, CoroutineContext backgroundContext, jx1 nativeAssetsLoader, c7 nativeCustomAssetsLoader, ui.q nativeRequest, jr0 flags, ci3 traceLogger) {
        Intrinsics.g(context, "context");
        Intrinsics.g(backgroundContext, "backgroundContext");
        Intrinsics.g(nativeAssetsLoader, "nativeAssetsLoader");
        Intrinsics.g(nativeCustomAssetsLoader, "nativeCustomAssetsLoader");
        Intrinsics.g(nativeRequest, "nativeRequest");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(traceLogger, "traceLogger");
        this.f11384a = context;
        this.f11385b = backgroundContext;
        this.f11386c = nativeAssetsLoader;
        this.f11387d = nativeCustomAssetsLoader;
        this.f11388e = nativeRequest;
        this.f11389f = flags;
        this.f11390g = traceLogger;
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x009c A[Catch: all -> 0x00a8, TryCatch #2 {all -> 0x00a8, blocks: (B:40:0x0095, B:42:0x009c, B:44:0x00a0, B:46:0x00a4, B:49:0x00aa, B:51:0x00ae, B:53:0x00b2, B:55:0x00b6, B:56:0x00b7, B:57:0x00bc, B:58:0x00bd, B:59:0x00c4, B:60:0x00c5, B:61:0x00cc, B:62:0x00cd), top: B:71:0x0095 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00cd A[Catch: all -> 0x00a8, TRY_LEAVE, TryCatch #2 {all -> 0x00a8, blocks: (B:40:0x0095, B:42:0x009c, B:44:0x00a0, B:46:0x00a4, B:49:0x00aa, B:51:0x00ae, B:53:0x00b2, B:55:0x00b6, B:56:0x00b7, B:57:0x00bc, B:58:0x00bd, B:59:0x00c4, B:60:0x00c5, B:61:0x00cc, B:62:0x00cd), top: B:71:0x0095 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(wt1 wt1Var, it1 it1Var, tx0 tx0Var, ContinuationImpl continuationImpl) {
        ut1 ut1Var;
        th3 th3VarA;
        TimeoutCancellationException th2;
        th3 th3Var;
        TimeoutCancellationException e3;
        if (continuationImpl instanceof ut1) {
            ut1Var = (ut1) continuationImpl;
            int i5 = ut1Var.f10484e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ut1Var.f10484e = i5 - Integer.MIN_VALUE;
            } else {
                ut1Var = new ut1(wt1Var, continuationImpl);
            }
        }
        Object obj = ut1Var.f10482c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ut1Var.f10484e;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            WeakHashMap weakHashMap = ji3.f5253a;
            th3VarA = ji3.a(wv0.CUI_NAME_LOAD_NATIVE_IMMERSIVE_VIDEO_MEDIA_DATA, EmptyList.f71733a, true);
            try {
                sy0 sy0VarD = tx0Var.d();
                if (sy0VarD == null) {
                    throw new dv0(new tu0("Video controller is null.", wd1.f11213a));
                }
                try {
                    long jY = wt1Var.f11389f.Y();
                    b00.e eVar = new b00.e(sy0VarD, it1Var, continuation, 21);
                    ut1Var.f10480a = th3VarA;
                    ut1Var.f10481b = th3VarA;
                    ut1Var.f10484e = 1;
                    if (p2.c(jY, eVar, ut1Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    th3Var = th3VarA;
                    Unit unit = Unit.f71706a;
                    CloseableKt.a(th3Var, null);
                    return unit;
                } catch (TimeoutCancellationException e11) {
                    e3 = e11;
                    throw new dv0(new qu0(e3, wd1.f11222j, "Immersive video media data timed out."));
                }
            } catch (Throwable th3) {
                th2 = th3;
                th3Var = th3VarA;
                th3VarA.b(th2);
                if (!(th2 instanceof b.a4)) {
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var = ut1Var.f10481b;
            try {
                try {
                    ResultKt.b(obj);
                    Unit unit2 = Unit.f71706a;
                    CloseableKt.a(th3Var, null);
                    return unit2;
                } catch (TimeoutCancellationException e12) {
                    e3 = e12;
                    throw new dv0(new qu0(e3, wd1.f11222j, "Immersive video media data timed out."));
                }
            } catch (Throwable th4) {
                th2 = th4;
                th3VarA = ut1Var.f10480a;
                try {
                    th3VarA.b(th2);
                    if (!(th2 instanceof b.a4)) {
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
    }

    /* JADX WARN: Removed duplicated region for block: B:89:0x0177  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x017a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(z1 z1Var, com.google.gson.r rVar, eg2 eg2Var, ContinuationImpl continuationImpl) throws Resources.NotFoundException {
        kt1 kt1Var;
        b.a1 xu0Var;
        String strO;
        String strO2;
        String strO3;
        String strO4;
        String strO5;
        String strO6;
        String string;
        it1 it1Var;
        if (continuationImpl instanceof kt1) {
            kt1Var = (kt1) continuationImpl;
            int i5 = kt1Var.f5967d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kt1Var.f5967d = i5 - Integer.MIN_VALUE;
            } else {
                kt1Var = new kt1(this, continuationImpl);
            }
        }
        kt1 kt1Var2 = kt1Var;
        Object obj = kt1Var2.f5965b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kt1Var2.f5967d;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                it1 it1Var2 = new it1();
                String strA = d62.a(rVar, "extra_response_info", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                if (strA.length() > 0) {
                    try {
                        it1Var2.f4952w = p7.u.T(strA).j();
                    } catch (Exception e3) {
                        this.f11390g.a("Failed to parse extra_response_info", (Throwable) e3);
                    }
                }
                int iA = d62.a(rVar, "template_id", -1);
                it1Var2.f4932a = iA;
                if (iA == 3) {
                    it1Var2.f4933b = gt1.f4063b;
                } else if (iA != 6) {
                    xu0Var = new tu0("Invalid native ad template id!");
                    if (!(xu0Var instanceof pu0)) {
                        return (pu0) xu0Var;
                    }
                    q1 q1Var = new q1(eg2Var, it1Var2, this, rVar, null);
                    kt1Var2.f5964a = it1Var2;
                    kt1Var2.f5967d = 1;
                    if (k0.d(q1Var, kt1Var2) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    it1Var = it1Var2;
                } else {
                    it1Var2.f4933b = gt1.f4062a;
                }
                com.google.gson.p pVarV = rVar.v("custom_template_id");
                String strO7 = pVarV != null ? pVarV.o() : null;
                it1Var2.f4934c = strO7;
                if (it1Var2.f4933b == gt1.f4063b && strO7 == null) {
                    xu0Var = new tu0("No custom template id for custom template ad response.");
                } else {
                    it1Var2.f4936e = Double.valueOf(Double.parseDouble(d62.a(rVar, "rating", "-1.0")));
                    com.google.gson.p pVarV2 = rVar.v("headline");
                    String strO8 = pVarV2 != null ? pVarV2.o() : null;
                    if (z1Var.f12372c0) {
                        int i12 = he3.f4369a;
                        Context context = this.f11384a;
                        Intrinsics.g(context, "context");
                        try {
                            string = context.getResources().getString(2132020115);
                            Intrinsics.d(string);
                        } catch (Resources.NotFoundException unused) {
                            string = "Test Ad";
                        }
                        strO8 = b.u4.m(string, ": ", strO8);
                    }
                    LinkedHashMap linkedHashMap = it1Var2.f4935d;
                    if (strO8 != null) {
                        linkedHashMap.put("headline", strO8);
                    }
                    com.google.gson.p pVarV3 = rVar.v("body");
                    if (pVarV3 != null && (strO6 = pVarV3.o()) != null) {
                        linkedHashMap.put("body", strO6);
                    }
                    com.google.gson.p pVarV4 = rVar.v("call_to_action");
                    if (pVarV4 != null && (strO5 = pVarV4.o()) != null) {
                        linkedHashMap.put("call_to_action", strO5);
                    }
                    com.google.gson.p pVarV5 = rVar.v("store");
                    if (pVarV5 != null && (strO4 = pVarV5.o()) != null) {
                        linkedHashMap.put("store", strO4);
                    }
                    com.google.gson.p pVarV6 = rVar.v("price");
                    if (pVarV6 != null && (strO3 = pVarV6.o()) != null) {
                        linkedHashMap.put("price", strO3);
                    }
                    com.google.gson.p pVarV7 = rVar.v("advertiser");
                    if (pVarV7 != null && (strO2 = pVarV7.o()) != null) {
                        linkedHashMap.put("advertiser", strO2);
                    }
                    com.google.gson.p pVarV8 = rVar.v("creative_summary");
                    if (pVarV8 != null && (strO = pVarV8.o()) != null) {
                        linkedHashMap.put("creative_summary", strO);
                    }
                    String strA2 = d62.a(rVar, "app_id", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                    if (strA2.length() > 0) {
                        linkedHashMap.put("package_name", strA2);
                    }
                    it1Var2.f4950u = this.f11388e.e();
                    xu0Var = new xu0(Unit.f71706a);
                }
                if (!(xu0Var instanceof pu0)) {
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                it1Var = kt1Var2.f5964a;
                ResultKt.b(obj);
            }
            return new xu0(it1Var);
        } catch (dv0 e11) {
            return e11.f2635a;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0070 A[Catch: all -> 0x007c, TryCatch #3 {all -> 0x007c, blocks: (B:31:0x0069, B:33:0x0070, B:35:0x0074, B:37:0x0078, B:40:0x007e, B:42:0x0082, B:44:0x0086, B:46:0x008a, B:47:0x008b, B:48:0x0090, B:49:0x0091, B:50:0x0098, B:51:0x0099, B:52:0x00a0, B:53:0x00a1), top: B:64:0x0069 }] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00a1 A[Catch: all -> 0x007c, TRY_LEAVE, TryCatch #3 {all -> 0x007c, blocks: (B:31:0x0069, B:33:0x0070, B:35:0x0074, B:37:0x0078, B:40:0x007e, B:42:0x0082, B:44:0x0086, B:46:0x008a, B:47:0x008b, B:48:0x0090, B:49:0x0091, B:50:0x0098, B:51:0x0099, B:52:0x00a0, B:53:0x00a1), top: B:64:0x0069 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(z1 z1Var, com.google.gson.r rVar, eg2 eg2Var, ContinuationImpl continuationImpl) {
        jt1 jt1Var;
        th3 th3VarA;
        TimeoutCancellationException th2;
        th3 th3Var;
        th3 th3Var2;
        if (continuationImpl instanceof jt1) {
            jt1Var = (jt1) continuationImpl;
            int i5 = jt1Var.f5390e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jt1Var.f5390e = i5 - Integer.MIN_VALUE;
            } else {
                jt1Var = new jt1(this, continuationImpl);
            }
        }
        Object obj = jt1Var.f5388c;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = jt1Var.f5390e;
        if (i11 == 0) {
            ResultKt.b(obj);
            WeakHashMap weakHashMap = ji3.f5253a;
            th3VarA = ji3.a(wv0.CUI_NAME_LOAD_NATIVE_ASSETS, EmptyList.f71733a, true);
            try {
                jt1Var.f5386a = th3VarA;
                jt1Var.f5387b = th3VarA;
                jt1Var.f5390e = 1;
                Object objB = b(z1Var, rVar, eg2Var, jt1Var);
                if (objB == obj2) {
                    return obj2;
                }
                th3Var2 = th3VarA;
                obj = objB;
                th3Var = th3Var2;
            } catch (Throwable th3) {
                th2 = th3;
                th3Var = th3VarA;
                th3VarA.b(th2);
                if (th2 instanceof b.a4) {
                    if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                        th3VarA.a(th2);
                    }
                    if (!(th2 instanceof TimeoutCancellationException)) {
                        if (!(th2 instanceof CancellationException)) {
                            if (th2 instanceof dv0) {
                                throw th2;
                            }
                            throw new iu0(th2);
                        }
                        throw new du0(th2);
                    }
                    throw new lw0(th2);
                }
                throw th2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var = jt1Var.f5387b;
            th3Var2 = jt1Var.f5386a;
            try {
                ResultKt.b(obj);
            } catch (Throwable th4) {
                th2 = th4;
                th3VarA = th3Var2;
                try {
                    th3VarA.b(th2);
                    if (th2 instanceof b.a4) {
                    }
                } finally {
                }
            }
        }
        b.a1 a1Var = (b.a1) obj;
        if (a1Var instanceof pu0) {
            zi3.a((pu0) a1Var, false);
        }
        CloseableKt.a(th3Var, null);
        return a1Var;
    }
}
