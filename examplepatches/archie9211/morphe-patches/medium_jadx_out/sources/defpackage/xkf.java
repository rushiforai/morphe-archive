package defpackage;

import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.ResultReceiver;
import com.medium.android.susi.data.CreateAccountData;
import gen.model.OnboardingStatus;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xkf implements Parcelable.Creator {
    public static final xkf b = new xkf(0);
    public final /* synthetic */ int a;

    public /* synthetic */ xkf(int i) {
        this.a = i;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        fy1 fy1Var = null;
        Bundle bundleM = null;
        String strP = null;
        Bundle bundleM2 = null;
        Bundle bundleM3 = null;
        String strP2 = null;
        PendingIntent pendingIntent = null;
        Bundle bundleM4 = null;
        switch (this.a) {
            case 0:
                int iDataPosition = parcel.dataPosition();
                if (parcel.readInt() != -204102970) {
                    parcel.setDataPosition(iDataPosition - 4);
                    return hz.d;
                }
                int iJ0 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ0) {
                    int i = parcel.readInt();
                    char c = (char) i;
                    if (c == 1) {
                        fy1Var = (fy1) vn7.o(parcel, i, fy1.CREATOR);
                    } else if (c != 2) {
                        vn7.a0(i, parcel);
                    } else {
                        zL = vn7.L(i, parcel);
                    }
                }
                vn7.t(iJ0, parcel);
                return new hz(fy1Var, zL);
            case 1:
                parcel.getClass();
                return new w3(parcel);
            case 2:
                parcel.getClass();
                return new c7(parcel.readInt(), parcel.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(parcel) : null);
            case 3:
                d30 d30Var = new d30(parcel);
                d30Var.a = parcel.readByte() != 0;
                return d30Var;
            case 4:
                parcel.getClass();
                return new ce0(parcel);
            case 5:
                parcel.getClass();
                return new de0(parcel);
            case 6:
                parcel.getClass();
                return new ee0(parcel);
            case 7:
                return new lm0(parcel);
            case 8:
                return new mm0(parcel);
            case 9:
                int iJ02 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ02) {
                    int i2 = parcel.readInt();
                    if (((char) i2) != 1) {
                        vn7.a0(i2, parcel);
                    } else {
                        zL = vn7.L(i2, parcel);
                    }
                }
                vn7.t(iJ02, parcel);
                return new ho1(zL);
            case 10:
                int iJ03 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ03) {
                    vn7.a0(parcel.readInt(), parcel);
                }
                vn7.t(iJ03, parcel);
                return new io1();
            case 11:
                int iJ04 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ04) {
                    vn7.a0(parcel.readInt(), parcel);
                }
                vn7.t(iJ04, parcel);
                return new ko1();
            case 12:
                int iJ05 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ05) {
                    int i3 = parcel.readInt();
                    if (((char) i3) != 1) {
                        vn7.a0(i3, parcel);
                    } else {
                        zL = vn7.L(i3, parcel);
                    }
                }
                vn7.t(iJ05, parcel);
                return new lo1(zL);
            case 13:
                int iJ06 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ06) {
                    int i4 = parcel.readInt();
                    if (((char) i4) != 1) {
                        vn7.a0(i4, parcel);
                    } else {
                        zL = vn7.L(i4, parcel);
                    }
                }
                vn7.t(iJ06, parcel);
                return new no1(zL);
            case 14:
                int iJ07 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ07) {
                    int i5 = parcel.readInt();
                    if (((char) i5) != 1) {
                        vn7.a0(i5, parcel);
                    } else {
                        bundleM4 = vn7.m(i5, parcel);
                    }
                }
                vn7.t(iJ07, parcel);
                return new po1(bundleM4);
            case 15:
                parcel.getClass();
                return new CreateAccountData(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() != 0 ? tw3.valueOf(parcel.readString()) : null, l3d.valueOf(parcel.readString()), OnboardingStatus.valueOf(parcel.readString()), parcel.readInt() != 0);
            case 16:
                int iJ08 = vn7.j0(parcel);
                af2 af2Var = null;
                while (parcel.dataPosition() < iJ08) {
                    int i6 = parcel.readInt();
                    char c2 = (char) i6;
                    if (c2 == 1) {
                        pendingIntent = (PendingIntent) vn7.o(parcel, i6, PendingIntent.CREATOR);
                    } else if (c2 != 2) {
                        vn7.a0(i6, parcel);
                    } else {
                        af2Var = (af2) vn7.o(parcel, i6, af2.CREATOR);
                    }
                }
                vn7.t(iJ08, parcel);
                return new xe2(pendingIntent, af2Var);
            case 17:
                int iJ09 = vn7.j0(parcel);
                String strP3 = null;
                Bundle bundleM5 = null;
                Bundle bundleM6 = null;
                String strP4 = null;
                String strP5 = null;
                ResultReceiver resultReceiver = null;
                while (parcel.dataPosition() < iJ09) {
                    int i7 = parcel.readInt();
                    switch ((char) i7) {
                        case 1:
                            strP3 = vn7.p(i7, parcel);
                            break;
                        case 2:
                            bundleM5 = vn7.m(i7, parcel);
                            break;
                        case 3:
                            bundleM6 = vn7.m(i7, parcel);
                            break;
                        case 4:
                            strP4 = vn7.p(i7, parcel);
                            break;
                        case 5:
                            strP5 = vn7.p(i7, parcel);
                            break;
                        case 6:
                            resultReceiver = (ResultReceiver) vn7.o(parcel, i7, ResultReceiver.CREATOR);
                            break;
                        default:
                            vn7.a0(i7, parcel);
                            break;
                    }
                }
                vn7.t(iJ09, parcel);
                return new ye2(strP3, bundleM5, bundleM6, strP4, strP5, resultReceiver);
            case 18:
                int iJ010 = vn7.j0(parcel);
                Bundle bundleM7 = null;
                while (parcel.dataPosition() < iJ010) {
                    int i8 = parcel.readInt();
                    char c3 = (char) i8;
                    if (c3 == 1) {
                        strP2 = vn7.p(i8, parcel);
                    } else if (c3 != 2) {
                        vn7.a0(i8, parcel);
                    } else {
                        bundleM7 = vn7.m(i8, parcel);
                    }
                }
                vn7.t(iJ010, parcel);
                return new af2(strP2, bundleM7);
            case 19:
                int iJ011 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ011) {
                    int i9 = parcel.readInt();
                    if (((char) i9) != 1) {
                        vn7.a0(i9, parcel);
                    } else {
                        bundleM3 = vn7.m(i9, parcel);
                    }
                }
                vn7.t(iJ011, parcel);
                return new jg2(bundleM3);
            case 20:
                int iJ012 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ012) {
                    int i10 = parcel.readInt();
                    if (((char) i10) != 1) {
                        vn7.a0(i10, parcel);
                    } else {
                        bundleM2 = vn7.m(i10, parcel);
                    }
                }
                vn7.t(iJ012, parcel);
                return new lg2(bundleM2);
            case 21:
                int iJ013 = vn7.j0(parcel);
                Bundle bundleM8 = null;
                while (parcel.dataPosition() < iJ013) {
                    int i11 = parcel.readInt();
                    char c4 = (char) i11;
                    if (c4 == 1) {
                        strP = vn7.p(i11, parcel);
                    } else if (c4 != 2) {
                        vn7.a0(i11, parcel);
                    } else {
                        bundleM8 = vn7.m(i11, parcel);
                    }
                }
                vn7.t(iJ013, parcel);
                return new wg2(strP, bundleM8);
            case 22:
                int iJ014 = vn7.j0(parcel);
                String strP6 = "";
                String strP7 = strP6;
                String strP8 = strP7;
                Bundle bundleM9 = null;
                Bundle bundleM10 = null;
                String strP9 = null;
                while (parcel.dataPosition() < iJ014) {
                    int i12 = parcel.readInt();
                    switch ((char) i12) {
                        case 1:
                            strP6 = vn7.p(i12, parcel);
                            break;
                        case 2:
                            bundleM9 = vn7.m(i12, parcel);
                            break;
                        case 3:
                            bundleM10 = vn7.m(i12, parcel);
                            break;
                        case 4:
                            strP9 = vn7.p(i12, parcel);
                            break;
                        case 5:
                            strP7 = vn7.p(i12, parcel);
                            break;
                        case 6:
                            strP8 = vn7.p(i12, parcel);
                            break;
                        default:
                            vn7.a0(i12, parcel);
                            break;
                    }
                }
                vn7.t(iJ014, parcel);
                return new ch2(strP6, bundleM9, bundleM10, strP9, strP7, strP8);
            case 23:
                int iJ015 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ015) {
                    int i13 = parcel.readInt();
                    if (((char) i13) != 1) {
                        vn7.a0(i13, parcel);
                    } else {
                        bundleM = vn7.m(i13, parcel);
                    }
                }
                vn7.t(iJ015, parcel);
                return new li2(bundleM);
            case 24:
                parcel.getClass();
                return new am2(parcel);
            case 25:
                return new e03(parcel.readInt());
            case 26:
                parcel.getClass();
                ra3 ra3Var = new ra3();
                ra3Var.a = parcel.readString();
                ra3Var.b = parcel.readString();
                ra3Var.c = parcel.readString();
                ra3Var.d = parcel.readLong();
                ra3Var.e = parcel.readLong();
                return ra3Var;
            case 27:
                parcel.getClass();
                return new ua3(parcel);
            case 28:
                parcel.getClass();
                return new b04(parcel.readString());
            default:
                parcel.getClass();
                return new c04(parcel.readString());
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i) {
        switch (this.a) {
            case 0:
                return new hz[i];
            case 1:
                return new w3[i];
            case 2:
                return new c7[i];
            case 3:
                return new d30[i];
            case 4:
                return new ce0[i];
            case 5:
                return new de0[i];
            case 6:
                return new ee0[i];
            case 7:
                return new lm0[i];
            case 8:
                return new mm0[i];
            case 9:
                return new ho1[i];
            case 10:
                return new io1[i];
            case 11:
                return new ko1[i];
            case 12:
                return new lo1[i];
            case 13:
                return new no1[i];
            case 14:
                return new po1[i];
            case 15:
                return new CreateAccountData[i];
            case 16:
                return new xe2[i];
            case 17:
                return new ye2[i];
            case 18:
                return new af2[i];
            case 19:
                return new jg2[i];
            case 20:
                return new lg2[i];
            case 21:
                return new wg2[i];
            case 22:
                return new ch2[i];
            case 23:
                return new li2[i];
            case 24:
                return new am2[i];
            case 25:
                return new e03[i];
            case 26:
                return new ra3[i];
            case 27:
                return new ua3[i];
            case 28:
                return new b04[i];
            default:
                return new c04[i];
        }
    }
}
