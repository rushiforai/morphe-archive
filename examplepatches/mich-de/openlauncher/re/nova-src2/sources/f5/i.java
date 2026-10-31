package f5;

import android.content.Context;
import android.credentials.CredentialManager;
import android.credentials.GetCredentialException;
import android.credentials.GetCredentialRequest;
import android.credentials.GetCredentialResponse;
import android.os.Build;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.OutcomeReceiver;
import androidx.credentials.exceptions.GetCredentialUnsupportedException;
import as.d0;
import java.util.concurrent.Executor;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class i implements f {

    /* renamed from: a, reason: collision with root package name */
    public final CredentialManager f54309a;

    public i(Context context) {
        Intrinsics.g(context, "context");
        this.f54309a = c1.i.c(context.getSystemService("credential"));
    }

    @Override // f5.f
    public final boolean isAvailableOnDevice() {
        return Build.VERSION.SDK_INT >= 34 && this.f54309a != null;
    }

    @Override // f5.f
    public final void onGetCredential(Context context, l request, CancellationSignal cancellationSignal, Executor executor, d dVar) {
        Intrinsics.g(context, "context");
        Intrinsics.g(request, "request");
        d0 d0Var = (d0) dVar;
        CredentialManager credentialManager = this.f54309a;
        if (credentialManager == null) {
            d0Var.b(new GetCredentialUnsupportedException("Your device doesn't support credential manager"));
            Unit unit = Unit.f71706a;
            return;
        }
        h hVar = new h(d0Var, this);
        g.p();
        Bundle bundle = new Bundle();
        bundle.putBoolean("androidx.credentials.BUNDLE_KEY_PREFER_IDENTITY_DOC_UI", false);
        bundle.putBoolean("androidx.credentials.BUNDLE_KEY_PREFER_IMMEDIATELY_AVAILABLE_CREDENTIALS", false);
        bundle.putParcelable("androidx.credentials.BUNDLE_KEY_PREFER_UI_BRANDING_COMPONENT_NAME", null);
        GetCredentialRequest.Builder builderE = g.e(bundle);
        for (zi.a aVar : request.f54310a) {
            c1.i.v();
            aVar.getClass();
            builderE.addCredentialOption(g.c(aVar.f98528a, aVar.f98529b).setIsSystemProviderRequired(true).setAllowedProviders(aVar.f98530c).build());
        }
        GetCredentialRequest getCredentialRequestBuild = builderE.build();
        Intrinsics.f(getCredentialRequestBuild, "build(...)");
        credentialManager.getCredential(context, getCredentialRequestBuild, cancellationSignal, (c) executor, (OutcomeReceiver<GetCredentialResponse, GetCredentialException>) hVar);
    }
}
