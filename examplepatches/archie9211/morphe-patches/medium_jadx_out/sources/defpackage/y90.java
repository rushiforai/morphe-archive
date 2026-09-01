package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.Attachment$UnsupportedAttachmentException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum y90 implements Parcelable {
    PLATFORM("platform"),
    CROSS_PLATFORM("cross-platform");

    public static final Parcelable.Creator<y90> CREATOR = new rkf(3);
    public final String a;

    y90(String str) {
        this.a = str;
    }

    public static y90 fromString(String str) throws Attachment$UnsupportedAttachmentException {
        for (y90 y90Var : values()) {
            if (str.equals(y90Var.a)) {
                return y90Var;
            }
        }
        throw new Attachment$UnsupportedAttachmentException(ev6.x("Attachment ", str, " not supported"));
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
