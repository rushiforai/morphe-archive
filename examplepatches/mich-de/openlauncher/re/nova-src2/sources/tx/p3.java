package tx;

import android.content.Context;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.instabridge.ai.auth.TokenProvider;
import com.instabridge.ai.auth.TokenResult;
import java.util.Map;
import java.util.concurrent.CancellationException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import retrofit2.HttpException;

/* loaded from: classes4.dex */
public final class p3 implements TokenProvider {

    /* renamed from: a, reason: collision with root package name */
    public static final p3 f89946a = new p3();

    /* renamed from: b, reason: collision with root package name */
    public static final c80.d f89947b = new c80.d();

    /* renamed from: c, reason: collision with root package name */
    public static volatile String f89948c;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:28:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r13v11, types: [kotlin.Result$Failure] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(String str, ContinuationImpl continuationImpl) {
        k3 k3Var;
        String strA;
        String personId;
        p3 p3Var;
        String str2;
        if (continuationImpl instanceof k3) {
            k3Var = (k3) continuationImpl;
            int i5 = k3Var.f89846w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k3Var.f89846w = i5 - Integer.MIN_VALUE;
            } else {
                k3Var = new k3(continuationImpl);
            }
        }
        Object objB = k3Var.f89845v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k3Var.f89846w;
        if (i11 == 0) {
            ResultKt.b(objB);
            Context context = mx.g0.f77088a;
            long j11 = mx.g0.e().getApplicationContext().getSharedPreferences("nova_ai_brand_session", 0).getLong("instabridge_user_id", -1L);
            if ((j11 < 0 ? null : Long.valueOf(j11)) != null) {
                return Unit.f71706a;
            }
            if (fo.d.j()) {
                try {
                    int i12 = Result.f71687b;
                    personId = fo.d.a().getPersonId();
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    strA = ResultKt.a(th2);
                }
                if (personId != null) {
                    boolean zU0 = r70.k.U0(personId);
                    strA = personId;
                    if (zU0) {
                        strA = null;
                    }
                    str = strA instanceof Result.Failure ? null : strA;
                }
            }
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            bVar.b("clientSignin: tokenLen=%d", new Integer(str.length()));
            c4 c4Var = (c4) e4.f89715b.getValue();
            c cVar = new c(str);
            p3 p3Var2 = f89946a;
            k3Var.f89843t = p3Var2;
            k3Var.f89844u = str;
            k3Var.f89846w = 1;
            objB = c4Var.b(cVar, k3Var);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
            p3Var = p3Var2;
            str2 = str;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str2 = k3Var.f89844u;
            p3Var = k3Var.f89843t;
            ResultKt.b(objB);
        }
        f fVar = (f) objB;
        String str3 = fVar.f89717b;
        Context context2 = mx.g0.f77088a;
        mx.g0.e().getApplicationContext().getSharedPreferences("nova_ai_brand_session", 0).edit().putString("instabridge_token", str3).apply();
        mx.g0.e().getApplicationContext().getSharedPreferences("nova_ai_brand_session", 0).edit().putLong("instabridge_user_id", fVar.f89718c).apply();
        p6.f.N(mx.g0.e());
        if (str2 != null) {
            p3Var.getClass();
            if (fo.d.j()) {
                try {
                    mc0.b bVar2 = mc0.d.f76206a;
                    bVar2.r("NOVA_AI");
                    bVar2.n("Clearing cached AI SDK identity after IB account resolution (%s, previousPersonId=%s)", "client_signin", str2);
                    fo.d.a().clearSessionAndConsent();
                } catch (Exception e3) {
                    mc0.b bVar3 = mc0.d.f76206a;
                    bVar3.r("NOVA_AI");
                    bVar3.p(e3, "Failed to clear SDK session after IB account resolution (%s)", "client_signin");
                }
            }
        }
        return Unit.f71706a;
    }

    public static Object b(m3 m3Var) {
        a80.e eVar = t70.y0.f88884a;
        return t70.m0.y(a80.d.f488c, new l3(2, null), m3Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) throws Throwable {
        n3 n3Var;
        Context context;
        String str;
        if (continuationImpl instanceof n3) {
            n3Var = (n3) continuationImpl;
            int i5 = n3Var.f89912w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                n3Var.f89912w = i5 - Integer.MIN_VALUE;
            } else {
                n3Var = new n3(this, continuationImpl);
            }
        }
        Object obj = n3Var.f89910u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = n3Var.f89912w;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (r70.k.U0("747441958287-gki6qgj07or293npcieq5pqomuuaj3l2.apps.googleusercontent.com")) {
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("NOVA_AI");
                    bVar.n("refreshGoogleIdTokenSilently: GOOGLE_OAUTH_WEB_CLIENT_ID is blank!", new Object[0]);
                    return null;
                }
                mc0.b bVar2 = mc0.d.f76206a;
                bVar2.r("NOVA_AI");
                bVar2.b("refreshGoogleIdTokenSilently: attempting with clientId=%s...", r70.l.G1(20, "747441958287-gki6qgj07or293npcieq5pqomuuaj3l2.apps.googleusercontent.com").concat("..."));
                Context context2 = mx.g0.f77088a;
                Context contextE = mx.g0.e();
                lg.b bVar3 = new lg.b(GoogleSignInOptions.f31741p);
                bVar3.b();
                bVar3.f74923a.add(GoogleSignInOptions.f31742q);
                lg.a aVarC = i30.j.C(contextE, bVar3.a());
                a80.e eVar = t70.y0.f88884a;
                a80.d dVar = a80.d.f488c;
                mx.e0 e0Var = new mx.e0(aVarC, continuation, 28);
                n3Var.f89909t = contextE;
                n3Var.f89912w = 1;
                Object objY = t70.m0.y(dVar, e0Var, n3Var);
                if (objY == coroutineSingletons) {
                    return coroutineSingletons;
                }
                context = contextE;
                obj = objY;
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                context = n3Var.f89909t;
                ResultKt.b(obj);
            }
            GoogleSignInAccount googleSignInAccount = (GoogleSignInAccount) obj;
            if (googleSignInAccount == null || (str = googleSignInAccount.f31732g) == null || str.length() <= 0) {
                str = null;
            }
            if (str != null && googleSignInAccount != null) {
                ps.k.z(context, googleSignInAccount);
                mc0.b bVar4 = mc0.d.f76206a;
                bVar4.r("NOVA_AI");
                bVar4.b("Silent Google token refresh succeeded", new Object[0]);
            }
            return str;
        } catch (Exception e3) {
            mc0.b bVar5 = mc0.d.f76206a;
            bVar5.r("NOVA_AI");
            bVar5.c(e3, "Silent Google token refresh failed", new Object[0]);
            return null;
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(18:0|2|(2:4|(1:6)(1:7))(0)|8|117|(1:(2:11|(14:13|118|14|15|126|47|(1:49)(1:56)|(1:58)(1:59)|60|128|(5:62|(1:64)(1:65)|66|(1:68)(1:69)|70)(2:71|(6:73|74|124|75|76|77)(2:87|88))|78|111|112)(2:24|25))(1:26))(3:27|(1:30)|45)|121|31|(1:33)(1:34)|35|(1:37)(1:38)|(1:40)(1:41)|42|127|43|(11:46|126|47|(0)(0)|(0)(0)|60|128|(0)(0)|78|111|112)|45|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x0315, code lost:
    
        throw r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x021e, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x021f, code lost:
    
        r7 = r17;
        r15 = r18;
        r3 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x0225, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x0226, code lost:
    
        r7 = r17;
        r15 = r18;
        r3 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x022c, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0270 A[Catch: all -> 0x0049, Exception -> 0x0279, TryCatch #4 {all -> 0x0049, blocks: (B:14:0x0040, B:47:0x0132, B:49:0x0139, B:58:0x014e, B:60:0x0158, B:62:0x015e, B:66:0x0173, B:70:0x0189, B:78:0x0202, B:71:0x01db, B:73:0x01df, B:75:0x01e3, B:77:0x01f4, B:97:0x0230, B:100:0x0266, B:102:0x026c, B:104:0x0270, B:106:0x0274, B:109:0x027a, B:87:0x0210, B:88:0x0219, B:113:0x0315), top: B:117:0x0037 }] */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0279  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0139 A[Catch: all -> 0x0049, CancellationException -> 0x0056, Exception -> 0x013d, HttpException -> 0x0144, TryCatch #4 {all -> 0x0049, blocks: (B:14:0x0040, B:47:0x0132, B:49:0x0139, B:58:0x014e, B:60:0x0158, B:62:0x015e, B:66:0x0173, B:70:0x0189, B:78:0x0202, B:71:0x01db, B:73:0x01df, B:75:0x01e3, B:77:0x01f4, B:97:0x0230, B:100:0x0266, B:102:0x026c, B:104:0x0270, B:106:0x0274, B:109:0x027a, B:87:0x0210, B:88:0x0219, B:113:0x0315), top: B:117:0x0037 }] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x014b  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x014e A[Catch: all -> 0x0049, CancellationException -> 0x0056, Exception -> 0x013d, HttpException -> 0x0144, TryCatch #4 {all -> 0x0049, blocks: (B:14:0x0040, B:47:0x0132, B:49:0x0139, B:58:0x014e, B:60:0x0158, B:62:0x015e, B:66:0x0173, B:70:0x0189, B:78:0x0202, B:71:0x01db, B:73:0x01df, B:75:0x01e3, B:77:0x01f4, B:97:0x0230, B:100:0x0266, B:102:0x026c, B:104:0x0270, B:106:0x0274, B:109:0x027a, B:87:0x0210, B:88:0x0219, B:113:0x0315), top: B:117:0x0037 }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0157  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x015e A[Catch: all -> 0x0049, CancellationException -> 0x0056, Exception -> 0x013d, HttpException -> 0x0144, TryCatch #4 {all -> 0x0049, blocks: (B:14:0x0040, B:47:0x0132, B:49:0x0139, B:58:0x014e, B:60:0x0158, B:62:0x015e, B:66:0x0173, B:70:0x0189, B:78:0x0202, B:71:0x01db, B:73:0x01df, B:75:0x01e3, B:77:0x01f4, B:97:0x0230, B:100:0x0266, B:102:0x026c, B:104:0x0270, B:106:0x0274, B:109:0x027a, B:87:0x0210, B:88:0x0219, B:113:0x0315), top: B:117:0x0037 }] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x01db A[Catch: all -> 0x0049, CancellationException -> 0x0056, Exception -> 0x013d, HttpException -> 0x0144, TryCatch #4 {all -> 0x0049, blocks: (B:14:0x0040, B:47:0x0132, B:49:0x0139, B:58:0x014e, B:60:0x0158, B:62:0x015e, B:66:0x0173, B:70:0x0189, B:78:0x0202, B:71:0x01db, B:73:0x01df, B:75:0x01e3, B:77:0x01f4, B:97:0x0230, B:100:0x0266, B:102:0x026c, B:104:0x0270, B:106:0x0274, B:109:0x027a, B:87:0x0210, B:88:0x0219, B:113:0x0315), top: B:117:0x0037 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0264  */
    /* JADX WARN: Type inference failed for: r0v4, types: [c80.a, c80.d] */
    /* JADX WARN: Type inference failed for: r15v10 */
    /* JADX WARN: Type inference failed for: r15v16 */
    /* JADX WARN: Type inference failed for: r15v7 */
    /* JADX WARN: Type inference failed for: r3v19 */
    /* JADX WARN: Type inference failed for: r3v2, types: [kotlin.coroutines.Continuation, tx.m3] */
    /* JADX WARN: Type inference failed for: r3v20 */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v5 */
    /* JADX WARN: Type inference failed for: r7v0 */
    /* JADX WARN: Type inference failed for: r7v30 */
    /* JADX WARN: Type inference failed for: r7v9 */
    @Override // com.instabridge.ai.auth.TokenProvider
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object getToken(Continuation continuation) throws Throwable {
        ?? m3Var;
        c80.a aVar;
        Object obj;
        Object obj2;
        Object obj3;
        Object obj4;
        c80.a aVar2;
        Object obj5;
        Object obj6;
        ?? r15;
        TokenResult.Error error;
        String message;
        TokenResult tokenResult;
        eb0.p0 p0Var;
        x80.p0 p0Var2;
        Object obj7;
        Object obj8;
        TokenResult tokenResult2;
        r rVar = r.f89970a;
        if (continuation instanceof m3) {
            m3 m3Var2 = (m3) continuation;
            int i5 = m3Var2.f89884w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                m3Var2.f89884w = i5 - Integer.MIN_VALUE;
                m3Var = m3Var2;
            } else {
                m3Var = new m3(this, continuation);
            }
        }
        Object objB = m3Var.f89882u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = m3Var.f89884w;
        ?? r72 = 1;
        try {
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            if (i11 == 0) {
                ResultKt.b(objB);
                ?? r02 = f89947b;
                m3Var.f89881t = r02;
                m3Var.f89884w = 1;
                if (r02.e(m3Var) != coroutineSingletons) {
                    aVar = r02;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                r15 = 2;
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar2 = m3Var.f89881t;
                try {
                    try {
                        ResultKt.b(objB);
                        obj2 = "reason";
                        obj = "error";
                        try {
                            tokenResult2 = (TokenResult) objB;
                            TokenResult.Error error2 = !(tokenResult2 instanceof TokenResult.Error) ? (TokenResult.Error) tokenResult2 : null;
                            f89948c = error2 == null ? r.k(rVar, error2.getMessage()) : null;
                        } catch (HttpException e3) {
                            e = e3;
                            obj8 = obj;
                        } catch (Exception e11) {
                            e = e11;
                            obj7 = obj;
                        }
                    } catch (CancellationException e12) {
                        throw e12;
                    }
                } catch (HttpException e13) {
                    e = e13;
                    obj6 = "reason";
                    obj5 = "error";
                    try {
                        p0Var = e.f85844b;
                    } catch (Exception unused) {
                    }
                    String strString = (p0Var != null || (p0Var2 = p0Var.f52633c) == null) ? null : p0Var2.string();
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("NOVA_AI");
                    bVar.p(e, "Token exchange HTTP %d body=%s", new Integer(e.f85843a), strString);
                    Map mapJ0 = MapsKt.j0(new Pair("result", obj5), new Pair(obj6, "http_" + e.f85843a));
                    zy.c cVar = zy.c.f98823a;
                    zy.c.i("ai_token_exchange_result", mapJ0);
                    bVar.r("NOVA_AI_BILLING");
                    bVar.h("%s %s", "ai_token_exchange_result", b70.g.f1(b70.g.D1(new q(0), mapJ0.entrySet()), " ", null, null, 0, new s10.i(22), 30));
                    f89948c = "http_" + e.f85843a;
                    error = new TokenResult.Error("http_" + e.f85843a);
                    tokenResult = error;
                    ((c80.d) aVar2).g(null);
                    return tokenResult;
                } catch (Exception e14) {
                    e = e14;
                    obj4 = "reason";
                    obj3 = "error";
                    mc0.b bVar2 = mc0.d.f76206a;
                    bVar2.r("NOVA_AI");
                    bVar2.p(e, "Token exchange failed", new Object[0]);
                    r.i("ai_token_exchange_result", MapsKt.j0(new Pair("result", obj3), new Pair(obj4, rVar.d(e))));
                    f89948c = rVar.d(e);
                    message = e.getMessage();
                    if (message == null) {
                        message = "token_exchange_failed";
                    }
                    error = new TokenResult.Error(message);
                    tokenResult = error;
                    ((c80.d) aVar2).g(null);
                    return tokenResult;
                }
                try {
                    if (!(tokenResult2 instanceof TokenResult.Success)) {
                        Map mapJ02 = MapsKt.j0(new Pair("result", "success"), new Pair("has_person_id", Boolean.valueOf(((TokenResult.Success) tokenResult2).getPersonId() != null)), new Pair("has_expires_at", Boolean.valueOf(((TokenResult.Success) tokenResult2).getExpiresAt() != null)));
                        zy.c cVar2 = zy.c.f98823a;
                        zy.c.i("ai_token_exchange_result", mapJ02);
                        mc0.b bVar3 = mc0.d.f76206a;
                        bVar3.r("NOVA_AI_BILLING");
                        bVar3.h("%s %s", "ai_token_exchange_result", b70.g.f1(b70.g.D1(new q(0), mapJ02.entrySet()), " ", null, null, 0, new s10.i(22), 30));
                    } else {
                        if (!(tokenResult2 instanceof TokenResult.Error)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        Object obj9 = obj;
                        try {
                            r.i("ai_token_exchange_result", MapsKt.j0(new Pair("result", obj9), new Pair(obj2, r.k(rVar, ((TokenResult.Error) tokenResult2).getMessage()))));
                        } catch (HttpException e15) {
                            e = e15;
                            obj8 = obj9;
                            obj6 = obj2;
                            obj5 = obj8;
                            p0Var = e.f85844b;
                            if (p0Var != null) {
                                mc0.b bVar4 = mc0.d.f76206a;
                                bVar4.r("NOVA_AI");
                                bVar4.p(e, "Token exchange HTTP %d body=%s", new Integer(e.f85843a), strString);
                                Map mapJ03 = MapsKt.j0(new Pair("result", obj5), new Pair(obj6, "http_" + e.f85843a));
                                zy.c cVar3 = zy.c.f98823a;
                                zy.c.i("ai_token_exchange_result", mapJ03);
                                bVar4.r("NOVA_AI_BILLING");
                                bVar4.h("%s %s", "ai_token_exchange_result", b70.g.f1(b70.g.D1(new q(0), mapJ03.entrySet()), " ", null, null, 0, new s10.i(22), 30));
                                f89948c = "http_" + e.f85843a;
                                error = new TokenResult.Error("http_" + e.f85843a);
                                tokenResult = error;
                            }
                            ((c80.d) aVar2).g(null);
                            return tokenResult;
                        } catch (Exception e16) {
                            e = e16;
                            obj7 = obj9;
                            obj4 = obj2;
                            obj3 = obj7;
                            mc0.b bVar22 = mc0.d.f76206a;
                            bVar22.r("NOVA_AI");
                            bVar22.p(e, "Token exchange failed", new Object[0]);
                            r.i("ai_token_exchange_result", MapsKt.j0(new Pair("result", obj3), new Pair(obj4, rVar.d(e))));
                            f89948c = rVar.d(e);
                            message = e.getMessage();
                            if (message == null) {
                            }
                            error = new TokenResult.Error(message);
                            tokenResult = error;
                            ((c80.d) aVar2).g(null);
                            return tokenResult;
                        }
                    }
                    tokenResult = (TokenResult) objB;
                } catch (HttpException e17) {
                    e = e17;
                    obj5 = r72;
                    obj6 = r15;
                    p0Var = e.f85844b;
                    if (p0Var != null) {
                    }
                    ((c80.d) aVar2).g(null);
                    return tokenResult;
                } catch (Exception e18) {
                    e = e18;
                    obj3 = r72;
                    obj4 = r15;
                    mc0.b bVar222 = mc0.d.f76206a;
                    bVar222.r("NOVA_AI");
                    bVar222.p(e, "Token exchange failed", new Object[0]);
                    r.i("ai_token_exchange_result", MapsKt.j0(new Pair("result", obj3), new Pair(obj4, rVar.d(e))));
                    f89948c = rVar.d(e);
                    message = e.getMessage();
                    if (message == null) {
                    }
                    error = new TokenResult.Error(message);
                    tokenResult = error;
                    ((c80.d) aVar2).g(null);
                    return tokenResult;
                }
                ((c80.d) aVar2).g(null);
                return tokenResult;
            }
            aVar = m3Var.f89881t;
            ResultKt.b(objB);
            boolean z11 = ps.k.o() != null;
            Context context = mx.g0.f77088a;
            obj = "error";
            long j11 = mx.g0.e().getApplicationContext().getSharedPreferences("nova_ai_brand_session", 0).getLong("instabridge_user_id", -1L);
            boolean z12 = ((j11 > 0L ? 1 : (j11 == 0L ? 0 : -1)) < 0 ? null : Long.valueOf(j11)) != null;
            mc0.b bVar5 = mc0.d.f76206a;
            bVar5.r("NOVA_AI");
            bVar5.b("getToken: hasGoogleIdToken=%s, hasIbUserId=%s → exchanging", Boolean.valueOf(z11), Boolean.valueOf(z12));
            boolean z13 = z12;
            Pair pair = new Pair("has_google_id_token", Boolean.valueOf(z11));
            Boolean boolValueOf = Boolean.valueOf(z13);
            obj2 = "reason";
            Map mapJ04 = MapsKt.j0(pair, new Pair("has_ib_user_id", boolValueOf));
            zy.c cVar4 = zy.c.f98823a;
            zy.c.i("ai_token_exchange_start", mapJ04);
            bVar5.r("NOVA_AI_BILLING");
            bVar5.h("%s %s", "ai_token_exchange_start", b70.g.f1(b70.g.D1(new q(0), mapJ04.entrySet()), " ", null, null, 0, new s10.i(22), 30));
            m3Var.f89881t = aVar;
            r15 = 2;
            m3Var.f89884w = 2;
            objB = b(m3Var);
            if (objB != coroutineSingletons) {
                aVar2 = aVar;
                r72 = bVar5;
                tokenResult2 = (TokenResult) objB;
                if (!(tokenResult2 instanceof TokenResult.Error)) {
                }
                f89948c = error2 == null ? r.k(rVar, error2.getMessage()) : null;
                if (!(tokenResult2 instanceof TokenResult.Success)) {
                }
                tokenResult = (TokenResult) objB;
                ((c80.d) aVar2).g(null);
                return tokenResult;
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            m3Var = aVar;
            ((c80.d) m3Var).g(null);
            throw th;
        }
    }
}
