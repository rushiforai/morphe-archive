package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.TokenBinding$UnsupportedTokenBindingStatusException;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qnd extends k2 {
    public static final Parcelable.Creator<qnd> CREATOR = new lvf(8);
    public final pnd a;
    public final String b;

    static {
        new qnd(pnd.SUPPORTED.toString(), null);
        new qnd(pnd.NOT_SUPPORTED.toString(), null);
    }

    public qnd(String str, String str2) {
        vp7.p(str);
        try {
            this.a = pnd.fromString(str);
            this.b = str2;
        } catch (TokenBinding$UnsupportedTokenBindingStatusException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof qnd)) {
            return false;
        }
        qnd qndVar = (qnd) obj;
        return gq7.c0(this.a, qndVar.a) && gq7.c0(this.b, qndVar.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 2, this.a.toString());
        fo7.V(parcel, 3, this.b);
        fo7.d0(iC0, parcel);
    }
}
