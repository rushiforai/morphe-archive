package defpackage;

import androidx.credentials.exceptions.GetCredentialProviderConfigurationException;
import androidx.credentials.exceptions.NoCredentialException;
import com.medium.android.common.api.Medium2Error;
import com.medium.android.susi.domain.usecase.TokenException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class x34 {
    public static final x2b a = new x2b("The token [a-zA-Z0-9]+ was not of the correct type, or has already been used");

    public static final boolean a(Throwable th) {
        if ((th instanceof NoCredentialException) || (th instanceof GetCredentialProviderConfigurationException)) {
            return false;
        }
        boolean z = th instanceof Medium2Error;
        if (z) {
            Medium2Error medium2Error = (Medium2Error) th;
            if (medium2Error.a == 409) {
                l14 l14Var = medium2Error.c;
                if ((l14Var instanceof i14) && ((i14) l14Var).getCode() == a14.USER_EMAIL_UNAVAILABLE) {
                    return false;
                }
            }
        }
        return ((z && ((Medium2Error) th).a == 429) || (th instanceof TokenException) || (m4.I(th) instanceof x14)) ? false : true;
    }
}
