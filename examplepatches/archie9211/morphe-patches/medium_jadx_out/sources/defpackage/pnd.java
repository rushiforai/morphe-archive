package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.TokenBinding$UnsupportedTokenBindingStatusException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum pnd implements Parcelable {
    PRESENT("present"),
    SUPPORTED("supported"),
    NOT_SUPPORTED("not-supported");

    public static final Parcelable.Creator<pnd> CREATOR = new lvf(7);
    public final String a;

    pnd(String str) {
        this.a = str;
    }

    public static pnd fromString(String str) throws TokenBinding$UnsupportedTokenBindingStatusException {
        for (pnd pndVar : values()) {
            if (str.equals(pndVar.a)) {
                return pndVar;
            }
        }
        throw new TokenBinding$UnsupportedTokenBindingStatusException(ev6.x("TokenBindingStatus ", str, " not supported"));
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
