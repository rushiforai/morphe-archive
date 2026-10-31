package nv;

import android.accounts.Account;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.navigation.NavBackStackEntryState;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.cloudmessaging.CloudMessage;
import com.google.android.gms.cloudmessaging.RegisterRequest;
import com.google.android.gms.cloudmessaging.zzd;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.Feature;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.ClientIdentity;
import com.google.android.gms.common.internal.ConnectionTelemetryConfiguration;
import com.google.android.gms.common.internal.MethodInvocation;
import com.google.android.gms.common.internal.RootTelemetryConfiguration;
import com.google.android.gms.common.internal.TelemetryData;
import com.google.android.gms.common.internal.zab;
import com.google.android.gms.common.internal.zaw;
import com.google.android.gms.common.internal.zay;
import com.google.android.gms.common.zzp;
import com.google.android.gms.common.zzr;
import com.google.android.gms.common.zzt;
import com.google.android.gms.internal.location.zzdb;
import com.google.android.gms.internal.location.zzdd;
import com.google.android.gms.internal.location.zzdf;
import com.google.android.gms.internal.location.zzg;
import com.google.android.gms.location.LocationRequest;
import com.stripe.android.financialconnections.FinancialConnectionsSheetConfiguration;
import com.stripe.android.financialconnections.launcher.InstantDebitsResult;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentelement.confirmation.bacs.BacsConfirmationOption;
import com.stripe.android.paymentsheet.PaymentSheet$ShopPayConfiguration;
import com.stripe.android.shoppay.ShopPayArgs;
import com.stripe.android.stripe3ds2.init.AppInfo;
import com.stripe.android.stripe3ds2.init.Warning;
import com.stripe.android.stripe3ds2.init.ui.StripeButtonCustomization;
import com.stripe.android.stripe3ds2.init.ui.StripeLabelCustomization;
import com.stripe.android.stripe3ds2.init.ui.StripeTextBoxCustomization;
import com.stripe.android.stripe3ds2.init.ui.StripeToolbarCustomization;
import com.teslacoilsw.launcher.search.shortcutsearch.integrations.slack.TokenExchangeResult;
import e10.z2;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;
import oh.k;
import oh.m;
import oh.n;

/* loaded from: classes4.dex */
public final class f implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78598a;

    public /* synthetic */ f(int i5) {
        this.f78598a = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v54, types: [java.util.ArrayList] */
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean zP0 = false;
        int iU0 = 0;
        int iU02 = 0;
        int iU03 = 0;
        Intent intent = null;
        Account account = null;
        ArrayList arrayListR = null;
        String strN = null;
        String strN2 = null;
        Status status = null;
        switch (this.f78598a) {
            case 0:
                Intrinsics.g(parcel, "parcel");
                return new ShopPayArgs(PaymentMethodMetadata.CREATOR.createFromParcel(parcel), PaymentSheet$ShopPayConfiguration.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            case 1:
                return new TokenExchangeResult(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            case 2:
                int iN0 = z2.N0(parcel);
                while (parcel.dataPosition() < iN0) {
                    int i5 = parcel.readInt();
                    if (((char) i5) != 1) {
                        z2.I0(parcel, i5);
                    } else {
                        intent = (Intent) z2.L(parcel, i5, Intent.CREATOR);
                    }
                }
                z2.U(parcel, iN0);
                return new CloudMessage(intent);
            case 3:
                return new zzd(parcel.readStrongBinder());
            case 4:
                int iN02 = z2.N0(parcel);
                int iU04 = 0;
                String strN3 = null;
                String strN4 = null;
                String strN5 = null;
                String strN6 = null;
                String strN7 = null;
                String strN8 = null;
                while (parcel.dataPosition() < iN02) {
                    int i11 = parcel.readInt();
                    switch ((char) i11) {
                        case 1:
                            strN3 = z2.N(parcel, i11);
                            break;
                        case 2:
                            strN4 = z2.N(parcel, i11);
                            break;
                        case 3:
                            strN5 = z2.N(parcel, i11);
                            break;
                        case 4:
                            strN6 = z2.N(parcel, i11);
                            break;
                        case 5:
                            strN7 = z2.N(parcel, i11);
                            break;
                        case 6:
                            iU04 = z2.u0(parcel, i11);
                            break;
                        case 7:
                            strN8 = z2.N(parcel, i11);
                            break;
                        default:
                            z2.I0(parcel, i11);
                            break;
                    }
                }
                z2.U(parcel, iN02);
                return new RegisterRequest(strN3, strN4, strN5, strN6, strN7, iU04, strN8);
            case 5:
                int iN03 = z2.N0(parcel);
                int iU05 = 0;
                IBinder iBinderT0 = null;
                IBinder iBinderT02 = null;
                PendingIntent pendingIntent = null;
                String strN9 = null;
                String strN10 = null;
                while (parcel.dataPosition() < iN03) {
                    int i12 = parcel.readInt();
                    switch ((char) i12) {
                        case 1:
                            iU05 = z2.u0(parcel, i12);
                            break;
                        case 2:
                            iBinderT0 = z2.t0(parcel, i12);
                            break;
                        case 3:
                            iBinderT02 = z2.t0(parcel, i12);
                            break;
                        case 4:
                            pendingIntent = (PendingIntent) z2.L(parcel, i12, PendingIntent.CREATOR);
                            break;
                        case 5:
                            strN9 = z2.N(parcel, i12);
                            break;
                        case 6:
                            strN10 = z2.N(parcel, i12);
                            break;
                        default:
                            z2.I0(parcel, i12);
                            break;
                    }
                }
                z2.U(parcel, iN03);
                return new zzdb(iU05, iBinderT0, iBinderT02, pendingIntent, strN9, strN10);
            case 6:
                int iN04 = z2.N0(parcel);
                long jW0 = Long.MAX_VALUE;
                boolean zP02 = false;
                boolean zP03 = false;
                boolean zP04 = false;
                boolean zP05 = false;
                LocationRequest locationRequest = null;
                ArrayList arrayListR2 = null;
                String strN11 = null;
                String strN12 = null;
                while (parcel.dataPosition() < iN04) {
                    int i13 = parcel.readInt();
                    char c11 = (char) i13;
                    if (c11 == 1) {
                        locationRequest = (LocationRequest) z2.L(parcel, i13, LocationRequest.CREATOR);
                    } else if (c11 != 5) {
                        switch (c11) {
                            case '\b':
                                zP02 = z2.p0(parcel, i13);
                                break;
                            case '\t':
                                zP03 = z2.p0(parcel, i13);
                                break;
                            case '\n':
                                strN11 = z2.N(parcel, i13);
                                break;
                            case 11:
                                zP04 = z2.p0(parcel, i13);
                                break;
                            case '\f':
                                zP05 = z2.p0(parcel, i13);
                                break;
                            case '\r':
                                strN12 = z2.N(parcel, i13);
                                break;
                            case 14:
                                jW0 = z2.w0(parcel, i13);
                                break;
                            default:
                                z2.I0(parcel, i13);
                                break;
                        }
                    } else {
                        arrayListR2 = z2.R(parcel, i13, ClientIdentity.CREATOR);
                    }
                }
                z2.U(parcel, iN04);
                return new zzdd(locationRequest, arrayListR2, zP02, zP03, strN11, zP04, zP05, strN12, jW0);
            case 7:
                int iN05 = z2.N0(parcel);
                int iU06 = 1;
                zzdd zzddVar = null;
                IBinder iBinderT03 = null;
                IBinder iBinderT04 = null;
                PendingIntent pendingIntent2 = null;
                IBinder iBinderT05 = null;
                String strN13 = null;
                while (parcel.dataPosition() < iN05) {
                    int i14 = parcel.readInt();
                    switch ((char) i14) {
                        case 1:
                            iU06 = z2.u0(parcel, i14);
                            break;
                        case 2:
                            zzddVar = (zzdd) z2.L(parcel, i14, zzdd.CREATOR);
                            break;
                        case 3:
                            iBinderT03 = z2.t0(parcel, i14);
                            break;
                        case 4:
                            pendingIntent2 = (PendingIntent) z2.L(parcel, i14, PendingIntent.CREATOR);
                            break;
                        case 5:
                            iBinderT04 = z2.t0(parcel, i14);
                            break;
                        case 6:
                            iBinderT05 = z2.t0(parcel, i14);
                            break;
                        case 7:
                        default:
                            z2.I0(parcel, i14);
                            break;
                        case '\b':
                            strN13 = z2.N(parcel, i14);
                            break;
                    }
                }
                z2.U(parcel, iN05);
                return new zzdf(iU06, zzddVar, iBinderT03, iBinderT04, pendingIntent2, iBinderT05, strN13);
            case 8:
                int iN06 = z2.N0(parcel);
                k kVar = m.f80436b;
                n nVarR = n.f80437e;
                int iU07 = 0;
                int iU08 = 0;
                int iU09 = 0;
                String strN14 = null;
                String strN15 = null;
                String strN16 = null;
                com.google.android.gms.internal.location.zzd zzdVar = null;
                while (parcel.dataPosition() < iN06) {
                    int i15 = parcel.readInt();
                    switch ((char) i15) {
                        case 1:
                            iU07 = z2.u0(parcel, i15);
                            break;
                        case 2:
                            iU08 = z2.u0(parcel, i15);
                            break;
                        case 3:
                            strN14 = z2.N(parcel, i15);
                            break;
                        case 4:
                            strN15 = z2.N(parcel, i15);
                            break;
                        case 5:
                            iU09 = z2.u0(parcel, i15);
                            break;
                        case 6:
                            strN16 = z2.N(parcel, i15);
                            break;
                        case 7:
                            zzdVar = (com.google.android.gms.internal.location.zzd) z2.L(parcel, i15, com.google.android.gms.internal.location.zzd.CREATOR);
                            break;
                        case '\b':
                            nVarR = z2.R(parcel, i15, Feature.CREATOR);
                            break;
                        default:
                            z2.I0(parcel, i15);
                            break;
                    }
                }
                z2.U(parcel, iN06);
                return new com.google.android.gms.internal.location.zzd(iU07, iU08, strN14, strN15, strN16, iU09, nVarR, zzdVar);
            case 9:
                int iN07 = z2.N0(parcel);
                while (parcel.dataPosition() < iN07) {
                    int i16 = parcel.readInt();
                    if (((char) i16) != 1) {
                        z2.I0(parcel, i16);
                    } else {
                        status = (Status) z2.L(parcel, i16, Status.CREATOR);
                    }
                }
                z2.U(parcel, iN07);
                return new zzg(status);
            case 10:
                Intrinsics.g(parcel, "parcel");
                return new BacsConfirmationOption((PaymentMethodCreateParams) parcel.readParcelable(BacsConfirmationOption.class.getClassLoader()), (PaymentMethodOptionsParams) parcel.readParcelable(BacsConfirmationOption.class.getClassLoader()));
            case 11:
                Intrinsics.g(parcel, "inParcel");
                return new NavBackStackEntryState(parcel);
            case 12:
                int iN08 = z2.N0(parcel);
                boolean zP06 = false;
                boolean zP07 = false;
                boolean zP08 = false;
                boolean zP09 = false;
                boolean zP010 = false;
                String strN17 = null;
                IBinder iBinderT06 = null;
                while (parcel.dataPosition() < iN08) {
                    int i17 = parcel.readInt();
                    switch ((char) i17) {
                        case 1:
                            strN17 = z2.N(parcel, i17);
                            break;
                        case 2:
                            zP06 = z2.p0(parcel, i17);
                            break;
                        case 3:
                            zP07 = z2.p0(parcel, i17);
                            break;
                        case 4:
                            iBinderT06 = z2.t0(parcel, i17);
                            break;
                        case 5:
                            zP08 = z2.p0(parcel, i17);
                            break;
                        case 6:
                            zP09 = z2.p0(parcel, i17);
                            break;
                        case 7:
                        default:
                            z2.I0(parcel, i17);
                            break;
                        case '\b':
                            zP010 = z2.p0(parcel, i17);
                            break;
                    }
                }
                z2.U(parcel, iN08);
                return new zzp(strN17, zP06, zP07, iBinderT06, zP08, zP09, zP010);
            case 13:
                int iN09 = z2.N0(parcel);
                long jW02 = -1;
                int iU010 = 0;
                int iU011 = 0;
                boolean zP011 = false;
                String strN18 = null;
                while (parcel.dataPosition() < iN09) {
                    int i18 = parcel.readInt();
                    char c12 = (char) i18;
                    if (c12 == 1) {
                        zP011 = z2.p0(parcel, i18);
                    } else if (c12 == 2) {
                        strN18 = z2.N(parcel, i18);
                    } else if (c12 == 3) {
                        iU010 = z2.u0(parcel, i18);
                    } else if (c12 == 4) {
                        iU011 = z2.u0(parcel, i18);
                    } else if (c12 != 5) {
                        z2.I0(parcel, i18);
                    } else {
                        jW02 = z2.w0(parcel, i18);
                    }
                }
                z2.U(parcel, iN09);
                return new zzr(iU010, iU011, jW02, strN18, zP011);
            case 14:
                int iN010 = z2.N0(parcel);
                boolean zP012 = false;
                IBinder iBinderT07 = null;
                while (parcel.dataPosition() < iN010) {
                    int i19 = parcel.readInt();
                    char c13 = (char) i19;
                    if (c13 == 1) {
                        strN2 = z2.N(parcel, i19);
                    } else if (c13 == 2) {
                        iBinderT07 = z2.t0(parcel, i19);
                    } else if (c13 == 3) {
                        zP0 = z2.p0(parcel, i19);
                    } else if (c13 != 4) {
                        z2.I0(parcel, i19);
                    } else {
                        zP012 = z2.p0(parcel, i19);
                    }
                }
                z2.U(parcel, iN010);
                return new zzt(strN2, iBinderT07, zP0, zP012);
            case 15:
                Intrinsics.g(parcel, "parcel");
                return new FinancialConnectionsSheetConfiguration(parcel.readString(), parcel.readString(), parcel.readString());
            case 16:
                Intrinsics.g(parcel, "parcel");
                return new InstantDebitsResult(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() != 0);
            case 17:
                Intrinsics.g(parcel, "parcel");
                return new AppInfo(parcel.readString(), parcel.readInt());
            case 18:
                Intrinsics.g(parcel, "parcel");
                return new Warning(parcel.readString(), parcel.readString(), rv.m.valueOf(parcel.readString()));
            case 19:
                int iN011 = z2.N0(parcel);
                while (parcel.dataPosition() < iN011) {
                    int i21 = parcel.readInt();
                    char c14 = (char) i21;
                    if (c14 == 1) {
                        iU03 = z2.u0(parcel, i21);
                    } else if (c14 != 2) {
                        z2.I0(parcel, i21);
                    } else {
                        strN = z2.N(parcel, i21);
                    }
                }
                z2.U(parcel, iN011);
                return new ClientIdentity(iU03, strN);
            case 20:
                int iN012 = z2.N0(parcel);
                while (parcel.dataPosition() < iN012) {
                    int i22 = parcel.readInt();
                    char c15 = (char) i22;
                    if (c15 == 1) {
                        iU02 = z2.u0(parcel, i22);
                    } else if (c15 != 2) {
                        z2.I0(parcel, i22);
                    } else {
                        arrayListR = z2.R(parcel, i22, MethodInvocation.CREATOR);
                    }
                }
                z2.U(parcel, iN012);
                return new TelemetryData(iU02, arrayListR);
            case 21:
                int iN013 = z2.N0(parcel);
                long jW03 = 0;
                int iU012 = 0;
                int iU013 = 0;
                boolean zP013 = false;
                String strN19 = null;
                while (parcel.dataPosition() < iN013) {
                    int i23 = parcel.readInt();
                    char c16 = (char) i23;
                    if (c16 == 1) {
                        iU012 = z2.u0(parcel, i23);
                    } else if (c16 == 2) {
                        strN19 = z2.N(parcel, i23);
                    } else if (c16 == 3) {
                        jW03 = z2.w0(parcel, i23);
                    } else if (c16 == 4) {
                        iU013 = z2.u0(parcel, i23);
                    } else if (c16 != 5) {
                        z2.I0(parcel, i23);
                    } else {
                        zP013 = z2.p0(parcel, i23);
                    }
                }
                z2.U(parcel, iN013);
                return new zab(iU012, iU013, jW03, strN19, zP013);
            case 22:
                int iN014 = z2.N0(parcel);
                long jW04 = 0;
                long jW05 = 0;
                int iU014 = -1;
                int iU015 = 0;
                int iU016 = 0;
                int iU017 = 0;
                int iU018 = 0;
                String strN20 = null;
                String strN21 = null;
                while (parcel.dataPosition() < iN014) {
                    int i24 = parcel.readInt();
                    switch ((char) i24) {
                        case 1:
                            iU015 = z2.u0(parcel, i24);
                            break;
                        case 2:
                            iU016 = z2.u0(parcel, i24);
                            break;
                        case 3:
                            iU017 = z2.u0(parcel, i24);
                            break;
                        case 4:
                            jW04 = z2.w0(parcel, i24);
                            break;
                        case 5:
                            jW05 = z2.w0(parcel, i24);
                            break;
                        case 6:
                            strN20 = z2.N(parcel, i24);
                            break;
                        case 7:
                            strN21 = z2.N(parcel, i24);
                            break;
                        case '\b':
                            iU018 = z2.u0(parcel, i24);
                            break;
                        case '\t':
                            iU014 = z2.u0(parcel, i24);
                            break;
                        default:
                            z2.I0(parcel, i24);
                            break;
                    }
                }
                z2.U(parcel, iN014);
                return new MethodInvocation(iU015, iU016, iU017, jW04, jW05, strN20, strN21, iU018, iU014);
            case 23:
                int iN015 = z2.N0(parcel);
                int iU019 = 0;
                GoogleSignInAccount googleSignInAccount = null;
                while (parcel.dataPosition() < iN015) {
                    int i25 = parcel.readInt();
                    char c17 = (char) i25;
                    if (c17 == 1) {
                        iU0 = z2.u0(parcel, i25);
                    } else if (c17 == 2) {
                        account = (Account) z2.L(parcel, i25, Account.CREATOR);
                    } else if (c17 == 3) {
                        iU019 = z2.u0(parcel, i25);
                    } else if (c17 != 4) {
                        z2.I0(parcel, i25);
                    } else {
                        googleSignInAccount = (GoogleSignInAccount) z2.L(parcel, i25, GoogleSignInAccount.CREATOR);
                    }
                }
                z2.U(parcel, iN015);
                return new zaw(iU0, account, iU019, googleSignInAccount);
            case 24:
                int iN016 = z2.N0(parcel);
                int iU020 = 0;
                boolean zP014 = false;
                boolean zP015 = false;
                IBinder iBinderT08 = null;
                ConnectionResult connectionResult = null;
                while (parcel.dataPosition() < iN016) {
                    int i26 = parcel.readInt();
                    char c18 = (char) i26;
                    if (c18 == 1) {
                        iU020 = z2.u0(parcel, i26);
                    } else if (c18 == 2) {
                        iBinderT08 = z2.t0(parcel, i26);
                    } else if (c18 == 3) {
                        connectionResult = (ConnectionResult) z2.L(parcel, i26, ConnectionResult.CREATOR);
                    } else if (c18 == 4) {
                        zP014 = z2.p0(parcel, i26);
                    } else if (c18 != 5) {
                        z2.I0(parcel, i26);
                    } else {
                        zP015 = z2.p0(parcel, i26);
                    }
                }
                z2.U(parcel, iN016);
                return new zay(iU020, iBinderT08, connectionResult, zP014, zP015);
            case 25:
                int iN017 = z2.N0(parcel);
                boolean zP016 = false;
                boolean zP017 = false;
                int iU021 = 0;
                RootTelemetryConfiguration rootTelemetryConfiguration = null;
                int[] iArrJ = null;
                int[] iArrJ2 = null;
                while (parcel.dataPosition() < iN017) {
                    int i27 = parcel.readInt();
                    switch ((char) i27) {
                        case 1:
                            rootTelemetryConfiguration = (RootTelemetryConfiguration) z2.L(parcel, i27, RootTelemetryConfiguration.CREATOR);
                            break;
                        case 2:
                            zP016 = z2.p0(parcel, i27);
                            break;
                        case 3:
                            zP017 = z2.p0(parcel, i27);
                            break;
                        case 4:
                            iArrJ = z2.J(parcel, i27);
                            break;
                        case 5:
                            iU021 = z2.u0(parcel, i27);
                            break;
                        case 6:
                            iArrJ2 = z2.J(parcel, i27);
                            break;
                        default:
                            z2.I0(parcel, i27);
                            break;
                    }
                }
                z2.U(parcel, iN017);
                return new ConnectionTelemetryConfiguration(rootTelemetryConfiguration, zP016, zP017, iArrJ, iU021, iArrJ2);
            case 26:
                StripeButtonCustomization stripeButtonCustomization = new StripeButtonCustomization(parcel);
                stripeButtonCustomization.f45035d = parcel.readString();
                stripeButtonCustomization.f45036e = parcel.readInt();
                return stripeButtonCustomization;
            case 27:
                StripeLabelCustomization stripeLabelCustomization = new StripeLabelCustomization(parcel);
                stripeLabelCustomization.f45037d = parcel.readString();
                stripeLabelCustomization.f45038e = parcel.readString();
                stripeLabelCustomization.f45039f = parcel.readInt();
                return stripeLabelCustomization;
            case 28:
                StripeTextBoxCustomization stripeTextBoxCustomization = new StripeTextBoxCustomization(parcel);
                stripeTextBoxCustomization.f45040d = parcel.readInt();
                stripeTextBoxCustomization.f45041e = parcel.readString();
                stripeTextBoxCustomization.f45042f = parcel.readInt();
                stripeTextBoxCustomization.f45043g = parcel.readString();
                return stripeTextBoxCustomization;
            default:
                StripeToolbarCustomization stripeToolbarCustomization = new StripeToolbarCustomization(parcel);
                stripeToolbarCustomization.f45044d = parcel.readString();
                stripeToolbarCustomization.f45045e = parcel.readString();
                stripeToolbarCustomization.f45046f = parcel.readString();
                stripeToolbarCustomization.f45047g = parcel.readString();
                return stripeToolbarCustomization;
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f78598a) {
            case 0:
                return new ShopPayArgs[i5];
            case 1:
                return new TokenExchangeResult[i5];
            case 2:
                return new CloudMessage[i5];
            case 3:
                return new zzd[i5];
            case 4:
                return new RegisterRequest[i5];
            case 5:
                return new zzdb[i5];
            case 6:
                return new zzdd[i5];
            case 7:
                return new zzdf[i5];
            case 8:
                return new com.google.android.gms.internal.location.zzd[i5];
            case 9:
                return new zzg[i5];
            case 10:
                return new BacsConfirmationOption[i5];
            case 11:
                return new NavBackStackEntryState[i5];
            case 12:
                return new zzp[i5];
            case 13:
                return new zzr[i5];
            case 14:
                return new zzt[i5];
            case 15:
                return new FinancialConnectionsSheetConfiguration[i5];
            case 16:
                return new InstantDebitsResult[i5];
            case 17:
                return new AppInfo[i5];
            case 18:
                return new Warning[i5];
            case 19:
                return new ClientIdentity[i5];
            case 20:
                return new TelemetryData[i5];
            case 21:
                return new zab[i5];
            case 22:
                return new MethodInvocation[i5];
            case 23:
                return new zaw[i5];
            case 24:
                return new zay[i5];
            case 25:
                return new ConnectionTelemetryConfiguration[i5];
            case 26:
                return new StripeButtonCustomization[i5];
            case 27:
                return new StripeLabelCustomization[i5];
            case 28:
                return new StripeTextBoxCustomization[i5];
            default:
                return new StripeToolbarCustomization[i5];
        }
    }
}
