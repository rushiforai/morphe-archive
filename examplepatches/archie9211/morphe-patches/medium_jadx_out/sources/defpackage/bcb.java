package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.ResidentKeyRequirement$UnsupportedResidentKeyRequirementException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum bcb implements Parcelable {
    RESIDENT_KEY_DISCOURAGED("discouraged"),
    RESIDENT_KEY_PREFERRED("preferred"),
    RESIDENT_KEY_REQUIRED("required");

    public static final Parcelable.Creator<bcb> CREATOR = new lvf(5);
    public final String a;

    bcb(String str) {
        this.a = str;
    }

    public static bcb fromString(String str) throws ResidentKeyRequirement$UnsupportedResidentKeyRequirementException {
        for (bcb bcbVar : values()) {
            if (str.equals(bcbVar.a)) {
                return bcbVar;
            }
        }
        throw new ResidentKeyRequirement$UnsupportedResidentKeyRequirementException(ev6.x("Resident key requirement ", str, " not supported"));
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
