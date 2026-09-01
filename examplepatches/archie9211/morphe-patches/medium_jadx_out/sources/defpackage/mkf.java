package defpackage;

import android.os.IInterface;
import android.os.Parcel;
import com.google.android.gms.common.api.Status;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mkf extends ihf implements IInterface {
    public final /* synthetic */ int f;
    public final /* synthetic */ nkf g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mkf(nkf nkfVar, int i) {
        super("com.google.android.gms.auth.api.signin.internal.ISignInCallbacks", 2);
        this.f = i;
        this.g = nkfVar;
    }

    @Override // defpackage.ihf
    public final boolean k(int i, Parcel parcel, Parcel parcel2) {
        nkf nkfVar = this.g;
        int i2 = this.f;
        switch (i) {
            case 101:
                hkf.b(parcel);
                rd6.b();
                return false;
            case 102:
                Status status = (Status) hkf.a(parcel, Status.CREATOR);
                hkf.b(parcel);
                switch (i2) {
                    case 0:
                        nkfVar.setResult(status);
                        break;
                    default:
                        throw new UnsupportedOperationException();
                }
                break;
            case 103:
                Status status2 = (Status) hkf.a(parcel, Status.CREATOR);
                hkf.b(parcel);
                switch (i2) {
                    case 1:
                        nkfVar.setResult(status2);
                        break;
                    default:
                        throw new UnsupportedOperationException();
                }
                break;
            default:
                return false;
        }
        parcel2.writeNoException();
        return true;
    }
}
