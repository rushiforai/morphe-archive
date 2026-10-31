package androidx.credentials.playservices.controllers.identitycredentials;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.os.ResultReceiver;
import k5.a;
import k5.c;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0017\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Landroidx/credentials/playservices/controllers/identitycredentials/IdentityCredentialApiHiddenActivity;", "Landroid/app/Activity;", "<init>", "()V", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes2.dex */
public class IdentityCredentialApiHiddenActivity extends Activity {

    /* renamed from: a, reason: collision with root package name */
    public ResultReceiver f14268a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f14269b;

    @Override // android.app.Activity
    public final void onActivityResult(int i5, int i11, Intent intent) {
        super.onActivityResult(i5, i11, intent);
        ResultReceiver resultReceiver = this.f14268a;
        if (resultReceiver != null) {
            a aVar = c.f71100c;
            a.c(resultReceiver, i5, i11, intent);
        }
        this.f14269b = false;
        finish();
    }

    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) throws IntentSender.SendIntentException {
        super.onCreate(bundle);
        overridePendingTransition(0, 0);
        ResultReceiver resultReceiver = (ResultReceiver) getIntent().getParcelableExtra("RESULT_RECEIVER");
        this.f14268a = resultReceiver;
        if (resultReceiver == null) {
            finish();
        }
        String stringExtra = getIntent().getStringExtra("EXTRA_ERROR_NAME");
        if (stringExtra == null) {
            finish();
            return;
        }
        if (bundle != null) {
            this.f14269b = bundle.getBoolean("androidx.credentials.playservices.AWAITING_RESULT", false);
        }
        if (this.f14269b) {
            return;
        }
        PendingIntent pendingIntent = (PendingIntent) getIntent().getParcelableExtra("EXTRA_FLOW_PENDING_INTENT");
        if (pendingIntent != null) {
            this.f14269b = true;
            startIntentSenderForResult(pendingIntent.getIntentSender(), c.f71102e, null, 0, 0, 0, null);
            return;
        }
        ResultReceiver resultReceiver2 = this.f14268a;
        if (resultReceiver2 != null) {
            a aVar = c.f71100c;
            a.b(resultReceiver2, stringExtra, "Internal error");
        }
        finish();
    }

    @Override // android.app.Activity
    public final void onSaveInstanceState(Bundle outState) {
        Intrinsics.g(outState, "outState");
        outState.putBoolean("androidx.credentials.playservices.AWAITING_RESULT", this.f14269b);
        super.onSaveInstanceState(outState);
    }
}
