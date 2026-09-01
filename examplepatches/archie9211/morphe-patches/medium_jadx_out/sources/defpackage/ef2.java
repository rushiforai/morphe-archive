package defpackage;

import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.blockstore.createrestorecredential.CredentialProviderCreateRestoreCredentialController;
import androidx.credentials.playservices.controllers.blockstore.getrestorecredential.CredentialProviderGetRestoreCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.createdigitalcredential.CreateDigitalCredentialController;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ef2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Executor b;
    public final /* synthetic */ ah2 c;
    public final /* synthetic */ Exception d;

    public /* synthetic */ ef2(Exception exc, Executor executor, ah2 ah2Var) {
        this.a = 3;
        this.d = exc;
        this.b = executor;
        this.c = ah2Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ah2 ah2Var = this.c;
        Executor executor = this.b;
        Exception exc = this.d;
        switch (i) {
            case 0:
                return CreateDigitalCredentialController.invokePlayServices$lambda$2$0(executor, ah2Var, exc);
            case 1:
                return CredentialProviderCreateRestoreCredentialController.invokePlayServices$lambda$0$1(executor, ah2Var, exc);
            case 2:
                return CredentialProviderGetRestoreCredentialController.invokePlayServices$lambda$0$1(executor, ah2Var, exc);
            default:
                return CredentialProviderPlayServicesImpl.runFallbackClearCredFlow$lambda$2$0$0(exc, executor, ah2Var);
        }
    }

    public /* synthetic */ ef2(Executor executor, ah2 ah2Var, Exception exc, int i) {
        this.a = i;
        this.b = executor;
        this.c = ah2Var;
        this.d = exc;
    }
}
