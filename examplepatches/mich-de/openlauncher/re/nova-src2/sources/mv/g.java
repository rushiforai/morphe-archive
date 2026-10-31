package mv;

import a80.m;
import b70.h;
import b70.k;
import c0.b1;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import com.stripe.android.core.AppInfo;
import com.stripe.android.core.exception.APIException;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.ConsumerPaymentDetailsCreateParams;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import cw.r;
import fl.l;
import fr.h0;
import fr.i;
import ft.d0;
import ft.s0;
import ft.w0;
import ft.x;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import ms.o;
import ms.v;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final r f76836a;

    /* renamed from: b, reason: collision with root package name */
    public final dr.a f76837b;

    /* renamed from: c, reason: collision with root package name */
    public final l f76838c;

    public g(r rVar, String apiVersion) {
        Intrinsics.g(apiVersion, "apiVersion");
        this.f76836a = rVar;
        this.f76837b = new dr.a();
        this.f76838c = new l((AppInfo) null, apiVersion, "AndroidBindings/22.7.0");
    }

    public final Object a(String str, String str2, String str3, Boolean bool, ApiRequest$Options apiRequest$Options, ms.a aVar) {
        w0[] w0VarArr = w0.f56067a;
        String strConcat = "https://api.stripe.com/v1/".concat("consumers/sessions/confirm_verification");
        Map mapJ0 = MapsKt.j0(new Pair("request_surface", str3), new Pair("credentials", m.n("consumer_session_client_secret", str)), new Pair(TTConst.TRACK_TYPE, "SMS"), new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, str2), new Pair("consent_granted", bool));
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : mapJ0.entrySet()) {
            if (entry.getValue() != null) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        return h0.d(this.f76836a, this.f76837b, l.i(this.f76838c, strConcat, apiRequest$Options, linkedHashMap, 8), new gt.f(), aVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, String str2, d0 d0Var, String str3, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl) {
        a aVar;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f76820v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f76820v = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        Object obj = aVar.f76818t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f76820v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        i iVarI = l.i(this.f76838c, "https://api.stripe.com/v1/".concat("consumers/link_account_sessions"), apiRequest$Options, MapsKt.j0(new Pair("credentials", m.n("consumer_session_client_secret", str)), new Pair("intent_token", str2), new Pair("link_mode", d0Var != null ? d0Var.f55934a : null), new Pair("request_surface", str3)), 8);
        gt.e eVar = gt.e.f57792d;
        aVar.f76820v = 1;
        Object objE = h0.e(this.f76836a, this.f76837b, iVarI, eVar, aVar);
        return objE == coroutineSingletons ? coroutineSingletons : objE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(String str, ConsumerPaymentDetailsCreateParams consumerPaymentDetailsCreateParams, String str2, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl) throws APIException {
        b bVar;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f76823v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f76823v = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        Object obj = bVar.f76821t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f76823v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        i iVarI = l.i(this.f76838c, "https://api.stripe.com/v1/".concat("consumers/payment_details"), apiRequest$Options, MapsKt.m0(MapsKt.j0(new Pair("request_surface", str2), new Pair("credentials", m.n("consumer_session_client_secret", str))), consumerPaymentDetailsCreateParams.k0()), 8);
        bVar.f76823v = 1;
        Object objE = h0.e(this.f76836a, this.f76837b, iVarI, gt.d.f57789a, bVar);
        return objE == coroutineSingletons ? coroutineSingletons : objE;
    }

    public final Object d(String str, String str2, String str3, String str4, boolean z11, ApiRequest$Options apiRequest$Options, String str5, SuspendLambda suspendLambda) {
        String lowerCase;
        Map mapE0 = z11 ? k.e0(new Pair("do_not_log_consumer_funnel_event", Boolean.TRUE)) : h.f17594a;
        String strConcat = "https://api.stripe.com/v1/".concat("consumers/sessions/lookup");
        Pair pair = new Pair("request_surface", str3);
        Pair pair2 = new Pair(SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID, str4);
        if (str != null) {
            lowerCase = str.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
        } else {
            lowerCase = null;
        }
        Map mapJ0 = MapsKt.j0(pair, pair2, new Pair("email_address", lowerCase), new Pair("link_auth_intent_id", str2), new Pair("customer_id", str5));
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : mapJ0.entrySet()) {
            if (((String) entry.getValue()) != null) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        return h0.d(this.f76836a, this.f76837b, l.i(this.f76838c, strConcat, apiRequest$Options, MapsKt.m0(linkedHashMap, mapE0), 8), new gt.g(0), suspendLambda);
    }

    public final Object e(String str, x xVar, String str2, String str3, String str4, String str5, List list, ApiRequest$Options apiRequest$Options, String str6, String str7, String str8, o oVar) {
        String lowerCase;
        String str9;
        String strConcat = "https://api.stripe.com/v1/".concat("consumers/mobile/sessions/lookup");
        Pair pair = new Pair("request_surface", str3);
        if (str != null) {
            lowerCase = str.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
            str9 = null;
        } else {
            lowerCase = null;
            str9 = null;
        }
        Pair pair2 = new Pair("email_address", lowerCase);
        String str10 = str9;
        Pair pair3 = new Pair("link_auth_intent_id", str2);
        Pair pair4 = new Pair("android_verification_token", str4);
        Pair pair5 = new Pair(SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID, str6);
        if (xVar != null) {
            str10 = xVar.f56071a;
        }
        Map mapJ0 = MapsKt.j0(pair, pair2, pair3, pair4, pair5, new Pair("email_source", str10), new Pair("app_id", str5), new Pair("customer_id", str7), new Pair("supported_verification_types", list), new Pair("link_auth_token_client_secret", str8));
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : mapJ0.entrySet()) {
            if (entry.getValue() != null) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        return h0.d(this.f76836a, this.f76837b, l.i(this.f76838c, strConcat, apiRequest$Options, linkedHashMap, 8), new gt.g(0), oVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(s0 s0Var, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl) throws APIException {
        c cVar;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f76826v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f76826v = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object obj = cVar.f76824t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f76826v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        i iVarI = l.i(this.f76838c, "https://api.stripe.com/v1/".concat("consumers/mobile/sign_up"), apiRequest$Options, s0Var.a(), 8);
        gt.e eVar = gt.e.f57791c;
        cVar.f76826v = 1;
        Object objE = h0.e(this.f76836a, this.f76837b, iVarI, eVar, cVar);
        return objE == coroutineSingletons ? coroutineSingletons : objE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(String str, boolean z11, String str2, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl) {
        d dVar;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f76829v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f76829v = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, continuationImpl);
            }
        }
        Object obj = dVar.f76827t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f76829v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        i iVarI = l.i(this.f76838c, "https://api.stripe.com/v1/".concat("consumers/sessions/consent_update"), apiRequest$Options, MapsKt.j0(new Pair("request_surface", str2), new Pair("credentials", m.n("consumer_session_client_secret", str)), new Pair("consent_granted", Boolean.valueOf(z11))), 8);
        dVar.f76829v = 1;
        Object objC = h0.c(this.f76836a, this.f76837b, iVarI, dVar);
        return objC == coroutineSingletons ? coroutineSingletons : objC;
    }

    public final Object h(String str, String str2, List list, String str3, ApiRequest$Options apiRequest$Options, b1 b1Var) {
        return h0.d(this.f76836a, this.f76837b, l.i(this.f76838c, "https://api.stripe.com/v1/".concat("consumers/sessions/refresh"), apiRequest$Options, MapsKt.j0(new Pair("app_id", str), new Pair("request_surface", str3), new Pair("credentials", m.n("consumer_session_client_secret", str2)), new Pair("supported_verification_types", list)), 8), new gt.g(1), b1Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object i(String str, String str2, String str3, String str4, String str5, ApiRequest$Options apiRequest$Options, LinkedHashMap linkedHashMap, ContinuationImpl continuationImpl) throws APIException {
        e eVar;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f76832v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f76832v = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object obj = eVar.f76830t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f76832v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        i iVarI = l.i(this.f76838c, "https://api.stripe.com/v1/".concat("consumers/payment_details/share"), apiRequest$Options, MapsKt.m0(MapsKt.j0(new Pair("request_surface", str5), new Pair("id", str2), new Pair("expected_payment_method_type", str3), new Pair("credentials", m.n("consumer_session_client_secret", str)), new Pair("billing_phone", str4)), linkedHashMap), 8);
        gt.e eVar2 = gt.e.f57794f;
        eVar.f76832v = 1;
        Object objE = h0.e(this.f76836a, this.f76837b, iVarI, eVar2, eVar);
        return objE == coroutineSingletons ? coroutineSingletons : objE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(s0 s0Var, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl) {
        f fVar;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i5 = fVar.f76835v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f76835v = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(this, continuationImpl);
            }
        }
        Object obj = fVar.f76833t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fVar.f76835v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        i iVarI = l.i(this.f76838c, "https://api.stripe.com/v1/".concat("consumers/accounts/sign_up"), apiRequest$Options, s0Var.a(), 8);
        gt.e eVar = gt.e.f57791c;
        fVar.f76835v = 1;
        Object objE = h0.e(this.f76836a, this.f76837b, iVarI, eVar, fVar);
        return objE == coroutineSingletons ? coroutineSingletons : objE;
    }

    public final Object k(String str, Locale locale, String str2, ApiRequest$Options apiRequest$Options, boolean z11, v vVar) {
        w0[] w0VarArr = w0.f56067a;
        String strConcat = "https://api.stripe.com/v1/".concat("consumers/sessions/start_verification");
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("request_surface", str2);
        mapBuilder.put("credentials", k.e0(new Pair("consumer_session_client_secret", str)));
        mapBuilder.put(TTConst.TRACK_TYPE, "SMS");
        mapBuilder.put("locale", locale.toLanguageTag());
        if (z11) {
            mapBuilder.put("is_resend_sms_code", Boolean.TRUE);
        }
        Unit unit = Unit.f71706a;
        return h0.d(this.f76836a, this.f76837b, l.i(this.f76838c, strConcat, apiRequest$Options, mapBuilder.b(), 8), new gt.f(), vVar);
    }
}
