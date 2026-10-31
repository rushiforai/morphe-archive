package ft;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.identity.intents.model.UserAddress;
import com.google.android.gms.wallet.CardInfo;
import com.google.android.gms.wallet.CardRequirements;
import com.google.android.gms.wallet.PaymentData;
import com.google.android.gms.wallet.PaymentDataRequest;
import com.google.android.gms.wallet.PaymentMethodToken;
import com.google.android.gms.wallet.PaymentMethodTokenizationParameters;
import com.google.android.gms.wallet.ShippingAddressRequirements;
import com.google.android.gms.wallet.TransactionInfo;
import com.google.android.gms.wallet.zza;
import com.google.android.gms.wallet.zzaj;
import com.google.android.gms.wallet.zzau;
import com.stripe.android.model.Address;
import com.stripe.android.model.AndroidVerificationObject;
import com.stripe.android.model.BankAccount;
import com.stripe.android.model.Card;
import com.stripe.android.model.CustomerBankAccount;
import com.stripe.android.model.CustomerCard;
import com.stripe.android.model.CustomerSource;
import com.stripe.android.model.DisplayablePaymentDetails;
import com.stripe.android.model.FinancialConnectionsSession;
import com.stripe.android.model.LinkAccountSession;
import com.stripe.android.model.LinkAuthIntent;
import com.stripe.android.model.MobileFallbackWebviewParams;
import com.stripe.android.model.PassiveCaptchaParams;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodsList;
import com.stripe.android.model.RadarOptions;
import com.stripe.android.model.RadarSessionWithHCaptcha;
import com.stripe.android.model.SharePaymentDetails;
import com.stripe.android.model.ShippingInformation;
import com.stripe.android.model.ShippingMethod;
import com.stripe.android.model.Source;
import com.stripe.android.model.Stripe3ds2AuthParams;
import com.stripe.android.model.Token;
import com.stripe.android.model.WeChat;
import com.teslacoilsw.launcher.icon.ColorIconSource;
import com.teslacoilsw.launcher.icon.UriIconSource;
import e10.z2;
import java.util.ArrayList;
import java.util.Currency;
import java.util.Date;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f56003a;

    public /* synthetic */ q(int i5) {
        this.f56003a = i5;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        switch (this.f56003a) {
            case 0:
                Intrinsics.g(parcel, "parcel");
                return new CustomerBankAccount((BankAccount) parcel.readParcelable(CustomerBankAccount.class.getClassLoader()));
            case 1:
                Intrinsics.g(parcel, "parcel");
                return new CustomerCard((Card) parcel.readParcelable(CustomerCard.class.getClassLoader()));
            case 2:
                Intrinsics.g(parcel, "parcel");
                return new CustomerSource(Source.CREATOR.createFromParcel(parcel));
            case 3:
                Intrinsics.g(parcel, "parcel");
                return new DisplayablePaymentDetails(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : Long.valueOf(parcel.readLong()));
            case 4:
                Intrinsics.g(parcel, "parcel");
                return new FinancialConnectionsSession(parcel.readString(), parcel.readString());
            case 5:
                Intrinsics.g(parcel, "parcel");
                return new LinkAccountSession(parcel.readString(), parcel.readString());
            case 6:
                Intrinsics.g(parcel, "parcel");
                return new LinkAuthIntent(b0.valueOf(parcel.readString()));
            case 7:
                Intrinsics.g(parcel, "parcel");
                return new MobileFallbackWebviewParams(j0.valueOf(parcel.readString()), parcel.readString());
            case 8:
                Intrinsics.g(parcel, "parcel");
                return new PassiveCaptchaParams(parcel.readString(), parcel.readString());
            case 9:
                Intrinsics.g(parcel, "parcel");
                int i5 = parcel.readInt();
                ArrayList arrayList = new ArrayList(i5);
                int iB = 0;
                while (iB != i5) {
                    iB = fq.c.b(PaymentMethod.CREATOR, parcel, arrayList, iB, 1);
                }
                return new PaymentMethodsList(arrayList);
            case 10:
                Intrinsics.g(parcel, "parcel");
                return new RadarOptions(parcel.readString(), parcel.readInt() == 0 ? null : AndroidVerificationObject.CREATOR.createFromParcel(parcel));
            case 11:
                Intrinsics.g(parcel, "parcel");
                return new RadarSessionWithHCaptcha(parcel.readString(), parcel.readString(), parcel.readString());
            case 12:
                Intrinsics.g(parcel, "parcel");
                return new SharePaymentDetails(parcel.readString(), parcel.readString());
            case 13:
                Intrinsics.g(parcel, "parcel");
                return new ShippingInformation(parcel.readInt() == 0 ? null : Address.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readString());
            case 14:
                Intrinsics.g(parcel, "parcel");
                return new ShippingMethod(parcel.readString(), parcel.readString(), parcel.readLong(), (Currency) parcel.readSerializable(), parcel.readString());
            case 15:
                Intrinsics.g(parcel, "parcel");
                return new Stripe3ds2AuthParams(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt(), parcel.readString());
            case 16:
                Intrinsics.g(parcel, "parcel");
                String string = parcel.readString();
                t0 t0VarValueOf = t0.valueOf(parcel.readString());
                Date date = (Date) parcel.readSerializable();
                boolean z12 = false;
                if (parcel.readInt() != 0) {
                    z11 = false;
                    z12 = true;
                } else {
                    z11 = false;
                }
                return new Token(string, t0VarValueOf, date, z12, parcel.readInt() == 0 ? z11 : true, parcel.readInt() == 0 ? null : BankAccount.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? Card.CREATOR.createFromParcel(parcel) : null);
            case 17:
                Intrinsics.g(parcel, "parcel");
                return new WeChat(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            case 18:
                return new ColorIconSource(parcel.readInt());
            case 19:
                return new UriIconSource((Uri) parcel.readParcelable(UriIconSource.class.getClassLoader()));
            case 20:
                int iN0 = z2.N0(parcel);
                String strN = null;
                CardInfo cardInfo = null;
                UserAddress userAddress = null;
                PaymentMethodToken paymentMethodToken = null;
                String strN2 = null;
                Bundle bundleF = null;
                String strN3 = null;
                Bundle bundleF2 = null;
                while (parcel.dataPosition() < iN0) {
                    int i11 = parcel.readInt();
                    switch ((char) i11) {
                        case 1:
                            strN = z2.N(parcel, i11);
                            break;
                        case 2:
                            cardInfo = (CardInfo) z2.L(parcel, i11, CardInfo.CREATOR);
                            break;
                        case 3:
                            userAddress = (UserAddress) z2.L(parcel, i11, UserAddress.CREATOR);
                            break;
                        case 4:
                            paymentMethodToken = (PaymentMethodToken) z2.L(parcel, i11, PaymentMethodToken.CREATOR);
                            break;
                        case 5:
                            strN2 = z2.N(parcel, i11);
                            break;
                        case 6:
                            bundleF = z2.F(parcel, i11);
                            break;
                        case 7:
                            strN3 = z2.N(parcel, i11);
                            break;
                        case '\b':
                            bundleF2 = z2.F(parcel, i11);
                            break;
                        default:
                            z2.I0(parcel, i11);
                            break;
                    }
                }
                z2.U(parcel, iN0);
                PaymentData paymentData = new PaymentData();
                paymentData.f33885f = strN;
                paymentData.f33886g = cardInfo;
                paymentData.f33887h = userAddress;
                paymentData.f33888i = paymentMethodToken;
                paymentData.f33889j = strN2;
                paymentData.f33890k = bundleF;
                paymentData.f33891l = strN3;
                paymentData.f33892m = bundleF2;
                return paymentData;
            case 21:
                int iN02 = z2.N0(parcel);
                CardRequirements cardRequirements = null;
                PaymentMethodTokenizationParameters paymentMethodTokenizationParameters = null;
                TransactionInfo transactionInfo = null;
                String strN4 = null;
                byte[] bArrG = null;
                Bundle bundleF3 = null;
                boolean zP0 = true;
                boolean zP02 = false;
                boolean zP03 = false;
                boolean zP04 = false;
                ShippingAddressRequirements shippingAddressRequirements = null;
                ArrayList arrayListK = null;
                while (parcel.dataPosition() < iN02) {
                    int i12 = parcel.readInt();
                    switch ((char) i12) {
                        case 1:
                            zP02 = z2.p0(parcel, i12);
                            break;
                        case 2:
                            zP03 = z2.p0(parcel, i12);
                            break;
                        case 3:
                            cardRequirements = (CardRequirements) z2.L(parcel, i12, CardRequirements.CREATOR);
                            break;
                        case 4:
                            zP04 = z2.p0(parcel, i12);
                            break;
                        case 5:
                            shippingAddressRequirements = (ShippingAddressRequirements) z2.L(parcel, i12, ShippingAddressRequirements.CREATOR);
                            break;
                        case 6:
                            arrayListK = z2.K(parcel, i12);
                            break;
                        case 7:
                            paymentMethodTokenizationParameters = (PaymentMethodTokenizationParameters) z2.L(parcel, i12, PaymentMethodTokenizationParameters.CREATOR);
                            break;
                        case '\b':
                            transactionInfo = (TransactionInfo) z2.L(parcel, i12, TransactionInfo.CREATOR);
                            break;
                        case '\t':
                            zP0 = z2.p0(parcel, i12);
                            break;
                        case '\n':
                            strN4 = z2.N(parcel, i12);
                            break;
                        case 11:
                            bundleF3 = z2.F(parcel, i12);
                            break;
                        case '\f':
                            bArrG = z2.G(parcel, i12);
                            break;
                        default:
                            z2.I0(parcel, i12);
                            break;
                    }
                }
                z2.U(parcel, iN02);
                PaymentDataRequest paymentDataRequest = new PaymentDataRequest();
                paymentDataRequest.f33893f = zP02;
                paymentDataRequest.f33894g = zP03;
                paymentDataRequest.f33895h = cardRequirements;
                paymentDataRequest.f33896i = zP04;
                paymentDataRequest.f33897j = shippingAddressRequirements;
                paymentDataRequest.f33898k = arrayListK;
                paymentDataRequest.f33899l = paymentMethodTokenizationParameters;
                paymentDataRequest.f33900m = transactionInfo;
                paymentDataRequest.n = zP0;
                paymentDataRequest.o = strN4;
                paymentDataRequest.f33901p = bArrG;
                paymentDataRequest.f33902q = bundleF3;
                return paymentDataRequest;
            case 22:
                int iN03 = z2.N0(parcel);
                String strN5 = null;
                int iU0 = 0;
                while (parcel.dataPosition() < iN03) {
                    int i13 = parcel.readInt();
                    char c11 = (char) i13;
                    if (c11 == 2) {
                        iU0 = z2.u0(parcel, i13);
                    } else if (c11 != 3) {
                        z2.I0(parcel, i13);
                    } else {
                        strN5 = z2.N(parcel, i13);
                    }
                }
                z2.U(parcel, iN03);
                PaymentMethodToken paymentMethodToken2 = new PaymentMethodToken();
                paymentMethodToken2.f33903f = iU0;
                paymentMethodToken2.f33904g = strN5;
                return paymentMethodToken2;
            case 23:
                int iN04 = z2.N0(parcel);
                Bundle bundleF4 = null;
                int iU02 = 0;
                while (parcel.dataPosition() < iN04) {
                    int i14 = parcel.readInt();
                    char c12 = (char) i14;
                    if (c12 == 2) {
                        iU02 = z2.u0(parcel, i14);
                    } else if (c12 != 3) {
                        z2.I0(parcel, i14);
                    } else {
                        bundleF4 = z2.F(parcel, i14);
                    }
                }
                z2.U(parcel, iN04);
                return new PaymentMethodTokenizationParameters(iU02, bundleF4);
            case 24:
                int iN05 = z2.N0(parcel);
                int iU03 = 0;
                String strN6 = null;
                String strN7 = null;
                int iU04 = 0;
                while (parcel.dataPosition() < iN05) {
                    int i15 = parcel.readInt();
                    char c13 = (char) i15;
                    if (c13 == 2) {
                        strN6 = z2.N(parcel, i15);
                    } else if (c13 == 3) {
                        strN7 = z2.N(parcel, i15);
                    } else if (c13 == 4) {
                        iU03 = z2.u0(parcel, i15);
                    } else if (c13 != 5) {
                        z2.I0(parcel, i15);
                    } else {
                        iU04 = z2.u0(parcel, i15);
                    }
                }
                z2.U(parcel, iN05);
                return new zzaj(strN6, strN7, iU03, iU04);
            case 25:
                int iN06 = z2.N0(parcel);
                ArrayList arrayListP = null;
                while (parcel.dataPosition() < iN06) {
                    int i16 = parcel.readInt();
                    if (((char) i16) != 1) {
                        z2.I0(parcel, i16);
                    } else {
                        arrayListP = z2.P(parcel, i16);
                    }
                }
                z2.U(parcel, iN06);
                ShippingAddressRequirements shippingAddressRequirements2 = new ShippingAddressRequirements();
                shippingAddressRequirements2.f33907f = arrayListP;
                return shippingAddressRequirements2;
            case 26:
                int iN07 = z2.N0(parcel);
                String strN8 = null;
                int iU05 = 0;
                String strN9 = null;
                while (parcel.dataPosition() < iN07) {
                    int i17 = parcel.readInt();
                    char c14 = (char) i17;
                    if (c14 == 1) {
                        iU05 = z2.u0(parcel, i17);
                    } else if (c14 == 2) {
                        strN8 = z2.N(parcel, i17);
                    } else if (c14 != 3) {
                        z2.I0(parcel, i17);
                    } else {
                        strN9 = z2.N(parcel, i17);
                    }
                }
                z2.U(parcel, iN07);
                TransactionInfo transactionInfo2 = new TransactionInfo();
                transactionInfo2.f33908f = iU05;
                transactionInfo2.f33909g = strN8;
                transactionInfo2.f33910h = strN9;
                return transactionInfo2;
            case 27:
                int iN08 = z2.N0(parcel);
                String strN10 = null;
                Bundle bundleF5 = null;
                while (parcel.dataPosition() < iN08) {
                    int i18 = parcel.readInt();
                    char c15 = (char) i18;
                    if (c15 == 2) {
                        strN10 = z2.N(parcel, i18);
                    } else if (c15 != 3) {
                        z2.I0(parcel, i18);
                    } else {
                        bundleF5 = z2.F(parcel, i18);
                    }
                }
                z2.U(parcel, iN08);
                zzau zzauVar = new zzau();
                zzauVar.f33983f = strN10;
                zzauVar.f33984g = bundleF5;
                return zzauVar;
            case 28:
                int iN09 = z2.N0(parcel);
                String strN11 = null;
                String strN12 = null;
                String strN13 = null;
                String strN14 = null;
                String strN15 = null;
                String strN16 = null;
                String strN17 = null;
                String strN18 = null;
                String strN19 = null;
                boolean zP05 = false;
                String strN20 = null;
                while (parcel.dataPosition() < iN09) {
                    int i19 = parcel.readInt();
                    switch ((char) i19) {
                        case 2:
                            strN11 = z2.N(parcel, i19);
                            break;
                        case 3:
                            strN20 = z2.N(parcel, i19);
                            break;
                        case 4:
                            strN12 = z2.N(parcel, i19);
                            break;
                        case 5:
                            strN13 = z2.N(parcel, i19);
                            break;
                        case 6:
                            strN14 = z2.N(parcel, i19);
                            break;
                        case 7:
                            strN15 = z2.N(parcel, i19);
                            break;
                        case '\b':
                            strN16 = z2.N(parcel, i19);
                            break;
                        case '\t':
                            strN17 = z2.N(parcel, i19);
                            break;
                        case '\n':
                            strN18 = z2.N(parcel, i19);
                            break;
                        case 11:
                            zP05 = z2.p0(parcel, i19);
                            break;
                        case '\f':
                            strN19 = z2.N(parcel, i19);
                            break;
                        default:
                            z2.I0(parcel, i19);
                            break;
                    }
                }
                z2.U(parcel, iN09);
                zza zzaVar = new zza();
                zzaVar.f33970f = strN11;
                zzaVar.f33971g = strN20;
                zzaVar.f33972h = strN12;
                zzaVar.f33973i = strN13;
                zzaVar.f33974j = strN14;
                zzaVar.f33975k = strN15;
                zzaVar.f33976l = strN16;
                zzaVar.f33977m = strN17;
                zzaVar.n = strN18;
                zzaVar.o = zP05;
                zzaVar.f33978p = strN19;
                return zzaVar;
            default:
                int iN010 = z2.N0(parcel);
                String strN21 = null;
                String strN22 = null;
                UserAddress userAddress2 = null;
                int iU06 = 0;
                String strN23 = null;
                while (parcel.dataPosition() < iN010) {
                    int i21 = parcel.readInt();
                    char c16 = (char) i21;
                    if (c16 == 1) {
                        strN21 = z2.N(parcel, i21);
                    } else if (c16 == 2) {
                        strN23 = z2.N(parcel, i21);
                    } else if (c16 == 3) {
                        strN22 = z2.N(parcel, i21);
                    } else if (c16 == 4) {
                        iU06 = z2.u0(parcel, i21);
                    } else if (c16 != 5) {
                        z2.I0(parcel, i21);
                    } else {
                        userAddress2 = (UserAddress) z2.L(parcel, i21, UserAddress.CREATOR);
                    }
                }
                z2.U(parcel, iN010);
                CardInfo cardInfo2 = new CardInfo();
                cardInfo2.f33821f = strN21;
                cardInfo2.f33822g = strN23;
                cardInfo2.f33823h = strN22;
                cardInfo2.f33824i = iU06;
                cardInfo2.f33825j = userAddress2;
                return cardInfo2;
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f56003a) {
            case 0:
                return new CustomerBankAccount[i5];
            case 1:
                return new CustomerCard[i5];
            case 2:
                return new CustomerSource[i5];
            case 3:
                return new DisplayablePaymentDetails[i5];
            case 4:
                return new FinancialConnectionsSession[i5];
            case 5:
                return new LinkAccountSession[i5];
            case 6:
                return new LinkAuthIntent[i5];
            case 7:
                return new MobileFallbackWebviewParams[i5];
            case 8:
                return new PassiveCaptchaParams[i5];
            case 9:
                return new PaymentMethodsList[i5];
            case 10:
                return new RadarOptions[i5];
            case 11:
                return new RadarSessionWithHCaptcha[i5];
            case 12:
                return new SharePaymentDetails[i5];
            case 13:
                return new ShippingInformation[i5];
            case 14:
                return new ShippingMethod[i5];
            case 15:
                return new Stripe3ds2AuthParams[i5];
            case 16:
                return new Token[i5];
            case 17:
                return new WeChat[i5];
            case 18:
                return new ColorIconSource[i5];
            case 19:
                return new UriIconSource[i5];
            case 20:
                return new PaymentData[i5];
            case 21:
                return new PaymentDataRequest[i5];
            case 22:
                return new PaymentMethodToken[i5];
            case 23:
                return new PaymentMethodTokenizationParameters[i5];
            case 24:
                return new zzaj[i5];
            case 25:
                return new ShippingAddressRequirements[i5];
            case 26:
                return new TransactionInfo[i5];
            case 27:
                return new zzau[i5];
            case 28:
                return new zza[i5];
            default:
                return new CardInfo[i5];
        }
    }
}
