package defpackage;

import android.os.CancellationSignal;
import android.util.Log;
import android.view.View;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.identitycredentials.getdigitalcredential.CredentialProviderGetDigitalCredentialController;
import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class wh2 implements br8, z51 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ wh2(Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.e = obj;
        this.b = obj2;
        this.c = obj3;
        this.d = obj4;
    }

    @Override // defpackage.br8
    public void onFailure(Exception exc) {
        int i = this.a;
        Object obj = this.d;
        Object obj2 = this.c;
        Object obj3 = this.b;
        Object obj4 = this.e;
        switch (i) {
            case 0:
                CredentialProviderGetDigitalCredentialController.invokePlayServices$lambda$2((CredentialProviderGetDigitalCredentialController) obj4, (CancellationSignal) obj3, (Executor) obj2, (ah2) obj, exc);
                break;
            default:
                CredentialProviderPlayServicesImpl.runFallbackClearCredFlow$lambda$2((CredentialProviderPlayServicesImpl) obj4, (CancellationSignal) obj3, (Executor) obj2, (ah2) obj, exc);
                break;
        }
    }

    @Override // defpackage.z51
    public void onCancel() {
        View view = (View) this.e;
        g23 g23Var = (g23) this.b;
        c23 c23Var = (c23) this.c;
        blc blcVar = (blc) this.d;
        view.clearAnimation();
        g23Var.a.endViewTransition(view);
        c23Var.d();
        if (f25.I(2)) {
            Log.v(aJzfoQ.hwUfsSJnOTQOfKt, "Animation from operation " + blcVar + " has been cancelled.");
        }
    }
}
