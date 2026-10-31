package com.vungle.ads.internal.network;

import com.facebook.ads.AdSDKNotificationListener;
import com.vungle.ads.TpatError;
import com.vungle.ads.internal.model.d3;
import com.vungle.ads.internal.persistence.FilePreferences;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.util.PathProvider;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.regex.Pattern;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KTypeProjection;
import kotlin.text.Regex;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializersKt;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.modules.SerializersModule;

/* loaded from: classes4.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final VungleApiClient f47283a;

    /* renamed from: b, reason: collision with root package name */
    public final Executor f47284b;

    /* renamed from: c, reason: collision with root package name */
    public final com.vungle.ads.internal.signals.j f47285c;

    /* renamed from: d, reason: collision with root package name */
    public final FilePreferences f47286d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f47287e;

    public r(VungleApiClient vungleApiClient, com.vungle.ads.internal.executor.j ioExecutor, com.vungle.ads.internal.executor.j jobExecutor, PathProvider pathProvider, com.vungle.ads.internal.signals.j jVar) {
        Intrinsics.g(vungleApiClient, "vungleApiClient");
        Intrinsics.g(ioExecutor, "ioExecutor");
        Intrinsics.g(jobExecutor, "jobExecutor");
        Intrinsics.g(pathProvider, "pathProvider");
        this.f47283a = vungleApiClient;
        this.f47284b = jobExecutor;
        this.f47285c = jVar;
        this.f47286d = FilePreferences.f47336d.a(ioExecutor, pathProvider, "vngFailedTpats");
        this.f47287e = new Object();
    }

    public final void b() {
        for (Map.Entry entry : a().entrySet()) {
            String str = (String) entry.getKey();
            d dVar = (d) entry.getValue();
            p pVar = new p(str);
            pVar.f47269g = true;
            pVar.f47267e = Boolean.FALSE;
            pVar.f47265c = dVar.f47233b;
            pVar.f47266d = dVar.f47234c;
            pVar.f47270h = dVar.f47236e;
            p pVarA = pVar.a(dVar.f47232a);
            pVarA.f47271i = dVar.f47237f;
            a(pVarA.a(), true);
        }
    }

    public final void a(q request, boolean z11) {
        Intrinsics.g(request, "request");
        String url = request.i();
        Intrinsics.g(url, "url");
        com.vungle.ads.internal.signals.j jVar = this.f47285c;
        String strD = jVar != null ? jVar.d() : null;
        if (strD == null) {
            strD = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (strD.length() > 0) {
            String strQuote = Pattern.quote("{{{session_id}}}");
            Intrinsics.f(strQuote, "quote(Constants.SESSION_ID)");
            url = new Regex(strQuote).h(strD, url);
        }
        this.f47284b.execute(new com.google.firebase.crashlytics.internal.common.r(1, this, request, url, z11));
    }

    public static final void a(r this$0, q request, String urlWithSessionId, boolean z11) {
        boolean zBooleanValue;
        String str;
        d3 d3VarA;
        Sdk.SDKError.Reason reason;
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(request, "$request");
        Intrinsics.g(urlWithSessionId, "$urlWithSessionId");
        Boolean bool = request.f47277e;
        if (bool != null) {
            zBooleanValue = bool.booleanValue();
        } else {
            String str2 = request.f47281i;
            zBooleanValue = Intrinsics.b(str2, "checkpoint.0") || Intrinsics.b(str2, "clickUrl") || Intrinsics.b(str2, AdSDKNotificationListener.IMPRESSION_EVENT) || Intrinsics.b(str2, "load_ad");
        }
        int i5 = 0;
        while (true) {
            str = urlWithSessionId;
            d3VarA = this$0.f47283a.a(str, request.b(), request.a(), request.d(), request.c());
            if (!zBooleanValue || d3VarA == null || !d3VarA.b() || (i5 = i5 + 1) >= request.e()) {
                break;
            } else {
                urlWithSessionId = str;
            }
        }
        if (d3VarA != null) {
            if (i5 >= request.e()) {
                reason = Sdk.SDKError.Reason.TPAT_RETRY_FAILED;
            } else {
                reason = Sdk.SDKError.Reason.TPAT_ERROR;
            }
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("tpat key: ");
            sbA.append(request.f47281i);
            sbA.append(", error: ");
            sbA.append(d3VarA.f46994a);
            sbA.append(", errorIsTerminal: ");
            sbA.append(d3VarA.f46995b);
            sbA.append(" url: ");
            sbA.append(str);
            String string = sbA.toString();
            boolean z12 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.b("TpatSender", string);
            new TpatError(reason, string).setLogEntry$vungle_ads_release(request.f47282j).logErrorNoReturnValue$vungle_ads_release();
        }
        if (request.f()) {
            if (d3VarA == null || !d3VarA.a()) {
                if (d3VarA != null || z11) {
                    synchronized (this$0.f47287e) {
                        try {
                            Map mapA = this$0.a();
                            d dVar = (d) mapA.get(request.i());
                            int iA = dVar != null ? dVar.a() : 0;
                            if (d3VarA == null && iA > 0) {
                                mapA.remove(request.i());
                                this$0.a(mapA);
                            } else if (d3VarA != null && iA >= request.g()) {
                                mapA.remove(request.i());
                                this$0.a(mapA);
                                Sdk.SDKError.Reason reason2 = Sdk.SDKError.Reason.TPAT_RETRY_FAILED;
                                String str3 = "tpat key: " + request.f47281i + ", error: " + d3VarA.f46994a + ", errorIsTerminal: " + d3VarA.f46995b + " url: " + str;
                                boolean z13 = com.vungle.ads.internal.util.u.f47714a;
                                com.vungle.ads.internal.util.t.b("TpatSender", str3);
                                new TpatError(reason2, str3).setLogEntry$vungle_ads_release(request.f47282j).logErrorNoReturnValue$vungle_ads_release();
                            } else if (d3VarA != null) {
                                d dVar2 = (d) mapA.get(request.i());
                                mapA.put(request.i(), dVar2 != null ? d.a(dVar2, iA + 1) : new d(request.d(), request.b(), request.a(), 1, request.g(), request.h()));
                                this$0.a(mapA);
                            }
                            Unit unit = Unit.f71706a;
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                }
            }
        }
    }

    public final Map a() {
        Object objA;
        String string = this.f47286d.getString("FAILED_TPATS");
        if (string != null) {
            try {
                int i5 = Result.f71687b;
                Json.Companion r12 = Json.INSTANCE;
                SerializersModule serializersModule = r12.getSerializersModule();
                KTypeProjection.Companion companion = KTypeProjection.INSTANCE;
                KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(serializersModule, Reflection.f71864a.mutableCollectionType(Reflection.e(companion.invariant(Reflection.b(String.class)), companion.invariant(Reflection.b(d.class)))));
                Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
                objA = (Map) r12.decodeFromString(kSerializerSerializer, string);
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            Throwable thA = Result.a(objA);
            if (thA != null) {
                boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.b("TpatSender", "Failed to decode stored tpats: " + thA);
            }
            if (Result.a(objA) != null) {
                objA = new LinkedHashMap();
            }
            Map map = (Map) objA;
            if (map != null) {
                return map;
            }
        }
        return new LinkedHashMap();
    }

    public final void a(Map map) {
        Object objA;
        try {
            int i5 = Result.f71687b;
            FilePreferences filePreferences = this.f47286d;
            Json.Companion r22 = Json.INSTANCE;
            SerializersModule serializersModule = r22.getSerializersModule();
            KTypeProjection.Companion companion = KTypeProjection.INSTANCE;
            KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(serializersModule, Reflection.f71864a.mutableCollectionType(Reflection.e(companion.invariant(Reflection.b(String.class)), companion.invariant(Reflection.b(d.class)))));
            Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
            filePreferences.a("FAILED_TPATS", r22.encodeToString(kSerializerSerializer, map)).b();
            objA = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (Result.a(objA) != null) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.b("TpatSender", "Failed to encode the about to storing tpats: " + map);
        }
    }
}
