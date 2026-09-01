package defpackage;

import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.playservices.controllers.ResponseUtils;
import androidx.credentials.playservices.controllers.identitycredentials.getdigitalcredential.CredentialProviderGetDigitalCredentialController;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xh2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Executor b;
    public final /* synthetic */ ah2 c;
    public final /* synthetic */ GetCredentialException d;

    public /* synthetic */ xh2(Executor executor, ah2 ah2Var, GetCredentialException getCredentialException, int i) {
        this.a = i;
        this.b = executor;
        this.c = ah2Var;
        this.d = getCredentialException;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        GetCredentialException getCredentialException = this.d;
        ah2 ah2Var = this.c;
        Executor executor = this.b;
        switch (i) {
            case 0:
                return CredentialProviderGetDigitalCredentialController.invokePlayServices$lambda$2$0(executor, ah2Var, getCredentialException);
            default:
                return ResponseUtils.Companion.handleGetCredentialResponse$lambda$4(executor, ah2Var, getCredentialException);
        }
    }
}
