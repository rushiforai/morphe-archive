package tx;

import android.content.Context;
import android.content.SharedPreferences;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.instabridge.ai.auth.AiLoginCredential;
import com.instabridge.ai.auth.AiLoginResult;
import java.util.concurrent.CancellationException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p2 {

    /* renamed from: a, reason: collision with root package name */
    public final c80.d f89943a = new c80.d();

    /* renamed from: b, reason: collision with root package name */
    public volatile long f89944b;

    /* renamed from: c, reason: collision with root package name */
    public volatile boolean f89945c;

    /* JADX WARN: Removed duplicated region for block: B:112:0x02d2  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0191  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01c5  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01ce  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01fb  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0230  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x028a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) throws Throwable {
        l2 l2Var;
        r rVar;
        String strO;
        p2 p2Var;
        String str;
        String str2;
        p2 p2Var2;
        r rVar2;
        String strU;
        String strH;
        p2 p2Var3;
        r rVar3;
        String str3;
        String str4;
        String str5;
        String str6;
        int i5;
        int i11;
        String str7;
        boolean zB;
        int i12;
        String str8;
        String str9;
        r rVar4;
        String str10;
        Object objLogin;
        String str11;
        p2 p2Var4;
        String str12;
        AiLoginResult aiLoginResult;
        String str13;
        AiLoginResult aiLoginResult2;
        r rVar5;
        String str14;
        String str15;
        p2 p2Var5;
        int i13;
        int i14;
        String str16;
        if (continuationImpl instanceof l2) {
            l2Var = (l2) continuationImpl;
            int i15 = l2Var.E;
            if ((i15 & Integer.MIN_VALUE) != 0) {
                l2Var.E = i15 - Integer.MIN_VALUE;
            } else {
                l2Var = new l2(this, continuationImpl);
            }
        }
        Object objC = l2Var.C;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (l2Var.E) {
            case 0:
                ResultKt.b(objC);
                rVar = r.f89975f;
                strO = ps.k.o();
                if (strO == null) {
                    l2Var.f89859t = this;
                    l2Var.f89860u = rVar;
                    l2Var.f89861v = strO;
                    l2Var.E = 1;
                    objC = p3.f89946a.c(l2Var);
                    if (objC != coroutineSingletons) {
                        p2Var2 = this;
                        str7 = (String) objC;
                        if (str7 != null) {
                            return t1.f90007b;
                        }
                        str = str7;
                        str2 = strO;
                        p2Var = p2Var2;
                        rVar2 = rVar;
                        strU = ps.l.u(str);
                        if (strU != null) {
                            return z1.f90086b;
                        }
                        p2Var.getClass();
                        d1 d1Var = d1.f89690a;
                        strH = d1.h();
                        String strH2 = rVar2.h();
                        Context context = mx.g0.f77088a;
                        String string = mx.g0.e().getApplicationContext().getSharedPreferences("nova_ai_google_session", 0).getString("google_account_id", null);
                        if (string == null || r70.k.U0(string)) {
                            string = null;
                        }
                        int i16 = (r.j().getBoolean("logout_pending", false) || !((strH2 == null || strH2.equals(strU)) && (string == null || string.equals(strU)))) ? 1 : 0;
                        if (i16 != 0) {
                            l2Var.f89859t = p2Var;
                            l2Var.f89860u = rVar2;
                            l2Var.f89861v = str2;
                            l2Var.f89862w = str;
                            l2Var.f89863x = strU;
                            l2Var.f89864y = strH;
                            l2Var.A = i16;
                            l2Var.E = 2;
                            Object objLogout = fo.d.a().logout(l2Var);
                            if (objLogout != coroutineSingletons) {
                                objLogout = Unit.f71706a;
                            }
                            if (objLogout != coroutineSingletons) {
                                i11 = i16;
                                rVar2.getClass();
                                r.j().edit().remove("linked_google_account_id").remove("login_active").remove("logout_pending").apply();
                                p2Var3 = p2Var;
                                rVar3 = rVar2;
                                str3 = str2;
                                str4 = str;
                                str5 = strU;
                                str6 = strH;
                                i5 = i11;
                                zB = Intrinsics.b(rVar3.h(), str5);
                                i12 = !zB ? 1 : 0;
                                if (zB) {
                                    str8 = null;
                                    String str17 = str5;
                                    p2 p2Var6 = p2Var3;
                                    str9 = str6;
                                    rVar4 = rVar3;
                                    str10 = str3;
                                    p2Var6.getClass();
                                    AiLoginCredential.Google google = new AiLoginCredential.Google(str4);
                                    l2Var.f89859t = p2Var6;
                                    l2Var.f89860u = rVar4;
                                    l2Var.f89861v = str10;
                                    l2Var.f89862w = str4;
                                    l2Var.f89863x = str17;
                                    l2Var.f89864y = str9;
                                    l2Var.f89865z = str8;
                                    l2Var.A = i5;
                                    l2Var.B = i12;
                                    l2Var.E = 4;
                                    objLogin = fo.d.a().login(google, str8, l2Var);
                                    if (objLogin != coroutineSingletons) {
                                    }
                                } else {
                                    p2Var3.getClass();
                                    l2Var.f89859t = p2Var3;
                                    l2Var.f89860u = rVar3;
                                    l2Var.f89861v = str3;
                                    l2Var.f89862w = str4;
                                    l2Var.f89863x = str5;
                                    l2Var.f89864y = str6;
                                    l2Var.A = i5;
                                    l2Var.B = i12;
                                    l2Var.E = 3;
                                    p3 p3Var = p3.f89946a;
                                    a80.e eVar = t70.y0.f88884a;
                                    objC = t70.m0.y(a80.d.f488c, new d00.h(str4, 1, null), l2Var);
                                    if (objC != coroutineSingletons) {
                                        i12 = i12;
                                        str8 = (String) objC;
                                        if (str8 == null) {
                                            return q1.f89958b;
                                        }
                                        String str172 = str5;
                                        p2 p2Var62 = p2Var3;
                                        str9 = str6;
                                        rVar4 = rVar3;
                                        str10 = str3;
                                        p2Var62.getClass();
                                        AiLoginCredential.Google google2 = new AiLoginCredential.Google(str4);
                                        l2Var.f89859t = p2Var62;
                                        l2Var.f89860u = rVar4;
                                        l2Var.f89861v = str10;
                                        l2Var.f89862w = str4;
                                        l2Var.f89863x = str172;
                                        l2Var.f89864y = str9;
                                        l2Var.f89865z = str8;
                                        l2Var.A = i5;
                                        l2Var.B = i12;
                                        l2Var.E = 4;
                                        objLogin = fo.d.a().login(google2, str8, l2Var);
                                        if (objLogin != coroutineSingletons) {
                                            String str18 = str4;
                                            str11 = str172;
                                            p2Var4 = p2Var62;
                                            objC = objLogin;
                                            str12 = str18;
                                            aiLoginResult = (AiLoginResult) objC;
                                            if (Intrinsics.b(aiLoginResult, AiLoginResult.SignInRequired.INSTANCE) && str10 != null) {
                                                p2Var4.getClass();
                                                l2Var.f89859t = p2Var4;
                                                l2Var.f89860u = rVar4;
                                                l2Var.f89861v = str12;
                                                l2Var.f89862w = str11;
                                                l2Var.f89863x = str9;
                                                l2Var.f89864y = str8;
                                                l2Var.f89865z = aiLoginResult;
                                                l2Var.A = i5;
                                                l2Var.B = i12;
                                                l2Var.E = 5;
                                                objC = p3.f89946a.c(l2Var);
                                                if (objC != coroutineSingletons) {
                                                    r rVar6 = rVar4;
                                                    str13 = str9;
                                                    aiLoginResult2 = aiLoginResult;
                                                    rVar5 = rVar6;
                                                    str14 = str8;
                                                    str15 = (String) objC;
                                                    if (str15 == null && !str15.equals(str12) && Intrinsics.b(ps.l.u(str15), str11)) {
                                                        p2Var4.getClass();
                                                        AiLoginCredential.Google google3 = new AiLoginCredential.Google(str15);
                                                        l2Var.f89859t = p2Var4;
                                                        l2Var.f89860u = rVar5;
                                                        l2Var.f89861v = str11;
                                                        l2Var.f89862w = str13;
                                                        l2Var.f89863x = null;
                                                        l2Var.f89864y = null;
                                                        l2Var.f89865z = null;
                                                        l2Var.A = i5;
                                                        l2Var.B = i12;
                                                        l2Var.E = 6;
                                                        objC = fo.d.a().login(google3, str14, l2Var);
                                                        if (objC != coroutineSingletons) {
                                                            p2Var5 = p2Var4;
                                                            i13 = i12;
                                                            i14 = i5;
                                                            str16 = str13;
                                                            i5 = i14;
                                                            str9 = str16;
                                                            rVar4 = rVar5;
                                                            aiLoginResult = (AiLoginResult) objC;
                                                            p2Var4 = p2Var5;
                                                            i12 = i13;
                                                        }
                                                    } else {
                                                        r rVar7 = rVar5;
                                                        aiLoginResult = aiLoginResult2;
                                                        str9 = str13;
                                                        rVar4 = rVar7;
                                                    }
                                                }
                                            }
                                            if (!(aiLoginResult instanceof AiLoginResult.Success)) {
                                                rVar4.getClass();
                                                r.j().edit().putString("linked_google_account_id", str11).putBoolean("login_active", true).remove("logout_pending").remove("sign_in_required").apply();
                                                AiLoginResult.Success success = (AiLoginResult.Success) aiLoginResult;
                                                return new s1(success.getPersonId(), success.getCreated(), i12 != 0, (i5 == 0 && (str9 == null || str9.equals(success.getPersonId()))) ? false : true);
                                            }
                                            if (Intrinsics.b(aiLoginResult, AiLoginResult.SignInRequired.INSTANCE)) {
                                                return w1.f90043b;
                                            }
                                            if (!Intrinsics.b(aiLoginResult, AiLoginResult.IdentityConflict.INSTANCE)) {
                                                if (aiLoginResult instanceof AiLoginResult.TemporaryFailure) {
                                                    return new x1(((AiLoginResult.TemporaryFailure) aiLoginResult).getRetryAfterSeconds());
                                                }
                                                throw new NoWhenBranchMatchedException();
                                            }
                                            p2Var4.getClass();
                                            long jCurrentTimeMillis = System.currentTimeMillis();
                                            rVar4.getClass();
                                            r.j().edit().putString("identity_conflict_google_account_id", str11).putLong("identity_conflict_at_ms", jCurrentTimeMillis).apply();
                                            return r1.f89977b;
                                        }
                                    }
                                }
                            }
                        } else {
                            p2Var3 = p2Var;
                            rVar3 = rVar2;
                            str3 = str2;
                            str4 = str;
                            str5 = strU;
                            str6 = strH;
                            i5 = i16;
                            zB = Intrinsics.b(rVar3.h(), str5);
                            i12 = !zB ? 1 : 0;
                            if (zB) {
                            }
                        }
                    }
                    return coroutineSingletons;
                }
                p2Var = this;
                str = strO;
                str2 = str;
                rVar2 = rVar;
                strU = ps.l.u(str);
                if (strU != null) {
                }
                break;
            case 1:
                strO = l2Var.f89861v;
                rVar = l2Var.f89860u;
                p2Var2 = l2Var.f89859t;
                ResultKt.b(objC);
                str7 = (String) objC;
                if (str7 != null) {
                }
                break;
            case 2:
                i11 = l2Var.A;
                strH = l2Var.f89864y;
                strU = l2Var.f89863x;
                str = l2Var.f89862w;
                str2 = l2Var.f89861v;
                rVar2 = l2Var.f89860u;
                p2Var = l2Var.f89859t;
                ResultKt.b(objC);
                rVar2.getClass();
                r.j().edit().remove("linked_google_account_id").remove("login_active").remove("logout_pending").apply();
                p2Var3 = p2Var;
                rVar3 = rVar2;
                str3 = str2;
                str4 = str;
                str5 = strU;
                str6 = strH;
                i5 = i11;
                zB = Intrinsics.b(rVar3.h(), str5);
                i12 = !zB ? 1 : 0;
                if (zB) {
                }
                break;
            case 3:
                i12 = l2Var.B;
                i5 = l2Var.A;
                str6 = l2Var.f89864y;
                str5 = l2Var.f89863x;
                str4 = l2Var.f89862w;
                str3 = l2Var.f89861v;
                rVar3 = l2Var.f89860u;
                p2Var3 = l2Var.f89859t;
                ResultKt.b(objC);
                str8 = (String) objC;
                if (str8 == null) {
                }
                String str1722 = str5;
                p2 p2Var622 = p2Var3;
                str9 = str6;
                rVar4 = rVar3;
                str10 = str3;
                p2Var622.getClass();
                AiLoginCredential.Google google22 = new AiLoginCredential.Google(str4);
                l2Var.f89859t = p2Var622;
                l2Var.f89860u = rVar4;
                l2Var.f89861v = str10;
                l2Var.f89862w = str4;
                l2Var.f89863x = str1722;
                l2Var.f89864y = str9;
                l2Var.f89865z = str8;
                l2Var.A = i5;
                l2Var.B = i12;
                l2Var.E = 4;
                objLogin = fo.d.a().login(google22, str8, l2Var);
                if (objLogin != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 4:
                i12 = l2Var.B;
                i5 = l2Var.A;
                String str19 = (String) l2Var.f89865z;
                str9 = l2Var.f89864y;
                str11 = l2Var.f89863x;
                String str20 = l2Var.f89862w;
                str10 = l2Var.f89861v;
                rVar4 = l2Var.f89860u;
                p2 p2Var7 = l2Var.f89859t;
                ResultKt.b(objC);
                p2Var4 = p2Var7;
                str8 = str19;
                str12 = str20;
                aiLoginResult = (AiLoginResult) objC;
                if (Intrinsics.b(aiLoginResult, AiLoginResult.SignInRequired.INSTANCE)) {
                    p2Var4.getClass();
                    l2Var.f89859t = p2Var4;
                    l2Var.f89860u = rVar4;
                    l2Var.f89861v = str12;
                    l2Var.f89862w = str11;
                    l2Var.f89863x = str9;
                    l2Var.f89864y = str8;
                    l2Var.f89865z = aiLoginResult;
                    l2Var.A = i5;
                    l2Var.B = i12;
                    l2Var.E = 5;
                    objC = p3.f89946a.c(l2Var);
                    if (objC != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                if (!(aiLoginResult instanceof AiLoginResult.Success)) {
                }
                break;
            case 5:
                i12 = l2Var.B;
                int i17 = l2Var.A;
                AiLoginResult aiLoginResult3 = (AiLoginResult) l2Var.f89865z;
                str14 = l2Var.f89864y;
                str13 = l2Var.f89863x;
                String str21 = l2Var.f89862w;
                str12 = l2Var.f89861v;
                r rVar8 = l2Var.f89860u;
                p2 p2Var8 = l2Var.f89859t;
                ResultKt.b(objC);
                p2Var4 = p2Var8;
                aiLoginResult2 = aiLoginResult3;
                rVar5 = rVar8;
                i5 = i17;
                str11 = str21;
                str15 = (String) objC;
                if (str15 == null) {
                    break;
                }
                r rVar72 = rVar5;
                aiLoginResult = aiLoginResult2;
                str9 = str13;
                rVar4 = rVar72;
                if (!(aiLoginResult instanceof AiLoginResult.Success)) {
                }
                break;
            case 6:
                i13 = l2Var.B;
                i14 = l2Var.A;
                str16 = l2Var.f89862w;
                str11 = l2Var.f89861v;
                rVar5 = l2Var.f89860u;
                p2Var5 = l2Var.f89859t;
                ResultKt.b(objC);
                i5 = i14;
                str9 = str16;
                rVar4 = rVar5;
                aiLoginResult = (AiLoginResult) objC;
                p2Var4 = p2Var5;
                i12 = i13;
                if (!(aiLoginResult instanceof AiLoginResult.Success)) {
                }
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) throws Throwable {
        m2 m2Var;
        Exception exc;
        p2 p2Var;
        Object obj;
        if (continuationImpl instanceof m2) {
            m2Var = (m2) continuationImpl;
            int i5 = m2Var.f89880w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                m2Var.f89880w = i5 - Integer.MIN_VALUE;
            } else {
                m2Var = new m2(this, continuationImpl);
            }
        }
        Object objA = m2Var.f89878u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = m2Var.f89880w;
        try {
            if (i11 == 0) {
                ResultKt.b(objA);
                try {
                    m2Var.f89877t = this;
                    m2Var.f89880w = 1;
                    objA = a(m2Var);
                    if (objA == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    p2Var = this;
                } catch (Exception e3) {
                    exc = e3;
                    p2Var = this;
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("NOVA_AI");
                    bVar.p(exc, "SDK login attempt threw", new Object[0]);
                    obj = y1.f90067b;
                    if (obj instanceof s1) {
                    }
                    return obj;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                p2Var = m2Var.f89877t;
                try {
                    ResultKt.b(objA);
                } catch (Exception e11) {
                    exc = e11;
                    mc0.b bVar2 = mc0.d.f76206a;
                    bVar2.r("NOVA_AI");
                    bVar2.p(exc, "SDK login attempt threw", new Object[0]);
                    obj = y1.f90067b;
                    if (obj instanceof s1) {
                    }
                    return obj;
                }
            }
            obj = (a2) objA;
            if (obj instanceof s1) {
                p2Var.f89944b = 0L;
                p2Var.f89945c = false;
            } else if (Intrinsics.b(obj, r1.f89977b)) {
                p2Var.f89945c = true;
            } else if (obj instanceof x1) {
                Long l9 = ((x1) obj).f90058b;
                long jG0 = kotlin.ranges.a.g0(l9 != null ? l9.longValue() : 60L, 60L, 600L);
                p2Var.getClass();
                p2Var.f89944b = (jG0 * 1000) + System.currentTimeMillis();
            } else {
                p2Var.getClass();
                p2Var.f89944b = System.currentTimeMillis() + TTAdConstant.AD_MAX_EVENT_TIME;
            }
            return obj;
        } catch (CancellationException e12) {
            throw e12;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r0v2 */
    /* JADX WARN: Type inference failed for: r0v24 */
    /* JADX WARN: Type inference failed for: r0v27 */
    /* JADX WARN: Type inference failed for: r0v29 */
    /* JADX WARN: Type inference failed for: r0v31 */
    /* JADX WARN: Type inference failed for: r0v35, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r0v36 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) {
        n2 n2Var;
        c80.d dVar;
        p2 p2Var;
        ?? r02;
        Throwable th2;
        a2 a2Var;
        if (continuationImpl instanceof n2) {
            n2Var = (n2) continuationImpl;
            int i5 = n2Var.f89908x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                n2Var.f89908x = i5 - Integer.MIN_VALUE;
            } else {
                n2Var = new n2(this, continuationImpl);
            }
        }
        Object obj = n2Var.f89906v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = n2Var.f89908x;
        boolean z11 = true;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = this.f89943a;
                n2Var.f89904t = this;
                n2Var.f89905u = dVar;
                n2Var.f89908x = 1;
                if (dVar.e(n2Var) != coroutineSingletons) {
                    p2Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r02 = (c80.a) n2Var.f89904t;
                try {
                    ResultKt.b(obj);
                    r02 = r02;
                    c80.d dVar2 = r02;
                    a2Var = (a2) obj;
                    dVar = dVar2;
                    dVar.g(null);
                    return a2Var;
                } catch (Throwable th3) {
                    th2 = th3;
                    ((c80.d) r02).g(null);
                    throw th2;
                }
            }
            c80.d dVar3 = n2Var.f89905u;
            p2Var = (p2) n2Var.f89904t;
            ResultKt.b(obj);
            dVar = dVar3;
            p2Var.getClass();
            k2 k2Var = k2.f89839a;
            if (k2.d()) {
                String string = r.j().getString("linked_google_account_id", null);
                if (string == null || r70.k.U0(string)) {
                    string = null;
                }
                if (string != null) {
                    if (r.j().getBoolean("login_active", false)) {
                        String string2 = r.j().getString("linked_google_account_id", null);
                        if (string2 == null || r70.k.U0(string2)) {
                            string2 = null;
                        }
                        if (string2 != null) {
                        }
                        if (!z11) {
                        }
                    } else {
                        z11 = false;
                        if (!z11 && !r.j().getBoolean("logout_pending", false)) {
                            Context context = mx.g0.f77088a;
                            String string3 = mx.g0.e().getApplicationContext().getSharedPreferences("nova_ai_google_session", 0).getString("google_account_id", null);
                            if (string3 == null || r70.k.U0(string3)) {
                                string3 = null;
                            }
                            if (string.equals(string3)) {
                                d1 d1Var = d1.f89690a;
                                if (d1.h() != null) {
                                    a2Var = o1.f89923b;
                                }
                            }
                        }
                    }
                }
                if (ps.k.r()) {
                    if (!p2Var.f89945c && System.currentTimeMillis() >= p2Var.f89944b) {
                        n2Var.f89904t = dVar;
                        n2Var.f89905u = null;
                        n2Var.f89908x = 2;
                        Object objB = p2Var.b(n2Var);
                        if (objB != coroutineSingletons) {
                            r02 = dVar;
                            obj = objB;
                            c80.d dVar22 = r02;
                            a2Var = (a2) obj;
                            dVar = dVar22;
                        }
                        return coroutineSingletons;
                    }
                    a2Var = p1.f89942b;
                } else {
                    a2Var = v1.f90032b;
                }
            } else {
                a2Var = u1.f90024b;
            }
            dVar.g(null);
            return a2Var;
        } catch (Throwable th4) {
            r02 = dVar;
            th2 = th4;
            ((c80.d) r02).g(null);
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v16, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r0v19 */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(ContinuationImpl continuationImpl) {
        o2 o2Var;
        c80.d dVar;
        p2 p2Var;
        ?? r02;
        Throwable th2;
        Object obj;
        if (continuationImpl instanceof o2) {
            o2Var = (o2) continuationImpl;
            int i5 = o2Var.f89928x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                o2Var.f89928x = i5 - Integer.MIN_VALUE;
            } else {
                o2Var = new o2(this, continuationImpl);
            }
        }
        Object obj2 = o2Var.f89926v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = o2Var.f89928x;
        try {
            if (i11 == 0) {
                ResultKt.b(obj2);
                o2Var.f89924t = this;
                dVar = this.f89943a;
                o2Var.f89925u = dVar;
                o2Var.f89928x = 1;
                if (dVar.e(o2Var) != coroutineSingletons) {
                    p2Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r02 = (c80.a) o2Var.f89924t;
                try {
                    ResultKt.b(obj2);
                    r02 = r02;
                    c80.d dVar2 = r02;
                    obj = (a2) obj2;
                    dVar = dVar2;
                    dVar.g(null);
                    return obj;
                } catch (Throwable th3) {
                    th2 = th3;
                    ((c80.d) r02).g(null);
                    throw th2;
                }
            }
            c80.d dVar3 = o2Var.f89925u;
            p2Var = (p2) o2Var.f89924t;
            ResultKt.b(obj2);
            dVar = dVar3;
            p2Var.getClass();
            k2 k2Var = k2.f89839a;
            if (!k2.d()) {
                obj = u1.f90024b;
                dVar.g(null);
                return obj;
            }
            Context context = mx.g0.f77088a;
            SharedPreferences sharedPreferences = mx.g0.e().getSharedPreferences("nova_ai_sdk_login", 0);
            if (sharedPreferences.getBoolean("login_active", false)) {
                sharedPreferences.edit().putBoolean("login_active", false).apply();
            }
            o2Var.f89924t = dVar;
            o2Var.f89925u = null;
            o2Var.f89928x = 2;
            Object objB = p2Var.b(o2Var);
            if (objB != coroutineSingletons) {
                r02 = dVar;
                obj2 = objB;
                c80.d dVar22 = r02;
                obj = (a2) obj2;
                dVar = dVar22;
                dVar.g(null);
                return obj;
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            r02 = dVar;
            th2 = th4;
            ((c80.d) r02).g(null);
            throw th2;
        }
    }
}
