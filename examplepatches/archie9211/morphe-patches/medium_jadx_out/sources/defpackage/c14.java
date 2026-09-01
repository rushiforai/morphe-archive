package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.ErrorCode$UnsupportedErrorCodeException;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum c14 implements Parcelable {
    NOT_SUPPORTED_ERR(9),
    INVALID_STATE_ERR(11),
    SECURITY_ERR(18),
    NETWORK_ERR(19),
    ABORT_ERR(20),
    TIMEOUT_ERR(23),
    ENCODING_ERR(27),
    UNKNOWN_ERR(28),
    CONSTRAINT_ERR(29),
    DATA_ERR(30),
    NOT_ALLOWED_ERR(35),
    ATTESTATION_NOT_PRIVATE_ERR(36);

    public static final Parcelable.Creator<c14> CREATOR = new r4g(14);
    public final int a;

    c14(int i) {
        this.a = i;
    }

    public static c14 toErrorCode(int i) throws ErrorCode$UnsupportedErrorCodeException {
        for (c14 c14Var : values()) {
            if (i == c14Var.a) {
                return c14Var;
            }
        }
        Locale locale = Locale.US;
        throw new ErrorCode$UnsupportedErrorCodeException(ev6.w("Error code ", i, " is not supported"));
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public int getCode() {
        return this.a;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.a);
    }
}
