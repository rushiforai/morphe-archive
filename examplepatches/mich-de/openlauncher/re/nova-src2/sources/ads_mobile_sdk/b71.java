package ads_mobile_sdk;

import android.os.Bundle;
import b.c0;
import b.k9;
import b.o2;
import b.r0;
import b.t2;
import c80.d;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;
import java.util.Optional;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.optionals.OptionalsKt;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import ni.w;

/* loaded from: classes.dex */
public final class b71 implements b.ka, r0 {

    /* renamed from: a, reason: collision with root package name */
    public final w81 f1291a;

    /* renamed from: b, reason: collision with root package name */
    public final qw2 f1292b;

    /* renamed from: c, reason: collision with root package name */
    public final Optional f1293c;

    /* renamed from: d, reason: collision with root package name */
    public final String f1294d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f1295e;

    /* renamed from: f, reason: collision with root package name */
    public final o2 f1296f;

    /* renamed from: g, reason: collision with root package name */
    public final Gson f1297g;

    /* renamed from: h, reason: collision with root package name */
    public final jr0 f1298h;

    /* renamed from: i, reason: collision with root package name */
    public final Optional f1299i;

    /* renamed from: j, reason: collision with root package name */
    public String f1300j;

    /* renamed from: k, reason: collision with root package name */
    public final d f1301k;

    /* renamed from: l, reason: collision with root package name */
    public t61 f1302l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f1303m;
    public boolean n;
    public com.google.gson.r o;

    /* renamed from: p, reason: collision with root package name */
    public String f1304p;

    /* renamed from: q, reason: collision with root package name */
    public String f1305q;

    /* renamed from: r, reason: collision with root package name */
    public String f1306r;

    /* renamed from: s, reason: collision with root package name */
    public com.google.gson.r f1307s;

    /* renamed from: t, reason: collision with root package name */
    public com.google.gson.r f1308t;

    /* renamed from: u, reason: collision with root package name */
    public pu0 f1309u;

    /* renamed from: v, reason: collision with root package name */
    public ni.g0 f1310v;

    /* renamed from: w, reason: collision with root package name */
    public long f1311w;

    /* renamed from: x, reason: collision with root package name */
    public volatile boolean f1312x;

    public b71(w81 inspectorManager, qw2 requestType, Optional baseRequest, String requestId, boolean z11, o2 clock, Gson gson, jr0 flags, Optional signalRequest) {
        Intrinsics.g(inspectorManager, "inspectorManager");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(signalRequest, "signalRequest");
        this.f1291a = inspectorManager;
        this.f1292b = requestType;
        this.f1293c = baseRequest;
        this.f1294d = requestId;
        this.f1295e = z11;
        this.f1296f = clock;
        this.f1297g = gson;
        this.f1298h = flags;
        this.f1299i = signalRequest;
        this.f1301k = new d();
        this.f1302l = t61.f9791a;
        this.o = new com.google.gson.r();
        this.f1304p = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f1305q = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f1306r = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f1307s = new com.google.gson.r();
        this.f1308t = new com.google.gson.r();
        Duration.f72038b.getClass();
        this.f1311w = 0L;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(b71 b71Var, ContinuationImpl continuationImpl) {
        u61 u61Var;
        d dVar;
        if (continuationImpl instanceof u61) {
            u61Var = (u61) continuationImpl;
            int i5 = u61Var.f10211e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                u61Var.f10211e = i5 - Integer.MIN_VALUE;
            } else {
                u61Var = new u61(b71Var, continuationImpl);
            }
        }
        Object obj = u61Var.f10209c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = u61Var.f10211e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = b71Var.f1301k;
            u61Var.f10207a = b71Var;
            u61Var.f10208b = dVar;
            u61Var.f10211e = 1;
            if (dVar.e(u61Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = u61Var.f10208b;
            b71 b71Var2 = u61Var.f10207a;
            ResultKt.b(obj);
            dVar = dVar2;
            b71Var = b71Var2;
        }
        try {
            b71Var.n = true;
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    @Override // b.ka
    public final Object b(Continuation continuation) {
        return b(this, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Continuation continuation) {
        a71 a71Var;
        b71 b71Var;
        d dVar;
        if (continuation instanceof a71) {
            a71Var = (a71) continuation;
            int i5 = a71Var.f884e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a71Var.f884e = i5 - Integer.MIN_VALUE;
            } else {
                a71Var = new a71(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = a71Var.f882c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a71Var.f884e;
        if (i11 == 0) {
            ResultKt.b(obj);
            a71Var.f880a = this;
            d dVar2 = this.f1301k;
            a71Var.f881b = dVar2;
            a71Var.f884e = 1;
            if (dVar2.e(a71Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            b71Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = a71Var.f881b;
            b71Var = a71Var.f880a;
            ResultKt.b(obj);
        }
        try {
            com.google.gson.r rVar = new com.google.gson.r();
            t61 t61Var = b71Var.f1302l;
            boolean z11 = b71Var.f1295e;
            rVar.s("state", t61Var.name());
            String upperCase = b71Var.f1292b.f8869a.toUpperCase(Locale.ROOT);
            Intrinsics.f(upperCase, "toUpperCase(...)");
            rVar.s("format", upperCase);
            rVar.r("isOutOfContext", Boolean.valueOf(z11));
            if (z11) {
                rVar.r("shown", Boolean.valueOf(b71Var.n));
            }
            ni.g0 g0Var = b71Var.f1310v;
            if (g0Var != null) {
                rVar.p("responseInfo", b71Var.a(g0Var));
            }
            dVar.g(null);
            return rVar;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(b71 b71Var, ContinuationImpl continuationImpl) {
        y61 y61Var;
        b71 b71Var2;
        String strK;
        if (continuationImpl instanceof y61) {
            y61Var = (y61) continuationImpl;
            int i5 = y61Var.f11949e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                y61Var.f11949e = i5 - Integer.MIN_VALUE;
            } else {
                y61Var = new y61(b71Var, continuationImpl);
            }
        }
        Object obj = y61Var.f11947c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = y61Var.f11949e;
        if (i11 == 0) {
            ResultKt.b(obj);
            ni.q qVar = (ni.q) OptionalsKt.b(b71Var.f1293c);
            String strL = qVar != null ? qVar.l() : null;
            boolean z11 = strL == null;
            OptionalsKt.b(b71Var.f1293c);
            ((Boolean) b71Var.f1298h.a("gads:inspector:s2s_enabled", Boolean.FALSE, jn.a$10)).getClass();
            if (z11) {
                return Unit.f71706a;
            }
            w81 w81Var = b71Var.f1291a;
            y61Var.f11945a = b71Var;
            y61Var.f11946b = strL;
            y61Var.f11949e = 1;
            w81Var.getClass();
            Object objA = w81.a(w81Var, y61Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            b71Var2 = b71Var;
            strK = strL;
            obj = objA;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            strK = y61Var.f11946b;
            b71Var2 = y61Var.f11945a;
            ResultKt.b(obj);
        }
        if (((Boolean) obj).booleanValue()) {
            if (strK == null) {
                strK = c0.k("SERVER_TO_SERVER_AD_UNIT_", b71Var2.f1292b.name());
            }
            b71Var2.f1300j = strK;
            b71Var2.f1312x = true;
        }
        return Unit.f71706a;
    }

    @Override // b.r0
    public final Object a(pu0 pu0Var, ni.g0 g0Var, Continuation continuation) {
        return a(this, pu0Var, g0Var, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x00ac, code lost:
    
        if (ads_mobile_sdk.w81.d(r7, r0) != r1) goto L34;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(b71 b71Var, pu0 pu0Var, ni.g0 g0Var, ContinuationImpl continuationImpl) {
        v61 v61Var;
        d dVar;
        if (continuationImpl instanceof v61) {
            v61Var = (v61) continuationImpl;
            int i5 = v61Var.f10615g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                v61Var.f10615g = i5 - Integer.MIN_VALUE;
            } else {
                v61Var = new v61(b71Var, continuationImpl);
            }
        }
        Object obj = v61Var.f10613e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = v61Var.f10615g;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (!b71Var.f1312x) {
                    return Unit.f71706a;
                }
                dVar = b71Var.f1301k;
                v61Var.f10609a = b71Var;
                v61Var.f10610b = pu0Var;
                v61Var.f10611c = g0Var;
                v61Var.f10612d = dVar;
                v61Var.f10615g = 1;
                if (dVar.e(v61Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                d dVar2 = v61Var.f10612d;
                g0Var = v61Var.f10611c;
                pu0Var = v61Var.f10610b;
                b71 b71Var2 = v61Var.f10609a;
                ResultKt.b(obj);
                dVar = dVar2;
                b71Var = b71Var2;
            } else {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                b71Var = v61Var.f10609a;
                ResultKt.b(obj);
                w81 w81Var = b71Var.f1291a;
                v61Var.f10609a = null;
                v61Var.f10615g = 3;
                w81Var.getClass();
            }
            b71Var.f1302l = t61.f9793c;
            b71Var.f1309u = pu0Var;
            b71Var.f1310v = g0Var;
            Duration.Companion companion = Duration.f72038b;
            b71Var.f1296f.getClass();
            b71Var.f1311w = DurationKt.h(System.currentTimeMillis(), DurationUnit.f72045d);
            Unit unit = Unit.f71706a;
            dVar.g(null);
            w81 w81Var2 = b71Var.f1291a;
            String str = b71Var.f1300j;
            if (str == null) {
                Intrinsics.m("adUnitId");
                throw null;
            }
            v61Var.f10609a = b71Var;
            v61Var.f10610b = null;
            v61Var.f10611c = null;
            v61Var.f10612d = null;
            v61Var.f10615g = 2;
            if (w81Var2.a(str, b71Var, v61Var) != coroutineSingletons) {
                w81 w81Var3 = b71Var.f1291a;
                v61Var.f10609a = null;
                v61Var.f10615g = 3;
                w81Var3.getClass();
            }
            return coroutineSingletons;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    @Override // b.r0
    public final Object a(d33 d33Var, z1 z1Var, ni.g0 g0Var, Continuation continuation) {
        return a(this, g0Var, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x00a4, code lost:
    
        if (ads_mobile_sdk.w81.d(r9, r0) != r1) goto L34;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(b71 b71Var, ni.g0 g0Var, ContinuationImpl continuationImpl) {
        w61 w61Var;
        d dVar;
        if (continuationImpl instanceof w61) {
            w61Var = (w61) continuationImpl;
            int i5 = w61Var.f11069f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                w61Var.f11069f = i5 - Integer.MIN_VALUE;
            } else {
                w61Var = new w61(b71Var, continuationImpl);
            }
        }
        Object obj = w61Var.f11067d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = w61Var.f11069f;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (!b71Var.f1312x) {
                    return Unit.f71706a;
                }
                dVar = b71Var.f1301k;
                w61Var.f11064a = b71Var;
                w61Var.f11065b = g0Var;
                w61Var.f11066c = dVar;
                w61Var.f11069f = 1;
                if (dVar.e(w61Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                d dVar2 = w61Var.f11066c;
                g0Var = w61Var.f11065b;
                b71 b71Var2 = w61Var.f11064a;
                ResultKt.b(obj);
                dVar = dVar2;
                b71Var = b71Var2;
            } else {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                b71Var = w61Var.f11064a;
                ResultKt.b(obj);
                w81 w81Var = b71Var.f1291a;
                w61Var.f11064a = null;
                w61Var.f11069f = 3;
                w81Var.getClass();
            }
            b71Var.f1302l = t61.f9792b;
            b71Var.f1310v = g0Var;
            Duration.Companion companion = Duration.f72038b;
            b71Var.f1296f.getClass();
            b71Var.f1311w = DurationKt.h(System.currentTimeMillis(), DurationUnit.f72045d);
            Unit unit = Unit.f71706a;
            dVar.g(null);
            w81 w81Var2 = b71Var.f1291a;
            String str = b71Var.f1300j;
            if (str == null) {
                Intrinsics.m("adUnitId");
                throw null;
            }
            w61Var.f11064a = b71Var;
            w61Var.f11065b = null;
            w61Var.f11066c = null;
            w61Var.f11069f = 2;
            if (w81Var2.a(str, b71Var, w61Var) != coroutineSingletons) {
                w81 w81Var3 = b71Var.f1291a;
                w61Var.f11064a = null;
                w61Var.f11069f = 3;
                w81Var3.getClass();
            }
            return coroutineSingletons;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    @Override // b.ka
    public final Object a(d33 d33Var, Continuation continuation) {
        return a(this, d33Var, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00aa A[Catch: all -> 0x0032, TryCatch #1 {all -> 0x0032, blocks: (B:13:0x002d, B:31:0x00a2, B:33:0x00aa, B:35:0x00b9, B:34:0x00b7), top: B:44:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00b7 A[Catch: all -> 0x0032, TryCatch #1 {all -> 0x0032, blocks: (B:13:0x002d, B:31:0x00a2, B:33:0x00aa, B:35:0x00b9, B:34:0x00b7), top: B:44:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r9v10, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(b71 b71Var, d33 d33Var, ContinuationImpl continuationImpl) throws Throwable {
        x61 x61Var;
        d dVar;
        c80.a aVar;
        b71 b71Var2;
        if (continuationImpl instanceof x61) {
            x61Var = (x61) continuationImpl;
            int i5 = x61Var.f11598f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x61Var.f11598f = i5 - Integer.MIN_VALUE;
            } else {
                x61Var = new x61(b71Var, continuationImpl);
            }
        }
        Object obj = x61Var.f11596d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x61Var.f11598f;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (!b71Var.f1312x) {
                    return Unit.f71706a;
                }
                dVar = b71Var.f1301k;
                x61Var.f11593a = b71Var;
                x61Var.f11594b = d33Var;
                x61Var.f11595c = dVar;
                x61Var.f11598f = 1;
                if (dVar.e(x61Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar = x61Var.f11595c;
                d33Var = x61Var.f11594b;
                b71Var2 = x61Var.f11593a;
                try {
                    ResultKt.b(obj);
                    if (!((Boolean) obj).booleanValue()) {
                        hv hvVar = d33Var.f2166b.f12428b;
                        b71Var2.f1308t = hvVar.f4551e;
                        b71Var2.f1305q = hvVar.f4550d;
                    } else {
                        b71Var2.f1303m = true;
                    }
                    Unit unit = Unit.f71706a;
                    ((d) aVar).g(null);
                    return unit;
                } catch (Throwable th2) {
                    th = th2;
                    ((d) aVar).g(null);
                    throw th;
                }
            }
            ?? r92 = x61Var.f11595c;
            d33Var = x61Var.f11594b;
            b71 b71Var3 = x61Var.f11593a;
            ResultKt.b(obj);
            dVar = r92;
            b71Var = b71Var3;
            hv hvVar2 = d33Var.f2166b.f12428b;
            b71Var.o = hvVar2.f4552f;
            b71Var.f1304p = hvVar2.f4549c;
            b71Var.f1306r = hvVar2.f4548b;
            b71Var.f1307s = hvVar2.f4555i;
            w81 w81Var = b71Var.f1291a;
            int length = hvVar2.f4551e.toString().length() + d33Var.f2166b.f12428b.f4550d.length();
            x61Var.f11593a = b71Var;
            x61Var.f11594b = d33Var;
            x61Var.f11595c = dVar;
            x61Var.f11598f = 2;
            Object objA = w81Var.a(length, x61Var);
            if (objA != coroutineSingletons) {
                b71Var2 = b71Var;
                aVar = dVar;
                obj = objA;
                if (!((Boolean) obj).booleanValue()) {
                }
                Unit unit2 = Unit.f71706a;
                ((d) aVar).g(null);
                return unit2;
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            aVar = dVar;
            ((d) aVar).g(null);
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) {
        z61 z61Var;
        b71 b71Var;
        d dVar;
        if (continuation instanceof z61) {
            z61Var = (z61) continuation;
            int i5 = z61Var.f12459e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z61Var.f12459e = i5 - Integer.MIN_VALUE;
            } else {
                z61Var = new z61(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = z61Var.f12457c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = z61Var.f12459e;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(obj);
            z61Var.f12455a = this;
            d dVar2 = this.f1301k;
            z61Var.f12456b = dVar2;
            z61Var.f12459e = 1;
            if (dVar2.e(z61Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            b71Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = z61Var.f12456b;
            b71Var = z61Var.f12455a;
            ResultKt.b(obj);
        }
        try {
            if (b71Var.f1302l == t61.f9791a) {
                z11 = false;
            }
            return Boolean.valueOf(z11);
        } finally {
            dVar.g(null);
        }
    }

    public final com.google.gson.r a(ni.g0 g0Var) {
        com.google.gson.p pVar;
        com.google.gson.r rVar;
        com.google.gson.r rVar2 = new com.google.gson.r();
        rVar2.s("winningAdapterClassName", g0Var.getAdapterClassName());
        long j11 = this.f1311w;
        Duration.Companion companion = Duration.f72038b;
        rVar2.q(Long.valueOf(Duration.q(j11, DurationUnit.f72046e)), "responseSecsSinceEpoch");
        rVar2.s("responseId", g0Var.getResponseId());
        rVar2.s("adRequestUrl", this.f1304p);
        rVar2.s("postBody", this.f1306r);
        rVar2.s("adResponseBody", this.f1305q);
        rVar2.r("hasExceededMemoryLimit", Boolean.valueOf(this.f1303m));
        rVar2.p("adResponseHeaders", this.f1308t);
        rVar2.p("transactionExtras", this.f1307s);
        rVar2.p("biddingData", this.o);
        com.google.gson.m mVar = new com.google.gson.m();
        Iterator it = g0Var.getAdSourceResponses().iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            pVar = com.google.gson.q.f34794a;
            if (!zHasNext) {
                break;
            }
            ni.l lVar = (ni.l) it.next();
            com.google.gson.r rVar3 = new com.google.gson.r();
            rVar3.s("adapterClassName", lVar.getAdapterClassName());
            rVar3.q(Long.valueOf(lVar.getLatencyMillis()), "latencyMillis");
            Bundle bundleC = lVar.getCredentials();
            try {
                Gson gson = this.f1297g;
                rVar = (com.google.gson.r) gson.fromJson(gson.toJson(bundleC), com.google.gson.r.class);
            } catch (Exception e3) {
                ArrayList arrayList = k9.e(e3, e3).f1803s;
                String message = e3.getMessage();
                if (message == null) {
                    message = e3.getClass().getName();
                }
                arrayList.add(message);
                rVar = null;
            }
            if (rVar == null) {
                rVar = new com.google.gson.r();
            }
            rVar3.p("credentials", rVar);
            w wVarA = lVar.getAdError();
            if (wVarA != null) {
                com.google.gson.r rVar4 = new com.google.gson.r();
                rVar4.s("errorDomain", wVarA.getDomain());
                rVar4.q(wVarA.b0(), "errorCode");
                rVar4.s("errorDescription", wVarA.getCom.bytedance.sdk.component.pglcrypt.PglCryptUtils.KEY_MESSAGE java.lang.String());
                rVar4.p("underlyingError", pVar);
                pVar = rVar4;
            }
            rVar3.p("error", pVar);
            mVar.p(rVar3);
        }
        rVar2.p("adNetworks", mVar);
        pu0 pu0Var = this.f1309u;
        if (g0Var.getAdSourceResponses().isEmpty() && pu0Var != null) {
            com.google.gson.m mVar2 = new com.google.gson.m();
            com.google.gson.r rVar5 = new com.google.gson.r();
            rVar5.s("errorDomain", "com.google.android.libraries.ads.mobile.sdk");
            rVar5.s("errorCode", pu0Var.a().a().name());
            rVar5.s("errorDescription", t2.y(pu0Var));
            rVar5.p("underlyingError", pVar);
            mVar2.p(rVar5);
            rVar2.p("errors", mVar2);
        }
        return rVar2;
    }
}
