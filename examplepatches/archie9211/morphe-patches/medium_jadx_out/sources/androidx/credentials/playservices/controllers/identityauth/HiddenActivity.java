package androidx.credentials.playservices.controllers.identityauth;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.util.Log;
import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import androidx.work.impl.yX.VrhD;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0017\u0018\u0000 &2\u00020\u0001:\u0001&B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0019\u0010\u0007\u001a\u00020\u00062\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0002¢\u0006\u0004\b\u0007\u0010\bJ'\u0010\u000e\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u0017\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u0010\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u001f\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u0010\u001a\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u0013H\u0002¢\u0006\u0004\b\u0015\u0010\u0016J\u0017\u0010\u0017\u001a\u00020\u00062\u0006\u0010\u0010\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\u0017\u0010\u0012J\u0019\u0010\u0018\u001a\u00020\u00062\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0014¢\u0006\u0004\b\u0018\u0010\bJ\u0017\u0010\u001a\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\u0004H\u0014¢\u0006\u0004\b\u001a\u0010\bJ)\u0010 \u001a\u00020\u00062\u0006\u0010\u001c\u001a\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001b2\b\u0010\u001f\u001a\u0004\u0018\u00010\u001eH\u0014¢\u0006\u0004\b \u0010!R\u0018\u0010\n\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\n\u0010\"R\u0016\u0010$\u001a\u00020#8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b$\u0010%¨\u0006'"}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/HiddenActivity;", "Landroid/app/Activity;", "<init>", "()V", "Landroid/os/Bundle;", "savedInstanceState", "Lc1e;", "restoreState", "(Landroid/os/Bundle;)V", "Landroid/os/ResultReceiver;", "resultReceiver", "", "errName", "errMsg", "setupFailure", "(Landroid/os/ResultReceiver;Ljava/lang/String;Ljava/lang/String;)V", "type", "handleCredentialFlow", "(Ljava/lang/String;)V", "Landroid/content/IntentSender$SendIntentException;", "e", "setupIntentSenderFailureByType", "(Ljava/lang/String;Landroid/content/IntentSender$SendIntentException;)V", "setupPendingIntentFailureByType", "onCreate", "outState", "onSaveInstanceState", "", "requestCode", "resultCode", "Landroid/content/Intent;", "data", "onActivityResult", "(IILandroid/content/Intent;)V", "Landroid/os/ResultReceiver;", "", "mWaitingForActivityResult", "Z", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public class HiddenActivity extends Activity {
    private static final int DEFAULT_VALUE = 1;
    private static final String KEY_AWAITING_RESULT = "androidx.credentials.playservices.AWAITING_RESULT";
    private static final String TAG = "HiddenActivity";
    private boolean mWaitingForActivityResult;
    private ResultReceiver resultReceiver;

    private final void handleCredentialFlow(String type) {
        HiddenActivity hiddenActivity;
        PendingIntent pendingIntent = (PendingIntent) getIntent().getParcelableExtra(CredentialProviderBaseController.EXTRA_FLOW_PENDING_INTENT);
        int intExtra = getIntent().getIntExtra(CredentialProviderBaseController.ACTIVITY_REQUEST_CODE_TAG, 1);
        if (pendingIntent == null) {
            setupPendingIntentFailureByType(type);
            return;
        }
        try {
            this.mWaitingForActivityResult = true;
            hiddenActivity = this;
            try {
                hiddenActivity.startIntentSenderForResult(pendingIntent.getIntentSender(), intExtra, null, 0, 0, 0, null);
            } catch (IntentSender.SendIntentException e) {
                e = e;
                hiddenActivity.setupIntentSenderFailureByType(type, e);
            }
        } catch (IntentSender.SendIntentException e2) {
            e = e2;
            hiddenActivity = this;
        }
    }

    private final void restoreState(Bundle savedInstanceState) {
        if (savedInstanceState != null) {
            this.mWaitingForActivityResult = savedInstanceState.getBoolean(KEY_AWAITING_RESULT, false);
        }
    }

    private final void setupFailure(ResultReceiver resultReceiver, String errName, String errMsg) {
        CredentialProviderBaseController.INSTANCE.reportError$credentials_play_services_auth(resultReceiver, errName, errMsg);
        finish();
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    private final void setupPendingIntentFailureByType(String type) {
        switch (type.hashCode()) {
            case -441061071:
                if (type.equals(CredentialProviderBaseController.BEGIN_SIGN_IN_TAG)) {
                    ResultReceiver resultReceiver = this.resultReceiver;
                    resultReceiver.getClass();
                    setupFailure(resultReceiver, CredentialProviderBaseController.GET_UNKNOWN, "internal error during the begin sign in operation");
                    break;
                }
                break;
            case 15545322:
                if (type.equals(CredentialProviderBaseController.CREATE_PUBLIC_KEY_CREDENTIAL_TAG)) {
                    ResultReceiver resultReceiver2 = this.resultReceiver;
                    resultReceiver2.getClass();
                    setupFailure(resultReceiver2, CredentialProviderBaseController.CREATE_UNKNOWN, "internal error during public key credential creation");
                    break;
                }
                break;
            case 1246634622:
                if (type.equals(CredentialProviderBaseController.CREATE_PASSWORD_TAG)) {
                    ResultReceiver resultReceiver3 = this.resultReceiver;
                    resultReceiver3.getClass();
                    setupFailure(resultReceiver3, CredentialProviderBaseController.CREATE_UNKNOWN, "internal error during password creation");
                    break;
                }
                break;
            case 1980564212:
                if (type.equals(CredentialProviderBaseController.SIGN_IN_INTENT_TAG)) {
                    ResultReceiver resultReceiver4 = this.resultReceiver;
                    resultReceiver4.getClass();
                    setupFailure(resultReceiver4, CredentialProviderBaseController.GET_UNKNOWN, "internal error during the sign-in intent operation");
                    break;
                }
                break;
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
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        overridePendingTransition(0, 0);
        String stringExtra = getIntent().getStringExtra(CredentialProviderBaseController.TYPE_TAG);
        ResultReceiver resultReceiver = (ResultReceiver) getIntent().getParcelableExtra(CredentialProviderBaseController.RESULT_RECEIVER_TAG);
        this.resultReceiver = resultReceiver;
        if (resultReceiver == null) {
            finish();
        }
        restoreState(savedInstanceState);
        if (this.mWaitingForActivityResult) {
            return;
        }
        if (stringExtra != null) {
            handleCredentialFlow(stringExtra);
        } else {
            Log.w(TAG, "Activity handed an unsupported type");
            finish();
        }
    }

    @Override // android.app.Activity
    public void onSaveInstanceState(Bundle outState) {
        outState.getClass();
        outState.putBoolean(KEY_AWAITING_RESULT, this.mWaitingForActivityResult);
        super.onSaveInstanceState(outState);
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    private final void setupIntentSenderFailureByType(String type, IntentSender.SendIntentException e) {
        int iHashCode = type.hashCode();
        String str = VrhD.sFxXZIdCCrX;
        switch (iHashCode) {
            case -441061071:
                if (type.equals(CredentialProviderBaseController.BEGIN_SIGN_IN_TAG)) {
                    ResultReceiver resultReceiver = this.resultReceiver;
                    resultReceiver.getClass();
                    setupFailure(resultReceiver, CredentialProviderBaseController.GET_UNKNOWN, "During begin sign in, one tap ui intent sender failure: " + e.getMessage());
                    break;
                }
                break;
            case 15545322:
                if (type.equals(CredentialProviderBaseController.CREATE_PUBLIC_KEY_CREDENTIAL_TAG)) {
                    ResultReceiver resultReceiver2 = this.resultReceiver;
                    resultReceiver2.getClass();
                    setupFailure(resultReceiver2, str, "During public key credential, found IntentSender failure on public key creation: " + e.getMessage());
                    break;
                }
                break;
            case 1246634622:
                if (type.equals(CredentialProviderBaseController.CREATE_PASSWORD_TAG)) {
                    ResultReceiver resultReceiver3 = this.resultReceiver;
                    resultReceiver3.getClass();
                    setupFailure(resultReceiver3, str, "During save password, found UI intent sender failure: " + e.getMessage());
                    break;
                }
                break;
            case 1980564212:
                if (type.equals(CredentialProviderBaseController.SIGN_IN_INTENT_TAG)) {
                    ResultReceiver resultReceiver4 = this.resultReceiver;
                    resultReceiver4.getClass();
                    setupFailure(resultReceiver4, CredentialProviderBaseController.GET_UNKNOWN, "During get sign-in intent, one tap ui intent sender failure: " + e.getMessage());
                    break;
                }
                break;
        }
    }
}
