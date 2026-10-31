package gi;

import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.IntentSenderRequest;
import com.google.android.exoplayer2.drm.DrmInitData;
import com.google.android.gms.identity.intents.model.UserAddress;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.wallet.CardRequirements;
import com.google.android.gms.wallet.CreditCardExpirationDate;
import com.google.android.gms.wallet.FullWallet;
import com.google.android.gms.wallet.InstrumentInfo;
import com.google.android.gms.wallet.IsReadyToPayRequest;
import com.google.android.gms.wallet.LoyaltyWalletObject;
import com.google.android.gms.wallet.MaskedWallet;
import com.google.android.gms.wallet.OfferWalletObject;
import com.google.android.gms.wallet.PaymentCardRecognitionIntentRequest;
import com.google.android.gms.wallet.PaymentCardRecognitionIntentResponse;
import com.google.android.gms.wallet.PaymentCardRecognitionResult;
import com.google.android.gms.wallet.PaymentMethodToken;
import com.google.android.gms.wallet.button.ButtonOptions;
import com.google.android.gms.wallet.button.zzc;
import com.google.android.gms.wallet.wobs.CommonWalletObject;
import com.google.android.gms.wallet.wobs.LabelValueRow;
import com.google.android.gms.wallet.wobs.LoyaltyPoints;
import com.google.android.gms.wallet.wobs.TextModuleData;
import com.google.android.gms.wallet.wobs.TimeInterval;
import com.google.android.gms.wallet.wobs.UriData;
import com.google.android.gms.wallet.wobs.WalletObjectMessage;
import com.google.android.gms.wallet.zza;
import com.google.android.gms.wallet.zzaj;
import com.stripe.android.cards.Bin;
import com.stripe.android.challenge.confirmation.BridgeErrorParams;
import com.stripe.android.challenge.confirmation.BridgeSuccessParams;
import com.stripe.android.challenge.confirmation.IntentConfirmationChallengeArgs;
import com.stripe.android.common.model.CommonConfiguration;
import com.stripe.android.core.strings.ConcatenatedResolvableString;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.core.strings.StaticResolvableString;
import com.stripe.android.core.strings.transformations.Replace;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.state.CustomerState;
import com.stripe.android.paymentsheet.state.LinkDisabledState;
import com.stripe.android.paymentsheet.state.LinkSignupModeResult;
import com.stripe.android.paymentsheet.state.LinkState;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$State;
import com.stripe.android.paymentsheet.state.PaymentSheetState$Full;
import com.teslacoilsw.launcher.search.shortcutsearch.authorization.DefaultOAuthRequest;
import e10.z2;
import ft.c0;
import gv.d0;
import gv.q0;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;
import sg.w;

/* loaded from: classes3.dex */
public final class g implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57687a;

    public /* synthetic */ g(int i5) {
        this.f57687a = i5;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        switch (this.f57687a) {
            case 0:
                int iN0 = z2.N0(parcel);
                boolean zP0 = false;
                boolean zP02 = true;
                ArrayList arrayListK = null;
                int iU0 = 0;
                while (parcel.dataPosition() < iN0) {
                    int i5 = parcel.readInt();
                    char c11 = (char) i5;
                    if (c11 == 1) {
                        arrayListK = z2.K(parcel, i5);
                    } else if (c11 == 2) {
                        zP02 = z2.p0(parcel, i5);
                    } else if (c11 == 3) {
                        zP0 = z2.p0(parcel, i5);
                    } else if (c11 != 4) {
                        z2.I0(parcel, i5);
                    } else {
                        iU0 = z2.u0(parcel, i5);
                    }
                }
                z2.U(parcel, iN0);
                CardRequirements cardRequirements = new CardRequirements();
                cardRequirements.f33826f = arrayListK;
                cardRequirements.f33827g = zP02;
                cardRequirements.f33828h = zP0;
                cardRequirements.f33829i = iU0;
                return cardRequirements;
            case 1:
                int iN02 = z2.N0(parcel);
                int iU02 = 0;
                int iU03 = 0;
                while (parcel.dataPosition() < iN02) {
                    int i11 = parcel.readInt();
                    char c12 = (char) i11;
                    if (c12 == 1) {
                        iU02 = z2.u0(parcel, i11);
                    } else if (c12 != 2) {
                        z2.I0(parcel, i11);
                    } else {
                        iU03 = z2.u0(parcel, i11);
                    }
                }
                z2.U(parcel, iN02);
                CreditCardExpirationDate creditCardExpirationDate = new CreditCardExpirationDate();
                creditCardExpirationDate.f33830f = iU02;
                creditCardExpirationDate.f33831g = iU03;
                return creditCardExpirationDate;
            case 2:
                int iN03 = z2.N0(parcel);
                String strN = null;
                String strN2 = null;
                zzaj zzajVar = null;
                String strN3 = null;
                zza zzaVar = null;
                zza zzaVar2 = null;
                String[] strArrO = null;
                UserAddress userAddress = null;
                UserAddress userAddress2 = null;
                InstrumentInfo[] instrumentInfoArr = null;
                PaymentMethodToken paymentMethodToken = null;
                while (parcel.dataPosition() < iN03) {
                    int i12 = parcel.readInt();
                    switch ((char) i12) {
                        case 2:
                            strN = z2.N(parcel, i12);
                            break;
                        case 3:
                            strN2 = z2.N(parcel, i12);
                            break;
                        case 4:
                            zzajVar = (zzaj) z2.L(parcel, i12, zzaj.CREATOR);
                            break;
                        case 5:
                            strN3 = z2.N(parcel, i12);
                            break;
                        case 6:
                            zzaVar = (zza) z2.L(parcel, i12, zza.CREATOR);
                            break;
                        case 7:
                            zzaVar2 = (zza) z2.L(parcel, i12, zza.CREATOR);
                            break;
                        case '\b':
                            strArrO = z2.O(parcel, i12);
                            break;
                        case '\t':
                            userAddress = (UserAddress) z2.L(parcel, i12, UserAddress.CREATOR);
                            break;
                        case '\n':
                            userAddress2 = (UserAddress) z2.L(parcel, i12, UserAddress.CREATOR);
                            break;
                        case 11:
                            instrumentInfoArr = (InstrumentInfo[]) z2.Q(parcel, i12, InstrumentInfo.CREATOR);
                            break;
                        case '\f':
                            paymentMethodToken = (PaymentMethodToken) z2.L(parcel, i12, PaymentMethodToken.CREATOR);
                            break;
                        default:
                            z2.I0(parcel, i12);
                            break;
                    }
                }
                z2.U(parcel, iN03);
                FullWallet fullWallet = new FullWallet();
                fullWallet.f33832f = strN;
                fullWallet.f33833g = strN2;
                fullWallet.f33834h = zzajVar;
                fullWallet.f33835i = strN3;
                fullWallet.f33836j = zzaVar;
                fullWallet.f33837k = zzaVar2;
                fullWallet.f33838l = strArrO;
                fullWallet.f33839m = userAddress;
                fullWallet.n = userAddress2;
                fullWallet.o = instrumentInfoArr;
                fullWallet.f33840p = paymentMethodToken;
                return fullWallet;
            case 3:
                int iN04 = z2.N0(parcel);
                int iU04 = 0;
                String strN4 = null;
                String strN5 = null;
                while (parcel.dataPosition() < iN04) {
                    int i13 = parcel.readInt();
                    char c13 = (char) i13;
                    if (c13 == 2) {
                        strN4 = z2.N(parcel, i13);
                    } else if (c13 == 3) {
                        strN5 = z2.N(parcel, i13);
                    } else if (c13 != 4) {
                        z2.I0(parcel, i13);
                    } else {
                        iU04 = z2.u0(parcel, i13);
                    }
                }
                z2.U(parcel, iN04);
                InstrumentInfo instrumentInfo = new InstrumentInfo();
                instrumentInfo.f33841f = strN4;
                instrumentInfo.f33842g = strN5;
                instrumentInfo.f33843h = iU04;
                return instrumentInfo;
            case 4:
                int iN05 = z2.N0(parcel);
                ArrayList arrayListK2 = null;
                String strN6 = null;
                ArrayList arrayListK3 = null;
                String strN7 = null;
                boolean zP03 = false;
                String strN8 = null;
                while (parcel.dataPosition() < iN05) {
                    int i14 = parcel.readInt();
                    switch ((char) i14) {
                        case 2:
                            arrayListK2 = z2.K(parcel, i14);
                            break;
                        case 3:
                        default:
                            z2.I0(parcel, i14);
                            break;
                        case 4:
                            strN8 = z2.N(parcel, i14);
                            break;
                        case 5:
                            strN6 = z2.N(parcel, i14);
                            break;
                        case 6:
                            arrayListK3 = z2.K(parcel, i14);
                            break;
                        case 7:
                            zP03 = z2.p0(parcel, i14);
                            break;
                        case '\b':
                            strN7 = z2.N(parcel, i14);
                            break;
                    }
                }
                z2.U(parcel, iN05);
                IsReadyToPayRequest isReadyToPayRequest = new IsReadyToPayRequest();
                isReadyToPayRequest.f33844f = arrayListK2;
                isReadyToPayRequest.f33845g = strN8;
                isReadyToPayRequest.f33846h = strN6;
                isReadyToPayRequest.f33847i = arrayListK3;
                isReadyToPayRequest.f33848j = zP03;
                isReadyToPayRequest.f33849k = strN7;
                return isReadyToPayRequest;
            case 5:
                int iN06 = z2.N0(parcel);
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                ArrayList arrayListR = arrayList;
                ArrayList arrayListR2 = arrayList2;
                ArrayList arrayList3 = new ArrayList();
                ArrayList arrayList4 = new ArrayList();
                ArrayList arrayList5 = new ArrayList();
                ArrayList arrayList6 = new ArrayList();
                String strN9 = null;
                String strN10 = null;
                String strN11 = null;
                String strN12 = null;
                String strN13 = null;
                String strN14 = null;
                String strN15 = null;
                String strN16 = null;
                String strN17 = null;
                String strN18 = null;
                TimeInterval timeInterval = null;
                String strN19 = null;
                String strN20 = null;
                LoyaltyPoints loyaltyPoints = null;
                int iU05 = 0;
                boolean zP04 = false;
                while (parcel.dataPosition() < iN06) {
                    int i15 = parcel.readInt();
                    switch ((char) i15) {
                        case 2:
                            strN9 = z2.N(parcel, i15);
                            break;
                        case 3:
                            strN10 = z2.N(parcel, i15);
                            break;
                        case 4:
                            strN11 = z2.N(parcel, i15);
                            break;
                        case 5:
                            strN12 = z2.N(parcel, i15);
                            break;
                        case 6:
                            strN13 = z2.N(parcel, i15);
                            break;
                        case 7:
                            strN14 = z2.N(parcel, i15);
                            break;
                        case '\b':
                            strN15 = z2.N(parcel, i15);
                            break;
                        case '\t':
                            strN16 = z2.N(parcel, i15);
                            break;
                        case '\n':
                            strN17 = z2.N(parcel, i15);
                            break;
                        case 11:
                            strN18 = z2.N(parcel, i15);
                            break;
                        case '\f':
                            iU05 = z2.u0(parcel, i15);
                            break;
                        case '\r':
                            arrayListR = z2.R(parcel, i15, WalletObjectMessage.CREATOR);
                            break;
                        case 14:
                            timeInterval = (TimeInterval) z2.L(parcel, i15, TimeInterval.CREATOR);
                            break;
                        case 15:
                            arrayListR2 = z2.R(parcel, i15, LatLng.CREATOR);
                            break;
                        case 16:
                            strN19 = z2.N(parcel, i15);
                            break;
                        case 17:
                            strN20 = z2.N(parcel, i15);
                            break;
                        case 18:
                            arrayList3 = z2.R(parcel, i15, LabelValueRow.CREATOR);
                            break;
                        case 19:
                            zP04 = z2.p0(parcel, i15);
                            break;
                        case 20:
                            arrayList4 = z2.R(parcel, i15, UriData.CREATOR);
                            break;
                        case 21:
                            arrayList5 = z2.R(parcel, i15, TextModuleData.CREATOR);
                            break;
                        case 22:
                            arrayList6 = z2.R(parcel, i15, UriData.CREATOR);
                            break;
                        case 23:
                            loyaltyPoints = (LoyaltyPoints) z2.L(parcel, i15, LoyaltyPoints.CREATOR);
                            break;
                        default:
                            z2.I0(parcel, i15);
                            break;
                    }
                }
                z2.U(parcel, iN06);
                return new LoyaltyWalletObject(strN9, strN10, strN11, strN12, strN13, strN14, strN15, strN16, strN17, strN18, iU05, arrayListR, timeInterval, arrayListR2, strN19, strN20, arrayList3, zP04, arrayList4, arrayList5, arrayList6, loyaltyPoints);
            case 6:
                int iN07 = z2.N0(parcel);
                String strN21 = null;
                String strN22 = null;
                String[] strArrO2 = null;
                String strN23 = null;
                zza zzaVar3 = null;
                zza zzaVar4 = null;
                LoyaltyWalletObject[] loyaltyWalletObjectArr = null;
                OfferWalletObject[] offerWalletObjectArr = null;
                UserAddress userAddress3 = null;
                UserAddress userAddress4 = null;
                InstrumentInfo[] instrumentInfoArr2 = null;
                while (parcel.dataPosition() < iN07) {
                    int i16 = parcel.readInt();
                    switch ((char) i16) {
                        case 2:
                            strN21 = z2.N(parcel, i16);
                            break;
                        case 3:
                            strN22 = z2.N(parcel, i16);
                            break;
                        case 4:
                            strArrO2 = z2.O(parcel, i16);
                            break;
                        case 5:
                            strN23 = z2.N(parcel, i16);
                            break;
                        case 6:
                            zzaVar3 = (zza) z2.L(parcel, i16, zza.CREATOR);
                            break;
                        case 7:
                            zzaVar4 = (zza) z2.L(parcel, i16, zza.CREATOR);
                            break;
                        case '\b':
                            loyaltyWalletObjectArr = (LoyaltyWalletObject[]) z2.Q(parcel, i16, LoyaltyWalletObject.CREATOR);
                            break;
                        case '\t':
                            offerWalletObjectArr = (OfferWalletObject[]) z2.Q(parcel, i16, OfferWalletObject.CREATOR);
                            break;
                        case '\n':
                            userAddress3 = (UserAddress) z2.L(parcel, i16, UserAddress.CREATOR);
                            break;
                        case 11:
                            userAddress4 = (UserAddress) z2.L(parcel, i16, UserAddress.CREATOR);
                            break;
                        case '\f':
                            instrumentInfoArr2 = (InstrumentInfo[]) z2.Q(parcel, i16, InstrumentInfo.CREATOR);
                            break;
                        default:
                            z2.I0(parcel, i16);
                            break;
                    }
                }
                z2.U(parcel, iN07);
                MaskedWallet maskedWallet = new MaskedWallet();
                maskedWallet.f33869f = strN21;
                maskedWallet.f33870g = strN22;
                maskedWallet.f33871h = strArrO2;
                maskedWallet.f33872i = strN23;
                maskedWallet.f33873j = zzaVar3;
                maskedWallet.f33874k = zzaVar4;
                maskedWallet.f33875l = loyaltyWalletObjectArr;
                maskedWallet.f33876m = offerWalletObjectArr;
                maskedWallet.n = userAddress3;
                maskedWallet.o = userAddress4;
                maskedWallet.f33877p = instrumentInfoArr2;
                return maskedWallet;
            case 7:
                int iN08 = z2.N0(parcel);
                String strN24 = null;
                CommonWalletObject commonWalletObject = null;
                int iU06 = 0;
                String strN25 = null;
                while (parcel.dataPosition() < iN08) {
                    int i17 = parcel.readInt();
                    char c14 = (char) i17;
                    if (c14 == 1) {
                        iU06 = z2.u0(parcel, i17);
                    } else if (c14 == 2) {
                        strN24 = z2.N(parcel, i17);
                    } else if (c14 == 3) {
                        strN25 = z2.N(parcel, i17);
                    } else if (c14 != 4) {
                        z2.I0(parcel, i17);
                    } else {
                        commonWalletObject = (CommonWalletObject) z2.L(parcel, i17, CommonWalletObject.CREATOR);
                    }
                }
                z2.U(parcel, iN08);
                return new OfferWalletObject(iU06, strN24, strN25, commonWalletObject);
            case 8:
                int iN09 = z2.N0(parcel);
                String strN26 = null;
                CreditCardExpirationDate creditCardExpirationDate2 = null;
                while (parcel.dataPosition() < iN09) {
                    int i18 = parcel.readInt();
                    char c15 = (char) i18;
                    if (c15 == 1) {
                        strN26 = z2.N(parcel, i18);
                    } else if (c15 != 2) {
                        z2.I0(parcel, i18);
                    } else {
                        creditCardExpirationDate2 = (CreditCardExpirationDate) z2.L(parcel, i18, CreditCardExpirationDate.CREATOR);
                    }
                }
                z2.U(parcel, iN09);
                PaymentCardRecognitionResult paymentCardRecognitionResult = new PaymentCardRecognitionResult();
                paymentCardRecognitionResult.f33883f = strN26;
                paymentCardRecognitionResult.f33884g = creditCardExpirationDate2;
                return paymentCardRecognitionResult;
            case 9:
                int iN010 = z2.N0(parcel);
                int iU07 = 0;
                while (parcel.dataPosition() < iN010) {
                    int i19 = parcel.readInt();
                    if (((char) i19) != 1) {
                        z2.I0(parcel, i19);
                    } else {
                        iU07 = z2.u0(parcel, i19);
                    }
                }
                z2.U(parcel, iN010);
                PaymentCardRecognitionIntentRequest paymentCardRecognitionIntentRequest = new PaymentCardRecognitionIntentRequest();
                paymentCardRecognitionIntentRequest.f33881f = iU07;
                return paymentCardRecognitionIntentRequest;
            case 10:
                int iN011 = z2.N0(parcel);
                PendingIntent pendingIntent = null;
                while (parcel.dataPosition() < iN011) {
                    int i21 = parcel.readInt();
                    if (((char) i21) != 1) {
                        z2.I0(parcel, i21);
                    } else {
                        pendingIntent = (PendingIntent) z2.L(parcel, i21, PendingIntent.CREATOR);
                    }
                }
                z2.U(parcel, iN011);
                PaymentCardRecognitionIntentResponse paymentCardRecognitionIntentResponse = new PaymentCardRecognitionIntentResponse();
                paymentCardRecognitionIntentResponse.f33882f = pendingIntent;
                return paymentCardRecognitionIntentResponse;
            case 11:
                Intrinsics.g(parcel, "parcel");
                return new ConcatenatedResolvableString((ResolvableString) parcel.readParcelable(ConcatenatedResolvableString.class.getClassLoader()), (ResolvableString) parcel.readParcelable(ConcatenatedResolvableString.class.getClassLoader()));
            case 12:
                Intrinsics.g(parcel, "parcel");
                int i22 = parcel.readInt();
                int i23 = parcel.readInt();
                ArrayList arrayList7 = new ArrayList(i23);
                for (int i24 = 0; i24 != i23; i24++) {
                    arrayList7.add(parcel.readParcelable(IdentifierResolvableString.class.getClassLoader()));
                }
                int i25 = parcel.readInt();
                ArrayList arrayList8 = new ArrayList(i25);
                for (int i26 = 0; i26 != i25; i26++) {
                    arrayList8.add(parcel.readValue(IdentifierResolvableString.class.getClassLoader()));
                }
                return new IdentifierResolvableString(arrayList7, arrayList8, i22);
            case 13:
                Intrinsics.g(parcel, "parcel");
                String string = parcel.readString();
                int i27 = parcel.readInt();
                ArrayList arrayList9 = new ArrayList(i27);
                for (int i28 = 0; i28 != i27; i28++) {
                    arrayList9.add(parcel.readValue(StaticResolvableString.class.getClassLoader()));
                }
                return new StaticResolvableString(string, arrayList9);
            case 14:
                Intrinsics.g(parcel, "parcel");
                int i29 = parcel.readInt();
                ArrayList arrayList10 = new ArrayList(i29);
                for (int i31 = 0; i31 != i29; i31++) {
                    arrayList10.add(parcel.readParcelable(CustomerState.class.getClassLoader()));
                }
                return new CustomerState(arrayList10, parcel.readString());
            case 15:
                Intrinsics.g(parcel, "parcel");
                int i32 = parcel.readInt();
                ArrayList arrayList11 = new ArrayList(i32);
                for (int i33 = 0; i33 != i32; i33++) {
                    arrayList11.add(c0.valueOf(parcel.readString()));
                }
                return new LinkDisabledState(arrayList11);
            case 16:
                Intrinsics.g(parcel, "parcel");
                return new LinkState(LinkConfiguration.CREATOR.createFromParcel(parcel), d0.valueOf(parcel.readString()), (LinkSignupModeResult) parcel.readParcelable(LinkState.class.getClassLoader()));
            case 17:
                Intrinsics.g(parcel, "parcel");
                return new PaymentElementLoader$State((CommonConfiguration) parcel.readParcelable(PaymentElementLoader$State.class.getClassLoader()), (CustomerState) parcel.readParcelable(PaymentElementLoader$State.class.getClassLoader()), (PaymentSelection) parcel.readParcelable(PaymentElementLoader$State.class.getClassLoader()), (q0) parcel.readSerializable(), (PaymentMethodMetadata) parcel.readParcelable(PaymentElementLoader$State.class.getClassLoader()));
            case 18:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheetState$Full(CommonConfiguration.CREATOR.createFromParcel(parcel), parcel.readInt() == 0 ? null : CustomerState.CREATOR.createFromParcel(parcel), (PaymentSelection) parcel.readParcelable(PaymentSheetState$Full.class.getClassLoader()), (q0) parcel.readSerializable(), PaymentMethodMetadata.CREATOR.createFromParcel(parcel));
            case 19:
                return new DefaultOAuthRequest(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.createStringArray(), h20.a.valueOf(parcel.readString()));
            case 20:
                int iN012 = z2.N0(parcel);
                String strN27 = null;
                int iU08 = 0;
                int iU09 = 0;
                int iU010 = 0;
                while (parcel.dataPosition() < iN012) {
                    int i34 = parcel.readInt();
                    char c16 = (char) i34;
                    if (c16 == 1) {
                        iU08 = z2.u0(parcel, i34);
                    } else if (c16 == 2) {
                        iU09 = z2.u0(parcel, i34);
                    } else if (c16 == 3) {
                        iU010 = z2.u0(parcel, i34);
                    } else if (c16 != 4) {
                        z2.I0(parcel, i34);
                    } else {
                        strN27 = z2.N(parcel, i34);
                    }
                }
                z2.U(parcel, iN012);
                ButtonOptions buttonOptions = new ButtonOptions();
                buttonOptions.f33911f = iU08;
                buttonOptions.f33912g = iU09;
                buttonOptions.f33913h = iU010;
                w.h(strN27);
                buttonOptions.f33914i = strN27;
                return buttonOptions;
            case 21:
                int iN013 = z2.N0(parcel);
                String strN28 = null;
                String strN29 = null;
                String strN30 = null;
                String strN31 = null;
                String strN32 = null;
                String strN33 = null;
                int iU011 = 0;
                boolean zP05 = false;
                String strN34 = null;
                while (parcel.dataPosition() < iN013) {
                    int i35 = parcel.readInt();
                    switch ((char) i35) {
                        case 1:
                            strN28 = z2.N(parcel, i35);
                            break;
                        case 2:
                            iU011 = z2.u0(parcel, i35);
                            break;
                        case 3:
                            zP05 = z2.p0(parcel, i35);
                            break;
                        case 4:
                            strN34 = z2.N(parcel, i35);
                            break;
                        case 5:
                            strN29 = z2.N(parcel, i35);
                            break;
                        case 6:
                            strN30 = z2.N(parcel, i35);
                            break;
                        case 7:
                            strN31 = z2.N(parcel, i35);
                            break;
                        case '\b':
                            strN32 = z2.N(parcel, i35);
                            break;
                        case '\t':
                            strN33 = z2.N(parcel, i35);
                            break;
                        default:
                            z2.I0(parcel, i35);
                            break;
                    }
                }
                z2.U(parcel, iN013);
                zzc zzcVar = new zzc();
                zzcVar.f33918f = strN28;
                zzcVar.f33919g = iU011;
                zzcVar.f33920h = zP05;
                zzcVar.f33921i = strN34;
                zzcVar.f33922j = strN29;
                zzcVar.f33923k = strN30;
                zzcVar.f33924l = strN31;
                zzcVar.f33925m = strN32;
                zzcVar.n = strN33;
                return zzcVar;
            case 22:
                Intrinsics.g(parcel, "parcel");
                return new Bin(parcel.readString());
            case 23:
                Intrinsics.g(parcel, "parcel");
                return new Replace(parcel.readString(), parcel.readString());
            case 24:
                Intrinsics.g(parcel, "parcel");
                return new BridgeErrorParams(parcel.readString(), parcel.readString(), parcel.readString());
            case 25:
                Intrinsics.g(parcel, "parcel");
                return new BridgeSuccessParams(parcel.readString());
            case 26:
                Intrinsics.g(parcel, "parcel");
                return new IntentConfirmationChallengeArgs(parcel.readString(), parcel.createStringArrayList(), (StripeIntent) parcel.readParcelable(IntentConfirmationChallengeArgs.class.getClassLoader()));
            case 27:
                Intrinsics.g(parcel, "parcel");
                return new ActivityResult(parcel.readInt(), parcel.readInt() == 0 ? null : (Intent) Intent.CREATOR.createFromParcel(parcel));
            case 28:
                Intrinsics.g(parcel, "inParcel");
                Parcelable parcelable = parcel.readParcelable(IntentSender.class.getClassLoader());
                Intrinsics.d(parcelable);
                return new IntentSenderRequest((IntentSender) parcelable, (Intent) parcel.readParcelable(Intent.class.getClassLoader()), parcel.readInt(), parcel.readInt());
            default:
                return new DrmInitData(parcel);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f57687a) {
            case 0:
                return new CardRequirements[i5];
            case 1:
                return new CreditCardExpirationDate[i5];
            case 2:
                return new FullWallet[i5];
            case 3:
                return new InstrumentInfo[i5];
            case 4:
                return new IsReadyToPayRequest[i5];
            case 5:
                return new LoyaltyWalletObject[i5];
            case 6:
                return new MaskedWallet[i5];
            case 7:
                return new OfferWalletObject[i5];
            case 8:
                return new PaymentCardRecognitionResult[i5];
            case 9:
                return new PaymentCardRecognitionIntentRequest[i5];
            case 10:
                return new PaymentCardRecognitionIntentResponse[i5];
            case 11:
                return new ConcatenatedResolvableString[i5];
            case 12:
                return new IdentifierResolvableString[i5];
            case 13:
                return new StaticResolvableString[i5];
            case 14:
                return new CustomerState[i5];
            case 15:
                return new LinkDisabledState[i5];
            case 16:
                return new LinkState[i5];
            case 17:
                return new PaymentElementLoader$State[i5];
            case 18:
                return new PaymentSheetState$Full[i5];
            case 19:
                return new DefaultOAuthRequest[i5];
            case 20:
                return new ButtonOptions[i5];
            case 21:
                return new zzc[i5];
            case 22:
                return new Bin[i5];
            case 23:
                return new Replace[i5];
            case 24:
                return new BridgeErrorParams[i5];
            case 25:
                return new BridgeSuccessParams[i5];
            case 26:
                return new IntentConfirmationChallengeArgs[i5];
            case 27:
                return new ActivityResult[i5];
            case 28:
                return new IntentSenderRequest[i5];
            default:
                return new DrmInitData[i5];
        }
    }
}
