package mg;

import android.os.Parcel;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.common.api.Status;

/* loaded from: classes3.dex */
public abstract class b extends ih.g implements m {
    public b() {
        super("com.google.android.gms.auth.api.signin.internal.ISignInCallbacks", 0);
    }

    @Override // mg.m
    public void B(Status status) {
        throw new UnsupportedOperationException();
    }

    @Override // ih.g
    public final boolean V(int i5, Parcel parcel, Parcel parcel2) {
        switch (i5) {
            case 101:
                GoogleSignInAccount googleSignInAccount = (GoogleSignInAccount) ih.e.a(parcel, GoogleSignInAccount.CREATOR);
                Status status = (Status) ih.e.a(parcel, Status.CREATOR);
                ih.e.b(parcel);
                j(googleSignInAccount, status);
                break;
            case 102:
                Status status2 = (Status) ih.e.a(parcel, Status.CREATOR);
                ih.e.b(parcel);
                B(status2);
                break;
            case 103:
                Status status3 = (Status) ih.e.a(parcel, Status.CREATOR);
                ih.e.b(parcel);
                z(status3);
                break;
            default:
                return false;
        }
        parcel2.writeNoException();
        return true;
    }

    @Override // mg.m
    public void j(GoogleSignInAccount googleSignInAccount, Status status) {
        throw new UnsupportedOperationException();
    }

    @Override // mg.m
    public void z(Status status) {
        throw new UnsupportedOperationException();
    }
}
