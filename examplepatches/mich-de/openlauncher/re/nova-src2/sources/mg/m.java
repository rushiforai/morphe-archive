package mg;

import android.os.IInterface;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.common.api.Status;

/* loaded from: classes3.dex */
public interface m extends IInterface {
    void B(Status status);

    void j(GoogleSignInAccount googleSignInAccount, Status status);

    void z(Status status);
}
