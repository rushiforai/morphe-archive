package defpackage;

import android.credentials.ClearCredentialStateException;
import android.credentials.Credential;
import android.credentials.GetCredentialException;
import android.credentials.GetCredentialResponse;
import android.os.Bundle;
import android.os.OutcomeReceiver;
import android.util.Log;
import androidx.credentials.exceptions.ClearCredentialUnknownException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class th2 implements OutcomeReceiver {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ Object b;

    public th2(zg2 zg2Var, uh2 uh2Var) {
        this.b = zg2Var;
    }

    public final void onError(Throwable th) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((ClearCredentialStateException) th).getClass();
                Log.i("CredManProvService", "ClearCredentialStateException error returned from framework");
                ((yg2) obj).a(new ClearCredentialUnknownException(null));
                break;
            default:
                GetCredentialException getCredentialException = (GetCredentialException) th;
                getCredentialException.getClass();
                Log.i("CredManProvService", "GetCredentialResponse error returned from framework");
                String type = getCredentialException.getType();
                type.getClass();
                ((zg2) obj).a(qb8.e0(getCredentialException.getMessage(), type));
                break;
        }
    }

    public final void onResult(Object obj) {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                Log.i("CredManProvService", "Clear result returned from framework: ");
                ((yg2) obj2).onResult((Void) obj);
                break;
            default:
                GetCredentialResponse getCredentialResponse = (GetCredentialResponse) obj;
                getCredentialResponse.getClass();
                Log.i("CredManProvService", "GetCredentialResponse returned from framework");
                Credential credential = getCredentialResponse.getCredential();
                credential.getClass();
                String type = credential.getType();
                type.getClass();
                Bundle data = credential.getData();
                data.getClass();
                ((zg2) obj2).onResult(new k95(kng.t(type, data)));
                break;
        }
    }

    public th2(yg2 yg2Var) {
        this.b = yg2Var;
    }
}
