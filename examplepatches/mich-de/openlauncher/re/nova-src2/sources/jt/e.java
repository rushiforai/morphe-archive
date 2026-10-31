package jt;

import android.content.Context;
import android.content.Intent;
import android.os.CancellationSignal;
import android.os.Parcelable;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.identityauth.HiddenActivity;
import com.google.android.gms.auth.api.identity.BeginSignInResult;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.ConfirmSetupIntentParams;
import com.stripe.android.model.ConfirmationTokenParams;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodUpdateParams;
import com.stripe.android.model.SourceParams;
import com.stripe.android.model.z2;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import com.stripe.android.paymentelement.confirmation.ConfirmationMediator$Parameters;
import com.stripe.android.payments.core.authentication.threeds2.Stripe3ds2TransactionActivity;
import com.stripe.android.stripe3ds2.transaction.ChallengeResult;
import com.teslacoilsw.conditions.ConditionSetId;
import com.teslacoilsw.conditions.ConditionSetRecord;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import cw.v3;
import e00.v6;
import h6.g1;
import h6.h1;
import java.io.File;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import kotlin.ExceptionsKt;
import kotlin.Result;
import kotlin.Unit;
import kotlin.collections.EmptySet;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kw.o1;
import kw.t1;
import kw.y2;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import org.json.JSONArray;
import org.json.JSONObject;
import p1.e1;
import p1.s2;
import p1.w1;
import p1.y1;
import w70.i2;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69778a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f69779b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f69780c;

    public /* synthetic */ e(int i5, Object obj, Object obj2) {
        this.f69778a = i5;
        this.f69779b = obj;
        this.f69780c = obj2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0408  */
    /* JADX WARN: Type inference failed for: r4v4, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r8v2, types: [java.lang.String] */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        Set setE;
        String str;
        String str2;
        boolean z11;
        mt.i fVar;
        switch (this.f69778a) {
            case 0:
                z0 z0Var = (z0) this.f69779b;
                ConfirmationTokenParams confirmationTokenParams = (ConfirmationTokenParams) this.f69780c;
                a aVar = z0Var.f69923j;
                PaymentAnalyticsEvent paymentAnalyticsEvent = PaymentAnalyticsEvent.f44074b;
                PaymentMethodCreateParams paymentMethodCreateParams = confirmationTokenParams.f43246b;
                if (paymentMethodCreateParams == null || (setE = paymentMethodCreateParams.e()) == null) {
                    setE = EmptySet.f71734a;
                }
                z0Var.f69921h.a(a.c(aVar, paymentAnalyticsEvent, setE, null, null, null, 60));
                return Unit.f71706a;
            case 1:
                z0 z0Var2 = (z0) this.f69779b;
                PaymentMethodUpdateParams paymentMethodUpdateParams = (PaymentMethodUpdateParams) this.f69780c;
                a aVar2 = z0Var2.f69923j;
                paymentMethodUpdateParams.getClass();
                z2 z2Var = PaymentMethod.Type.f43637g;
                Set productUsageTokens = ((PaymentMethodUpdateParams.Card) paymentMethodUpdateParams).f43754e;
                aVar2.getClass();
                Intrinsics.g(productUsageTokens, "productUsageTokens");
                z0Var2.f69921h.a(a.c(aVar2, PaymentAnalyticsEvent.f44076d, productUsageTokens, "card", null, null, 56));
                return Unit.f71706a;
            case 2:
                z0 z0Var3 = (z0) this.f69779b;
                ConfirmSetupIntentParams confirmSetupIntentParams = (ConfirmSetupIntentParams) this.f69780c;
                Result result = (Result) obj;
                a aVar3 = z0Var3.f69923j;
                PaymentMethodCreateParams paymentMethodCreateParams2 = confirmSetupIntentParams.f43209c;
                continuation = paymentMethodCreateParams2 != null ? paymentMethodCreateParams2.f43680a : null;
                String strZ = z0Var3.z(result.f71688a);
                aVar3.getClass();
                z0Var3.f69921h.a(a.c(aVar3, PaymentAnalyticsEvent.f44084l, null, continuation, null, strZ, 26));
                return Unit.f71706a;
            case 3:
                z0 z0Var4 = (z0) this.f69779b;
                PaymentMethodCreateParams paymentMethodCreateParams3 = (PaymentMethodCreateParams) this.f69780c;
                a aVar4 = z0Var4.f69923j;
                String paymentMethodCode = paymentMethodCreateParams3.f43680a;
                Set productUsageTokens2 = paymentMethodCreateParams3.e();
                aVar4.getClass();
                Intrinsics.g(paymentMethodCode, "paymentMethodCode");
                Intrinsics.g(productUsageTokens2, "productUsageTokens");
                z0Var4.f69921h.a(a.c(aVar4, PaymentAnalyticsEvent.f44075c, productUsageTokens2, paymentMethodCode, null, null, 56));
                return Unit.f71706a;
            case 4:
                ConfirmPaymentIntentParams confirmPaymentIntentParams = (ConfirmPaymentIntentParams) this.f69780c;
                z0 z0Var5 = (z0) this.f69779b;
                Result result2 = (Result) obj;
                PaymentMethodCreateParams paymentMethodCreateParams4 = confirmPaymentIntentParams.f43185a;
                if (paymentMethodCreateParams4 == null || (str2 = paymentMethodCreateParams4.f43680a) == null) {
                    SourceParams sourceParams = confirmPaymentIntentParams.f43187c;
                    str = sourceParams != null ? Intrinsics.b(sourceParams.f43853a, "card") ? "card" : "unknown" : null;
                } else {
                    str = str2;
                }
                a aVar5 = z0Var5.f69923j;
                String strZ2 = z0Var5.z(result2.f71688a);
                aVar5.getClass();
                z0Var5.f69921h.a(a.c(aVar5, PaymentAnalyticsEvent.f44080h, null, str, null, strZ2, 26));
                return Unit.f71706a;
            case 5:
                Function2 function2 = (Function2) this.f69779b;
                jv.t tVar = (jv.t) this.f69780c;
                z2.y coordinates = (z2.y) obj;
                Intrinsics.g(coordinates, "coordinates");
                function2.invoke(tVar.f70158a, coordinates);
                return Unit.f71706a;
            case 6:
                ArrayList arrayList = (ArrayList) this.f69779b;
                Collection collection = (Collection) this.f69780c;
                ConditionSetRecord conditionSetRecord = (ConditionSetRecord) obj;
                if (arrayList.contains(new ConditionSetId(conditionSetRecord.f45532a))) {
                    Collection collection2 = collection;
                    ArrayList arrayList2 = new ArrayList(b70.c.u0(collection2, 10));
                    Iterator it = collection2.iterator();
                    while (it.hasNext()) {
                        arrayList2.add(new ConditionSetId(((ConditionSetRecord) it.next()).f45532a));
                    }
                    z11 = arrayList2.contains(new ConditionSetId(conditionSetRecord.f45532a));
                }
                return Boolean.valueOf(z11);
            case 7:
                Executor executor = (Executor) this.f69779b;
                f5.d dVar = (f5.d) this.f69780c;
                GetCredentialException e3 = (GetCredentialException) obj;
                Intrinsics.g(e3, "e");
                executor.execute(new k5.e(dVar, e3, 0));
                return Unit.f71706a;
            case 8:
                Stripe3ds2TransactionActivity stripe3ds2TransactionActivity = (Stripe3ds2TransactionActivity) this.f69779b;
                h1 h1Var = (h1) this.f69780c;
                ChallengeResult challengeResult = (ChallengeResult) obj;
                int i5 = Stripe3ds2TransactionActivity.f44308r;
                Intrinsics.g(challengeResult, "challengeResult");
                return t70.m0.t(g1.e(stripe3ds2TransactionActivity), null, null, new androidx.room.p(stripe3ds2TransactionActivity, challengeResult, h1Var, (Continuation) null, 24), 3);
            case 9:
                Ref.BooleanRef booleanRef = (Ref.BooleanRef) this.f69779b;
                Ref.IntRef intRef = (Ref.IntRef) this.f69780c;
                z2.y layoutCoordinates = (z2.y) obj;
                Intrinsics.g(layoutCoordinates, "layoutCoordinates");
                if (!booleanRef.f71859a) {
                    intRef.f71861a += (int) (layoutCoordinates.g() & 4294967295L);
                    booleanRef.f71859a = true;
                }
                return Unit.f71706a;
            case 10:
                t70.j0 j0Var = (t70.j0) this.f69779b;
                q0.b bVar = (q0.b) this.f69780c;
                g2.v it2 = (g2.v) obj;
                Intrinsics.g(it2, "it");
                if (((g2.w) it2).b()) {
                    t70.m0.t(j0Var, null, null, new t1(bVar, null, 0), 3);
                }
                return Unit.f71706a;
            case 11:
                o1 o1Var = (o1) this.f69779b;
                e1 e1Var = (e1) this.f69780c;
                g2.v it3 = (g2.v) obj;
                Intrinsics.g(it3, "it");
                g2.w wVar = (g2.w) it3;
                if (((Boolean) e1Var.getValue()).booleanValue() != wVar.b()) {
                    h6.c1.B(wVar.b(), o1Var.f72526h, null);
                }
                e1Var.setValue(Boolean.valueOf(wVar.b()));
                return Unit.f71706a;
            case 12:
                v3 v3Var = (v3) this.f69779b;
                e1 e1Var2 = (e1) this.f69780c;
                ((Boolean) obj).getClass();
                h6.c1.B(!((Boolean) e1Var2.getValue()).booleanValue(), v3Var.f48344c, null);
                return Unit.f71706a;
            case 13:
                e1 e1Var3 = (e1) this.f69779b;
                y2 y2Var = (y2) this.f69780c;
                g2.v it4 = (g2.v) obj;
                Intrinsics.g(it4, "it");
                g2.w wVar2 = (g2.w) it4;
                if (((Boolean) e1Var3.getValue()).booleanValue() != wVar2.b()) {
                    y2Var.i(wVar2.b());
                }
                e1Var3.setValue(Boolean.valueOf(wVar2.b()));
                return Unit.f71706a;
            case 14:
                ky.e eVar = (ky.e) this.f69779b;
                e1 e1Var4 = eVar.f72773c;
                t70.j0 j0Var2 = (t70.j0) this.f69780c;
                Boolean bool = (Boolean) obj;
                if (bool.booleanValue()) {
                    ((s2) e1Var4).setValue(bool);
                    t70.m0.t(j0Var2, null, null, new cv.y(eVar, continuation, 26), 3);
                } else {
                    ((s2) e1Var4).setValue(bool);
                }
                return Unit.f71706a;
            case 15:
                a00.b bVar2 = (a00.b) this.f69779b;
                l00.o oVar = (l00.o) this.f69780c;
                Float f11 = (Float) obj;
                f11.floatValue();
                if (cl.k0.C(bVar2.f64e)) {
                    ((s2) oVar.f72974g).setValue(Boolean.TRUE);
                    ((s2) oVar.f72976i).setValue(f11);
                }
                return Unit.f71706a;
            case 16:
                CancellationSignal cancellationSignal = (CancellationSignal) this.f69779b;
                l5.b bVar3 = (l5.b) this.f69780c;
                Context context = bVar3.f74716g;
                BeginSignInResult beginSignInResult = (BeginSignInResult) obj;
                CredentialProviderPlayServicesImpl.Companion.getClass();
                if (j5.d.a(cancellationSignal)) {
                    return Unit.f71706a;
                }
                Intent intent = new Intent(context, (Class<?>) HiddenActivity.class);
                k5.c.a(bVar3.f74720k, intent, "BEGIN_SIGN_IN");
                intent.putExtra("EXTRA_FLOW_PENDING_INTENT", beginSignInResult.f31719f);
                try {
                    context.startActivity(intent);
                } catch (Exception unused) {
                    CredentialProviderPlayServicesImpl.Companion.getClass();
                    if (!j5.d.a(cancellationSignal)) {
                        bVar3.e().execute(new g.p(bVar3, 14));
                        Unit unit = Unit.f71706a;
                    }
                }
                return Unit.f71706a;
            case 17:
                r40.a aVar6 = (r40.a) this.f69779b;
                du.a aVar7 = (du.a) this.f69780c;
                ww.a host = (ww.a) obj;
                Intrinsics.g(host, "host");
                j.c cVar = ((ju.a) aVar6.get()).f69931f;
                return cVar != null ? new dq.m(cVar) : new dq.l(host, aVar7);
            case 18:
                Function1 function1 = (Function1) this.f69779b;
                p6.t tVar2 = (p6.t) this.f69780c;
                function1.invoke((List) obj);
                tVar2.o();
                return Unit.f71706a;
            case 19:
                e1 e1Var5 = (e1) this.f69779b;
                m00.j0 j0Var3 = (m00.j0) this.f69780c;
                String str3 = (String) obj;
                e1Var5.setValue(str3);
                j0Var3.f75585j.j(str3);
                return Unit.f71706a;
            case 20:
                Function2 function22 = (Function2) this.f69779b;
                m00.t tVar3 = (m00.t) this.f69780c;
                Boolean bool2 = (Boolean) obj;
                bool2.booleanValue();
                function22.invoke(tVar3, bool2);
                return Unit.f71706a;
            case 21:
                String str4 = (String) this.f69779b;
                ArrayList arrayList3 = (ArrayList) this.f69780c;
                JSONObject jSONObject = (JSONObject) obj;
                JSONObject jSONObject2 = jSONObject.getJSONObject("author");
                JSONArray jSONArray = jSONObject.getJSONObject("reviewRequests").getJSONArray("nodes");
                ArrayList arrayList4 = new ArrayList();
                int length = jSONArray.length();
                for (int i11 = 0; i11 < length; i11++) {
                    arrayList4.add(jSONArray.getJSONObject(i11).getJSONObject("requestedReviewer").getString("login"));
                }
                if (Intrinsics.b(jSONObject2.getString("login"), str4) || arrayList4.contains(str4)) {
                    arrayList3.add(new ExternalLink(b.c0.k("pull/", jSONObject.getString("id")), jSONObject.getString("title"), null, jSONObject2.getString("avatarUrl"), jSONObject.getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL), null, null, 228));
                }
                return Unit.f71706a;
            case 22:
                mt.g0 g0Var = (mt.g0) this.f69779b;
                iv.c cVar2 = (iv.c) this.f69780c;
                Parcelable result3 = (Parcelable) obj;
                Intrinsics.g(result3, "result");
                h6.u0 u0Var = g0Var.f76755a;
                String str5 = g0Var.f76758d;
                ConfirmationMediator$Parameters confirmationMediator$Parameters = (ConfirmationMediator$Parameters) u0Var.a(str5);
                if (confirmationMediator$Parameters != null) {
                    u0Var.d(str5, null);
                    fVar = g0Var.f76756b.h(confirmationMediator$Parameters.f44131a, confirmationMediator$Parameters.f44132b, confirmationMediator$Parameters.f44133c, result3);
                } else {
                    IllegalStateException illegalStateException = new IllegalStateException("Arguments should have been initialized before handling result!");
                    fVar = new mt.f(illegalStateException, p50.i.w(illegalStateException), mt.p.f76802a);
                }
                cVar2.invoke(fVar);
                return Unit.f71706a;
            case 23:
                return new n0.y0((y1.e) this.f69779b, (Map) obj, (y1.c) this.f69780c);
            case 24:
                h6.a0 a0Var = (h6.a0) this.f69779b;
                b00.a0 a0Var2 = new b00.a0((e1) this.f69780c, 1);
                a0Var.getLifecycle().a(a0Var2);
                return new b00.g0(12, a0Var, a0Var2);
            case 25:
                Function2 function23 = (Function2) this.f69779b;
                DayOfWeek dayOfWeek = (DayOfWeek) this.f69780c;
                Boolean bool3 = (Boolean) obj;
                bool3.booleanValue();
                function23.invoke(dayOfWeek, bool3);
                return Unit.f71706a;
            case 26:
                t70.j0 j0Var4 = (t70.j0) this.f69779b;
                File file = (File) this.f69780c;
                a80.e eVar2 = t70.y0.f88884a;
                return new v6((i6.f) obj, t70.m0.t(j0Var4, a80.d.f488c, null, new m10.f(file, null, 1), 2), 1);
            case 27:
                e1 e1Var6 = (e1) this.f69779b;
                z2.h1 h1Var2 = (z2.h1) obj;
                e1.k0 k0Var = new e1.k0((ArrayList) this.f69780c, 5);
                h1Var2.f98075a = true;
                k0Var.invoke(h1Var2);
                h1Var2.f98075a = false;
                e1Var6.getValue();
                return Unit.f71706a;
            case 28:
                q00.l lVar = (q00.l) this.f69779b;
                e10.t1 t1Var = (e10.t1) this.f69780c;
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                Set setM1 = b70.g.M1((Iterable) lVar.f83363b.getValue());
                if (zBooleanValue) {
                    setM1.add(t1Var);
                } else {
                    setM1.remove(t1Var);
                }
                lVar.setValue(setM1);
                return Unit.f71706a;
            default:
                y1 y1Var = (y1) this.f69779b;
                Throwable th2 = (Throwable) this.f69780c;
                Throwable th3 = (Throwable) obj;
                synchronized (y1Var.f81647b) {
                    if (th2 == null) {
                        th2 = null;
                    } else if (th3 != null) {
                        try {
                            if (th3 instanceof CancellationException) {
                                th3 = null;
                            }
                            if (th3 != null) {
                                ExceptionsKt.a(th2, th3);
                            }
                        } catch (Throwable th4) {
                            throw th4;
                        }
                    }
                    y1Var.f81649d = th2;
                    i2 i2Var = y1Var.f81663t;
                    w1 w1Var = w1.f81613a;
                    i2Var.getClass();
                    i2Var.k(null, w1Var);
                }
                return Unit.f71706a;
        }
    }

    public /* synthetic */ e(ConfirmPaymentIntentParams confirmPaymentIntentParams, z0 z0Var) {
        this.f69778a = 4;
        this.f69780c = confirmPaymentIntentParams;
        this.f69779b = z0Var;
    }
}
