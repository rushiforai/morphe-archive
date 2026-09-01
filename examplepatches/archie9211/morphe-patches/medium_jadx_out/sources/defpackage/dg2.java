package defpackage;

import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.ResponseUtils;
import androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential.CreatePublicKeyCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.getcredential.GetCredentialController;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dg2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Executor b;
    public final /* synthetic */ ah2 c;

    public /* synthetic */ dg2(Executor executor, ah2 ah2Var, int i) {
        this.a = i;
        this.b = executor;
        this.c = ah2Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ah2 ah2Var = this.c;
        Executor executor = this.b;
        switch (i) {
            case 0:
                return CreatePublicKeyCredentialController.invokePlayServices$lambda$0$0(executor, ah2Var);
            case 1:
                return CreatePublicKeyCredentialController.invokePlayServices$lambda$0$3(executor, ah2Var);
            case 2:
                return CredentialProviderPlayServicesImpl.onGetCredential$lambda$0(executor, ah2Var);
            case 3:
                return CredentialProviderPlayServicesImpl.onGetCredential$lambda$1(executor, ah2Var);
            case 4:
                return CredentialProviderPlayServicesImpl.onClearCredential$lambda$4$0(executor, ah2Var);
            case 5:
                return CredentialProviderPlayServicesImpl.runFallbackClearCredFlow$lambda$0$0(executor, ah2Var);
            case 6:
                return CredentialProviderPlayServicesImpl.onClearCredential$lambda$1$0(executor, ah2Var);
            case 7:
                return CredentialProviderPlayServicesImpl.onClearCredential$lambda$0(executor, ah2Var);
            case 8:
                return GetCredentialController.invokePlayServices$lambda$0$0(executor, ah2Var);
            default:
                return ResponseUtils.Companion.handleGetCredentialResponse$lambda$2(executor, ah2Var);
        }
    }
}
