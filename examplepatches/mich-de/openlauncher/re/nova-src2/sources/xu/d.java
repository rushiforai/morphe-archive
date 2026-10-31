package xu;

import ab.e0;
import android.app.ActivityOptions;
import android.app.Application;
import android.app.PendingIntent;
import android.app.RemoteAction;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.google.android.material.progressindicator.CircularProgressIndicator;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.uicore.elements.IdentifierSpec;
import hv.l4;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96331a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f96332b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f96331a = i5;
        this.f96332b = obj;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws PendingIntent.CanceledException {
        ok.m mVar;
        PaymentSheet$BillingDetails paymentSheet$BillingDetails;
        String str;
        String str2;
        String str3;
        String str4;
        String str5;
        String str6;
        switch (this.f96331a) {
            case 0:
                ((f) this.f96332b).c();
                return Unit.f71706a;
            case 1:
                ((r) this.f96332b).f96384a.b(l4.f60393d);
                return Unit.f71706a;
            case 2:
                Context context = (Application) ((xw.g) this.f96332b).f96471c.f88562b;
                synchronized (ok.a.class) {
                    try {
                        if (ok.a.f80453a == null) {
                            Context applicationContext = context.getApplicationContext();
                            if (applicationContext != null) {
                                context = applicationContext;
                            }
                            ok.a.f80453a = new ok.m(context);
                        }
                        mVar = ok.a.f80453a;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                ok.b bVar = (ok.b) mVar.f80485a.a();
                Intrinsics.f(bVar, "createStandard(...)");
                return bVar;
            case 3:
                return ((a1.k) this.f96332b).i();
            case 4:
                ((w0.g) this.f96332b).close();
                return Unit.f71706a;
            case 5:
                PendingIntent actionIntent = ((RemoteAction) this.f96332b).getActionIntent();
                if (Build.VERSION.SDK_INT >= 34) {
                    try {
                        actionIntent.send(ActivityOptions.makeBasic().setPendingIntentBackgroundActivityStartMode(1).toBundle());
                    } catch (PendingIntent.CanceledException e3) {
                        Log.e("TextClassification", "error sending pendingIntent: " + actionIntent + " error: " + e3);
                    }
                } else {
                    actionIntent.send();
                }
                return Unit.f71706a;
            case 6:
                y1.h hVar = (y1.h) this.f96332b;
                Bundle bundleA = w.b.a((Pair[]) Arrays.copyOf(new Pair[0], 0));
                hVar.f96572b.f441a.f(bundleA);
                if (bundleA.isEmpty()) {
                    return null;
                }
                return bundleA;
            case 7:
                yu.a aVar = (yu.a) this.f96332b;
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                if (aVar.f97654i.f44517e && (paymentSheet$BillingDetails = aVar.f97650e) != null) {
                    PaymentSheet$Address paymentSheet$Address = paymentSheet$BillingDetails.f44509a;
                    String str7 = paymentSheet$BillingDetails.f44511c;
                    if (str7 != null) {
                        IdentifierSpec.Companion.getClass();
                        linkedHashMap.put(IdentifierSpec.f45364e, str7);
                    }
                    String str8 = paymentSheet$BillingDetails.f44510b;
                    if (str8 != null) {
                        IdentifierSpec.Companion.getClass();
                        linkedHashMap.put(IdentifierSpec.f45372m, str8);
                    }
                    String str9 = paymentSheet$BillingDetails.f44512d;
                    if (str9 != null) {
                        IdentifierSpec.Companion.getClass();
                        linkedHashMap.put(IdentifierSpec.n, str9);
                    }
                    if (paymentSheet$Address != null && (str6 = paymentSheet$Address.f44449c) != null) {
                        IdentifierSpec.Companion.getClass();
                        linkedHashMap.put(IdentifierSpec.o, str6);
                    }
                    if (paymentSheet$Address != null && (str5 = paymentSheet$Address.f44450d) != null) {
                        IdentifierSpec.Companion.getClass();
                        linkedHashMap.put(IdentifierSpec.f45373p, str5);
                    }
                    if (paymentSheet$Address != null && (str4 = paymentSheet$Address.f44447a) != null) {
                        IdentifierSpec.Companion.getClass();
                        linkedHashMap.put(IdentifierSpec.f45374q, str4);
                    }
                    if (paymentSheet$Address != null && (str3 = paymentSheet$Address.f44452f) != null) {
                        IdentifierSpec.Companion.getClass();
                        linkedHashMap.put(IdentifierSpec.f45378u, str3);
                    }
                    if (paymentSheet$Address != null && (str2 = paymentSheet$Address.f44451e) != null) {
                        IdentifierSpec.Companion.getClass();
                        linkedHashMap.put(IdentifierSpec.f45376s, str2);
                    }
                    if (paymentSheet$Address != null && (str = paymentSheet$Address.f44448b) != null) {
                        IdentifierSpec.Companion.getClass();
                        linkedHashMap.put(IdentifierSpec.f45379v, str);
                    }
                }
                return MapsKt.s0(linkedHashMap);
            case 8:
                Iterator it = ((yw.a) this.f96332b).f18675e.iterator();
                while (it.hasNext()) {
                    ((yw.f) it.next()).d();
                }
                return Unit.f71706a;
            case 9:
                z0.f fVar = (z0.f) this.f96332b;
                return fVar.getIsAttached() ? p6.j.l(fVar) : w0.c.f93415b;
            case 10:
                return Integer.valueOf(((ArrayList) this.f96332b).size());
            default:
                View viewInflate = ((zv.t) this.f96332b).getLayoutInflater().inflate(2131624407, (ViewGroup) null, false);
                CircularProgressIndicator circularProgressIndicator = (CircularProgressIndicator) e0.x(2131428653, viewInflate);
                if (circularProgressIndicator != null) {
                    return new qv.b((FrameLayout) viewInflate, circularProgressIndicator);
                }
                throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428653)));
        }
    }
}
