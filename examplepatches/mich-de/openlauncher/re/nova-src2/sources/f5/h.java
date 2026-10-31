package f5;

import android.credentials.Credential;
import android.credentials.GetCredentialException;
import android.credentials.GetCredentialResponse;
import android.os.Bundle;
import android.os.OutcomeReceiver;
import android.util.Log;
import androidx.credentials.internal.FrameworkClassParsingException;
import as.d0;
import kotlin.jvm.internal.Intrinsics;
import p10.c0;

/* loaded from: classes2.dex */
public final class h implements OutcomeReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d0 f54308a;

    public h(d0 d0Var, i iVar) {
        this.f54308a = d0Var;
    }

    public final void onError(Throwable th2) throws FrameworkClassParsingException {
        GetCredentialException error = g.d(th2);
        Intrinsics.g(error, "error");
        Log.i("CredManProvService", "GetCredentialResponse error returned from framework");
        String type = error.getType();
        Intrinsics.f(type, "getType(...)");
        this.f54308a.b(c0.f0(type, error.getMessage()));
    }

    public final void onResult(Object obj) {
        GetCredentialResponse response = g.f(obj);
        Intrinsics.g(response, "response");
        Log.i("CredManProvService", "GetCredentialResponse returned from framework");
        Credential credential = response.getCredential();
        Intrinsics.f(credential, "getCredential(...)");
        String type = credential.getType();
        Intrinsics.f(type, "getType(...)");
        Bundle data = credential.getData();
        Intrinsics.f(data, "getData(...)");
        this.f54308a.c(new m(jk.b.w(type, data)));
    }
}
