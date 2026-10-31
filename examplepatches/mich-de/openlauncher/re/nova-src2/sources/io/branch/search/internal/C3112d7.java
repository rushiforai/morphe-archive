package io.branch.search.internal;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import io.branch.search.internal.AbstractC3196i6;
import io.branch.search.internal.C3366s8;
import io.branch.search.internal.J2;
import java.io.InputStream;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;
import kotlinx.serialization.SerializationException;
import okhttp3.internal.http2.StreamResetException;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.d7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3112d7 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final EnumC3075b4 f64253a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final F2 f64254b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Ye f64255c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final A9 f64256d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final InterfaceC3257m0 f64257e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final H f64258f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Cif f64259g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final y40.y f64260h;

    /* renamed from: io.branch.search.internal.d7$a */
    public static final class a {
    }

    @DebugMetadata(c = "io.branch.search.internal.network.HttpPool", f = "HttpPool.kt", l = {241}, m = "handle")
    /* renamed from: io.branch.search.internal.d7$b */
    public static final class b<T> extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3112d7 f64261a;

        /* renamed from: b, reason: collision with root package name */
        public String f64262b;

        /* renamed from: c, reason: collision with root package name */
        public x80.h0 f64263c;

        /* renamed from: d, reason: collision with root package name */
        public String f64264d;

        /* renamed from: e, reason: collision with root package name */
        public Function2 f64265e;

        /* renamed from: f, reason: collision with root package name */
        public Ref.ObjectRef f64266f;

        /* renamed from: g, reason: collision with root package name */
        public Ref.ObjectRef f64267g;

        /* renamed from: h, reason: collision with root package name */
        public /* synthetic */ Object f64268h;

        /* renamed from: j, reason: collision with root package name */
        public int f64270j;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f64268h = obj;
            this.f64270j |= Integer.MIN_VALUE;
            return C3112d7.this.a((String) null, (x80.h0) null, (String) null, (Function2) null, this);
        }
    }

    /* renamed from: io.branch.search.internal.d7$c */
    public static final class c extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ x80.h0 f64271a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef<x80.m0> f64272b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ T f64273c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(x80.h0 h0Var, Ref.ObjectRef<x80.m0> objectRef, T t6) {
            super(0);
            this.f64271a = h0Var;
            this.f64272b = objectRef;
            this.f64273c = t6;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "url: " + this.f64271a.f95509a + ", code: " + ((x80.m0) this.f64272b.f71863a).f95556d + ", " + this.f64273c;
        }
    }

    /* renamed from: io.branch.search.internal.d7$d */
    public static final class d extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ x80.h0 f64274a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ String f64275b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(x80.h0 h0Var, String str) {
            super(0);
            this.f64274a = h0Var;
            this.f64275b = str;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            x80.k0 k0Var = this.f64274a.f95512d;
            if (k0Var == null) {
                return null;
            }
            String sessionId = this.f64275b;
            Intrinsics.f(sessionId, "sessionId");
            return D6.a(k0Var, sessionId);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.network.HttpPool", f = "HttpPool.kt", l = {194}, m = "handleStream")
    /* renamed from: io.branch.search.internal.d7$e */
    public static final class e extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3112d7 f64276a;

        /* renamed from: b, reason: collision with root package name */
        public String f64277b;

        /* renamed from: c, reason: collision with root package name */
        public String f64278c;

        /* renamed from: d, reason: collision with root package name */
        public /* synthetic */ Object f64279d;

        /* renamed from: f, reason: collision with root package name */
        public int f64281f;

        public e(Continuation<? super e> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f64279d = obj;
            this.f64281f |= Integer.MIN_VALUE;
            return C3112d7.this.a(null, null, null, this);
        }
    }

    /* renamed from: io.branch.search.internal.d7$f */
    public static final class f extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f64282a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public f(String str) {
            super(0);
            this.f64282a = str;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return this.f64282a;
        }
    }

    public C3112d7(@NotNull EnumC3075b4 channel, @NotNull F2 remoteConfigManager, @NotNull Ye transferDataSource, @NotNull A9 networkRepository, @NotNull InterfaceC3257m0 analyticsStateRepository, @NotNull H analyticalBufferRepository, @NotNull Cif updateRemoteConfiguration, @NotNull y40.y maxDailyBandwidthCap) {
        Intrinsics.g(channel, "channel");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(transferDataSource, "transferDataSource");
        Intrinsics.g(networkRepository, "networkRepository");
        Intrinsics.g(analyticsStateRepository, "analyticsStateRepository");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(updateRemoteConfiguration, "updateRemoteConfiguration");
        Intrinsics.g(maxDailyBandwidthCap, "maxDailyBandwidthCap");
        this.f64253a = channel;
        this.f64254b = remoteConfigManager;
        this.f64255c = transferDataSource;
        this.f64256d = networkRepository;
        this.f64257e = analyticsStateRepository;
        this.f64258f = analyticalBufferRepository;
        this.f64259g = updateRemoteConfiguration;
        this.f64260h = maxDailyBandwidthCap;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final <T> void a(T t6, @NotNull Cif updateRemoteConfiguration) throws SerializationException {
        Intrinsics.g(updateRemoteConfiguration, "updateRemoteConfiguration");
        if (t6 instanceof JSONObject) {
            JSONObject jSONObject = (JSONObject) t6;
            if (jSONObject.has("api_remote_configuration") && this.f64253a.f64010d) {
                Object objRemove = jSONObject.remove("api_remote_configuration");
                JSONObject jSONObject2 = objRemove instanceof JSONObject ? (JSONObject) objRemove : null;
                if (jSONObject2 == null) {
                    return;
                }
                String string = jSONObject2.toString();
                Intrinsics.f(string, "remoteApiConfiguration.toString()");
                updateRemoteConfiguration.a(string);
            }
        }
    }

    public final void a(x80.m0 m0Var, String str) {
        if (m0Var != null) {
            try {
                m0Var.close();
            } catch (Exception e3) {
                this.f64258f.a("HttpPool.executeRequest", "exception closing okhttp Response.", e3, a80.m.n("request_id", str));
            }
        }
    }

    @Nullable
    public final Object a(@NotNull String str, @NotNull String str2, @Nullable InterfaceC3272mf interfaceC3272mf, @NotNull Z1 z12, @Nullable String str3, @NotNull C3366s8.a aVar) {
        String str4;
        x80.g0 g0Var = new x80.g0();
        g0Var.k(str2);
        g0Var.a("Accept", "application/json");
        g0Var.a("analytics_window_id", str);
        g0Var.j(String.class, str3);
        g0Var.d();
        if (this.f64253a.a()) {
            if (interfaceC3272mf != null && (str4 = interfaceC3272mf.get()) != null) {
                g0Var.a("User-Agent", str4);
            }
            g0Var.a("Accept-Language", z12.f63790g);
        }
        return a(str, g0Var.b(), str3, new C3146f7(this), aVar);
    }

    @Nullable
    public final Object a(@NotNull x80.h0 h0Var, @NotNull ContinuationImpl continuationImpl) {
        b90.j jVarC = this.f64253a.a(this.f64255c, this.f64256d, this.f64254b, this.f64258f, this.f64260h).c(h0Var);
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(continuationImpl));
        mVar.t();
        jVarC.b(new C3230k7(mVar));
        mVar.v(new C3213j7(jVarC));
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:179:0x035d  */
    /* JADX WARN: Removed duplicated region for block: B:186:0x0377  */
    /* JADX WARN: Removed duplicated region for block: B:200:0x03ac  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00a6 A[Catch: all -> 0x00b3, Exception -> 0x00b6, TryCatch #11 {Exception -> 0x00b6, all -> 0x00b3, blocks: (B:31:0x0086, B:35:0x0096, B:36:0x0099, B:38:0x00a6, B:44:0x00ba, B:46:0x00be, B:48:0x00cc, B:62:0x0105, B:65:0x0113, B:67:0x012c, B:69:0x013f, B:71:0x0149, B:74:0x0151, B:75:0x0157, B:114:0x0221, B:116:0x0229, B:117:0x0236, B:124:0x024f, B:126:0x025f, B:127:0x0274, B:122:0x023f, B:123:0x0249, B:143:0x02b4, B:144:0x02c5, B:145:0x02c6, B:89:0x0194, B:92:0x019c, B:93:0x01a2, B:95:0x01ac, B:96:0x01b6, B:110:0x0213, B:113:0x0219), top: B:211:0x0086, inners: #10 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00be A[Catch: all -> 0x00b3, Exception -> 0x00b6, TryCatch #11 {Exception -> 0x00b6, all -> 0x00b3, blocks: (B:31:0x0086, B:35:0x0096, B:36:0x0099, B:38:0x00a6, B:44:0x00ba, B:46:0x00be, B:48:0x00cc, B:62:0x0105, B:65:0x0113, B:67:0x012c, B:69:0x013f, B:71:0x0149, B:74:0x0151, B:75:0x0157, B:114:0x0221, B:116:0x0229, B:117:0x0236, B:124:0x024f, B:126:0x025f, B:127:0x0274, B:122:0x023f, B:123:0x0249, B:143:0x02b4, B:144:0x02c5, B:145:0x02c6, B:89:0x0194, B:92:0x019c, B:93:0x01a2, B:95:0x01ac, B:96:0x01b6, B:110:0x0213, B:113:0x0219), top: B:211:0x0086, inners: #10 }] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00cc A[Catch: all -> 0x00b3, Exception -> 0x00b6, TRY_LEAVE, TryCatch #11 {Exception -> 0x00b6, all -> 0x00b3, blocks: (B:31:0x0086, B:35:0x0096, B:36:0x0099, B:38:0x00a6, B:44:0x00ba, B:46:0x00be, B:48:0x00cc, B:62:0x0105, B:65:0x0113, B:67:0x012c, B:69:0x013f, B:71:0x0149, B:74:0x0151, B:75:0x0157, B:114:0x0221, B:116:0x0229, B:117:0x0236, B:124:0x024f, B:126:0x025f, B:127:0x0274, B:122:0x023f, B:123:0x0249, B:143:0x02b4, B:144:0x02c5, B:145:0x02c6, B:89:0x0194, B:92:0x019c, B:93:0x01a2, B:95:0x01ac, B:96:0x01b6, B:110:0x0213, B:113:0x0219), top: B:211:0x0086, inners: #10 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0105 A[Catch: all -> 0x00b3, Exception -> 0x00b6, TRY_ENTER, TRY_LEAVE, TryCatch #11 {Exception -> 0x00b6, all -> 0x00b3, blocks: (B:31:0x0086, B:35:0x0096, B:36:0x0099, B:38:0x00a6, B:44:0x00ba, B:46:0x00be, B:48:0x00cc, B:62:0x0105, B:65:0x0113, B:67:0x012c, B:69:0x013f, B:71:0x0149, B:74:0x0151, B:75:0x0157, B:114:0x0221, B:116:0x0229, B:117:0x0236, B:124:0x024f, B:126:0x025f, B:127:0x0274, B:122:0x023f, B:123:0x0249, B:143:0x02b4, B:144:0x02c5, B:145:0x02c6, B:89:0x0194, B:92:0x019c, B:93:0x01a2, B:95:0x01ac, B:96:0x01b6, B:110:0x0213, B:113:0x0219), top: B:211:0x0086, inners: #10 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final <T> Object a(@NotNull String str, @NotNull x80.h0 h0Var, @Nullable String str2, @NotNull Function2<? super String, ? super String, ? extends T> function2, @NotNull Continuation<? super AbstractC3196i6<J2, ? extends T>> continuation) throws Throwable {
        b bVar;
        Ref.ObjectRef objectRefL;
        String str3;
        C3112d7 c3112d7;
        Ref.ObjectRef objectRef;
        String str4;
        String str5;
        Function2<? super String, ? super String, ? extends T> function22;
        Object objA;
        C3112d7 c3112d72;
        String strB;
        Object obj;
        String strB2;
        Object obj2;
        JSONObject jSONObjectA;
        x80.m0 m0Var;
        J2 j2A;
        Object aVar;
        String strB3;
        String strB4;
        Object objA2;
        String strB5;
        String strB6;
        String str6;
        String strB7;
        x80.h0 h0Var2 = h0Var;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f64270j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f64270j = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object obj3 = bVar.f64268h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f64270j;
        if (i11 == 0) {
            objectRefL = b.u4.l(obj3);
            try {
                try {
                } catch (Exception e3) {
                    e = e3;
                    str3 = str;
                }
            } catch (Throwable th2) {
                th = th2;
            }
            try {
                if (this.f64256d.isConnected()) {
                    bVar.f64261a = this;
                    str3 = str;
                    try {
                        bVar.f64262b = str3;
                        bVar.f64263c = h0Var2;
                        bVar.f64264d = str2;
                        function22 = function2;
                        bVar.f64265e = function22;
                        bVar.f64266f = objectRefL;
                        bVar.f64267g = objectRefL;
                        bVar.f64270j = 1;
                        objA = a(h0Var2, bVar);
                        if (objA == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        objectRef = objectRefL;
                        str4 = str2;
                        str5 = str3;
                        c3112d72 = this;
                        objectRefL.f71863a = objA;
                        jSONObjectA = C3078b7.a((x80.m0) objectRef.f71863a);
                        if (str4 != null) {
                            jSONObjectA.putOpt("request_id", str4);
                        }
                        m0Var = (x80.m0) objectRef.f71863a;
                        c3112d72.getClass();
                        if (m0Var.f95556d < 500) {
                        }
                        if (m0Var.f95559g == null) {
                        }
                        if (j2A == null) {
                        }
                    } catch (Exception e11) {
                        e = e11;
                        c3112d7 = this;
                        objectRef = objectRefL;
                        str4 = str2;
                        str5 = str3;
                        AbstractC3196i6.a aVar2 = new AbstractC3196i6.a(c3112d7.a(str5, e));
                        if (c3112d7.f64253a == EnumC3075b4.f63994l && (strB2 = h0Var2.f95511c.b("analytics_window_id")) != null) {
                            obj2 = objectRef.f71863a;
                            if (obj2 == null && ((x80.m0) obj2).f95556d == 200) {
                                c3112d7.f64257e.a(strB2);
                            } else {
                                c3112d7.f64257e.a(strB2, new d(h0Var2, strB2));
                            }
                            Unit unit = Unit.f71706a;
                        }
                        c3112d7.a((x80.m0) objectRef.f71863a, str4);
                        return aVar2;
                    }
                } else {
                    throw new C3367s9();
                }
            } catch (Exception e12) {
                e = e12;
                c3112d7 = this;
                objectRef = objectRefL;
                str4 = str2;
                str5 = str3;
                AbstractC3196i6.a aVar22 = new AbstractC3196i6.a(c3112d7.a(str5, e));
                if (c3112d7.f64253a == EnumC3075b4.f63994l) {
                }
                c3112d7.a((x80.m0) objectRef.f71863a, str4);
                return aVar22;
            } catch (Throwable th3) {
                th = th3;
                c3112d7 = this;
                objectRef = objectRefL;
                str4 = str2;
                if (c3112d7.f64253a == EnumC3075b4.f63994l) {
                    obj = objectRef.f71863a;
                    if (obj == null) {
                        c3112d7.f64257e.a(strB, new d(h0Var2, strB));
                        Unit unit2 = Unit.f71706a;
                    }
                }
                c3112d7.a((x80.m0) objectRef.f71863a, str4);
                throw th;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Ref.ObjectRef objectRef2 = bVar.f64267g;
            objectRef = bVar.f64266f;
            Function2<? super String, ? super String, ? extends T> function23 = bVar.f64265e;
            str4 = bVar.f64264d;
            x80.h0 h0Var3 = bVar.f64263c;
            str5 = bVar.f64262b;
            c3112d7 = bVar.f64261a;
            try {
                ResultKt.b(obj3);
                objA = obj3;
                function22 = function23;
                objectRefL = objectRef2;
                h0Var2 = h0Var3;
                c3112d72 = c3112d7;
                try {
                    objectRefL.f71863a = objA;
                    jSONObjectA = C3078b7.a((x80.m0) objectRef.f71863a);
                    if (str4 != null && jSONObjectA != null) {
                        jSONObjectA.putOpt("request_id", str4);
                    }
                    m0Var = (x80.m0) objectRef.f71863a;
                    c3112d72.getClass();
                    j2A = m0Var.f95556d < 500 ? a(c3112d72, str5, J2.b.INTERNAL_SERVER_ERR, "statusCode >= 500", jSONObjectA, null, 16) : null;
                    if (m0Var.f95559g == null) {
                        j2A = a(c3112d72, str5, J2.b.INTERNAL_ERR, "response.body() == null", jSONObjectA, null, 16);
                    }
                    if (j2A == null) {
                        AbstractC3196i6.a aVar3 = new AbstractC3196i6.a(j2A);
                        if (c3112d72.f64253a == EnumC3075b4.f63994l && (strB7 = h0Var2.f95511c.b("analytics_window_id")) != null) {
                            Object obj4 = objectRef.f71863a;
                            if (obj4 != null && ((x80.m0) obj4).f95556d == 200) {
                                c3112d72.f64257e.a(strB7);
                            } else {
                                c3112d72.f64257e.a(strB7, new d(h0Var2, strB7));
                            }
                            Unit unit3 = Unit.f71706a;
                        }
                        c3112d72.a((x80.m0) objectRef.f71863a, str4);
                        return aVar3;
                    }
                    if (c3112d72.f64253a.a()) {
                        List listF = ((x80.m0) objectRef.f71863a).f95558f.f("Content-Type");
                        Intrinsics.f(listF, "response.headers().values(\"Content-Type\")");
                        String str7 = (String) b70.g.Y0(listF);
                        if (!Intrinsics.b((str7 == null || (str6 = (String) b70.g.Y0(r70.k.i1(str7, new String[]{";"}, 6))) == null) ? null : r70.k.u1(str6).toString(), "application/json")) {
                            if (jSONObjectA != null) {
                                c3112d72.f64258f.a(str5, "api_calls", jSONObjectA, false);
                            }
                            AbstractC3196i6.b bVar2 = new AbstractC3196i6.b(function22.invoke("application/json", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
                            if (c3112d72.f64253a == EnumC3075b4.f63994l && (strB6 = h0Var2.f95511c.b("analytics_window_id")) != null) {
                                Object obj5 = objectRef.f71863a;
                                if (obj5 != null && ((x80.m0) obj5).f95556d == 200) {
                                    c3112d72.f64257e.a(strB6);
                                } else {
                                    c3112d72.f64257e.a(strB6, new d(h0Var2, strB6));
                                }
                                Unit unit4 = Unit.f71706a;
                            }
                            c3112d72.a((x80.m0) objectRef.f71863a, str4);
                            return bVar2;
                        }
                    } else {
                        EnumC3075b4 enumC3075b4 = c3112d72.f64253a;
                        if (enumC3075b4 == EnumC3075b4.o) {
                            if (jSONObjectA != null) {
                                c3112d72.f64258f.a(str5, "api_calls", jSONObjectA, false);
                            }
                            if (((x80.m0) objectRef.f71863a).f95556d == 200) {
                                aVar = new AbstractC3196i6.b(function22.invoke("application/json", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
                            } else {
                                J2.b errorCode = J2.b.INTERNAL_ERR;
                                String errorMessage = "Ping service http status code " + ((x80.m0) objectRef.f71863a).f95556d;
                                Intrinsics.g(errorCode, "errorCode");
                                Intrinsics.g(errorMessage, "errorMessage");
                                aVar = new AbstractC3196i6.a(new J2(errorCode, errorMessage, null));
                            }
                            if (c3112d72.f64253a == EnumC3075b4.f63994l && (strB3 = h0Var2.f95511c.b("analytics_window_id")) != null) {
                                Object obj6 = objectRef.f71863a;
                                if (obj6 != null && ((x80.m0) obj6).f95556d == 200) {
                                    c3112d72.f64257e.a(strB3);
                                } else {
                                    c3112d72.f64257e.a(strB3, new d(h0Var2, strB3));
                                }
                                Unit unit5 = Unit.f71706a;
                            }
                            c3112d72.a((x80.m0) objectRef.f71863a, str4);
                            return aVar;
                        }
                        if (enumC3075b4 == EnumC3075b4.f63996p && jSONObjectA != null) {
                            c3112d72.f64258f.a(str5, "api_calls", jSONObjectA, false);
                            Unit unit6 = Unit.f71706a;
                        }
                    }
                    x80.p0 p0Var = ((x80.m0) objectRef.f71863a).f95559g;
                    try {
                        if (p0Var == null) {
                            throw new JSONException("Invalid response received for " + str4);
                        }
                        String strString = p0Var.string();
                        Intrinsics.f(strString, "body.string()");
                        Object objInvoke = function22.invoke("application/json", strString);
                        if ((objInvoke instanceof JSONObject) && jSONObjectA != null) {
                            if (str4 == null) {
                                jSONObjectA.putOpt("request_id", ((JSONObject) objInvoke).optString("request_id"));
                            }
                            c3112d72.f64258f.a(str5, "api_calls", jSONObjectA, false);
                        }
                        c3112d72.a((C3112d7) objInvoke, c3112d72.f64259g);
                        Object obj7 = objectRef.f71863a;
                        if (((x80.m0) obj7).f95556d == 200) {
                            c cVar = new c(h0Var2, objectRef, objInvoke);
                            C3309p1 c3309p1 = C3309p1.f65465a;
                            C3309p1.a(a50.b.f400a, "BranchSearchSDK", cVar, (Throwable) null);
                            objA2 = new AbstractC3196i6.b(objInvoke);
                        } else {
                            objA2 = a(h0Var2, objInvoke, ((x80.m0) obj7).f95556d);
                        }
                        if (c3112d72.f64253a == EnumC3075b4.f63994l && (strB5 = h0Var2.f95511c.b("analytics_window_id")) != null) {
                            Object obj8 = objectRef.f71863a;
                            if (obj8 != null && ((x80.m0) obj8).f95556d == 200) {
                                c3112d72.f64257e.a(strB5);
                            } else {
                                c3112d72.f64257e.a(strB5, new d(h0Var2, strB5));
                            }
                            Unit unit7 = Unit.f71706a;
                        }
                        c3112d72.a((x80.m0) objectRef.f71863a, str4);
                        return objA2;
                    } catch (JSONException e13) {
                        AbstractC3196i6.a aVar4 = new AbstractC3196i6.a(c3112d72.a(str5, J2.b.INTERNAL_SERVER_ERR, e13.getClass().getSimpleName() + ": " + e13.getMessage(), jSONObjectA, e13));
                        if (c3112d72.f64253a == EnumC3075b4.f63994l && (strB4 = h0Var2.f95511c.b("analytics_window_id")) != null) {
                            Object obj9 = objectRef.f71863a;
                            if (obj9 != null && ((x80.m0) obj9).f95556d == 200) {
                                c3112d72.f64257e.a(strB4);
                            } else {
                                c3112d72.f64257e.a(strB4, new d(h0Var2, strB4));
                            }
                            Unit unit8 = Unit.f71706a;
                        }
                        c3112d72.a((x80.m0) objectRef.f71863a, str4);
                        return aVar4;
                    }
                } catch (Exception e14) {
                    e = e14;
                    c3112d7 = c3112d72;
                    try {
                        AbstractC3196i6.a aVar222 = new AbstractC3196i6.a(c3112d7.a(str5, e));
                        if (c3112d7.f64253a == EnumC3075b4.f63994l) {
                            obj2 = objectRef.f71863a;
                            if (obj2 == null) {
                                c3112d7.f64257e.a(strB2, new d(h0Var2, strB2));
                                Unit unit9 = Unit.f71706a;
                            }
                        }
                        c3112d7.a((x80.m0) objectRef.f71863a, str4);
                        return aVar222;
                    } catch (Throwable th4) {
                        th = th4;
                    }
                } catch (Throwable th5) {
                    th = th5;
                    c3112d7 = c3112d72;
                }
            } catch (Exception e15) {
                e = e15;
                h0Var2 = h0Var3;
                AbstractC3196i6.a aVar2222 = new AbstractC3196i6.a(c3112d7.a(str5, e));
                if (c3112d7.f64253a == EnumC3075b4.f63994l) {
                }
                c3112d7.a((x80.m0) objectRef.f71863a, str4);
                return aVar2222;
            } catch (Throwable th6) {
                th = th6;
                h0Var2 = h0Var3;
            }
        }
        if (c3112d7.f64253a == EnumC3075b4.f63994l && (strB = h0Var2.f95511c.b("analytics_window_id")) != null) {
            obj = objectRef.f71863a;
            if (obj == null && ((x80.m0) obj).f95556d == 200) {
                c3112d7.f64257e.a(strB);
            } else {
                c3112d7.f64257e.a(strB, new d(h0Var2, strB));
            }
            Unit unit22 = Unit.f71706a;
        }
        c3112d7.a((x80.m0) objectRef.f71863a, str4);
        throw th;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x0088 A[Catch: Exception -> 0x0094, all -> 0x00e3, TRY_ENTER, TryCatch #1 {all -> 0x00e3, blocks: (B:28:0x006a, B:31:0x0072, B:35:0x007d, B:36:0x0080, B:39:0x0088, B:44:0x009a, B:46:0x00a7, B:51:0x00b4, B:53:0x00ba, B:56:0x00c2, B:57:0x00c8), top: B:89:0x006a }] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x009a A[Catch: Exception -> 0x0094, all -> 0x00e3, TRY_LEAVE, TryCatch #1 {all -> 0x00e3, blocks: (B:28:0x006a, B:31:0x0072, B:35:0x007d, B:36:0x0080, B:39:0x0088, B:44:0x009a, B:46:0x00a7, B:51:0x00b4, B:53:0x00ba, B:56:0x00c2, B:57:0x00c8), top: B:89:0x006a }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00a7 A[Catch: Exception -> 0x0078, all -> 0x00e3, TRY_ENTER, TRY_LEAVE, TryCatch #1 {all -> 0x00e3, blocks: (B:28:0x006a, B:31:0x0072, B:35:0x007d, B:36:0x0080, B:39:0x0088, B:44:0x009a, B:46:0x00a7, B:51:0x00b4, B:53:0x00ba, B:56:0x00c2, B:57:0x00c8), top: B:89:0x006a }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0101  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Removed duplicated region for block: B:99:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, x80.h0 h0Var, String str2, Continuation<? super AbstractC3196i6<J2, ? extends InputStream>> continuation) throws Throwable {
        e eVar;
        Throwable th2;
        C3112d7 c3112d7;
        C3112d7 c3112d72;
        String str3;
        String str4;
        AbstractC3196i6.a aVar;
        Object aVar2;
        x80.m0 m0Var;
        Exception exc;
        JSONObject jSONObjectA;
        x80.p0 p0Var;
        J2 j2A;
        m90.i iVarSource;
        if (continuation instanceof e) {
            eVar = (e) continuation;
            int i5 = eVar.f64281f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f64281f = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(continuation);
            }
        }
        Object obj = eVar.f64279d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f64281f;
        x80.m0 m0Var2 = null;
        m0Var = null;
        inputStreamB0 = null;
        InputStream inputStreamB0 = null;
        m0Var = null;
        x80.m0 m0Var3 = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                try {
                    if (this.f64256d.isConnected()) {
                        eVar.f64276a = this;
                        eVar.f64277b = str;
                        eVar.f64278c = str2;
                        eVar.f64281f = 1;
                        Object objA = a(h0Var, eVar);
                        if (objA == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        c3112d72 = this;
                        str3 = str;
                        str4 = str2;
                        obj = objA;
                        m0Var = (x80.m0) obj;
                        jSONObjectA = C3078b7.a(m0Var);
                        if (str4 != null) {
                            jSONObjectA.putOpt("request_id", str4);
                        }
                        c3112d72.getClass();
                        int i12 = m0Var.f95556d;
                        p0Var = m0Var.f95559g;
                        if (i12 < 500) {
                        }
                        if (p0Var == null) {
                        }
                        if (j2A == null) {
                        }
                    } else {
                        throw new C3367s9();
                    }
                } catch (Exception e3) {
                    e = e3;
                    c3112d7 = this;
                    aVar = new AbstractC3196i6.a(c3112d7.a(str, e));
                    if (m0Var3 == null && m0Var3.f95556d != 200) {
                        aVar2 = aVar;
                        m0Var = m0Var3;
                        m0Var.close();
                        return aVar2;
                    }
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                str4 = eVar.f64278c;
                String str5 = eVar.f64277b;
                c3112d7 = eVar.f64276a;
                try {
                    ResultKt.b(obj);
                    c3112d72 = c3112d7;
                    str3 = str5;
                    try {
                        m0Var = (x80.m0) obj;
                    } catch (Exception e11) {
                        exc = e11;
                    }
                    try {
                        try {
                            jSONObjectA = C3078b7.a(m0Var);
                            if (str4 != null && jSONObjectA != null) {
                                jSONObjectA.putOpt("request_id", str4);
                            }
                            try {
                                c3112d72.getClass();
                            } catch (Exception e12) {
                                e = e12;
                            }
                        } catch (Throwable th3) {
                            th2 = th3;
                            m0Var2 = m0Var;
                            if (m0Var2 != null && m0Var2.f95556d != 200) {
                                m0Var2.close();
                                throw th2;
                            }
                            throw th2;
                        }
                    } catch (Exception e13) {
                        exc = e13;
                        m0Var3 = m0Var;
                        e = exc;
                        c3112d7 = c3112d72;
                        str = str3;
                        aVar = new AbstractC3196i6.a(c3112d7.a(str, e));
                        return m0Var3 == null ? aVar : aVar;
                    }
                } catch (Exception e14) {
                    e = e14;
                    str = str5;
                    aVar = new AbstractC3196i6.a(c3112d7.a(str, e));
                    if (m0Var3 == null) {
                    }
                }
                try {
                    int i122 = m0Var.f95556d;
                    p0Var = m0Var.f95559g;
                    j2A = i122 < 500 ? a(c3112d72, str3, J2.b.INTERNAL_SERVER_ERR, "statusCode >= 500", jSONObjectA, null, 16) : null;
                    if (p0Var == null) {
                        j2A = a(c3112d72, str3, J2.b.INTERNAL_ERR, "response.body() == null", jSONObjectA, null, 16);
                    }
                    if (j2A == null) {
                        AbstractC3196i6.a aVar3 = new AbstractC3196i6.a(j2A);
                        if (i122 != 200) {
                            m0Var.close();
                        }
                        return aVar3;
                    }
                    if (p0Var != null && (iVarSource = p0Var.source()) != null) {
                        inputStreamB0 = iVarSource.b0();
                    }
                    if (i122 == 200 && inputStreamB0 != null) {
                        aVar2 = new AbstractC3196i6.b(inputStreamB0);
                    } else {
                        aVar2 = new AbstractC3196i6.a(a(c3112d72, str3, J2.b.BAD_REQUEST_ERR, "Failed to fetch response stream", jSONObjectA, null, 16));
                    }
                    if (i122 == 200) {
                        return aVar2;
                    }
                } catch (Exception e15) {
                    e = e15;
                    m0Var3 = m0Var;
                    c3112d7 = c3112d72;
                    str = str3;
                    aVar = new AbstractC3196i6.a(c3112d7.a(str, e));
                    if (m0Var3 == null) {
                    }
                }
            }
            m0Var.close();
            return aVar2;
        } catch (Throwable th4) {
            th2 = th4;
        }
    }

    public final J2 a(String str, J2.b errorCode, String msg, JSONObject jSONObject, Throwable th2) throws JSONException {
        String string;
        f fVar = new f(msg);
        C3309p1 c3309p1 = C3309p1.f65465a;
        C3309p1.a(a50.b.f400a, "BranchSearchSDK", fVar, (Throwable) null);
        if (jSONObject != null) {
            int i5 = C3078b7.f64018a;
            Intrinsics.g(msg, "msg");
            if (jSONObject.has("exception")) {
                StringBuilder sbK = com.google.android.gms.internal.measurement.k2.k(msg, ", ");
                sbK.append(jSONObject.get("exception"));
                string = sbK.toString();
            } else {
                string = msg;
            }
            jSONObject.putOpt("exception", string);
            this.f64258f.a(str, "api_calls", jSONObject, false);
        }
        if (errorCode == J2.b.INTERNAL_ERR) {
            return new J2(errorCode, msg, th2);
        }
        Intrinsics.g(errorCode, "errorCode");
        return new J2(errorCode, J2.a.a(J2.Companion, errorCode), th2);
    }

    public static /* synthetic */ J2 a(C3112d7 c3112d7, String str, J2.b bVar, String str2, JSONObject jSONObject, Throwable th2, int i5) {
        if ((i5 & 8) != 0) {
            jSONObject = null;
        }
        if ((i5 & 16) != 0) {
            th2 = null;
        }
        return c3112d7.a(str, bVar, str2, jSONObject, th2);
    }

    public final J2 a(String str, Exception exc) {
        String str2 = exc.getClass().getSimpleName() + ": " + exc.getMessage();
        if ((exc instanceof StreamResetException) || (exc instanceof SocketException) || (exc instanceof SocketTimeoutException) || (exc instanceof C3367s9) || (exc instanceof UnknownHostException)) {
            return a(this, str, J2.b.BRANCH_NO_CONNECTIVITY_ERR, str2, null, exc, 8);
        }
        if (exc instanceof C3486z9) {
            return new J2(J2.b.INTERNAL_ERR, "Network limit exceeded", exc);
        }
        return a(this, str, J2.b.INTERNAL_ERR, str2, null, exc, 8);
    }

    public static AbstractC3196i6.a a(x80.h0 h0Var, Object obj, int i5) throws JSONException {
        J2 j22;
        JSONObject jSONObject = obj instanceof JSONObject ? (JSONObject) obj : null;
        if (jSONObject != null && jSONObject.has("error") && jSONObject.getJSONObject("error").has(PglCryptUtils.KEY_MESSAGE)) {
            jSONObject = jSONObject.getJSONObject("error");
        }
        if (i5 >= 400) {
            J2.b.Companion.getClass();
            J2.b errorCode = J2.b.a.a(i5);
            if (errorCode == J2.b.INTERNAL_ERR) {
                String errorMessage = "Http status code " + i5;
                Intrinsics.g(errorCode, "errorCode");
                Intrinsics.g(errorMessage, "errorMessage");
                j22 = new J2(errorCode, errorMessage, null);
            } else {
                Intrinsics.g(errorCode, "errorCode");
                j22 = new J2(errorCode, J2.a.a(J2.Companion, errorCode), null);
            }
        } else {
            J2.b.a aVar = J2.b.Companion;
            int iOptInt = jSONObject != null ? jSONObject.optInt(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE) : 0;
            aVar.getClass();
            J2.b bVarA = J2.b.a.a(iOptInt);
            String strOptString = jSONObject != null ? jSONObject.optString(PglCryptUtils.KEY_MESSAGE) : null;
            if (strOptString == null) {
                strOptString = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            j22 = new J2(bVarA, strOptString, null);
        }
        C3309p1.a("HttpPool", new C3197i7(jSONObject, h0Var, i5));
        return new AbstractC3196i6.a(j22);
    }
}
