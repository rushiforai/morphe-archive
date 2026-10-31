package com.stripe.android.paymentsheet.paymentdatacollection.polling;

import android.content.Intent;
import android.os.Bundle;
import com.stripe.android.paymentsheet.paymentdatacollection.polling.PollingContract;
import dv.g;
import dv.h;
import dv.i;
import dv.r;
import dv.w;
import h6.h1;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import m.m;
import mk.v;
import ps.k;
import x1.e;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0006²\u0006\f\u0010\u0005\u001a\u00020\u00048\nX\u008a\u0084\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/paymentdatacollection/polling/PollingActivity;", "Lm/m;", "<init>", "()V", "Ldv/n;", "uiState", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class PollingActivity extends m {

    /* renamed from: r, reason: collision with root package name */
    public static final /* synthetic */ int f44935r = 0;
    public final a70.d o = LazyKt.a(new g(this, 0));

    /* renamed from: p, reason: collision with root package name */
    public final r f44936p = new r(new g(this, 1), 0);

    /* renamed from: q, reason: collision with root package name */
    public final h1 f44937q = new h1(Reflection.f71864a.getOrCreateKotlinClass(w.class), new i(this, 0), new g(this, 2), new i(this, 1));

    public final PollingContract.Args Z() {
        return (PollingContract.Args) this.o.getValue();
    }

    @Override // android.app.Activity
    public final void finish() {
        super.finish();
        k.l(this);
    }

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        Intrinsics.f(intent, "getIntent(...)");
        if (((PollingContract.Args) intent.getParcelableExtra("extra_args")) == null) {
            finish();
        } else {
            v.P(getWindow(), false);
            h.g.a(this, new e(new h(this, 1), true, -684927091));
        }
    }
}
