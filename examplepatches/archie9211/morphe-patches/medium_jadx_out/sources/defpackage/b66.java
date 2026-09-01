package defpackage;

import android.content.Context;
import com.google.android.gms.identitycredentials.GetCredentialRequest;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b66 extends zd5 {
    public static final s26 l = new s26("IdentityCredentials.API", new z56(0), new u3b(11));
    public static final s26 m = new s26("RestoreCredential.API", new z56(1), new u3b(11));
    public static final s26 n = new s26("ClientNotification.API", new z56(4), new u3b(11));
    public static final s26 o = new s26("ClientTelemetry.API", new z56(5), new u3b(11));
    public static final s26 p = new s26("RecaptchaBase.API", new z56(9), new u3b(11));
    public static int q = 1;

    public jrg c(GetCredentialRequest getCredentialRequest) {
        getCredentialRequest.getClass();
        wv0 wv0VarB = wv0.b();
        wv0VarB.e = new da4[]{m40.o};
        wv0VarB.d = new wjc(13, getCredentialRequest);
        wv0VarB.b = 32701;
        jrg jrgVarB = b(0, wv0VarB.a());
        jrgVarB.getClass();
        return jrgVarB;
    }

    public synchronized int d() {
        int i;
        try {
            i = q;
            if (i == 1) {
                Context context = this.a;
                ae5 ae5Var = ae5.e;
                int iC = ae5Var.c(context, 12451000);
                if (iC == 0) {
                    i = 4;
                    q = 4;
                } else if (ae5Var.a(iC, context, null) != null || un3.a(context) == 0) {
                    i = 2;
                    q = 2;
                } else {
                    i = 3;
                    q = 3;
                }
            }
        } catch (Throwable th) {
            throw th;
        }
        return i;
    }
}
