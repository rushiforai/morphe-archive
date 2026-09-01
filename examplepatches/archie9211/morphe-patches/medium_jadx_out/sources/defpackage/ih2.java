package defpackage;

import androidx.credentials.playservices.controllers.CredentialProviderController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ih2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ x45 b;
    public final /* synthetic */ rya c;

    public /* synthetic */ ih2(x45 x45Var, rya ryaVar, int i) {
        this.a = i;
        this.b = x45Var;
        this.c = ryaVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        rya ryaVar = this.c;
        x45 x45Var = this.b;
        switch (i) {
            case 0:
                return CredentialProviderController.Companion.maybeReportErrorResultCodeCreate$lambda$0(x45Var, ryaVar);
            default:
                return CredentialProviderController.Companion.maybeReportErrorResultCodeGet$lambda$0(x45Var, ryaVar);
        }
    }
}
