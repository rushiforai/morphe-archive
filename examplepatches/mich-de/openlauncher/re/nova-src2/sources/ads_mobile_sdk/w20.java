package ads_mobile_sdk;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import b.c0;
import b.e6;
import b.ed;
import b.fb;
import c80.d;
import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.UrlConst;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import kotlin.time.Duration;
import kotlinx.coroutines.TimeoutCancellationException;
import org.chromium.net.ConnectionMigrationOptions;
import org.chromium.net.CronetEngine;
import org.chromium.net.QuicOptions;
import org.chromium.net.UrlRequest;
import t70.k1;
import t70.m0;
import t70.s1;

/* loaded from: classes.dex */
public final class w20 implements e6 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f10997a;

    /* renamed from: b, reason: collision with root package name */
    public final jr0 f10998b;

    /* renamed from: c, reason: collision with root package name */
    public final b.y3 f10999c;

    /* renamed from: d, reason: collision with root package name */
    public final Context f11000d;

    /* renamed from: e, reason: collision with root package name */
    public final kz2 f11001e;

    /* renamed from: f, reason: collision with root package name */
    public final b41 f11002f;

    /* renamed from: g, reason: collision with root package name */
    public final fi0 f11003g;

    /* renamed from: h, reason: collision with root package name */
    public final zv f11004h;

    /* renamed from: i, reason: collision with root package name */
    public hs f11005i;

    /* renamed from: j, reason: collision with root package name */
    public b.xc f11006j;

    /* renamed from: k, reason: collision with root package name */
    public final d f11007k;

    /* renamed from: l, reason: collision with root package name */
    public final AtomicReference f11008l;

    /* renamed from: m, reason: collision with root package name */
    public final AtomicReference f11009m;
    public final s1 n;
    public final s1 o;

    /* renamed from: p, reason: collision with root package name */
    public final AtomicBoolean f11010p;

    /* renamed from: q, reason: collision with root package name */
    public final AtomicBoolean f11011q;

    /* renamed from: r, reason: collision with root package name */
    public final a70.d f11012r;

    public w20(t70.j0 backgroundScope, CoroutineContext backgroundContext, jr0 jr0Var, aw concurrencyObjects, b.y3 userAgentProvider, Context context, kz2 kz2Var, b41 b41Var, fi0 fi0Var) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(backgroundContext, "backgroundContext");
        Intrinsics.g(concurrencyObjects, "concurrencyObjects");
        Intrinsics.g(userAgentProvider, "userAgentProvider");
        Intrinsics.g(context, "context");
        this.f10997a = backgroundScope;
        this.f10998b = jr0Var;
        this.f10999c = userAgentProvider;
        this.f11000d = context;
        this.f11001e = kz2Var;
        this.f11002f = b41Var;
        this.f11003g = fi0Var;
        this.f11004h = concurrencyObjects.f1155d;
        this.f11007k = new d();
        this.f11008l = new AtomicReference();
        this.f11009m = new AtomicReference();
        this.n = m0.c();
        this.o = m0.c();
        this.f11010p = new AtomicBoolean();
        this.f11011q = new AtomicBoolean();
        this.f11012r = LazyKt.a(new a3.e(this, 7));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(w20 w20Var, CronetEngine.Builder builder, Long l9, ContinuationImpl continuationImpl) {
        v20 v20Var;
        Object obj;
        Long l11;
        CronetEngine.Builder builder2;
        jn jnVar = jn.a$10;
        if (continuationImpl instanceof v20) {
            v20Var = (v20) continuationImpl;
            int i5 = v20Var.f10554g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                v20Var.f10554g = i5 - Integer.MIN_VALUE;
            } else {
                v20Var = new v20(w20Var, continuationImpl);
            }
        }
        Object obj2 = v20Var.f10552e;
        Object obj3 = CoroutineSingletons.f71806a;
        int i11 = v20Var.f10554g;
        if (i11 == 0) {
            ResultKt.b(obj2);
            b.y3 y3Var = w20Var.f10999c;
            v20Var.f10548a = w20Var;
            v20Var.f10549b = builder;
            v20Var.f10550c = l9;
            v20Var.f10551d = builder;
            v20Var.f10554g = 1;
            Object objA = y3Var.a(v20Var);
            if (objA == obj3) {
                return obj3;
            }
            obj = objA;
            l11 = l9;
            builder2 = builder;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            builder = v20Var.f10551d;
            Long l12 = v20Var.f10550c;
            CronetEngine.Builder builder3 = v20Var.f10549b;
            w20 w20Var2 = v20Var.f10548a;
            ResultKt.b(obj2);
            builder2 = builder3;
            w20Var = w20Var2;
            obj = obj2;
            l11 = l12;
        }
        CronetEngine.Builder userAgent = builder.setUserAgent((String) obj);
        jr0 jr0Var = w20Var.f10998b;
        userAgent.enableQuic(jr0Var == null || ((Boolean) jr0Var.a("gads:cronet_quic:enabled", Boolean.TRUE, jnVar)).booleanValue()).enableHttp2(jr0Var == null || ((Boolean) jr0Var.a("gads:cronet_http2:enabled", Boolean.TRUE, jnVar)).booleanValue()).enableBrotli(jr0Var == null || ((Boolean) jr0Var.a("gads:cronet_brotli:enabled", Boolean.TRUE, jnVar)).booleanValue());
        int iIntValue = jr0Var != null ? ((Number) jr0Var.a("gads:cronet_cache_size_bytes", 3145728, jn.a$15)).intValue() : 10485760;
        if (iIntValue > 0) {
            builder2.enableHttpCache(1, iIntValue);
        }
        QuicOptions.Builder builderEnableTlsZeroRtt = QuicOptions.builder().enableTlsZeroRtt(jr0Var == null || ((Boolean) jr0Var.a("gads:cronet_zero_rtt:enabled", Boolean.TRUE, jnVar)).booleanValue());
        if (l11 != null) {
            builderEnableTlsZeroRtt.setIdleConnectionTimeoutSeconds(l11.longValue() * 60);
        }
        if (jr0Var == null || ((Boolean) jr0Var.a("gads:cronet_bbr:enabled", Boolean.TRUE, jnVar)).booleanValue()) {
            builderEnableTlsZeroRtt.addClientConnectionOption("TBBR");
        }
        builder2.setQuicOptions(builderEnableTlsZeroRtt.build());
        ConnectionMigrationOptions.Builder builder4 = ConnectionMigrationOptions.builder();
        if (jr0Var == null || ((Boolean) jr0Var.a("gads:cronet_server_migration:enabled", Boolean.TRUE, jnVar)).booleanValue()) {
            builder4.allowServerMigration(true);
        }
        if (jr0Var == null || ((Boolean) jr0Var.a("gads:cronet_path_degradation_migration:enabled", Boolean.TRUE, jnVar)).booleanValue()) {
            builder4.enablePathDegradationMigration(true);
        }
        builder2.setConnectionMigrationOptions(builder4.build());
        return builder2;
    }

    @Override // b.e6
    public final Object a(ef1 ef1Var) {
        if (this.f11010p.getAndSet(true)) {
            return Unit.f71706a;
        }
        a60.a aVar = new a60.a(this, null, 7);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f10997a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(aVar, null), 2);
        return Unit.f71706a;
    }

    @Override // b.e6
    public final Object a(int i5, long j11, l5 l5Var) {
        if (this.f11011q.getAndSet(true)) {
            return Unit.f71706a;
        }
        b4.j jVar = new b4.j(this, j11, (Continuation) null, 1);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f10997a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(jVar, null), 2);
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:120:0x0182, code lost:
    
        if (r0.invoke(r7) == r8) goto L121;
     */
    /* JADX WARN: Removed duplicated region for block: B:114:0x0175 A[Catch: all -> 0x014f, TRY_LEAVE, TryCatch #7 {all -> 0x014f, blocks: (B:92:0x013c, B:94:0x0143, B:96:0x0147, B:98:0x014b, B:101:0x0152, B:103:0x0156, B:105:0x015a, B:107:0x015e, B:108:0x015f, B:109:0x0164, B:110:0x0165, B:111:0x016c, B:112:0x016d, B:113:0x0174, B:114:0x0175), top: B:137:0x013c }] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e3 A[Catch: all -> 0x00ef, TryCatch #6 {all -> 0x00ef, blocks: (B:53:0x00dc, B:55:0x00e3, B:57:0x00e7, B:59:0x00eb, B:62:0x00f2, B:64:0x00f6, B:66:0x00fa, B:68:0x00fe, B:69:0x00ff, B:70:0x0104, B:71:0x0105, B:72:0x010c, B:73:0x010d, B:74:0x0114, B:75:0x0115), top: B:136:0x00dc }] */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0115 A[Catch: all -> 0x00ef, TRY_LEAVE, TryCatch #6 {all -> 0x00ef, blocks: (B:53:0x00dc, B:55:0x00e3, B:57:0x00e7, B:59:0x00eb, B:62:0x00f2, B:64:0x00f6, B:66:0x00fa, B:68:0x00fe, B:69:0x00ff, B:70:0x0104, B:71:0x0105, B:72:0x010c, B:73:0x010d, B:74:0x0114, B:75:0x0115), top: B:136:0x00dc }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0143 A[Catch: all -> 0x014f, TryCatch #7 {all -> 0x014f, blocks: (B:92:0x013c, B:94:0x0143, B:96:0x0147, B:98:0x014b, B:101:0x0152, B:103:0x0156, B:105:0x015a, B:107:0x015e, B:108:0x015f, B:109:0x0164, B:110:0x0165, B:111:0x016c, B:112:0x016d, B:113:0x0174, B:114:0x0175), top: B:137:0x013c }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(AtomicReference atomicReference, s1 s1Var, Long l9, ContinuationImpl continuationImpl) {
        h20 h20Var;
        jr0 jr0Var;
        th3 th3VarA;
        th3 th3Var;
        th3 th3Var2;
        th3 th3VarA2;
        th3 th3Var3;
        th3 th3Var4;
        x7.u uVarA;
        if (continuationImpl instanceof h20) {
            h20Var = (h20) continuationImpl;
            int i5 = h20Var.f4199e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h20Var.f4199e = i5 - Integer.MIN_VALUE;
            } else {
                h20Var = new h20(this, continuationImpl);
            }
        }
        h20 h20Var2 = h20Var;
        Object obj = h20Var2.f4197c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h20Var2.f4199e;
        if (i11 == 0) {
            ResultKt.b(obj);
            b41 b41Var = this.f11002f;
            l20 l20Var = new l20(!(b41Var == null || (uVarA = b41Var.a()) == null || !((Bundle) uVarA.f95210c).getBoolean("force_cronet_java_fallback_provider")) || ((jr0Var = this.f10998b) != null && ((Boolean) jr0Var.a("gads:use_cronet_fallback_provider:enabled", Boolean.FALSE, jn.a$10)).booleanValue()), this, l9, atomicReference, s1Var, null);
            kz2 kz2Var = this.f11001e;
            if (kz2Var != null) {
                wv0 wv0Var = wv0.CUI_NAME_INSTALL_CRONET;
                EmptyList emptyList = EmptyList.f71733a;
                mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                if (ji3.b().f4777a == null) {
                    th3VarA2 = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                    try {
                        h20Var2.f4195a = th3VarA2;
                        h20Var2.f4196b = th3VarA2;
                        h20Var2.f4199e = 1;
                        if (l20Var.invoke(h20Var2) != coroutineSingletons) {
                            th3Var4 = th3VarA2;
                            Unit unit = Unit.f71706a;
                            CloseableKt.a(th3VarA2, null);
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        th3Var3 = th3VarA2;
                        th3VarA2.b(th);
                        if (th instanceof b.a4) {
                        }
                    }
                } else {
                    th3VarA = ji3.a(wv0Var, emptyList, true);
                    try {
                        h20Var2.f4195a = th3VarA;
                        h20Var2.f4196b = th3VarA;
                        h20Var2.f4199e = 2;
                        if (l20Var.invoke(h20Var2) != coroutineSingletons) {
                            th3Var2 = th3VarA;
                            Unit unit2 = Unit.f71706a;
                            CloseableKt.a(th3VarA, null);
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        th3Var = th3VarA;
                        th3VarA.b(th);
                        if (th instanceof b.a4) {
                        }
                    }
                }
            } else {
                h20Var2.f4199e = 3;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            th3VarA2 = h20Var2.f4196b;
            th3Var4 = h20Var2.f4195a;
            try {
                ResultKt.b(obj);
                Unit unit3 = Unit.f71706a;
                CloseableKt.a(th3VarA2, null);
            } catch (Throwable th4) {
                th = th4;
                th3 th3Var5 = th3Var4;
                th3Var3 = th3VarA2;
                th3VarA2 = th3Var5;
                try {
                    th3VarA2.b(th);
                    if (th instanceof b.a4) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3VarA2.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                } finally {
                }
            }
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            th3VarA = h20Var2.f4196b;
            th3Var2 = h20Var2.f4195a;
            try {
                ResultKt.b(obj);
                Unit unit22 = Unit.f71706a;
                CloseableKt.a(th3VarA, null);
            } catch (Throwable th5) {
                th = th5;
                th3 th3Var6 = th3Var2;
                th3Var = th3VarA;
                th3VarA = th3Var6;
                try {
                    th3VarA.b(th);
                    if (th instanceof b.a4) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3VarA.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                } finally {
                    try {
                        throw th;
                    } finally {
                    }
                }
            }
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, UUID uuid, com.google.gson.r rVar, ContinuationImpl continuationImpl) {
        n20 n20Var;
        d dVar;
        com.google.gson.r rVar2;
        if (continuationImpl instanceof n20) {
            n20Var = (n20) continuationImpl;
            int i5 = n20Var.f7403e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                n20Var.f7403e = i5 - Integer.MIN_VALUE;
            } else {
                n20Var = new n20(this, continuationImpl);
            }
        }
        Object obj = n20Var.f7401c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = n20Var.f7403e;
        if (i11 == 0) {
            ResultKt.b(obj);
            com.google.gson.r rVar3 = new com.google.gson.r();
            rVar3.q(new Long(System.currentTimeMillis()), "timestamp");
            rVar3.s(DatabaseConstants.EVENT_FIELD, str);
            com.google.gson.m mVar = new com.google.gson.m();
            mVar.q("network_request_" + uuid);
            Unit unit = Unit.f71706a;
            rVar3.p("components", mVar);
            rVar3.p("params", rVar);
            n20Var.f7399a = rVar3;
            dVar = this.f11007k;
            n20Var.f7400b = dVar;
            n20Var.f7403e = 1;
            if (dVar.e(n20Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            rVar2 = rVar3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = n20Var.f7400b;
            rVar2 = n20Var.f7399a;
            ResultKt.b(obj);
        }
        try {
            mu0.a("GMA Debug BEGIN", null, 2);
            mu0.a("GMA Debug CONTENT " + rVar2, null, 2);
            mu0.a("GMA Debug FINISH", null, 2);
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:38:0x00ef, code lost:
    
        if (r2.a("onNetworkRequestError", r14, r15, r0) == r1) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0150, code lost:
    
        if (r2.a("onNetworkResponseBody", r13, r15, r0) == r1) goto L51;
     */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0159  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(a21 a21Var, UUID uuid, ContinuationImpl continuationImpl) {
        o20 o20Var;
        w20 w20Var;
        a21 a21Var2;
        UUID uuid2;
        ww2 ww2Var;
        if (continuationImpl instanceof o20) {
            o20Var = (o20) continuationImpl;
            int i5 = o20Var.f7741f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                o20Var.f7741f = i5 - Integer.MIN_VALUE;
            } else {
                o20Var = new o20(this, continuationImpl);
            }
        }
        Object obj = o20Var.f7739d;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = o20Var.f7741f;
        if (i11 == 0) {
            ResultKt.b(obj);
            com.google.gson.r rVar = new com.google.gson.r();
            com.google.gson.r rVar2 = new com.google.gson.r();
            rVar2.q(Integer.valueOf(a21Var.f809a), TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE);
            Unit unit = Unit.f71706a;
            rVar.p("firstline", rVar2);
            Map map = a21Var.f811c;
            if (map != null && !map.isEmpty()) {
                com.google.gson.m mVar = new com.google.gson.m();
                for (Map.Entry entry : map.entrySet()) {
                    String str = (String) entry.getKey();
                    String str2 = (String) entry.getValue();
                    com.google.gson.r rVar3 = new com.google.gson.r();
                    rVar3.s(PendingUpgradeStore.KEY_NAME, str);
                    rVar3.s("value", str2);
                    mVar.p(rVar3);
                }
                Unit unit2 = Unit.f71706a;
                rVar.p("headers", mVar);
            }
            o20Var.f7736a = this;
            o20Var.f7737b = a21Var;
            o20Var.f7738c = uuid;
            o20Var.f7741f = 1;
            if (a("onNetworkResponse", uuid, rVar, o20Var) != obj2) {
                w20Var = this;
            }
            return obj2;
        }
        if (i11 == 1) {
            uuid = o20Var.f7738c;
            a21Var = o20Var.f7737b;
            w20Var = o20Var.f7736a;
            ResultKt.b(obj);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            uuid2 = o20Var.f7738c;
            a21Var2 = o20Var.f7737b;
            w20Var = o20Var.f7736a;
            ResultKt.b(obj);
            ww2Var = a21Var2.f812d;
            if (ww2Var == null) {
                String strA = ww2.a(ww2Var);
                if (r70.k.U0(strA)) {
                    return Unit.f71706a;
                }
                com.google.gson.r rVar4 = new com.google.gson.r();
                rVar4.q(new Integer(strA.length()), "bodylength");
                if (strA.length() < 10000) {
                    byte[] bytes = strA.getBytes(Charsets.f72000b);
                    Intrinsics.f(bytes, "getBytes(...)");
                    rVar4.s("body", Base64.encodeToString(bytes, 0));
                } else {
                    b.i8 i8Var = rw0.f9327f;
                    rVar4.s("bodydigest", b.i8.u(strA));
                }
                Unit unit3 = Unit.f71706a;
                o20Var.f7736a = null;
                o20Var.f7737b = null;
                o20Var.f7738c = null;
                o20Var.f7741f = 3;
            } else {
                return Unit.f71706a;
            }
        }
        int i12 = a21Var.f809a;
        if (200 > i12 || i12 >= 300) {
            com.google.gson.r rVar5 = new com.google.gson.r();
            rVar5.s("error_description", a21Var.f810b);
            Unit unit4 = Unit.f71706a;
            o20Var.f7736a = w20Var;
            o20Var.f7737b = a21Var;
            o20Var.f7738c = uuid;
            o20Var.f7741f = 2;
        }
        UUID uuid3 = uuid;
        a21Var2 = a21Var;
        uuid2 = uuid3;
        ww2Var = a21Var2.f812d;
        if (ww2Var == null) {
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x00c1, code lost:
    
        if (r7 == r1) goto L31;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.e6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, Map map, Continuation continuation) {
        p20 p20Var;
        String str2;
        w20 w20Var;
        x11 x11Var;
        x11 x11Var2;
        if (continuation instanceof p20) {
            p20Var = (p20) continuation;
            int i5 = p20Var.f8057g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                p20Var.f8057g = i5 - Integer.MIN_VALUE;
            } else {
                p20Var = new p20(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = p20Var.f8055e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = p20Var.f8057g;
        if (i11 == 0) {
            ResultKt.b(obj);
            x11 x11Var3 = new x11();
            x11Var3.b(str);
            x11Var3.a("GET", (byte[]) null);
            if (map != null) {
                for (Map.Entry entry : map.entrySet()) {
                    x11Var3.a((String) entry.getKey(), (String) entry.getValue());
                }
            }
            p20Var.f8051a = this;
            p20Var.f8052b = x11Var3;
            p20Var.f8053c = x11Var3;
            str2 = "User-Agent";
            p20Var.f8054d = "User-Agent";
            p20Var.f8057g = 1;
            Object objA = this.f10999c.a(p20Var);
            if (objA != coroutineSingletons) {
                w20Var = this;
                x11Var = x11Var3;
                obj = objA;
                x11Var2 = x11Var;
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
        str2 = p20Var.f8054d;
        x11Var2 = p20Var.f8053c;
        x11Var = p20Var.f8052b;
        w20Var = p20Var.f8051a;
        ResultKt.b(obj);
        x11Var2.a(str2, (String) obj);
        y11 y11VarA = x11Var.a();
        UUID uuidRandomUUID = UUID.randomUUID();
        Intrinsics.f(uuidRandomUUID, "randomUUID(...)");
        p20Var.f8051a = null;
        p20Var.f8052b = null;
        p20Var.f8053c = null;
        p20Var.f8054d = null;
        p20Var.f8057g = 2;
        w20Var.getClass();
        Object objA2 = w20Var.a("onNetworkRequest", uuidRandomUUID, fb.g(y11VarA), p20Var);
        if (objA2 != CoroutineSingletons.f71806a) {
            objA2 = Unit.f71706a;
        }
    }

    @Override // b.e6
    public final Object a(y11 y11Var, Duration duration, x22 x22Var) {
        return e6.a(this, y11Var, duration, x22Var, 20);
    }

    @Override // b.e6
    public final Object a(URL url, bn0 bn0Var, Continuation continuation) {
        URL url2;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        ArrayList arrayList = new ArrayList();
        URL urlJ = ed.j(url, bn0Var, this.f10998b);
        if (arrayList.isEmpty()) {
            url2 = urlJ;
        } else {
            String string = urlJ.toString();
            Intrinsics.f(string, "toString(...)");
            Uri.Builder builderBuildUpon = Uri.parse(string).buildUpon();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Pair pair = (Pair) it.next();
                builderBuildUpon.appendQueryParameter((String) pair.f71683a, (String) pair.f71684b);
            }
            url2 = new URL(builderBuildUpon.build().toString());
        }
        return e6.a(this, new y11(url2, "GET", MapsKt.s0(linkedHashMap), null, bn0Var, null), null, (ContinuationImpl) continuation, 14);
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00cd A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // b.e6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(URL url, Continuation continuation) {
        q20 q20Var;
        Object objK;
        w20 w20Var;
        w20 w20Var2;
        x11 x11Var;
        String str;
        CronetEngine cronetEngine;
        if (continuation instanceof q20) {
            q20Var = (q20) continuation;
            int i5 = q20Var.f8444f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                q20Var.f8444f = i5 - Integer.MIN_VALUE;
            } else {
                q20Var = new q20(this, (ContinuationImpl) continuation);
            }
        }
        q20 q20Var2 = q20Var;
        Object obj = q20Var2.f8442d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = q20Var2.f8444f;
        if (i11 == 0) {
            ResultKt.b(obj);
            q20Var2.f8439a = this;
            q20Var2.f8440b = url;
            q20Var2.f8444f = 1;
            if (!this.f11011q.get() || (objK = this.o.K(q20Var2)) != coroutineSingletons) {
                objK = Unit.f71706a;
            }
            if (objK != coroutineSingletons) {
                w20Var = this;
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            str = q20Var2.f8441c;
            x11Var = (x11) q20Var2.f8440b;
            w20Var2 = q20Var2.f8439a;
            ResultKt.b(obj);
            x11Var.c(str, (String) obj);
            y11 y11VarA = x11Var.a();
            cronetEngine = (CronetEngine) w20Var2.f11009m.get();
            if (cronetEngine == null) {
                Object obj2 = w20Var2.f11008l.get();
                Intrinsics.d(obj2);
                cronetEngine = (CronetEngine) obj2;
            }
            q20Var2.f8439a = null;
            q20Var2.f8440b = null;
            q20Var2.f8441c = null;
            q20Var2.f8444f = 3;
            Object objA = w20Var2.a(y11VarA, cronetEngine, false, true, (ContinuationImpl) q20Var2);
            return objA != coroutineSingletons ? coroutineSingletons : objA;
        }
        url = (URL) q20Var2.f8440b;
        w20Var = q20Var2.f8439a;
        ResultKt.b(obj);
        x11 x11Var2 = new x11();
        Intrinsics.g(url, "url");
        x11Var2.f11531a = url;
        x11Var2.a("HEAD", (byte[]) null);
        b.y3 y3Var = w20Var.f10999c;
        q20Var2.f8439a = w20Var;
        q20Var2.f8440b = x11Var2;
        q20Var2.f8441c = "User-Agent";
        q20Var2.f8444f = 2;
        Object objA2 = y3Var.a(q20Var2);
        if (objA2 != coroutineSingletons) {
            w20Var2 = w20Var;
            x11Var = x11Var2;
            obj = objA2;
            str = "User-Agent";
            x11Var.c(str, (String) obj);
            y11 y11VarA2 = x11Var.a();
            cronetEngine = (CronetEngine) w20Var2.f11009m.get();
            if (cronetEngine == null) {
            }
            q20Var2.f8439a = null;
            q20Var2.f8440b = null;
            q20Var2.f8441c = null;
            q20Var2.f8444f = 3;
            Object objA3 = w20Var2.a(y11VarA2, cronetEngine, false, true, (ContinuationImpl) q20Var2);
            if (objA3 != coroutineSingletons) {
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:74:0x01b3, code lost:
    
        if (r2 != r4) goto L76;
     */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0183  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    @Override // b.e6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(y11 y11Var, Duration duration, Map map, boolean z11, boolean z12, ContinuationImpl continuationImpl) {
        r20 r20Var;
        Object objK;
        y11 y11Var2;
        boolean z13;
        w20 w20Var;
        Map map2;
        Duration duration2;
        CronetEngine cronetEngine;
        Map mapA;
        boolean z14;
        boolean z15;
        CronetEngine cronetEngine2;
        x11 x11Var;
        String str;
        Duration duration3;
        long jD;
        long jH;
        boolean z16 = z11;
        if (continuationImpl instanceof r20) {
            r20Var = (r20) continuationImpl;
            int i5 = r20Var.f8915j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                r20Var.f8915j = i5 - Integer.MIN_VALUE;
            } else {
                r20Var = new r20(this, continuationImpl);
            }
        }
        Object objY = r20Var.f8913h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = r20Var.f8915j;
        try {
            if (i11 == 0) {
                ResultKt.b(objY);
                r20Var.f8906a = this;
                r20Var.f8907b = y11Var;
                r20Var.f8908c = duration;
                r20Var.f8909d = map;
                r20Var.f8911f = z16;
                r20Var.f8912g = z12;
                r20Var.f8915j = 1;
                if (z16) {
                    if (!this.f11011q.get() || (objK = this.o.K(r20Var)) != coroutineSingletons) {
                        objK = Unit.f71706a;
                    }
                    if (objK != coroutineSingletons) {
                        y11Var2 = y11Var;
                        z13 = z12;
                        w20Var = this;
                        map2 = map;
                        duration2 = duration;
                    }
                    return coroutineSingletons;
                }
                if (!this.f11010p.get() || (objK = this.n.K(r20Var)) != coroutineSingletons) {
                    objK = Unit.f71706a;
                }
                if (objK != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                boolean z17 = r20Var.f8912g;
                boolean z18 = r20Var.f8911f;
                map2 = (Map) r20Var.f8909d;
                duration2 = (Duration) r20Var.f8908c;
                y11Var2 = (y11) r20Var.f8907b;
                w20Var = r20Var.f8906a;
                ResultKt.b(objY);
                z13 = z17;
                z16 = z18;
            } else {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(objY);
                    return (b.a1) objY;
                }
                boolean z19 = r20Var.f8912g;
                boolean z21 = r20Var.f8911f;
                str = r20Var.f8910e;
                x11Var = (x11) r20Var.f8909d;
                CronetEngine cronetEngine3 = (CronetEngine) r20Var.f8908c;
                duration3 = (Duration) r20Var.f8907b;
                w20Var = r20Var.f8906a;
                ResultKt.b(objY);
                z15 = z19;
                z14 = z21;
                cronetEngine2 = cronetEngine3;
                x11Var.c(str, (String) objY);
                y11 y11VarA = x11Var.a();
                if (duration3 == null) {
                    jH = Duration.h(duration3.f72041a);
                } else {
                    jr0 jr0Var = w20Var.f10998b;
                    if (jr0Var != null) {
                        jD = jr0Var.D();
                    } else {
                        jD = jr0.f5355z;
                    }
                    jH = Duration.h(jD);
                }
                long j11 = jH;
                k1 k1Var = new k1(w20Var.f11004h);
                t20 t20Var = new t20(j11, w20Var, y11VarA, cronetEngine2, z14, z15, null);
                r20Var.f8906a = null;
                r20Var.f8907b = null;
                r20Var.f8908c = null;
                r20Var.f8909d = null;
                r20Var.f8910e = null;
                r20Var.f8915j = 3;
                objY = m0.y(k1Var, t20Var, r20Var);
            }
            if (!z16 || (cronetEngine = (CronetEngine) w20Var.f11009m.get()) == null) {
                Object obj = w20Var.f11008l.get();
                Intrinsics.d(obj);
                cronetEngine = (CronetEngine) obj;
            }
            hs hsVar = w20Var.f11005i;
            if (hsVar != null) {
                String string = y11Var2.f().toString();
                Intrinsics.f(string, "toString(...)");
                mapA = hsVar.a(Uri.parse(string));
            } else {
                mapA = null;
            }
            x11 x11VarG = y11Var2.g();
            if (map2 != null) {
                for (Map.Entry entry : map2.entrySet()) {
                    x11VarG.a((String) entry.getKey(), (String) entry.getValue());
                }
            }
            if (mapA != null) {
                for (Map.Entry entry2 : mapA.entrySet()) {
                    x11VarG.a((String) entry2.getKey(), (String) entry2.getValue());
                }
            }
            b.y3 y3Var = w20Var.f10999c;
            r20Var.f8906a = w20Var;
            r20Var.f8907b = duration2;
            r20Var.f8908c = cronetEngine;
            r20Var.f8909d = x11VarG;
            r20Var.f8910e = "User-Agent";
            r20Var.f8911f = z16;
            r20Var.f8912g = z13;
            r20Var.f8915j = 2;
            Object objA = y3Var.a(r20Var);
            if (objA != coroutineSingletons) {
                z14 = z16;
                z15 = z13;
                cronetEngine2 = cronetEngine;
                objY = objA;
                x11Var = x11VarG;
                str = "User-Agent";
                duration3 = duration2;
                x11Var.c(str, (String) objY);
                y11 y11VarA2 = x11Var.a();
                if (duration3 == null) {
                }
                long j112 = jH;
                k1 k1Var2 = new k1(w20Var.f11004h);
                t20 t20Var2 = new t20(j112, w20Var, y11VarA2, cronetEngine2, z14, z15, null);
                r20Var.f8906a = null;
                r20Var.f8907b = null;
                r20Var.f8908c = null;
                r20Var.f8909d = null;
                r20Var.f8910e = null;
                r20Var.f8915j = 3;
                objY = m0.y(k1Var2, t20Var2, r20Var);
            }
            return coroutineSingletons;
        } catch (TimeoutCancellationException e3) {
            SocketTimeoutException socketTimeoutException = new SocketTimeoutException("Cronet request timed out");
            socketTimeoutException.initCause(e3);
            return new qu0(socketTimeoutException, wd1.f11217e, null, 4);
        } catch (Throwable th2) {
            return new vu0(c0.k("Non-retryable Cronet error: ", th2.getMessage()), th2);
        }
    }

    @Override // b.e6
    public final Object a(URL url, Map map, boolean z11, ContinuationImpl continuationImpl) {
        URL url2;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        ArrayList arrayList = new ArrayList();
        if (arrayList.isEmpty()) {
            url2 = url;
        } else {
            String string = url.toString();
            Intrinsics.f(string, "toString(...)");
            Uri.Builder builderBuildUpon = Uri.parse(string).buildUpon();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Pair pair = (Pair) it.next();
                builderBuildUpon.appendQueryParameter((String) pair.f71683a, (String) pair.f71684b);
            }
            url2 = new URL(builderBuildUpon.build().toString());
        }
        return a(new y11(url2, "GET", MapsKt.s0(linkedHashMap), null, null, null), null, map, false, z11, continuationImpl);
    }

    /* JADX WARN: Code restructure failed: missing block: B:116:0x035e, code lost:
    
        if (r12.a(r1, r8, r2) == r3) goto L117;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0171, code lost:
    
        if (r13 == r3) goto L117;
     */
    /* JADX WARN: Removed duplicated region for block: B:124:0x0372  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0391  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0144  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01c9 A[LOOP:2: B:56:0x01c3->B:58:0x01c9, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x01ef  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0210  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x021e  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0221  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:65:0x0210 -> B:66:0x0218). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(y11 y11Var, CronetEngine cronetEngine, boolean z11, boolean z12, ContinuationImpl continuationImpl) {
        u20 u20Var;
        UUID uuidRandomUUID;
        y11 y11Var2;
        boolean z13;
        CronetEngine cronetEngine2;
        boolean z14;
        w20 w20Var;
        int i5;
        int iIntValue;
        boolean z15;
        CronetEngine cronetEngine3;
        int i11;
        boolean z16;
        UUID uuid;
        y11 y11Var3;
        boolean z17;
        int i12;
        int i13;
        CronetEngine cronetEngine4;
        w20 w20Var2;
        int i14;
        boolean z18;
        byte[] bArr;
        boolean z19;
        a21 a21Var;
        boolean z21;
        int i15;
        CronetEngine cronetEngine5;
        boolean z22;
        int i16;
        if (continuationImpl instanceof u20) {
            u20Var = (u20) continuationImpl;
            int i17 = u20Var.f10189l;
            if ((i17 & Integer.MIN_VALUE) != 0) {
                u20Var.f10189l = i17 - Integer.MIN_VALUE;
            } else {
                u20Var = new u20(this, continuationImpl);
            }
        }
        Object objA = u20Var.f10187j;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i18 = u20Var.f10189l;
        int i19 = 3;
        int i21 = 2;
        if (i18 == 0) {
            ResultKt.b(objA);
            uuidRandomUUID = UUID.randomUUID();
            jr0 jr0Var = this.f10998b;
            if (jr0Var == null || !((Boolean) jr0Var.a("gads:disable_network_request_tracing", Boolean.FALSE, jn.a$10)).booleanValue()) {
                b.xc xcVar = this.f11006j;
                if (xcVar != null) {
                    u20Var.f10178a = this;
                    u20Var.f10179b = y11Var;
                    u20Var.f10180c = cronetEngine;
                    u20Var.f10181d = uuidRandomUUID;
                    u20Var.f10182e = z11;
                    u20Var.f10183f = z12;
                    u20Var.f10189l = 1;
                    objA = w81.a((w81) xcVar, u20Var);
                    if (objA != coroutineSingletons) {
                        y11Var2 = y11Var;
                        z13 = z12;
                        cronetEngine2 = cronetEngine;
                        z14 = z11;
                        w20Var = this;
                    }
                    return coroutineSingletons;
                }
                y11Var2 = y11Var;
                z13 = z12;
                cronetEngine2 = cronetEngine;
                z14 = z11;
                w20Var = this;
                i5 = (!z16 || Log.isLoggable("GoogleMobileAdsNetwork", 2)) ? 1 : 0;
                jr0 jr0Var2 = w20Var.f10998b;
                iIntValue = jr0Var2 != null ? ((Number) jr0Var2.a("gads:cronet_max_redirects", 5, jn.a$15)).intValue() : 5;
                CronetEngine cronetEngine6 = cronetEngine2;
                z15 = z13;
                cronetEngine3 = cronetEngine6;
                i11 = 0;
                if (i11 < iIntValue) {
                }
            } else {
                y11Var2 = y11Var;
                cronetEngine2 = cronetEngine;
                z14 = z11;
                z13 = z12;
                w20Var = this;
                jr0 jr0Var22 = w20Var.f10998b;
                if (jr0Var22 != null) {
                }
                CronetEngine cronetEngine62 = cronetEngine2;
                z15 = z13;
                cronetEngine3 = cronetEngine62;
                i11 = 0;
                if (i11 < iIntValue) {
                }
            }
        } else {
            if (i18 != 1) {
                if (i18 == 2) {
                    i14 = u20Var.f10186i;
                    int i22 = u20Var.f10185h;
                    int i23 = u20Var.f10184g;
                    boolean z23 = u20Var.f10183f;
                    boolean z24 = u20Var.f10182e;
                    y11 y11Var4 = (y11) u20Var.f10181d;
                    UUID uuid2 = (UUID) u20Var.f10180c;
                    CronetEngine cronetEngine7 = (CronetEngine) u20Var.f10179b;
                    w20 w20Var3 = (w20) u20Var.f10178a;
                    ResultKt.b(objA);
                    z18 = z23;
                    i13 = i22;
                    w20Var2 = w20Var3;
                    uuid = uuid2;
                    z17 = z24;
                    i12 = i23;
                    cronetEngine4 = cronetEngine7;
                    y11Var3 = y11Var4;
                    u20Var.f10178a = w20Var2;
                    u20Var.f10179b = cronetEngine4;
                    u20Var.f10180c = uuid;
                    u20Var.f10181d = y11Var3;
                    u20Var.f10182e = z17;
                    u20Var.f10183f = z18;
                    u20Var.f10184g = i12;
                    u20Var.f10185h = i13;
                    u20Var.f10186i = i14;
                    u20Var.f10189l = i19;
                    w20Var2.getClass();
                    zv zvVar = w20Var2.f11004h;
                    t70.m mVar = new t70.m(1, IntrinsicsKt.b(u20Var));
                    mVar.t();
                    UrlRequest.Builder httpMethod = cronetEngine4.newUrlRequestBuilder(y11Var3.f11913a.toString(), new d20(mVar, w20Var2, z17, y11Var3), zvVar).setHttpMethod(y11Var3.f11914b);
                    while (r7.hasNext()) {
                    }
                    boolean z25 = z18;
                    bArr = y11Var3.f11916d;
                    if (bArr != null) {
                    }
                    UrlRequest urlRequestBuild = httpMethod.build();
                    mVar.v(new androidx.fragment.app.p(urlRequestBuild, 1));
                    urlRequestBuild.start();
                    objA = mVar.s();
                    CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                    if (objA != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                if (i18 != 3) {
                    if (i18 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    z21 = u20Var.f10182e;
                    a21Var = (a21) u20Var.f10178a;
                    ResultKt.b(objA);
                    z19 = true;
                    int iB = a21Var.b();
                    boolean z26 = (300 <= iB || iB >= 400) ? false : z19;
                    if (a21Var.f() && (!z26 || z21)) {
                        return new ru0(a21Var.d(), a21Var.b());
                    }
                    return new xu0(a21Var);
                }
                int i24 = u20Var.f10186i;
                int i25 = u20Var.f10185h;
                i12 = u20Var.f10184g;
                boolean z27 = u20Var.f10183f;
                boolean z28 = u20Var.f10182e;
                y11Var3 = (y11) u20Var.f10181d;
                UUID uuid3 = (UUID) u20Var.f10180c;
                CronetEngine cronetEngine8 = (CronetEngine) u20Var.f10179b;
                w20 w20Var4 = (w20) u20Var.f10178a;
                ResultKt.b(objA);
                int i26 = i25;
                z15 = z27;
                int i27 = i24;
                CronetEngine cronetEngine9 = cronetEngine8;
                uuidRandomUUID = uuid3;
                w20Var = w20Var4;
                boolean z29 = z28;
                b.a1 a1Var = (b.a1) objA;
                if (!(a1Var instanceof pu0)) {
                    return (pu0) a1Var;
                }
                Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                a21 a21Var2 = (a21) ((xu0) a1Var).a();
                String strE = a21Var2.e();
                if (strE != null && z15) {
                    if (!r70.j.I0(strE, UrlConst.HTTPS, true)) {
                        if (strE.length() > 100) {
                            strE = r70.l.G1(97, strE).concat("...");
                        }
                        return new vu0(c0.k("Received non-HTTPs redirect: ", strE));
                    }
                    URL url = new URL(strE);
                    x11 x11VarG = y11Var3.g();
                    if (Intrinsics.b(y11Var3.f().getHost(), url.getHost())) {
                        i15 = i26;
                        cronetEngine5 = cronetEngine9;
                        z22 = z29;
                        i16 = i27;
                    } else {
                        Set setKeySet = y11Var3.c().keySet();
                        ArrayList arrayList = new ArrayList();
                        for (Object obj : setKeySet) {
                            int i28 = i26;
                            CronetEngine cronetEngine10 = cronetEngine9;
                            String str = (String) obj;
                            boolean z31 = z29;
                            int i29 = i27;
                            if (r70.j.B0(str, "X-Client-Data", true) || r70.j.B0(str, "Authorization", true) || r70.j.B0(str, "Cookie", true)) {
                                arrayList.add(obj);
                            }
                            i26 = i28;
                            cronetEngine9 = cronetEngine10;
                            z29 = z31;
                            i27 = i29;
                        }
                        i15 = i26;
                        cronetEngine5 = cronetEngine9;
                        z22 = z29;
                        i16 = i27;
                        Iterator it = arrayList.iterator();
                        while (it.hasNext()) {
                            x11VarG.a((String) it.next());
                        }
                    }
                    if (a21Var2.b() == 303 || ((a21Var2.b() == 301 || a21Var2.b() == 302) && Intrinsics.b(y11Var3.e(), "POST"))) {
                        x11VarG.b();
                        x11VarG.a("Content-Type");
                        x11VarG.a("Content-Length");
                    }
                    bn0 bn0VarB = y11Var3.b();
                    if (bn0VarB != null) {
                        x11VarG.a(ed.j(url, bn0VarB, w20Var.f10998b));
                    } else {
                        x11VarG.a(url);
                    }
                    y11 y11VarA = x11VarG.a();
                    i11 = i15 + 1;
                    cronetEngine3 = cronetEngine5;
                    z14 = z22;
                    iIntValue = i16;
                    i5 = i12;
                    i19 = 3;
                    i21 = 2;
                    y11Var2 = y11VarA;
                    if (i11 < iIntValue) {
                        if (i5 != 0) {
                            Intrinsics.d(uuidRandomUUID);
                            u20Var.f10178a = w20Var;
                            u20Var.f10179b = cronetEngine3;
                            u20Var.f10180c = uuidRandomUUID;
                            u20Var.f10181d = y11Var2;
                            u20Var.f10182e = z14;
                            u20Var.f10183f = z15;
                            u20Var.f10184g = i5;
                            u20Var.f10185h = i11;
                            u20Var.f10186i = iIntValue;
                            u20Var.f10189l = i21;
                            w20Var.getClass();
                            Object objA2 = w20Var.a("onNetworkRequest", uuidRandomUUID, fb.g(y11Var2), u20Var);
                            if (objA2 != CoroutineSingletons.f71806a) {
                                objA2 = Unit.f71706a;
                            }
                        }
                        z17 = z14;
                        uuid = uuidRandomUUID;
                        w20Var2 = w20Var;
                        cronetEngine4 = cronetEngine3;
                        i14 = iIntValue;
                        y11Var3 = y11Var2;
                        i12 = i5;
                        z18 = z15;
                        i13 = i11;
                        u20Var.f10178a = w20Var2;
                        u20Var.f10179b = cronetEngine4;
                        u20Var.f10180c = uuid;
                        u20Var.f10181d = y11Var3;
                        u20Var.f10182e = z17;
                        u20Var.f10183f = z18;
                        u20Var.f10184g = i12;
                        u20Var.f10185h = i13;
                        u20Var.f10186i = i14;
                        u20Var.f10189l = i19;
                        w20Var2.getClass();
                        zv zvVar2 = w20Var2.f11004h;
                        t70.m mVar2 = new t70.m(1, IntrinsicsKt.b(u20Var));
                        mVar2.t();
                        UrlRequest.Builder httpMethod2 = cronetEngine4.newUrlRequestBuilder(y11Var3.f11913a.toString(), new d20(mVar2, w20Var2, z17, y11Var3), zvVar2).setHttpMethod(y11Var3.f11914b);
                        for (Map.Entry entry : y11Var3.f11915c.entrySet()) {
                            httpMethod2.addHeader((String) entry.getKey(), (String) entry.getValue());
                            z18 = z18;
                        }
                        boolean z252 = z18;
                        bArr = y11Var3.f11916d;
                        if (bArr != null) {
                            httpMethod2.setUploadDataProvider(p10.y1.x(bArr), zvVar2);
                        }
                        UrlRequest urlRequestBuild2 = httpMethod2.build();
                        mVar2.v(new androidx.fragment.app.p(urlRequestBuild2, 1));
                        urlRequestBuild2.start();
                        objA = mVar2.s();
                        CoroutineSingletons coroutineSingletons22 = CoroutineSingletons.f71806a;
                        if (objA != coroutineSingletons) {
                            i26 = i13;
                            z15 = z252;
                            i27 = i14;
                            w20Var = w20Var2;
                            cronetEngine9 = cronetEngine4;
                            z29 = z17;
                            uuidRandomUUID = uuid;
                            b.a1 a1Var2 = (b.a1) objA;
                            if (!(a1Var2 instanceof pu0)) {
                            }
                        }
                        return coroutineSingletons;
                    }
                    return new wu0("Too many redirects. Max redirects: " + iIntValue + ". Last attempted url: " + y11Var2.f());
                }
                z19 = true;
                if (i12 != 0) {
                    Intrinsics.d(uuidRandomUUID);
                    u20Var.f10178a = a21Var2;
                    u20Var.f10179b = null;
                    u20Var.f10180c = null;
                    u20Var.f10181d = null;
                    u20Var.f10182e = z15;
                    u20Var.f10189l = 4;
                }
                a21Var = a21Var2;
                z21 = z15;
                int iB2 = a21Var.b();
                if (300 <= iB2) {
                }
                if (a21Var.f()) {
                }
                return new xu0(a21Var);
            }
            z13 = u20Var.f10183f;
            z14 = u20Var.f10182e;
            uuidRandomUUID = (UUID) u20Var.f10181d;
            cronetEngine2 = (CronetEngine) u20Var.f10180c;
            y11Var2 = (y11) u20Var.f10179b;
            w20Var = (w20) u20Var.f10178a;
            ResultKt.b(objA);
        }
        z16 = ((Boolean) objA).booleanValue();
        if (z16) {
        }
        jr0 jr0Var222 = w20Var.f10998b;
        if (jr0Var222 != null) {
        }
        CronetEngine cronetEngine622 = cronetEngine2;
        z15 = z13;
        cronetEngine3 = cronetEngine622;
        i11 = 0;
        if (i11 < iIntValue) {
        }
    }

    @Override // b.e6
    public final void a(hs chromeVariationsProvider) {
        Intrinsics.g(chromeVariationsProvider, "chromeVariationsProvider");
        this.f11005i = chromeVariationsProvider;
    }

    @Override // b.e6
    public final void a(b.xc debugModeProvider) {
        Intrinsics.g(debugModeProvider, "debugModeProvider");
        this.f11006j = debugModeProvider;
    }
}
