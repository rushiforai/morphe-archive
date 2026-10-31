package tx;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import com.instabridge.ai.auth.AiAuthManager;
import com.instabridge.ai.auth.ConsentStatus;
import com.instabridge.ai.billing.AiEntitlementProvider;
import com.instabridge.ai.billing.AiTier;
import com.instabridge.ai.chat.ui.AiChatActivity;
import com.instabridge.ai.context.ContextType;
import com.teslacoilsw.launcher.ai.NovaAiChatActivity;
import java.io.Serializable;
import java.net.URI;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CancellationException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes4.dex */
public final class r implements AiEntitlementProvider, go.a {

    /* renamed from: a, reason: collision with root package name */
    public static final r f89970a = new r();

    /* renamed from: b, reason: collision with root package name */
    public static final r f89971b = new r();

    /* renamed from: c, reason: collision with root package name */
    public static final r f89972c = new r();

    /* renamed from: d, reason: collision with root package name */
    public static final r f89973d = new r();

    /* renamed from: e, reason: collision with root package name */
    public static final r f89974e = new r();

    /* renamed from: f, reason: collision with root package name */
    public static final r f89975f = new r();

    public static void b() {
        SharedPreferences sharedPreferencesJ = j();
        if (sharedPreferencesJ.contains("identity_conflict_google_account_id") || sharedPreferencesJ.contains("identity_conflict_at_ms")) {
            sharedPreferencesJ.edit().remove("identity_conflict_google_account_id").remove("identity_conflict_at_ms").apply();
        }
    }

    public static boolean f() {
        Object objA;
        try {
            int i5 = Result.f71687b;
            objA = new URI(r70.k.u1("https://ai-api.instabridge.com/").toString()).getHost();
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        String str = (String) objA;
        if (str == null) {
            return false;
        }
        String lowerCase = str.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        String strX1 = r70.k.x1(lowerCase, '.');
        if (strX1 != null) {
            return strX1.equals("instabridge.dev") || r70.j.A0(strX1, ".instabridge.dev", false);
        }
        return false;
    }

    public static Intent g(Context context, String str, String str2, int i5) {
        int i11 = NovaAiChatActivity.C;
        if ((i5 & 2) != 0) {
            str = null;
        }
        Intent intent = new Intent(context, (Class<?>) NovaAiChatActivity.class);
        intent.addFlags(335544320);
        if (str != null) {
            intent.putExtra(AiChatActivity.EXTRA_QUERY, str);
        }
        if (str2 != null) {
            intent.putExtra("com.teslacoilsw.launcher.ai.EXTRA_ENTRY_SOURCE", str2);
        }
        return intent;
    }

    public static void i(String str, Map map) {
        zy.c cVar = zy.c.f98823a;
        zy.c.i(str, map);
        mc0.b bVar = mc0.d.f76206a;
        bVar.r("NOVA_AI_BILLING");
        bVar.h("%s %s", str, b70.g.f1(b70.g.D1(new q(0), map.entrySet()), " ", null, null, 0, new s10.i(22), 30));
    }

    public static SharedPreferences j() {
        Context context = mx.g0.f77088a;
        return mx.g0.e().getSharedPreferences("nova_ai_sdk_login", 0);
    }

    public static String k(r rVar, String str) {
        String string = str != null ? r70.k.u1(str).toString() : null;
        if (string == null) {
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (string.length() != 0) {
            int length = string.length();
            if (length > 64) {
                length = 64;
            }
            StringBuilder sb2 = new StringBuilder(length);
            String lowerCase = string.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
            int i5 = 0;
            while (true) {
                if (i5 >= lowerCase.length()) {
                    break;
                }
                char cCharAt = lowerCase.charAt(i5);
                if (sb2.length() < 64) {
                    sb2.append((Character.isLetterOrDigit(cCharAt) || cCharAt == '_') ? cCharAt : '_');
                }
                i5++;
            }
            String strV1 = r70.k.v1(sb2.toString(), '_');
            if (strV1.length() != 0) {
                return strV1;
            }
        }
        return "unknown";
    }

    public static String m(String str) {
        Object objA;
        if (str == null || r70.k.U0(str)) {
            return "none";
        }
        try {
            int i5 = Result.f71687b;
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = str.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            objA = r70.l.G1(12, kotlin.collections.c.M0(messageDigest.digest(bytes), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, new s10.i(23), 30));
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (Result.a(objA) != null) {
            objA = "unavailable";
        }
        return (String) objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0060 A[Catch: Exception -> 0x00a5, TryCatch #4 {Exception -> 0x00a5, blocks: (B:23:0x005c, B:25:0x0060, B:26:0x008c, B:28:0x0092, B:30:0x00a1, B:33:0x00a8, B:34:0x00cf, B:36:0x00d5, B:38:0x00e0, B:39:0x00e4, B:41:0x011f, B:42:0x0136, B:44:0x013c, B:45:0x0153, B:47:0x0159, B:48:0x0170), top: B:99:0x005c }] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x018e A[Catch: Exception -> 0x022a, TRY_LEAVE, TryCatch #0 {Exception -> 0x022a, blocks: (B:54:0x0188, B:56:0x018e), top: B:92:0x0188 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x023d  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0240  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(Context context, ContinuationImpl continuationImpl) {
        d0 d0Var;
        ArrayList arrayListX;
        r rVar;
        String strF1;
        o20.p pVar;
        Context context2 = context;
        if (continuationImpl instanceof d0) {
            d0Var = (d0) continuationImpl;
            int i5 = d0Var.f89689y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d0Var.f89689y = i5 - Integer.MIN_VALUE;
            } else {
                d0Var = new d0(this, continuationImpl);
            }
        }
        Object objD = d0Var.f89687w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d0Var.f89689y;
        if (i11 == 0) {
            arrayListX = b.c0.x(objD);
            try {
                vx.p pVar2 = vx.p.f93347a;
                d0Var.f89684t = this;
                d0Var.f89685u = context2;
                d0Var.f89686v = arrayListX;
                d0Var.f89689y = 1;
                objD = pVar2.d(context2, d0Var);
                if (objD == coroutineSingletons) {
                    return coroutineSingletons;
                }
                rVar = this;
                pVar = (o20.p) objD;
                if (pVar != null) {
                }
            } catch (Exception e3) {
                e = e3;
                rVar = this;
                Boxing.a(Log.w("NOVA_AI", "HostContext: failed to get Slack summary", e));
                ArrayList arrayList = arrayListX;
                rVar.getClass();
                if (fo.d.j()) {
                }
                strF1 = b70.g.f1(arrayList, ". ", null, null, 0, null, 62);
                if (r70.k.U0(strF1)) {
                }
                if (strF1 != null) {
                }
                return strF1;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ArrayList arrayList2 = d0Var.f89686v;
            Context context3 = d0Var.f89685u;
            rVar = d0Var.f89684t;
            try {
                ResultKt.b(objD);
                arrayListX = arrayList2;
                context2 = context3;
            } catch (Exception e11) {
                e = e11;
                arrayListX = arrayList2;
                context2 = context3;
                Boxing.a(Log.w("NOVA_AI", "HostContext: failed to get Slack summary", e));
                ArrayList arrayList3 = arrayListX;
                rVar.getClass();
                if (fo.d.j()) {
                }
                strF1 = b70.g.f1(arrayList3, ". ", null, null, 0, null, 62);
                if (r70.k.U0(strF1)) {
                }
                if (strF1 != null) {
                }
                return strF1;
            }
            try {
                pVar = (o20.p) objD;
                if (pVar != null) {
                    String strF12 = b70.g.f1(b70.g.E1(pVar.f79454b, 8), ", ", null, null, 0, new s10.i(24), 30);
                    List list = pVar.f79455c;
                    ArrayList arrayList4 = new ArrayList();
                    for (Object obj : list) {
                        if (!r70.k.U0(((o20.n) obj).f79446b)) {
                            arrayList4.add(obj);
                        }
                    }
                    String strF13 = b70.g.f1(b70.g.E1(arrayList4, 6), ", ", null, null, 0, new s10.i(25), 30);
                    List list2 = pVar.f79456d;
                    ArrayList arrayList5 = new ArrayList();
                    for (Object obj2 : list2) {
                        if (((o20.o) obj2).f79452d > 0) {
                            arrayList5.add(obj2);
                        }
                    }
                    String strF14 = b70.g.f1(b70.g.E1(arrayList5, 5), ", ", null, null, 0, new s10.i(26), 30);
                    StringBuilder sb2 = new StringBuilder("Slack workspace: " + pVar.f79453a + ".");
                    if (!r70.k.U0(strF12)) {
                        sb2.append(" Active channels: " + strF12 + ".");
                    }
                    if (!r70.k.U0(strF13)) {
                        sb2.append(" Key colleagues: " + strF13 + ".");
                    }
                    if (!r70.k.U0(strF14)) {
                        sb2.append(" User groups: " + strF14 + ".");
                    }
                    arrayListX.add(sb2.toString());
                }
            } catch (Exception e12) {
                e = e12;
                Boxing.a(Log.w("NOVA_AI", "HostContext: failed to get Slack summary", e));
                ArrayList arrayList32 = arrayListX;
                rVar.getClass();
                if (fo.d.j()) {
                }
                strF1 = b70.g.f1(arrayList32, ". ", null, null, 0, null, 62);
                if (r70.k.U0(strF1)) {
                }
                if (strF1 != null) {
                }
                return strF1;
            }
        }
        ArrayList arrayList322 = arrayListX;
        rVar.getClass();
        try {
            if (fo.d.j()) {
                if (fo.d.d().isContextTypeAllowed(ContextType.SEARCH_HISTORY)) {
                    try {
                        long jCurrentTimeMillis = System.currentTimeMillis() - 604800000;
                        p8.f fVar = new p8.f(context2);
                        try {
                            ArrayList arrayListA = fVar.a(10);
                            ArrayList arrayList6 = new ArrayList();
                            Iterator it = arrayListA.iterator();
                            while (it.hasNext()) {
                                Object next = it.next();
                                if (((f4) next).f89742b >= jCurrentTimeMillis) {
                                    arrayList6.add(next);
                                }
                            }
                            ArrayList arrayList7 = new ArrayList(b70.c.u0(arrayList6, 10));
                            Iterator it2 = arrayList6.iterator();
                            while (it2.hasNext()) {
                                arrayList7.add(((f4) it2.next()).f89741a);
                            }
                            fVar.close();
                            if (!arrayList7.isEmpty()) {
                                arrayList322.add("Recent searches: " + b70.g.f1(arrayList7, ", ", null, null, 0, null, 62));
                            }
                        } finally {
                        }
                    } catch (Exception e13) {
                        Boxing.a(Log.w("NOVA_AI", "HostContext: failed to get search history", e13));
                    }
                }
            }
        } catch (Exception unused) {
        }
        strF1 = b70.g.f1(arrayList322, ". ", null, null, 0, null, 62);
        if (r70.k.U0(strF1)) {
            strF1 = null;
        }
        if (strF1 != null) {
            r70.l.G1(200, strF1);
        }
        return strF1;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object c(Context context, ContinuationImpl continuationImpl) {
        m1 m1Var;
        String str;
        ConsentStatus consentSnapshot;
        if (continuationImpl instanceof m1) {
            m1Var = (m1) continuationImpl;
            int i5 = m1Var.f89876v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                m1Var.f89876v = i5 - Integer.MIN_VALUE;
            } else {
                m1Var = new m1(this, continuationImpl);
            }
        }
        Object objDisableCategoriesAndWait = m1Var.f89874t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = m1Var.f89876v;
        if (i11 == 0) {
            ResultKt.b(objDisableCategoriesAndWait);
            if (j10.m.k(context) && fo.d.j() && (str = io.p.f66706g.f66720d) != null && (consentSnapshot = fo.d.a().getConsentSnapshot()) != null && !Intrinsics.b(consentSnapshot.getTypes().get(str), Boolean.FALSE)) {
                AiAuthManager aiAuthManagerA = fo.d.a();
                List<String> listP = ul.b.P("LOCATION");
                m1Var.f89876v = 1;
                objDisableCategoriesAndWait = aiAuthManagerA.disableCategoriesAndWait(listP, m1Var);
                if (objDisableCategoriesAndWait == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(objDisableCategoriesAndWait);
        ((Boolean) objDisableCategoriesAndWait).getClass();
        return Unit.f71706a;
    }

    public String d(Throwable th2) {
        String message = th2.getMessage();
        if (message == null) {
            message = th2.getClass().getSimpleName();
        }
        return k(this, message);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Serializable e(Context context, String str, ContinuationImpl continuationImpl) {
        n1 n1Var;
        r rVar;
        if (continuationImpl instanceof n1) {
            n1Var = (n1) continuationImpl;
            int i5 = n1Var.f89903y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                n1Var.f89903y = i5 - Integer.MIN_VALUE;
            } else {
                n1Var = new n1(this, continuationImpl);
            }
        }
        Object obj = n1Var.f89901w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = n1Var.f89903y;
        if (i11 == 0) {
            ResultKt.b(obj);
            j10.m mVar = j10.m.f68628a;
            n1Var.f89898t = this;
            n1Var.f89899u = context;
            n1Var.f89900v = str;
            n1Var.f89903y = 1;
            if (mVar.q(context, true, n1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            rVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = n1Var.f89900v;
            context = n1Var.f89899u;
            rVar = n1Var.f89898t;
            ResultKt.b(obj);
        }
        rVar.getClass();
        boolean zI = j10.m.i(context);
        io.p.f66705f.getClass();
        ArrayList arrayListL = br.c.l(str);
        int iD0 = b70.k.d0(b70.c.u0(arrayListL, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        Iterator it = arrayListL.iterator();
        while (it.hasNext()) {
            Object next = it.next();
            linkedHashMap.put(next, Boolean.valueOf((zI && ((io.p) next) == io.p.f66706g) ? false : true));
        }
        return linkedHashMap;
    }

    @Override // com.instabridge.ai.billing.AiEntitlementProvider
    public AiTier getCurrentTier() {
        return (AiTier) q0.f89957b.getValue();
    }

    public String h() {
        String string = j().getString("linked_google_account_id", null);
        if (string == null || r70.k.U0(string)) {
            return null;
        }
        return string;
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x006a, code lost:
    
        if (r11.c(r0) == r1) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0083, code lost:
    
        if (tx.a4.f89654a.f(r10, r0) == r1) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0085, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object l(Context context, ContinuationImpl continuationImpl) {
        o0 o0Var;
        p8.f fVar;
        if (continuationImpl instanceof o0) {
            o0Var = (o0) continuationImpl;
            int i5 = o0Var.f89922w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                o0Var.f89922w = i5 - Integer.MIN_VALUE;
            } else {
                o0Var = new o0(this, continuationImpl);
            }
        }
        Object obj = o0Var.f89920u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = o0Var.f89922w;
        try {
        } catch (CancellationException e3) {
            throw e3;
        } catch (Exception e11) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            bVar.p(e11, "sign-out after deletion", new Object[0]);
        }
        if (i11 == 0) {
            ResultKt.b(obj);
            if (fo.d.j()) {
                try {
                    fo.d.d().clearSyncState();
                } catch (Exception e12) {
                    mc0.b bVar2 = mc0.d.f76206a;
                    bVar2.r("NOVA_AI");
                    bVar2.p(e12, "clearSyncState", new Object[0]);
                }
            }
            d1 d1Var = d1.f89690a;
            o0Var.f89919t = context;
            o0Var.f89922w = 1;
        } else if (i11 == 1) {
            context = o0Var.f89919t;
            ResultKt.b(obj);
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            context = o0Var.f89919t;
            ResultKt.b(obj);
            try {
                fVar = new p8.f(context);
            } catch (Exception e13) {
                mc0.b bVar3 = mc0.d.f76206a;
                bVar3.r("NOVA_AI");
                bVar3.p(e13, "clear search history", new Object[0]);
            }
            try {
                ((o9.x2) fVar.f82452b).getWritableDatabase().delete("searches", null, null);
                fVar.close();
                return Unit.f71706a;
            } finally {
            }
        }
        o0Var.f89919t = context;
        o0Var.f89922w = 2;
    }

    @Override // com.instabridge.ai.billing.AiEntitlementProvider
    public w70.m observeTierChanges() {
        return q0.f89957b;
    }

    @Override // go.a
    public void track(String str, Map map) {
        boolean z11;
        Integer numU0;
        zy.c cVar = zy.c.f98823a;
        zy.c.i(str, map);
        if (d1.f89691b.contains(str)) {
            String str2 = (String) map.get("turn_index");
            int iIntValue = (str2 == null || (numU0 = r70.i.u0(str2)) == null) ? -1 : numU0.intValue();
            String str3 = (String) map.get("entry_source");
            if (str3 == null && (str3 = (String) map.get("entrySource")) == null) {
                str3 = "unknown";
            }
            String str4 = (String) map.get("has_tool_in_prior_turn");
            if (str4 != null) {
                z11 = Boolean.parseBoolean(str4);
            } else {
                String str5 = (String) map.get("hasToolInPriorTurn");
                z11 = str5 != null ? Boolean.parseBoolean(str5) : false;
            }
            p6.f.O("nova_ai_chat_message_sent", MapsKt.j0(new Pair("entry_source", str3), new Pair("turn_index", Integer.valueOf(iIntValue)), new Pair("has_tool_in_prior_turn", Boolean.valueOf(z11))));
        }
    }
}
