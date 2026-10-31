package o20;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import b.c0;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.DefaultOAuthRequest;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.LoginOauthActivity;
import com.teslacoilsw.launcher.search.shortcutsearch.integrations.slack.TokenExchangeResult;
import e10.h2;
import java.util.Collection;
import java.util.List;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import l1.g4;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import nova.branch.engage.sesame_lite.internal.UtilsKt;
import org.json.JSONObject;
import t70.m0;
import t70.y0;

/* loaded from: classes4.dex */
public final class f implements s80.a, s80.d {

    /* renamed from: e, reason: collision with root package name */
    public static final String[] f79414e = {"channels:read", "usergroups:read", "users:read", "team:read", "groups:read"};

    /* renamed from: a, reason: collision with root package name */
    public final h2 f79415a;

    /* renamed from: b, reason: collision with root package name */
    public final l f79416b = new l();

    /* renamed from: c, reason: collision with root package name */
    public TokenExchangeResult f79417c;

    /* renamed from: d, reason: collision with root package name */
    public final String f79418d;

    public f(String str, h2 h2Var) {
        this.f79415a = h2Var;
        TokenExchangeResult tokenExchangeResult = null;
        if (str != null) {
            JSONObject jSONObject = new JSONObject(str);
            TokenExchangeResult tokenExchangeResult2 = new TokenExchangeResult(jSONObject.optString("status", "error"), UtilsKt.optStringNull(jSONObject, "access_token"), UtilsKt.optStringNull(jSONObject, "package_name"), UtilsKt.optStringNull(jSONObject, "redirect_uri"));
            if (tokenExchangeResult2.b()) {
                tokenExchangeResult = tokenExchangeResult2;
            }
        }
        this.f79417c = tokenExchangeResult;
        this.f79418d = Pkgs.SLACK;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0083 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0018  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x0084 -> B:43:0x0091). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object g(f fVar, String str, String str2, Function3 function3, Function2 function2, ContinuationImpl continuationImpl) {
        e eVar;
        List listX;
        e eVar2;
        String str3;
        int i5;
        String str4;
        String str5;
        Function3 function32;
        Function2 function22;
        Throwable th2;
        Object objInvoke;
        e eVar3;
        List list;
        fVar.getClass();
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i11 = eVar.C;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                eVar.C = i11 - Integer.MIN_VALUE;
            } else {
                eVar = new e(fVar, continuationImpl);
            }
        }
        Object obj = eVar.A;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = eVar.C;
        if (i12 != 0) {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            int i13 = eVar.f79413z;
            List list2 = eVar.f79412y;
            String str6 = eVar.f79411x;
            Function2 function23 = eVar.f79410w;
            Function3 function33 = eVar.f79409v;
            String str7 = eVar.f79408u;
            String str8 = eVar.f79407t;
            try {
                ResultKt.b(obj);
                eVar3 = eVar;
                str5 = str7;
                list = list2;
                function22 = function23;
            } catch (Throwable th3) {
                th2 = th3;
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("SSML-SlackIngester");
                bVar.e(new RuntimeException(th2.getMessage() + " pulled : " + list2.size(), th2));
                return list2;
            }
            try {
                p20.c cVar = (p20.c) obj;
                list.addAll((Collection) function22.invoke(str5, cVar));
                mc0.b bVar2 = mc0.d.f76206a;
                bVar2.r("SSML-SlackIngester");
                bVar2.b("Page: " + str6 + " - results: " + list.size(), new Object[0]);
                String strA = cVar.a();
                if (strA != null && !r70.k.U0(strA)) {
                    int i14 = i13 - 1;
                    if (i13 > 0) {
                        e eVar4 = eVar3;
                        i5 = i14;
                        eVar2 = eVar4;
                        function32 = function33;
                        listX = list;
                        str3 = strA;
                        str4 = str8;
                        try {
                            eVar2.f79407t = str4;
                            eVar2.f79408u = str5;
                            eVar2.f79409v = function32;
                            eVar2.f79410w = function22;
                            eVar2.f79411x = str3;
                            eVar2.f79412y = listX;
                            eVar2.f79413z = i5;
                            eVar2.C = 1;
                            objInvoke = function32.invoke(str4, str3, eVar2);
                            if (objInvoke != coroutineSingletons) {
                                return coroutineSingletons;
                            }
                            str8 = str4;
                            obj = objInvoke;
                            List list3 = listX;
                            function33 = function32;
                            i13 = i5;
                            eVar3 = eVar2;
                            str6 = str3;
                            list = list3;
                            p20.c cVar2 = (p20.c) obj;
                            list.addAll((Collection) function22.invoke(str5, cVar2));
                            mc0.b bVar22 = mc0.d.f76206a;
                            bVar22.r("SSML-SlackIngester");
                            bVar22.b("Page: " + str6 + " - results: " + list.size(), new Object[0]);
                            String strA2 = cVar2.a();
                            if (strA2 != null) {
                                int i142 = i13 - 1;
                                if (i13 > 0) {
                                }
                            }
                        } catch (Throwable th4) {
                            th2 = th4;
                            list2 = listX;
                            mc0.b bVar3 = mc0.d.f76206a;
                            bVar3.r("SSML-SlackIngester");
                            bVar3.e(new RuntimeException(th2.getMessage() + " pulled : " + list2.size(), th2));
                            return list2;
                        }
                    }
                }
                return list;
            } catch (Throwable th5) {
                th2 = th5;
                list2 = list;
                mc0.b bVar32 = mc0.d.f76206a;
                bVar32.r("SSML-SlackIngester");
                bVar32.e(new RuntimeException(th2.getMessage() + " pulled : " + list2.size(), th2));
                return list2;
            }
        }
        listX = c0.x(obj);
        eVar2 = eVar;
        str3 = null;
        i5 = 30;
        str4 = str;
        str5 = str2;
        function32 = function3;
        function22 = function2;
        eVar2.f79407t = str4;
        eVar2.f79408u = str5;
        eVar2.f79409v = function32;
        eVar2.f79410w = function22;
        eVar2.f79411x = str3;
        eVar2.f79412y = listX;
        eVar2.f79413z = i5;
        eVar2.C = 1;
        objInvoke = function32.invoke(str4, str3, eVar2);
        if (objInvoke != coroutineSingletons) {
        }
    }

    @Override // s80.c
    public final s80.e a() {
        return s80.e.f86765a;
    }

    @Override // s80.a
    public final Intent b(Activity activity) {
        DefaultOAuthRequest defaultOAuthRequest = new DefaultOAuthRequest("2402941153.5416736027687", "https://sesame.ninja/app/auth/branch_exchange.php", "https://slack.com/oauth/authorize", "SLACK_STATE", f79414e);
        int i5 = LoginOauthActivity.f46279c;
        return wh.f.H(activity, defaultOAuthRequest);
    }

    @Override // s80.a
    public final String c(Context context) {
        return context.getString(2132019593);
    }

    @Override // s80.c
    public final String d() {
        return this.f79418d;
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        a80.e eVar = y0.f88884a;
        return m0.y(a80.d.f488c, new g4(this, null, 15), continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // s80.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(int i5, Intent intent, Continuation continuation) throws Throwable {
        d dVar;
        f fVar;
        if (continuation instanceof d) {
            dVar = (d) continuation;
            int i11 = dVar.f79406w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                dVar.f79406w = i11 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, (ContinuationImpl) continuation);
            }
        }
        Object objY = dVar.f79404u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = dVar.f79406w;
        boolean z11 = true;
        if (i12 == 0) {
            ResultKt.b(objY);
            int i13 = LoginOauthActivity.f46279c;
            String strN = wh.f.N(i5, intent);
            if (strN != null) {
                dVar.f79403t = this;
                dVar.f79406w = 1;
                String string = Uri.parse("https://sesame.ninja/app/auth/branch_exchange.php").buildUpon().appendQueryParameter("package_name", Pkgs.SLACK).appendQueryParameter("authorization_code", strN).appendQueryParameter("redirect_uri", "https://sesame.ninja/app/auth/branch_exchange.php").build().toString();
                a80.e eVar = y0.f88884a;
                objY = m0.y(a80.d.f488c, new iv.b(string, null, 13), dVar);
                if (objY == coroutineSingletons) {
                    return coroutineSingletons;
                }
                fVar = this;
            }
            z11 = false;
            return Boolean.valueOf(z11);
        }
        if (i12 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        fVar = dVar.f79403t;
        ResultKt.b(objY);
        TokenExchangeResult tokenExchangeResult = (TokenExchangeResult) objY;
        if (tokenExchangeResult != null) {
            fVar.f79417c = tokenExchangeResult;
            h2 h2Var = fVar.f79415a;
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("status", tokenExchangeResult.f46282a);
            jSONObject.putOpt("access_token", tokenExchangeResult.f46283b);
            jSONObject.putOpt("package_name", tokenExchangeResult.f46284c);
            jSONObject.putOpt("redirect_uri", tokenExchangeResult.f46285d);
            h2Var.invoke(jSONObject.toString());
        } else {
            z11 = false;
        }
        return Boolean.valueOf(z11);
    }
}
