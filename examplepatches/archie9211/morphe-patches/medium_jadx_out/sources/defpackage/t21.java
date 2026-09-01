package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.COSEAlgorithmIdentifier$UnsupportedAlgorithmIdentifierException;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t21 implements Parcelable {
    public static final Parcelable.Creator<t21> CREATOR = new r4g(10);
    public final sd a;

    public t21(sd sdVar) {
        vp7.p(sdVar);
        this.a = sdVar;
    }

    public static t21 a(int i) throws COSEAlgorithmIdentifier$UnsupportedAlgorithmIdentifierException {
        sd sdVar;
        if (i == hsa.LEGACY_RS1.getAlgoValue()) {
            sdVar = hsa.RS1;
        } else {
            hsa[] hsaVarArrValues = hsa.values();
            int length = hsaVarArrValues.length;
            int i2 = 0;
            while (true) {
                if (i2 >= length) {
                    for (xn3 xn3Var : xn3.values()) {
                        if (xn3Var.getAlgoValue() == i) {
                            sdVar = xn3Var;
                        }
                    }
                    throw new COSEAlgorithmIdentifier$UnsupportedAlgorithmIdentifierException(ev6.w("Algorithm with COSE value ", i, " not supported"));
                }
                hsa hsaVar = hsaVarArrValues[i2];
                if (hsaVar.getAlgoValue() == i) {
                    sdVar = hsaVar;
                    break;
                }
                i2++;
            }
        }
        return new t21(sdVar);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof t21) && this.a.getAlgoValue() == ((t21) obj).a.getAlgoValue();
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a});
    }

    public final String toString() {
        return ev6.x("COSEAlgorithmIdentifier{algorithm=", String.valueOf(this.a), "}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.a.getAlgoValue());
    }
}
