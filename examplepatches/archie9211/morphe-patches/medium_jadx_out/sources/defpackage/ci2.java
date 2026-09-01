package defpackage;

import androidx.credentials.playservices.controllers.ResponseUtils;
import androidx.credentials.playservices.controllers.blockstore.getrestorecredential.CredentialProviderGetRestoreCredentialController;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ci2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Executor b;
    public final /* synthetic */ ah2 c;
    public final /* synthetic */ k95 d;

    public /* synthetic */ ci2(Executor executor, ah2 ah2Var, k95 k95Var, int i) {
        this.a = i;
        this.b = executor;
        this.c = ah2Var;
        this.d = k95Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        k95 k95Var = this.d;
        ah2 ah2Var = this.c;
        Executor executor = this.b;
        switch (i) {
            case 0:
                return CredentialProviderGetRestoreCredentialController.invokePlayServices$lambda$0$0(executor, ah2Var, k95Var);
            default:
                return ResponseUtils.Companion.handleGetCredentialResponse$lambda$3(executor, ah2Var, k95Var);
        }
    }
}
