package com.teslacoilsw.launcher.onboarding;

import android.os.Bundle;
import b10.j1;
import b10.k2;
import com.amplitude.core.events.Plan;
import h.g;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import m.m;
import mk.v;
import x1.e;
import yx.h;
import zy.c;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/launcher/onboarding/NovaPaywallActivity;", "Lm/m;", "<init>", "()V", "b10/i1", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class NovaPaywallActivity extends m {
    public static final /* synthetic */ int o = 0;

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        v.P(getWindow(), false);
        String stringExtra = getIntent().getStringExtra(Plan.AMP_PLAN_SOURCE);
        if (stringExtra == null) {
            stringExtra = "unknown";
        }
        String str = stringExtra;
        k2 k2Var = new k2(str);
        boolean booleanExtra = getIntent().getBooleanExtra("ai_mode", false);
        c cVar = c.f98823a;
        c.i("paywall_opened", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str), new Pair("ai_mode", Boolean.valueOf(booleanExtra))));
        h hVar = h.f97704a;
        h.g("paywall_opened", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, str), new Pair("ai_mode", Boolean.valueOf(booleanExtra))));
        g.a(this, new e(new j1(this, k2Var, str, booleanExtra, 1), true, 1876973124));
    }
}
