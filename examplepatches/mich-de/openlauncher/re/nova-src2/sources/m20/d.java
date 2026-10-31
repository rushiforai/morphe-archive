package m20;

import a80.e;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.TrafficStats;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.DefaultOAuthRequest;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.LoginOauthActivity;
import e10.h2;
import i20.g;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.StringCompanionObject;
import l1.g4;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONException;
import org.json.JSONObject;
import r70.j;
import r70.l;
import t70.y0;
import wh.f;
import x80.a0;
import x80.e0;
import x80.g0;
import x80.h0;
import x80.i0;
import x80.j0;
import x80.k0;
import x80.m0;
import x80.p0;
import x80.v;
import x80.w;
import x80.z;

/* loaded from: classes4.dex */
public final class d extends g implements s80.d {

    /* renamed from: f, reason: collision with root package name */
    public static final String f75832f = j.F0("query {\n  viewer {\n    login, avatarUrl\n    repositories(first: 10 %s) {\n      edges {\n        node {\n          id, nameWithOwner, url, openGraphImageUrl\n          pullRequests(first: 50, states: OPEN){\n            nodes {\n              id, title, url, author { login, avatarUrl}, reviewRequests(first: 25) {\n                nodes {\n                  requestedReviewer {\n                    ... on User{login}\n                  }\n                }\n              }\n            }\n          }\n      \t}\n      }\n      pageInfo {\n        endCursor\n        hasNextPage\n      }\n    }\n  }\n}", "\n", System.lineSeparator(), false);

    /* renamed from: e, reason: collision with root package name */
    public final e0 f75833e;

    public d(e0 e0Var, String str, h2 h2Var) {
        super(e0Var, str, h2Var, "GithubApiIntegration");
        this.f75833e = e0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x00aa A[Catch: all -> 0x0034, TryCatch #0 {all -> 0x0034, blocks: (B:12:0x0030, B:19:0x004b, B:29:0x010c, B:32:0x0116, B:34:0x0121, B:36:0x0127, B:38:0x012f, B:44:0x0179, B:23:0x00a6, B:25:0x00aa, B:22:0x0056), top: B:49:0x002a }] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0116 A[Catch: all -> 0x0034, TRY_ENTER, TryCatch #0 {all -> 0x0034, blocks: (B:12:0x0030, B:19:0x004b, B:29:0x010c, B:32:0x0116, B:34:0x0121, B:36:0x0127, B:38:0x012f, B:44:0x0179, B:23:0x00a6, B:25:0x00aa, B:22:0x0056), top: B:49:0x002a }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0175  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0193 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:28:0x0106 -> B:29:0x010c). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object l(d dVar, i20.d dVar2, ContinuationImpl continuationImpl) {
        c cVar;
        d dVar3;
        List arrayList;
        Ref.ObjectRef objectRef;
        w url;
        i20.d dVar4;
        String strString;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.A = i5 - Integer.MIN_VALUE;
                dVar3 = dVar;
            } else {
                dVar3 = dVar;
                cVar = new c(dVar3, continuationImpl);
            }
        }
        Object obj = cVar.f75830y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.A;
        try {
            if (i11 != 0) {
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return null;
                }
                Ref.ObjectRef objectRef2 = cVar.f75829x;
                arrayList = cVar.f75828w;
                w wVar = cVar.f75827v;
                i20.d dVar5 = cVar.f75826u;
                d dVar6 = cVar.f75825t;
                ResultKt.b(obj);
                w wVar2 = wVar;
                objectRef = objectRef2;
                dVar3 = dVar6;
                m0 m0Var = (m0) obj;
                boolean zC = m0Var.c();
                p0 p0Var = m0Var.f95559g;
                if (!zC) {
                    if (p0Var != null) {
                        JSONObject jSONObject = new JSONObject(p0Var.string());
                        arrayList.add(jSONObject);
                        dVar3.getClass();
                        objectRef.f71863a = m(jSONObject);
                        dVar4 = dVar5;
                        url = wVar2;
                        if (objectRef.f71863a != null) {
                            return arrayList;
                        }
                        g0 g0Var = new g0();
                        Intrinsics.g(url, "url");
                        g0Var.f95504a = url;
                        g0Var.a("Authorization", "Bearer " + dVar4.f61200a);
                        g0Var.a("Accept", "application/vnd.github+json");
                        g0Var.a("X-GitHub-Api-Version", "2022-11-28");
                        g0Var.h((k0) objectRef.f71863a);
                        h0 h0VarB = g0Var.b();
                        TrafficStats.setThreadStatsTag(1885356605);
                        b90.j jVarC = dVar3.f75833e.c(h0VarB);
                        cVar.f75825t = dVar3;
                        cVar.f75826u = dVar4;
                        cVar.f75827v = url;
                        cVar.f75828w = arrayList;
                        cVar.f75829x = objectRef;
                        cVar.A = 1;
                        Object objAwait = UtilsKt.await(jVarC, cVar);
                        if (objAwait == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        w wVar3 = url;
                        dVar5 = dVar4;
                        obj = objAwait;
                        wVar2 = wVar3;
                        m0 m0Var2 = (m0) obj;
                        boolean zC2 = m0Var2.c();
                        p0 p0Var2 = m0Var2.f95559g;
                        if (!zC2) {
                            mc0.b bVar = mc0.d.f76206a;
                            bVar.r("GithubApiIntegration");
                            int i12 = m0Var2.f95556d;
                            String str = m0Var2.f95555c;
                            String strG1 = (p0Var2 == null || (strString = p0Var2.string()) == null) ? null : l.G1(100, strString);
                            bVar.n("Failed API request: '" + i12 + " " + str + " [" + strG1 + "]' from " + m0Var2.f95553a.f95509a, new Object[0]);
                            cVar.f75825t = null;
                            cVar.f75826u = null;
                            cVar.f75827v = null;
                            cVar.f75828w = null;
                            cVar.f75829x = null;
                            cVar.A = 2;
                            if (dVar3.g(m0Var2) == coroutineSingletons) {
                                return coroutineSingletons;
                            }
                        }
                    }
                }
                return null;
            }
            ResultKt.b(obj);
            v vVar = new v();
            vVar.e(null, "https://api.github.com/graphql");
            w wVarB = vVar.b();
            arrayList = new ArrayList();
            objectRef = new Ref.ObjectRef();
            j0 j0Var = k0.Companion;
            JSONObject jSONObject2 = new JSONObject();
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            jSONObject2.put("query", String.format(f75832f, Arrays.copyOf(new Object[]{com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, 1)));
            Unit unit = Unit.f71706a;
            String string = jSONObject2.toString();
            Pattern pattern = a0.f95396e;
            a0 a0VarA = z.a("application/json");
            j0Var.getClass();
            objectRef.f71863a = j0.a(string, a0VarA);
            url = wVarB;
            dVar4 = dVar2;
            if (objectRef.f71863a != null) {
            }
        } catch (Throwable th2) {
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("GithubApiIntegration");
            bVar2.f(th2, "Failed fetching graph QL response", new Object[0]);
            return null;
        }
    }

    public static i0 m(JSONObject jSONObject) throws JSONException {
        try {
            JSONObject jSONObject2 = jSONObject.getJSONObject("data").getJSONObject("viewer").getJSONObject("repositories").getJSONObject("pageInfo");
            if (!jSONObject2.getBoolean("hasNextPage")) {
                return null;
            }
            String string = jSONObject2.getString("endCursor");
            j0 j0Var = k0.Companion;
            JSONObject jSONObject3 = new JSONObject();
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            jSONObject3.put("query", String.format(f75832f, Arrays.copyOf(new Object[]{",after: \"" + string + "\""}, 1)));
            String string2 = jSONObject3.toString();
            Pattern pattern = a0.f95396e;
            a0 a0VarA = z.a("application/json");
            j0Var.getClass();
            return j0.a(string2, a0VarA);
        } catch (JSONException unused) {
            return null;
        }
    }

    @Override // s80.a
    public final Intent b(Activity activity) {
        DefaultOAuthRequest defaultOAuthRequest = new DefaultOAuthRequest("6f0d6dd27190be54e67a", "disco://nova.branch.search/callback/oauth2", "https://github.com/login/oauth/authorize", UUID.randomUUID().toString(), new String[]{"repo"});
        int i5 = LoginOauthActivity.f46279c;
        return f.H(activity, defaultOAuthRequest);
    }

    @Override // s80.a
    public final String c(Context context) {
        return context.getString(2132017482);
    }

    @Override // s80.c
    public final String d() {
        return Pkgs.GITHUB;
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new g4(this, null, 4), continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    @Override // s80.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(int i5, Intent intent, Continuation continuation) {
        b bVar;
        d dVar;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i11 = bVar.f75824w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                bVar.f75824w = i11 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, (ContinuationImpl) continuation);
            }
        }
        b bVar2 = bVar;
        Object objJ = bVar2.f75822u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = bVar2.f75824w;
        try {
            if (i12 == 0) {
                ResultKt.b(objJ);
                int i13 = LoginOauthActivity.f46279c;
                String strN = f.N(i5, intent);
                if (strN != null && strN.length() != 0) {
                    bVar2.f75821t = this;
                    bVar2.f75824w = 1;
                    objJ = j(null, strN, Pkgs.GITHUB, null, "https://sesame.ninja/app/auth/branch_exchange.php", bVar2);
                    if (objJ == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    dVar = this;
                }
                mc0.b bVar3 = mc0.d.f76206a;
                bVar3.r("GithubApiIntegration");
                bVar3.n("ERROR: GitHub authorization request got response code='" + strN + "'", new Object[0]);
                return Boolean.FALSE;
            }
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = bVar2.f75821t;
            ResultKt.b(objJ);
            i20.d dVar2 = (i20.d) objJ;
            if (dVar2 == null) {
                return Boolean.FALSE;
            }
            dVar.k(dVar2);
            return Boolean.TRUE;
        } catch (Throwable th2) {
            mc0.b bVar4 = mc0.d.f76206a;
            bVar4.r("GithubApiIntegration");
            bVar4.e(th2);
            return Boolean.FALSE;
        }
    }
}
