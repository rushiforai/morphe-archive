package j5;

import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import as.d0;

/* loaded from: classes2.dex */
public final /* synthetic */ class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69059a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f5.d f69060b;

    public /* synthetic */ b(f5.d dVar, int i5) {
        this.f69059a = i5;
        this.f69060b = dVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f69059a) {
            case 0:
                CredentialProviderPlayServicesImpl.onClearCredential$lambda$0$0(this.f69060b);
                break;
            case 1:
                CredentialProviderPlayServicesImpl.onCreateCredential$lambda$0$0(this.f69060b);
                break;
            case 2:
                CredentialProviderPlayServicesImpl.onClearCredential$lambda$1$0$0(this.f69060b);
                break;
            case 3:
                CredentialProviderPlayServicesImpl.runFallbackClearCredFlow$lambda$0$0$0(this.f69060b);
                break;
            case 4:
                CredentialProviderPlayServicesImpl.onGetCredential$lambda$1$0(this.f69060b);
                break;
            case 5:
                CredentialProviderPlayServicesImpl.onGetCredential$lambda$0$0(this.f69060b);
                break;
            case 6:
                CredentialProviderPlayServicesImpl.onClearCredential$lambda$4$0$0(this.f69060b);
                break;
            case 7:
                ((d0) this.f69060b).b(new GetCredentialUnknownException("No provider data returned."));
                break;
            default:
                ((d0) this.f69060b).b(new GetCredentialUnknownException("Failed to launch the selector UI. Hint: ensure the `context` parameter is an Activity-based context."));
                break;
        }
    }
}
