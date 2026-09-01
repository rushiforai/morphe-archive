package defpackage;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.fido.fido2.api.common.AttestationConveyancePreference$UnsupportedAttestationConveyancePreferenceException;
import com.google.android.gms.fido.fido2.api.common.PublicKeyCredentialType$UnsupportedPublicKeyCredTypeException;
import com.google.android.gms.fido.fido2.api.common.ResidentKeyRequirement$UnsupportedResidentKeyRequirementException;
import com.google.android.gms.fido.fido2.api.common.TokenBinding$UnsupportedTokenBindingStatusException;
import com.google.android.gms.fido.fido2.api.common.zzbc;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lvf implements Parcelable.Creator {
    public final /* synthetic */ int a;

    public /* synthetic */ lvf(int i) {
        this.a = i;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean zL = false;
        int iM = 0;
        int iM2 = 0;
        int iM3 = 0;
        int iM4 = 0;
        boolean zL2 = false;
        String strP = null;
        String strP2 = null;
        String strP3 = null;
        String strP4 = null;
        String strP5 = null;
        ArrayList arrayListS = null;
        ArrayList arrayListS2 = null;
        String strP6 = null;
        String strP7 = null;
        String strP8 = null;
        String strP9 = null;
        byte[] bArrN = null;
        switch (this.a) {
            case 0:
                int iJ0 = vn7.j0(parcel);
                String strP10 = null;
                String strP11 = null;
                while (parcel.dataPosition() < iJ0) {
                    int i = parcel.readInt();
                    char c = (char) i;
                    if (c == 2) {
                        strP = vn7.p(i, parcel);
                    } else if (c == 3) {
                        strP10 = vn7.p(i, parcel);
                    } else if (c != 4) {
                        vn7.a0(i, parcel);
                    } else {
                        strP11 = vn7.p(i, parcel);
                    }
                }
                vn7.t(iJ0, parcel);
                return new caa(strP, strP10, strP11);
            case 1:
                try {
                    return daa.fromString(parcel.readString());
                } catch (PublicKeyCredentialType$UnsupportedPublicKeyCredTypeException e) {
                    ik4.j(e);
                    return null;
                }
            case 2:
                int iJ02 = vn7.j0(parcel);
                String strP12 = null;
                String strP13 = null;
                crf crfVar = null;
                long jO = 0;
                while (parcel.dataPosition() < iJ02) {
                    int i2 = parcel.readInt();
                    char c2 = (char) i2;
                    if (c2 == 1) {
                        strP12 = vn7.p(i2, parcel);
                    } else if (c2 == 2) {
                        strP13 = vn7.p(i2, parcel);
                    } else if (c2 == 3) {
                        jO = vn7.O(i2, parcel);
                    } else if (c2 != 4) {
                        vn7.a0(i2, parcel);
                    } else {
                        crfVar = (crf) vn7.o(parcel, i2, crf.CREATOR);
                    }
                }
                vn7.t(iJ02, parcel);
                return new hqd(strP12, strP13, jO, crfVar);
            case 3:
                int iJ03 = vn7.j0(parcel);
                String strP14 = null;
                String strP15 = null;
                String strP16 = null;
                while (parcel.dataPosition() < iJ03) {
                    int i3 = parcel.readInt();
                    char c3 = (char) i3;
                    if (c3 == 2) {
                        bArrN = vn7.n(i3, parcel);
                    } else if (c3 == 3) {
                        strP14 = vn7.p(i3, parcel);
                    } else if (c3 == 4) {
                        strP15 = vn7.p(i3, parcel);
                    } else if (c3 != 5) {
                        vn7.a0(i3, parcel);
                    } else {
                        strP16 = vn7.p(i3, parcel);
                    }
                }
                vn7.t(iJ03, parcel);
                return new eaa(bArrN, strP14, strP15, strP16);
            case 4:
                int iJ04 = vn7.j0(parcel);
                String strP17 = null;
                while (parcel.dataPosition() < iJ04) {
                    int i4 = parcel.readInt();
                    char c4 = (char) i4;
                    if (c4 == 1) {
                        strP9 = vn7.p(i4, parcel);
                    } else if (c4 != 2) {
                        vn7.a0(i4, parcel);
                    } else {
                        strP17 = vn7.p(i4, parcel);
                    }
                }
                vn7.t(iJ04, parcel);
                return new eud(strP9, strP17);
            case 5:
                String string = parcel.readString();
                if (string == null) {
                    string = "";
                }
                try {
                    return bcb.fromString(string);
                } catch (ResidentKeyRequirement$UnsupportedResidentKeyRequirementException e2) {
                    ik4.j(e2);
                    return null;
                }
            case 6:
                int iJ05 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ05) {
                    int i5 = parcel.readInt();
                    if (((char) i5) != 1) {
                        vn7.a0(i5, parcel);
                    } else {
                        strP8 = vn7.p(i5, parcel);
                    }
                }
                vn7.t(iJ05, parcel);
                return new pvf(strP8);
            case 7:
                try {
                    return pnd.fromString(parcel.readString());
                } catch (TokenBinding$UnsupportedTokenBindingStatusException e3) {
                    ik4.j(e3);
                    return null;
                }
            case 8:
                int iJ06 = vn7.j0(parcel);
                String strP18 = null;
                while (parcel.dataPosition() < iJ06) {
                    int i6 = parcel.readInt();
                    char c5 = (char) i6;
                    if (c5 == 2) {
                        strP7 = vn7.p(i6, parcel);
                    } else if (c5 != 3) {
                        vn7.a0(i6, parcel);
                    } else {
                        strP18 = vn7.p(i6, parcel);
                    }
                }
                vn7.t(iJ06, parcel);
                return new qnd(strP7, strP18);
            case 9:
                int iJ07 = vn7.j0(parcel);
                String strP19 = null;
                while (parcel.dataPosition() < iJ07) {
                    int i7 = parcel.readInt();
                    char c6 = (char) i7;
                    if (c6 == 1) {
                        strP6 = vn7.p(i7, parcel);
                    } else if (c6 != 2) {
                        vn7.a0(i7, parcel);
                    } else {
                        strP19 = vn7.p(i7, parcel);
                    }
                }
                vn7.t(iJ07, parcel);
                n44 n44Var = new n44();
                n44Var.a = strP6;
                n44Var.b = strP19;
                return n44Var;
            case 10:
                return new ukf((PendingIntent) parcel.readParcelable(xjb.class.getClassLoader()), parcel.readInt() != 0);
            case 11:
                int iJ08 = vn7.j0(parcel);
                int iM5 = 0;
                boolean zL3 = false;
                String strP20 = null;
                long jO2 = -1;
                while (parcel.dataPosition() < iJ08) {
                    int i8 = parcel.readInt();
                    char c7 = (char) i8;
                    if (c7 == 1) {
                        strP20 = vn7.p(i8, parcel);
                    } else if (c7 == 2) {
                        iM5 = vn7.M(i8, parcel);
                    } else if (c7 == 3) {
                        jO2 = vn7.O(i8, parcel);
                    } else if (c7 != 4) {
                        vn7.a0(i8, parcel);
                    } else {
                        zL3 = vn7.L(i8, parcel);
                    }
                }
                vn7.t(iJ08, parcel);
                return new da4(iM5, jO2, strP20, zL3);
            case 12:
                try {
                    return z90.fromString(parcel.readString());
                } catch (AttestationConveyancePreference$UnsupportedAttestationConveyancePreferenceException e4) {
                    ik4.j(e4);
                    return null;
                }
            case 13:
                return new i0g(parcel.readStrongBinder());
            case 14:
                int iJ09 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ09) {
                    int i9 = parcel.readInt();
                    if (((char) i9) != 1) {
                        vn7.a0(i9, parcel);
                    } else {
                        zL2 = vn7.L(i9, parcel);
                    }
                }
                vn7.t(iJ09, parcel);
                return new tne(zL2);
            case 15:
                try {
                    return une.fromString(parcel.readString());
                } catch (zzbc e5) {
                    ik4.j(e5);
                    return null;
                }
            case 16:
                int iJ010 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ010) {
                    int i10 = parcel.readInt();
                    if (((char) i10) != 1) {
                        vn7.a0(i10, parcel);
                    } else {
                        arrayListS2 = vn7.s(parcel, i10, ype.CREATOR);
                    }
                }
                vn7.t(iJ010, parcel);
                return new xpe(arrayListS2);
            case 17:
                int iJ011 = vn7.j0(parcel);
                short s = 0;
                short s2 = 0;
                while (parcel.dataPosition() < iJ011) {
                    int i11 = parcel.readInt();
                    char c8 = (char) i11;
                    if (c8 == 1) {
                        iM4 = vn7.M(i11, parcel);
                    } else if (c8 == 2) {
                        vn7.n0(parcel, i11, 4);
                        s = (short) parcel.readInt();
                    } else if (c8 != 3) {
                        vn7.a0(i11, parcel);
                    } else {
                        vn7.n0(parcel, i11, 4);
                        s2 = (short) parcel.readInt();
                    }
                }
                vn7.t(iJ011, parcel);
                return new ype(iM4, s, s2);
            case 18:
                int iJ012 = vn7.j0(parcel);
                ArrayList arrayListS3 = null;
                while (parcel.dataPosition() < iJ012) {
                    int i12 = parcel.readInt();
                    char c9 = (char) i12;
                    if (c9 == 1) {
                        arrayListS = vn7.s(parcel, i12, d99.CREATOR);
                    } else if (c9 != 2) {
                        vn7.a0(i12, parcel);
                    } else {
                        arrayListS3 = vn7.s(parcel, i12, hqd.CREATOR);
                    }
                }
                vn7.t(iJ012, parcel);
                return new kwf(arrayListS, arrayListS3);
            case 19:
                int iJ013 = vn7.j0(parcel);
                int iM6 = 0;
                int iM7 = 0;
                boolean zL4 = true;
                while (parcel.dataPosition() < iJ013) {
                    int i13 = parcel.readInt();
                    char c10 = (char) i13;
                    if (c10 == 1) {
                        iM3 = vn7.M(i13, parcel);
                    } else if (c10 == 2) {
                        iM6 = vn7.M(i13, parcel);
                    } else if (c10 == 3) {
                        iM7 = vn7.M(i13, parcel);
                    } else if (c10 != 4) {
                        vn7.a0(i13, parcel);
                    } else {
                        zL4 = vn7.L(i13, parcel);
                    }
                }
                vn7.t(iJ013, parcel);
                return new fy1(iM3, iM6, iM7, zL4);
            case 20:
                int iJ014 = vn7.j0(parcel);
                xpe xpeVar = null;
                o3g o3gVar = null;
                be0 be0Var = null;
                i6g i6gVar = null;
                String strP21 = null;
                while (parcel.dataPosition() < iJ014) {
                    int i14 = parcel.readInt();
                    char c11 = (char) i14;
                    if (c11 == 1) {
                        xpeVar = (xpe) vn7.o(parcel, i14, xpe.CREATOR);
                    } else if (c11 == 2) {
                        o3gVar = (o3g) vn7.o(parcel, i14, o3g.CREATOR);
                    } else if (c11 == 3) {
                        be0Var = (be0) vn7.o(parcel, i14, be0.CREATOR);
                    } else if (c11 == 4) {
                        i6gVar = (i6g) vn7.o(parcel, i14, i6g.CREATOR);
                    } else if (c11 != 5) {
                        vn7.a0(i14, parcel);
                    } else {
                        strP21 = vn7.p(i14, parcel);
                    }
                }
                vn7.t(iJ014, parcel);
                return new ae0(xpeVar, o3gVar, be0Var, i6gVar, strP21);
            case 21:
                int iJ015 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ015) {
                    int i15 = parcel.readInt();
                    char c12 = (char) i15;
                    if (c12 == 1) {
                        iM2 = vn7.M(i15, parcel);
                    } else if (c12 != 2) {
                        vn7.a0(i15, parcel);
                    } else {
                        strP5 = vn7.p(i15, parcel);
                    }
                }
                vn7.t(iJ015, parcel);
                return new Scope(iM2, strP5);
            case 22:
                int iJ016 = vn7.j0(parcel);
                df4 df4Var = null;
                kkg kkgVar = null;
                tne tneVar = null;
                gvg gvgVar = null;
                olf olfVar = null;
                vmf vmfVar = null;
                qng qngVar = null;
                zof zofVar = null;
                le5 le5Var = null;
                dtf dtfVar = null;
                pvf pvfVar = null;
                uqf uqfVar = null;
                while (parcel.dataPosition() < iJ016) {
                    int i16 = parcel.readInt();
                    switch ((char) i16) {
                        case 2:
                            df4Var = (df4) vn7.o(parcel, i16, df4.CREATOR);
                            break;
                        case 3:
                            kkgVar = (kkg) vn7.o(parcel, i16, kkg.CREATOR);
                            break;
                        case 4:
                            tneVar = (tne) vn7.o(parcel, i16, tne.CREATOR);
                            break;
                        case 5:
                            gvgVar = (gvg) vn7.o(parcel, i16, gvg.CREATOR);
                            break;
                        case 6:
                            olfVar = (olf) vn7.o(parcel, i16, olf.CREATOR);
                            break;
                        case 7:
                            vmfVar = (vmf) vn7.o(parcel, i16, vmf.CREATOR);
                            break;
                        case '\b':
                            qngVar = (qng) vn7.o(parcel, i16, qng.CREATOR);
                            break;
                        case '\t':
                            zofVar = (zof) vn7.o(parcel, i16, zof.CREATOR);
                            break;
                        case '\n':
                            le5Var = (le5) vn7.o(parcel, i16, le5.CREATOR);
                            break;
                        case 11:
                            dtfVar = (dtf) vn7.o(parcel, i16, dtf.CREATOR);
                            break;
                        case '\f':
                            pvfVar = (pvf) vn7.o(parcel, i16, pvf.CREATOR);
                            break;
                        case '\r':
                            uqfVar = (uqf) vn7.o(parcel, i16, uqf.CREATOR);
                            break;
                        default:
                            vn7.a0(i16, parcel);
                            break;
                    }
                }
                vn7.t(iJ016, parcel);
                return new zd0(df4Var, kkgVar, tneVar, gvgVar, olfVar, vmfVar, qngVar, zofVar, le5Var, dtfVar, pvfVar, uqfVar);
            case 23:
                int iJ017 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ017) {
                    int i17 = parcel.readInt();
                    if (((char) i17) != 1) {
                        vn7.a0(i17, parcel);
                    } else {
                        strP4 = vn7.p(i17, parcel);
                    }
                }
                vn7.t(iJ017, parcel);
                o44 o44Var = new o44();
                o44Var.a = strP4;
                return o44Var;
            case 24:
                int iJ018 = vn7.j0(parcel);
                String strP22 = null;
                String strP23 = null;
                String strP24 = null;
                frf frfVar = null;
                String strP25 = null;
                String strP26 = null;
                String strP27 = null;
                while (parcel.dataPosition() < iJ018) {
                    int i18 = parcel.readInt();
                    switch ((char) i18) {
                        case 1:
                            strP22 = vn7.p(i18, parcel);
                            break;
                        case 2:
                            strP23 = vn7.p(i18, parcel);
                            break;
                        case 3:
                            strP24 = vn7.p(i18, parcel);
                            break;
                        case 4:
                            frfVar = (frf) vn7.o(parcel, i18, frf.CREATOR);
                            break;
                        case 5:
                            strP25 = vn7.p(i18, parcel);
                            break;
                        case 6:
                            strP26 = vn7.p(i18, parcel);
                            break;
                        case 7:
                            strP27 = vn7.p(i18, parcel);
                            break;
                        default:
                            vn7.a0(i18, parcel);
                            break;
                    }
                }
                vn7.t(iJ018, parcel);
                return new lxf(strP22, strP23, strP24, frfVar, strP25, strP26, strP27);
            case 25:
                int iJ019 = vn7.j0(parcel);
                PendingIntent pendingIntent = null;
                h42 h42Var = null;
                while (parcel.dataPosition() < iJ019) {
                    int i19 = parcel.readInt();
                    char c13 = (char) i19;
                    if (c13 == 1) {
                        iM = vn7.M(i19, parcel);
                    } else if (c13 == 2) {
                        strP3 = vn7.p(i19, parcel);
                    } else if (c13 == 3) {
                        pendingIntent = (PendingIntent) vn7.o(parcel, i19, PendingIntent.CREATOR);
                    } else if (c13 != 4) {
                        vn7.a0(i19, parcel);
                    } else {
                        h42Var = (h42) vn7.o(parcel, i19, h42.CREATOR);
                    }
                }
                vn7.t(iJ019, parcel);
                return new Status(iM, strP3, pendingIntent, h42Var);
            case 26:
                int iJ020 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ020) {
                    int i20 = parcel.readInt();
                    if (((char) i20) != 1) {
                        vn7.a0(i20, parcel);
                    } else {
                        zL = vn7.L(i20, parcel);
                    }
                }
                vn7.t(iJ020, parcel);
                return new be0(zL);
            case 27:
                int iJ021 = vn7.j0(parcel);
                boolean zL5 = false;
                String strP28 = null;
                String strP29 = null;
                String strP30 = null;
                String strP31 = null;
                while (parcel.dataPosition() < iJ021) {
                    int i21 = parcel.readInt();
                    char c14 = (char) i21;
                    if (c14 == 1) {
                        strP28 = vn7.p(i21, parcel);
                    } else if (c14 == 2) {
                        strP29 = vn7.p(i21, parcel);
                    } else if (c14 == 3) {
                        strP30 = vn7.p(i21, parcel);
                    } else if (c14 == 4) {
                        strP31 = vn7.p(i21, parcel);
                    } else if (c14 != 5) {
                        vn7.a0(i21, parcel);
                    } else {
                        zL5 = vn7.L(i21, parcel);
                    }
                }
                vn7.t(iJ021, parcel);
                return new qw3(strP28, strP29, strP30, strP31, zL5);
            case 28:
                int iJ022 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ022) {
                    vn7.a0(parcel.readInt(), parcel);
                }
                vn7.t(iJ022, parcel);
                return new r16();
            default:
                int iJ023 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ023) {
                    int i22 = parcel.readInt();
                    if (((char) i22) != 1) {
                        vn7.a0(i22, parcel);
                    } else {
                        strP2 = vn7.p(i22, parcel);
                    }
                }
                vn7.t(iJ023, parcel);
                return new v84(strP2);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ Object[] newArray(int i) {
        switch (this.a) {
            case 0:
                return new caa[i];
            case 1:
                return new daa[i];
            case 2:
                return new hqd[i];
            case 3:
                return new eaa[i];
            case 4:
                return new eud[i];
            case 5:
                return new bcb[i];
            case 6:
                return new pvf[i];
            case 7:
                return new pnd[i];
            case 8:
                return new qnd[i];
            case 9:
                return new n44[i];
            case 10:
                return new xjb[i];
            case 11:
                return new da4[i];
            case 12:
                return new z90[i];
            case 13:
                return new i0g[i];
            case 14:
                return new tne[i];
            case 15:
                return new une[i];
            case 16:
                return new xpe[i];
            case 17:
                return new ype[i];
            case 18:
                return new kwf[i];
            case 19:
                return new fy1[i];
            case 20:
                return new ae0[i];
            case 21:
                return new Scope[i];
            case 22:
                return new zd0[i];
            case 23:
                return new o44[i];
            case 24:
                return new lxf[i];
            case 25:
                return new Status[i];
            case 26:
                return new be0[i];
            case 27:
                return new qw3[i];
            case 28:
                return new r16[i];
            default:
                return new v84[i];
        }
    }
}
