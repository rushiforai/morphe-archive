package f5;

import android.credentials.CredentialOption;
import android.credentials.GetCredentialException;
import android.credentials.GetCredentialRequest;
import android.credentials.GetCredentialResponse;
import android.os.Bundle;
import android.text.GraphemeClusterSegmentFinder;
import android.text.SegmentFinder;
import android.text.TextPaint;

/* loaded from: classes2.dex */
public abstract /* synthetic */ class g {
    public static /* synthetic */ void B() {
    }

    public static /* synthetic */ CredentialOption.Builder c(Bundle bundle, Bundle bundle2) {
        return new CredentialOption.Builder("com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL", bundle, bundle2);
    }

    public static /* bridge */ /* synthetic */ GetCredentialException d(Throwable th2) {
        return (GetCredentialException) th2;
    }

    public static /* synthetic */ GetCredentialRequest.Builder e(Bundle bundle) {
        return new GetCredentialRequest.Builder(bundle);
    }

    public static /* bridge */ /* synthetic */ GetCredentialResponse f(Object obj) {
        return (GetCredentialResponse) obj;
    }

    public static /* synthetic */ GraphemeClusterSegmentFinder i(CharSequence charSequence, TextPaint textPaint) {
        return new GraphemeClusterSegmentFinder(charSequence, textPaint);
    }

    public static /* bridge */ /* synthetic */ SegmentFinder j(Object obj) {
        return (SegmentFinder) obj;
    }

    public static /* synthetic */ void p() {
    }
}
