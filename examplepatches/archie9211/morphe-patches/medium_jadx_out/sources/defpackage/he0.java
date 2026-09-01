package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.ErrorCode$UnsupportedErrorCodeException;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class he0 extends zb0 {
    public static final Parcelable.Creator<he0> CREATOR = new r4g(7);
    public final c14 a;
    public final String b;
    public final int c;

    public he0(int i, int i2, String str) {
        try {
            this.a = c14.toErrorCode(i);
            this.b = str;
            this.c = i2;
        } catch (ErrorCode$UnsupportedErrorCodeException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof he0)) {
            return false;
        }
        he0 he0Var = (he0) obj;
        return en7.u(this.a, he0Var.a) && en7.u(this.b, he0Var.b) && en7.u(Integer.valueOf(this.c), Integer.valueOf(he0Var.c));
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, Integer.valueOf(this.c)});
    }

    public final String toString() {
        vwa vwaVar = new vwa(getClass().getSimpleName(), 24);
        String strValueOf = String.valueOf(this.a.getCode());
        fwf fwfVar = new fwf(22, false);
        ((vwa) vwaVar.d).c = fwfVar;
        vwaVar.d = fwfVar;
        fwfVar.d = strValueOf;
        fwfVar.b = "errorCode";
        String str = this.b;
        if (str != null) {
            vwaVar.K("errorMessage", str);
        }
        return vwaVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        int code = this.a.getCode();
        fo7.a0(parcel, 2, 4);
        parcel.writeInt(code);
        fo7.V(parcel, 3, this.b);
        fo7.a0(parcel, 4, 4);
        parcel.writeInt(this.c);
        fo7.d0(iC0, parcel);
    }
}
