package com.stripe.android.paymentsheet.addresselement;

import android.content.Intent;
import android.os.Bundle;
import com.stripe.android.paymentsheet.addresselement.AutocompleteContract;
import h6.h1;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AutocompleteActivity;", "Lm/m;", "<init>", "()V", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class AutocompleteActivity extends m.m {

    /* renamed from: q, reason: collision with root package name */
    public static final /* synthetic */ int f44706q = 0;
    public final a70.d o = LazyKt.a(new pu.l(this, 0));

    /* renamed from: p, reason: collision with root package name */
    public final h1 f44707p = new h1(Reflection.f71864a.getOrCreateKotlinClass(pu.z.class), new pu.n(this, 0), new pu.l(this, 1), new pu.n(this, 1));

    public final void Z(AutocompleteContract.Result result) {
        setResult(-1, new Intent().putExtras(w.b.a(new Pair("com.stripe.android.paymentsheet.addresselement.AutocompleteContract.extra_result", result))));
    }

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        AutocompleteContract.Args args = (AutocompleteContract.Args) this.o.getValue();
        if (args == null) {
            finish();
            return;
        }
        mk.v.P(getWindow(), false);
        AutocompleteAppearanceContext autocompleteAppearanceContext = args.f44714d;
        autocompleteAppearanceContext.m0();
        h.g.a(this, new x1.e(new r(this, args, autocompleteAppearanceContext), true, -854911592));
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onStop() {
        String str;
        super.onStop();
        if (isFinishing() || isChangingConfigurations()) {
            return;
        }
        AutocompleteContract.Args args = (AutocompleteContract.Args) this.o.getValue();
        if (args == null || (str = args.f44711a) == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Z(new AutocompleteContract.Result.Address(str, null));
        finish();
    }
}
