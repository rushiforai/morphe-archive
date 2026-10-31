package ji;

import android.accounts.Account;
import android.app.PendingIntent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.versionedparcelable.ParcelImpl;
import com.google.android.gms.auth.api.identity.BeginSignInResult;
import com.google.android.gms.auth.api.identity.SignInCredential;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.SignInAccount;
import com.google.android.gms.auth.api.signin.internal.GoogleSignInOptionsExtensionParcelable;
import com.google.android.gms.auth.api.signin.internal.SignInConfiguration;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.fido.fido2.api.common.PublicKeyCredential;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.wallet.wobs.CommonWalletObject;
import com.google.android.gms.wallet.wobs.LabelValue;
import com.google.android.gms.wallet.wobs.LabelValueRow;
import com.google.android.gms.wallet.wobs.LoyaltyPoints;
import com.google.android.gms.wallet.wobs.LoyaltyPointsBalance;
import com.google.android.gms.wallet.wobs.TextModuleData;
import com.google.android.gms.wallet.wobs.TimeInterval;
import com.google.android.gms.wallet.wobs.UriData;
import com.google.android.gms.wallet.wobs.WalletObjectMessage;
import com.google.android.play.core.hsdp.protocol.PrewarmRequest;
import com.stripe.android.challenge.passive.PassiveChallengeArgs;
import com.stripe.android.challenge.passive.warmer.activity.PassiveChallengeWarmerArgs;
import com.stripe.android.challenge.passive.warmer.activity.PassiveChallengeWarmerCompleted;
import com.stripe.android.customersheet.CustomerSheet$Configuration;
import com.stripe.android.link.model.ConsentPresentation;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.link.model.LinkAuthIntentInfo;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.ConsumerSession;
import com.stripe.android.model.DisplayablePaymentDetails;
import com.stripe.android.model.PassiveCaptchaParams;
import com.stripe.android.paymentelement.EmbeddedPaymentElement$Configuration;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import com.stripe.android.paymentelement.confirmation.ConfirmationMediator$Parameters;
import com.stripe.android.paymentelement.confirmation.DefaultConfirmationHandler$AwaitingConfirmationResultData;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$CardBrandAcceptance;
import com.stripe.android.paymentsheet.PaymentSheet$CardFundingType;
import com.stripe.android.paymentsheet.PaymentSheet$CustomPaymentMethod;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$GooglePayConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$LinkConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import com.teslacoilsw.conditions.SimpleBluetoothDevice;
import com.teslacoilsw.launcher.EditShortcutSavedState;
import com.teslacoilsw.launcher.util.NamedIntent;
import e10.z2;
import fq.c;
import ft.b;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;
import kt.j;
import ou.w0;
import vt.f0;

/* loaded from: classes3.dex */
public final class a implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69562a;

    public /* synthetic */ a(int i5) {
        this.f69562a = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        ArrayList arrayList;
        boolean z12;
        int i5;
        boolean z13;
        boolean z14;
        switch (this.f69562a) {
            case 0:
                int iN0 = z2.N0(parcel);
                ArrayList arrayList2 = new ArrayList();
                ArrayList arrayListR = arrayList2;
                ArrayList arrayList3 = new ArrayList();
                ArrayList arrayList4 = new ArrayList();
                ArrayList arrayList5 = new ArrayList();
                ArrayList arrayList6 = new ArrayList();
                ArrayList arrayList7 = new ArrayList();
                int iU0 = 0;
                boolean zP0 = false;
                String strN = null;
                String strN2 = null;
                String strN3 = null;
                String strN4 = null;
                String strN5 = null;
                String strN6 = null;
                String strN7 = null;
                String strN8 = null;
                TimeInterval timeInterval = null;
                String strN9 = null;
                String strN10 = null;
                while (parcel.dataPosition() < iN0) {
                    int i11 = parcel.readInt();
                    switch ((char) i11) {
                        case 2:
                            strN = z2.N(parcel, i11);
                            break;
                        case 3:
                            strN2 = z2.N(parcel, i11);
                            break;
                        case 4:
                            strN3 = z2.N(parcel, i11);
                            break;
                        case 5:
                            strN4 = z2.N(parcel, i11);
                            break;
                        case 6:
                            strN5 = z2.N(parcel, i11);
                            break;
                        case 7:
                            strN6 = z2.N(parcel, i11);
                            break;
                        case '\b':
                            strN7 = z2.N(parcel, i11);
                            break;
                        case '\t':
                            strN8 = z2.N(parcel, i11);
                            break;
                        case '\n':
                            iU0 = z2.u0(parcel, i11);
                            break;
                        case 11:
                            arrayListR = z2.R(parcel, i11, WalletObjectMessage.CREATOR);
                            break;
                        case '\f':
                            timeInterval = (TimeInterval) z2.L(parcel, i11, TimeInterval.CREATOR);
                            break;
                        case '\r':
                            arrayList3 = z2.R(parcel, i11, LatLng.CREATOR);
                            break;
                        case 14:
                            strN9 = z2.N(parcel, i11);
                            break;
                        case 15:
                            strN10 = z2.N(parcel, i11);
                            break;
                        case 16:
                            arrayList4 = z2.R(parcel, i11, LabelValueRow.CREATOR);
                            break;
                        case 17:
                            zP0 = z2.p0(parcel, i11);
                            break;
                        case 18:
                            arrayList5 = z2.R(parcel, i11, UriData.CREATOR);
                            break;
                        case 19:
                            arrayList6 = z2.R(parcel, i11, TextModuleData.CREATOR);
                            break;
                        case 20:
                            arrayList7 = z2.R(parcel, i11, UriData.CREATOR);
                            break;
                        default:
                            z2.I0(parcel, i11);
                            break;
                    }
                }
                z2.U(parcel, iN0);
                return new CommonWalletObject(strN, strN2, strN3, strN4, strN5, strN6, strN7, strN8, iU0, arrayListR, timeInterval, arrayList3, strN9, strN10, arrayList4, zP0, arrayList5, arrayList6, arrayList7);
            case 1:
                int iN02 = z2.N0(parcel);
                String strN11 = null;
                String strN12 = null;
                while (parcel.dataPosition() < iN02) {
                    int i12 = parcel.readInt();
                    char c11 = (char) i12;
                    if (c11 == 2) {
                        strN11 = z2.N(parcel, i12);
                    } else if (c11 != 3) {
                        z2.I0(parcel, i12);
                    } else {
                        strN12 = z2.N(parcel, i12);
                    }
                }
                z2.U(parcel, iN02);
                LabelValue labelValue = new LabelValue();
                labelValue.f33945f = strN11;
                labelValue.f33946g = strN12;
                return labelValue;
            case 2:
                int iN03 = z2.N0(parcel);
                ArrayList arrayList8 = new ArrayList();
                String strN13 = null;
                String strN14 = null;
                while (parcel.dataPosition() < iN03) {
                    int i13 = parcel.readInt();
                    char c12 = (char) i13;
                    if (c12 == 2) {
                        strN13 = z2.N(parcel, i13);
                    } else if (c12 == 3) {
                        strN14 = z2.N(parcel, i13);
                    } else if (c12 != 4) {
                        z2.I0(parcel, i13);
                    } else {
                        arrayList8 = z2.R(parcel, i13, LabelValue.CREATOR);
                    }
                }
                z2.U(parcel, iN03);
                return new LabelValueRow(strN13, strN14, arrayList8);
            case 3:
                int iN04 = z2.N0(parcel);
                int iU02 = -1;
                long jW0 = 0;
                String strN15 = null;
                int iU03 = 0;
                double d5 = 0.0d;
                String strN16 = null;
                while (parcel.dataPosition() < iN04) {
                    int i14 = parcel.readInt();
                    switch ((char) i14) {
                        case 2:
                            iU03 = z2.u0(parcel, i14);
                            break;
                        case 3:
                            strN15 = z2.N(parcel, i14);
                            break;
                        case 4:
                            z2.P0(parcel, i14, 8);
                            d5 = parcel.readDouble();
                            break;
                        case 5:
                            strN16 = z2.N(parcel, i14);
                            break;
                        case 6:
                            jW0 = z2.w0(parcel, i14);
                            break;
                        case 7:
                            iU02 = z2.u0(parcel, i14);
                            break;
                        default:
                            z2.I0(parcel, i14);
                            break;
                    }
                }
                z2.U(parcel, iN04);
                LoyaltyPointsBalance loyaltyPointsBalance = new LoyaltyPointsBalance();
                loyaltyPointsBalance.f33953f = iU03;
                loyaltyPointsBalance.f33954g = strN15;
                loyaltyPointsBalance.f33955h = d5;
                loyaltyPointsBalance.f33956i = strN16;
                loyaltyPointsBalance.f33957j = jW0;
                loyaltyPointsBalance.f33958k = iU02;
                return loyaltyPointsBalance;
            case 4:
                int iN05 = z2.N0(parcel);
                String strN17 = null;
                LoyaltyPointsBalance loyaltyPointsBalance2 = null;
                TimeInterval timeInterval2 = null;
                while (parcel.dataPosition() < iN05) {
                    int i15 = parcel.readInt();
                    char c13 = (char) i15;
                    if (c13 == 2) {
                        strN17 = z2.N(parcel, i15);
                    } else if (c13 == 3) {
                        loyaltyPointsBalance2 = (LoyaltyPointsBalance) z2.L(parcel, i15, LoyaltyPointsBalance.CREATOR);
                    } else if (c13 != 5) {
                        z2.I0(parcel, i15);
                    } else {
                        timeInterval2 = (TimeInterval) z2.L(parcel, i15, TimeInterval.CREATOR);
                    }
                }
                z2.U(parcel, iN05);
                LoyaltyPoints loyaltyPoints = new LoyaltyPoints();
                loyaltyPoints.f33950f = strN17;
                loyaltyPoints.f33951g = loyaltyPointsBalance2;
                loyaltyPoints.f33952h = timeInterval2;
                return loyaltyPoints;
            case 5:
                int iN06 = z2.N0(parcel);
                String strN18 = null;
                String strN19 = null;
                while (parcel.dataPosition() < iN06) {
                    int i16 = parcel.readInt();
                    char c14 = (char) i16;
                    if (c14 == 2) {
                        strN18 = z2.N(parcel, i16);
                    } else if (c14 != 3) {
                        z2.I0(parcel, i16);
                    } else {
                        strN19 = z2.N(parcel, i16);
                    }
                }
                z2.U(parcel, iN06);
                TextModuleData textModuleData = new TextModuleData();
                textModuleData.f33959f = strN18;
                textModuleData.f33960g = strN19;
                return textModuleData;
            case 6:
                int iN07 = z2.N0(parcel);
                long jW02 = 0;
                long jW03 = 0;
                while (parcel.dataPosition() < iN07) {
                    int i17 = parcel.readInt();
                    char c15 = (char) i17;
                    if (c15 == 2) {
                        jW02 = z2.w0(parcel, i17);
                    } else if (c15 != 3) {
                        z2.I0(parcel, i17);
                    } else {
                        jW03 = z2.w0(parcel, i17);
                    }
                }
                z2.U(parcel, iN07);
                TimeInterval timeInterval3 = new TimeInterval();
                timeInterval3.f33961f = jW02;
                timeInterval3.f33962g = jW03;
                return timeInterval3;
            case 7:
                int iN08 = z2.N0(parcel);
                String strN20 = null;
                String strN21 = null;
                while (parcel.dataPosition() < iN08) {
                    int i18 = parcel.readInt();
                    char c16 = (char) i18;
                    if (c16 == 2) {
                        strN20 = z2.N(parcel, i18);
                    } else if (c16 != 3) {
                        z2.I0(parcel, i18);
                    } else {
                        strN21 = z2.N(parcel, i18);
                    }
                }
                z2.U(parcel, iN08);
                UriData uriData = new UriData();
                uriData.f33963f = strN20;
                uriData.f33964g = strN21;
                return uriData;
            case 8:
                int iN09 = z2.N0(parcel);
                String strN22 = null;
                String strN23 = null;
                TimeInterval timeInterval4 = null;
                UriData uriData2 = null;
                UriData uriData3 = null;
                while (parcel.dataPosition() < iN09) {
                    int i19 = parcel.readInt();
                    char c17 = (char) i19;
                    if (c17 == 2) {
                        strN22 = z2.N(parcel, i19);
                    } else if (c17 == 3) {
                        strN23 = z2.N(parcel, i19);
                    } else if (c17 == 4) {
                        timeInterval4 = (TimeInterval) z2.L(parcel, i19, TimeInterval.CREATOR);
                    } else if (c17 == 5) {
                        uriData2 = (UriData) z2.L(parcel, i19, UriData.CREATOR);
                    } else if (c17 != 6) {
                        z2.I0(parcel, i19);
                    } else {
                        uriData3 = (UriData) z2.L(parcel, i19, UriData.CREATOR);
                    }
                }
                z2.U(parcel, iN09);
                WalletObjectMessage walletObjectMessage = new WalletObjectMessage();
                walletObjectMessage.f33965f = strN22;
                walletObjectMessage.f33966g = strN23;
                walletObjectMessage.f33967h = timeInterval4;
                walletObjectMessage.f33968i = uriData2;
                walletObjectMessage.f33969j = uriData3;
                return walletObjectMessage;
            case 9:
                Intrinsics.g(parcel, "parcel");
                PaymentSheet$Appearance paymentSheet$AppearanceCreateFromParcel = PaymentSheet$Appearance.CREATOR.createFromParcel(parcel);
                boolean z15 = true;
                if (parcel.readInt() != 0) {
                    z11 = true;
                } else {
                    z11 = true;
                    z15 = false;
                }
                String string = parcel.readString();
                PaymentSheet$BillingDetails paymentSheet$BillingDetailsCreateFromParcel = PaymentSheet$BillingDetails.CREATOR.createFromParcel(parcel);
                PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfigurationCreateFromParcel = PaymentSheet$BillingDetailsCollectionConfiguration.CREATOR.createFromParcel(parcel);
                String string2 = parcel.readString();
                int i21 = parcel.readInt();
                ArrayList arrayList9 = new ArrayList(i21);
                for (int i22 = 0; i22 != i21; i22++) {
                    arrayList9.add(b.valueOf(parcel.readString()));
                }
                if (parcel.readInt() != 0) {
                    arrayList = arrayList9;
                    z12 = z11;
                } else {
                    arrayList = arrayList9;
                    z12 = false;
                }
                return new CustomerSheet$Configuration(paymentSheet$AppearanceCreateFromParcel, z15, string, paymentSheet$BillingDetailsCreateFromParcel, paymentSheet$BillingDetailsCollectionConfigurationCreateFromParcel, string2, arrayList, z12, parcel.createStringArrayList(), (PaymentSheet$CardBrandAcceptance) parcel.readParcelable(CustomerSheet$Configuration.class.getClassLoader()), parcel.readInt() != 0 ? z11 : false);
            case 10:
                return new SimpleBluetoothDevice(parcel.readString(), parcel.readInt(), parcel.readString(), parcel.readInt(), parcel.readInt());
            case 11:
                return new ParcelImpl(parcel);
            case 12:
                int iN010 = z2.N0(parcel);
                PendingIntent pendingIntent = null;
                while (parcel.dataPosition() < iN010) {
                    int i23 = parcel.readInt();
                    if (((char) i23) != 1) {
                        z2.I0(parcel, i23);
                    } else {
                        pendingIntent = (PendingIntent) z2.L(parcel, i23, PendingIntent.CREATOR);
                    }
                }
                z2.U(parcel, iN010);
                return new BeginSignInResult(pendingIntent);
            case 13:
                int iN011 = z2.N0(parcel);
                String strN24 = null;
                String strN25 = null;
                String strN26 = null;
                String strN27 = null;
                Uri uri = null;
                String strN28 = null;
                String strN29 = null;
                String strN30 = null;
                PublicKeyCredential publicKeyCredential = null;
                while (parcel.dataPosition() < iN011) {
                    int i24 = parcel.readInt();
                    switch ((char) i24) {
                        case 1:
                            strN24 = z2.N(parcel, i24);
                            break;
                        case 2:
                            strN25 = z2.N(parcel, i24);
                            break;
                        case 3:
                            strN26 = z2.N(parcel, i24);
                            break;
                        case 4:
                            strN27 = z2.N(parcel, i24);
                            break;
                        case 5:
                            uri = (Uri) z2.L(parcel, i24, Uri.CREATOR);
                            break;
                        case 6:
                            strN28 = z2.N(parcel, i24);
                            break;
                        case 7:
                            strN29 = z2.N(parcel, i24);
                            break;
                        case '\b':
                            strN30 = z2.N(parcel, i24);
                            break;
                        case '\t':
                            publicKeyCredential = (PublicKeyCredential) z2.L(parcel, i24, PublicKeyCredential.CREATOR);
                            break;
                        default:
                            z2.I0(parcel, i24);
                            break;
                    }
                }
                z2.U(parcel, iN011);
                return new SignInCredential(strN24, strN25, strN26, strN27, uri, strN28, strN29, strN30, publicKeyCredential);
            case 14:
                Intrinsics.g(parcel, "parcel");
                return new PassiveChallengeArgs(PassiveCaptchaParams.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.createStringArrayList());
            case 15:
                Intrinsics.g(parcel, "parcel");
                String string3 = parcel.readString();
                PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfigurationCreateFromParcel = parcel.readInt() == 0 ? null : PaymentSheet$CustomerConfiguration.CREATOR.createFromParcel(parcel);
                PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfigurationCreateFromParcel = parcel.readInt() == 0 ? null : PaymentSheet$GooglePayConfiguration.CREATOR.createFromParcel(parcel);
                PaymentSheet$BillingDetails paymentSheet$BillingDetailsCreateFromParcel2 = parcel.readInt() != 0 ? PaymentSheet$BillingDetails.CREATOR.createFromParcel(parcel) : null;
                AddressDetails addressDetails = (AddressDetails) parcel.readParcelable(EmbeddedPaymentElement$Configuration.class.getClassLoader());
                boolean z16 = false;
                if (parcel.readInt() != 0) {
                    i5 = 0;
                    z16 = true;
                } else {
                    i5 = 0;
                }
                int i25 = parcel.readInt() != 0 ? 1 : i5;
                PaymentSheet$Appearance paymentSheet$AppearanceCreateFromParcel2 = PaymentSheet$Appearance.CREATOR.createFromParcel(parcel);
                boolean z17 = i25;
                String string4 = parcel.readString();
                PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfigurationCreateFromParcel2 = PaymentSheet$BillingDetailsCollectionConfiguration.CREATOR.createFromParcel(parcel);
                int i26 = parcel.readInt();
                ArrayList arrayList10 = new ArrayList(i26);
                while (i5 != i26) {
                    arrayList10.add(b.valueOf(parcel.readString()));
                    i5++;
                }
                boolean z18 = parcel.readInt() != 0;
                ArrayList<String> arrayListCreateStringArrayList = parcel.createStringArrayList();
                ArrayList<String> arrayListCreateStringArrayList2 = parcel.createStringArrayList();
                PaymentSheet$CardBrandAcceptance paymentSheet$CardBrandAcceptance = (PaymentSheet$CardBrandAcceptance) parcel.readParcelable(EmbeddedPaymentElement$Configuration.class.getClassLoader());
                int i27 = parcel.readInt();
                ArrayList arrayList11 = new ArrayList(i27);
                int iB = 0;
                while (iB != i27) {
                    iB = c.b(PaymentSheet$CardFundingType.CREATOR, parcel, arrayList11, iB, 1);
                    i27 = i27;
                    string3 = string3;
                }
                String str = string3;
                int i28 = parcel.readInt();
                ArrayList arrayList12 = new ArrayList(i28);
                int iB2 = 0;
                while (iB2 != i28) {
                    iB2 = c.b(PaymentSheet$CustomPaymentMethod.CREATOR, parcel, arrayList12, iB2, 1);
                    i28 = i28;
                    arrayList11 = arrayList11;
                }
                ArrayList arrayList13 = arrayList11;
                boolean z19 = parcel.readInt() != 0;
                PaymentSheet$LinkConfiguration paymentSheet$LinkConfigurationCreateFromParcel = PaymentSheet$LinkConfiguration.CREATOR.createFromParcel(parcel);
                j jVarValueOf = j.valueOf(parcel.readString());
                int i29 = parcel.readInt();
                LinkedHashMap linkedHashMap = new LinkedHashMap(i29);
                int i31 = 0;
                while (i31 != i29) {
                    linkedHashMap.put(parcel.readParcelable(EmbeddedPaymentElement$Configuration.class.getClassLoader()), w0.valueOf(parcel.readString()));
                    i31++;
                    i29 = i29;
                }
                return new EmbeddedPaymentElement$Configuration(str, paymentSheet$CustomerConfigurationCreateFromParcel, paymentSheet$GooglePayConfigurationCreateFromParcel, paymentSheet$BillingDetailsCreateFromParcel2, addressDetails, z16, z17, paymentSheet$AppearanceCreateFromParcel2, string4, paymentSheet$BillingDetailsCollectionConfigurationCreateFromParcel2, arrayList10, z18, arrayListCreateStringArrayList, arrayListCreateStringArrayList2, paymentSheet$CardBrandAcceptance, arrayList13, arrayList12, z19, paymentSheet$LinkConfigurationCreateFromParcel, jVarValueOf, linkedHashMap, parcel.readInt() != 0, parcel.readString());
            case 16:
                int iN012 = z2.N0(parcel);
                String strN31 = null;
                String strN32 = null;
                String strN33 = null;
                String strN34 = null;
                Uri uri2 = null;
                String strN35 = null;
                String strN36 = null;
                ArrayList arrayListR2 = null;
                String strN37 = null;
                String strN38 = null;
                long jW04 = 0;
                while (parcel.dataPosition() < iN012) {
                    int i32 = parcel.readInt();
                    switch ((char) i32) {
                        case 2:
                            strN31 = z2.N(parcel, i32);
                            break;
                        case 3:
                            strN32 = z2.N(parcel, i32);
                            break;
                        case 4:
                            strN33 = z2.N(parcel, i32);
                            break;
                        case 5:
                            strN34 = z2.N(parcel, i32);
                            break;
                        case 6:
                            uri2 = (Uri) z2.L(parcel, i32, Uri.CREATOR);
                            break;
                        case 7:
                            strN35 = z2.N(parcel, i32);
                            break;
                        case '\b':
                            jW04 = z2.w0(parcel, i32);
                            break;
                        case '\t':
                            strN36 = z2.N(parcel, i32);
                            break;
                        case '\n':
                            arrayListR2 = z2.R(parcel, i32, Scope.CREATOR);
                            break;
                        case 11:
                            strN37 = z2.N(parcel, i32);
                            break;
                        case '\f':
                            strN38 = z2.N(parcel, i32);
                            break;
                        default:
                            z2.I0(parcel, i32);
                            break;
                    }
                }
                z2.U(parcel, iN012);
                return new GoogleSignInAccount(strN31, strN32, strN33, strN34, uri2, strN35, jW04, strN36, arrayListR2, strN37, strN38);
            case 17:
                int iN013 = z2.N0(parcel);
                ArrayList arrayListR3 = null;
                ArrayList arrayListR4 = null;
                Account account = null;
                String strN39 = null;
                String strN40 = null;
                String strN41 = null;
                int iU04 = 0;
                boolean zP02 = false;
                boolean zP03 = false;
                boolean zP04 = false;
                while (parcel.dataPosition() < iN013) {
                    int i33 = parcel.readInt();
                    switch ((char) i33) {
                        case 1:
                            iU04 = z2.u0(parcel, i33);
                            break;
                        case 2:
                            arrayListR4 = z2.R(parcel, i33, Scope.CREATOR);
                            break;
                        case 3:
                            account = (Account) z2.L(parcel, i33, Account.CREATOR);
                            break;
                        case 4:
                            zP02 = z2.p0(parcel, i33);
                            break;
                        case 5:
                            zP03 = z2.p0(parcel, i33);
                            break;
                        case 6:
                            zP04 = z2.p0(parcel, i33);
                            break;
                        case 7:
                            strN39 = z2.N(parcel, i33);
                            break;
                        case '\b':
                            strN40 = z2.N(parcel, i33);
                            break;
                        case '\t':
                            arrayListR3 = z2.R(parcel, i33, GoogleSignInOptionsExtensionParcelable.CREATOR);
                            break;
                        case '\n':
                            strN41 = z2.N(parcel, i33);
                            break;
                        default:
                            z2.I0(parcel, i33);
                            break;
                    }
                }
                z2.U(parcel, iN013);
                return new GoogleSignInOptions(iU04, arrayListR4, account, zP02, zP03, zP04, strN39, strN40, GoogleSignInOptions.d(arrayListR3), strN41);
            case 18:
                int iN014 = z2.N0(parcel);
                String strN42 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                GoogleSignInAccount googleSignInAccount = null;
                String strN43 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                while (parcel.dataPosition() < iN014) {
                    int i34 = parcel.readInt();
                    char c18 = (char) i34;
                    if (c18 == 4) {
                        strN42 = z2.N(parcel, i34);
                    } else if (c18 == 7) {
                        googleSignInAccount = (GoogleSignInAccount) z2.L(parcel, i34, GoogleSignInAccount.CREATOR);
                    } else if (c18 != '\b') {
                        z2.I0(parcel, i34);
                    } else {
                        strN43 = z2.N(parcel, i34);
                    }
                }
                z2.U(parcel, iN014);
                return new SignInAccount(strN42, googleSignInAccount, strN43);
            case 19:
                return new PrewarmRequest(parcel);
            case 20:
                Intrinsics.g(parcel, "parcel");
                return new LinkAccount((ConsumerSession) parcel.readParcelable(LinkAccount.class.getClassLoader()), parcel.readString(), (DisplayablePaymentDetails) parcel.readParcelable(LinkAccount.class.getClassLoader()), parcel.readInt() == 0 ? null : LinkAuthIntentInfo.CREATOR.createFromParcel(parcel), parcel.readInt() != 0);
            case 21:
                Intrinsics.g(parcel, "parcel");
                return new LinkAuthIntentInfo(parcel.readString(), (ConsentPresentation) parcel.readParcelable(LinkAuthIntentInfo.class.getClassLoader()));
            case 22:
                int iN015 = z2.N0(parcel);
                Bundle bundleF = null;
                int iU05 = 0;
                int iU06 = 0;
                while (parcel.dataPosition() < iN015) {
                    int i35 = parcel.readInt();
                    char c19 = (char) i35;
                    if (c19 == 1) {
                        iU05 = z2.u0(parcel, i35);
                    } else if (c19 == 2) {
                        iU06 = z2.u0(parcel, i35);
                    } else if (c19 != 3) {
                        z2.I0(parcel, i35);
                    } else {
                        bundleF = z2.F(parcel, i35);
                    }
                }
                z2.U(parcel, iN015);
                return new GoogleSignInOptionsExtensionParcelable(iU05, iU06, bundleF);
            case 23:
                int iN016 = z2.N0(parcel);
                String strN44 = null;
                GoogleSignInOptions googleSignInOptions = null;
                while (parcel.dataPosition() < iN016) {
                    int i36 = parcel.readInt();
                    char c21 = (char) i36;
                    if (c21 == 2) {
                        strN44 = z2.N(parcel, i36);
                    } else if (c21 != 5) {
                        z2.I0(parcel, i36);
                    } else {
                        googleSignInOptions = (GoogleSignInOptions) z2.L(parcel, i36, GoogleSignInOptions.CREATOR);
                    }
                }
                z2.U(parcel, iN016);
                return new SignInConfiguration(strN44, googleSignInOptions);
            case 24:
                Intrinsics.g(parcel, "parcel");
                return new PassiveChallengeWarmerArgs(PassiveCaptchaParams.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.createStringArrayList());
            case 25:
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return PassiveChallengeWarmerCompleted.f42523a;
            case 26:
                Intrinsics.g(parcel, "parcel");
                return new ConfirmationHandler$Args((ConfirmationHandler$Option) parcel.readParcelable(ConfirmationHandler$Args.class.getClassLoader()), PaymentMethodMetadata.CREATOR.createFromParcel(parcel));
            case 27:
                Intrinsics.g(parcel, "parcel");
                return new ConfirmationMediator$Parameters((ConfirmationHandler$Option) parcel.readParcelable(ConfirmationMediator$Parameters.class.getClassLoader()), (ConfirmationHandler$Args) parcel.readParcelable(ConfirmationMediator$Parameters.class.getClassLoader()), parcel.readInt() == 0 ? null : f0.valueOf(parcel.readString()));
            case 28:
                Intrinsics.g(parcel, "parcel");
                return new DefaultConfirmationHandler$AwaitingConfirmationResultData(parcel.readString(), (ConfirmationHandler$Option) parcel.readParcelable(DefaultConfirmationHandler$AwaitingConfirmationResultData.class.getClassLoader()), parcel.readInt() != 0);
            default:
                int i37 = parcel.readInt();
                boolean z21 = false;
                if (parcel.readInt() != 0) {
                    z13 = false;
                    z21 = true;
                    z14 = true;
                } else {
                    z13 = false;
                    z14 = true;
                }
                String string5 = parcel.readString();
                if (parcel.readInt() == 0) {
                    z14 = z13;
                }
                return new EditShortcutSavedState(i37, z21, string5, z14, parcel.readInt() == 0 ? null : NamedIntent.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? NamedIntent.CREATOR.createFromParcel(parcel) : null);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f69562a) {
            case 0:
                return new CommonWalletObject[i5];
            case 1:
                return new LabelValue[i5];
            case 2:
                return new LabelValueRow[i5];
            case 3:
                return new LoyaltyPointsBalance[i5];
            case 4:
                return new LoyaltyPoints[i5];
            case 5:
                return new TextModuleData[i5];
            case 6:
                return new TimeInterval[i5];
            case 7:
                return new UriData[i5];
            case 8:
                return new WalletObjectMessage[i5];
            case 9:
                return new CustomerSheet$Configuration[i5];
            case 10:
                return new SimpleBluetoothDevice[i5];
            case 11:
                return new ParcelImpl[i5];
            case 12:
                return new BeginSignInResult[i5];
            case 13:
                return new SignInCredential[i5];
            case 14:
                return new PassiveChallengeArgs[i5];
            case 15:
                return new EmbeddedPaymentElement$Configuration[i5];
            case 16:
                return new GoogleSignInAccount[i5];
            case 17:
                return new GoogleSignInOptions[i5];
            case 18:
                return new SignInAccount[i5];
            case 19:
                return new PrewarmRequest[i5];
            case 20:
                return new LinkAccount[i5];
            case 21:
                return new LinkAuthIntentInfo[i5];
            case 22:
                return new GoogleSignInOptionsExtensionParcelable[i5];
            case 23:
                return new SignInConfiguration[i5];
            case 24:
                return new PassiveChallengeWarmerArgs[i5];
            case 25:
                return new PassiveChallengeWarmerCompleted[i5];
            case 26:
                return new ConfirmationHandler$Args[i5];
            case 27:
                return new ConfirmationMediator$Parameters[i5];
            case 28:
                return new DefaultConfirmationHandler$AwaitingConfirmationResultData[i5];
            default:
                return new EditShortcutSavedState[i5];
        }
    }
}
