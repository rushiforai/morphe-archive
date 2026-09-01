package defpackage;

import android.accounts.Account;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.fido.fido2.api.common.COSEAlgorithmIdentifier$UnsupportedAlgorithmIdentifierException;
import com.google.android.gms.fido.fido2.api.common.ErrorCode$UnsupportedErrorCodeException;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r4g implements Parcelable.Creator {
    public final /* synthetic */ int a;

    public /* synthetic */ r4g(int i) {
        this.a = i;
    }

    public static void a(zb5 zb5Var, Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        int i2 = zb5Var.a;
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(i2);
        int i3 = zb5Var.b;
        fo7.a0(parcel, 2, 4);
        parcel.writeInt(i3);
        int i4 = zb5Var.c;
        fo7.a0(parcel, 3, 4);
        parcel.writeInt(i4);
        fo7.V(parcel, 4, zb5Var.d);
        IBinder iBinder = zb5Var.e;
        if (iBinder != null) {
            int iC02 = fo7.c0(5, parcel);
            parcel.writeStrongBinder(iBinder);
            fo7.d0(iC02, parcel);
        }
        fo7.X(parcel, 6, zb5Var.f, i);
        fo7.R(parcel, 7, zb5Var.g);
        fo7.U(parcel, 8, zb5Var.h, i);
        fo7.X(parcel, 10, zb5Var.i, i);
        fo7.X(parcel, 11, zb5Var.j, i);
        boolean z = zb5Var.k;
        fo7.a0(parcel, 12, 4);
        parcel.writeInt(z ? 1 : 0);
        int i5 = zb5Var.l;
        fo7.a0(parcel, 13, 4);
        parcel.writeInt(i5);
        boolean z2 = zb5Var.m;
        fo7.a0(parcel, 14, 4);
        parcel.writeInt(z2 ? 1 : 0);
        fo7.V(parcel, 15, zb5Var.n);
        fo7.d0(iC0, parcel);
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean zL = false;
        boolean zL2 = false;
        int iM = 0;
        int iM2 = 0;
        String strP = null;
        String strP2 = null;
        ArrayList arrayListS = null;
        String strP3 = null;
        Bundle bundleM = null;
        switch (this.a) {
            case 0:
                int iJ0 = vn7.j0(parcel);
                byte[] bArrN = null;
                byte[] bArrN2 = null;
                while (parcel.dataPosition() < iJ0) {
                    int i = parcel.readInt();
                    char c = (char) i;
                    if (c == 1) {
                        bArrN = vn7.n(i, parcel);
                    } else if (c != 2) {
                        vn7.a0(i, parcel);
                    } else {
                        bArrN2 = vn7.n(i, parcel);
                    }
                }
                vn7.t(iJ0, parcel);
                return new o3g(bArrN == null ? null : a6g.s(bArrN.length, bArrN), bArrN2 != null ? a6g.s(bArrN2.length, bArrN2) : null);
            case 1:
                int iJ02 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ02) {
                    vn7.a0(parcel.readInt(), parcel);
                }
                vn7.t(iJ02, parcel);
                return new s16();
            case 2:
                int iJ03 = vn7.j0(parcel);
                byte[] bArrN3 = null;
                while (parcel.dataPosition() < iJ03) {
                    int i2 = parcel.readInt();
                    char c2 = (char) i2;
                    if (c2 == 1) {
                        zL = vn7.L(i2, parcel);
                    } else if (c2 != 2) {
                        vn7.a0(i2, parcel);
                    } else {
                        bArrN3 = vn7.n(i2, parcel);
                    }
                }
                vn7.t(iJ03, parcel);
                return new i6g(zL, bArrN3 != null ? a6g.s(bArrN3.length, bArrN3) : null);
            case 3:
                int iJ04 = vn7.j0(parcel);
                byte[] bArrN4 = null;
                byte[] bArrN5 = null;
                byte[] bArrN6 = null;
                byte[] bArrN7 = null;
                byte[] bArrN8 = null;
                while (parcel.dataPosition() < iJ04) {
                    int i3 = parcel.readInt();
                    char c3 = (char) i3;
                    if (c3 == 2) {
                        bArrN4 = vn7.n(i3, parcel);
                    } else if (c3 == 3) {
                        bArrN5 = vn7.n(i3, parcel);
                    } else if (c3 == 4) {
                        bArrN6 = vn7.n(i3, parcel);
                    } else if (c3 == 5) {
                        bArrN7 = vn7.n(i3, parcel);
                    } else if (c3 != 6) {
                        vn7.a0(i3, parcel);
                    } else {
                        bArrN8 = vn7.n(i3, parcel);
                    }
                }
                vn7.t(iJ04, parcel);
                return new fe0(bArrN4, bArrN5, bArrN6, bArrN7, bArrN8);
            case 4:
                int iJ05 = vn7.j0(parcel);
                da4[] da4VarArr = null;
                k42 k42Var = null;
                while (parcel.dataPosition() < iJ05) {
                    int i4 = parcel.readInt();
                    char c4 = (char) i4;
                    if (c4 == 1) {
                        bundleM = vn7.m(i4, parcel);
                    } else if (c4 == 2) {
                        da4VarArr = (da4[]) vn7.r(parcel, i4, da4.CREATOR);
                    } else if (c4 == 3) {
                        iM2 = vn7.M(i4, parcel);
                    } else if (c4 != 4) {
                        vn7.a0(i4, parcel);
                    } else {
                        k42Var = (k42) vn7.o(parcel, i4, k42.CREATOR);
                    }
                }
                vn7.t(iJ05, parcel);
                fag fagVar = new fag();
                fagVar.a = bundleM;
                fagVar.b = da4VarArr;
                fagVar.c = iM2;
                fagVar.d = k42Var;
                return fagVar;
            case 5:
                int iJ06 = vn7.j0(parcel);
                byte[] bArrN9 = null;
                byte[] bArrN10 = null;
                byte[] bArrN11 = null;
                String[] strArr = null;
                while (parcel.dataPosition() < iJ06) {
                    int i5 = parcel.readInt();
                    char c5 = (char) i5;
                    if (c5 == 2) {
                        bArrN9 = vn7.n(i5, parcel);
                    } else if (c5 == 3) {
                        bArrN10 = vn7.n(i5, parcel);
                    } else if (c5 == 4) {
                        bArrN11 = vn7.n(i5, parcel);
                    } else if (c5 != 5) {
                        vn7.a0(i5, parcel);
                    } else {
                        int iP = vn7.P(i5, parcel);
                        int iDataPosition = parcel.dataPosition();
                        if (iP == 0) {
                            strArr = null;
                        } else {
                            String[] strArrCreateStringArray = parcel.createStringArray();
                            parcel.setDataPosition(iDataPosition + iP);
                            strArr = strArrCreateStringArray;
                        }
                    }
                }
                vn7.t(iJ06, parcel);
                return new ge0(bArrN9, bArrN10, bArrN11, strArr);
            case 6:
                int iJ07 = vn7.j0(parcel);
                boolean zL3 = false;
                boolean zL4 = false;
                int iM3 = 0;
                plb plbVar = null;
                int[] iArr = null;
                int[] iArr2 = null;
                while (parcel.dataPosition() < iJ07) {
                    int i6 = parcel.readInt();
                    switch ((char) i6) {
                        case 1:
                            plbVar = (plb) vn7.o(parcel, i6, plb.CREATOR);
                            break;
                        case 2:
                            zL3 = vn7.L(i6, parcel);
                            break;
                        case 3:
                            zL4 = vn7.L(i6, parcel);
                            break;
                        case 4:
                            int iP2 = vn7.P(i6, parcel);
                            int iDataPosition2 = parcel.dataPosition();
                            if (iP2 != 0) {
                                int[] iArrCreateIntArray = parcel.createIntArray();
                                parcel.setDataPosition(iDataPosition2 + iP2);
                                iArr = iArrCreateIntArray;
                            } else {
                                iArr = null;
                            }
                            break;
                        case 5:
                            iM3 = vn7.M(i6, parcel);
                            break;
                        case 6:
                            int iP3 = vn7.P(i6, parcel);
                            int iDataPosition3 = parcel.dataPosition();
                            if (iP3 != 0) {
                                int[] iArrCreateIntArray2 = parcel.createIntArray();
                                parcel.setDataPosition(iDataPosition3 + iP3);
                                iArr2 = iArrCreateIntArray2;
                            } else {
                                iArr2 = null;
                            }
                            break;
                        default:
                            vn7.a0(i6, parcel);
                            break;
                    }
                }
                vn7.t(iJ07, parcel);
                return new k42(plbVar, zL3, zL4, iArr, iM3, iArr2);
            case 7:
                int iJ08 = vn7.j0(parcel);
                int iM4 = 0;
                while (parcel.dataPosition() < iJ08) {
                    int i7 = parcel.readInt();
                    char c6 = (char) i7;
                    if (c6 == 2) {
                        iM = vn7.M(i7, parcel);
                    } else if (c6 == 3) {
                        strP3 = vn7.p(i7, parcel);
                    } else if (c6 != 4) {
                        vn7.a0(i7, parcel);
                    } else {
                        iM4 = vn7.M(i7, parcel);
                    }
                }
                vn7.t(iJ08, parcel);
                return new he0(iM, iM4, strP3);
            case 8:
                int iJ09 = vn7.j0(parcel);
                Bundle bundle = new Bundle();
                Scope[] scopeArr = zb5.o;
                da4[] da4VarArr2 = zb5.p;
                da4[] da4VarArr3 = da4VarArr2;
                int iM5 = 0;
                int iM6 = 0;
                int iM7 = 0;
                boolean zL5 = false;
                int iM8 = 0;
                boolean zL6 = false;
                String strP4 = null;
                IBinder iBinder = null;
                Account account = null;
                String strP5 = null;
                while (parcel.dataPosition() < iJ09) {
                    int i8 = parcel.readInt();
                    switch ((char) i8) {
                        case 1:
                            iM5 = vn7.M(i8, parcel);
                            break;
                        case 2:
                            iM6 = vn7.M(i8, parcel);
                            break;
                        case 3:
                            iM7 = vn7.M(i8, parcel);
                            break;
                        case 4:
                            strP4 = vn7.p(i8, parcel);
                            break;
                        case 5:
                            int iP4 = vn7.P(i8, parcel);
                            int iDataPosition4 = parcel.dataPosition();
                            if (iP4 != 0) {
                                IBinder strongBinder = parcel.readStrongBinder();
                                parcel.setDataPosition(iDataPosition4 + iP4);
                                iBinder = strongBinder;
                            } else {
                                iBinder = null;
                            }
                            break;
                        case 6:
                            scopeArr = (Scope[]) vn7.r(parcel, i8, Scope.CREATOR);
                            break;
                        case 7:
                            bundle = vn7.m(i8, parcel);
                            break;
                        case '\b':
                            account = (Account) vn7.o(parcel, i8, Account.CREATOR);
                            break;
                        case '\t':
                        default:
                            vn7.a0(i8, parcel);
                            break;
                        case '\n':
                            da4VarArr2 = (da4[]) vn7.r(parcel, i8, da4.CREATOR);
                            break;
                        case 11:
                            da4VarArr3 = (da4[]) vn7.r(parcel, i8, da4.CREATOR);
                            break;
                        case '\f':
                            zL5 = vn7.L(i8, parcel);
                            break;
                        case '\r':
                            iM8 = vn7.M(i8, parcel);
                            break;
                        case 14:
                            zL6 = vn7.L(i8, parcel);
                            break;
                        case 15:
                            strP5 = vn7.p(i8, parcel);
                            break;
                    }
                }
                vn7.t(iJ09, parcel);
                return new zb5(iM5, iM6, iM7, strP4, iBinder, scopeArr, bundle, account, da4VarArr2, da4VarArr3, zL5, iM8, zL6, strP5);
            case 9:
                int iJ010 = vn7.j0(parcel);
                String strP6 = null;
                Boolean boolValueOf = null;
                String strP7 = null;
                String strP8 = null;
                while (parcel.dataPosition() < iJ010) {
                    int i9 = parcel.readInt();
                    char c7 = (char) i9;
                    if (c7 == 2) {
                        strP6 = vn7.p(i9, parcel);
                    } else if (c7 == 3) {
                        int iP5 = vn7.P(i9, parcel);
                        if (iP5 == 0) {
                            boolValueOf = null;
                        } else {
                            vn7.r0(parcel, iP5, 4);
                            boolValueOf = Boolean.valueOf(parcel.readInt() != 0);
                        }
                    } else if (c7 == 4) {
                        strP7 = vn7.p(i9, parcel);
                    } else if (c7 != 5) {
                        vn7.a0(i9, parcel);
                    } else {
                        strP8 = vn7.p(i9, parcel);
                    }
                }
                vn7.t(iJ010, parcel);
                return new ie0(strP6, strP7, boolValueOf, strP8);
            case 10:
                try {
                    return t21.a(parcel.readInt());
                } catch (COSEAlgorithmIdentifier$UnsupportedAlgorithmIdentifierException e) {
                    ik4.j(e);
                    return null;
                }
            case 11:
                int iJ011 = vn7.j0(parcel);
                byte[] bArrN12 = null;
                byte[] bArrN13 = null;
                byte[] bArrN14 = null;
                long jO = 0;
                while (parcel.dataPosition() < iJ011) {
                    int i10 = parcel.readInt();
                    char c8 = (char) i10;
                    if (c8 == 1) {
                        jO = vn7.O(i10, parcel);
                    } else if (c8 == 2) {
                        bArrN12 = vn7.n(i10, parcel);
                    } else if (c8 == 3) {
                        bArrN13 = vn7.n(i10, parcel);
                    } else if (c8 != 4) {
                        vn7.a0(i10, parcel);
                    } else {
                        bArrN14 = vn7.n(i10, parcel);
                    }
                }
                vn7.t(iJ011, parcel);
                return new sig(jO, bArrN12, bArrN13, bArrN14);
            case 12:
                int iJ012 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ012) {
                    int i11 = parcel.readInt();
                    if (((char) i11) != 1) {
                        vn7.a0(i11, parcel);
                    } else {
                        arrayListS = vn7.s(parcel, i11, sig.CREATOR);
                    }
                }
                vn7.t(iJ012, parcel);
                return new kkg(arrayListS);
            case 13:
                int iJ013 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ013) {
                    int i12 = parcel.readInt();
                    if (((char) i12) != 1) {
                        vn7.a0(i12, parcel);
                    } else {
                        vn7.L(i12, parcel);
                    }
                }
                vn7.t(iJ013, parcel);
                return new qng();
            case 14:
                try {
                    return c14.toErrorCode(parcel.readInt());
                } catch (ErrorCode$UnsupportedErrorCodeException e2) {
                    throw new IllegalArgumentException(e2);
                }
            case 15:
                int iJ014 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ014) {
                    int i13 = parcel.readInt();
                    if (((char) i13) != 2) {
                        vn7.a0(i13, parcel);
                    } else {
                        strP2 = vn7.p(i13, parcel);
                    }
                }
                vn7.t(iJ014, parcel);
                return new df4(strP2);
            default:
                int iJ015 = vn7.j0(parcel);
                String strP9 = null;
                while (parcel.dataPosition() < iJ015) {
                    int i14 = parcel.readInt();
                    char c9 = (char) i14;
                    if (c9 == 1) {
                        strP = vn7.p(i14, parcel);
                    } else if (c9 == 2) {
                        strP9 = vn7.p(i14, parcel);
                    } else if (c9 != 3) {
                        vn7.a0(i14, parcel);
                    } else {
                        zL2 = vn7.L(i14, parcel);
                    }
                }
                vn7.t(iJ015, parcel);
                return new npg(strP, strP9, zL2);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ Object[] newArray(int i) {
        switch (this.a) {
            case 0:
                return new o3g[i];
            case 1:
                return new s16[i];
            case 2:
                return new i6g[i];
            case 3:
                return new fe0[i];
            case 4:
                return new fag[i];
            case 5:
                return new ge0[i];
            case 6:
                return new k42[i];
            case 7:
                return new he0[i];
            case 8:
                return new zb5[i];
            case 9:
                return new ie0[i];
            case 10:
                return new t21[i];
            case 11:
                return new sig[i];
            case 12:
                return new kkg[i];
            case 13:
                return new qng[i];
            case 14:
                return new c14[i];
            case 15:
                return new df4[i];
            default:
                return new npg[i];
        }
    }
}
