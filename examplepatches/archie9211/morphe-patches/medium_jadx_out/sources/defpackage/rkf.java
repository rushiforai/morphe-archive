package defpackage;

import android.app.PendingIntent;
import android.content.Intent;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.ResultReceiver;
import com.google.android.gms.fido.common.Transport;
import com.google.android.gms.fido.fido2.api.common.Attachment$UnsupportedAttachmentException;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rkf implements Parcelable.Creator {
    public final /* synthetic */ int a;

    public /* synthetic */ rkf(int i) {
        this.a = i;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        long jO = 0;
        switch (this.a) {
            case 0:
                int iJ0 = vn7.j0(parcel);
                String strP = null;
                String strP2 = null;
                String strP3 = null;
                String strP4 = null;
                Uri uri = null;
                String strP5 = null;
                String strP6 = null;
                String strP7 = null;
                x9a x9aVar = null;
                while (parcel.dataPosition() < iJ0) {
                    int i = parcel.readInt();
                    switch ((char) i) {
                        case 1:
                            strP = vn7.p(i, parcel);
                            break;
                        case 2:
                            strP2 = vn7.p(i, parcel);
                            break;
                        case 3:
                            strP3 = vn7.p(i, parcel);
                            break;
                        case 4:
                            strP4 = vn7.p(i, parcel);
                            break;
                        case 5:
                            uri = (Uri) vn7.o(parcel, i, Uri.CREATOR);
                            break;
                        case 6:
                            strP5 = vn7.p(i, parcel);
                            break;
                        case 7:
                            strP6 = vn7.p(i, parcel);
                            break;
                        case '\b':
                            strP7 = vn7.p(i, parcel);
                            break;
                        case '\t':
                            x9aVar = (x9a) vn7.o(parcel, i, x9a.CREATOR);
                            break;
                        default:
                            vn7.a0(i, parcel);
                            break;
                    }
                }
                vn7.t(iJ0, parcel);
                return new u9c(strP, strP2, strP3, strP4, uri, strP5, strP6, strP7, x9aVar);
            case 1:
                int iJ02 = vn7.j0(parcel);
                String strP8 = null;
                String strP9 = null;
                while (parcel.dataPosition() < iJ02) {
                    int i2 = parcel.readInt();
                    char c = (char) i2;
                    if (c == 1) {
                        strP9 = vn7.p(i2, parcel);
                    } else if (c != 2) {
                        vn7.a0(i2, parcel);
                    } else {
                        strP8 = vn7.p(i2, parcel);
                    }
                }
                vn7.t(iJ02, parcel);
                return new y9c(strP9, strP8);
            case 2:
                int iJ03 = vn7.j0(parcel);
                int iM = 0;
                int iM2 = 0;
                PendingIntent pendingIntent = null;
                String strP10 = null;
                Integer numN = null;
                while (parcel.dataPosition() < iJ03) {
                    int i3 = parcel.readInt();
                    char c2 = (char) i3;
                    if (c2 == 1) {
                        iM = vn7.M(i3, parcel);
                    } else if (c2 == 2) {
                        iM2 = vn7.M(i3, parcel);
                    } else if (c2 == 3) {
                        pendingIntent = (PendingIntent) vn7.o(parcel, i3, PendingIntent.CREATOR);
                    } else if (c2 == 4) {
                        strP10 = vn7.p(i3, parcel);
                    } else if (c2 != 5) {
                        vn7.a0(i3, parcel);
                    } else {
                        numN = vn7.N(i3, parcel);
                    }
                }
                vn7.t(iJ03, parcel);
                return new h42(iM, iM2, pendingIntent, strP10, numN);
            case 3:
                try {
                    return y90.fromString(parcel.readString());
                } catch (Attachment$UnsupportedAttachmentException e) {
                    ik4.j(e);
                    return null;
                }
            case 4:
                int iJ04 = vn7.j0(parcel);
                Intent intent = null;
                while (parcel.dataPosition() < iJ04) {
                    int i4 = parcel.readInt();
                    if (((char) i4) != 1) {
                        vn7.a0(i4, parcel);
                    } else {
                        intent = (Intent) vn7.o(parcel, i4, Intent.CREATOR);
                    }
                }
                vn7.t(iJ04, parcel);
                return new ip1(intent);
            case 5:
                int iJ05 = vn7.j0(parcel);
                boolean zL = false;
                while (parcel.dataPosition() < iJ05) {
                    int i5 = parcel.readInt();
                    if (((char) i5) != 1) {
                        vn7.a0(i5, parcel);
                    } else {
                        zL = vn7.L(i5, parcel);
                    }
                }
                vn7.t(iJ05, parcel);
                return new gvg(zL);
            case 6:
                int iJ06 = vn7.j0(parcel);
                npg npgVar = null;
                lxf lxfVar = null;
                xmf xmfVar = null;
                while (parcel.dataPosition() < iJ06) {
                    int i6 = parcel.readInt();
                    char c3 = (char) i6;
                    if (c3 == 1) {
                        xmfVar = (xmf) vn7.o(parcel, i6, xmf.CREATOR);
                    } else if (c3 == 2) {
                        npgVar = (npg) vn7.o(parcel, i6, npg.CREATOR);
                    } else if (c3 != 3) {
                        vn7.a0(i6, parcel);
                    } else {
                        lxfVar = (lxf) vn7.o(parcel, i6, lxf.CREATOR);
                    }
                }
                vn7.t(iJ06, parcel);
                ctg ctgVar = new ctg();
                ctgVar.a = xmfVar;
                ctgVar.b = npgVar;
                ctgVar.c = lxfVar;
                return ctgVar;
            case 7:
                int iJ07 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ07) {
                    int i7 = parcel.readInt();
                    if (((char) i7) != 1) {
                        vn7.a0(i7, parcel);
                    } else {
                        jO = vn7.O(i7, parcel);
                    }
                }
                vn7.t(iJ07, parcel);
                return new olf(jO);
            case 8:
                int iJ08 = vn7.j0(parcel);
                String strP11 = null;
                String strP12 = null;
                String strP13 = null;
                String strP14 = null;
                String strP15 = null;
                String strP16 = null;
                boolean zL2 = false;
                String strP17 = null;
                while (parcel.dataPosition() < iJ08) {
                    int i8 = parcel.readInt();
                    switch ((char) i8) {
                        case 1:
                            strP11 = vn7.p(i8, parcel);
                            break;
                        case 2:
                            strP12 = vn7.p(i8, parcel);
                            break;
                        case 3:
                            strP15 = vn7.p(i8, parcel);
                            break;
                        case 4:
                            strP14 = vn7.p(i8, parcel);
                            break;
                        case 5:
                            strP13 = vn7.p(i8, parcel);
                            break;
                        case 6:
                            strP16 = vn7.p(i8, parcel);
                            break;
                        case 7:
                            zL2 = vn7.L(i8, parcel);
                            break;
                        case '\b':
                            strP17 = vn7.p(i8, parcel);
                            break;
                        default:
                            vn7.a0(i8, parcel);
                            break;
                    }
                }
                vn7.t(iJ08, parcel);
                return new ivg(strP11, strP12, strP13, strP14, strP15, strP16, zL2, strP17);
            case 9:
                int iJ09 = vn7.j0(parcel);
                boolean zL3 = false;
                while (parcel.dataPosition() < iJ09) {
                    int i9 = parcel.readInt();
                    if (((char) i9) != 1) {
                        vn7.a0(i9, parcel);
                    } else {
                        zL3 = vn7.L(i9, parcel);
                    }
                }
                vn7.t(iJ09, parcel);
                return new vmf(zL3);
            case 10:
                int iJ010 = vn7.j0(parcel);
                boolean zL4 = false;
                while (parcel.dataPosition() < iJ010) {
                    int i10 = parcel.readInt();
                    if (((char) i10) != 1) {
                        vn7.a0(i10, parcel);
                    } else {
                        zL4 = vn7.L(i10, parcel);
                    }
                }
                vn7.t(iJ010, parcel);
                return new le5(zL4);
            case 11:
                int iJ011 = vn7.j0(parcel);
                zpf zpfVar = null;
                ivg ivgVar = null;
                String strP18 = null;
                String strP19 = null;
                ArrayList arrayListS = null;
                ArrayList arrayListQ = null;
                lxf lxfVar2 = null;
                String strP20 = null;
                ArrayList arrayListS2 = null;
                kwf kwfVar = null;
                Boolean boolValueOf = null;
                gof gofVar = null;
                boolean zL5 = false;
                while (parcel.dataPosition() < iJ011) {
                    int i11 = parcel.readInt();
                    ArrayList arrayList = arrayListS2;
                    switch ((char) i11) {
                        case 1:
                            zpfVar = (zpf) vn7.o(parcel, i11, zpf.CREATOR);
                            break;
                        case 2:
                            ivgVar = (ivg) vn7.o(parcel, i11, ivg.CREATOR);
                            break;
                        case 3:
                            strP18 = vn7.p(i11, parcel);
                            break;
                        case 4:
                            strP19 = vn7.p(i11, parcel);
                            break;
                        case 5:
                            arrayListS = vn7.s(parcel, i11, ivg.CREATOR);
                            break;
                        case 6:
                            arrayListQ = vn7.q(i11, parcel);
                            break;
                        case 7:
                            strP20 = vn7.p(i11, parcel);
                            break;
                        case '\b':
                            int iP = vn7.P(i11, parcel);
                            if (iP == 0) {
                                boolValueOf = null;
                            } else {
                                vn7.r0(parcel, iP, 4);
                                boolValueOf = Boolean.valueOf(parcel.readInt() != 0);
                            }
                            break;
                        case '\t':
                            gofVar = (gof) vn7.o(parcel, i11, gof.CREATOR);
                            break;
                        case '\n':
                            zL5 = vn7.L(i11, parcel);
                            break;
                        case 11:
                            lxfVar2 = (lxf) vn7.o(parcel, i11, lxf.CREATOR);
                            break;
                        case '\f':
                            kwfVar = (kwf) vn7.o(parcel, i11, kwf.CREATOR);
                            break;
                        case '\r':
                            arrayListS2 = vn7.s(parcel, i11, dvf.CREATOR);
                            continue;
                        default:
                            vn7.a0(i11, parcel);
                            break;
                    }
                    arrayListS2 = arrayList;
                }
                vn7.t(iJ011, parcel);
                xmf xmfVar2 = new xmf();
                xmfVar2.a = zpfVar;
                xmfVar2.b = ivgVar;
                xmfVar2.c = strP18;
                xmfVar2.d = strP19;
                xmfVar2.e = arrayListS;
                xmfVar2.f = arrayListQ;
                xmfVar2.g = strP20;
                xmfVar2.h = boolValueOf;
                xmfVar2.i = gofVar;
                xmfVar2.j = zL5;
                xmfVar2.k = lxfVar2;
                xmfVar2.l = kwfVar;
                xmfVar2.m = arrayListS2;
                return xmfVar2;
            case 12:
                int iJ012 = vn7.j0(parcel);
                int iM3 = 0;
                boolean zL6 = false;
                boolean zL7 = false;
                int iM4 = 0;
                int iM5 = 0;
                while (parcel.dataPosition() < iJ012) {
                    int i12 = parcel.readInt();
                    char c4 = (char) i12;
                    if (c4 == 1) {
                        iM3 = vn7.M(i12, parcel);
                    } else if (c4 == 2) {
                        zL6 = vn7.L(i12, parcel);
                    } else if (c4 == 3) {
                        zL7 = vn7.L(i12, parcel);
                    } else if (c4 == 4) {
                        iM4 = vn7.M(i12, parcel);
                    } else if (c4 != 5) {
                        vn7.a0(i12, parcel);
                    } else {
                        iM5 = vn7.M(i12, parcel);
                    }
                }
                vn7.t(iJ012, parcel);
                return new plb(iM3, zL6, zL7, iM4, iM5);
            case 13:
                int iJ013 = vn7.j0(parcel);
                String strP21 = null;
                while (parcel.dataPosition() < iJ013) {
                    int i13 = parcel.readInt();
                    if (((char) i13) != 1) {
                        vn7.a0(i13, parcel);
                    } else {
                        strP21 = vn7.p(i13, parcel);
                    }
                }
                vn7.t(iJ013, parcel);
                return new zof(strP21);
            case 14:
                int iJ014 = vn7.j0(parcel);
                String strP22 = null;
                String strP23 = null;
                Long lValueOf = null;
                String strP24 = null;
                while (true) {
                    Long lValueOf2 = null;
                    while (parcel.dataPosition() < iJ014) {
                        int i14 = parcel.readInt();
                        char c5 = (char) i14;
                        if (c5 != 2) {
                            if (c5 != 3) {
                                if (c5 != 4) {
                                    if (c5 == 5) {
                                        strP24 = vn7.p(i14, parcel);
                                    } else if (c5 != 6) {
                                        vn7.a0(i14, parcel);
                                    } else {
                                        int iP2 = vn7.P(i14, parcel);
                                        if (iP2 == 0) {
                                        }
                                        vn7.r0(parcel, iP2, 8);
                                        lValueOf2 = Long.valueOf(parcel.readLong());
                                    }
                                    break;
                                } else {
                                    int iP3 = vn7.P(i14, parcel);
                                    if (iP3 == 0) {
                                        lValueOf = null;
                                    } else {
                                        vn7.r0(parcel, iP3, 8);
                                        lValueOf = Long.valueOf(parcel.readLong());
                                    }
                                }
                            } else {
                                strP23 = vn7.p(i14, parcel);
                            }
                        } else {
                            strP22 = vn7.p(i14, parcel);
                        }
                    }
                    vn7.t(iJ014, parcel);
                    return new zpf(strP22, strP23, lValueOf, strP24, lValueOf2);
                }
                break;
            case 15:
                int iJ015 = vn7.j0(parcel);
                long jO2 = 0;
                while (parcel.dataPosition() < iJ015) {
                    int i15 = parcel.readInt();
                    char c6 = (char) i15;
                    if (c6 == 1) {
                        jO = vn7.O(i15, parcel);
                    } else if (c6 != 2) {
                        vn7.a0(i15, parcel);
                    } else {
                        jO2 = vn7.O(i15, parcel);
                    }
                }
                vn7.t(iJ015, parcel);
                return new gof(jO, jO2);
            case 16:
                int iJ016 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ016) {
                    vn7.a0(parcel.readInt(), parcel);
                }
                vn7.t(iJ016, parcel);
                return new crf();
            case 17:
                int iJ017 = vn7.j0(parcel);
                boolean zL8 = false;
                String strP25 = null;
                String strP26 = null;
                String strP27 = null;
                String strP28 = null;
                String strP29 = null;
                boolean zL9 = false;
                String strP30 = null;
                String strP31 = null;
                String strP32 = null;
                String strP33 = null;
                String strP34 = null;
                String strP35 = null;
                boolean zL10 = false;
                String strP36 = null;
                String strP37 = null;
                while (parcel.dataPosition() < iJ017) {
                    int i16 = parcel.readInt();
                    String str = strP35;
                    switch ((char) i16) {
                        case 2:
                            strP32 = vn7.p(i16, parcel);
                            break;
                        case 3:
                            strP25 = vn7.p(i16, parcel);
                            break;
                        case 4:
                            strP26 = vn7.p(i16, parcel);
                            break;
                        case 5:
                            strP27 = vn7.p(i16, parcel);
                            break;
                        case 6:
                            strP28 = vn7.p(i16, parcel);
                            break;
                        case 7:
                            strP29 = vn7.p(i16, parcel);
                            break;
                        case '\b':
                            strP30 = vn7.p(i16, parcel);
                            break;
                        case '\t':
                            strP31 = vn7.p(i16, parcel);
                            break;
                        case '\n':
                            zL9 = vn7.L(i16, parcel);
                            break;
                        case 11:
                            zL8 = vn7.L(i16, parcel);
                            break;
                        case '\f':
                            strP33 = vn7.p(i16, parcel);
                            break;
                        case '\r':
                            strP34 = vn7.p(i16, parcel);
                            break;
                        case 14:
                            strP35 = vn7.p(i16, parcel);
                            continue;
                        case 15:
                            strP36 = vn7.p(i16, parcel);
                            break;
                        case 16:
                            zL10 = vn7.L(i16, parcel);
                            break;
                        case 17:
                            strP37 = vn7.p(i16, parcel);
                            break;
                        default:
                            vn7.a0(i16, parcel);
                            break;
                    }
                    strP35 = str;
                }
                vn7.t(iJ017, parcel);
                frf frfVar = new frf();
                frfVar.a = strP32;
                frfVar.b = strP25;
                frfVar.c = strP26;
                frfVar.d = strP27;
                frfVar.e = strP28;
                frfVar.f = strP29;
                frfVar.g = strP30;
                frfVar.h = strP31;
                frfVar.i = zL9;
                frfVar.j = zL8;
                frfVar.k = strP33;
                frfVar.l = strP34;
                frfVar.m = strP35;
                frfVar.n = strP36;
                frfVar.o = zL10;
                frfVar.p = strP37;
                return frfVar;
            case 18:
                int iJ018 = vn7.j0(parcel);
                byte[] bArrN = null;
                byte[] bArrN2 = null;
                byte[] bArrN3 = null;
                int iM6 = 0;
                while (parcel.dataPosition() < iJ018) {
                    int i17 = parcel.readInt();
                    char c7 = (char) i17;
                    if (c7 == 1) {
                        bArrN = vn7.n(i17, parcel);
                    } else if (c7 == 2) {
                        bArrN2 = vn7.n(i17, parcel);
                    } else if (c7 == 3) {
                        bArrN3 = vn7.n(i17, parcel);
                    } else if (c7 != 4) {
                        vn7.a0(i17, parcel);
                    } else {
                        iM6 = vn7.M(i17, parcel);
                    }
                }
                vn7.t(iJ018, parcel);
                return new uqf(bArrN == null ? null : a6g.s(bArrN.length, bArrN), bArrN2 == null ? null : a6g.s(bArrN2.length, bArrN2), bArrN3 == null ? null : a6g.s(bArrN3.length, bArrN3), iM6);
            case 19:
                int iJ019 = vn7.j0(parcel);
                String strP38 = null;
                while (parcel.dataPosition() < iJ019) {
                    int i18 = parcel.readInt();
                    if (((char) i18) != 1) {
                        vn7.a0(i18, parcel);
                    } else {
                        strP38 = vn7.p(i18, parcel);
                    }
                }
                vn7.t(iJ019, parcel);
                return new ed5(strP38);
            case 20:
                int iJ020 = vn7.j0(parcel);
                String strP39 = null;
                String strP40 = null;
                while (parcel.dataPosition() < iJ020) {
                    int i19 = parcel.readInt();
                    char c8 = (char) i19;
                    if (c8 == 1) {
                        strP40 = vn7.p(i19, parcel);
                    } else if (c8 != 2) {
                        vn7.a0(i19, parcel);
                    } else {
                        strP39 = vn7.p(i19, parcel);
                    }
                }
                vn7.t(iJ020, parcel);
                return new fe5(strP40, strP39);
            case 21:
                int iJ021 = vn7.j0(parcel);
                while (true) {
                    byte[][] bArr = null;
                    while (parcel.dataPosition() < iJ021) {
                        int i20 = parcel.readInt();
                        if (((char) i20) != 1) {
                            vn7.a0(i20, parcel);
                        } else {
                            int iP4 = vn7.P(i20, parcel);
                            int iDataPosition = parcel.dataPosition();
                            if (iP4 == 0) {
                            }
                            int i21 = parcel.readInt();
                            byte[][] bArr2 = new byte[i21][];
                            for (int i22 = 0; i22 < i21; i22++) {
                                bArr2[i22] = parcel.createByteArray();
                            }
                            parcel.setDataPosition(iDataPosition + iP4);
                            bArr = bArr2;
                        }
                        break;
                    }
                    vn7.t(iJ021, parcel);
                    return new dtf(bArr);
                }
                break;
            case 22:
                int iJ022 = vn7.j0(parcel);
                String strP41 = null;
                String strP42 = null;
                String strP43 = null;
                while (parcel.dataPosition() < iJ022) {
                    int i23 = parcel.readInt();
                    char c9 = (char) i23;
                    if (c9 == 1) {
                        strP43 = vn7.p(i23, parcel);
                    } else if (c9 == 2) {
                        strP41 = vn7.p(i23, parcel);
                    } else if (c9 != 3) {
                        vn7.a0(i23, parcel);
                    } else {
                        strP42 = vn7.p(i23, parcel);
                    }
                }
                vn7.t(iJ022, parcel);
                return new dvf(strP43, strP41, strP42);
            case 23:
                int iJ023 = vn7.j0(parcel);
                caa caaVar = null;
                eaa eaaVar = null;
                byte[] bArrN4 = null;
                ArrayList arrayListS3 = null;
                Double dValueOf = null;
                ArrayList arrayListS4 = null;
                ie0 ie0Var = null;
                Integer numN2 = null;
                qnd qndVar = null;
                String strP44 = null;
                zd0 zd0Var = null;
                String strP45 = null;
                ResultReceiver resultReceiver = null;
                while (parcel.dataPosition() < iJ023) {
                    int i24 = parcel.readInt();
                    switch ((char) i24) {
                        case 2:
                            caaVar = (caa) vn7.o(parcel, i24, caa.CREATOR);
                            break;
                        case 3:
                            eaaVar = (eaa) vn7.o(parcel, i24, eaa.CREATOR);
                            break;
                        case 4:
                            bArrN4 = vn7.n(i24, parcel);
                            break;
                        case 5:
                            arrayListS3 = vn7.s(parcel, i24, baa.CREATOR);
                            break;
                        case 6:
                            int iP5 = vn7.P(i24, parcel);
                            if (iP5 == 0) {
                                dValueOf = null;
                            } else {
                                vn7.r0(parcel, iP5, 8);
                                dValueOf = Double.valueOf(parcel.readDouble());
                            }
                            break;
                        case 7:
                            arrayListS4 = vn7.s(parcel, i24, aaa.CREATOR);
                            break;
                        case '\b':
                            ie0Var = (ie0) vn7.o(parcel, i24, ie0.CREATOR);
                            break;
                        case '\t':
                            numN2 = vn7.N(i24, parcel);
                            break;
                        case '\n':
                            qndVar = (qnd) vn7.o(parcel, i24, qnd.CREATOR);
                            break;
                        case 11:
                            strP44 = vn7.p(i24, parcel);
                            break;
                        case '\f':
                            zd0Var = (zd0) vn7.o(parcel, i24, zd0.CREATOR);
                            break;
                        case '\r':
                            strP45 = vn7.p(i24, parcel);
                            break;
                        case 14:
                            resultReceiver = (ResultReceiver) vn7.o(parcel, i24, ResultReceiver.CREATOR);
                            break;
                        default:
                            vn7.a0(i24, parcel);
                            break;
                    }
                }
                vn7.t(iJ023, parcel);
                return new z9a(caaVar, eaaVar, bArrN4, arrayListS3, dValueOf, arrayListS4, ie0Var, numN2, qndVar, strP44, zd0Var, strP45, resultReceiver);
            case 24:
                int iJ024 = vn7.j0(parcel);
                String strP46 = null;
                String strP47 = null;
                byte[] bArrN5 = null;
                ge0 ge0Var = null;
                fe0 fe0Var = null;
                he0 he0Var = null;
                ae0 ae0Var = null;
                String strP48 = null;
                while (parcel.dataPosition() < iJ024) {
                    int i25 = parcel.readInt();
                    switch ((char) i25) {
                        case 1:
                            strP46 = vn7.p(i25, parcel);
                            break;
                        case 2:
                            strP47 = vn7.p(i25, parcel);
                            break;
                        case 3:
                            bArrN5 = vn7.n(i25, parcel);
                            break;
                        case 4:
                            ge0Var = (ge0) vn7.o(parcel, i25, ge0.CREATOR);
                            break;
                        case 5:
                            fe0Var = (fe0) vn7.o(parcel, i25, fe0.CREATOR);
                            break;
                        case 6:
                            he0Var = (he0) vn7.o(parcel, i25, he0.CREATOR);
                            break;
                        case 7:
                            ae0Var = (ae0) vn7.o(parcel, i25, ae0.CREATOR);
                            break;
                        case '\b':
                            strP48 = vn7.p(i25, parcel);
                            break;
                        case '\t':
                            vn7.p(i25, parcel);
                            break;
                        default:
                            vn7.a0(i25, parcel);
                            break;
                    }
                }
                vn7.t(iJ024, parcel);
                return new x9a(strP46, strP47, bArrN5, ge0Var, fe0Var, he0Var, ae0Var, strP48);
            case 25:
                int iJ025 = vn7.j0(parcel);
                String strP49 = null;
                String strP50 = null;
                String strP51 = null;
                String strP52 = null;
                boolean zL11 = false;
                while (parcel.dataPosition() < iJ025) {
                    int i26 = parcel.readInt();
                    char c10 = (char) i26;
                    if (c10 == 1) {
                        strP49 = vn7.p(i26, parcel);
                    } else if (c10 == 2) {
                        strP50 = vn7.p(i26, parcel);
                    } else if (c10 == 4) {
                        strP51 = vn7.p(i26, parcel);
                    } else if (c10 == 5) {
                        zL11 = vn7.L(i26, parcel);
                    } else if (c10 != 6) {
                        vn7.a0(i26, parcel);
                    } else {
                        strP52 = vn7.p(i26, parcel);
                    }
                }
                vn7.t(iJ025, parcel);
                return new c99(strP49, strP50, strP51, strP52, zL11);
            case 26:
                int iJ026 = vn7.j0(parcel);
                byte[] bArrN6 = null;
                ArrayList arrayListS5 = null;
                String strP53 = null;
                while (parcel.dataPosition() < iJ026) {
                    int i27 = parcel.readInt();
                    char c11 = (char) i27;
                    if (c11 == 2) {
                        strP53 = vn7.p(i27, parcel);
                    } else if (c11 == 3) {
                        bArrN6 = vn7.n(i27, parcel);
                    } else if (c11 != 4) {
                        vn7.a0(i27, parcel);
                    } else {
                        arrayListS5 = vn7.s(parcel, i27, Transport.CREATOR);
                    }
                }
                vn7.t(iJ026, parcel);
                return new aaa(strP53, bArrN6, arrayListS5);
            case 27:
                int iJ027 = vn7.j0(parcel);
                Integer numN3 = null;
                String strP54 = null;
                while (parcel.dataPosition() < iJ027) {
                    int i28 = parcel.readInt();
                    char c12 = (char) i28;
                    if (c12 == 2) {
                        strP54 = vn7.p(i28, parcel);
                    } else if (c12 != 3) {
                        vn7.a0(i28, parcel);
                    } else {
                        numN3 = vn7.N(i28, parcel);
                    }
                }
                vn7.t(iJ027, parcel);
                return new baa(strP54, numN3.intValue());
            case 28:
                int iJ028 = vn7.j0(parcel);
                long jO3 = 0;
                String strP55 = null;
                String strP56 = null;
                String strP57 = null;
                while (parcel.dataPosition() < iJ028) {
                    int i29 = parcel.readInt();
                    char c13 = (char) i29;
                    if (c13 == 1) {
                        strP55 = vn7.p(i29, parcel);
                    } else if (c13 == 2) {
                        strP56 = vn7.p(i29, parcel);
                    } else if (c13 == 3) {
                        jO3 = vn7.O(i29, parcel);
                    } else if (c13 != 4) {
                        vn7.a0(i29, parcel);
                    } else {
                        strP57 = vn7.p(i29, parcel);
                    }
                }
                vn7.t(iJ028, parcel);
                return new d99(jO3, strP55, strP56, strP57);
            default:
                int iJ029 = vn7.j0(parcel);
                String strP58 = null;
                while (parcel.dataPosition() < iJ029) {
                    int i30 = parcel.readInt();
                    if (((char) i30) != 1) {
                        vn7.a0(i30, parcel);
                    } else {
                        strP58 = vn7.p(i30, parcel);
                    }
                }
                vn7.t(iJ029, parcel);
                return new eb9(strP58);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ Object[] newArray(int i) {
        switch (this.a) {
            case 0:
                return new u9c[i];
            case 1:
                return new y9c[i];
            case 2:
                return new h42[i];
            case 3:
                return new y90[i];
            case 4:
                return new ip1[i];
            case 5:
                return new gvg[i];
            case 6:
                return new ctg[i];
            case 7:
                return new olf[i];
            case 8:
                return new ivg[i];
            case 9:
                return new vmf[i];
            case 10:
                return new le5[i];
            case 11:
                return new xmf[i];
            case 12:
                return new plb[i];
            case 13:
                return new zof[i];
            case 14:
                return new zpf[i];
            case 15:
                return new gof[i];
            case 16:
                return new crf[i];
            case 17:
                return new frf[i];
            case 18:
                return new uqf[i];
            case 19:
                return new ed5[i];
            case 20:
                return new fe5[i];
            case 21:
                return new dtf[i];
            case 22:
                return new dvf[i];
            case 23:
                return new z9a[i];
            case 24:
                return new x9a[i];
            case 25:
                return new c99[i];
            case 26:
                return new aaa[i];
            case 27:
                return new baa[i];
            case 28:
                return new d99[i];
            default:
                return new eb9[i];
        }
    }
}
