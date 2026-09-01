package defpackage;

import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.blockstore.createrestorecredential.CredentialProviderCreateRestoreCredentialController;
import androidx.credentials.playservices.controllers.blockstore.getrestorecredential.CredentialProviderGetRestoreCredentialController;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class qh2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Executor b;
    public final /* synthetic */ ah2 c;
    public final /* synthetic */ rya d;

    public /* synthetic */ qh2(Executor executor, ah2 ah2Var, rya ryaVar, int i) {
        this.a = i;
        this.b = executor;
        this.c = ah2Var;
        this.d = ryaVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        rya ryaVar = this.d;
        ah2 ah2Var = this.c;
        Executor executor = this.b;
        switch (i) {
            case 0:
                return CredentialProviderCreateRestoreCredentialController.invokePlayServices$lambda$2$0(executor, ah2Var, ryaVar);
            case 1:
                return CredentialProviderGetRestoreCredentialController.invokePlayServices$lambda$2$0(executor, ah2Var, ryaVar);
            default:
                return CredentialProviderPlayServicesImpl.onClearCredential$lambda$3$0(executor, ah2Var, ryaVar);
        }
    }
}
