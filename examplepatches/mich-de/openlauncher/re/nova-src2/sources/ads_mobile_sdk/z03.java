package ads_mobile_sdk;

import android.content.pm.PackageManager;
import b.d5;
import b.e6;
import b.f0;
import b.fb;
import b.h4;
import b.i4;
import b.l3;
import b70.h;
import c80.d;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class z03 implements b.va, f0 {

    /* renamed from: a, reason: collision with root package name */
    public final e6 f12357a;

    /* renamed from: b, reason: collision with root package name */
    public final qw2 f12358b;

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f12359c;

    /* renamed from: d, reason: collision with root package name */
    public final v03 f12360d;

    /* renamed from: e, reason: collision with root package name */
    public final d f12361e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicBoolean f12362f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f12363g;

    /* renamed from: h, reason: collision with root package name */
    public final AtomicBoolean f12364h;

    /* renamed from: i, reason: collision with root package name */
    public final b.qa f12365i;

    /* renamed from: j, reason: collision with root package name */
    public final LinkedHashMap f12366j;

    public z03(String afmaVersion, z1 adConfiguration, rw0 gmaUtil, e6 httpClient, qw2 requestType, jr0 flags) {
        String str;
        String str2;
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(flags, "flags");
        this.f12357a = httpClient;
        this.f12358b = requestType;
        this.f12359c = flags;
        v03 v03Var = adConfiguration.f12393n0;
        this.f12360d = v03Var;
        this.f12361e = new d();
        this.f12362f = new AtomicBoolean(false);
        this.f12363g = new AtomicBoolean(false);
        this.f12364h = new AtomicBoolean(false);
        b.qa qaVarO = c60.o();
        qaVarO.g();
        k61 k61Var = adConfiguration.I;
        String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        qaVarO.f((k61Var == null || (str2 = k61Var.f5521c) == null) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str2);
        if (k61Var != null && (str = k61Var.f5521c) != null) {
            str3 = str;
        }
        qaVarO.e(str3);
        b.ib ibVarO = v30.o();
        Intrinsics.f(ibVarO, "newBuilder(...)");
        au auVarC = fb.c(ibVarO);
        auVarC.a(v03Var.f10536a);
        Unit unit = Unit.f71706a;
        qaVarO.d(auVarC.a());
        d5 d5VarO = l50.o();
        Intrinsics.f(d5VarO, "newBuilder(...)");
        d5VarO.b();
        ((l50) d5VarO.f1095b).b(afmaVersion);
        PackageManager packageManager = gmaUtil.f9331a.getPackageManager();
        boolean zIsInstantApp = packageManager != null ? packageManager.isInstantApp() : false;
        d5VarO.b();
        l50 l50Var = (l50) d5VarO.f1095b;
        l50Var.bitField0_ |= 4;
        l50Var.isInstantApps_ = zIsInstantApp;
        qaVarO.c((l50) d5VarO.a());
        this.f12365i = qaVarO;
        this.f12366j = new LinkedHashMap();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(z03 z03Var, String str, h50 h50Var, Map map, ContinuationImpl continuationImpl) {
        w03 w03Var;
        d dVar;
        if (continuationImpl instanceof w03) {
            w03Var = (w03) continuationImpl;
            int i5 = w03Var.f10988h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                w03Var.f10988h = i5 - Integer.MIN_VALUE;
            } else {
                w03Var = new w03(z03Var, continuationImpl);
            }
        }
        Object obj = w03Var.f10986f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = w03Var.f10988h;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = z03Var.f12361e;
            w03Var.f10981a = z03Var;
            w03Var.f10982b = str;
            w03Var.f10983c = h50Var;
            w03Var.f10984d = map;
            w03Var.f10985e = dVar;
            w03Var.f10988h = 1;
            if (dVar.e(w03Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = w03Var.f10985e;
            map = w03Var.f10984d;
            h50Var = w03Var.f10983c;
            str = w03Var.f10982b;
            z03 z03Var2 = w03Var.f10981a;
            ResultKt.b(obj);
            dVar = dVar2;
            z03Var = z03Var2;
        }
        try {
            LinkedHashMap linkedHashMap = z03Var.f12366j;
            List list = z03Var.f12360d.f10540e;
            i4 i4Var = (i4) linkedHashMap.get(str);
            if (h50Var == h50.AD_RESOURCE_AUTO_CLICK_DESTINATION) {
                if (i4Var != null) {
                    i4Var.b();
                    j50 j50Var = (j50) i4Var.f1095b;
                    j50Var.getClass();
                    j50Var.adResourceType_ = h50Var.f4218a;
                    j50Var.bitField0_ |= 64;
                }
                return Unit.f71706a;
            }
            i4 i4VarO = j50.o();
            i4VarO.b();
            j50 j50Var2 = (j50) i4VarO.f1095b;
            j50Var2.getClass();
            j50Var2.adResourceType_ = h50Var.f4218a;
            j50Var2.bitField0_ |= 64;
            int size = linkedHashMap.size();
            i4VarO.b();
            j50 j50Var3 = (j50) i4VarO.f1095b;
            j50Var3.bitField0_ = 1 | j50Var3.bitField0_;
            j50Var3.id_ = size;
            i4VarO.b();
            ((j50) i4VarO.f1095b).b(str);
            h4 h4VarO = l40.o();
            Intrinsics.f(h4VarO, "newBuilder(...)");
            if (!list.isEmpty()) {
                for (Map.Entry entry : map.entrySet()) {
                    String str2 = (String) entry.getKey();
                    String str3 = (String) entry.getValue();
                    Locale ENGLISH = Locale.ENGLISH;
                    Intrinsics.f(ENGLISH, "ENGLISH");
                    String lowerCase = str2.toLowerCase(ENGLISH);
                    Intrinsics.f(lowerCase, "toLowerCase(...)");
                    if (list.contains(lowerCase)) {
                        Intrinsics.f(Collections.unmodifiableList(((l40) h4VarO.f1095b).headers_), "getHeadersList(...)");
                        l3 l3VarO = h40.o();
                        Intrinsics.f(l3VarO, "newBuilder(...)");
                        qq qqVar = str2.isEmpty() ? sq.f9634b : new qq(str2.getBytes(StandardCharsets.UTF_8));
                        Intrinsics.f(qqVar, "copyFromUtf8(...)");
                        l3VarO.b();
                        ((h40) l3VarO.f1095b).a(qqVar);
                        qq qqVar2 = str3.isEmpty() ? sq.f9634b : new qq(str3.getBytes(StandardCharsets.UTF_8));
                        Intrinsics.f(qqVar2, "copyFromUtf8(...)");
                        l3VarO.b();
                        ((h40) l3VarO.f1095b).b(qqVar2);
                        h40 h40Var = (h40) l3VarO.a();
                        h4VarO.b();
                        ((l40) h4VarO.f1095b).a(h40Var);
                    }
                }
            }
            l40 l40Var = (l40) h4VarO.a();
            i4VarO.b();
            ((j50) i4VarO.f1095b).a(l40Var);
            linkedHashMap.put(str, i4VarO);
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    @Override // b.f0
    public final Object b(Continuation continuation) {
        Object objC = c(continuation);
        return objC == CoroutineSingletons.f71806a ? objC : Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x00d9, code lost:
    
        if (b.e6.a(r2, r4, null, r0, 30) == r1) goto L44;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Continuation continuation) {
        x03 x03Var;
        d dVar;
        z03 z03Var;
        if (continuation instanceof x03) {
            x03Var = (x03) continuation;
            int i5 = x03Var.f11530e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x03Var.f11530e = i5 - Integer.MIN_VALUE;
            } else {
                x03Var = new x03(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = x03Var.f11528c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x03Var.f11530e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (this.f12362f.getAndSet(true)) {
                    return Unit.f71706a;
                }
                boolean z11 = this.f12364h.get();
                v03 v03Var = this.f12360d;
                if ((z11 || v03Var.f10538c) && !r70.k.U0(v03Var.f10537b)) {
                    x03Var.f11526a = this;
                    dVar = this.f12361e;
                    x03Var.f11527b = dVar;
                    x03Var.f11530e = 1;
                    if (dVar.e(x03Var) != coroutineSingletons) {
                        z03Var = this;
                    }
                    return coroutineSingletons;
                }
                return Unit.f71706a;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            dVar = x03Var.f11527b;
            z03Var = x03Var.f11526a;
            ResultKt.b(obj);
            LinkedHashMap linkedHashMap = z03Var.f12366j;
            b.qa qaVar = z03Var.f12365i;
            Iterator it = linkedHashMap.entrySet().iterator();
            while (it.hasNext()) {
                i4 i4Var = (i4) ((Map.Entry) it.next()).getValue();
                qaVar.b();
                ((c60) qaVar.f1095b).a((j50) i4Var.a());
            }
            c60 c60Var = (c60) qaVar.a();
            dVar.g(null);
            e6 e6Var = z03Var.f12357a;
            x11 x11Var = new x11();
            x11Var.b(z03Var.f12360d.f10537b);
            x11Var.b("application/x-protobuf", c60Var.a());
            y11 y11VarA = x11Var.a();
            x03Var.f11526a = null;
            x03Var.f11527b = null;
            x03Var.f11530e = 2;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    public final Object b(String str, ContinuationImpl continuationImpl) {
        mu0.b("Blocked click action", null);
        this.f12364h.set(true);
        Object objA = a(this, str, h50.AD_RESOURCE_AUTO_CLICK_DESTINATION, h.f17594a, continuationImpl);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // b.va
    public final Object a(Continuation continuation) {
        Object objC = c(continuation);
        return objC == CoroutineSingletons.f71806a ? objC : Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(z03 z03Var, String str, ContinuationImpl continuationImpl) {
        y03 y03Var;
        z03 z03Var2;
        d dVar;
        if (continuationImpl instanceof y03) {
            y03Var = (y03) continuationImpl;
            int i5 = y03Var.f11904f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                y03Var.f11904f = i5 - Integer.MIN_VALUE;
            } else {
                y03Var = new y03(z03Var, continuationImpl);
            }
        }
        Object obj = y03Var.f11902d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = y03Var.f11904f;
        if (i11 == 0) {
            ResultKt.b(obj);
            d dVar2 = z03Var.f12361e;
            y03Var.f11899a = z03Var;
            y03Var.f11900b = str;
            y03Var.f11901c = dVar2;
            y03Var.f11904f = 1;
            if (dVar2.e(y03Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            z03Var2 = z03Var;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = y03Var.f11901c;
            str = y03Var.f11900b;
            z03Var2 = y03Var.f11899a;
            ResultKt.b(obj);
        }
        try {
            b.qa qaVar = z03Var2.f12365i;
            qaVar.b();
            ((c60) qaVar.f1095b).b(str);
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    public final boolean a() {
        jr0 jr0Var = this.f12359c;
        jr0Var.getClass();
        if (!((Boolean) jr0Var.a("gads:native_click_protection:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
            qw2 qw2Var = qw2.f8864i;
            qw2 qw2Var2 = this.f12358b;
            if (qw2Var2 == qw2Var || qw2Var2 == qw2.f8862g) {
                return true;
            }
        }
        return !this.f12360d.f10539d || this.f12363g.get();
    }
}
