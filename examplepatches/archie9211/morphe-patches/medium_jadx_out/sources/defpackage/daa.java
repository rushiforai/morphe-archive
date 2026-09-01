package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.google.android.gms.fido.fido2.api.common.PublicKeyCredentialType$UnsupportedPublicKeyCredTypeException;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class daa implements Parcelable {
    public static final Parcelable.Creator<daa> CREATOR;
    public static final daa PUBLIC_KEY;
    public static final /* synthetic */ daa[] a;

    static {
        daa daaVar = new daa("PUBLIC_KEY", 0);
        PUBLIC_KEY = daaVar;
        a = new daa[]{daaVar};
        CREATOR = new lvf(1);
    }

    public static daa valueOf(String str) {
        return (daa) Enum.valueOf(daa.class, str);
    }

    public static daa[] values() {
        return (daa[]) a.clone();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // java.lang.Enum
    public String toString() {
        return "public-key";
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString("public-key");
    }

    public static daa fromString(String str) throws PublicKeyCredentialType$UnsupportedPublicKeyCredTypeException {
        for (daa daaVar : values()) {
            daaVar.getClass();
            if (str.equals("public-key")) {
                return daaVar;
            }
        }
        throw new PublicKeyCredentialType$UnsupportedPublicKeyCredTypeException(ev6.x(AXoTRPEGKEve.YQbD, str, " not supported"));
    }
}
