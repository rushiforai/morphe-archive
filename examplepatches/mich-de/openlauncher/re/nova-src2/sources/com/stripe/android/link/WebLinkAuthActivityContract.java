package com.stripe.android.link;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import es.m0;
import es.n0;
import es.o0;
import java.io.Serializable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\t\b\u0002¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/link/WebLinkAuthActivityContract;", "Lk/b;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Les/p0;", "<init>", "()V", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class WebLinkAuthActivityContract extends k.b {

    /* renamed from: a, reason: collision with root package name */
    public static final WebLinkAuthActivityContract f42961a = new WebLinkAuthActivityContract();

    private WebLinkAuthActivityContract() {
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        String input = (String) obj;
        Intrinsics.g(input, "input");
        int i5 = LinkForegroundActivity.f42926p;
        Intent intentPutExtra = new Intent(context, (Class<?>) LinkForegroundActivity.class).putExtra("LinkPopupUrl", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Uri data;
        String queryParameter;
        Bundle extras;
        if (i5 != 0) {
            if (i5 != 49871) {
                if (i5 == 91367) {
                    Exception exc = null;
                    Serializable serializableB = null;
                    exc = null;
                    if (intent != null && (extras = intent.getExtras()) != null) {
                        if (Build.VERSION.SDK_INT >= 34) {
                            serializableB = w4.b.b(extras);
                        } else {
                            Serializable serializable = extras.getSerializable("LinkFailure");
                            if (Exception.class.isInstance(serializable)) {
                                serializableB = serializable;
                            }
                        }
                        exc = (Exception) serializableB;
                    }
                    if (exc != null) {
                        return new o0(exc);
                    }
                }
            } else if (intent != null && (data = intent.getData()) != null && (queryParameter = data.getQueryParameter("link_status")) != null && queryParameter.hashCode() == -599445191 && queryParameter.equals("complete")) {
                return n0.f52991a;
            }
        }
        return m0.f52990a;
    }
}
