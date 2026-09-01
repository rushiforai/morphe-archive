package androidx.credentials.playservices.controllers.identitycredentials;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.os.ResultReceiver;
import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0017\u0018\u0000 \u00192\u00020\u0001:\u0001\u0019B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0019\u0010\u0007\u001a\u00020\u00062\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0019\u0010\t\u001a\u00020\u00062\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0014¢\u0006\u0004\b\t\u0010\bJ\u0017\u0010\u000b\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u0004H\u0014¢\u0006\u0004\b\u000b\u0010\bJ)\u0010\u0011\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0014¢\u0006\u0004\b\u0011\u0010\u0012R\u0018\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0014\u0010\u0015R\u0016\u0010\u0017\u001a\u00020\u00168\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0017\u0010\u0018¨\u0006\u001a"}, d2 = {"Landroidx/credentials/playservices/controllers/identitycredentials/IdentityCredentialApiHiddenActivity;", "Landroid/app/Activity;", "<init>", "()V", "Landroid/os/Bundle;", "savedInstanceState", "Lc1e;", "restoreState", "(Landroid/os/Bundle;)V", "onCreate", "outState", "onSaveInstanceState", "", "requestCode", "resultCode", "Landroid/content/Intent;", "data", "onActivityResult", "(IILandroid/content/Intent;)V", "Landroid/os/ResultReceiver;", "resultReceiver", "Landroid/os/ResultReceiver;", "", "mWaitingForActivityResult", "Z", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public class IdentityCredentialApiHiddenActivity extends Activity {
    private static final String KEY_AWAITING_RESULT = "androidx.credentials.playservices.AWAITING_RESULT";
    private boolean mWaitingForActivityResult;
    private ResultReceiver resultReceiver;

    private final void restoreState(Bundle savedInstanceState) {
        if (savedInstanceState != null) {
            this.mWaitingForActivityResult = savedInstanceState.getBoolean(KEY_AWAITING_RESULT, false);
        }
    }

    @Override // android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        ResultReceiver resultReceiver = this.resultReceiver;
        if (resultReceiver != null) {
            CredentialProviderBaseController.INSTANCE.reportResult$credentials_play_services_auth(resultReceiver, requestCode, resultCode, data);
        }
        this.mWaitingForActivityResult = false;
        finish();
    }

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) throws IntentSender.SendIntentException {
        super.onCreate(savedInstanceState);
        overridePendingTransition(0, 0);
        ResultReceiver resultReceiver = (ResultReceiver) getIntent().getParcelableExtra(CredentialProviderBaseController.RESULT_RECEIVER_TAG);
        this.resultReceiver = resultReceiver;
        if (resultReceiver == null) {
            finish();
        }
        String stringExtra = getIntent().getStringExtra(CredentialProviderBaseController.EXTRA_ERROR_NAME);
        if (stringExtra == null) {
            finish();
            return;
        }
        restoreState(savedInstanceState);
        if (this.mWaitingForActivityResult) {
            return;
        }
        PendingIntent pendingIntent = (PendingIntent) getIntent().getParcelableExtra(CredentialProviderBaseController.EXTRA_FLOW_PENDING_INTENT);
        if (pendingIntent != null) {
            this.mWaitingForActivityResult = true;
            startIntentSenderForResult(pendingIntent.getIntentSender(), CredentialProviderBaseController.INSTANCE.getCONTROLLER_REQUEST_CODE$credentials_play_services_auth(), null, 0, 0, 0, null);
        } else {
            ResultReceiver resultReceiver2 = this.resultReceiver;
            if (resultReceiver2 != null) {
                CredentialProviderBaseController.INSTANCE.reportError$credentials_play_services_auth(resultReceiver2, stringExtra, "Internal error");
            }
            finish();
        }
    }

    @Override // android.app.Activity
    public void onSaveInstanceState(Bundle outState) {
        outState.getClass();
        outState.putBoolean(KEY_AWAITING_RESULT, this.mWaitingForActivityResult);
        super.onSaveInstanceState(outState);
    }
}
