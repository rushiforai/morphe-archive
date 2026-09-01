package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.COSEAlgorithmIdentifier$UnsupportedAlgorithmIdentifierException;
import com.google.android.gms.fido.fido2.api.common.PublicKeyCredentialType$UnsupportedPublicKeyCredTypeException;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class baa extends k2 {
    public static final Parcelable.Creator<baa> CREATOR = new rkf(27);
    public final daa a;
    public final t21 b;

    public baa(String str, int i) {
        vp7.p(str);
        try {
            this.a = daa.fromString(str);
            try {
                this.b = t21.a(i);
            } catch (COSEAlgorithmIdentifier$UnsupportedAlgorithmIdentifierException e) {
                throw new IllegalArgumentException(e);
            }
        } catch (PublicKeyCredentialType$UnsupportedPublicKeyCredTypeException e2) {
            throw new IllegalArgumentException(e2);
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof baa)) {
            return false;
        }
        baa baaVar = (baa) obj;
        return this.a.equals(baaVar.a) && this.b.equals(baaVar.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b});
    }

    public final String toString() {
        return ev6.y("PublicKeyCredentialParameters{\n type=", String.valueOf(this.a), ", \n algorithm=", String.valueOf(this.b), "\n }");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 2, this.a.toString());
        fo7.T(parcel, 3, Integer.valueOf(this.b.a.getAlgoValue()));
        fo7.d0(iC0, parcel);
    }
}
