package defpackage;

import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.playservices.controllers.ResponseUtils;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class yh2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ ah2 b;
    public final /* synthetic */ GetCredentialException c;

    public /* synthetic */ yh2(ah2 ah2Var, GetCredentialException getCredentialException, int i) {
        this.a = i;
        this.b = ah2Var;
        this.c = getCredentialException;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        GetCredentialException getCredentialException = this.c;
        ah2 ah2Var = this.b;
        switch (i) {
            case 0:
                ah2Var.a(getCredentialException);
                break;
            case 1:
                ah2Var.a(getCredentialException);
                break;
            default:
                ResponseUtils.Companion.handleGetCredentialResponse$lambda$4$0(ah2Var, getCredentialException);
                break;
        }
    }
}
