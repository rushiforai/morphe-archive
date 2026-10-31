package androidx.browser.auth;

import android.content.Context;
import android.content.Intent;
import io.sentry.hints.i;
import k.b;

/* loaded from: classes2.dex */
class AuthTabIntent$AuthenticateUserResultContract extends b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        return (Intent) obj;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        if (i5 == -1 && intent != null) {
            intent.getData();
        }
        return new i(24);
    }
}
