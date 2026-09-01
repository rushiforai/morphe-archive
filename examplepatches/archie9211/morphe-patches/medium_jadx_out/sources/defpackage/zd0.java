package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zd0 extends k2 {
    public static final Parcelable.Creator<zd0> CREATOR = new lvf(22);
    public final df4 a;
    public final kkg b;
    public final tne c;
    public final gvg d;
    public final olf e;
    public final vmf f;
    public final qng g;
    public final zof h;
    public final le5 i;
    public final dtf j;
    public final pvf k;
    public final uqf l;

    public zd0(df4 df4Var, kkg kkgVar, tne tneVar, gvg gvgVar, olf olfVar, vmf vmfVar, qng qngVar, zof zofVar, le5 le5Var, dtf dtfVar, pvf pvfVar, uqf uqfVar) {
        this.a = df4Var;
        this.c = tneVar;
        this.b = kkgVar;
        this.d = gvgVar;
        this.e = olfVar;
        this.f = vmfVar;
        this.g = qngVar;
        this.h = zofVar;
        this.i = le5Var;
        this.j = dtfVar;
        this.k = pvfVar;
        this.l = uqfVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zd0)) {
            return false;
        }
        zd0 zd0Var = (zd0) obj;
        return en7.u(this.a, zd0Var.a) && en7.u(this.b, zd0Var.b) && en7.u(this.c, zd0Var.c) && en7.u(this.d, zd0Var.d) && en7.u(this.e, zd0Var.e) && en7.u(this.f, zd0Var.f) && en7.u(this.g, zd0Var.g) && en7.u(this.h, zd0Var.h) && en7.u(this.i, zd0Var.i) && en7.u(this.j, zd0Var.j) && en7.u(this.k, zd0Var.k) && en7.u(this.l, zd0Var.l);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l});
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.a);
        String strValueOf2 = String.valueOf(this.b);
        String strValueOf3 = String.valueOf(this.c);
        String strValueOf4 = String.valueOf(this.d);
        String strValueOf5 = String.valueOf(this.e);
        String strValueOf6 = String.valueOf(this.f);
        String strValueOf7 = String.valueOf(this.g);
        String strValueOf8 = String.valueOf(this.h);
        String strValueOf9 = String.valueOf(this.i);
        String strValueOf10 = String.valueOf(this.j);
        String strValueOf11 = String.valueOf(this.k);
        StringBuilder sbU = y30.u("AuthenticationExtensions{\n fidoAppIdExtension=", strValueOf, ", \n cableAuthenticationExtension=", strValueOf2, ", \n userVerificationMethodExtension=");
        ka1.C(sbU, strValueOf3, ", \n googleMultiAssertionExtension=", strValueOf4, ", \n googleSessionIdExtension=");
        ka1.C(sbU, strValueOf5, ", \n googleSilentVerificationExtension=", strValueOf6, ", \n devicePublicKeyExtension=");
        ka1.C(sbU, strValueOf7, ", \n googleTunnelServerIdExtension=", strValueOf8, ", \n googleThirdPartyPaymentExtension=");
        ka1.C(sbU, strValueOf9, ", \n prfExtension=", strValueOf10, ", \n simpleTransactionAuthorizationExtension=");
        return ka1.v(sbU, strValueOf11, "}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 2, this.a, i);
        fo7.U(parcel, 3, this.b, i);
        fo7.U(parcel, 4, this.c, i);
        fo7.U(parcel, 5, this.d, i);
        fo7.U(parcel, 6, this.e, i);
        fo7.U(parcel, 7, this.f, i);
        fo7.U(parcel, 8, this.g, i);
        fo7.U(parcel, 9, this.h, i);
        fo7.U(parcel, 10, this.i, i);
        fo7.U(parcel, 11, this.j, i);
        fo7.U(parcel, 12, this.k, i);
        fo7.U(parcel, 13, this.l, i);
        fo7.d0(iC0, parcel);
    }
}
