package defpackage;

import android.accounts.Account;
import android.app.PendingIntent;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.SignInAccount;
import com.google.android.gms.auth.api.signin.internal.SignInConfiguration;
import com.google.android.gms.common.api.Scope;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellPromoId;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.data.post.TargetPost;
import com.medium.android.postpublishing.ui.TopicData;
import com.medium.android.postpublishing.ui.TopicsSelection;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tfd implements Parcelable.Creator {
    public final /* synthetic */ int a;

    public /* synthetic */ tfd(int i) {
        this.a = i;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        int iM = 0;
        boolean zL = false;
        boolean zL2 = false;
        boolean zL3 = false;
        int iM2 = 0;
        int iM3 = 0;
        int iM4 = 0;
        int iM5 = 0;
        int iM6 = 0;
        String strP = null;
        PendingIntent pendingIntent = null;
        y9c y9cVar = null;
        byte[] bArrN = null;
        String strP2 = null;
        PendingIntent pendingIntent2 = null;
        GoogleSignInAccount googleSignInAccount = null;
        Account account = null;
        h42 h42Var = null;
        ArrayList arrayListQ = null;
        ArrayList arrayListS = null;
        Intent intent = null;
        ArrayList arrayListS2 = null;
        Bundle bundleM = null;
        switch (this.a) {
            case 0:
                parcel.getClass();
                return new TargetPost(parcel.readString(), parcel.readString(), parcel.readString());
            case 1:
                parcel.getClass();
                return new TopicData(parcel.readString(), parcel.readInt(), parcel.readString());
            case 2:
                parcel.getClass();
                int i = parcel.readInt();
                ArrayList arrayList = new ArrayList(i);
                for (int i2 = 0; i2 != i; i2++) {
                    arrayList.add(TopicData.CREATOR.createFromParcel(parcel));
                }
                return new TopicsSelection(arrayList);
            case 3:
                parcel.getClass();
                return new UpsellInfo(UpsellReferrer.valueOf(parcel.readString()), parcel.readString(), parcel.readInt() != 0 ? UpsellPromoId.CREATOR.createFromParcel(parcel) : null, parcel.readString(), parcel.readString(), parcel.readString());
            case 4:
                parcel.getClass();
                return UpsellPromoId.valueOf(parcel.readString());
            case 5:
                parcel.getClass();
                parcel.readInt();
                return rbe.a;
            case 6:
                parcel.getClass();
                return new sbe(parcel.readString());
            case 7:
                parcel.getClass();
                return new e2f(parcel);
            case 8:
                int iJ0 = vn7.j0(parcel);
                int iM7 = 0;
                while (parcel.dataPosition() < iJ0) {
                    int i3 = parcel.readInt();
                    char c = (char) i3;
                    if (c == 1) {
                        iM6 = vn7.M(i3, parcel);
                    } else if (c == 2) {
                        iM7 = vn7.M(i3, parcel);
                    } else if (c != 3) {
                        vn7.a0(i3, parcel);
                    } else {
                        bundleM = vn7.m(i3, parcel);
                    }
                }
                vn7.t(iJ0, parcel);
                return new je5(iM6, iM7, bundleM);
            case 9:
                int iJ02 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ02) {
                    int i4 = parcel.readInt();
                    char c2 = (char) i4;
                    if (c2 == 1) {
                        iM5 = vn7.M(i4, parcel);
                    } else if (c2 != 2) {
                        vn7.a0(i4, parcel);
                    } else {
                        arrayListS2 = vn7.s(parcel, i4, e08.CREATOR);
                    }
                }
                vn7.t(iJ02, parcel);
                return new egd(iM5, arrayListS2);
            case 10:
                int iJ03 = vn7.j0(parcel);
                int iM8 = 0;
                while (parcel.dataPosition() < iJ03) {
                    int i5 = parcel.readInt();
                    char c3 = (char) i5;
                    if (c3 == 1) {
                        iM4 = vn7.M(i5, parcel);
                    } else if (c3 == 2) {
                        iM8 = vn7.M(i5, parcel);
                    } else if (c3 != 3) {
                        vn7.a0(i5, parcel);
                    } else {
                        intent = (Intent) vn7.o(parcel, i5, Intent.CREATOR);
                    }
                }
                vn7.t(iJ03, parcel);
                return new oif(iM4, iM8, intent);
            case 11:
                int iJ04 = vn7.j0(parcel);
                long jO = 0;
                String strP3 = null;
                String strP4 = null;
                String strP5 = null;
                String strP6 = null;
                Uri uri = null;
                String strP7 = null;
                String strP8 = null;
                ArrayList arrayListS3 = null;
                String strP9 = null;
                String strP10 = null;
                while (parcel.dataPosition() < iJ04) {
                    int i6 = parcel.readInt();
                    switch ((char) i6) {
                        case 2:
                            strP3 = vn7.p(i6, parcel);
                            break;
                        case 3:
                            strP4 = vn7.p(i6, parcel);
                            break;
                        case 4:
                            strP5 = vn7.p(i6, parcel);
                            break;
                        case 5:
                            strP6 = vn7.p(i6, parcel);
                            break;
                        case 6:
                            uri = (Uri) vn7.o(parcel, i6, Uri.CREATOR);
                            break;
                        case 7:
                            strP7 = vn7.p(i6, parcel);
                            break;
                        case '\b':
                            jO = vn7.O(i6, parcel);
                            break;
                        case '\t':
                            strP8 = vn7.p(i6, parcel);
                            break;
                        case '\n':
                            arrayListS3 = vn7.s(parcel, i6, Scope.CREATOR);
                            break;
                        case 11:
                            strP9 = vn7.p(i6, parcel);
                            break;
                        case '\f':
                            strP10 = vn7.p(i6, parcel);
                            break;
                        default:
                            vn7.a0(i6, parcel);
                            break;
                    }
                }
                vn7.t(iJ04, parcel);
                return new GoogleSignInAccount(strP3, strP4, strP5, strP6, uri, strP7, jO, strP8, arrayListS3, strP9, strP10);
            case 12:
                int iJ05 = vn7.j0(parcel);
                long jO2 = 0;
                int iM9 = 0;
                int iM10 = 0;
                boolean zL4 = false;
                String strP11 = null;
                while (parcel.dataPosition() < iJ05) {
                    int i7 = parcel.readInt();
                    char c4 = (char) i7;
                    if (c4 == 1) {
                        iM9 = vn7.M(i7, parcel);
                    } else if (c4 == 2) {
                        strP11 = vn7.p(i7, parcel);
                    } else if (c4 == 3) {
                        jO2 = vn7.O(i7, parcel);
                    } else if (c4 == 4) {
                        iM10 = vn7.M(i7, parcel);
                    } else if (c4 != 5) {
                        vn7.a0(i7, parcel);
                    } else {
                        zL4 = vn7.L(i7, parcel);
                    }
                }
                vn7.t(iJ05, parcel);
                return new rif(iM9, strP11, jO2, iM10, zL4);
            case 13:
                int iJ06 = vn7.j0(parcel);
                int iM11 = 0;
                boolean zL5 = false;
                boolean zL6 = false;
                boolean zL7 = false;
                ArrayList arrayListS4 = null;
                Account account2 = null;
                String strP12 = null;
                String strP13 = null;
                String strP14 = null;
                while (parcel.dataPosition() < iJ06) {
                    int i8 = parcel.readInt();
                    switch ((char) i8) {
                        case 1:
                            iM11 = vn7.M(i8, parcel);
                            break;
                        case 2:
                            arrayListS4 = vn7.s(parcel, i8, Scope.CREATOR);
                            break;
                        case 3:
                            account2 = (Account) vn7.o(parcel, i8, Account.CREATOR);
                            break;
                        case 4:
                            zL5 = vn7.L(i8, parcel);
                            break;
                        case 5:
                            zL6 = vn7.L(i8, parcel);
                            break;
                        case 6:
                            zL7 = vn7.L(i8, parcel);
                            break;
                        case 7:
                            strP12 = vn7.p(i8, parcel);
                            break;
                        case '\b':
                            strP13 = vn7.p(i8, parcel);
                            break;
                        case '\t':
                            arrayListS = vn7.s(parcel, i8, je5.CREATOR);
                            break;
                        case '\n':
                            strP14 = vn7.p(i8, parcel);
                            break;
                        default:
                            vn7.a0(i8, parcel);
                            break;
                    }
                }
                vn7.t(iJ06, parcel);
                return new GoogleSignInOptions(iM11, arrayListS4, account2, zL5, zL6, zL7, strP12, strP13, GoogleSignInOptions.e(arrayListS), strP14);
            case 14:
                int iJ07 = vn7.j0(parcel);
                String strP15 = null;
                while (parcel.dataPosition() < iJ07) {
                    int i9 = parcel.readInt();
                    char c5 = (char) i9;
                    if (c5 == 1) {
                        arrayListQ = vn7.q(i9, parcel);
                    } else if (c5 != 2) {
                        vn7.a0(i9, parcel);
                    } else {
                        strP15 = vn7.p(i9, parcel);
                    }
                }
                vn7.t(iJ07, parcel);
                return new jjf(strP15, arrayListQ);
            case 15:
                int iJ08 = vn7.j0(parcel);
                yjf yjfVar = null;
                while (parcel.dataPosition() < iJ08) {
                    int i10 = parcel.readInt();
                    char c6 = (char) i10;
                    if (c6 == 1) {
                        iM3 = vn7.M(i10, parcel);
                    } else if (c6 == 2) {
                        h42Var = (h42) vn7.o(parcel, i10, h42.CREATOR);
                    } else if (c6 != 3) {
                        vn7.a0(i10, parcel);
                    } else {
                        yjfVar = (yjf) vn7.o(parcel, i10, yjf.CREATOR);
                    }
                }
                vn7.t(iJ08, parcel);
                return new sjf(iM3, h42Var, yjfVar);
            case 16:
                int iJ09 = vn7.j0(parcel);
                long jO3 = 0;
                long jO4 = 0;
                int iM12 = -1;
                int iM13 = 0;
                int iM14 = 0;
                int iM15 = 0;
                int iM16 = 0;
                String strP16 = null;
                String strP17 = null;
                while (parcel.dataPosition() < iJ09) {
                    int i11 = parcel.readInt();
                    switch ((char) i11) {
                        case 1:
                            iM13 = vn7.M(i11, parcel);
                            break;
                        case 2:
                            iM14 = vn7.M(i11, parcel);
                            break;
                        case 3:
                            iM15 = vn7.M(i11, parcel);
                            break;
                        case 4:
                            jO3 = vn7.O(i11, parcel);
                            break;
                        case 5:
                            jO4 = vn7.O(i11, parcel);
                            break;
                        case 6:
                            strP16 = vn7.p(i11, parcel);
                            break;
                        case 7:
                            strP17 = vn7.p(i11, parcel);
                            break;
                        case '\b':
                            iM16 = vn7.M(i11, parcel);
                            break;
                        case '\t':
                            iM12 = vn7.M(i11, parcel);
                            break;
                        default:
                            vn7.a0(i11, parcel);
                            break;
                    }
                }
                vn7.t(iJ09, parcel);
                return new e08(iM13, iM14, iM15, jO3, jO4, strP16, strP17, iM16, iM12);
            case 17:
                int iJ010 = vn7.j0(parcel);
                int iM17 = 0;
                GoogleSignInAccount googleSignInAccount2 = null;
                while (parcel.dataPosition() < iJ010) {
                    int i12 = parcel.readInt();
                    char c7 = (char) i12;
                    if (c7 == 1) {
                        iM2 = vn7.M(i12, parcel);
                    } else if (c7 == 2) {
                        account = (Account) vn7.o(parcel, i12, Account.CREATOR);
                    } else if (c7 == 3) {
                        iM17 = vn7.M(i12, parcel);
                    } else if (c7 != 4) {
                        vn7.a0(i12, parcel);
                    } else {
                        googleSignInAccount2 = (GoogleSignInAccount) vn7.o(parcel, i12, GoogleSignInAccount.CREATOR);
                    }
                }
                vn7.t(iJ010, parcel);
                return new xjf(iM2, account, iM17, googleSignInAccount2);
            case 18:
                int iJ011 = vn7.j0(parcel);
                int iM18 = 0;
                boolean zL8 = false;
                boolean zL9 = false;
                IBinder iBinder = null;
                h42 h42Var2 = null;
                while (parcel.dataPosition() < iJ011) {
                    int i13 = parcel.readInt();
                    char c8 = (char) i13;
                    if (c8 == 1) {
                        iM18 = vn7.M(i13, parcel);
                    } else if (c8 == 2) {
                        int iP = vn7.P(i13, parcel);
                        int iDataPosition = parcel.dataPosition();
                        if (iP == 0) {
                            iBinder = null;
                        } else {
                            IBinder strongBinder = parcel.readStrongBinder();
                            parcel.setDataPosition(iDataPosition + iP);
                            iBinder = strongBinder;
                        }
                    } else if (c8 == 3) {
                        h42Var2 = (h42) vn7.o(parcel, i13, h42.CREATOR);
                    } else if (c8 == 4) {
                        zL8 = vn7.L(i13, parcel);
                    } else if (c8 != 5) {
                        vn7.a0(i13, parcel);
                    } else {
                        zL9 = vn7.L(i13, parcel);
                    }
                }
                vn7.t(iJ011, parcel);
                return new yjf(iM18, iBinder, h42Var2, zL8, zL9);
            case 19:
                int iJ012 = vn7.j0(parcel);
                String strP18 = "";
                String strP19 = "";
                while (parcel.dataPosition() < iJ012) {
                    int i14 = parcel.readInt();
                    char c9 = (char) i14;
                    if (c9 == 4) {
                        strP18 = vn7.p(i14, parcel);
                    } else if (c9 == 7) {
                        googleSignInAccount = (GoogleSignInAccount) vn7.o(parcel, i14, GoogleSignInAccount.CREATOR);
                    } else if (c9 != '\b') {
                        vn7.a0(i14, parcel);
                    } else {
                        strP19 = vn7.p(i14, parcel);
                    }
                }
                vn7.t(iJ012, parcel);
                return new SignInAccount(strP18, googleSignInAccount, strP19);
            case 20:
                int iJ013 = vn7.j0(parcel);
                boolean zL10 = false;
                int iM19 = 0;
                boolean zL11 = false;
                qq0 qq0Var = null;
                nq0 nq0Var = null;
                String strP20 = null;
                pq0 pq0Var = null;
                oq0 oq0Var = null;
                while (parcel.dataPosition() < iJ013) {
                    int i15 = parcel.readInt();
                    switch ((char) i15) {
                        case 1:
                            qq0Var = (qq0) vn7.o(parcel, i15, qq0.CREATOR);
                            break;
                        case 2:
                            nq0Var = (nq0) vn7.o(parcel, i15, nq0.CREATOR);
                            break;
                        case 3:
                            strP20 = vn7.p(i15, parcel);
                            break;
                        case 4:
                            zL10 = vn7.L(i15, parcel);
                            break;
                        case 5:
                            iM19 = vn7.M(i15, parcel);
                            break;
                        case 6:
                            pq0Var = (pq0) vn7.o(parcel, i15, pq0.CREATOR);
                            break;
                        case 7:
                            oq0Var = (oq0) vn7.o(parcel, i15, oq0.CREATOR);
                            break;
                        case '\b':
                            zL11 = vn7.L(i15, parcel);
                            break;
                        default:
                            vn7.a0(i15, parcel);
                            break;
                    }
                }
                vn7.t(iJ013, parcel);
                return new rq0(qq0Var, nq0Var, strP20, zL10, iM19, pq0Var, oq0Var, zL11);
            case 21:
                int iJ014 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ014) {
                    int i16 = parcel.readInt();
                    if (((char) i16) != 1) {
                        vn7.a0(i16, parcel);
                    } else {
                        pendingIntent2 = (PendingIntent) vn7.o(parcel, i16, PendingIntent.CREATOR);
                    }
                }
                vn7.t(iJ014, parcel);
                return new sq0(pendingIntent2);
            case 22:
                int iJ015 = vn7.j0(parcel);
                int iM20 = 0;
                boolean zL12 = false;
                String strP21 = null;
                String strP22 = null;
                String strP23 = null;
                String strP24 = null;
                while (parcel.dataPosition() < iJ015) {
                    int i17 = parcel.readInt();
                    switch ((char) i17) {
                        case 1:
                            strP21 = vn7.p(i17, parcel);
                            break;
                        case 2:
                            strP22 = vn7.p(i17, parcel);
                            break;
                        case 3:
                            strP23 = vn7.p(i17, parcel);
                            break;
                        case 4:
                            strP24 = vn7.p(i17, parcel);
                            break;
                        case 5:
                            zL12 = vn7.L(i17, parcel);
                            break;
                        case 6:
                            iM20 = vn7.M(i17, parcel);
                            break;
                        default:
                            vn7.a0(i17, parcel);
                            break;
                    }
                }
                vn7.t(iJ015, parcel);
                return new ac5(iM20, strP21, strP22, strP23, strP24, zL12);
            case 23:
                int iJ016 = vn7.j0(parcel);
                boolean zL13 = false;
                boolean zL14 = false;
                boolean zL15 = false;
                String strP25 = null;
                String strP26 = null;
                String strP27 = null;
                ArrayList arrayListQ2 = null;
                while (parcel.dataPosition() < iJ016) {
                    int i18 = parcel.readInt();
                    switch ((char) i18) {
                        case 1:
                            zL13 = vn7.L(i18, parcel);
                            break;
                        case 2:
                            strP25 = vn7.p(i18, parcel);
                            break;
                        case 3:
                            strP26 = vn7.p(i18, parcel);
                            break;
                        case 4:
                            zL14 = vn7.L(i18, parcel);
                            break;
                        case 5:
                            strP27 = vn7.p(i18, parcel);
                            break;
                        case 6:
                            arrayListQ2 = vn7.q(i18, parcel);
                            break;
                        case 7:
                            zL15 = vn7.L(i18, parcel);
                            break;
                        default:
                            vn7.a0(i18, parcel);
                            break;
                    }
                }
                vn7.t(iJ016, parcel);
                return new nq0(zL13, strP25, strP26, zL14, strP27, arrayListQ2, zL15);
            case 24:
                int iJ017 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ017) {
                    int i19 = parcel.readInt();
                    char c10 = (char) i19;
                    if (c10 == 1) {
                        zL3 = vn7.L(i19, parcel);
                    } else if (c10 != 2) {
                        vn7.a0(i19, parcel);
                    } else {
                        strP2 = vn7.p(i19, parcel);
                    }
                }
                vn7.t(iJ017, parcel);
                return new oq0(zL3, strP2);
            case 25:
                int iJ018 = vn7.j0(parcel);
                String strP28 = null;
                while (parcel.dataPosition() < iJ018) {
                    int i20 = parcel.readInt();
                    char c11 = (char) i20;
                    if (c11 == 1) {
                        zL2 = vn7.L(i20, parcel);
                    } else if (c11 == 2) {
                        bArrN = vn7.n(i20, parcel);
                    } else if (c11 != 3) {
                        vn7.a0(i20, parcel);
                    } else {
                        strP28 = vn7.p(i20, parcel);
                    }
                }
                vn7.t(iJ018, parcel);
                return new pq0(zL2, bArrN, strP28);
            case 26:
                int iJ019 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ019) {
                    int i21 = parcel.readInt();
                    if (((char) i21) != 1) {
                        vn7.a0(i21, parcel);
                    } else {
                        zL = vn7.L(i21, parcel);
                    }
                }
                vn7.t(iJ019, parcel);
                return new qq0(zL);
            case 27:
                int iJ020 = vn7.j0(parcel);
                String strP29 = null;
                while (parcel.dataPosition() < iJ020) {
                    int i22 = parcel.readInt();
                    char c12 = (char) i22;
                    if (c12 == 1) {
                        y9cVar = (y9c) vn7.o(parcel, i22, y9c.CREATOR);
                    } else if (c12 == 2) {
                        strP29 = vn7.p(i22, parcel);
                    } else if (c12 != 3) {
                        vn7.a0(i22, parcel);
                    } else {
                        iM = vn7.M(i22, parcel);
                    }
                }
                vn7.t(iJ020, parcel);
                return new ynb(y9cVar, strP29, iM);
            case 28:
                int iJ021 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ021) {
                    int i23 = parcel.readInt();
                    if (((char) i23) != 1) {
                        vn7.a0(i23, parcel);
                    } else {
                        pendingIntent = (PendingIntent) vn7.o(parcel, i23, PendingIntent.CREATOR);
                    }
                }
                vn7.t(iJ021, parcel);
                return new znb(pendingIntent);
            default:
                int iJ022 = vn7.j0(parcel);
                GoogleSignInOptions googleSignInOptions = null;
                while (parcel.dataPosition() < iJ022) {
                    int i24 = parcel.readInt();
                    char c13 = (char) i24;
                    if (c13 == 2) {
                        strP = vn7.p(i24, parcel);
                    } else if (c13 != 5) {
                        vn7.a0(i24, parcel);
                    } else {
                        googleSignInOptions = (GoogleSignInOptions) vn7.o(parcel, i24, GoogleSignInOptions.CREATOR);
                    }
                }
                vn7.t(iJ022, parcel);
                return new SignInConfiguration(strP, googleSignInOptions);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i) {
        switch (this.a) {
            case 0:
                return new TargetPost[i];
            case 1:
                return new TopicData[i];
            case 2:
                return new TopicsSelection[i];
            case 3:
                return new UpsellInfo[i];
            case 4:
                return new UpsellPromoId[i];
            case 5:
                return new rbe[i];
            case 6:
                return new sbe[i];
            case 7:
                return new e2f[i];
            case 8:
                return new je5[i];
            case 9:
                return new egd[i];
            case 10:
                return new oif[i];
            case 11:
                return new GoogleSignInAccount[i];
            case 12:
                return new rif[i];
            case 13:
                return new GoogleSignInOptions[i];
            case 14:
                return new jjf[i];
            case 15:
                return new sjf[i];
            case 16:
                return new e08[i];
            case 17:
                return new xjf[i];
            case 18:
                return new yjf[i];
            case 19:
                return new SignInAccount[i];
            case 20:
                return new rq0[i];
            case 21:
                return new sq0[i];
            case 22:
                return new ac5[i];
            case 23:
                return new nq0[i];
            case 24:
                return new oq0[i];
            case 25:
                return new pq0[i];
            case 26:
                return new qq0[i];
            case 27:
                return new ynb[i];
            case 28:
                return new znb[i];
            default:
                return new SignInConfiguration[i];
        }
    }
}
