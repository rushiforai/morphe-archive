package com.stripe.android.link;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/link/LinkRedirectHandlerActivity;", "Lm/m;", "<init>", "()V", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class LinkRedirectHandlerActivity extends m.m {
    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Uri data = getIntent().getData();
        Intent intent = new Intent(this, (Class<?>) LinkForegroundActivity.class);
        intent.setAction("LinkForegroundActivity.redirect");
        intent.setData(data);
        intent.addFlags(603979776);
        startActivity(intent);
        finish();
    }
}
