package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.ResultReceiver;
import com.google.android.gms.fido.fido2.api.common.AttestationConveyancePreference$UnsupportedAttestationConveyancePreferenceException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z9a extends k2 {
    public static final Parcelable.Creator<z9a> CREATOR = new rkf(23);
    public final caa a;
    public final eaa b;
    public final byte[] c;
    public final List d;
    public final Double e;
    public final List f;
    public final ie0 g;
    public final Integer h;
    public final qnd i;
    public final z90 j;
    public final zd0 k;
    public final String l;
    public final ResultReceiver m;

    public z9a(caa caaVar, eaa eaaVar, byte[] bArr, ArrayList arrayList, Double d, ArrayList arrayList2, ie0 ie0Var, Integer num, qnd qndVar, String str, zd0 zd0Var, String str2, ResultReceiver resultReceiver) {
        this.m = resultReceiver;
        if (str2 != null) {
            try {
                z9a z9aVarD = d(new JSONObject(str2));
                this.a = z9aVarD.a;
                this.b = z9aVarD.b;
                this.c = z9aVarD.c;
                this.d = z9aVarD.d;
                this.e = z9aVarD.e;
                this.f = z9aVarD.f;
                this.g = z9aVarD.g;
                this.h = z9aVarD.h;
                this.i = z9aVarD.i;
                this.j = z9aVarD.j;
                this.k = z9aVarD.k;
                this.l = str2;
                return;
            } catch (JSONException e) {
                throw new IllegalArgumentException(e);
            }
        }
        vp7.p(caaVar);
        this.a = caaVar;
        vp7.p(eaaVar);
        this.b = eaaVar;
        vp7.p(bArr);
        this.c = bArr;
        vp7.p(arrayList);
        this.d = arrayList;
        this.e = d;
        this.f = arrayList2;
        this.g = ie0Var;
        this.h = num;
        this.i = qndVar;
        if (str != null) {
            try {
                this.j = z90.fromString(str);
            } catch (AttestationConveyancePreference$UnsupportedAttestationConveyancePreferenceException e2) {
                throw new IllegalArgumentException(e2);
            }
        } else {
            this.j = null;
        }
        this.k = zd0Var;
        this.l = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x0273  */
    /* JADX WARN: Removed duplicated region for block: B:101:0x0285  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x028f  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x02a0  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x02aa  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x02bc  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x02c6  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x02d8  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x02e2  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x02ee  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x01c6  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0214  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x021e  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0230  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x023a  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x024c  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0256  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0269  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.z9a d(org.json.JSONObject r31) throws org.json.JSONException {
        /*
            Method dump skipped, instruction units count: 820
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z9a.d(org.json.JSONObject):z9a");
    }

    public final boolean equals(Object obj) {
        List list;
        if (!(obj instanceof z9a)) {
            return false;
        }
        z9a z9aVar = (z9a) obj;
        List list2 = z9aVar.d;
        List list3 = z9aVar.f;
        if (en7.u(this.a, z9aVar.a) && en7.u(this.b, z9aVar.b) && Arrays.equals(this.c, z9aVar.c) && en7.u(this.e, z9aVar.e)) {
            List list4 = this.d;
            if (list4.containsAll(list2) && list2.containsAll(list4) && ((((list = this.f) == null && list3 == null) || (list != null && list3 != null && list.containsAll(list3) && list3.containsAll(list))) && en7.u(this.g, z9aVar.g) && en7.u(this.h, z9aVar.h) && en7.u(this.i, z9aVar.i) && en7.u(this.j, z9aVar.j) && en7.u(this.k, z9aVar.k) && en7.u(this.l, z9aVar.l))) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, Integer.valueOf(Arrays.hashCode(this.c)), this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l});
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.a);
        String strValueOf2 = String.valueOf(this.b);
        String strU = op8.U(this.c);
        String strValueOf3 = String.valueOf(this.d);
        String strValueOf4 = String.valueOf(this.f);
        String strValueOf5 = String.valueOf(this.g);
        String strValueOf6 = String.valueOf(this.i);
        String strValueOf7 = String.valueOf(this.j);
        String strValueOf8 = String.valueOf(this.k);
        StringBuilder sbU = y30.u("PublicKeyCredentialCreationOptions{\n rp=", strValueOf, ", \n user=", strValueOf2, ", \n challenge=");
        ka1.C(sbU, strU, ", \n parameters=", strValueOf3, ", \n timeoutSeconds=");
        sbU.append(this.e);
        sbU.append(", \n excludeList=");
        sbU.append(strValueOf4);
        sbU.append(", \n authenticatorSelection=");
        sbU.append(strValueOf5);
        sbU.append(", \n requestId=");
        sbU.append(this.h);
        sbU.append(", \n tokenBinding=");
        sbU.append(strValueOf6);
        sbU.append(", \n attestationConveyancePreference=");
        return km4.C(sbU, strValueOf7, ", \n authenticationExtensions=", strValueOf8, "}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 2, this.a, i);
        fo7.U(parcel, 3, this.b, i);
        fo7.S(parcel, 4, this.c);
        fo7.Y(parcel, 5, this.d);
        Double d = this.e;
        if (d != null) {
            fo7.a0(parcel, 6, 8);
            parcel.writeDouble(d.doubleValue());
        }
        fo7.Y(parcel, 7, this.f);
        fo7.U(parcel, 8, this.g, i);
        fo7.T(parcel, 9, this.h);
        fo7.U(parcel, 10, this.i, i);
        z90 z90Var = this.j;
        fo7.V(parcel, 11, z90Var == null ? null : z90Var.toString());
        fo7.U(parcel, 12, this.k, i);
        fo7.V(parcel, 13, this.l);
        fo7.U(parcel, 14, this.m, i);
        fo7.d0(iC0, parcel);
    }
}
