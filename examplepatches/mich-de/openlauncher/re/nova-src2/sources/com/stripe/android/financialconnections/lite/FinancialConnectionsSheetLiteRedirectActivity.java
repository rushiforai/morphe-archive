package com.stripe.android.financialconnections.lite;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import g.o;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/financialconnections/lite/FinancialConnectionsSheetLiteRedirectActivity;", "Lg/o;", "<init>", "()V", "financial-connections-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class FinancialConnectionsSheetLiteRedirectActivity extends o {
    @Override // g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        Intent flags;
        super.onCreate(bundle);
        Uri data = getIntent().getData();
        if (data != null) {
            Class cls = !Intrinsics.b(data.getScheme(), "stripe") ? null : FinancialConnectionsSheetLiteActivity.class;
            Intent intent = cls != null ? new Intent(this, cls) : null;
            if (intent == null || (flags = intent.setFlags(603979776)) == null) {
                return;
            }
            flags.setData(data);
            startActivity(flags);
        }
    }
}
