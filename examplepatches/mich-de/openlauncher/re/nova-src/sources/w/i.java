package w;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

/* loaded from: classes2.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final Intent f93407a;

    /* renamed from: b, reason: collision with root package name */
    public final Bundle f93408b;

    public i(Intent intent, Bundle bundle) {
        this.f93407a = intent;
        this.f93408b = bundle;
    }

    public final void a(Context context, Uri uri) {
        Intent intent = this.f93407a;
        intent.setData(uri);
        context.startActivity(intent, this.f93408b);
    }
}
