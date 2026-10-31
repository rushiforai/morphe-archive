package i20;

import android.net.TrafficStats;
import b.c0;
import b90.j;
import com.instabridge.ai.auth.LoginTokenApi;
import java.io.Closeable;
import java.io.Serializable;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONObject;
import ps.j0;
import r70.k;
import x80.e0;
import x80.g0;
import x80.m0;
import x80.p0;
import x80.v;
import x80.w;

/* loaded from: classes.dex */
public abstract class g implements s80.a {

    /* renamed from: a, reason: collision with root package name */
    public final e0 f61212a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f61213b;

    /* renamed from: c, reason: collision with root package name */
    public final String f61214c;

    /* renamed from: d, reason: collision with root package name */
    public d f61215d;

    public g(e0 e0Var, String str, Function1 function1, String str2) {
        this.f61212a = e0Var;
        this.f61213b = function1;
        this.f61214c = str2;
        this.f61215d = str != null ? io.sentry.config.a.G(str) : null;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Serializable i(g gVar, String str, String str2, ContinuationImpl continuationImpl) {
        e eVar;
        String str3;
        Serializable serializableA;
        g gVar2;
        String str4;
        boolean z11;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f61205x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f61205x = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(gVar, continuationImpl);
            }
        }
        e eVar2 = eVar;
        Object objJ = eVar2.f61203v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar2.f61205x;
        if (i11 == 0) {
            ResultKt.b(objJ);
            d dVar = gVar.f61215d;
            String str5 = gVar.f61214c;
            if (dVar == null) {
                int i12 = Result.f71687b;
                serializableA = ResultKt.a(new Exception(c0.k("No auth info for ", str)));
            } else if (dVar instanceof b) {
                int i13 = Result.f71687b;
                serializableA = Boolean.FALSE;
            } else {
                if (!(dVar instanceof c)) {
                    throw new NoWhenBranchMatchedException();
                }
                c cVar = (c) dVar;
                if (cVar.c() - 300000 >= System.currentTimeMillis()) {
                    str3 = str;
                    int i14 = Result.f71687b;
                    serializableA = Boolean.FALSE;
                    z11 = serializableA instanceof Result.Failure;
                    if (!z11) {
                        mc0.b bVar = mc0.d.f76206a;
                        bVar.r(str5);
                        bVar.p(Result.a(serializableA), "refreshOauthTokens with forceRefresh=false failed", new Object[0]);
                        return serializableA;
                    }
                    if (!z11) {
                        Boolean bool = (Boolean) (z11 ? null : serializableA);
                        if (bool != null && bool.booleanValue()) {
                            mc0.b bVar2 = mc0.d.f76206a;
                            bVar2.r(str5);
                            bVar2.b("Successfully refreshed auth for " + str3, new Object[0]);
                        }
                    }
                    return serializableA;
                }
                String strD = cVar.d();
                eVar2.f61201t = gVar;
                eVar2.f61202u = str;
                eVar2.f61205x = 1;
                objJ = gVar.j(strD, null, str, str2, "https://sesame.ninja/app/auth/branch_exchange.php", eVar2);
                if (objJ == coroutineSingletons) {
                    return coroutineSingletons;
                }
                gVar2 = gVar;
                str4 = str;
            }
            str3 = str;
            z11 = serializableA instanceof Result.Failure;
            if (!z11) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str4 = eVar2.f61202u;
            gVar2 = eVar2.f61201t;
            ResultKt.b(objJ);
        }
        d dVar2 = (d) objJ;
        if (dVar2 == null) {
            int i15 = Result.f71687b;
            return ResultKt.a(new Exception(c0.k("Failed to refresh auth for ", str4)));
        }
        gVar2.k(dVar2);
        int i16 = Result.f71687b;
        return Boolean.TRUE;
    }

    @Override // s80.c
    public final s80.e a() {
        j0.m();
        return s80.e.f86765a;
    }

    public final Unit g(m0 m0Var) {
        if (m0Var.f95556d != 401) {
            return Unit.f71706a;
        }
        h();
        throw new IllegalStateException("Received Unauthorized code, clearing AuthInfo, ".concat(this.f61214c));
    }

    public final void h() {
        this.f61215d = null;
        this.f61213b.invoke(null);
        mc0.b bVar = mc0.d.f76206a;
        bVar.r(this.f61214c);
        bVar.b(c0.k("Cleared authentication for ", d()), new Object[0]);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0029  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(String str, String str2, String str3, String str4, String str5, ContinuationImpl continuationImpl) {
        f fVar;
        String str6;
        String str7;
        String str8;
        g gVar;
        long j11;
        String str9 = str;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i5 = fVar.f61211y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f61211y = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(this, continuationImpl);
            }
        }
        Object objAwait = fVar.f61209w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fVar.f61211y;
        if (i11 == 0) {
            ResultKt.b(objAwait);
            String str10 = this.f61214c;
            if ((str2 == null || str2.length() == 0) && (str9 == null || k.U0(str9))) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r(str10);
                bVar.n("Code/token exchange requires either authorizationCode or refreshToken", new Object[0]);
                return null;
            }
            Intrinsics.g(str5, "<this>");
            v vVar = new v();
            vVar.e(null, str5);
            w wVarB = vVar.b();
            long jCurrentTimeMillis = System.currentTimeMillis();
            TrafficStats.setThreadStatsTag(str10.hashCode());
            str6 = "Ignoring bad response from server. Missing `status` field. Response:\n";
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r(str10);
            str7 = "Ignoring bad response from server. Missing data field(s). Response:\n";
            str8 = "status";
            bVar2.b("Starting token exchange:\n" + wVarB, new Object[0]);
            g0 g0Var = new g0();
            g0Var.f95504a = wVarB;
            of.f fVar2 = new of.f();
            fVar2.b("package_name", str3);
            if (str4 != null) {
                fVar2.b("redirect_uri", str4);
            }
            if (str9 != null) {
                fVar2.b(LoginTokenApi.GRANT_REFRESH_TOKEN, str9);
            } else if (str2 != null) {
                fVar2.b("authorization_code", str2);
            }
            g0Var.h(fVar2.c());
            try {
                j jVarC = this.f61212a.c(g0Var.b());
                fVar.f61206t = this;
                fVar.f61207u = str9;
                fVar.f61208v = jCurrentTimeMillis;
                fVar.f61211y = 1;
                objAwait = UtilsKt.await(jVarC, fVar);
                if (objAwait == coroutineSingletons) {
                    return coroutineSingletons;
                }
                gVar = this;
                j11 = jCurrentTimeMillis;
            } catch (Throwable unused) {
                gVar = this;
                mc0.b bVar3 = mc0.d.f76206a;
                bVar3.r(gVar.f61214c);
                bVar3.d("Failed server exchange", new Object[0]);
                return null;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = fVar.f61208v;
            str9 = fVar.f61207u;
            gVar = fVar.f61206t;
            try {
                ResultKt.b(objAwait);
                str8 = "status";
                str6 = "Ignoring bad response from server. Missing `status` field. Response:\n";
                str7 = "Ignoring bad response from server. Missing data field(s). Response:\n";
            } catch (Throwable unused2) {
                mc0.b bVar32 = mc0.d.f76206a;
                bVar32.r(gVar.f61214c);
                bVar32.d("Failed server exchange", new Object[0]);
                return null;
            }
        }
        Closeable closeable = (Closeable) objAwait;
        try {
            m0 m0Var = (m0) closeable;
            p0 p0Var = m0Var.f95559g;
            String strString = p0Var != null ? p0Var.string() : null;
            mc0.b bVar4 = mc0.d.f76206a;
            String str11 = gVar.f61214c;
            bVar4.r(str11);
            bVar4.b("Got response from server: " + m0Var.f95556d + " " + m0Var.f95555c + ":\n" + strString, new Object[0]);
            bVar4.r(str11);
            String str12 = str9;
            bVar4.b("OkHttp request elapsed time: " + (m0Var.f95564l - m0Var.f95563k) + "ms", new Object[0]);
            if (strString != null && !k.U0(strString)) {
                JSONObject jSONObject = new JSONObject(strString);
                String str13 = str8;
                if (jSONObject.has(str13) && Intrinsics.b(jSONObject.getString(str13), "ok")) {
                    String strOptStringNull = UtilsKt.optStringNull(jSONObject, "access_token");
                    String strOptStringNull2 = UtilsKt.optStringNull(jSONObject, LoginTokenApi.GRANT_REFRESH_TOKEN);
                    if (strOptStringNull2 == null) {
                        strOptStringNull2 = str12;
                    }
                    long jOptLong = jSONObject.optLong("expires_in", -1L);
                    if (strOptStringNull != null) {
                        Object bVar5 = (strOptStringNull2 == null || jOptLong == -1) ? new b(strOptStringNull) : new c(strOptStringNull, strOptStringNull2, (1000 * jOptLong) + j11);
                        CloseableKt.a(closeable, null);
                        return bVar5;
                    }
                    bVar4.r(str11);
                    bVar4.n(str7 + jSONObject.toString(4), new Object[0]);
                } else {
                    if (Intrinsics.b(jSONObject.getString(str13), "error") && jSONObject.getInt("error_http_code") == 401) {
                        gVar.h();
                    }
                    bVar4.r(str11);
                    bVar4.n(str6 + jSONObject.toString(4), new Object[0]);
                }
            }
            Unit unit = Unit.f71706a;
            CloseableKt.a(closeable, null);
            return null;
        } finally {
        }
    }

    public final void k(d dVar) {
        this.f61215d = dVar;
        this.f61213b.invoke(dVar.b());
    }
}
