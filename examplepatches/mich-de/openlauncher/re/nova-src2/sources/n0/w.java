package n0;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.LightingColorFilter;
import android.graphics.Paint;
import android.util.Base64;
import android.widget.ImageButton;
import c3.b2;
import c3.c3;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.instabridge.ai.chat.ui.v2.AiChatViewV2;
import com.stripe.android.PaymentConfiguration;
import com.stripe.android.core.exception.GenericStripeException;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.payments.paymentlauncher.PaymentLauncherContract;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.PaymentSheetResult;
import com.stripe.android.ui.core.cbc.CardBrandChoiceEligibility;
import com.stripe.android.view.PaymentAuthWebViewActivity;
import com.teslacoilsw.launcher.ai.NovaAiChatActivity;
import com.teslacoilsw.launcher.ai.NovaAiInsightHistoryActivity;
import com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragment;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import ou.g2;
import p1.s2;
import p1.y2;
import t0.l1;
import t0.u1;

/* loaded from: classes2.dex */
public final /* synthetic */ class w implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77512a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f77513b;

    public /* synthetic */ w(Object obj, int i5) {
        this.f77512a = i5;
        this.f77513b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00d6  */
    /* JADX WARN: Type inference failed for: r0v18, types: [java.lang.Object, w70.g2] */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() {
        p6.e0 e0Var;
        String str;
        int i5 = this.f77512a;
        Object obj = this.f77513b;
        switch (i5) {
            case 0:
                v vVar = ((androidx.compose.foundation.lazy.layout.c) obj).f14002j;
                if (vVar != null) {
                    b3.g.d(vVar);
                }
                return Unit.f71706a;
            case 1:
                try {
                    byte[] bArrDecode = Base64.decode(((PaymentLauncherContract.Args.HashedPaymentIntentNextActionArgs) obj).f44358e, 0);
                    Intrinsics.d(bArrDecode);
                    List listI1 = r70.k.i1(new String(bArrDecode, Charsets.f72000b), new String[]{":"}, 6);
                    if (listI1.size() != 2) {
                        int i11 = Result.f71687b;
                        return new Result(ResultKt.a(new GenericStripeException("invalidHashedValueIncorrectFormat", new IllegalArgumentException("Invalid hashed value! Please provided a hashed payment intent in the correct format!"))));
                    }
                    int i12 = Result.f71687b;
                    return new Result(new Pair(listI1.get(0), listI1.get(1)));
                } catch (IllegalArgumentException e3) {
                    int i13 = Result.f71687b;
                    return new Result(ResultKt.a(new GenericStripeException("invalidHashedValueNotBase64", new IllegalArgumentException("Invalid hashed value! Please provided a hashed payment intent in the correct format!", e3))));
                }
            case 2:
                return ((ou.g) obj).f80869a.getSharedPreferences("DefaultPrefsRepository", 0);
            case 3:
                Set set = ((PaymentSheet$BillingDetailsCollectionConfiguration) obj).f44518f;
                ArrayList arrayList = new ArrayList(b70.c.u0(set, 10));
                Iterator it = set.iterator();
                while (it.hasNext()) {
                    String upperCase = ((String) it.next()).toUpperCase(Locale.ROOT);
                    Intrinsics.f(upperCase, "toUpperCase(...)");
                    arrayList.add(upperCase);
                }
                return b70.g.N1(arrayList);
            case 4:
                ((com.stripe.android.paymentsheet.b1) obj).I.c(new PaymentSheetResult.Completed(true));
                return Unit.f71706a;
            case 5:
                PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) ((g2) obj).f80881a.getValue();
                return Boolean.valueOf((paymentMethodMetadata != null ? paymentMethodMetadata.f43099h : null) instanceof CardBrandChoiceEligibility.Eligible);
            case 6:
                pu.z zVar = (pu.z) obj;
                zVar.f83103i.t(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                zVar.f83098d.j(null);
                return Unit.f71706a;
            case 7:
                com.stripe.android.paymentsheet.addresselement.e.a(((com.stripe.android.paymentsheet.addresselement.k0) obj).f44747b);
                return Unit.f71706a;
            case 8:
                return (h2.c) obj;
            case 9:
                ((qx.f) obj).y();
                return Unit.f71706a;
            case 10:
                ((ox.o) ((b00.z0) obj).f16513b).f81093a.b();
                return Unit.f71706a;
            case 11:
                ((r0.b) obj).f84933w.invoke(Boolean.valueOf(!r5.f84932v));
                return Unit.f71706a;
            case 12:
                p6.t tVarA = ((r00.p) obj).a();
                List list = r00.o.f85019a;
                p6.t.n(tVarA, "FolderIcon", null, 6);
                return Unit.f71706a;
            case 13:
                b3.h0 h0Var = AppSearchResultsView.f46177o0;
                return ((v9.g) obj).f92344e.getDrawable();
            case 14:
                Boolean bool = (Boolean) ((y2) ((m.w) obj).f75379c).getValue();
                bool.getClass();
                return bool;
            case 15:
                c3 c3Var = (c3) obj;
                if (c3Var != null) {
                    ((b2) c3Var).a();
                }
                return Unit.f71706a;
            case 16:
                int color = ((Paint) ((mh.c) obj).f76324c).getColor();
                return new LightingColorFilter(Color.rgb((((color >> 16) & 255) * 96) / 255, (((color >> 8) & 255) * 96) / 255, ((color & 255) * 96) / 255), Color.rgb(0, 0, 0));
            case 17:
                return (m3.g) obj;
            case 18:
                return new u1((g0.d1) obj, 0.0f);
            case 19:
                t0.f1 f1Var = (t0.f1) obj;
                return new y3.m(l1.a(f1Var.f87983b, f1Var.f87988g, f1Var.f87989h, l1.f88078a, 1));
            case 20:
                return new y3.k(((y3.l) obj).g());
            case 21:
                NovaAiChatActivity novaAiChatActivity = (NovaAiChatActivity) obj;
                AiChatViewV2 aiChatViewV2 = novaAiChatActivity.f45690t;
                if (aiChatViewV2 != null) {
                    aiChatViewV2.newConversation();
                }
                ImageButton imageButton = novaAiChatActivity.f45691u;
                if (imageButton != null) {
                    imageButton.setVisibility(8);
                }
                novaAiChatActivity.m0();
                BottomSheetBehavior bottomSheetBehavior = novaAiChatActivity.A;
                if (bottomSheetBehavior != null) {
                    bottomSheetBehavior.J(4);
                }
                return Unit.f71706a;
            case 22:
                ((NovaAiInsightHistoryActivity) obj).finish();
                return Unit.f71706a;
            case 23:
                return ((w70.g2) obj).getValue();
            case 24:
                p6.l0 l0Var = (p6.l0) obj;
                p6.n nVarJ = l0Var.j();
                if (nVarJ == null || (e0Var = nVarJ.f82192b) == null || (str = e0Var.f82158g) == null) {
                    List list2 = w00.g0.f93516a;
                    p6.t.n(l0Var, "NovaSearch", null, 6);
                } else {
                    List list3 = w00.g0.f93516a;
                    if (r70.k.K0(str, "NovaSearch", false)) {
                        l0Var.o();
                    }
                }
                return Unit.f71706a;
            case 25:
                return ((NovaSettingsFragment) obj).requireContext();
            case 26:
                w3.b bVar = (w3.b) obj;
                p1.e1 e1Var = bVar.f93741c;
                if (((h2.e) ((s2) e1Var).getValue()).f59030a == 9205357640488583168L || h2.e.e(((h2.e) ((s2) e1Var).getValue()).f59030a)) {
                    return null;
                }
                return bVar.f93739a.b(((h2.e) ((s2) e1Var).getValue()).f59030a);
            case 27:
                Context context = (Context) ((dv.r) obj).f49639b;
                Intrinsics.g(context, "context");
                PaymentConfiguration paymentConfiguration = PaymentConfiguration.f42439c;
                if (paymentConfiguration == null) {
                    SharedPreferences sharedPreferences = new dq.o(context).f49358a;
                    String string = sharedPreferences.getString("key_publishable_key", null);
                    PaymentConfiguration paymentConfiguration2 = string != null ? new PaymentConfiguration(string, sharedPreferences.getString("key_account_id", null)) : null;
                    if (paymentConfiguration2 == null) {
                        throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
                    }
                    PaymentConfiguration.f42439c = paymentConfiguration2;
                    paymentConfiguration = paymentConfiguration2;
                }
                return paymentConfiguration.f42440a;
            case 28:
                int i14 = PaymentAuthWebViewActivity.f45487s;
                ((ww.l0) obj).f94810g = true;
                return Unit.f71706a;
            default:
                MapBuilder mapBuilder = new MapBuilder();
                String str2 = ((ww.k0) obj).f94793a.n;
                if (str2 != null) {
                    mapBuilder.put("Referer", str2);
                }
                MapBuilder mapBuilderB = mapBuilder.b();
                fr.p0 p0Var = new fr.p0();
                String str3 = dq.s.f49365c;
                return MapsKt.m0(p0Var.a(null), mapBuilderB);
        }
    }

    public /* synthetic */ w(qx.f fVar, String str) {
        this.f77512a = 9;
        this.f77513b = fVar;
    }
}
