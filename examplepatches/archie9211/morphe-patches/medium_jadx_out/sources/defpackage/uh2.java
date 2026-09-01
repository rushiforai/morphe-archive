package defpackage;

import android.content.Context;
import android.credentials.ClearCredentialStateRequest;
import android.credentials.CredentialManager;
import android.credentials.CredentialOption;
import android.credentials.GetCredentialRequest;
import android.os.Build;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.util.Log;
import androidx.credentials.exceptions.ClearCredentialUnsupportedException;
import androidx.credentials.exceptions.GetCredentialUnsupportedException;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uh2 implements eh2 {
    public final CredentialManager a;

    public uh2(Context context) {
        context.getClass();
        this.a = (CredentialManager) context.getSystemService("credential");
    }

    @Override // defpackage.eh2
    public final boolean isAvailableOnDevice() {
        return Build.VERSION.SDK_INT >= 34 && this.a != null;
    }

    @Override // defpackage.eh2
    public final void onClearCredential(jo1 jo1Var, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var) {
        Log.i("CredManProvService", "In CredentialProviderFrameworkImpl onClearCredential");
        yg2 yg2Var = (yg2) ah2Var;
        CredentialManager credentialManager = this.a;
        if (credentialManager == null) {
            yg2Var.a(new ClearCredentialUnsupportedException("Your device doesn't support credential manager", "androidx.credentials.TYPE_CLEAR_CREDENTIAL_UNSUPPORTED_EXCEPTION"));
            return;
        }
        th2 th2Var = new th2(yg2Var);
        credentialManager.getClass();
        credentialManager.clearCredentialState(new ClearCredentialStateRequest(new Bundle()), cancellationSignal, executor, th2Var);
    }

    @Override // defpackage.eh2
    public final void onGetCredential(Context context, i95 i95Var, CancellationSignal cancellationSignal, Executor executor, ah2 ah2Var) {
        context.getClass();
        zg2 zg2Var = (zg2) ah2Var;
        CredentialManager credentialManager = this.a;
        if (credentialManager == null) {
            zg2Var.a(new GetCredentialUnsupportedException("Your device doesn't support credential manager"));
            return;
        }
        th2 th2Var = new th2(zg2Var, this);
        credentialManager.getClass();
        Bundle bundle = new Bundle();
        bundle.putBoolean("androidx.credentials.BUNDLE_KEY_PREFER_IDENTITY_DOC_UI", false);
        bundle.putBoolean("androidx.credentials.BUNDLE_KEY_PREFER_IMMEDIATELY_AVAILABLE_CREDENTIALS", false);
        bundle.putParcelable("androidx.credentials.BUNDLE_KEY_PREFER_UI_BRANDING_COMPONENT_NAME", null);
        GetCredentialRequest.Builder builder = new GetCredentialRequest.Builder(bundle);
        for (dh2 dh2Var : i95Var.a) {
            dh2Var.getClass();
            builder.addCredentialOption(new CredentialOption.Builder("com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL", dh2Var.a, dh2Var.b).setIsSystemProviderRequired(true).setAllowedProviders(dh2Var.c).build());
        }
        GetCredentialRequest getCredentialRequestBuild = builder.build();
        getCredentialRequestBuild.getClass();
        credentialManager.getCredential(context, getCredentialRequestBuild, cancellationSignal, executor, th2Var);
    }
}
