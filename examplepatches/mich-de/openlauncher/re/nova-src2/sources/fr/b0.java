package fr;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import com.stripe.android.PaymentConfiguration;
import com.stripe.android.challenge.confirmation.IntentConfirmationChallengeArgs;
import com.stripe.android.challenge.passive.PassiveChallengeActivity;
import com.stripe.android.challenge.passive.PassiveChallengeArgs;
import com.stripe.android.challenge.passive.warmer.activity.PassiveChallengeWarmerActivity;
import com.stripe.android.challenge.passive.warmer.activity.PassiveChallengeWarmerArgs;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.LinkPaymentDetails;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract;
import com.stripe.android.payments.core.authentication.threeds2.Stripe3ds2TransactionContract;
import com.stripe.android.paymentsheet.ui.PrimaryButton;
import com.stripe.android.uicore.elements.AddressInputMode;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.preferences.fancyprefs.color.ColorPickerBottomSheet;
import com.teslacoilsw.launcher.preferences.fragments.SettingsBackup;
import com.teslacoilsw.launcher.preferences.fragments.SettingsFolder;
import com.teslacoilsw.launcher.preferences.fragments.SettingsIntegrations;
import com.teslacoilsw.launcher.privacy.KoreaAnalyticsConsentActivity;
import e10.n2;
import e10.y2;
import g0.w0;
import h6.g1;
import hv.i4;
import io.sentry.e3;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import jt.z0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.PolymorphicSerializer;
import ou.o1;
import ou.p1;
import ou.q1;
import ou.r1;
import ou.s1;
import ou.t1;

/* loaded from: classes4.dex */
public final /* synthetic */ class b0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55584a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f55585b;

    public /* synthetic */ b0(Object obj, int i5) {
        this.f55584a = i5;
        this.f55585b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:132:0x0100 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:138:? A[LOOP:0: B:47:0x00be->B:138:?, LOOP_END, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0104  */
    /* JADX WARN: Type inference failed for: r0v11, types: [java.lang.Object, kotlin.Lazy] */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() {
        Object objA;
        hq.e jVar;
        boolean z11;
        boolean z12;
        boolean z13;
        int i5 = this.f55584a;
        boolean z14 = true;
        int i11 = 0;
        Continuation continuation = null;
        Object obj = this.f55585b;
        switch (i5) {
            case 0:
                return ((Context) ((fl.l) obj).f55376d).getSharedPreferences("StripeAnalyticsRequestV2Storage", 0);
            case 1:
                return (ApiRequest$Options) obj;
            case 2:
                return ((CollectBankAccountContract.Args) obj).getF44279c();
            case 3:
                return (w0) v70.r.a(((v70.m) obj).n());
            case 4:
                Context contextRequireContext = ((ColorPickerBottomSheet) obj).requireContext();
                g10.g gVar = g10.g.f56847a;
                return new g10.f(contextRequireContext, -1, 0.0f, 0, 8);
            case 5:
                ((SettingsBackup) obj).o.a(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null);
                return Unit.f71706a;
            case 6:
                ?? r02 = ((SettingsFolder) obj).f46093i;
                return Bitmap.createBitmap(((Number) r02.getValue()).intValue(), ((Number) r02.getValue()).intValue(), Bitmap.Config.ARGB_8888);
            case 7:
                return ((SettingsIntegrations) obj).requireActivity().getApplicationContext().getPackageManager();
            case 8:
                ((h6.i) obj).f59377m = null;
                return Unit.f71706a;
            case 9:
                hq.m mVar = (hq.m) obj;
                hq.t tVar = new hq.t(0);
                e3 e3Var = new e3(tVar);
                Context appContext = mVar.f59987d;
                try {
                    int i12 = Result.f71687b;
                    Intrinsics.f(appContext, "appContext");
                    PaymentConfiguration paymentConfiguration = PaymentConfiguration.f42439c;
                    if (paymentConfiguration == null) {
                        SharedPreferences sharedPreferences = new dq.o(appContext).f49358a;
                        String string = sharedPreferences.getString("key_publishable_key", null);
                        paymentConfiguration = string != null ? new PaymentConfiguration(string, sharedPreferences.getString("key_account_id", null)) : null;
                        if (paymentConfiguration == null) {
                            throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
                        }
                        PaymentConfiguration.f42439c = paymentConfiguration;
                    }
                    objA = paymentConfiguration.f42440a;
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                if (!(objA instanceof Result.Failure)) {
                    mVar.a(PaymentAnalyticsEvent.P, (String) objA);
                }
                if (Result.a(objA) != null) {
                    mVar.a(PaymentAnalyticsEvent.Q, "pk_undefined");
                }
                if (Result.a(objA) == null) {
                    String str = (String) objA;
                    Intrinsics.f(appContext, "appContext");
                    jVar = new hq.w(new z0(appContext, new dq.r(str, i11), mVar.f59985b, null, null, null, null, null, null, 65528), new ApiRequest$Options(str, (String) null, 6), tVar, new l(), new jt.a(appContext, str, mVar.f59984a));
                } else {
                    jVar = new gu.j(13, (byte) 0);
                }
                return new hq.l(e3Var, jVar, new io.sentry.internal.debugmeta.c(19), tVar);
            case 10:
                int i14 = PrimaryButton.f44986m;
                ((n0.w) obj).invoke();
                return Unit.f71706a;
            case 11:
                ((hv.i0) obj).b(i4.f60333d);
                return Unit.f71706a;
            case 12:
                ((KoreaAnalyticsConsentActivity) obj).finish();
                return Unit.f71706a;
            case 13:
                return ((IntentConfirmationChallengeArgs) obj).f42492a;
            case 14:
                com.stripe.android.customersheet.d dVar = (com.stripe.android.customersheet.d) obj;
                t70.m0.t(g1.f(dVar), null, null, new iv.b(dVar, continuation, z14 ? 1 : 0), 3);
                return Unit.f71706a;
            case 15:
                ((bo.c) obj).a(jv.w.f70183b);
                return Unit.f71706a;
            case 16:
                jv.u uVar = (jv.u) obj;
                if (!uVar.f70171a.isEmpty()) {
                    List<ou.j> list = uVar.f70171a;
                    if ((list instanceof Collection) && list.isEmpty()) {
                        z13 = true;
                        if (z13) {
                        }
                    } else {
                        for (ou.j jVar2 : list) {
                            t1 t1Var = jVar2.f80906c;
                            if (t1Var instanceof o1) {
                                z12 = !jVar2.f80905b.b();
                                if (!z12) {
                                    z13 = false;
                                    z11 = z13;
                                }
                            } else if (t1Var instanceof p1) {
                                z12 = ((p1) t1Var).f80956a instanceof LinkPaymentDetails.Card;
                                if (!z12) {
                                }
                            } else {
                                if (!(t1Var instanceof q1) && !(t1Var instanceof r1) && !Intrinsics.b(t1Var, s1.f80974a)) {
                                    throw new NoWhenBranchMatchedException();
                                }
                                if (!z12) {
                                }
                            }
                        }
                        z13 = true;
                        if (z13) {
                        }
                    }
                }
                return Boolean.valueOf(z11);
            case 17:
                ((jv.t) obj).f70168k.invoke();
                return Unit.f71706a;
            case 18:
                jx.f fVar = (jx.f) obj;
                return LocalDateTime.ofInstant(fVar.f70406a, fVar.f70407b);
            case 19:
                return PolymorphicSerializer.descriptor_delegate$lambda$1((PolymorphicSerializer) obj);
            case 20:
                return ((PassiveChallengeActivity) obj).o;
            case 21:
                return ((PassiveChallengeArgs) obj).f42511b;
            case 22:
                return ((Stripe3ds2TransactionContract.Args) obj).f44318h;
            case 23:
                ((iw.c) ((AddressInputMode) obj)).getF45359f().invoke();
                return Unit.f71706a;
            case 24:
                Function0 function0 = ((kw.e) obj).f72351a;
                if (function0 != null) {
                    function0.invoke();
                }
                return Unit.f71706a;
            case 25:
                Intent intent = (Intent) obj;
                if (intent != null) {
                    NovaLauncher novaLauncher = NovaLauncher.f45649u1;
                    Intrinsics.d(novaLauncher);
                    novaLauncher.q0(null, intent, null);
                }
                return Unit.f71706a;
            case 26:
                a00.b bVar = (a00.b) obj;
                if (bVar != null) {
                    y2.f51877a.getClass();
                    n2 n2VarI0 = y2.I0();
                    String str2 = bVar.f67h;
                    z.f fVar2 = new z.f((Collection) n2VarI0.l());
                    fVar2.add(str2);
                    n2VarI0.i(fVar2);
                }
                return Unit.f71706a;
            case 27:
                Boolean bool = (Boolean) ((lw.d) obj).f75123b.getValue();
                bool.getClass();
                return bool;
            case 28:
                return ((PassiveChallengeWarmerActivity) obj).o;
            default:
                return ((PassiveChallengeWarmerArgs) obj).f42521b;
        }
    }
}
