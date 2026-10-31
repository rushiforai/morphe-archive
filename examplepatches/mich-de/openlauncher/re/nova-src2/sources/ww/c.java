package ww;

import android.os.Parcel;
import android.os.Parcelable;
import com.android.launcher3.dragndrop.PinWidgetFlowHandler;
import com.android.launcher3.util.ActivityResultInfo;
import com.android.launcher3.util.ParcelableSparseArray;
import com.android.launcher3.util.PendingRequestArgs;
import com.facebook.ads.internal.util.parcelable.WrappedParcelable;
import com.google.android.exoplayer2.metadata.dvbsi.AppInfoTable;
import com.google.android.exoplayer2.metadata.emsg.EventMessage;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.spotify.sdk.android.auth.AuthorizationRequest;
import com.spotify.sdk.android.auth.AuthorizationResponse;
import com.stripe.android.financialconnections.model.BankAccount;
import com.stripe.android.financialconnections.model.CashBalance;
import com.stripe.android.financialconnections.model.CreditBalance;
import com.stripe.android.financialconnections.model.FinancialConnectionsAccount;
import com.stripe.android.financialconnections.model.FinancialConnectionsAccountList;
import com.stripe.android.financialconnections.model.ManualEntry;
import com.stripe.android.financialconnections.model.ManualEntryMode;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentelement.confirmation.linkinline.LinkInlineSignupConfirmationDefinition$Result;
import com.stripe.android.paymentelement.confirmation.linkinline.LinkInlineSignupConfirmationOption;
import com.stripe.android.paymentelement.confirmation.shoppay.ShopPayConfirmationOption;
import com.stripe.android.paymentsheet.PaymentSheet$ShopPayConfiguration;
import com.stripe.android.stripe3ds2.init.ui.StripeUiCustomization;
import com.stripe.android.stripe3ds2.transaction.ChallengeRequestExecutor$Config;
import com.stripe.android.stripe3ds2.transaction.IntentData;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import com.stripe.android.stripe3ds2.transactions.ChallengeResponseData;
import com.stripe.android.stripe3ds2.transactions.ErrorData;
import com.stripe.android.stripe3ds2.transactions.MessageExtension;
import com.stripe.android.stripe3ds2.views.ChallengeViewArgs;
import com.stripe.android.view.BecsDebitBanks$Bank;
import com.stripe.hcaptcha.HCaptchaStateListener;
import e10.z2;
import io.branch.search.AnalyticsEvent;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94756a;

    public /* synthetic */ c(int i5) {
        this.f94756a = i5;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        LinkedHashMap linkedHashMap;
        LinkedHashMap linkedHashMap2;
        ArrayList arrayList;
        switch (this.f94756a) {
            case 0:
                Intrinsics.g(parcel, "parcel");
                return new BecsDebitBanks$Bank(parcel.readString(), parcel.readString());
            case 1:
                return new PinWidgetFlowHandler(parcel);
            case 2:
                int iN0 = z2.N0(parcel);
                LatLng latLng = null;
                float fR0 = 0.0f;
                float fR02 = 0.0f;
                float fR03 = 0.0f;
                while (parcel.dataPosition() < iN0) {
                    int i5 = parcel.readInt();
                    char c11 = (char) i5;
                    if (c11 == 2) {
                        latLng = (LatLng) z2.L(parcel, i5, LatLng.CREATOR);
                    } else if (c11 == 3) {
                        fR0 = z2.r0(parcel, i5);
                    } else if (c11 == 4) {
                        fR02 = z2.r0(parcel, i5);
                    } else if (c11 != 5) {
                        z2.I0(parcel, i5);
                    } else {
                        fR03 = z2.r0(parcel, i5);
                    }
                }
                z2.U(parcel, iN0);
                return new CameraPosition(latLng, fR0, fR02, fR03);
            case 3:
                int iN02 = z2.N0(parcel);
                LatLng latLng2 = null;
                LatLng latLng3 = null;
                while (parcel.dataPosition() < iN02) {
                    int i11 = parcel.readInt();
                    char c12 = (char) i11;
                    if (c12 == 2) {
                        latLng2 = (LatLng) z2.L(parcel, i11, LatLng.CREATOR);
                    } else if (c12 != 3) {
                        z2.I0(parcel, i11);
                    } else {
                        latLng3 = (LatLng) z2.L(parcel, i11, LatLng.CREATOR);
                    }
                }
                z2.U(parcel, iN02);
                return new LatLngBounds(latLng2, latLng3);
            case 4:
                int iN03 = z2.N0(parcel);
                double d5 = 0.0d;
                double d11 = 0.0d;
                while (parcel.dataPosition() < iN03) {
                    int i12 = parcel.readInt();
                    char c13 = (char) i12;
                    if (c13 == 2) {
                        z2.P0(parcel, i12, 8);
                        d5 = parcel.readDouble();
                    } else if (c13 != 3) {
                        z2.I0(parcel, i12);
                    } else {
                        z2.P0(parcel, i12, 8);
                        d11 = parcel.readDouble();
                    }
                }
                z2.U(parcel, iN03);
                return new LatLng(d5, d11);
            case 5:
                return new AuthorizationRequest(parcel);
            case 6:
                return new AuthorizationResponse(parcel);
            case 7:
                Intrinsics.g(parcel, "parcel");
                return new BankAccount(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() != 0);
            case 8:
                Intrinsics.g(parcel, "parcel");
                if (parcel.readInt() == 0) {
                    linkedHashMap = null;
                } else {
                    int i13 = parcel.readInt();
                    LinkedHashMap linkedHashMap3 = new LinkedHashMap(i13);
                    for (int i14 = 0; i14 != i13; i14++) {
                        linkedHashMap3.put(parcel.readString(), Integer.valueOf(parcel.readInt()));
                    }
                    linkedHashMap = linkedHashMap3;
                }
                return new CashBalance(linkedHashMap);
            case 9:
                Intrinsics.g(parcel, "parcel");
                if (parcel.readInt() == 0) {
                    linkedHashMap2 = null;
                } else {
                    int i15 = parcel.readInt();
                    LinkedHashMap linkedHashMap4 = new LinkedHashMap(i15);
                    for (int i16 = 0; i16 != i15; i16++) {
                        linkedHashMap4.put(parcel.readString(), Integer.valueOf(parcel.readInt()));
                    }
                    linkedHashMap2 = linkedHashMap4;
                }
                return new CreditBalance(linkedHashMap2);
            case 10:
                Intrinsics.g(parcel, "parcel");
                int i17 = parcel.readInt();
                ArrayList arrayList2 = new ArrayList(i17);
                int iB = 0;
                while (iB != i17) {
                    iB = fq.c.b(FinancialConnectionsAccount.CREATOR, parcel, arrayList2, iB, 1);
                }
                return new FinancialConnectionsAccountList(arrayList2, parcel.readInt() != 0, parcel.readString(), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() != 0 ? Integer.valueOf(parcel.readInt()) : null);
            case 11:
                Intrinsics.g(parcel, "parcel");
                return new ManualEntry(ManualEntryMode.valueOf(parcel.readString()));
            case 12:
                Intrinsics.g(parcel, "parcel");
                return new LinkInlineSignupConfirmationDefinition$Result((PaymentMethodConfirmationOption) parcel.readParcelable(LinkInlineSignupConfirmationDefinition$Result.class.getClassLoader()));
            case 13:
                Intrinsics.g(parcel, "parcel");
                return new LinkInlineSignupConfirmationOption((PaymentMethodCreateParams) parcel.readParcelable(LinkInlineSignupConfirmationOption.class.getClassLoader()), (PaymentMethodOptionsParams) parcel.readParcelable(LinkInlineSignupConfirmationOption.class.getClassLoader()), (PaymentMethodExtraParams) parcel.readParcelable(LinkInlineSignupConfirmationOption.class.getClassLoader()), xt.g.valueOf(parcel.readString()), (LinkConfiguration) parcel.readParcelable(LinkInlineSignupConfirmationOption.class.getClassLoader()), (UserInput) parcel.readParcelable(LinkInlineSignupConfirmationOption.class.getClassLoader()));
            case 14:
                Intrinsics.g(parcel, "parcel");
                String string = parcel.readString();
                String string2 = parcel.readString();
                String string3 = parcel.readString();
                SdkTransactionId sdkTransactionIdCreateFromParcel = SdkTransactionId.CREATOR.createFromParcel(parcel);
                String string4 = parcel.readString();
                String string5 = parcel.readString();
                xv.a aVarValueOf = parcel.readInt() == 0 ? null : xv.a.valueOf(parcel.readString());
                String string6 = parcel.readString();
                if (parcel.readInt() == 0) {
                    arrayList = null;
                } else {
                    int i18 = parcel.readInt();
                    arrayList = new ArrayList(i18);
                    int iB2 = 0;
                    while (iB2 != i18) {
                        iB2 = fq.c.b(MessageExtension.CREATOR, parcel, arrayList, iB2, 1);
                    }
                }
                return new ChallengeRequestData(string, string2, string3, sdkTransactionIdCreateFromParcel, string4, string5, aVarValueOf, string6, arrayList, parcel.readInt() == 0 ? null : Boolean.valueOf(parcel.readInt() != 0), parcel.readInt() == 0 ? null : Boolean.valueOf(parcel.readInt() != 0), parcel.readInt() == 0 ? null : Boolean.valueOf(parcel.readInt() != 0));
            case 15:
                Intrinsics.g(parcel, "parcel");
                return new ErrorData(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : xv.b.valueOf(parcel.readString()), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() != 0 ? SdkTransactionId.CREATOR.createFromParcel(parcel) : null);
            case 16:
                Intrinsics.g(parcel, "parcel");
                String string7 = parcel.readString();
                String string8 = parcel.readString();
                boolean z11 = parcel.readInt() != 0;
                int i19 = parcel.readInt();
                LinkedHashMap linkedHashMap5 = new LinkedHashMap(i19);
                for (int i21 = 0; i21 != i19; i21++) {
                    linkedHashMap5.put(parcel.readString(), parcel.readString());
                }
                return new MessageExtension(string7, string8, z11, linkedHashMap5);
            case 17:
                Intrinsics.g(parcel, "parcel");
                return new AnalyticsEvent(parcel.readString(), parcel.readString());
            case 18:
                return new ActivityResultInfo(parcel);
            case 19:
                ParcelableSparseArray parcelableSparseArray = new ParcelableSparseArray();
                ClassLoader classLoader = ParcelableSparseArray.class.getClassLoader();
                int i22 = parcel.readInt();
                for (int i23 = 0; i23 < i22; i23++) {
                    parcelableSparseArray.put(parcel.readInt(), parcel.readParcelable(classLoader));
                }
                return parcelableSparseArray;
            case 20:
                return new PendingRequestArgs(parcel);
            case 21:
                return new WrappedParcelable(parcel);
            case 22:
                String string9 = parcel.readString();
                string9.getClass();
                return new AppInfoTable(parcel.readInt(), string9);
            case 23:
                Intrinsics.g(parcel, "parcel");
                return new ShopPayConfirmationOption(PaymentSheet$ShopPayConfiguration.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readString());
            case 24:
                Intrinsics.g(parcel, "parcel");
                return new HCaptchaStateListener((Function0) parcel.readSerializable(), (Function1) parcel.readSerializable(), (Function1) parcel.readSerializable());
            case 25:
                return new EventMessage(parcel);
            default:
                Intrinsics.g(parcel, "parcel");
                return new ChallengeViewArgs(ChallengeResponseData.CREATOR.createFromParcel(parcel), ChallengeRequestData.CREATOR.createFromParcel(parcel), (StripeUiCustomization) parcel.readParcelable(ChallengeViewArgs.class.getClassLoader()), ChallengeRequestExecutor$Config.CREATOR.createFromParcel(parcel), (wv.c) parcel.readSerializable(), parcel.readInt(), IntentData.CREATOR.createFromParcel(parcel));
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f94756a) {
            case 0:
                return new BecsDebitBanks$Bank[i5];
            case 1:
                return new PinWidgetFlowHandler[i5];
            case 2:
                return new CameraPosition[i5];
            case 3:
                return new LatLngBounds[i5];
            case 4:
                return new LatLng[i5];
            case 5:
                return new AuthorizationRequest[i5];
            case 6:
                return new AuthorizationResponse[i5];
            case 7:
                return new BankAccount[i5];
            case 8:
                return new CashBalance[i5];
            case 9:
                return new CreditBalance[i5];
            case 10:
                return new FinancialConnectionsAccountList[i5];
            case 11:
                return new ManualEntry[i5];
            case 12:
                return new LinkInlineSignupConfirmationDefinition$Result[i5];
            case 13:
                return new LinkInlineSignupConfirmationOption[i5];
            case 14:
                return new ChallengeRequestData[i5];
            case 15:
                return new ErrorData[i5];
            case 16:
                return new MessageExtension[i5];
            case 17:
                return new AnalyticsEvent[i5];
            case 18:
                return new ActivityResultInfo[i5];
            case 19:
                return new ParcelableSparseArray[i5];
            case 20:
                return new PendingRequestArgs[i5];
            case 21:
                return new WrappedParcelable[i5];
            case 22:
                return new AppInfoTable[i5];
            case 23:
                return new ShopPayConfirmationOption[i5];
            case 24:
                return new HCaptchaStateListener[i5];
            case 25:
                return new EventMessage[i5];
            default:
                return new ChallengeViewArgs[i5];
        }
    }
}
