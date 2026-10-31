package com.instabridge.mobilesdk.internal.ui.screens;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.text.format.DateFormat;
import android.widget.Toast;
import androidx.compose.runtime.snapshots.SnapshotStateList;
import com.google.android.gms.internal.consent_sdk.c3;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.internal.ServiceGraph;
import com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost;
import com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel;
import com.stripe.android.link.LinkPaymentDetails;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import com.stripe.android.paymentelement.confirmation.ConfirmationMediator$Parameters;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.teslacoilsw.launcher.ai.NovaAiSettingsActivity;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefLandGridView;
import com.teslacoilsw.launcher.widget.NumberPicker;
import e00.t5;
import e00.w4;
import java.io.IOException;
import java.util.Calendar;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
import p1.y2;
import w70.g2;

/* loaded from: classes3.dex */
public final /* synthetic */ class t implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35864a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35865b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f35866c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f35867d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f35868e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f35869f;

    public /* synthetic */ t(h.k kVar, Context context, t70.j0 j0Var, Function0 function0, Function1 function1) {
        this.f35864a = 1;
        this.f35866c = kVar;
        this.f35867d = context;
        this.f35865b = j0Var;
        this.f35868e = function0;
        this.f35869f = function1;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws PackageManager.NameNotFoundException, IOException {
        int i5 = this.f35864a;
        int i11 = 29;
        int i12 = 1;
        Continuation continuation = null;
        Object obj = this.f35869f;
        Object obj2 = this.f35865b;
        Object obj3 = this.f35868e;
        Object obj4 = this.f35867d;
        Object obj5 = this.f35866c;
        switch (i5) {
            case 0:
                return CheckoutScreenKt.CheckoutScreen$lambda$28$lambda$22$lambda$21((t70.j0) obj2, (MobileFlowViewModel) obj5, (StripePaymentSheetHost) obj4, (ServiceGraph) obj3, (y2) obj);
            case 1:
                h.k kVar = (h.k) obj5;
                Context context = (Context) obj4;
                t70.j0 j0Var = (t70.j0) obj2;
                Function0 function0 = (Function0) obj3;
                Function1 function1 = (Function1) obj;
                if (Build.VERSION.SDK_INT >= 29) {
                    try {
                        kVar.a(DateFormat.format("yyyy-MM-dd_kk-mm", Calendar.getInstance()).toString() + ".novabackup", null);
                    } catch (ActivityNotFoundException unused) {
                        String[] strArr = {"com.google.android.documentsui", "com.android.documentsui"};
                        for (int i13 = 0; i13 < 2; i13++) {
                            String str = strArr[i13];
                            try {
                                context.getApplicationContext().getPackageManager().getPackageInfo(str, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                                Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS", Uri.fromParts("package", str, null));
                                intent.setFlags(276856832);
                                context.startActivity(intent);
                                Toast.makeText(context.getApplicationContext(), "Please enable your systems Files/Documents app to allow creating backup files.", 1).show();
                            } catch (Exception unused2) {
                            }
                        }
                        Toast.makeText(context.getApplicationContext(), "Please enable your systems Files/Documents app to allow creating backup files.", 1).show();
                    }
                } else {
                    mk.v.E(context, j0Var, new cw.c0(kVar, 10), function0, function1);
                }
                return Unit.f71706a;
            case 2:
                ((q00.l) obj5).setValue((e10.s1) ((p1.e1) obj2).getValue());
                ((q00.l) obj3).setValue((e10.s1) ((p1.e1) obj4).getValue());
                ((p1.e1) obj).setValue(Boolean.FALSE);
                return Unit.f71706a;
            case 3:
                t70.j0 j0Var2 = (t70.j0) obj2;
                p1.e1 e1Var = (p1.e1) obj5;
                SnapshotStateList snapshotStateList = (SnapshotStateList) obj4;
                SnapshotStateList snapshotStateList2 = (SnapshotStateList) obj3;
                Context context2 = (Context) obj;
                if (!((Boolean) e1Var.getValue()).booleanValue()) {
                    e1Var.setValue(Boolean.TRUE);
                    t70.m0.t(j0Var2, null, null, new w4(snapshotStateList, snapshotStateList2, context2, e1Var, null), 3);
                }
                return Unit.f71706a;
            case 4:
                Activity activity = (Activity) obj5;
                t5 t5Var = new t5((t70.j0) obj2, (Context) obj4, (p1.e1) obj3, (p1.e1) obj);
                c3 c3Var = ox.u.f81114c;
                if (c3Var == null) {
                    t5Var.invoke();
                } else {
                    c3Var.c(activity, new o2.f(13), new ae.h(i11, activity, t5Var), new k30.e(t5Var, 14));
                }
                return Unit.f71706a;
            case 5:
                e10.t0[] t0VarArr = (e10.t0[]) obj5;
                NumberPicker numberPicker = (NumberPicker) obj4;
                NumberPicker numberPicker2 = (NumberPicker) obj3;
                FancyPrefLandGridView fancyPrefLandGridView = (FancyPrefLandGridView) obj;
                int i14 = FancyPrefLandGridView.f46001e0;
                if (((AtomicBoolean) obj2).get()) {
                    t0VarArr[0] = new e10.t0(numberPicker.f46442l, numberPicker2.f46442l, false);
                } else {
                    t0VarArr[1] = new e10.t0(numberPicker.f46442l, numberPicker2.f46442l, false);
                }
                fancyPrefLandGridView.f46002d0 = t0VarArr[1];
                return t0VarArr[0];
            case 6:
                ((Function0) obj5).invoke();
                t70.m0.t((t70.j0) obj2, null, null, new dm.c((e20.d) obj4, (String) obj3, (Context) obj, null, 20), 3);
                return Unit.f71706a;
            case 7:
                t70.m0.t((t70.j0) obj2, null, null, new c0.g((Function1) obj5, (p1.e1) obj4, (p1.e1) obj3, (p1.e1) obj, null), 3);
                return Unit.f71706a;
            case 8:
                is.j jVar = (is.j) obj2;
                LinkPaymentDetails linkPaymentDetails = (LinkPaymentDetails) obj5;
                LinkAccount linkAccount = (LinkAccount) obj4;
                String str2 = (String) obj3;
                String str3 = (String) obj;
                String str4 = null;
                PaymentMethodMetadata paymentMethodMetadata = jVar.f68041b;
                if (linkPaymentDetails instanceof LinkPaymentDetails.New) {
                    return jVar.b(((LinkPaymentDetails.New) linkPaymentDetails).f42935a, linkAccount, str2, str3, paymentMethodMetadata);
                }
                if (!(linkPaymentDetails instanceof LinkPaymentDetails.Saved)) {
                    throw new NoWhenBranchMatchedException();
                }
                PaymentMethod paymentMethod = ((LinkPaymentDetails.Saved) linkPaymentDetails).f42940c;
                ft.d dVar = ft.d.f55925c;
                if (str2 != null && !jVar.f68040a.f42902h) {
                    str4 = str2;
                }
                return new ConfirmationHandler$Args(new PaymentMethodConfirmationOption.Saved(paymentMethod, new PaymentMethodOptionsParams.Card(2, dVar, str4), 28), paymentMethodMetadata);
            case 9:
                is.j jVar2 = (is.j) obj2;
                return jVar2.b((ConsumerPaymentDetails.PaymentDetails) obj5, (LinkAccount) obj4, (String) obj3, (String) obj, jVar2.f68041b);
            case 10:
                p1.e1 e1Var2 = (p1.e1) obj5;
                int i15 = l00.o.f72967p;
                e1Var2.setValue(Boolean.TRUE);
                t70.m0.t((t70.j0) obj2, null, null, new l00.i((a00.b) obj4, (l00.o) obj3, (Context) obj, e1Var2, null), 3);
                return Unit.f71706a;
            case 11:
                mt.g0 g0Var = (mt.g0) obj2;
                ConfirmationHandler$Option confirmationHandler$Option = (ConfirmationHandler$Option) obj5;
                ConfirmationHandler$Args confirmationHandler$Args = (ConfirmationHandler$Args) obj4;
                mt.c cVar = (mt.c) obj3;
                g0Var.f76755a.d(g0Var.f76758d, new ConfirmationMediator$Parameters(confirmationHandler$Option, confirmationHandler$Args, cVar.f76737c));
                g0Var.f76756b.a(obj, cVar.f76735a, confirmationHandler$Option, confirmationHandler$Args);
                return Unit.f71706a;
            case 12:
                t70.j0 j0Var3 = (t70.j0) obj2;
                p6.l0 l0Var = (p6.l0) obj4;
                Function1 function12 = (Function1) obj3;
                Function1 function13 = (Function1) obj;
                if (((Function3) obj5) != null) {
                    t70.m0.t(j0Var3, null, null, new ou.y1(function13, continuation, i12), 3);
                } else if (!l0Var.o()) {
                    function12.invoke(es.a.f52909a);
                }
                return Unit.f71706a;
            case 13:
                Function1 function14 = (Function1) obj2;
                Function0 function02 = (Function0) obj5;
                Pair pair = (Pair) obj4;
                Object obj6 = pair.f71683a;
                p1.e1 e1Var3 = (p1.e1) obj3;
                p1.e1 e1Var4 = (p1.e1) obj;
                try {
                    function14.invoke(new Pair(new e10.t0(Integer.parseInt((String) ((Pair) e1Var3.getValue()).f71683a), Integer.parseInt((String) ((Pair) e1Var3.getValue()).f71684b), false), new e10.t0(Integer.parseInt((String) ((Pair) e1Var4.getValue()).f71683a), Integer.parseInt((String) ((Pair) e1Var4.getValue()).f71684b), false)));
                    function02.invoke();
                } catch (Exception unused3) {
                    Object obj7 = pair.f71684b;
                    e1Var3.setValue(new Pair(String.valueOf(((e10.t0) obj6).f51821a), String.valueOf(((e10.t0) obj6).f51822b)));
                    e10.t0 t0Var = (e10.t0) obj7;
                    e1Var4.setValue(new Pair(String.valueOf(t0Var.f51821a), String.valueOf(t0Var.f51822b)));
                }
                return Unit.f71706a;
            case 14:
                Context context3 = (Context) obj3;
                l1.d1 d1Var = NovaAiSettingsActivity.f45697u;
                String strF1 = b70.g.f1(kotlin.collections.c.v0(new String[]{(String) obj2, (String) obj5, (String) obj4}), "\n", null, null, 0, null, 62);
                Object systemService = context3.getSystemService("clipboard");
                Intrinsics.e(systemService, "null cannot be cast to non-null type android.content.ClipboardManager");
                ((ClipboardManager) systemService).setPrimaryClip(ClipData.newPlainText("Nova AI account", strF1));
                Toast.makeText(context3, (String) obj, 0).show();
                return Unit.f71706a;
            case 15:
                return ((Function4) obj2).invoke(((g2) obj5).getValue(), ((g2) obj4).getValue(), ((g2) obj3).getValue(), ((g2) obj).getValue());
            default:
                ys.t0 t0Var2 = (ys.t0) obj5;
                Function1 function15 = (Function1) obj4;
                Function1 function16 = (Function1) obj3;
                t70.j0 j0Var4 = (t70.j0) obj2;
                Function1 function17 = (Function1) obj;
                if (t0Var2.f97569m.size() == 1) {
                    function15.invoke(t0Var2.f97569m.get(0));
                } else {
                    function16.invoke(new x1.e(new b10.h0(t0Var2, function15, j0Var4, function17), true, 1919072903));
                }
                return Unit.f71706a;
        }
    }

    public /* synthetic */ t(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i5) {
        this.f35864a = i5;
        this.f35865b = obj;
        this.f35866c = obj2;
        this.f35867d = obj3;
        this.f35868e = obj4;
        this.f35869f = obj5;
    }

    public /* synthetic */ t(Object obj, t70.j0 j0Var, Object obj2, Object obj3, Object obj4, int i5) {
        this.f35864a = i5;
        this.f35866c = obj;
        this.f35865b = j0Var;
        this.f35867d = obj2;
        this.f35868e = obj3;
        this.f35869f = obj4;
    }

    public /* synthetic */ t(ys.t0 t0Var, Function1 function1, Function1 function12, t70.j0 j0Var, Function1 function13) {
        this.f35864a = 16;
        this.f35866c = t0Var;
        this.f35867d = function1;
        this.f35868e = function12;
        this.f35865b = j0Var;
        this.f35869f = function13;
    }
}
