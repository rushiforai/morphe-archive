package cy;

import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import b.c9;
import b.i8;
import b10.r0;
import b10.v0;
import com.amplitude.core.events.Plan;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingClientKotlinKt;
import com.android.billingclient.api.ProductDetails;
import com.android.billingclient.api.ProductDetailsResult;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchasesResult;
import com.android.billingclient.api.QueryProductDetailsParams;
import com.android.billingclient.api.QueryPurchasesParams;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.a3;
import e10.g2;
import h6.c1;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.collections.builders.SetBuilder;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.FilteringSequence;
import kotlin.text.MatcherMatchResult$groupValues$1;
import kotlin.text.Regex;
import t70.p2;
import t70.y0;
import tx.p0;
import tx.q0;
import w70.i2;
import w70.u1;

/* loaded from: classes.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public static final d0 f48442a = new d0();

    /* renamed from: b, reason: collision with root package name */
    public static final y70.d f48443b;

    /* renamed from: c, reason: collision with root package name */
    public static final i2 f48444c;

    /* renamed from: d, reason: collision with root package name */
    public static BillingClient f48445d;

    /* renamed from: e, reason: collision with root package name */
    public static boolean f48446e;

    /* renamed from: f, reason: collision with root package name */
    public static Object f48447f;

    /* renamed from: g, reason: collision with root package name */
    public static final i2 f48448g;

    /* renamed from: h, reason: collision with root package name */
    public static final i2 f48449h;

    /* renamed from: i, reason: collision with root package name */
    public static final i2 f48450i;

    /* renamed from: j, reason: collision with root package name */
    public static final i2 f48451j;

    /* renamed from: k, reason: collision with root package name */
    public static String f48452k;

    /* renamed from: l, reason: collision with root package name */
    public static String f48453l;

    /* renamed from: m, reason: collision with root package name */
    public static final LinkedHashSet f48454m;
    public static final t70.s n;
    public static volatile long o;

    /* renamed from: p, reason: collision with root package name */
    public static final i8 f48455p;

    /* renamed from: q, reason: collision with root package name */
    public static final bb.a f48456q;

    static {
        a80.e eVar = y0.f88884a;
        f48443b = t70.k0.a(y70.o.f96819a.plus(t70.m0.d()));
        f48444c = u1.c(null);
        f48447f = b70.h.f17594a;
        i2 i2VarC = u1.c(Boolean.FALSE);
        f48448g = i2VarC;
        f48449h = i2VarC;
        i2 i2VarC2 = u1.c(new d());
        f48450i = i2VarC2;
        f48451j = i2VarC2;
        f48452k = "unknown";
        f48454m = new LinkedHashSet();
        n = t70.m0.b();
        f48455p = new i8(18);
        f48456q = new bb.a(13);
    }

    public static void A(Context context, String str, String str2, String str3) {
        SharedPreferences sharedPreferences = context.getSharedPreferences("nova_billing", 0);
        String string = sharedPreferences.getString("pending_verify_product_id", null);
        c cVarK = k();
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        editorEdit.putString("backend_verified_token", str);
        editorEdit.putString("backend_verified_product_id", str2);
        if (str3 == null || r70.k.U0(str3)) {
            editorEdit.remove("backend_verified_base_plan_id");
        } else {
            editorEdit.putString("backend_verified_base_plan_id", str3);
        }
        String strB = cVarK.b();
        if (strB == null || r70.k.U0(strB)) {
            editorEdit.remove("backend_verified_person_id");
        } else {
            editorEdit.putString("backend_verified_person_id", cVarK.b());
        }
        String strA = cVarK.a();
        if (strA == null || r70.k.U0(strA)) {
            editorEdit.remove("backend_verified_google_identity");
        } else {
            editorEdit.putString("backend_verified_google_identity", cVarK.a());
        }
        if (Intrinsics.b(string, str2)) {
            editorEdit.remove("pending_verify_product_id");
            editorEdit.remove("pending_verify_base_plan_id");
        }
        editorEdit.apply();
    }

    public static int B(String str) {
        kotlin.text.b bVarB = new Regex("P(\\d+)([YM])").b(str);
        if (bVarB != null) {
            Integer numU0 = r70.i.u0((String) ((MatcherMatchResult$groupValues$1) bVarB.a()).get(1));
            int iIntValue = numU0 != null ? numU0.intValue() : 1;
            String str2 = (String) ((MatcherMatchResult$groupValues$1) bVarB.a()).get(2);
            if (Intrinsics.b(str2, "Y")) {
                return iIntValue * 12;
            }
            if (Intrinsics.b(str2, "M")) {
                return iIntValue;
            }
        }
        return 1;
    }

    public static void C(Context context) {
        Context applicationContext = context.getApplicationContext();
        a80.e eVar = y0.f88884a;
        t70.m0.t(f48443b, a80.d.f488c, null, new v0(applicationContext, null, 3), 2);
    }

    public static final void E() {
        t70.m0.t(f48443b, null, null, new r0(7), 3);
    }

    public static void F(Context context, String str) {
        SharedPreferences sharedPreferences = context.getSharedPreferences("nova_billing", 0);
        if (sharedPreferences.getBoolean("subscription_active", false) && y(sharedPreferences)) {
            if (zy.c.d("prime_revocation_guard_enabled", false)) {
                zy.c cVar = zy.c.f98823a;
                zy.c.i("subscription_stale_kept_local", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str), new Pair("last_verified_age_h", Long.valueOf(z(context)))));
            } else {
                h0.a(context, h0.b(str));
                K(context, null, false);
                zy.c cVar2 = zy.c.f98823a;
                c1.A(Plan.AMP_PLAN_SOURCE, str, "subscription_cache_stale_cleared");
            }
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(12:0|2|(2:4|(1:6)(1:7))(0)|8|(1:(1:(1:(17:13|60|(1:65)(1:64)|66|(1:71)(1:70)|72|(1:74)(1:75)|76|(1:78)(1:79)|80|(1:83)|84|(1:88)|89|(1:94)|95|96)(2:14|15))(8:16|99|17|51|52|56|(17:59|60|(2:62|65)(0)|66|(2:68|71)(0)|72|(0)(0)|76|(0)(0)|80|(0)|84|(2:86|88)(0)|89|(2:91|94)|95|96)|58))(3:21|97|22))(2:26|(2:28|29)(2:30|(5:38|101|39|(1:42)|58)(2:36|37)))|43|44|103|47|(5:50|51|52|56|(0))|58|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0164, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0165, code lost:
    
        r2 = r13;
     */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0156  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0191  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x01a0  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x01ad  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x01b8  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x01bb  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x01cb  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x01cd  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01dc  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x01f2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object G(Context context, String str, boolean z11, ContinuationImpl continuationImpl) {
        z zVar;
        Context applicationContext;
        String strS;
        String str2;
        boolean z12;
        String str3;
        String str4;
        int i5;
        String str5;
        String str6;
        int i11;
        int i12;
        Object objI;
        String str7;
        String str8;
        p0 p0Var;
        String str9;
        String strC;
        String strD;
        String str10 = str;
        boolean z13 = z11;
        if (continuationImpl instanceof z) {
            zVar = (z) continuationImpl;
            int i13 = zVar.A;
            if ((i13 & Integer.MIN_VALUE) != 0) {
                zVar.A = i13 - Integer.MIN_VALUE;
            } else {
                zVar = new z(continuationImpl);
            }
        }
        Object objJ = zVar.f48562z;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i14 = zVar.A;
        if (i14 == 0) {
            ResultKt.b(objJ);
            applicationContext = context.getApplicationContext();
            strS = s();
            if (strS.length() == 0) {
                return Boolean.FALSE;
            }
            long jCurrentTimeMillis = System.currentTimeMillis();
            long j11 = jCurrentTimeMillis - o;
            if (!z13 && o != 0 && j11 < 300000) {
                tx.r.i("ai_plus_repair_skipped", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str10), new Pair("reason", "cooldown"), new Pair("cooldown_remaining_ms", new Long(300000 - j11))));
                return Boolean.FALSE;
            }
            o = jCurrentTimeMillis;
            tx.r.i("ai_plus_repair_start", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str10), new Pair("product_id", strS), new Pair("bypass_cooldown", Boolean.valueOf(z13))));
            try {
                zVar.f48556t = str10;
                zVar.f48557u = applicationContext;
                zVar.f48558v = strS;
                zVar.f48559w = z13;
                zVar.A = 1;
                objJ = J(str10 + "_local", zVar);
                if (objJ != coroutineSingletons) {
                    str2 = str10;
                    z12 = z13;
                    str3 = strS;
                }
            } catch (Exception e3) {
                e = e3;
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("NovaBilling");
                bVar.p(e, "repairPlusEntitlement: local restore failed", new Object[0]);
                str4 = str10;
                i5 = 0;
                zVar.f48556t = str4;
                zVar.f48557u = applicationContext;
                zVar.f48558v = strS;
                zVar.f48560x = i5;
                zVar.A = 2;
                objJ = I(applicationContext, str4 + "_verify", z13, zVar);
                if (objJ != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            return coroutineSingletons;
        }
        if (i14 != 1) {
            if (i14 != 2) {
                if (i14 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                i12 = zVar.f48561y;
                i11 = zVar.f48560x;
                str7 = zVar.f48558v;
                applicationContext = zVar.f48557u;
                str8 = zVar.f48556t;
                ResultKt.b(objJ);
                p0Var = (p0) objJ;
                boolean z14 = p0Var == null && p0Var.b();
                i2 i2Var = q0.f89956a;
                q0.e(applicationContext, z14 && x(applicationContext));
                Pair pair = new Pair(Plan.AMP_PLAN_SOURCE, str8);
                Pair pair2 = new Pair("result", !z14 ? "success" : "not_found");
                Pair pair3 = new Pair("product_id", str7);
                Pair pair4 = new Pair("local_restore", Boolean.valueOf(i11 == 0));
                Pair pair5 = new Pair("backend_verify", Boolean.valueOf(i12 != 0));
                str9 = "none";
                if (p0Var != null || (strC = p0Var.c()) == null) {
                    strC = "none";
                }
                Pair pair6 = new Pair("backend_plan", strC);
                if (p0Var != null && (strD = p0Var.d()) != null) {
                    str9 = strD;
                }
                tx.r.i("ai_plus_repair_result", MapsKt.j0(pair, pair2, pair3, pair4, pair5, pair6, new Pair("backend_status", str9)));
                return Boolean.valueOf(z14);
            }
            i5 = zVar.f48560x;
            str5 = zVar.f48558v;
            applicationContext = zVar.f48557u;
            str4 = zVar.f48556t;
            try {
                ResultKt.b(objJ);
                int i15 = i5;
                i12 = ((Boolean) objJ).booleanValue() ? 1 : 0;
                str6 = str5;
                i11 = i15;
            } catch (Exception e11) {
                e = e11;
                mc0.b bVar2 = mc0.d.f76206a;
                bVar2.r("NovaBilling");
                bVar2.p(e, "repairPlusEntitlement: backend verify failed", new Object[0]);
                str6 = str5;
                i11 = i5;
                i12 = 0;
                i2 i2Var2 = q0.f89956a;
                String strE = b.c0.E(str4, "_refresh");
                zVar.f48556t = str4;
                zVar.f48557u = applicationContext;
                zVar.f48558v = str6;
                zVar.f48560x = i11;
                zVar.f48561y = i12;
                zVar.A = 3;
                objI = q0.i(applicationContext, strE, zVar);
                if (objI != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            i2 i2Var22 = q0.f89956a;
            String strE2 = b.c0.E(str4, "_refresh");
            zVar.f48556t = str4;
            zVar.f48557u = applicationContext;
            zVar.f48558v = str6;
            zVar.f48560x = i11;
            zVar.f48561y = i12;
            zVar.A = 3;
            objI = q0.i(applicationContext, strE2, zVar);
            if (objI != coroutineSingletons) {
                str7 = str6;
                objJ = objI;
                str8 = str4;
                p0Var = (p0) objJ;
                if (p0Var == null) {
                }
                i2 i2Var3 = q0.f89956a;
                q0.e(applicationContext, z14 && x(applicationContext));
                Pair pair7 = new Pair(Plan.AMP_PLAN_SOURCE, str8);
                Pair pair22 = new Pair("result", !z14 ? "success" : "not_found");
                Pair pair32 = new Pair("product_id", str7);
                Pair pair42 = new Pair("local_restore", Boolean.valueOf(i11 == 0));
                Pair pair52 = new Pair("backend_verify", Boolean.valueOf(i12 != 0));
                str9 = "none";
                if (p0Var != null) {
                    strC = "none";
                }
                Pair pair62 = new Pair("backend_plan", strC);
                if (p0Var != null) {
                    str9 = strD;
                }
                tx.r.i("ai_plus_repair_result", MapsKt.j0(pair7, pair22, pair32, pair42, pair52, pair62, new Pair("backend_status", str9)));
                return Boolean.valueOf(z14);
            }
            return coroutineSingletons;
        }
        z12 = zVar.f48559w;
        str3 = zVar.f48558v;
        applicationContext = zVar.f48557u;
        str2 = zVar.f48556t;
        try {
            ResultKt.b(objJ);
        } catch (Exception e12) {
            e = e12;
            String str11 = str3;
            z13 = z12;
            str10 = str2;
            strS = str11;
            mc0.b bVar3 = mc0.d.f76206a;
            bVar3.r("NovaBilling");
            bVar3.p(e, "repairPlusEntitlement: local restore failed", new Object[0]);
            str4 = str10;
            i5 = 0;
            zVar.f48556t = str4;
            zVar.f48557u = applicationContext;
            zVar.f48558v = strS;
            zVar.f48560x = i5;
            zVar.A = 2;
            objJ = I(applicationContext, str4 + "_verify", z13, zVar);
            if (objJ != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        str4 = str2;
        strS = str3;
        z13 = z12;
        i5 = ((Boolean) objJ).booleanValue() ? 1 : 0;
        zVar.f48556t = str4;
        zVar.f48557u = applicationContext;
        zVar.f48558v = strS;
        zVar.f48560x = i5;
        zVar.A = 2;
        objJ = I(applicationContext, str4 + "_verify", z13, zVar);
        if (objJ != coroutineSingletons) {
            str5 = strS;
            int i152 = i5;
            i12 = ((Boolean) objJ).booleanValue() ? 1 : 0;
            str6 = str5;
            i11 = i152;
            i2 i2Var222 = q0.f89956a;
            String strE22 = b.c0.E(str4, "_refresh");
            zVar.f48556t = str4;
            zVar.f48557u = applicationContext;
            zVar.f48558v = str6;
            zVar.f48560x = i11;
            zVar.f48561y = i12;
            zVar.A = 3;
            objI = q0.i(applicationContext, strE22, zVar);
            if (objI != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Type inference failed for: r3v2, types: [java.lang.Object, java.util.Map] */
    public static String H(Context context, String str, String str2) {
        List<ProductDetails.SubscriptionOfferDetails> subscriptionOfferDetails;
        String string;
        SharedPreferences sharedPreferences = context.getSharedPreferences("nova_billing", 0);
        List listP0 = null;
        String string2 = sharedPreferences.getString("backend_verified_token", null);
        String string3 = sharedPreferences.getString("backend_verified_product_id", null);
        if (Intrinsics.b(string2, str) && Intrinsics.b(string3, str2)) {
            return sharedPreferences.getString("backend_verified_base_plan_id", null);
        }
        if (Intrinsics.b(sharedPreferences.getString("pending_verify_product_id", null), str2) && (string = sharedPreferences.getString("pending_verify_base_plan_id", null)) != null && !r70.k.U0(string)) {
            return string;
        }
        ProductDetails productDetails = (ProductDetails) f48447f.get(str2);
        if (productDetails != null && (subscriptionOfferDetails = productDetails.getSubscriptionOfferDetails()) != null) {
            ArrayList arrayList = new ArrayList();
            Iterator<T> it = subscriptionOfferDetails.iterator();
            while (it.hasNext()) {
                String basePlanId = ((ProductDetails.SubscriptionOfferDetails) it.next()).getBasePlanId();
                if (basePlanId != null) {
                    arrayList.add(basePlanId);
                }
            }
            listP0 = b70.g.P0(arrayList);
        }
        if (listP0 == null) {
            listP0 = EmptyList.f71733a;
        }
        return (String) b70.g.A1(listP0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:107:0x03c8  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x040f  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x0452  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x0482  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x04a4  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x04a9  */
    /* JADX WARN: Removed duplicated region for block: B:212:0x05e5  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x0426 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:262:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:263:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x01fa  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0229  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0262  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x032b  */
    /* JADX WARN: Type inference failed for: r0v94, types: [java.util.Set] */
    /* JADX WARN: Type inference failed for: r18v10 */
    /* JADX WARN: Type inference failed for: r18v11 */
    /* JADX WARN: Type inference failed for: r18v17, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r20v17, types: [java.util.Set] */
    /* JADX WARN: Type inference failed for: r21v11, types: [java.util.Set] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:145:0x0482 -> B:22:0x008c). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:199:0x051c -> B:186:0x04fa). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:211:0x05d5 -> B:209:0x05c0). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object I(Context context, String str, boolean z11, ContinuationImpl continuationImpl) {
        a0 a0Var;
        boolean z12;
        Context context2;
        tx.r rVar;
        boolean z13;
        String str2;
        f fVar;
        SetBuilder setBuilderL;
        boolean z14;
        Iterator it;
        a0 a0Var2;
        Context context3;
        String str3;
        String str4;
        String str5;
        SetBuilder setBuilder;
        Iterator it2;
        CoroutineSingletons coroutineSingletons;
        d0 d0Var;
        String str6;
        boolean z15;
        Context context4;
        String str7;
        String str8;
        String str9;
        a0 a0Var3;
        String str10;
        String str11;
        Exception e3;
        String str12;
        String str13;
        String str14;
        String str15;
        Purchase purchase;
        CoroutineSingletons coroutineSingletons2;
        String str16;
        String str17;
        String str18;
        a0 a0Var4;
        String str19;
        String str20;
        Object obj;
        String str21;
        String str22;
        String str23;
        String str24;
        String str25;
        a0 a0Var5;
        boolean z16;
        String str26;
        Purchase purchase2;
        String str27;
        b bVar;
        tx.t tVar;
        String packageName;
        String str28;
        boolean z17;
        a0 a0Var6;
        String str29;
        String str30;
        String next;
        SetBuilder setBuilder2;
        boolean z18;
        Context context5;
        CoroutineSingletons coroutineSingletons3;
        a0 a0Var7;
        String str31;
        String str32;
        String str33;
        String str34;
        String str35 = str;
        tx.r rVar2 = tx.r.f89970a;
        if (continuationImpl instanceof a0) {
            a0Var = (a0) continuationImpl;
            int i5 = a0Var.E;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a0Var.E = i5 - Integer.MIN_VALUE;
            } else {
                a0Var = new a0(continuationImpl);
            }
        }
        Object obj2 = a0Var.D;
        CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
        int i11 = a0Var.E;
        String str36 = "reason";
        String str37 = "has_base_plan";
        String str38 = "token_hash";
        d0 d0Var2 = f48442a;
        String str39 = "ai_restore_result";
        String str40 = "backend_verify";
        Object obj3 = obj2;
        if (i11 == 0) {
            ResultKt.b(obj3);
            tx.r.i("ai_restore_start", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str35), new Pair("mode", "backend_verify")));
            a0Var.f48416t = context;
            a0Var.f48417u = str35;
            a0Var.C = z11;
            a0Var.E = 1;
            Object objC = d0Var2.c(a0Var);
            if (objC != coroutineSingletons4) {
                obj3 = objC;
                z12 = z11;
                context2 = context;
            }
            return coroutineSingletons4;
        }
        if (i11 == 1) {
            boolean z19 = a0Var.C;
            String str41 = a0Var.f48417u;
            context2 = a0Var.f48416t;
            ResultKt.b(obj3);
            z12 = z19;
            str35 = str41;
        } else if (i11 == 2) {
            z13 = a0Var.C;
            str2 = a0Var.f48417u;
            context2 = a0Var.f48416t;
            ResultKt.b(obj3);
            rVar = rVar2;
            fVar = (f) obj3;
            if (fVar.b() == 0) {
                tx.r.i("ai_restore_result", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str2), new Pair("mode", "backend_verify"), new Pair("result", "query_error"), new Pair("response_code", new Integer(fVar.b()))));
                return Boolean.FALSE;
            }
            SetBuilder setBuilder3 = new SetBuilder();
            boolean z21 = z13;
            setBuilder3.add(u());
            String strS = s();
            if (strS.length() > 0) {
                setBuilder3.add(strS);
            }
            setBuilderL = ab.e0.l(setBuilder3);
            z14 = z21;
            it = fVar.a().iterator();
            String str42 = str2;
            a0Var2 = a0Var;
            context3 = context2;
            str3 = str42;
            if (it.hasNext()) {
            }
        } else if (i11 != 3) {
            if (i11 == 4) {
                boolean z22 = a0Var.C;
                str6 = a0Var.B;
                String str43 = a0Var.A;
                String str44 = a0Var.f48422z;
                String str45 = a0Var.f48421y;
                Purchase purchase3 = (Purchase) a0Var.f48420x;
                Iterator it3 = a0Var.f48419w;
                Set set = a0Var.f48418v;
                String str46 = a0Var.f48417u;
                Context context6 = a0Var.f48416t;
                try {
                    ResultKt.b(obj3);
                    rVar = rVar2;
                    str4 = "has_base_plan";
                    str13 = "token_hash";
                    d0Var = d0Var2;
                    str16 = str43;
                    z15 = z22;
                    str17 = str44;
                    it2 = it3;
                    setBuilder = set;
                    context4 = context6;
                    str15 = "reason";
                    str14 = "backend_verify";
                    purchase = purchase3;
                    a0Var3 = a0Var;
                    coroutineSingletons2 = coroutineSingletons4;
                    str7 = "ai_restore_result";
                    str10 = str45;
                    str8 = str46;
                } catch (Exception e11) {
                    e3 = e11;
                    rVar = rVar2;
                    str5 = "reason";
                    str11 = "token_hash";
                    d0Var = d0Var2;
                    str19 = str6;
                    z15 = z22;
                    it2 = it3;
                    setBuilder = set;
                    str3 = str46;
                    coroutineSingletons = coroutineSingletons4;
                    context4 = context6;
                    str10 = str45;
                }
                try {
                } catch (Exception e12) {
                    e3 = e12;
                    str11 = str13;
                    coroutineSingletons = coroutineSingletons2;
                    str5 = str15;
                    str9 = str14;
                    setBuilder = setBuilder;
                    str12 = str4;
                    a0Var4 = a0Var3;
                    str19 = str6;
                    str3 = str8;
                    mc0.b bVar2 = mc0.d.f76206a;
                    String str47 = str12;
                    bVar2.r("NovaBilling");
                    bVar2.p(e3, "restoreAndVerifyWithBackend: verification failed for %s", str10);
                    String str48 = str5;
                    tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str9), new Pair("result", "verify_error"), new Pair("product_id", str10), new Pair(str48, rVar.d(e3)), new Pair(str11, str19)));
                    a0Var2 = a0Var4;
                    str36 = str48;
                    str39 = str7;
                    context3 = context4;
                    coroutineSingletons4 = coroutineSingletons;
                    it = it2;
                    setBuilderL = setBuilder;
                    str38 = str11;
                    str40 = str9;
                    z14 = z15;
                    d0Var2 = d0Var;
                    str37 = str47;
                    if (it.hasNext()) {
                    }
                }
                A(context4, str17, str10, str16);
                if (purchase.isAcknowledged()) {
                    try {
                    } catch (Exception e13) {
                        e3 = e13;
                        str5 = str15;
                    }
                    str5 = str15;
                    try {
                    } catch (Exception e14) {
                        e3 = e14;
                        str18 = str7;
                        str11 = str13;
                        coroutineSingletons = coroutineSingletons2;
                        a0Var4 = a0Var3;
                        str19 = str6;
                        str9 = str14;
                        str7 = str18;
                        str12 = str4;
                        str3 = str8;
                        mc0.b bVar22 = mc0.d.f76206a;
                        String str472 = str12;
                        bVar22.r("NovaBilling");
                        bVar22.p(e3, "restoreAndVerifyWithBackend: verification failed for %s", str10);
                        String str482 = str5;
                        tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str9), new Pair("result", "verify_error"), new Pair("product_id", str10), new Pair(str482, rVar.d(e3)), new Pair(str11, str19)));
                        a0Var2 = a0Var4;
                        str36 = str482;
                        str39 = str7;
                        context3 = context4;
                        coroutineSingletons4 = coroutineSingletons;
                        it = it2;
                        setBuilderL = setBuilder;
                        str38 = str11;
                        str40 = str9;
                        z14 = z15;
                        d0Var2 = d0Var;
                        str37 = str472;
                        if (it.hasNext()) {
                        }
                    }
                    str18 = str7;
                    try {
                    } catch (Exception e15) {
                        e3 = e15;
                        str11 = str13;
                        coroutineSingletons = coroutineSingletons2;
                        a0Var4 = a0Var3;
                        str19 = str6;
                        str9 = str14;
                        str7 = str18;
                        str12 = str4;
                        str3 = str8;
                        mc0.b bVar222 = mc0.d.f76206a;
                        String str4722 = str12;
                        bVar222.r("NovaBilling");
                        bVar222.p(e3, "restoreAndVerifyWithBackend: verification failed for %s", str10);
                        String str4822 = str5;
                        tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str9), new Pair("result", "verify_error"), new Pair("product_id", str10), new Pair(str4822, rVar.d(e3)), new Pair(str11, str19)));
                        a0Var2 = a0Var4;
                        str36 = str4822;
                        str39 = str7;
                        context3 = context4;
                        coroutineSingletons4 = coroutineSingletons;
                        it = it2;
                        setBuilderL = setBuilder;
                        str38 = str11;
                        str40 = str9;
                        z14 = z15;
                        d0Var2 = d0Var;
                        str37 = str4722;
                        if (it.hasNext()) {
                        }
                    }
                    try {
                    } catch (Exception e16) {
                        e3 = e16;
                        str11 = str13;
                        coroutineSingletons = coroutineSingletons2;
                        a0Var4 = a0Var3;
                        str19 = str6;
                        str9 = str14;
                        str7 = str18;
                        str12 = str4;
                        str3 = str8;
                        mc0.b bVar2222 = mc0.d.f76206a;
                        String str47222 = str12;
                        bVar2222.r("NovaBilling");
                        bVar2222.p(e3, "restoreAndVerifyWithBackend: verification failed for %s", str10);
                        String str48222 = str5;
                        tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str9), new Pair("result", "verify_error"), new Pair("product_id", str10), new Pair(str48222, rVar.d(e3)), new Pair(str11, str19)));
                        a0Var2 = a0Var4;
                        str36 = str48222;
                        str39 = str7;
                        context3 = context4;
                        coroutineSingletons4 = coroutineSingletons;
                        it = it2;
                        setBuilderL = setBuilder;
                        str38 = str11;
                        str40 = str9;
                        z14 = z15;
                        d0Var2 = d0Var;
                        str37 = str47222;
                        if (it.hasNext()) {
                        }
                    }
                    t70.m0.t(f48443b, null, null, new j(purchase, null), 3);
                } else {
                    str5 = str15;
                    str18 = str7;
                }
                i2 i2Var = q0.f89956a;
                a0Var3.f48416t = context4;
                a0Var3.f48417u = str8;
                a0Var3.f48418v = setBuilder;
                a0Var3.f48419w = it2;
                a0Var3.f48420x = str10;
                a0Var3.f48421y = str16;
                a0Var3.f48422z = str6;
                a0Var3.A = null;
                a0Var3.B = null;
                a0Var3.C = z15;
                a0Var3.E = 5;
                if (q0.h(context4, "restore_and_verify", a0Var3) != coroutineSingletons2) {
                    return coroutineSingletons2;
                }
                str20 = str16;
                setBuilder = setBuilder;
                q0.e(context4, false);
                str9 = str14;
                coroutineSingletons = coroutineSingletons2;
                str12 = str4;
                str11 = str13;
                str7 = str18;
                tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str8), new Pair("mode", str9), new Pair("result", "success"), new Pair("product_id", str10), new Pair(str12, Boolean.valueOf(str20 == null)), new Pair(str11, str6)));
                return Boolean.TRUE;
            }
            if (i11 != 5) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            boolean z23 = a0Var.C;
            str6 = a0Var.f48422z;
            String str49 = a0Var.f48421y;
            String str50 = (String) a0Var.f48420x;
            it2 = a0Var.f48419w;
            Set set2 = a0Var.f48418v;
            String str51 = a0Var.f48417u;
            Context context7 = a0Var.f48416t;
            try {
                ResultKt.b(obj3);
                rVar = rVar2;
                str5 = "reason";
                str4 = "has_base_plan";
                str18 = "ai_restore_result";
                str13 = "token_hash";
                d0Var = d0Var2;
                str20 = str49;
                z15 = z23;
                str8 = str51;
                a0Var3 = a0Var;
                coroutineSingletons2 = coroutineSingletons4;
                context4 = context7;
                str14 = "backend_verify";
                str10 = str50;
                setBuilder = set2;
            } catch (Exception e17) {
                e3 = e17;
                coroutineSingletons = coroutineSingletons4;
                str10 = str50;
                rVar = rVar2;
                str5 = "reason";
                str11 = "token_hash";
                d0Var = d0Var2;
                str19 = str6;
                z15 = z23;
                str3 = str51;
                context4 = context7;
                setBuilder = set2;
            }
            try {
            } catch (Exception e18) {
                e3 = e18;
                str11 = str13;
                coroutineSingletons = coroutineSingletons2;
                str9 = str14;
            }
            q0.e(context4, false);
            try {
            } catch (Exception e19) {
                e3 = e19;
                str11 = str13;
                coroutineSingletons = coroutineSingletons2;
                str9 = str14;
            }
            try {
            } catch (Exception e21) {
                e3 = e21;
                str9 = str14;
            }
            str9 = str14;
            try {
            } catch (Exception e22) {
                e3 = e22;
            }
            try {
            } catch (Exception e23) {
                e3 = e23;
                str11 = str13;
                coroutineSingletons = coroutineSingletons2;
                str7 = str18;
                setBuilder = setBuilder;
                str12 = str4;
                a0Var4 = a0Var3;
                str19 = str6;
                str3 = str8;
                mc0.b bVar22222 = mc0.d.f76206a;
                String str472222 = str12;
                bVar22222.r("NovaBilling");
                bVar22222.p(e3, "restoreAndVerifyWithBackend: verification failed for %s", str10);
                String str482222 = str5;
                tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str9), new Pair("result", "verify_error"), new Pair("product_id", str10), new Pair(str482222, rVar.d(e3)), new Pair(str11, str19)));
                a0Var2 = a0Var4;
                str36 = str482222;
                str39 = str7;
                context3 = context4;
                coroutineSingletons4 = coroutineSingletons;
                it = it2;
                setBuilderL = setBuilder;
                str38 = str11;
                str40 = str9;
                z14 = z15;
                d0Var2 = d0Var;
                str37 = str472222;
                if (it.hasNext()) {
                }
            }
            try {
            } catch (Exception e24) {
                e3 = e24;
                str11 = str13;
                coroutineSingletons = coroutineSingletons2;
                str7 = str18;
                setBuilder = setBuilder;
                str12 = str4;
                a0Var4 = a0Var3;
                str19 = str6;
                str3 = str8;
                mc0.b bVar222222 = mc0.d.f76206a;
                String str4722222 = str12;
                bVar222222.r("NovaBilling");
                bVar222222.p(e3, "restoreAndVerifyWithBackend: verification failed for %s", str10);
                String str4822222 = str5;
                tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str9), new Pair("result", "verify_error"), new Pair("product_id", str10), new Pair(str4822222, rVar.d(e3)), new Pair(str11, str19)));
                a0Var2 = a0Var4;
                str36 = str4822222;
                str39 = str7;
                context3 = context4;
                coroutineSingletons4 = coroutineSingletons;
                it = it2;
                setBuilderL = setBuilder;
                str38 = str11;
                str40 = str9;
                z14 = z15;
                d0Var2 = d0Var;
                str37 = str4722222;
                if (it.hasNext()) {
                }
            }
            try {
            } catch (Exception e25) {
                e3 = e25;
                coroutineSingletons = coroutineSingletons2;
                str12 = str4;
            }
            coroutineSingletons = coroutineSingletons2;
            str12 = str4;
            try {
            } catch (Exception e26) {
                e3 = e26;
                str11 = str13;
                str7 = str18;
                a0Var4 = a0Var3;
                str19 = str6;
                str3 = str8;
                mc0.b bVar2222222 = mc0.d.f76206a;
                String str47222222 = str12;
                bVar2222222.r("NovaBilling");
                bVar2222222.p(e3, "restoreAndVerifyWithBackend: verification failed for %s", str10);
                String str48222222 = str5;
                tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str9), new Pair("result", "verify_error"), new Pair("product_id", str10), new Pair(str48222222, rVar.d(e3)), new Pair(str11, str19)));
                a0Var2 = a0Var4;
                str36 = str48222222;
                str39 = str7;
                context3 = context4;
                coroutineSingletons4 = coroutineSingletons;
                it = it2;
                setBuilderL = setBuilder;
                str38 = str11;
                str40 = str9;
                z14 = z15;
                d0Var2 = d0Var;
                str37 = str47222222;
                if (it.hasNext()) {
                }
            }
            try {
            } catch (Exception e27) {
                e3 = e27;
                str11 = str13;
            }
            str11 = str13;
            try {
            } catch (Exception e28) {
                e3 = e28;
            }
            try {
            } catch (Exception e29) {
                e3 = e29;
                str7 = str18;
                a0Var4 = a0Var3;
                str19 = str6;
                str3 = str8;
                mc0.b bVar22222222 = mc0.d.f76206a;
                String str472222222 = str12;
                bVar22222222.r("NovaBilling");
                bVar22222222.p(e3, "restoreAndVerifyWithBackend: verification failed for %s", str10);
                String str482222222 = str5;
                tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str9), new Pair("result", "verify_error"), new Pair("product_id", str10), new Pair(str482222222, rVar.d(e3)), new Pair(str11, str19)));
                a0Var2 = a0Var4;
                str36 = str482222222;
                str39 = str7;
                context3 = context4;
                coroutineSingletons4 = coroutineSingletons;
                it = it2;
                setBuilderL = setBuilder;
                str38 = str11;
                str40 = str9;
                z14 = z15;
                d0Var2 = d0Var;
                str37 = str472222222;
                if (it.hasNext()) {
                }
            }
            str7 = str18;
            try {
            } catch (Exception e31) {
                e3 = e31;
                a0Var4 = a0Var3;
                str19 = str6;
                str3 = str8;
                mc0.b bVar222222222 = mc0.d.f76206a;
                String str4722222222 = str12;
                bVar222222222.r("NovaBilling");
                bVar222222222.p(e3, "restoreAndVerifyWithBackend: verification failed for %s", str10);
                String str4822222222 = str5;
                tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str9), new Pair("result", "verify_error"), new Pair("product_id", str10), new Pair(str4822222222, rVar.d(e3)), new Pair(str11, str19)));
                a0Var2 = a0Var4;
                str36 = str4822222222;
                str39 = str7;
                context3 = context4;
                coroutineSingletons4 = coroutineSingletons;
                it = it2;
                setBuilderL = setBuilder;
                str38 = str11;
                str40 = str9;
                z14 = z15;
                d0Var2 = d0Var;
                str37 = str4722222222;
                if (it.hasNext()) {
                }
            }
            tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str8), new Pair("mode", str9), new Pair("result", "success"), new Pair("product_id", str10), new Pair(str12, Boolean.valueOf(str20 == null)), new Pair(str11, str6)));
            return Boolean.TRUE;
            a0Var4 = a0Var;
            str12 = "has_base_plan";
            str9 = "backend_verify";
            str7 = "ai_restore_result";
            mc0.b bVar2222222222 = mc0.d.f76206a;
            String str47222222222 = str12;
            bVar2222222222.r("NovaBilling");
            bVar2222222222.p(e3, "restoreAndVerifyWithBackend: verification failed for %s", str10);
            String str48222222222 = str5;
            tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str9), new Pair("result", "verify_error"), new Pair("product_id", str10), new Pair(str48222222222, rVar.d(e3)), new Pair(str11, str19)));
            a0Var2 = a0Var4;
            str36 = str48222222222;
            str39 = str7;
            context3 = context4;
            coroutineSingletons4 = coroutineSingletons;
            it = it2;
            setBuilderL = setBuilder;
            str38 = str11;
            str40 = str9;
            z14 = z15;
            d0Var2 = d0Var;
            str37 = str47222222222;
            if (it.hasNext()) {
                d0 d0Var3 = d0Var2;
                Purchase purchase4 = (Purchase) it.next();
                Iterator it4 = purchase4.getProducts().iterator();
                while (true) {
                    if (!it4.hasNext()) {
                        str23 = str39;
                        next = 0;
                        break;
                    }
                    next = it4.next();
                    str23 = str39;
                    if (setBuilderL.contains((String) next)) {
                        break;
                    }
                    str39 = str23;
                }
                String str52 = next;
                if (str52 == null) {
                    setBuilder2 = setBuilderL;
                    z18 = z14;
                    context5 = context3;
                    coroutineSingletons3 = coroutineSingletons4;
                    a0Var7 = a0Var2;
                    str34 = str36;
                    str47222222222 = str37;
                    str31 = str40;
                    str32 = str38;
                    str33 = str23;
                } else {
                    setBuilder2 = setBuilderL;
                    str22 = str36;
                    if (purchase4.getPurchaseState() == 1 && L(str52)) {
                        String purchaseToken = purchase4.getPurchaseToken();
                        String strH = H(context3, purchaseToken, str52);
                        str21 = str38;
                        String strM = tx.r.m(purchaseToken);
                        a0Var2.f48416t = context3;
                        a0Var2.f48417u = str3;
                        Context context8 = context3;
                        a0Var2.f48418v = setBuilder2;
                        a0Var2.f48419w = it;
                        a0Var2.f48420x = purchase4;
                        a0Var2.f48421y = str52;
                        a0Var2.f48422z = purchaseToken;
                        a0Var2.A = strH;
                        a0Var2.B = strM;
                        a0Var2.C = z14;
                        a0Var2.E = 3;
                        str24 = purchaseToken;
                        a0 a0Var8 = a0Var2;
                        String str53 = str3;
                        Object objG = d0Var3.g(context8, str24, str52, strH, str53, a0Var8);
                        d0Var = d0Var3;
                        str3 = str53;
                        if (objG != coroutineSingletons4) {
                            z16 = z14;
                            str19 = strM;
                            context4 = context8;
                            str26 = str52;
                            a0Var5 = a0Var8;
                            it2 = it;
                            obj = objG;
                            purchase2 = purchase4;
                            str25 = strH;
                            setBuilder = setBuilder2;
                            str27 = str24;
                            bVar = (b) obj;
                            if (bVar.d()) {
                                coroutineSingletons = coroutineSingletons4;
                                str4 = str37;
                                str14 = str40;
                                str7 = str23;
                                str15 = str22;
                                str13 = str21;
                            } else {
                                coroutineSingletons = coroutineSingletons4;
                                Pair pair = new Pair(Plan.AMP_PLAN_SOURCE, str3);
                                Pair pair2 = new Pair("mode", str40);
                                str14 = str40;
                                Pair pair3 = new Pair("result", bVar.a() ? "cached_success" : "cached_backend_missing");
                                Pair pair4 = new Pair("product_id", str26);
                                Pair pair5 = new Pair(str37, Boolean.valueOf(str25 != null));
                                String str54 = str21;
                                Pair pair6 = new Pair(str54, str19);
                                String strB = bVar.b();
                                str13 = str54;
                                str4 = str37;
                                Pair pair7 = new Pair("backend_plan", strB == null ? "none" : strB);
                                String strC = bVar.c();
                                if (strC == null) {
                                    strC = "none";
                                }
                                Pair pair8 = new Pair("backend_status", strC);
                                String strE = bVar.e();
                                if (strE == null) {
                                    strE = "none";
                                }
                                str15 = str22;
                                Map mapJ0 = MapsKt.j0(pair, pair2, pair3, pair4, pair5, pair6, pair7, pair8, new Pair(str15, strE));
                                str7 = str23;
                                tx.r.i(str7, mapJ0);
                                if (bVar.a()) {
                                    return Boolean.TRUE;
                                }
                            }
                            try {
                            } catch (Exception e32) {
                                e3 = e32;
                                String str55 = str26;
                                boolean z24 = z16;
                                str5 = str15;
                                str9 = str14;
                                str12 = str4;
                                str11 = str13;
                                str10 = str55;
                                z15 = z24;
                                a0Var4 = a0Var5;
                            }
                            tVar = tx.t.f90002a;
                            packageName = context4.getPackageName();
                            a0Var5.f48416t = context4;
                            a0Var5.f48417u = str3;
                            try {
                            } catch (Exception e33) {
                                e3 = e33;
                                str28 = str26;
                                z17 = z16;
                                str5 = str15;
                                a0Var6 = a0Var5;
                                str29 = str3;
                                str9 = str14;
                                str12 = str4;
                                str11 = str13;
                            }
                            a0Var5.f48418v = setBuilder;
                            a0Var5.f48419w = it2;
                            a0Var5.f48420x = purchase2;
                            a0Var5.f48421y = str26;
                            a0Var5.f48422z = str27;
                            a0Var5.A = str25;
                            a0Var5.B = str19;
                            a0Var5.C = z16;
                            a0Var5.E = 4;
                            str28 = str26;
                            z17 = z16;
                            a0Var6 = a0Var5;
                            str30 = str25;
                            str29 = str3;
                            try {
                            } catch (Exception e34) {
                                e3 = e34;
                                str11 = str13;
                                str5 = str15;
                                str9 = str14;
                                str12 = str4;
                                str10 = str28;
                                str3 = str29;
                                z15 = z17;
                                a0Var4 = a0Var6;
                                mc0.b bVar22222222222 = mc0.d.f76206a;
                                String str472222222222 = str12;
                                bVar22222222222.r("NovaBilling");
                                bVar22222222222.p(e3, "restoreAndVerifyWithBackend: verification failed for %s", str10);
                                String str482222222222 = str5;
                                tx.r.i(str7, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str9), new Pair("result", "verify_error"), new Pair("product_id", str10), new Pair(str482222222222, rVar.d(e3)), new Pair(str11, str19)));
                                a0Var2 = a0Var4;
                                str36 = str482222222222;
                                str39 = str7;
                                context3 = context4;
                                coroutineSingletons4 = coroutineSingletons;
                                it = it2;
                                setBuilderL = setBuilder;
                                str38 = str11;
                                str40 = str9;
                                z14 = z15;
                                d0Var2 = d0Var;
                                str37 = str472222222222;
                                if (it.hasNext()) {
                                }
                            }
                            coroutineSingletons2 = coroutineSingletons;
                            if (tVar.a(str27, str28, str30, packageName, str29, z17, a0Var6) != coroutineSingletons2) {
                                return coroutineSingletons2;
                            }
                            purchase = purchase2;
                            str6 = str19;
                            str17 = str27;
                            str10 = str28;
                            str16 = str30;
                            str8 = str29;
                            z15 = z17;
                            a0Var3 = a0Var6;
                            setBuilder = setBuilder;
                            A(context4, str17, str10, str16);
                            if (purchase.isAcknowledged()) {
                            }
                            i2 i2Var2 = q0.f89956a;
                            a0Var3.f48416t = context4;
                            a0Var3.f48417u = str8;
                            a0Var3.f48418v = setBuilder;
                            a0Var3.f48419w = it2;
                            a0Var3.f48420x = str10;
                            a0Var3.f48421y = str16;
                            a0Var3.f48422z = str6;
                            a0Var3.A = null;
                            a0Var3.B = null;
                            a0Var3.C = z15;
                            a0Var3.E = 5;
                            if (q0.h(context4, "restore_and_verify", a0Var3) != coroutineSingletons2) {
                            }
                        }
                        return coroutineSingletons4;
                    }
                    z18 = z14;
                    context5 = context3;
                    coroutineSingletons3 = coroutineSingletons4;
                    a0Var7 = a0Var2;
                    str472222222222 = str37;
                    str31 = str40;
                    str32 = str38;
                    str33 = str23;
                    str34 = str22;
                }
                setBuilderL = setBuilder2;
                str38 = str32;
                str36 = str34;
                str39 = str33;
                z14 = z18;
                context3 = context5;
                d0Var2 = d0Var3;
                coroutineSingletons4 = coroutineSingletons3;
                a0Var2 = a0Var7;
                str40 = str31;
                str37 = str472222222222;
                if (it.hasNext()) {
                    tx.r.i(str39, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("mode", str40), new Pair("result", "not_found")));
                    return Boolean.FALSE;
                }
            }
        } else {
            boolean z25 = a0Var.C;
            String str56 = a0Var.B;
            String str57 = a0Var.A;
            str24 = a0Var.f48422z;
            String str58 = a0Var.f48421y;
            Purchase purchase5 = (Purchase) a0Var.f48420x;
            Iterator it5 = a0Var.f48419w;
            Set set3 = a0Var.f48418v;
            String str59 = a0Var.f48417u;
            Context context9 = a0Var.f48416t;
            ResultKt.b(obj3);
            rVar = rVar2;
            str22 = "reason";
            str23 = "ai_restore_result";
            str21 = "token_hash";
            str26 = str58;
            it2 = it5;
            context4 = context9;
            a0Var5 = a0Var;
            str19 = str56;
            z16 = z25;
            purchase2 = purchase5;
            obj = obj3;
            d0Var = d0Var2;
            str25 = str57;
            str3 = str59;
            setBuilder = set3;
            str27 = str24;
            bVar = (b) obj;
            if (bVar.d()) {
            }
            tVar = tx.t.f90002a;
            packageName = context4.getPackageName();
            a0Var5.f48416t = context4;
            a0Var5.f48417u = str3;
            a0Var5.f48418v = setBuilder;
            a0Var5.f48419w = it2;
            a0Var5.f48420x = purchase2;
            a0Var5.f48421y = str26;
            a0Var5.f48422z = str27;
            a0Var5.A = str25;
            a0Var5.B = str19;
            a0Var5.C = z16;
            a0Var5.E = 4;
            str28 = str26;
            z17 = z16;
            a0Var6 = a0Var5;
            str30 = str25;
            str29 = str3;
            coroutineSingletons2 = coroutineSingletons;
            if (tVar.a(str27, str28, str30, packageName, str29, z17, a0Var6) != coroutineSingletons2) {
            }
        }
        rVar = rVar2;
        BillingClient billingClient = (BillingClient) obj3;
        if (billingClient == null) {
            tx.r.i("ai_restore_result", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str35), new Pair("mode", "backend_verify"), new Pair("result", "no_client")));
            return Boolean.FALSE;
        }
        a0Var.f48416t = context2;
        a0Var.f48417u = str35;
        a0Var.C = z12;
        String str60 = str35;
        a0Var.E = 2;
        z13 = z12;
        Object objD = d0Var2.D(billingClient, false, a0Var);
        if (objD != coroutineSingletons4) {
            str2 = str60;
            obj3 = objD;
            fVar = (f) obj3;
            if (fVar.b() == 0) {
            }
        }
        return coroutineSingletons4;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object J(String str, ContinuationImpl continuationImpl) {
        b0 b0Var;
        String str2;
        if (continuationImpl instanceof b0) {
            b0Var = (b0) continuationImpl;
            int i5 = b0Var.f48430v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b0Var.f48430v = i5 - Integer.MIN_VALUE;
            } else {
                b0Var = new b0(continuationImpl);
            }
        }
        Object objP = b0Var.f48429u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b0Var.f48430v;
        if (i11 == 0) {
            ResultKt.b(objP);
            tx.r.i("ai_restore_start", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str), new Pair("mode", "local")));
            b0Var.f48428t = str;
            b0Var.f48430v = 1;
            objP = f48442a.P(b0Var);
            if (objP == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = b0Var.f48428t;
            ResultKt.b(objP);
        }
        Boolean bool = (Boolean) objP;
        Pair pair = new Pair(Plan.AMP_PLAN_SOURCE, str);
        Pair pair2 = new Pair("mode", "local");
        Boolean bool2 = Boolean.TRUE;
        if (Intrinsics.b(bool, bool2)) {
            str2 = "success";
        } else if (Intrinsics.b(bool, Boolean.FALSE)) {
            str2 = "not_found";
        } else {
            if (bool != null) {
                throw new NoWhenBranchMatchedException();
            }
            str2 = "error";
        }
        Pair pair3 = new Pair("result", str2);
        Context context = mx.g0.f77088a;
        Pair pair4 = new Pair("has_local_plus", Boolean.valueOf(x(mx.g0.e())));
        i2 i2Var = q0.f89956a;
        tx.r.i("ai_restore_result", MapsKt.j0(pair, pair2, pair3, pair4, new Pair("has_backend_plus", Boolean.valueOf(q0.b(mx.g0.e())))));
        return Boolean.valueOf(Intrinsics.b(bool, bool2));
    }

    public static void K(Context context, String str, boolean z11) {
        SharedPreferences sharedPreferences = context.getSharedPreferences("nova_billing", 0);
        boolean z12 = sharedPreferences.getBoolean("subscription_active", false) != z11;
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        editorEdit.putBoolean("subscription_active", z11);
        if (str != null) {
            editorEdit.putString("purchase_token", str);
            editorEdit.putLong("purchase_time", System.currentTimeMillis());
        }
        if (z11) {
            editorEdit.putLong("last_verified", System.currentTimeMillis());
        } else {
            editorEdit.remove("purchase_token");
            editorEdit.remove("purchase_time");
            editorEdit.remove("last_verified");
            editorEdit.remove("pending_verify_product_id");
            editorEdit.remove("pending_verify_base_plan_id");
            editorEdit.remove("backend_verified_token");
            editorEdit.remove("backend_verified_product_id");
            editorEdit.remove("backend_verified_base_plan_id");
            editorEdit.remove("backend_verified_person_id");
            editorEdit.remove("backend_verified_google_identity");
            editorEdit.putBoolean("plus_active", false);
        }
        editorEdit.apply();
        if (!z12) {
            C(context);
            return;
        }
        if (z11) {
            g2 g2Var = a3.f51435a;
            g2Var.f51552h = true;
            g2Var.b(UUID.randomUUID().hashCode());
            c9.q(g2Var.f51545a, "nova_prime", true);
        } else {
            g2 g2Var2 = a3.f51435a;
            g2Var2.f51552h = false;
            g2Var2.b(0);
            c9.q(g2Var2.f51545a, "nova_prime", false);
        }
        g2 g2Var3 = a3.f51435a;
        g2Var3.onSharedPreferenceChanged(g2Var3.f51545a, "_all");
        C(context);
        ComponentName componentName = NovaLauncher.f45646r1;
        ab.e0.O();
    }

    public static boolean L(String str) {
        String strS = s();
        return strS.length() > 0 && Intrinsics.b(str, strS);
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Object, java.util.Map] */
    public static boolean M(String str) {
        String strS;
        List<ProductDetails.SubscriptionOfferDetails> subscriptionOfferDetails;
        ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails2;
        ProductDetails.PricingPhases pricingPhases;
        List<ProductDetails.PricingPhase> pricingPhaseList;
        if (Intrinsics.b(str, "prime")) {
            strS = u();
        } else {
            if (!Intrinsics.b(str, "plus")) {
                return false;
            }
            strS = s();
        }
        ProductDetails productDetails = (ProductDetails) f48447f.get(strS);
        if (productDetails == null || (subscriptionOfferDetails = productDetails.getSubscriptionOfferDetails()) == null || (subscriptionOfferDetails2 = (ProductDetails.SubscriptionOfferDetails) b70.g.Y0(subscriptionOfferDetails)) == null || (pricingPhases = subscriptionOfferDetails2.getPricingPhases()) == null || (pricingPhaseList = pricingPhases.getPricingPhaseList()) == null) {
            return false;
        }
        List<ProductDetails.PricingPhase> list = pricingPhaseList;
        if ((list instanceof Collection) && list.isEmpty()) {
            return false;
        }
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            if (((ProductDetails.PricingPhase) it.next()).getPriceAmountMicros() == 0) {
                return true;
            }
        }
        return false;
    }

    public static MapBuilder N(d0 d0Var, String str, Map map, int i5) {
        if ((i5 & 1) != 0) {
            str = null;
        }
        if ((i5 & 2) != 0) {
            map = b70.h.f17594a;
        }
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("tier", str == null ? "unknown" : str);
        mapBuilder.put("has_trial", Boolean.valueOf(M(str)));
        mapBuilder.put(Plan.AMP_PLAN_SOURCE, f48452k);
        mapBuilder.putAll(map);
        return mapBuilder.b();
    }

    public static boolean O(BillingClient billingClient, String str) {
        try {
            return billingClient.isFeatureSupported(str).getResponseCode() == 0;
        } catch (Exception e3) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NovaBilling");
            bVar.p(e3, "Feature check failed for %s", str);
            return false;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0067 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object d(ContinuationImpl continuationImpl) {
        l lVar;
        if (continuationImpl instanceof l) {
            lVar = (l) continuationImpl;
            int i5 = lVar.f48504u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f48504u = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(continuationImpl);
            }
        }
        Object obj = lVar.f48503t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lVar.f48504u;
        if (i11 == 0) {
            ResultKt.b(obj);
            zy.c cVar = zy.c.f98823a;
            lVar.f48504u = 1;
            if (cVar.a(lVar) != coroutineSingletons) {
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
            ResultKt.b(obj);
            r0 r0Var = new r0(5);
            lVar.f48504u = 3;
            Object objD = p2.d(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, r0Var, lVar);
            return objD != coroutineSingletons ? coroutineSingletons : objD;
        }
        ResultKt.b(obj);
        lVar.f48504u = 2;
        if (f48442a.c(lVar) != coroutineSingletons) {
            r0 r0Var2 = new r0(5);
            lVar.f48504u = 3;
            Object objD2 = p2.d(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, r0Var2, lVar);
            if (objD2 != coroutineSingletons) {
            }
        }
    }

    public static String e(String str) {
        return str.equals(u()) ? "prime" : str.equals(s()) ? "plus" : "unknown";
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x003f A[PHI: r4
      0x003f: PHI (r4v2 com.android.billingclient.api.ProductDetails$SubscriptionOfferDetails) = 
      (r4v1 com.android.billingclient.api.ProductDetails$SubscriptionOfferDetails)
      (r4v6 com.android.billingclient.api.ProductDetails$SubscriptionOfferDetails)
     binds: [B:19:0x003c, B:17:0x0033] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static g f(ProductDetails productDetails, String str) {
        List<ProductDetails.SubscriptionOfferDetails> subscriptionOfferDetails;
        Object next;
        Object next2;
        Object next3;
        if (productDetails != null && (subscriptionOfferDetails = productDetails.getSubscriptionOfferDetails()) != null) {
            if (str != null) {
                Iterator<T> it = subscriptionOfferDetails.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        next3 = null;
                        break;
                    }
                    next3 = it.next();
                    if (Intrinsics.b(((ProductDetails.SubscriptionOfferDetails) next3).getBasePlanId(), str)) {
                        break;
                    }
                }
                ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails2 = (ProductDetails.SubscriptionOfferDetails) next3;
                if (subscriptionOfferDetails2 == null) {
                    subscriptionOfferDetails2 = (ProductDetails.SubscriptionOfferDetails) b70.g.Y0(subscriptionOfferDetails);
                    if (subscriptionOfferDetails2 != null) {
                        List<ProductDetails.PricingPhase> pricingPhaseList = subscriptionOfferDetails2.getPricingPhases().getPricingPhaseList();
                        List<ProductDetails.PricingPhase> list = pricingPhaseList;
                        Iterator<T> it2 = list.iterator();
                        while (true) {
                            if (!it2.hasNext()) {
                                next = null;
                                break;
                            }
                            next = it2.next();
                            if (((ProductDetails.PricingPhase) next).getPriceAmountMicros() == 0) {
                                break;
                            }
                        }
                        ProductDetails.PricingPhase pricingPhase = (ProductDetails.PricingPhase) next;
                        Iterator<T> it3 = list.iterator();
                        while (true) {
                            if (!it3.hasNext()) {
                                next2 = null;
                                break;
                            }
                            next2 = it3.next();
                            if (((ProductDetails.PricingPhase) next2).getPriceAmountMicros() > 0) {
                                break;
                            }
                        }
                        ProductDetails.PricingPhase pricingPhase2 = (ProductDetails.PricingPhase) next2;
                        if (pricingPhase2 != null || (pricingPhase2 = (ProductDetails.PricingPhase) b70.g.i1(pricingPhaseList)) != null) {
                            return new g(pricingPhase2.getFormattedPrice(), i0.c(pricingPhase2.getBillingPeriod()), pricingPhase != null ? i0.c(pricingPhase.getBillingPeriod()) : null, pricingPhase != null ? i0.b(pricingPhase.getBillingPeriod()) : 0, pricingPhase != null, null, subscriptionOfferDetails2.getOfferToken(), pricingPhase2.getPriceAmountMicros(), B(pricingPhase2.getBillingPeriod()), 32);
                        }
                    }
                }
            }
        }
        return null;
    }

    public static final void h(Context context, String str) {
        i(context, true);
        tx.r.i("ai_verify_cache_invalidated", MapsKt.j0(new Pair("reason", tx.r.k(tx.r.f89970a, str)), new Pair("has_session", Boolean.valueOf(ps.k.r()))));
    }

    public static void i(Context context, boolean z11) {
        SharedPreferences.Editor editorRemove = context.getSharedPreferences("nova_billing", 0).edit().remove("backend_verified_token").remove("backend_verified_product_id").remove("backend_verified_base_plan_id").remove("backend_verified_person_id").remove("backend_verified_google_identity");
        if (z11) {
            editorRemove.remove("pending_verify_product_id");
            editorRemove.remove("pending_verify_base_plan_id");
        }
        editorRemove.apply();
    }

    public static c k() {
        String personId;
        String str = null;
        if (fo.d.j() && (personId = fo.d.a().getPersonId()) != null && !r70.k.U0(personId)) {
            str = personId;
        }
        return new c(str, l());
    }

    public static String l() {
        String string;
        String strM = ps.k.m();
        if (strM != null) {
            if (r70.k.U0(strM)) {
                strM = null;
            }
            if (strM != null) {
                return strM;
            }
        }
        String strN = ps.k.n();
        if (strN == null || (string = r70.k.u1(strN).toString()) == null || string.length() <= 0) {
            return null;
        }
        return string;
    }

    public static final void n(Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences("nova_billing", 0);
        boolean z11 = sharedPreferences.getBoolean("plus_active", false);
        boolean z12 = sharedPreferences.getBoolean("subscription_active", false) && z11;
        sharedPreferences.edit().putBoolean("subscription_active", true).putBoolean("plus_active", true).putLong("last_verified", System.currentTimeMillis()).apply();
        if (z12) {
            C(context);
            return;
        }
        if (!z11) {
            ps.j.m(context);
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NovaBilling");
            bVar.b("Plus granted — restored Nova Now AI left-swipe", new Object[0]);
        }
        g2 g2Var = a3.f51435a;
        g2Var.f51552h = true;
        g2Var.b(UUID.randomUUID().hashCode());
        c9.q(g2Var.f51545a, "nova_prime", true);
        g2Var.onSharedPreferenceChanged(g2Var.f51545a, "_all");
        C(context);
        ComponentName componentName = NovaLauncher.f45646r1;
        ab.e0.O();
        mc0.b bVar2 = mc0.d.f76206a;
        bVar2.r("NovaBilling");
        bVar2.b("Prime+Plus features enabled via backend confirmation", new Object[0]);
    }

    public static h o(Context context, String str, g gVar) {
        return new h(w(context) ? i.f48489a : i.f48493e, null, str, gVar != null ? gVar.c() : null, gVar != null ? gVar.b() : null, gVar != null ? gVar.e() : null, gVar != null ? gVar.d() : 0, gVar != null && gVar.a(), null, null);
    }

    public static Purchase q(List list) {
        Object next;
        SetBuilder setBuilder = new SetBuilder();
        setBuilder.add(u());
        String strS = s();
        if (strS.length() > 0) {
            setBuilder.add(strS);
        }
        FilteringSequence.AnonymousClass1 anonymousClass1 = new FilteringSequence.AnonymousClass1();
        if (anonymousClass1.hasNext()) {
            next = anonymousClass1.next();
            if (anonymousClass1.hasNext()) {
                long purchaseTime = ((Purchase) next).getPurchaseTime();
                do {
                    Object next2 = anonymousClass1.next();
                    long purchaseTime2 = ((Purchase) next2).getPurchaseTime();
                    if (purchaseTime < purchaseTime2) {
                        next = next2;
                        purchaseTime = purchaseTime2;
                    }
                } while (anonymousClass1.hasNext());
            }
        } else {
            next = null;
        }
        return (Purchase) next;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0101  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object r(ContinuationImpl continuationImpl) {
        r rVar;
        g gVar;
        Object next;
        Object next2;
        List<ProductDetails.SubscriptionOfferDetails> subscriptionOfferDetails;
        ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails2;
        Object next3;
        Object next4;
        if (continuationImpl instanceof r) {
            rVar = (r) continuationImpl;
            int i5 = rVar.f48527u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.f48527u = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(continuationImpl);
            }
        }
        Object objP = rVar.f48526t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rVar.f48527u;
        if (i11 == 0) {
            ResultKt.b(objP);
            rVar.f48527u = 1;
            objP = f48442a.p(rVar);
            if (objP == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objP);
        }
        Map map = (Map) objP;
        EmptyList emptyList = null;
        if (map == null) {
            return new e(null, EmptyList.f71733a);
        }
        ProductDetails productDetails = (ProductDetails) map.get(u());
        if (productDetails == null || (subscriptionOfferDetails = productDetails.getSubscriptionOfferDetails()) == null || (subscriptionOfferDetails2 = (ProductDetails.SubscriptionOfferDetails) b70.g.Y0(subscriptionOfferDetails)) == null) {
            gVar = null;
        } else {
            List<ProductDetails.PricingPhase> pricingPhaseList = subscriptionOfferDetails2.getPricingPhases().getPricingPhaseList();
            List<ProductDetails.PricingPhase> list = pricingPhaseList;
            Iterator<T> it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next3 = null;
                    break;
                }
                next3 = it.next();
                if (((ProductDetails.PricingPhase) next3).getPriceAmountMicros() == 0) {
                    break;
                }
            }
            ProductDetails.PricingPhase pricingPhase = (ProductDetails.PricingPhase) next3;
            Iterator<T> it2 = list.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next4 = null;
                    break;
                }
                next4 = it2.next();
                if (((ProductDetails.PricingPhase) next4).getPriceAmountMicros() > 0) {
                    break;
                }
            }
            ProductDetails.PricingPhase pricingPhase2 = (ProductDetails.PricingPhase) next4;
            if (pricingPhase2 != null || (pricingPhase2 = (ProductDetails.PricingPhase) b70.g.i1(pricingPhaseList)) != null) {
                gVar = new g(pricingPhase2.getFormattedPrice(), i0.c(pricingPhase2.getBillingPeriod()), pricingPhase != null ? i0.c(pricingPhase.getBillingPeriod()) : null, pricingPhase != null ? i0.b(pricingPhase.getBillingPeriod()) : 0, pricingPhase != null, l0.f48505c, subscriptionOfferDetails2.getOfferToken(), pricingPhase2.getPriceAmountMicros(), B(pricingPhase2.getBillingPeriod()));
            }
        }
        if (s().length() > 0) {
            ProductDetails productDetails2 = (ProductDetails) map.get(s());
            if (productDetails2 != null) {
                List<ProductDetails.SubscriptionOfferDetails> subscriptionOfferDetails3 = productDetails2.getSubscriptionOfferDetails();
                if (subscriptionOfferDetails3 == null) {
                    emptyList = EmptyList.f71733a;
                } else {
                    ArrayList arrayList = new ArrayList();
                    for (ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails4 : subscriptionOfferDetails3) {
                        List<ProductDetails.PricingPhase> pricingPhaseList2 = subscriptionOfferDetails4.getPricingPhases().getPricingPhaseList();
                        List<ProductDetails.PricingPhase> list2 = pricingPhaseList2;
                        Iterator<T> it3 = list2.iterator();
                        while (true) {
                            if (!it3.hasNext()) {
                                next = null;
                                break;
                            }
                            next = it3.next();
                            if (((ProductDetails.PricingPhase) next).getPriceAmountMicros() == 0) {
                                break;
                            }
                        }
                        ProductDetails.PricingPhase pricingPhase3 = (ProductDetails.PricingPhase) next;
                        Iterator<T> it4 = list2.iterator();
                        while (true) {
                            if (!it4.hasNext()) {
                                next2 = null;
                                break;
                            }
                            next2 = it4.next();
                            if (((ProductDetails.PricingPhase) next2).getPriceAmountMicros() > 0) {
                                break;
                            }
                        }
                        ProductDetails.PricingPhase pricingPhase4 = (ProductDetails.PricingPhase) next2;
                        g gVar2 = (pricingPhase4 == null && (pricingPhase4 = (ProductDetails.PricingPhase) b70.g.i1(pricingPhaseList2)) == null) ? null : new g(pricingPhase4.getFormattedPrice(), i0.c(pricingPhase4.getBillingPeriod()), pricingPhase3 != null ? i0.c(pricingPhase3.getBillingPeriod()) : null, pricingPhase3 != null ? i0.b(pricingPhase3.getBillingPeriod()) : 0, pricingPhase3 != null, k0.f48502c, subscriptionOfferDetails4.getOfferToken(), pricingPhase4.getPriceAmountMicros(), B(pricingPhase4.getBillingPeriod()));
                        if (gVar2 != null) {
                            arrayList.add(gVar2);
                        }
                    }
                    emptyList = arrayList;
                }
            }
            if (emptyList == null) {
                emptyList = EmptyList.f71733a;
            }
        } else {
            emptyList = EmptyList.f71733a;
        }
        return new e(gVar, emptyList);
    }

    public static String s() {
        zy.c cVar = zy.c.f98823a;
        String strH = zy.c.h("subscription_sku_plus");
        return strH.length() == 0 ? "ai_pro" : strH;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:40:0x009a A[Catch: Exception -> 0x009d, TryCatch #0 {Exception -> 0x009d, blocks: (B:38:0x0096, B:40:0x009a, B:43:0x00a0, B:34:0x0084), top: B:143:0x0084 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00ba A[Catch: Exception -> 0x003c, TRY_ENTER, TRY_LEAVE, TryCatch #1 {Exception -> 0x003c, blocks: (B:14:0x0037, B:47:0x00b0, B:50:0x00ba, B:60:0x00ec, B:62:0x00f6, B:64:0x00fc, B:65:0x0102, B:67:0x0108, B:71:0x0117, B:74:0x011d, B:79:0x0134, B:81:0x013e, B:76:0x0125), top: B:145:0x0037 }] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00ec A[Catch: Exception -> 0x003c, TRY_ENTER, TryCatch #1 {Exception -> 0x003c, blocks: (B:14:0x0037, B:47:0x00b0, B:50:0x00ba, B:60:0x00ec, B:62:0x00f6, B:64:0x00fc, B:65:0x0102, B:67:0x0108, B:71:0x0117, B:74:0x011d, B:79:0x0134, B:81:0x013e, B:76:0x0125), top: B:145:0x0037 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v17 */
    /* JADX WARN: Type inference failed for: r2v4, types: [java.util.Map] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object t(ContinuationImpl continuationImpl) {
        s sVar;
        Context context;
        BillingClient billingClient;
        Context context2;
        Object obj;
        Object objD;
        ?? r22;
        g gVar;
        f fVar;
        String str;
        ProductDetails productDetails;
        String str2;
        List<String> products;
        List<String> products2;
        Object next;
        if (continuationImpl instanceof s) {
            sVar = (s) continuationImpl;
            int i5 = sVar.f48531w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sVar.f48531w = i5 - Integer.MIN_VALUE;
            } else {
                sVar = new s(continuationImpl);
            }
        }
        Object obj2 = sVar.f48530v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sVar.f48531w;
        d0 d0Var = f48442a;
        String str3 = null;
        str3 = null;
        String str4 = null;
        str3 = null;
        if (i11 == 0) {
            ResultKt.b(obj2);
            Context context3 = mx.g0.f77088a;
            Context contextE = mx.g0.e();
            sVar.f48528t = contextE;
            sVar.f48531w = 1;
            Object objC = d0Var.c(sVar);
            if (objC != coroutineSingletons) {
                context = contextE;
                obj2 = objC;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            context = sVar.f48528t;
            ResultKt.b(obj2);
        } else {
            if (i11 == 2) {
                BillingClient billingClient2 = (BillingClient) sVar.f48529u;
                Context context4 = sVar.f48528t;
                try {
                    ResultKt.b(obj2);
                    billingClient = billingClient2;
                    context = context4;
                    obj = (Map) obj2;
                    if (obj == null) {
                        obj = b70.h.f17594a;
                    }
                    sVar.f48528t = context;
                    sVar.f48529u = obj;
                    sVar.f48531w = 3;
                    objD = d0Var.D(billingClient, true, sVar);
                    if (objD != coroutineSingletons) {
                        r22 = obj;
                        obj2 = objD;
                        context2 = context;
                        fVar = (f) obj2;
                        if (fVar.b() == 0) {
                        }
                    }
                    return coroutineSingletons;
                } catch (Exception e3) {
                    e = e3;
                    gVar = null;
                    context2 = context4;
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("NovaBilling");
                    bVar.f(e, "Error getting subscription manage info", new Object[0]);
                    return o(context2, str3, gVar);
                }
            }
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Map map = (Map) sVar.f48529u;
            context2 = sVar.f48528t;
            try {
                ResultKt.b(obj2);
                r22 = map;
                fVar = (f) obj2;
                try {
                    if (fVar.b() == 0) {
                        ProductDetails productDetails2 = (ProductDetails) r22.get(u());
                        g gVarF = f(productDetails2, null);
                        if (productDetails2 != null) {
                            String title = productDetails2.getTitle();
                            String string = r70.k.u1(r70.k.p1(title, " (", title)).toString();
                            str4 = string.length() == 0 ? title : string;
                        }
                        return o(context2, str4, gVarF);
                    }
                    Purchase purchaseQ = q(fVar.a());
                    if (purchaseQ == null || (products2 = purchaseQ.getProducts()) == null) {
                        str = null;
                    } else {
                        Iterator it = products2.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                next = null;
                                break;
                            }
                            next = it.next();
                            if (r22.containsKey((String) next)) {
                                break;
                            }
                        }
                        str = (String) next;
                    }
                    if (str == null || (productDetails = (ProductDetails) r22.get(str)) == null) {
                        productDetails = (ProductDetails) r22.get(u());
                    }
                    g gVarF2 = f(productDetails, (purchaseQ == null || str == null) ? null : H(context2, purchaseQ.getPurchaseToken(), str));
                    if (productDetails != null) {
                        String title2 = productDetails.getTitle();
                        String string2 = r70.k.u1(r70.k.p1(title2, " (", title2)).toString();
                        if (string2.length() != 0) {
                            title2 = string2;
                        }
                        str2 = title2;
                    } else {
                        str2 = null;
                    }
                    try {
                        i iVar = purchaseQ == null ? i.f48492d : purchaseQ.getPurchaseState() == 2 ? i.f48491c : (purchaseQ.getPurchaseState() == 1 && purchaseQ.isAutoRenewing()) ? i.f48489a : purchaseQ.getPurchaseState() == 1 ? i.f48490b : i.f48493e;
                        if (iVar == i.f48492d && w(context2)) {
                            mc0.b bVar2 = mc0.d.f76206a;
                            bVar2.r("NovaBilling");
                            bVar2.n("Query returned no purchases but cache says active — trusting cache", new Object[0]);
                            iVar = i.f48489a;
                        }
                        return new h(iVar, (purchaseQ == null || (products = purchaseQ.getProducts()) == null) ? null : (String) b70.g.Y0(products), str2, gVarF2 != null ? gVarF2.c() : null, gVarF2 != null ? gVarF2.b() : null, gVarF2 != null ? gVarF2.e() : null, gVarF2 != null ? gVarF2.d() : 0, gVarF2 != null && gVarF2.a(), purchaseQ != null ? Boolean.valueOf(purchaseQ.isAutoRenewing()) : null, purchaseQ != null ? new Long(purchaseQ.getPurchaseTime()) : null);
                    } catch (Exception e11) {
                        e = e11;
                        str3 = str2;
                        gVar = gVarF2;
                        mc0.b bVar3 = mc0.d.f76206a;
                        bVar3.r("NovaBilling");
                        bVar3.f(e, "Error getting subscription manage info", new Object[0]);
                        return o(context2, str3, gVar);
                    }
                } catch (Exception e12) {
                    e = e12;
                    gVar = r22;
                }
            } catch (Exception e13) {
                e = e13;
                gVar = null;
                mc0.b bVar32 = mc0.d.f76206a;
                bVar32.r("NovaBilling");
                bVar32.f(e, "Error getting subscription manage info", new Object[0]);
                return o(context2, str3, gVar);
            }
        }
        BillingClient billingClient3 = (BillingClient) obj2;
        if (billingClient3 == null) {
            return o(context, null, null);
        }
        try {
            sVar.f48528t = context;
            sVar.f48529u = billingClient3;
            sVar.f48531w = 2;
            Object objP = d0Var.p(sVar);
            if (objP == coroutineSingletons) {
                return coroutineSingletons;
            }
            billingClient = billingClient3;
            obj2 = objP;
            obj = (Map) obj2;
            if (obj == null) {
            }
            sVar.f48528t = context;
            sVar.f48529u = obj;
            sVar.f48531w = 3;
            objD = d0Var.D(billingClient, true, sVar);
            if (objD != coroutineSingletons) {
            }
            return coroutineSingletons;
        } catch (Exception e14) {
            e = e14;
            context2 = context;
            gVar = null;
            mc0.b bVar322 = mc0.d.f76206a;
            bVar322.r("NovaBilling");
            bVar322.f(e, "Error getting subscription manage info", new Object[0]);
            return o(context2, str3, gVar);
        }
    }

    public static String u() {
        zy.c cVar = zy.c.f98823a;
        String strH = zy.c.h("subscription_sku");
        return strH.length() == 0 ? "nova_prime_subscription" : strH;
    }

    public static final boolean w(Context context) {
        if (context.getSharedPreferences("nova_billing", 0).getBoolean("subscription_active", false)) {
            return !y(r2);
        }
        return false;
    }

    public static final boolean x(Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences("nova_billing", 0);
        if (sharedPreferences.getBoolean("subscription_active", false) && !y(sharedPreferences)) {
            return sharedPreferences.getBoolean("plus_active", false);
        }
        return false;
    }

    public static boolean y(SharedPreferences sharedPreferences) {
        return System.currentTimeMillis() - sharedPreferences.getLong("last_verified", 0L) > 172800000;
    }

    public static final long z(Context context) {
        long j11 = context.getSharedPreferences("nova_billing", 0).getLong("last_verified", 0L);
        if (j11 <= 0) {
            return -1L;
        }
        return (System.currentTimeMillis() - j11) / 3600000;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object D(BillingClient billingClient, boolean z11, ContinuationImpl continuationImpl) {
        x xVar;
        if (continuationImpl instanceof x) {
            xVar = (x) continuationImpl;
            int i5 = xVar.f48548v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xVar.f48548v = i5 - Integer.MIN_VALUE;
            } else {
                xVar = new x(this, continuationImpl);
            }
        }
        Object objQueryPurchasesAsync = xVar.f48546t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xVar.f48548v;
        if (i11 == 0) {
            ResultKt.b(objQueryPurchasesAsync);
            if (!O(billingClient, BillingClient.FeatureType.SUBSCRIPTIONS)) {
                return new f(-2, EmptyList.f71733a);
            }
            QueryPurchasesParams.Builder productType = QueryPurchasesParams.newBuilder().setProductType("subs");
            if (z11 && O(billingClient, BillingClient.FeatureType.INCLUDE_SUSPENDED_SUBSCRIPTIONS)) {
                productType.includeSuspendedSubscriptions(true);
            }
            QueryPurchasesParams queryPurchasesParamsBuild = productType.build();
            xVar.f48548v = 1;
            objQueryPurchasesAsync = BillingClientKotlinKt.queryPurchasesAsync(billingClient, queryPurchasesParamsBuild, xVar);
            if (objQueryPurchasesAsync == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objQueryPurchasesAsync);
        }
        PurchasesResult purchasesResult = (PurchasesResult) objQueryPurchasesAsync;
        return new f(purchasesResult.getBillingResult().getResponseCode(), purchasesResult.getPurchasesList());
    }

    /* JADX WARN: Can't wrap try/catch for region: R(10:0|2|(2:4|(1:6)(1:7))(0)|8|(1:(4:(1:(1:(5:14|71|15|64|65)(2:19|20))(7:21|78|22|23|70|53|(2:55|56)(3:60|(3:63|64|65)|62)))(7:27|76|28|29|73|42|(2:44|45)(3:49|(4:52|70|53|(0)(0))|62))|26|68|69)(1:32))(3:33|(1:36)|62)|37|74|38|(4:41|73|42|(0)(0))|62) */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0104, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0105, code lost:
    
        r2 = r12;
        r12 = r0;
        r1 = r3;
     */
    /* JADX WARN: Removed duplicated region for block: B:44:0x009a A[Catch: Exception -> 0x00a7, TryCatch #2 {Exception -> 0x00a7, blocks: (B:42:0x0096, B:44:0x009a, B:49:0x00a9), top: B:73:0x0096 }] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00a9 A[Catch: Exception -> 0x00a7, TRY_LEAVE, TryCatch #2 {Exception -> 0x00a7, blocks: (B:42:0x0096, B:44:0x009a, B:49:0x00a9), top: B:73:0x0096 }] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00c4 A[Catch: Exception -> 0x00de, TryCatch #0 {Exception -> 0x00de, blocks: (B:53:0x00bc, B:55:0x00c4, B:60:0x00e0), top: B:70:0x00bc }] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00e0 A[Catch: Exception -> 0x00de, TRY_LEAVE, TryCatch #0 {Exception -> 0x00de, blocks: (B:53:0x00bc, B:55:0x00c4, B:60:0x00e0), top: B:70:0x00bc }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object P(ContinuationImpl continuationImpl) {
        c0 c0Var;
        d0 d0Var;
        Context context;
        Exception e3;
        d0 d0Var2;
        Context context2;
        BillingClient billingClient;
        BillingClient billingClient2;
        Context context3;
        f fVar;
        boolean zV;
        d0 d0Var3;
        if (continuationImpl instanceof c0) {
            c0Var = (c0) continuationImpl;
            int i5 = c0Var.f48439z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0Var.f48439z = i5 - Integer.MIN_VALUE;
            } else {
                c0Var = new c0(this, continuationImpl);
            }
        }
        Object obj = c0Var.f48437x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c0Var.f48439z;
        if (i11 == 0) {
            ResultKt.b(obj);
            zy.c cVar = zy.c.f98823a;
            c0Var.f48433t = this;
            c0Var.f48439z = 1;
            if (cVar.a(c0Var) != coroutineSingletons) {
                d0Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                Context context4 = c0Var.f48434u;
                d0Var3 = c0Var.f48433t;
                try {
                    ResultKt.b(obj);
                    context2 = context4;
                    d0Var = d0Var3;
                    try {
                        billingClient = (BillingClient) obj;
                        if (billingClient != null) {
                            d0Var.getClass();
                            F(context2, "no_client");
                            return null;
                        }
                        c0Var.f48433t = d0Var;
                        c0Var.f48434u = context2;
                        c0Var.f48435v = billingClient;
                        c0Var.f48439z = 3;
                        Object objD = d0Var.D(billingClient, false, c0Var);
                        if (objD != coroutineSingletons) {
                            Context context5 = context2;
                            billingClient2 = billingClient;
                            obj = objD;
                            context3 = context5;
                            fVar = (f) obj;
                            if (fVar.b() == 0) {
                            }
                        }
                        return coroutineSingletons;
                    } catch (Exception e11) {
                        e3 = e11;
                        d0Var2 = d0Var;
                        context = context2;
                    }
                } catch (Exception e12) {
                    e3 = e12;
                    context = context4;
                }
            } else if (i11 == 3) {
                BillingClient billingClient3 = c0Var.f48435v;
                context3 = c0Var.f48434u;
                d0Var3 = c0Var.f48433t;
                try {
                    ResultKt.b(obj);
                    billingClient2 = billingClient3;
                    d0Var = d0Var3;
                    try {
                        fVar = (f) obj;
                        if (fVar.b() == 0) {
                            String str = "query_failed_" + fVar.b();
                            d0Var.getClass();
                            F(context3, str);
                            return null;
                        }
                        zV = d0Var.v(fVar.a(), false);
                        List listA = fVar.a();
                        c0Var.f48433t = d0Var;
                        c0Var.f48434u = context3;
                        c0Var.f48435v = null;
                        c0Var.f48436w = zV;
                        c0Var.f48439z = 4;
                        if (d0Var.m(billingClient2, listA, c0Var) != coroutineSingletons) {
                            d0Var2 = d0Var;
                            context = context3;
                            return Boolean.valueOf(zV);
                        }
                        return coroutineSingletons;
                    } catch (Exception e13) {
                        e3 = e13;
                        d0Var2 = d0Var;
                        context = context3;
                    }
                } catch (Exception e14) {
                    e3 = e14;
                    context = context3;
                }
            } else {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                zV = c0Var.f48436w;
                context = c0Var.f48434u;
                d0Var2 = c0Var.f48433t;
                try {
                    ResultKt.b(obj);
                    return Boolean.valueOf(zV);
                } catch (Exception e15) {
                    e3 = e15;
                }
            }
            d0Var2 = d0Var3;
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NovaBilling");
            bVar.f(e3, "Error verifying subscription", new Object[0]);
            d0Var2.getClass();
            F(context, "query_exception");
            return null;
        }
        d0Var = c0Var.f48433t;
        ResultKt.b(obj);
        Context context6 = mx.g0.f77088a;
        Context contextE = mx.g0.e();
        c0Var.f48433t = d0Var;
        c0Var.f48434u = contextE;
        c0Var.f48439z = 2;
        Object objC = d0Var.c(c0Var);
        if (objC != coroutineSingletons) {
            context2 = contextE;
            obj = objC;
            billingClient = (BillingClient) obj;
            if (billingClient != null) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) {
        k kVar;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f48501v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f48501v = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuationImpl);
            }
        }
        Object obj = kVar.f48499t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = kVar.f48501v;
        if (i11 == 0) {
            ResultKt.b(obj);
            BillingClient billingClient = (BillingClient) f48444c.getValue();
            if (billingClient != null) {
                return billingClient;
            }
            if (f48445d == null) {
                Context context = mx.g0.f77088a;
                Context contextE = mx.g0.e();
                kVar.f48501v = 1;
                if (j(contextE, kVar) != obj2) {
                }
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        r0 r0Var = new r0(4);
        kVar.f48501v = 2;
        Object objD = p2.d(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, r0Var, kVar);
        return objD == obj2 ? obj2 : objD;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(Context context, String str, String str2, String str3, String str4, ContinuationImpl continuationImpl) {
        m mVar;
        c cVar;
        d0 d0Var;
        Context context2;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i5 = mVar.f48511y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f48511y = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m(this, continuationImpl);
            }
        }
        Object objI = mVar.f48509w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f48511y;
        int i12 = 12;
        boolean z11 = true;
        boolean z12 = false;
        if (i11 == 0) {
            ResultKt.b(objI);
            SharedPreferences sharedPreferences = context.getSharedPreferences("nova_billing", 0);
            String str5 = null;
            if (!((Intrinsics.b(sharedPreferences.getString("backend_verified_token", null), str) && Intrinsics.b(sharedPreferences.getString("backend_verified_product_id", null), str2)) ? str3 == null ? true : Intrinsics.b(sharedPreferences.getString("backend_verified_base_plan_id", null), str3) : false)) {
                return new b(30, str5, z12);
            }
            if (!ps.k.r()) {
                i(context, false);
                return new b(i12, "no_session", z11);
            }
            SharedPreferences sharedPreferences2 = context.getSharedPreferences("nova_billing", 0);
            String string = sharedPreferences2.getString("backend_verified_person_id", null);
            if (string == null || r70.k.U0(string)) {
                string = null;
            }
            String string2 = sharedPreferences2.getString("backend_verified_google_identity", null);
            if (string2 != null && !r70.k.U0(string2)) {
                str5 = string2;
            }
            cVar = new c(string, str5);
            String strB = cVar.b();
            if (!(strB == null || r70.k.U0(strB))) {
                String strA = cVar.a();
                if (!(strA == null || r70.k.U0(strA))) {
                    String strL = l();
                    if (!Intrinsics.b(strL, cVar.a())) {
                        i(context, false);
                        return new b(i12, strL == null ? "google_identity_missing" : "google_identity_mismatch", z11);
                    }
                    i2 i2Var = q0.f89956a;
                    String strE = b.c0.E(str4, "_cache_refresh");
                    mVar.f48506t = this;
                    mVar.f48507u = context;
                    mVar.f48508v = cVar;
                    mVar.f48511y = 1;
                    objI = q0.i(context, strE, mVar);
                    if (objI == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    d0Var = this;
                    context2 = context;
                }
            }
            i(context, false);
            return new b(i12, "identity_metadata_missing", z11);
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        c cVar2 = mVar.f48508v;
        Context context3 = mVar.f48507u;
        d0Var = mVar.f48506t;
        ResultKt.b(objI);
        cVar = cVar2;
        context2 = context3;
        p0 p0Var = (p0) objI;
        if (p0Var == null) {
            d0Var.getClass();
            i(context2, false);
            return new b(i12, "backend_refresh_failed", z11);
        }
        if (!p0Var.b()) {
            d0Var.getClass();
            i(context2, false);
            return new b(true, false, p0Var.c(), p0Var.d(), "backend_missing");
        }
        d0Var.getClass();
        c cVarK = k();
        if (Intrinsics.b(cVarK.b(), cVar.b())) {
            q0.e(context2, false);
            return new b(true, true, p0Var.c(), p0Var.d(), "backend_confirmed");
        }
        i(context2, false);
        return new b(true, false, p0Var.c(), p0Var.d(), cVarK.b() == null ? "person_id_missing" : "person_id_mismatch");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(Context context, ContinuationImpl continuationImpl) throws Throwable {
        n nVar;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f48516v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f48516v = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        Object objY = nVar.f48514t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f48516v;
        try {
            if (i11 == 0) {
                ResultKt.b(objY);
                if (f48445d != null) {
                    return Unit.f71706a;
                }
                if (!(zy.c.d("enable_subscription_billing", true) ? true : context.getApplicationContext().getSharedPreferences("nova_billing", 0).getBoolean("subscription_active", false))) {
                    return Unit.f71706a;
                }
                a80.e eVar = y0.f88884a;
                a80.d dVar = a80.d.f488c;
                o oVar = new o(context, null);
                nVar.f48516v = 1;
                objY = t70.m0.y(dVar, oVar, nVar);
                if (objY == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objY);
            }
            BillingClient billingClient = (BillingClient) objY;
            f48445d = billingClient;
            billingClient.startConnection(f48455p);
        } catch (Exception e3) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NovaBilling");
            bVar.f(e3, "Error creating billing client", new Object[0]);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:91:0x010c, code lost:
    
        continue;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m(BillingClient billingClient, List list, ContinuationImpl continuationImpl) {
        p pVar;
        if (continuationImpl instanceof p) {
            pVar = (p) continuationImpl;
            int i5 = pVar.f48521w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pVar.f48521w = i5 - Integer.MIN_VALUE;
            } else {
                pVar = new p(this, continuationImpl);
            }
        }
        Object objD = pVar.f48519u;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = pVar.f48521w;
        i2 i2Var = f48448g;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(objD);
            if (!O(billingClient, BillingClient.FeatureType.INCLUDE_SUSPENDED_SUBSCRIPTIONS)) {
                Boolean bool = Boolean.FALSE;
                i2Var.getClass();
                i2Var.k(null, bool);
                return Unit.f71706a;
            }
            pVar.f48518t = list;
            pVar.f48521w = 1;
            objD = D(billingClient, true, pVar);
            if (objD == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            list = pVar.f48518t;
            ResultKt.b(objD);
        }
        f fVar = (f) objD;
        if (fVar.b() != 0) {
            return Unit.f71706a;
        }
        SetBuilder setBuilder = new SetBuilder();
        setBuilder.add(u());
        String strS = s();
        if (strS.length() > 0) {
            setBuilder.add(strS);
        }
        SetBuilder setBuilderL = ab.e0.l(setBuilder);
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : list) {
            List<String> products = ((Purchase) obj2).getProducts();
            if (!(products instanceof Collection) || !products.isEmpty()) {
                Iterator<T> it = products.iterator();
                while (true) {
                    if (it.hasNext()) {
                        if (setBuilderL.f71786a.containsKey((String) it.next())) {
                            arrayList.add(obj2);
                            break;
                        }
                    }
                }
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            arrayList2.add(((Purchase) it2.next()).getPurchaseToken());
        }
        Set setN1 = b70.g.N1(arrayList2);
        List<Purchase> listA = fVar.a();
        if ((listA instanceof Collection) && listA.isEmpty()) {
            z11 = false;
        } else {
            for (Purchase purchase : listA) {
                List<String> products2 = purchase.getProducts();
                if (!(products2 instanceof Collection) || !products2.isEmpty()) {
                    Iterator<T> it3 = products2.iterator();
                    while (true) {
                        if (it3.hasNext()) {
                            if (setBuilderL.f71786a.containsKey((String) it3.next())) {
                                if (!setN1.contains(purchase.getPurchaseToken()) && purchase.getPurchaseState() == 1) {
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            z11 = false;
        }
        c1.B(z11, i2Var, null);
        if (z11) {
            zy.c.i("subscription_payment_recovery_needed", null);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0104 A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r9v2, types: [java.lang.Object, java.util.Map] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object p(ContinuationImpl continuationImpl) {
        q qVar;
        d0 d0Var;
        d0 d0Var2;
        ProductDetailsResult productDetailsResult;
        Map linkedHashMap;
        if (continuationImpl instanceof q) {
            qVar = (q) continuationImpl;
            int i5 = qVar.f48525w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qVar.f48525w = i5 - Integer.MIN_VALUE;
            } else {
                qVar = new q(this, continuationImpl);
            }
        }
        Object objC = qVar.f48523u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qVar.f48525w;
        if (i11 == 0) {
            ResultKt.b(objC);
            if (!f48447f.isEmpty()) {
                return f48447f;
            }
            qVar.f48522t = this;
            qVar.f48525w = 1;
            objC = c(qVar);
            if (objC != coroutineSingletons) {
                d0Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d0Var2 = qVar.f48522t;
            ResultKt.b(objC);
            productDetailsResult = (ProductDetailsResult) objC;
            if (productDetailsResult.getBillingResult().getResponseCode() == 0) {
                return null;
            }
            List<ProductDetails> productDetailsList = productDetailsResult.getProductDetailsList();
            if (productDetailsList != null) {
                List<ProductDetails> list = productDetailsList;
                int iD0 = b70.k.d0(b70.c.u0(list, 10));
                if (iD0 < 16) {
                    iD0 = 16;
                }
                linkedHashMap = new LinkedHashMap(iD0);
                for (Object obj : list) {
                    linkedHashMap.put(((ProductDetails) obj).getProductId(), obj);
                }
            } else {
                linkedHashMap = b70.h.f17594a;
            }
            f48447f = linkedHashMap;
            d0Var2.getClass();
            return linkedHashMap;
        }
        d0Var = qVar.f48522t;
        ResultKt.b(objC);
        BillingClient billingClient = (BillingClient) objC;
        if (billingClient == null) {
            return null;
        }
        QueryProductDetailsParams.Product.Builder builderNewBuilder = QueryProductDetailsParams.Product.newBuilder();
        d0Var.getClass();
        ArrayList arrayListT = ul.b.T(builderNewBuilder.setProductId(u()).setProductType("subs").build());
        String strS = s();
        if (strS.length() > 0) {
            arrayListT.add(QueryProductDetailsParams.Product.newBuilder().setProductId(strS).setProductType("subs").build());
        }
        QueryProductDetailsParams queryProductDetailsParamsBuild = QueryProductDetailsParams.newBuilder().setProductList(arrayListT).build();
        qVar.f48522t = d0Var;
        qVar.f48525w = 2;
        objC = BillingClientKotlinKt.queryProductDetails(billingClient, queryProductDetailsParamsBuild, qVar);
        if (objC != coroutineSingletons) {
            d0Var2 = d0Var;
            productDetailsResult = (ProductDetailsResult) objC;
            if (productDetailsResult.getBillingResult().getResponseCode() == 0) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:65:0x0194  */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v21 */
    /* JADX WARN: Type inference failed for: r3v3, types: [java.lang.String, java.util.Map, kotlin.coroutines.Continuation, kotlin.coroutines.CoroutineContext, t70.l0] */
    /* JADX WARN: Type inference failed for: r4v9, types: [java.lang.Object, java.util.Map] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean v(List list, boolean z11) {
        String strS;
        Pair pair;
        Object next;
        Object next2;
        boolean z12;
        boolean z13;
        int i5;
        SetBuilder setBuilder;
        boolean z14;
        Object obj;
        String str;
        Purchase purchase;
        Purchase purchase2;
        boolean z15;
        Iterator it;
        Object obj2;
        SetBuilder setBuilder2 = new SetBuilder();
        setBuilder2.add(u());
        String strS2 = s();
        if (strS2.length() > 0) {
            setBuilder2.add(strS2);
        }
        SetBuilder setBuilderL = ab.e0.l(setBuilder2);
        Context context = mx.g0.f77088a;
        Context contextE = mx.g0.e();
        boolean z16 = contextE.getSharedPreferences("nova_billing", 0).getBoolean("subscription_active", false);
        Iterator it2 = list.iterator();
        Object obj3 = 0;
        String purchaseToken = null;
        Purchase purchase3 = null;
        boolean z17 = false;
        boolean z18 = false;
        long purchaseTime = 0;
        while (it2.hasNext()) {
            Purchase purchase4 = (Purchase) it2.next();
            Iterator<T> it3 = purchase4.getProducts().iterator();
            while (true) {
                if (!it3.hasNext()) {
                    next2 = obj3;
                    break;
                }
                next2 = it3.next();
                if (setBuilderL.f71786a.containsKey((String) next2)) {
                    break;
                }
            }
            String str2 = (String) next2;
            if (str2 == null) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("NovaBilling");
                bVar.n("Purchase products %s did not match any known SKUs %s — skipping", purchase4.getProducts(), setBuilderL);
            } else {
                int purchaseState = purchase4.getPurchaseState();
                if (purchaseState != 0) {
                    if (purchaseState == 1) {
                        if (str2.equals(u())) {
                            z13 = z18;
                            z12 = true;
                        } else {
                            z12 = z17;
                            z13 = str2.equals(s()) ? true : z18;
                        }
                        if (purchase4.isAcknowledged()) {
                            i5 = 3;
                        } else {
                            i5 = 3;
                            t70.m0.t(f48443b, obj3, obj3, new j(purchase4, obj3), 3);
                        }
                        if (L(str2)) {
                            q0.e(contextE, true);
                            String str3 = z11 ? "purchase_flow" : "query_flow";
                            if (!ps.k.r()) {
                                setBuilder = setBuilderL;
                                z14 = z16;
                                obj = obj3;
                                str = purchaseToken;
                                purchase = purchase3;
                                z15 = z12;
                                it = it2;
                                purchase2 = purchase4;
                                tx.r.i("ai_verify_skipped_no_session", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str3), new Pair("product_id", str2), new Pair("token_hash", tx.r.m(purchase2.getPurchaseToken()))));
                            } else if (L(str2)) {
                                Purchase purchase5 = purchase3;
                                String str4 = str3;
                                String purchaseToken2 = purchase4.getPurchaseToken();
                                String str5 = purchaseToken;
                                String strH = H(contextE, purchaseToken2, str2);
                                purchase2 = purchase4;
                                String strM = tx.r.m(purchaseToken2);
                                LinkedHashSet linkedHashSet = f48454m;
                                synchronized (linkedHashSet) {
                                    if (linkedHashSet.add(purchaseToken2)) {
                                        Unit unit = Unit.f71706a;
                                        it = it2;
                                        z15 = z12;
                                        z14 = z16;
                                        purchase = purchase5;
                                        setBuilder = setBuilderL;
                                        str = str5;
                                        obj = null;
                                        t70.m0.t(f48443b, null, null, new y(contextE, purchaseToken2, str2, strH, str4, strM, purchase2, null), i5);
                                    } else {
                                        setBuilder = setBuilderL;
                                        z14 = z16;
                                        purchase = purchase5;
                                        z15 = z12;
                                        it = it2;
                                        str = str5;
                                        obj = null;
                                    }
                                }
                            } else {
                                setBuilder = setBuilderL;
                                z14 = z16;
                                obj = obj3;
                                str = purchaseToken;
                                purchase = purchase3;
                                purchase2 = purchase4;
                                z15 = z12;
                                it = it2;
                            }
                            if (purchase2.getPurchaseTime() >= purchaseTime) {
                                purchaseTime = purchase2.getPurchaseTime();
                                purchaseToken = purchase2.getPurchaseToken();
                                z17 = z15;
                                purchase3 = purchase2;
                            } else {
                                z17 = z15;
                                purchaseToken = str;
                                purchase3 = purchase;
                            }
                            obj2 = obj;
                            z18 = z13;
                        }
                    } else if (purchaseState == 2) {
                        String str6 = str2.equals(u()) ? "prime" : "plus";
                        zy.c cVar = zy.c.f98823a;
                        zy.c.i("subscription_pending", N(this, str6, obj3, 2));
                    }
                }
                setBuilderL = setBuilder;
                z16 = z14;
                it2 = it;
                obj3 = obj2;
            }
            setBuilder = setBuilderL;
            z14 = z16;
            it = it2;
            purchaseToken = purchaseToken;
            purchase3 = purchase3;
            obj2 = obj3;
            setBuilderL = setBuilder;
            z16 = z14;
            it2 = it;
            obj3 = obj2;
        }
        boolean z19 = z16;
        String str7 = purchaseToken;
        Purchase purchase6 = purchase3;
        boolean z21 = z17 || z18;
        p0 p0VarA = q0.a();
        boolean z22 = p0VarA.e() > 0 && System.currentTimeMillis() - p0VarA.e() < 3600000 && p0VarA.d() != null && !Intrinsics.b(p0VarA.d(), "active");
        if (!z21 && z19 && !z22) {
            contextE.getSharedPreferences("nova_billing", 0).edit().putLong("last_verified", System.currentTimeMillis()).apply();
            String str8 = q0.b(contextE) ? "backend_plus_active" : "no_backend_revocation";
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("NovaBilling");
            bVar2.b("Play Billing returned empty, preserving local state (reason=%s)", str8);
            zy.c cVar2 = zy.c.f98823a;
            c1.A("reason", str8, "subscription_query_empty_kept_local");
            return z21;
        }
        SharedPreferences sharedPreferences = contextE.getSharedPreferences("nova_billing", 0);
        boolean z23 = sharedPreferences.getBoolean("plus_active", false);
        c9.q(sharedPreferences, "plus_active", z18);
        if (z18 && !z23) {
            ps.j.m(contextE);
            mc0.b bVar3 = mc0.d.f76206a;
            bVar3.r("NovaBilling");
            bVar3.b("Plus granted — restored Nova Now AI left-swipe", new Object[0]);
        }
        C(contextE);
        if (!z18) {
            q0.e(contextE, false);
        }
        if (z21) {
            K(contextE, str7, true);
            if (!z19 || z11) {
                String str9 = z18 ? "plus" : z17 ? "prime" : "unknown";
                zy.c cVar3 = zy.c.f98823a;
                zy.c.i("subscription_purchased", N(this, str9, obj3, 2));
                yx.h hVar = yx.h.f97704a;
                yx.h.g("subscription_purchased", N(this, str9, obj3, 2));
                if (M(str9)) {
                    zy.c.i("trial_started", N(this, str9, obj3, 2));
                    yx.h.g("trial_started", N(this, str9, obj3, 2));
                    return z21;
                }
                if (z11) {
                    if (str9.equals("prime")) {
                        strS = u();
                    } else {
                        pair = obj3;
                        if (str9.equals("plus")) {
                            strS = s();
                        }
                        if (pair != null && purchase6 != null) {
                            yx.h hVar2 = yx.h.f97704a;
                            yx.h.i(((Number) pair.f71683a).doubleValue(), purchase6, (String) pair.f71684b);
                            return z21;
                        }
                    }
                    ProductDetails productDetails = (ProductDetails) f48447f.get(strS);
                    pair = obj3;
                    if (productDetails != null) {
                        List<ProductDetails.SubscriptionOfferDetails> subscriptionOfferDetails = productDetails.getSubscriptionOfferDetails();
                        pair = obj3;
                        if (subscriptionOfferDetails != null) {
                            ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails2 = (ProductDetails.SubscriptionOfferDetails) b70.g.Y0(subscriptionOfferDetails);
                            pair = obj3;
                            if (subscriptionOfferDetails2 != null) {
                                ProductDetails.PricingPhases pricingPhases = subscriptionOfferDetails2.getPricingPhases();
                                pair = obj3;
                                if (pricingPhases != null) {
                                    List<ProductDetails.PricingPhase> pricingPhaseList = pricingPhases.getPricingPhaseList();
                                    pair = obj3;
                                    if (pricingPhaseList != null) {
                                        Iterator<T> it4 = pricingPhaseList.iterator();
                                        while (true) {
                                            if (!it4.hasNext()) {
                                                next = obj3;
                                                break;
                                            }
                                            next = it4.next();
                                            if (((ProductDetails.PricingPhase) next).getPriceAmountMicros() > 0) {
                                                break;
                                            }
                                        }
                                        ProductDetails.PricingPhase pricingPhase = (ProductDetails.PricingPhase) next;
                                        pair = obj3;
                                        if (pricingPhase != null) {
                                            pair = new Pair(Double.valueOf(pricingPhase.getPriceAmountMicros() / 1000000.0d), pricingPhase.getPriceCurrencyCode());
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (pair != null) {
                        yx.h hVar22 = yx.h.f97704a;
                        yx.h.i(((Number) pair.f71683a).doubleValue(), purchase6, (String) pair.f71684b);
                        return z21;
                    }
                }
            }
        } else if (z19) {
            h0.a(contextE, "play_query_empty");
            K(contextE, obj3, false);
            zy.c cVar4 = zy.c.f98823a;
            zy.c.i("subscription_expired", N(this, obj3, obj3, 3));
        }
        return z21;
    }
}
