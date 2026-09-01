package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.AttestationConveyancePreference$UnsupportedAttestationConveyancePreferenceException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum z90 implements Parcelable {
    NONE("none"),
    INDIRECT("indirect"),
    DIRECT("direct");

    public static final Parcelable.Creator<z90> CREATOR = new lvf(12);
    public final String a;

    z90(String str) {
        this.a = str;
    }

    public static z90 fromString(String str) throws AttestationConveyancePreference$UnsupportedAttestationConveyancePreferenceException {
        for (z90 z90Var : values()) {
            if (str.equals(z90Var.a)) {
                return z90Var;
            }
        }
        throw new AttestationConveyancePreference$UnsupportedAttestationConveyancePreferenceException(ev6.x("Attestation conveyance preference ", str, " not supported"));
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.a;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.a);
    }
}
