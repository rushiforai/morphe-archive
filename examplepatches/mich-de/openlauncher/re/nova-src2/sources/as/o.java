package as;

import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.webkit.WebView;
import androidx.compose.ui.node.LayoutNode;
import bn.c1;
import bn.g0;
import bn.z0;
import com.google.android.material.progressindicator.CircularProgressIndicator;
import com.stripe.android.attestation.AttestationActivity;
import com.stripe.android.attestation.AttestationActivityResult;
import com.stripe.android.challenge.passive.PassiveChallengeActivity;
import com.stripe.android.challenge.passive.PassiveChallengeActivityResult;
import com.stripe.android.challenge.passive.warmer.activity.PassiveChallengeWarmerActivity;
import com.stripe.android.challenge.passive.warmer.activity.PassiveChallengeWarmerCompleted;
import com.stripe.android.financialconnections.FinancialConnectionsSheetConfiguration;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityResult;
import com.stripe.android.financialconnections.lite.FinancialConnectionsSheetLiteActivity;
import com.stripe.android.googlepaylauncher.GooglePayLauncher$Result;
import com.stripe.android.googlepaylauncher.GooglePayLauncherActivity;
import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncher$Result;
import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncherActivity;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.model.AccountRange;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract;
import com.stripe.android.payments.bankaccount.ui.CollectBankAccountActivity;
import com.stripe.android.payments.paymentlauncher.InternalPaymentResult;
import com.stripe.android.payments.paymentlauncher.PaymentLauncherConfirmationActivity;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import com.stripe.android.paymentsheet.addresselement.AddressElementNavigator$AutocompleteEvent;
import com.stripe.android.paymentsheet.addresselement.k0;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.view.CardBrandView;
import com.stripe.android.view.CardMultilineWidget;
import com.stripe.android.view.PaymentAuthWebViewActivity;
import com.teslacoilsw.launcher.NovaLauncher;
import cw.b2;
import e10.y2;
import e10.z2;
import h10.y0;
import h6.u0;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import k30.h0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kw.c3;
import kw.i0;
import kw.o1;
import kw.p1;
import kw.r2;
import kw.z1;
import m00.j0;
import t5.n0;
import t70.m0;
import w70.i2;
import w70.m1;

/* loaded from: classes4.dex */
public final class o implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15621a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15622b;

    public /* synthetic */ o(Object obj, int i5) {
        this.f15621a = i5;
        this.f15622b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(String str, Continuation continuation) {
        m00.u uVar;
        o oVar;
        Object value;
        if (continuation instanceof m00.u) {
            uVar = (m00.u) continuation;
            int i5 = uVar.f75648x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f75648x = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new m00.u(this, continuation);
            }
        }
        Object obj = uVar.f75646v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.f75648x;
        if (i11 == 0) {
            ResultKt.b(obj);
            g20.w wVar = ((j0) this.f15622b).f75580e;
            uVar.f75644t = this;
            uVar.f75645u = str;
            uVar.f75648x = 1;
            if (wVar.a(uVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            oVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = uVar.f75645u;
            oVar = uVar.f75644t;
            ResultKt.b(obj);
        }
        r80.x[] xVarArrSearch = !r70.k.U0(str) ? ((j0) oVar.f15622b).f75580e.d().search(2000L, str, null, EnumSet.of(r80.d.f85655b, r80.d.f85656c, r80.d.f85661h, r80.d.f85658e, r80.d.f85660g), true, LayoutNode.NotPlacedPlaceOrder, null, -1, r80.b.values()) : z2.X(((j0) oVar.f15622b).f75580e.d(), null, 15);
        i2 i2Var = ((j0) oVar.f15622b).f75581f;
        do {
            value = i2Var.getValue();
        } while (!i2Var.i(value, xVarArrSearch));
        return Unit.f71706a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v0, types: [kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r3v12 */
    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) throws Throwable {
        Object value;
        Object value2;
        i2 i2Var;
        Object value3;
        i2 i2Var2;
        Object value4;
        Object value5;
        Object objE;
        o1 o1Var;
        i0 i0Var;
        o1 o1Var2;
        Object value6;
        Object objH;
        int i5 = this.f15621a;
        strA1 = null;
        String strA1 = null;
        Object obj2 = this.f15622b;
        switch (i5) {
            case 0:
                GooglePayLauncher$Result googlePayLauncher$Result = (GooglePayLauncher$Result) obj;
                if (googlePayLauncher$Result != null) {
                    int i11 = GooglePayLauncherActivity.f42780r;
                    ((GooglePayLauncherActivity) obj2).Z(googlePayLauncher$Result);
                }
                return Unit.f71706a;
            case 1:
                GooglePayPaymentMethodLauncher$Result googlePayPaymentMethodLauncher$Result = (GooglePayPaymentMethodLauncher$Result) obj;
                if (googlePayPaymentMethodLauncher$Result != null) {
                    int i12 = GooglePayPaymentMethodLauncherActivity.f42806r;
                    ((GooglePayPaymentMethodLauncherActivity) obj2).Z(googlePayPaymentMethodLauncher$Result);
                }
                return Unit.f71706a;
            case 2:
                g0 g0Var = (g0) obj;
                c1 c1Var = (c1) obj2;
                Intrinsics.g(g0Var, "<set-?>");
                c1Var.f18156h = g0Var;
                if (c1Var.f18158j) {
                    c1Var.f18158j = false;
                    c1Var.c();
                }
                Object objA = c1.a(c1Var, g0Var.f18194a.f18242a, z0.f18318a, continuation);
                return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
            case 3:
                c1.m mVar = (c1.m) obj2;
                if (Build.VERSION.SDK_INT >= 34) {
                    mVar.a().startStylusHandwriting(mVar.f19099b);
                }
                return Unit.f71706a;
            case 4:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                i2 i2Var3 = ((cv.a0) obj2).f47999b;
                do {
                    value = i2Var3.getValue();
                } while (!i2Var3.i(value, cv.w.a((cv.w) value, null, !zBooleanValue, 7)));
                return Unit.f71706a;
            case 5:
                hq.a aVar = (hq.a) obj;
                b2 b2Var = (b2) obj2;
                AccountRange accountRange = (AccountRange) b70.g.Y0(aVar.f59956a);
                if (accountRange != null) {
                    int i13 = accountRange.f43123b;
                    i2 i2Var4 = b2Var.f48089j;
                    Integer num = new Integer(i13);
                    i2Var4.getClass();
                    i2Var4.k(null, num);
                }
                List list = aVar.f59957b;
                ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    arrayList.add(((AccountRange) it.next()).f43124c.f55884b);
                }
                b2Var.o.j(b70.g.P0(arrayList));
                return Unit.f71706a;
            case 6:
                long j11 = ((Duration) obj).f72041a;
                i2 i2Var5 = ((dv.w) obj2).f49655c;
                do {
                    value2 = i2Var5.getValue();
                } while (!i2Var5.i(value2, dv.n.a((dv.n) value2, j11, null, false, 14)));
                return Unit.f71706a;
            case 7:
                AttestationActivity attestationActivity = (AttestationActivity) obj2;
                int i14 = AttestationActivity.f42458q;
                attestationActivity.setResult(4851, new Intent().putExtras(w.b.a(new Pair("com.stripe.android.attestation.AttestationActivityContract.extra_result", (AttestationActivityResult) obj))));
                attestationActivity.finish();
                return Unit.f71706a;
            case 8:
                hu.e eVar = (hu.e) obj;
                CollectBankAccountActivity collectBankAccountActivity = (CollectBankAccountActivity) obj2;
                if (eVar instanceof hu.d) {
                    hu.d dVar = (hu.d) eVar;
                    rr.b bVar = collectBankAccountActivity.f44306p;
                    if (bVar == null) {
                        Intrinsics.m("financialConnectionsLauncher");
                        throw null;
                    }
                    bVar.a(new FinancialConnectionsSheetConfiguration(dVar.f60068b, dVar.f60067a, dVar.f60069c), dVar.f60070d);
                } else {
                    if (!(eVar instanceof hu.c)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    int i15 = CollectBankAccountActivity.f44305r;
                    collectBankAccountActivity.setResult(-1, new Intent().putExtras(w.b.a(new Pair("com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.extra_result", new CollectBankAccountContract.Result(((hu.c) eVar).f60066a)))));
                    collectBankAccountActivity.finish();
                }
                return Unit.f71706a;
            case 9:
                ((Function1) obj2).invoke((uu.b) obj);
                return Unit.f71706a;
            case 10:
                jv.s sVar = (jv.s) obj2;
                Object objY = m0.y(sVar.f70152j, new iv.b(sVar, strA, 3), continuation);
                return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
            case 11:
                h0 h0Var = (h0) obj2;
                if (!((Boolean) obj).booleanValue() && h0Var.n && !h0Var.f70981g.a()) {
                    y2.f51877a.getClass();
                    Object objL = y2.C1().l();
                    k30.c.Companion.getClass();
                    if (Intrinsics.b(objL, k30.c.f70909h)) {
                        h0Var.i(0L);
                    }
                }
                return Unit.f71706a;
            case 12:
                PassiveChallengeActivity passiveChallengeActivity = (PassiveChallengeActivity) obj2;
                int i16 = PassiveChallengeActivity.f42506q;
                passiveChallengeActivity.setResult(4638, new Intent().putExtras(w.b.a(new Pair("com.stripe.android.challenge.PassiveChallengeActivityContract.extra_result", (PassiveChallengeActivityResult) obj))));
                passiveChallengeActivity.finish();
                return Unit.f71706a;
            case 13:
                return a((String) obj, continuation);
            case 14:
                PassiveChallengeWarmerActivity passiveChallengeWarmerActivity = (PassiveChallengeWarmerActivity) obj2;
                int i17 = PassiveChallengeWarmerActivity.f42518q;
                passiveChallengeWarmerActivity.setResult(4639, new Intent().putExtras(w.b.a(new Pair("com.stripe.android.challenge.warmer.activity.PassiveChallengeWarmerContract.extra_result", (PassiveChallengeWarmerCompleted) obj))));
                passiveChallengeWarmerActivity.finish();
                return Unit.f71706a;
            case 15:
                ((Boolean) obj).booleanValue();
                NovaLauncher novaLauncher = (NovaLauncher) obj2;
                novaLauncher.f45658f1.b(novaLauncher);
                return Unit.f71706a;
            case 16:
                InternalPaymentResult internalPaymentResult = (InternalPaymentResult) obj;
                if (internalPaymentResult != null) {
                    int i18 = PaymentLauncherConfirmationActivity.f44351r;
                    ((PaymentLauncherConfirmationActivity) obj2).Z(internalPaymentResult);
                }
                return Unit.f71706a;
            case 17:
                PaymentSelection paymentSelection = (PaymentSelection) obj;
                ou.d dVar2 = (ou.d) obj2;
                dVar2.f80826f.invoke(paymentSelection);
                strA = paymentSelection != null ? com.stripe.android.paymentsheet.model.o.a(paymentSelection) : 0;
                u0 u0Var = dVar2.f80830j;
                if (strA != 0 && dVar2.c(strA).equals(ou.l.f80925b) && !Intrinsics.b((String) u0Var.a("previously_completed_payment_form"), strA)) {
                    ((ru.a) dVar2.f80829i).n(strA);
                    u0Var.d("previously_completed_payment_form", strA);
                }
                return Unit.f71706a;
            case 18:
                boolean zBooleanValue2 = ((Boolean) obj).booleanValue();
                cw.q qVar = (cw.q) obj2;
                if (qVar.f48267b && zBooleanValue2 && !qVar.f48266a) {
                    qVar.f48266a = true;
                    ((l10.z) qVar.f48268c).invoke(Boolean.TRUE);
                }
                return Unit.f71706a;
            case 19:
                pu.z zVar = (pu.z) obj2;
                r2 r2Var = zVar.f83102h;
                if (((String) obj).length() == 0) {
                    m1 m1Var = r2Var.f72594d;
                    do {
                        i2Var2 = (i2) m1Var;
                        value4 = i2Var2.getValue();
                    } while (!i2Var2.i(value4, null));
                } else {
                    m1 m1Var2 = r2Var.f72594d;
                    do {
                        i2Var = (i2) m1Var2;
                        value3 = i2Var.getValue();
                    } while (!i2Var.i(value3, new c3(2131232164, true, new n0.w(zVar, 6), 2)));
                }
                return Unit.f71706a;
            case 20:
                AddressElementNavigator$AutocompleteEvent addressElementNavigator$AutocompleteEvent = (AddressElementNavigator$AutocompleteEvent) obj;
                k0 k0Var = (k0) obj2;
                i2 i2Var6 = k0Var.f44754i;
                AddressDetails addressDetails = (AddressDetails) i2Var6.getValue();
                PaymentSheet$Address f44690a = addressElementNavigator$AutocompleteEvent != null ? addressElementNavigator$AutocompleteEvent.getF44690a() : null;
                String str = addressDetails != null ? addressDetails.f44678a : null;
                if (f44690a == null) {
                    f44690a = addressDetails != null ? addressDetails.f44679b : null;
                }
                AddressDetails addressDetails2 = new AddressDetails(str, f44690a, addressDetails != null ? addressDetails.f44680c : null, addressDetails != null ? addressDetails.f44681d : null);
                Map mapC = pu.b.c(addressDetails2, null);
                if (addressElementNavigator$AutocompleteEvent instanceof AddressElementNavigator$AutocompleteEvent.OnEnterManually) {
                    y0 y0Var = k0Var.f44749d;
                    if (y0Var != null) {
                        y0Var.invoke(new kw.m(mapC));
                    }
                } else if (addressElementNavigator$AutocompleteEvent instanceof AddressElementNavigator$AutocompleteEvent.OnBack) {
                    y0 y0Var2 = k0Var.f44749d;
                    if (y0Var2 != null) {
                        y0Var2.invoke(new kw.n(mapC));
                    }
                } else if (addressElementNavigator$AutocompleteEvent != null) {
                    throw new NoWhenBranchMatchedException();
                }
                i2Var6.getClass();
                i2Var6.k(null, addressDetails2);
                Unit unit = Unit.f71706a;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                return unit;
            case 21:
                if (((Boolean) zy.c.f98831i.getValue()).booleanValue()) {
                    px.e eVar2 = (px.e) obj2;
                    i2 i2Var7 = eVar2.f83124a;
                    dx.h hVarA = px.e.a(eVar2);
                    i2Var7.getClass();
                    i2Var7.k(null, hVarA);
                }
                return Unit.f71706a;
            case 22:
                UserInput userInput = (UserInput) obj;
                i2 i2Var8 = ((com.stripe.android.link.ui.inline.a) obj2).f43038h;
                do {
                    value5 = i2Var8.getValue();
                } while (!i2Var8.i(value5, rs.j.a((rs.j) value5, userInput, false, false, null, 4094)));
                return Unit.f71706a;
            case 23:
                sr.f fVar = (sr.f) obj;
                FinancialConnectionsSheetLiteActivity financialConnectionsSheetLiteActivity = (FinancialConnectionsSheetLiteActivity) obj2;
                if (fVar instanceof sr.d) {
                    WebView webView = financialConnectionsSheetLiteActivity.o;
                    if (webView == null) {
                        Intrinsics.m("webView");
                        throw null;
                    }
                    webView.loadUrl(((sr.d) fVar).f87702a);
                } else if (fVar instanceof sr.c) {
                    FinancialConnectionsSheetActivityResult financialConnectionsSheetActivityResult = ((sr.c) fVar).f87701a;
                    int i19 = FinancialConnectionsSheetLiteActivity.f42693r;
                    financialConnectionsSheetLiteActivity.setResult(-1, new Intent().putExtras(w.b.a(new Pair("com.stripe.android.financialconnections.ConnectionsSheetContract.extra_result", financialConnectionsSheetActivityResult))));
                    financialConnectionsSheetLiteActivity.finish();
                } else {
                    if (!(fVar instanceof sr.e)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    String str2 = ((sr.e) fVar).f87703a;
                    int i21 = FinancialConnectionsSheetLiteActivity.f42693r;
                    w.h hVar = new w.h();
                    Intent intent = hVar.f93401a;
                    intent.putExtra("android.support.customtabs.extra.TITLE_VISIBILITY", 1);
                    hVar.d();
                    intent.putExtra("org.chromium.chrome.browser.customtabs.EXTRA_DISABLE_STAR_BUTTON", true);
                    hVar.a().a(financialConnectionsSheetLiteActivity, Uri.parse(str2));
                }
                return Unit.f71706a;
            case 24:
                t5.c0 c0Var = (t5.c0) obj2;
                return ((c0Var.f88550h.n() instanceof n0) || (objE = t5.c0.e(c0Var, true, continuation)) != CoroutineSingletons.f71806a) ? Unit.f71706a : objE;
            case 25:
                String str3 = (String) obj;
                p1 p1Var = (p1) obj2;
                if (p1Var != null && (o1Var2 = p1Var.f72551c) != null) {
                    strA1 = r70.k.a1((String) o1Var2.f72523e.getValue(), ((z1) o1Var2.f72529k.f91586b.invoke()).c());
                }
                if ((strA1 == null || r70.k.U0(strA1)) && p1Var != null && (o1Var = p1Var.f72551c) != null && (i0Var = o1Var.f72528j) != null) {
                    i0Var.t(str3);
                }
                return Unit.f71706a;
            case 26:
                boolean zBooleanValue3 = ((Boolean) obj).booleanValue();
                CardBrandView cardBrandView = ((CardMultilineWidget) obj2).f45449c;
                i2 i2Var9 = cardBrandView.f45435d;
                do {
                    value6 = i2Var9.getValue();
                } while (!i2Var9.i(value6, CardBrandView.State.a((CardBrandView.State) value6, zBooleanValue3, null, null, null, 254)));
                cardBrandView.g(true);
                return Unit.f71706a;
            case 27:
                if (((Boolean) obj).booleanValue()) {
                    int i22 = PaymentAuthWebViewActivity.f45487s;
                    CircularProgressIndicator progressBar = ((PaymentAuthWebViewActivity) obj2).b0().f82830c;
                    Intrinsics.f(progressBar, "progressBar");
                    progressBar.setVisibility(8);
                }
                return Unit.f71706a;
            case 28:
                String str4 = (String) obj;
                return (str4 == null || (objH = ((xs.o) obj2).h(str4, continuation)) != CoroutineSingletons.f71806a) ? Unit.f71706a : objH;
            default:
                String str5 = (String) obj;
                if (str5 != null) {
                    ((com.stripe.android.paymentsheet.paymentdatacollection.ach.g) obj2).f44889p.f72528j.t(str5);
                }
                return Unit.f71706a;
        }
    }
}
