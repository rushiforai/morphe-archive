package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.Attachment$UnsupportedAttachmentException;
import com.google.android.gms.fido.fido2.api.common.ResidentKeyRequirement$UnsupportedResidentKeyRequirementException;
import com.google.android.gms.fido.fido2.api.common.zzbc;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ie0 extends k2 {
    public static final Parcelable.Creator<ie0> CREATOR = new r4g(9);
    public final y90 a;
    public final Boolean b;
    public final une c;
    public final bcb d;

    public ie0(String str, String str2, Boolean bool, String str3) {
        y90 y90VarFromString;
        bcb bcbVarFromString = null;
        if (str == null) {
            y90VarFromString = null;
        } else {
            try {
                y90VarFromString = y90.fromString(str);
            } catch (Attachment$UnsupportedAttachmentException | ResidentKeyRequirement$UnsupportedResidentKeyRequirementException | zzbc e) {
                throw new IllegalArgumentException(e);
            }
        }
        this.a = y90VarFromString;
        this.b = bool;
        this.c = str2 == null ? null : une.fromString(str2);
        if (str3 != null) {
            bcbVarFromString = bcb.fromString(str3);
        }
        this.d = bcbVarFromString;
    }

    public final bcb d() {
        bcb bcbVar = this.d;
        if (bcbVar == null) {
            bcbVar = null;
            Boolean bool = this.b;
            if (bool != null) {
                if (bool.booleanValue()) {
                    return bcb.RESIDENT_KEY_REQUIRED;
                }
                return null;
            }
        }
        return bcbVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ie0)) {
            return false;
        }
        ie0 ie0Var = (ie0) obj;
        return en7.u(this.a, ie0Var.a) && en7.u(this.b, ie0Var.b) && en7.u(this.c, ie0Var.c) && en7.u(d(), ie0Var.d());
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, this.c, d()});
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.a);
        String strValueOf2 = String.valueOf(this.c);
        String strValueOf3 = String.valueOf(this.d);
        StringBuilder sbU = lv8.u("AuthenticatorSelectionCriteria{\n attachment=", strValueOf, ", \n requireResidentKey=");
        sbU.append(this.b);
        sbU.append(", \n requireUserVerification=");
        sbU.append(strValueOf2);
        sbU.append(", \n residentKeyRequirement=");
        return ka1.v(sbU, strValueOf3, "\n }");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        y90 y90Var = this.a;
        fo7.V(parcel, 2, y90Var == null ? null : y90Var.toString());
        Boolean bool = this.b;
        if (bool != null) {
            fo7.a0(parcel, 3, 4);
            parcel.writeInt(bool.booleanValue() ? 1 : 0);
        }
        une uneVar = this.c;
        fo7.V(parcel, 4, uneVar == null ? null : uneVar.toString());
        bcb bcbVarD = d();
        fo7.V(parcel, 5, bcbVarD != null ? bcbVarD.toString() : null);
        fo7.d0(iC0, parcel);
    }
}
