package tx;

import android.content.Context;
import com.amplitude.core.events.Plan;
import com.instabridge.ai.billing.PurchaseVerifier;
import com.instabridge.ai.chat.data.ConversationApiClient;
import com.instabridge.ai.proactive.ProactiveGenerationConfig;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public static final t f90002a = new t();

    /* renamed from: b, reason: collision with root package name */
    public static final fo.a f90003b = new fo.a("nova", "https://ai-api.instabridge.com/", "https://ai.instabridge.com/", null, false, "NOVA_AI", null, true, "Nova AI", true, "Pro", "PRO", new ProactiveGenerationConfig(0, 0, 0, 0, 0, 0, 0, 0, false, false, null, 2047, null), "ai-context", null);

    /* JADX WARN: Removed duplicated region for block: B:7:0x0021  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, String str3, String str4, String str5, boolean z11, ContinuationImpl continuationImpl) throws Exception {
        s sVar;
        Object obj;
        String str6;
        String str7;
        String str8;
        Object obj2;
        String str9;
        String str10;
        boolean z12;
        String str11;
        String str12;
        String str13;
        String str14;
        String str15;
        Object objVerifyGooglePlayPurchase;
        String str16 = str4;
        String str17 = str5;
        r rVar = r.f89970a;
        if (continuationImpl instanceof s) {
            sVar = (s) continuationImpl;
            int i5 = sVar.C;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sVar.C = i5 - Integer.MIN_VALUE;
            } else {
                sVar = new s(this, continuationImpl);
            }
        }
        Object obj3 = sVar.A;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sVar.C;
        if (i11 == 0) {
            ResultKt.b(obj3);
            String strM = r.m(str);
            MapBuilder mapBuilder = new MapBuilder();
            mapBuilder.put(Plan.AMP_PLAN_SOURCE, str17);
            mapBuilder.put("product_id", str2);
            obj = "error";
            str6 = "ai_verify_result";
            mapBuilder.put("has_base_plan", Boolean.valueOf(!(str3 == null || r70.k.U0(str3))));
            mapBuilder.put("package_name", str16);
            mapBuilder.put("token_hash", strM);
            Unit unit = Unit.f71706a;
            r.i("ai_verify_start", mapBuilder.b());
            d1 d1Var = d1.f89690a;
            Context context = mx.g0.f77088a;
            Context contextE = mx.g0.e();
            str7 = str;
            sVar.f89981t = str7;
            sVar.f89982u = str2;
            sVar.f89983v = str3;
            sVar.f89984w = str16;
            sVar.f89985x = str17;
            sVar.f89986y = strM;
            sVar.f89987z = z11;
            sVar.C = 1;
            Object objG = d1Var.g(contextE, sVar);
            if (objG != coroutineSingletons) {
                str8 = strM;
                obj2 = objG;
                str9 = str2;
                str10 = str3;
                z12 = z11;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str15 = sVar.f89983v;
            str13 = sVar.f89982u;
            str14 = sVar.f89981t;
            try {
                ResultKt.b(obj3);
                objVerifyGooglePlayPurchase = obj3;
                obj = "error";
                str6 = "ai_verify_result";
                str11 = "NOVA_AI_BILLING";
                try {
                    PurchaseVerifier.VerifyResult.Confirmed verifyResponse = PurchaseVerifier.INSTANCE.parseVerifyResponse((String) objVerifyGooglePlayPurchase);
                    MapBuilder mapBuilder2 = new MapBuilder();
                    mapBuilder2.put(Plan.AMP_PLAN_SOURCE, str13);
                    mapBuilder2.put("result", "success");
                    mapBuilder2.put("product_id", str14);
                    mapBuilder2.put("plan", verifyResponse.getPlan());
                    mapBuilder2.put("billing_period", verifyResponse.getBillingPeriod());
                    mapBuilder2.put("token_hash", str15);
                    Unit unit2 = Unit.f71706a;
                    MapBuilder mapBuilderB = mapBuilder2.b();
                    zy.c cVar = zy.c.f98823a;
                    str12 = str6;
                } catch (Exception e3) {
                    e = e3;
                    str12 = str6;
                }
                try {
                    zy.c.i(str12, mapBuilderB);
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r(str11);
                    bVar.h("%s %s", str12, b70.g.f1(b70.g.D1(new q(0), mapBuilderB.entrySet()), " ", null, null, 0, new s10.i(22), 30));
                    return verifyResponse;
                } catch (Exception e11) {
                    e = e11;
                    MapBuilder mapBuilder3 = new MapBuilder();
                    mapBuilder3.put(Plan.AMP_PLAN_SOURCE, str13);
                    mapBuilder3.put("result", obj);
                    mapBuilder3.put("product_id", str14);
                    mapBuilder3.put("reason", rVar.d(e));
                    mapBuilder3.put("token_hash", str15);
                    Unit unit3 = Unit.f71706a;
                    r.i(str12, mapBuilder3.b());
                    throw e;
                }
            } catch (Exception e12) {
                e = e12;
                obj = "error";
                str12 = "ai_verify_result";
                MapBuilder mapBuilder32 = new MapBuilder();
                mapBuilder32.put(Plan.AMP_PLAN_SOURCE, str13);
                mapBuilder32.put("result", obj);
                mapBuilder32.put("product_id", str14);
                mapBuilder32.put("reason", rVar.d(e));
                mapBuilder32.put("token_hash", str15);
                Unit unit32 = Unit.f71706a;
                r.i(str12, mapBuilder32.b());
                throw e;
            }
        }
        boolean z13 = sVar.f89987z;
        String str18 = sVar.f89986y;
        String str19 = sVar.f89985x;
        String str20 = sVar.f89984w;
        str10 = sVar.f89983v;
        str9 = sVar.f89982u;
        String str21 = sVar.f89981t;
        ResultKt.b(obj3);
        str17 = str19;
        str16 = str20;
        obj2 = obj3;
        obj = "error";
        str6 = "ai_verify_result";
        str7 = str21;
        str8 = str18;
        z12 = z13;
        y0 y0Var = (y0) obj2;
        boolean z14 = z12;
        if (!(y0Var instanceof w0)) {
            Object obj4 = obj;
            if (!(y0Var instanceof x0)) {
                throw new NoWhenBranchMatchedException();
            }
            MapBuilder mapBuilder4 = new MapBuilder();
            mapBuilder4.put(Plan.AMP_PLAN_SOURCE, str17);
            mapBuilder4.put("result", obj4);
            String str22 = ((x0) y0Var).f90057a;
            mapBuilder4.put("reason", r.k(rVar, str22));
            mapBuilder4.put("token_hash", str8);
            Unit unit4 = Unit.f71706a;
            r.i("ai_verify_auth", mapBuilder4.b());
            throw new IllegalStateException(str22);
        }
        String str23 = ((w0) y0Var).f90042a;
        String str24 = str16;
        MapBuilder mapBuilder5 = new MapBuilder();
        mapBuilder5.put(Plan.AMP_PLAN_SOURCE, str17);
        String str25 = str10;
        mapBuilder5.put("result", "ready");
        d1 d1Var2 = d1.f89690a;
        String str26 = str7;
        mapBuilder5.put("has_person_id", Boolean.valueOf(d1.h() != null));
        mapBuilder5.put("token_hash", str8);
        Unit unit5 = Unit.f71706a;
        MapBuilder mapBuilderB2 = mapBuilder5.b();
        zy.c cVar2 = zy.c.f98823a;
        zy.c.i("ai_verify_auth", mapBuilderB2);
        mc0.b bVar2 = mc0.d.f76206a;
        bVar2.r("NOVA_AI_BILLING");
        str11 = "NOVA_AI_BILLING";
        bVar2.h("%s %s", "ai_verify_auth", b70.g.f1(b70.g.D1(new q(0), mapBuilderB2.entrySet()), " ", null, null, 0, new s10.i(22), 30));
        ConversationApiClient conversationApiClient = new ConversationApiClient(f90003b, new c0.d(str23, null, 2), null, 4, null);
        try {
            sVar.f89981t = str9;
            sVar.f89982u = str17;
            sVar.f89983v = str8;
            sVar.f89984w = null;
            sVar.f89985x = null;
            sVar.f89986y = null;
            sVar.C = 2;
            String str27 = str9;
            try {
                objVerifyGooglePlayPurchase = conversationApiClient.verifyGooglePlayPurchase(str26, str27, str25, str24, z14, sVar);
                if (objVerifyGooglePlayPurchase != coroutineSingletons) {
                    str13 = str17;
                    str14 = str27;
                    str15 = str8;
                    PurchaseVerifier.VerifyResult.Confirmed verifyResponse2 = PurchaseVerifier.INSTANCE.parseVerifyResponse((String) objVerifyGooglePlayPurchase);
                    MapBuilder mapBuilder22 = new MapBuilder();
                    mapBuilder22.put(Plan.AMP_PLAN_SOURCE, str13);
                    mapBuilder22.put("result", "success");
                    mapBuilder22.put("product_id", str14);
                    mapBuilder22.put("plan", verifyResponse2.getPlan());
                    mapBuilder22.put("billing_period", verifyResponse2.getBillingPeriod());
                    mapBuilder22.put("token_hash", str15);
                    Unit unit22 = Unit.f71706a;
                    MapBuilder mapBuilderB3 = mapBuilder22.b();
                    zy.c cVar3 = zy.c.f98823a;
                    str12 = str6;
                    zy.c.i(str12, mapBuilderB3);
                    mc0.b bVar3 = mc0.d.f76206a;
                    bVar3.r(str11);
                    bVar3.h("%s %s", str12, b70.g.f1(b70.g.D1(new q(0), mapBuilderB3.entrySet()), " ", null, null, 0, new s10.i(22), 30));
                    return verifyResponse2;
                }
                return coroutineSingletons;
            } catch (Exception e13) {
                e = e13;
                str9 = str27;
                str12 = str6;
                str13 = str17;
                str14 = str9;
                str15 = str8;
                MapBuilder mapBuilder322 = new MapBuilder();
                mapBuilder322.put(Plan.AMP_PLAN_SOURCE, str13);
                mapBuilder322.put("result", obj);
                mapBuilder322.put("product_id", str14);
                mapBuilder322.put("reason", rVar.d(e));
                mapBuilder322.put("token_hash", str15);
                Unit unit322 = Unit.f71706a;
                r.i(str12, mapBuilder322.b());
                throw e;
            }
        } catch (Exception e14) {
            e = e14;
        }
    }
}
