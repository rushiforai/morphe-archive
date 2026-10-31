package com.stripe.android.view;

import a5.a1;
import a5.s0;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import b70.h;
import com.stripe.android.auth.PaymentBrowserAuthContract;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.model.Source;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import com.stripe.android.view.PaymentAuthWebViewActivity;
import fr.l;
import h6.g1;
import h6.h1;
import java.util.Map;
import java.util.WeakHashMap;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.collections.EmptySet;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import l10.z;
import m.m;
import mk.v;
import n0.w;
import p3.i;
import ps.i0;
import r70.k;
import t70.m0;
import t70.y0;
import w70.i2;
import w70.u1;
import ww.e0;
import ww.g0;
import ww.h0;
import ww.j0;
import ww.k0;
import ww.l0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/view/PaymentAuthWebViewActivity;", "Lm/m;", "<init>", "()V", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class PaymentAuthWebViewActivity extends m {

    /* renamed from: s, reason: collision with root package name */
    public static final /* synthetic */ int f45487s = 0;
    public final a70.d o;

    /* renamed from: p, reason: collision with root package name */
    public final a70.d f45488p;

    /* renamed from: q, reason: collision with root package name */
    public final a70.d f45489q;

    /* renamed from: r, reason: collision with root package name */
    public final h1 f45490r;

    public PaymentAuthWebViewActivity() {
        final int i5 = 0;
        this.o = LazyKt.a(new Function0(this) { // from class: ww.f0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ PaymentAuthWebViewActivity f94773b;

            {
                this.f94773b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i11 = i5;
                PaymentAuthWebViewActivity paymentAuthWebViewActivity = this.f94773b;
                switch (i11) {
                    case 0:
                        int i12 = PaymentAuthWebViewActivity.f45487s;
                        return pr.d.a(paymentAuthWebViewActivity.getLayoutInflater());
                    case 1:
                        int i13 = PaymentAuthWebViewActivity.f45487s;
                        Intent intent = paymentAuthWebViewActivity.getIntent();
                        Intrinsics.f(intent, "getIntent(...)");
                        return (PaymentBrowserAuthContract.Args) intent.getParcelableExtra("extra_args");
                    case 2:
                        int i14 = PaymentAuthWebViewActivity.f45487s;
                        PaymentBrowserAuthContract.Args args = (PaymentBrowserAuthContract.Args) paymentAuthWebViewActivity.f45488p.getValue();
                        return (args == null || !args.f42475f) ? xq.d.f96224b : xq.d.f96223a;
                    default:
                        int i15 = PaymentAuthWebViewActivity.f45487s;
                        Application application = paymentAuthWebViewActivity.getApplication();
                        Intrinsics.f(application, "getApplication(...)");
                        xq.c cVarA0 = paymentAuthWebViewActivity.a0();
                        PaymentBrowserAuthContract.Args args2 = (PaymentBrowserAuthContract.Args) paymentAuthWebViewActivity.f45488p.getValue();
                        if (args2 != null) {
                            return new i0(application, cVarA0, args2);
                        }
                        throw new IllegalArgumentException("Required value was null.");
                }
            }
        });
        final int i11 = 1;
        this.f45488p = LazyKt.a(new Function0(this) { // from class: ww.f0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ PaymentAuthWebViewActivity f94773b;

            {
                this.f94773b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i112 = i11;
                PaymentAuthWebViewActivity paymentAuthWebViewActivity = this.f94773b;
                switch (i112) {
                    case 0:
                        int i12 = PaymentAuthWebViewActivity.f45487s;
                        return pr.d.a(paymentAuthWebViewActivity.getLayoutInflater());
                    case 1:
                        int i13 = PaymentAuthWebViewActivity.f45487s;
                        Intent intent = paymentAuthWebViewActivity.getIntent();
                        Intrinsics.f(intent, "getIntent(...)");
                        return (PaymentBrowserAuthContract.Args) intent.getParcelableExtra("extra_args");
                    case 2:
                        int i14 = PaymentAuthWebViewActivity.f45487s;
                        PaymentBrowserAuthContract.Args args = (PaymentBrowserAuthContract.Args) paymentAuthWebViewActivity.f45488p.getValue();
                        return (args == null || !args.f42475f) ? xq.d.f96224b : xq.d.f96223a;
                    default:
                        int i15 = PaymentAuthWebViewActivity.f45487s;
                        Application application = paymentAuthWebViewActivity.getApplication();
                        Intrinsics.f(application, "getApplication(...)");
                        xq.c cVarA0 = paymentAuthWebViewActivity.a0();
                        PaymentBrowserAuthContract.Args args2 = (PaymentBrowserAuthContract.Args) paymentAuthWebViewActivity.f45488p.getValue();
                        if (args2 != null) {
                            return new i0(application, cVarA0, args2);
                        }
                        throw new IllegalArgumentException("Required value was null.");
                }
            }
        });
        final int i12 = 2;
        this.f45489q = LazyKt.a(new Function0(this) { // from class: ww.f0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ PaymentAuthWebViewActivity f94773b;

            {
                this.f94773b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i112 = i12;
                PaymentAuthWebViewActivity paymentAuthWebViewActivity = this.f94773b;
                switch (i112) {
                    case 0:
                        int i122 = PaymentAuthWebViewActivity.f45487s;
                        return pr.d.a(paymentAuthWebViewActivity.getLayoutInflater());
                    case 1:
                        int i13 = PaymentAuthWebViewActivity.f45487s;
                        Intent intent = paymentAuthWebViewActivity.getIntent();
                        Intrinsics.f(intent, "getIntent(...)");
                        return (PaymentBrowserAuthContract.Args) intent.getParcelableExtra("extra_args");
                    case 2:
                        int i14 = PaymentAuthWebViewActivity.f45487s;
                        PaymentBrowserAuthContract.Args args = (PaymentBrowserAuthContract.Args) paymentAuthWebViewActivity.f45488p.getValue();
                        return (args == null || !args.f42475f) ? xq.d.f96224b : xq.d.f96223a;
                    default:
                        int i15 = PaymentAuthWebViewActivity.f45487s;
                        Application application = paymentAuthWebViewActivity.getApplication();
                        Intrinsics.f(application, "getApplication(...)");
                        xq.c cVarA0 = paymentAuthWebViewActivity.a0();
                        PaymentBrowserAuthContract.Args args2 = (PaymentBrowserAuthContract.Args) paymentAuthWebViewActivity.f45488p.getValue();
                        if (args2 != null) {
                            return new i0(application, cVarA0, args2);
                        }
                        throw new IllegalArgumentException("Required value was null.");
                }
            }
        });
        final int i13 = 3;
        this.f45490r = new h1(Reflection.f71864a.getOrCreateKotlinClass(k0.class), new h0(this, 0), new Function0(this) { // from class: ww.f0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ PaymentAuthWebViewActivity f94773b;

            {
                this.f94773b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i112 = i13;
                PaymentAuthWebViewActivity paymentAuthWebViewActivity = this.f94773b;
                switch (i112) {
                    case 0:
                        int i122 = PaymentAuthWebViewActivity.f45487s;
                        return pr.d.a(paymentAuthWebViewActivity.getLayoutInflater());
                    case 1:
                        int i132 = PaymentAuthWebViewActivity.f45487s;
                        Intent intent = paymentAuthWebViewActivity.getIntent();
                        Intrinsics.f(intent, "getIntent(...)");
                        return (PaymentBrowserAuthContract.Args) intent.getParcelableExtra("extra_args");
                    case 2:
                        int i14 = PaymentAuthWebViewActivity.f45487s;
                        PaymentBrowserAuthContract.Args args = (PaymentBrowserAuthContract.Args) paymentAuthWebViewActivity.f45488p.getValue();
                        return (args == null || !args.f42475f) ? xq.d.f96224b : xq.d.f96223a;
                    default:
                        int i15 = PaymentAuthWebViewActivity.f45487s;
                        Application application = paymentAuthWebViewActivity.getApplication();
                        Intrinsics.f(application, "getApplication(...)");
                        xq.c cVarA0 = paymentAuthWebViewActivity.a0();
                        PaymentBrowserAuthContract.Args args2 = (PaymentBrowserAuthContract.Args) paymentAuthWebViewActivity.f45488p.getValue();
                        if (args2 != null) {
                            return new i0(application, cVarA0, args2);
                        }
                        throw new IllegalArgumentException("Required value was null.");
                }
            }
        }, new h0(this, 1));
    }

    public final void Z() {
        k0 k0VarC0 = c0();
        Intent intent = new Intent();
        String str = k0VarC0.e().f44237a;
        PaymentBrowserAuthContract.Args args = k0VarC0.f94793a;
        int i5 = args.f42479j ? 3 : 0;
        StripeException stripeException = k0VarC0.e().f44239c;
        boolean z11 = args.f42478i;
        String str2 = k0VarC0.e().f44241e;
        k0VarC0.e();
        Intent intentPutExtras = intent.putExtras(new PaymentFlowResult$Unvalidated(str, i5, stripeException, z11, str2, (Source) null, k0VarC0.e().f44243g).b());
        Intrinsics.f(intentPutExtras, "putExtras(...)");
        setResult(-1, intentPutExtras);
        finish();
    }

    public final xq.c a0() {
        return (xq.c) this.f45489q.getValue();
    }

    public final pr.d b0() {
        return (pr.d) this.o.getValue();
    }

    public final k0 c0() {
        return (k0) this.f45490r.getValue();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r11v0, types: [kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r11v2, types: [java.lang.Object, java.util.Map] */
    /* JADX WARN: Type inference failed for: r11v3 */
    /* JADX WARN: Type inference failed for: r1v27 */
    /* JADX WARN: Type inference failed for: r1v34 */
    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        v.P(getWindow(), false);
        CoordinatorLayout coordinatorLayout = b0().f82828a;
        wm.b bVar = new wm.b(this, 3);
        WeakHashMap weakHashMap = a1.f250a;
        s0.l(coordinatorLayout, bVar);
        PaymentBrowserAuthContract.Args args = (PaymentBrowserAuthContract.Args) this.f45488p.getValue();
        int i5 = 27;
        h hVar = h.f17594a;
        xq.c cVar = xq.d.f96224b;
        if (args == null) {
            setResult(0);
            finish();
            Context applicationContext = getApplicationContext();
            Intrinsics.f(applicationContext, "getApplicationContext(...)");
            EmptySet productUsage = EmptySet.f71734a;
            Intrinsics.g(productUsage, "productUsage");
            Context applicationContext2 = applicationContext.getApplicationContext();
            Intrinsics.f(applicationContext2, "getApplicationContext(...)");
            a80.e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            i0.i(dVar);
            l lVar = new l(cVar, dVar);
            jt.a aVar = new jt.a(applicationContext2, new ar.c(applicationContext2, i5), productUsage);
            iu.c cVar2 = iu.c.f68052c;
            h additionalNonPiiParams = (6 & 4) != 0 ? hVar : null;
            Intrinsics.g(additionalNonPiiParams, "additionalNonPiiParams");
            lVar.a(aVar.a(cVar2, MapsKt.m0(hVar, additionalNonPiiParams)));
            return;
        }
        a0().a("PaymentAuthWebViewActivity#onCreate()");
        setContentView(b0().f82828a);
        setSupportActionBar(b0().f82831d);
        a0().a("PaymentAuthWebViewActivity#customizeToolbar()");
        j0 j0Var = c0().f94798f;
        if (j0Var != null) {
            a0().a("PaymentAuthWebViewActivity#customizeToolbar() - updating toolbar title");
            b0().f82831d.A(i.n(this, j0Var.f94789a, j0Var.f94790b));
        }
        String str = c0().f94799g;
        if (str != null) {
            a0().a("PaymentAuthWebViewActivity#customizeToolbar() - updating toolbar background color");
            int color = Color.parseColor(str);
            b0().f82831d.setBackgroundColor(color);
            if (Build.VERSION.SDK_INT <= 34) {
                getWindow().setStatusBarColor(color);
            }
        }
        com.google.android.gms.internal.consent_sdk.k0.f(getOnBackPressedDispatcher(), null, new z(this, 29), 3);
        String str2 = args.f42472c;
        Intent intentPutExtras = new Intent().putExtras(c0().e().b());
        Intrinsics.f(intentPutExtras, "putExtras(...)");
        setResult(-1, intentPutExtras);
        if (!k.U0(str2)) {
            a0().a("PaymentAuthWebViewActivity#onCreate() - PaymentAuthWebView init and loadUrl");
            i2 i2VarC = u1.c(Boolean.FALSE);
            m0.t(g1.e(this), null, null, new tx.h0(i2VarC, this, (Continuation) additionalNonPiiParams, 15), 3);
            int i11 = 0;
            int i12 = 1;
            l0 l0Var = new l0(a0(), i2VarC, str2, args.f42474e, new g0(i12, this, PaymentAuthWebViewActivity.class, "startActivity", "startActivity(Landroid/content/Intent;)V", i11, 0), new g0(i12, this, PaymentAuthWebViewActivity.class, "onAuthComplete", "onAuthComplete$payments_core_release(Ljava/lang/Throwable;)V", i11, 1));
            b0().f82832e.f45486a = new w(l0Var, 28);
            b0().f82832e.setWebViewClient(l0Var);
            b0().f82832e.setWebChromeClient(new e0(this, a0()));
            k0 k0VarC0 = c0();
            fr.b bVarC = jt.a.c(k0VarC0.f94795c, PaymentAnalyticsEvent.f44090t, null, null, null, null, 62);
            l lVar2 = k0VarC0.f94794b;
            lVar2.a(bVarC);
            lVar2.a(jt.a.c(k0VarC0.f94795c, PaymentAnalyticsEvent.f44093w, null, null, null, null, 62));
            b0().f82832e.loadUrl(args.f42473d, (Map) c0().f94796d.getValue());
            return;
        }
        a0().a("PaymentAuthWebViewActivity#onCreate() - clientSecret is blank");
        finish();
        Context applicationContext3 = getApplicationContext();
        Intrinsics.f(applicationContext3, "getApplicationContext(...)");
        EmptySet productUsage2 = EmptySet.f71734a;
        Intrinsics.g(productUsage2, "productUsage");
        Context applicationContext4 = applicationContext3.getApplicationContext();
        Intrinsics.f(applicationContext4, "getApplicationContext(...)");
        a80.e eVar2 = y0.f88884a;
        a80.d dVar2 = a80.d.f488c;
        i0.i(dVar2);
        l lVar3 = new l(cVar, dVar2);
        jt.a aVar2 = new jt.a(applicationContext4, new ar.c(applicationContext4, i5), productUsage2);
        iu.e eVar3 = iu.e.f68087b;
        additionalNonPiiParams = (6 & 4) != 0 ? hVar : 0;
        Intrinsics.g(additionalNonPiiParams, "additionalNonPiiParams");
        lVar3.a(aVar2.a(eVar3, MapsKt.m0(hVar, additionalNonPiiParams)));
    }

    @Override // android.app.Activity
    public final boolean onCreateOptionsMenu(Menu menu) {
        Intrinsics.g(menu, "menu");
        a0().a("PaymentAuthWebViewActivity#onCreateOptionsMenu()");
        getMenuInflater().inflate(2131755018, menu);
        String str = c0().f94797e;
        if (str != null) {
            a0().a("PaymentAuthWebViewActivity#customizeToolbar() - updating close button text");
            menu.findItem(2131427406).setTitle(str);
        }
        return super.onCreateOptionsMenu(menu);
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onDestroy() {
        b0().f82833f.removeAllViews();
        b0().f82832e.destroy();
        super.onDestroy();
    }

    @Override // android.app.Activity
    public final boolean onOptionsItemSelected(MenuItem item) {
        Intrinsics.g(item, "item");
        a0().a("PaymentAuthWebViewActivity#onOptionsItemSelected()");
        if (item.getItemId() != 2131427406) {
            return super.onOptionsItemSelected(item);
        }
        Z();
        return true;
    }
}
