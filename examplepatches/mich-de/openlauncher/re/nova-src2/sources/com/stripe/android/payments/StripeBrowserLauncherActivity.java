package com.stripe.android.payments;

import a5.a1;
import a5.i;
import a5.s0;
import a80.e;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import androidx.activity.result.contract.ActivityResultContracts$StartActivityForResult;
import b70.h;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.stripe.android.auth.PaymentBrowserAuthContract;
import com.stripe.android.core.exception.LocalStripeException;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import cw.r3;
import du.r;
import du.s;
import du.u;
import fr.l;
import h6.h1;
import java.util.Map;
import java.util.WeakHashMap;
import jt.a;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptySet;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import m.m;
import mk.v;
import ps.i0;
import sd.t;
import t70.y0;
import xq.c;
import xq.d;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/payments/StripeBrowserLauncherActivity;", "Lm/m;", "<init>", "()V", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class StripeBrowserLauncherActivity extends m {

    /* renamed from: p, reason: collision with root package name */
    public static final /* synthetic */ int f44244p = 0;
    public final h1 o = new h1(Reflection.f71864a.getOrCreateKotlinClass(u.class), new s(this, 0), new r3(9), new s(this, 1));

    public final void Z(PaymentBrowserAuthContract.Args args) {
        Uri uri = Uri.parse(args.f42473d);
        Intent intent = new Intent();
        String str = args.f42472c;
        String lastPathSegment = uri.getLastPathSegment();
        if (lastPathSegment == null) {
            lastPathSegment = b.f42142b;
        }
        String str2 = args.f42477h;
        Intent intentPutExtras = intent.putExtras(new PaymentFlowResult$Unvalidated(str, 0, (StripeException) null, args.f42478i, lastPathSegment, str2, 38).b());
        Intrinsics.f(intentPutExtras, "putExtras(...)");
        setResult(-1, intentPutExtras);
        finish();
    }

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        PaymentAnalyticsEvent paymentAnalyticsEvent;
        t tVar;
        Intent intent;
        super.onCreate(bundle);
        Intent intent2 = getIntent();
        Intrinsics.f(intent2, "getIntent(...)");
        PaymentBrowserAuthContract.Args args = (PaymentBrowserAuthContract.Args) intent2.getParcelableExtra("extra_args");
        int i5 = 27;
        Map mapB = h.f17594a;
        c cVar = d.f96224b;
        if (args == null) {
            finish();
            Context applicationContext = getApplicationContext();
            Intrinsics.f(applicationContext, "getApplicationContext(...)");
            EmptySet productUsage = EmptySet.f71734a;
            Intrinsics.g(productUsage, "productUsage");
            Context applicationContext2 = applicationContext.getApplicationContext();
            Intrinsics.f(applicationContext2, "getApplicationContext(...)");
            e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            i0.i(dVar);
            l lVar = new l(cVar, dVar);
            a aVar = new a(applicationContext2, new ar.c(applicationContext2, i5), productUsage);
            iu.c cVar2 = iu.c.f68066s;
            Map additionalNonPiiParams = (6 & 4) != 0 ? mapB : null;
            Intrinsics.g(additionalNonPiiParams, "additionalNonPiiParams");
            lVar.a(aVar.a(cVar2, MapsKt.m0(mapB, additionalNonPiiParams)));
            return;
        }
        h1 h1Var = this.o;
        Boolean bool = (Boolean) ((u) h1Var.getValue()).f49589e.a("has_launched");
        int i11 = 0;
        if (bool != null ? bool.booleanValue() : false) {
            Z(args);
        } else {
            j.c cVarRegisterForActivityResult = registerForActivityResult(new ActivityResultContracts$StartActivityForResult(), new r(i11, this, args));
            u uVar = (u) h1Var.getValue();
            String str = args.f42473d;
            Uri uri = Uri.parse(str);
            yq.a aVar2 = uVar.f49587c;
            int iOrdinal = aVar2.ordinal();
            if (iOrdinal == 0) {
                paymentAnalyticsEvent = PaymentAnalyticsEvent.f44094x;
            } else {
                if (iOrdinal != 1) {
                    throw new NoWhenBranchMatchedException();
                }
                paymentAnalyticsEvent = PaymentAnalyticsEvent.f44095y;
            }
            uVar.f49585a.a(a.c(uVar.f49586b, paymentAnalyticsEvent, null, null, null, null, 62));
            int iOrdinal2 = aVar2.ordinal();
            if (iOrdinal2 == 0) {
                Intrinsics.d(uri);
                Integer num = args.f42480k;
                if (num != null) {
                    Integer numValueOf = Integer.valueOf(num.intValue() | (-16777216));
                    tVar = new t();
                    tVar.f87214a = numValueOf;
                } else {
                    tVar = null;
                }
                w.h hVar = new w.h();
                hVar.d();
                if (tVar != null) {
                    tVar.getClass();
                    Bundle bundle2 = new Bundle();
                    Integer num2 = tVar.f87214a;
                    if (num2 != null) {
                        bundle2.putInt("android.support.customtabs.extra.TOOLBAR_COLOR", num2.intValue());
                    }
                    hVar.f93404d = bundle2;
                }
                intent = hVar.a().f93407a;
                intent.setData(uri);
            } else {
                if (iOrdinal2 != 1) {
                    throw new NoWhenBranchMatchedException();
                }
                intent = new Intent("android.intent.action.VIEW", uri);
            }
            try {
                cVarRegisterForActivityResult.a(intent, null);
                ((u) h1Var.getValue()).f49589e.d("has_launched", Boolean.TRUE);
            } catch (ActivityNotFoundException e3) {
                Context applicationContext3 = getApplicationContext();
                Intrinsics.f(applicationContext3, "getApplicationContext(...)");
                EmptySet productUsage2 = EmptySet.f71734a;
                Intrinsics.g(productUsage2, "productUsage");
                Context applicationContext4 = applicationContext3.getApplicationContext();
                Intrinsics.f(applicationContext4, "getApplicationContext(...)");
                e eVar2 = y0.f88884a;
                a80.d dVar2 = a80.d.f488c;
                i0.i(dVar2);
                l lVar2 = new l(cVar, dVar2);
                a aVar3 = new a(applicationContext4, new ar.c(applicationContext4, 27), productUsage2);
                iu.c cVar3 = iu.c.f68065r;
                int i12 = StripeException.f42562e;
                StripeException stripeExceptionI = p6.u.i(e3);
                if ((4 & 2) != 0) {
                    stripeExceptionI = null;
                }
                Map additionalNonPiiParams2 = (4 & 4) != 0 ? mapB : null;
                Intrinsics.g(additionalNonPiiParams2, "additionalNonPiiParams");
                if (stripeExceptionI != null) {
                    mapB = iu.a.b(stripeExceptionI);
                }
                lVar2.a(aVar3.a(cVar3, MapsKt.m0(mapB, additionalNonPiiParams2)));
                u uVar2 = (u) h1Var.getValue();
                Uri uri2 = Uri.parse(str);
                LocalStripeException localStripeException = new LocalStripeException(uVar2.f49588d, "failedBrowserLaunchError");
                Intent intent3 = new Intent();
                String str2 = args.f42472c;
                String lastPathSegment = uri2.getLastPathSegment();
                if (lastPathSegment == null) {
                    lastPathSegment = b.f42142b;
                }
                Intent intentPutExtras = intent3.putExtras(new PaymentFlowResult$Unvalidated(str2, 2, localStripeException, args.f42478i, lastPathSegment, args.f42477h, 32).b());
                Intrinsics.f(intentPutExtras, "putExtras(...)");
                setResult(-1, intentPutExtras);
                finish();
            }
        }
        v.P(getWindow(), false);
        View viewFindViewById = findViewById(16908290);
        i iVar = new i(14);
        WeakHashMap weakHashMap = a1.f250a;
        s0.l(viewFindViewById, iVar);
    }
}
