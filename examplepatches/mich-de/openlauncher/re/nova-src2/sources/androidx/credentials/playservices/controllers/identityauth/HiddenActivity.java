package androidx.credentials.playservices.controllers.identityauth;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.util.Log;
import k5.a;
import k5.c;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0017\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/HiddenActivity;", "Landroid/app/Activity;", "<init>", "()V", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes2.dex */
public class HiddenActivity extends Activity {

    /* renamed from: a, reason: collision with root package name */
    public ResultReceiver f14265a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f14266b;

    public final void a(ResultReceiver resultReceiver, String str, String str2) {
        a aVar = c.f71100c;
        a.b(resultReceiver, str, str2);
        finish();
    }

    @Override // android.app.Activity
    public final void onActivityResult(int i5, int i11, Intent intent) {
        super.onActivityResult(i5, i11, intent);
        ResultReceiver resultReceiver = this.f14265a;
        if (resultReceiver != null) {
            a aVar = c.f71100c;
            a.c(resultReceiver, i5, i11, intent);
        }
        this.f14266b = false;
        finish();
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) throws IntentSender.SendIntentException {
        super.onCreate(bundle);
        overridePendingTransition(0, 0);
        String stringExtra = getIntent().getStringExtra("TYPE");
        ResultReceiver resultReceiver = (ResultReceiver) getIntent().getParcelableExtra("RESULT_RECEIVER");
        this.f14265a = resultReceiver;
        if (resultReceiver == null) {
            finish();
        }
        if (bundle != null) {
            this.f14266b = bundle.getBoolean("androidx.credentials.playservices.AWAITING_RESULT", false);
        }
        if (this.f14266b) {
            return;
        }
        if (stringExtra == null) {
            Log.w("HiddenActivity", "Activity handed an unsupported type");
            finish();
        }
        PendingIntent pendingIntent = (PendingIntent) getIntent().getParcelableExtra("EXTRA_FLOW_PENDING_INTENT");
        int intExtra = getIntent().getIntExtra("ACTIVITY_REQUEST_CODE", 1);
        if (pendingIntent == null) {
            switch (stringExtra.hashCode()) {
                case -441061071:
                    if (stringExtra.equals("BEGIN_SIGN_IN")) {
                        ResultReceiver resultReceiver2 = this.f14265a;
                        Intrinsics.d(resultReceiver2);
                        a(resultReceiver2, "GET_UNKNOWN", "internal error during the begin sign in operation");
                        break;
                    }
                    break;
                case 15545322:
                    if (stringExtra.equals("CREATE_PUBLIC_KEY_CREDENTIAL")) {
                        ResultReceiver resultReceiver3 = this.f14265a;
                        Intrinsics.d(resultReceiver3);
                        a(resultReceiver3, "CREATE_UNKNOWN", "internal error during public key credential creation");
                        break;
                    }
                    break;
                case 1246634622:
                    if (stringExtra.equals("CREATE_PASSWORD")) {
                        ResultReceiver resultReceiver4 = this.f14265a;
                        Intrinsics.d(resultReceiver4);
                        a(resultReceiver4, "CREATE_UNKNOWN", "internal error during password creation");
                        break;
                    }
                    break;
                case 1980564212:
                    if (stringExtra.equals("SIGN_IN_INTENT")) {
                        ResultReceiver resultReceiver5 = this.f14265a;
                        Intrinsics.d(resultReceiver5);
                        a(resultReceiver5, "GET_UNKNOWN", "internal error during the sign-in intent operation");
                        break;
                    }
                    break;
            }
        }
        try {
            this.f14266b = true;
            startIntentSenderForResult(pendingIntent.getIntentSender(), intExtra, null, 0, 0, 0, null);
        } catch (IntentSender.SendIntentException e3) {
            switch (stringExtra.hashCode()) {
                case -441061071:
                    if (stringExtra.equals("BEGIN_SIGN_IN")) {
                        ResultReceiver resultReceiver6 = this.f14265a;
                        Intrinsics.d(resultReceiver6);
                        a(resultReceiver6, "GET_UNKNOWN", "During begin sign in, one tap ui intent sender failure: " + e3.getMessage());
                        break;
                    }
                    break;
                case 15545322:
                    if (stringExtra.equals("CREATE_PUBLIC_KEY_CREDENTIAL")) {
                        ResultReceiver resultReceiver7 = this.f14265a;
                        Intrinsics.d(resultReceiver7);
                        a(resultReceiver7, "CREATE_UNKNOWN", "During public key credential, found IntentSender failure on public key creation: " + e3.getMessage());
                        break;
                    }
                    break;
                case 1246634622:
                    if (stringExtra.equals("CREATE_PASSWORD")) {
                        ResultReceiver resultReceiver8 = this.f14265a;
                        Intrinsics.d(resultReceiver8);
                        a(resultReceiver8, "CREATE_UNKNOWN", "During save password, found UI intent sender failure: " + e3.getMessage());
                        break;
                    }
                    break;
                case 1980564212:
                    if (stringExtra.equals("SIGN_IN_INTENT")) {
                        ResultReceiver resultReceiver9 = this.f14265a;
                        Intrinsics.d(resultReceiver9);
                        a(resultReceiver9, "GET_UNKNOWN", "During get sign-in intent, one tap ui intent sender failure: " + e3.getMessage());
                        break;
                    }
                    break;
            }
        }
    }

    @Override // android.app.Activity
    public final void onSaveInstanceState(Bundle outState) {
        Intrinsics.g(outState, "outState");
        outState.putBoolean("androidx.credentials.playservices.AWAITING_RESULT", this.f14266b);
        super.onSaveInstanceState(outState);
    }
}
