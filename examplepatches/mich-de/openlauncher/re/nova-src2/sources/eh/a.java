package eh;

import android.app.PendingIntent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.ResultReceiver;
import com.google.android.exoplayer2.metadata.vorbis.VorbisComment;
import com.google.android.gms.identitycredentials.CredentialOption;
import com.google.android.gms.identitycredentials.CredentialTransferCapabilities;
import com.google.android.gms.identitycredentials.ExportCredentialsToDeviceSetupResponse;
import com.google.android.gms.identitycredentials.GetCredentialRequest;
import com.google.android.gms.identitycredentials.ImportCredentialsForDeviceSetupResponse;
import com.google.android.gms.identitycredentials.PendingGetCredentialHandle;
import com.google.android.gms.identitycredentials.PendingImportCredentialsHandle;
import com.google.android.gms.identitycredentials.RegisterCreationOptionsResponse;
import com.google.android.gms.identitycredentials.RegisterExportResponse;
import com.google.android.gms.identitycredentials.RegistrationResponse;
import com.google.android.gms.identitycredentials.SignalCredentialStateResponse;
import com.stripe.android.attestation.AttestationArgs;
import com.stripe.android.cards.Bin;
import com.stripe.android.model.AccountRange;
import com.stripe.android.model.Address;
import com.stripe.android.model.AndroidVerificationObject;
import com.stripe.android.model.BinRange;
import com.stripe.android.model.Card;
import com.stripe.android.model.CardMetadata;
import com.stripe.android.model.CheckoutSessionResponse;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ConfirmSetupIntentParams;
import com.stripe.android.model.ConfirmationTokenClientContextParams;
import com.stripe.android.model.ConsentUi;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.model.ConsumerPaymentDetailsShare;
import com.stripe.android.model.ConsumerPaymentDetailsUpdateParams;
import com.stripe.android.model.ConsumerSession;
import com.stripe.android.model.ConsumerSessionLookup;
import com.stripe.android.model.ConsumerSessionRefresh;
import com.stripe.android.model.ConsumerSessionSignup;
import com.stripe.android.model.ConsumerShippingAddress;
import com.stripe.android.model.ConsumerShippingAddresses;
import com.stripe.android.model.Customer;
import com.stripe.android.model.DisplayablePaymentDetails;
import com.stripe.android.model.ElementsSession;
import com.stripe.android.model.LinkAuthIntent;
import com.stripe.android.model.MandateDataParams;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.model.RadarOptions;
import com.stripe.android.model.ShippingInformation;
import e10.z2;
import ft.b;
import ft.c;
import ft.d;
import ft.o0;
import ft.p0;
import ft.u0;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class a implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52773a;

    public /* synthetic */ a(int i5) {
        this.f52773a = i5;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        boolean z12;
        boolean z13;
        switch (this.f52773a) {
            case 0:
                int iN0 = z2.N0(parcel);
                Bundle bundleF = null;
                while (parcel.dataPosition() < iN0) {
                    int i5 = parcel.readInt();
                    if (((char) i5) != 1) {
                        z2.I0(parcel, i5);
                    } else {
                        bundleF = z2.F(parcel, i5);
                    }
                }
                z2.U(parcel, iN0);
                return new CredentialTransferCapabilities(bundleF);
            case 1:
                int iN02 = z2.N0(parcel);
                Bundle bundleF2 = null;
                while (parcel.dataPosition() < iN02) {
                    int i11 = parcel.readInt();
                    if (((char) i11) != 1) {
                        z2.I0(parcel, i11);
                    } else {
                        bundleF2 = z2.F(parcel, i11);
                    }
                }
                z2.U(parcel, iN02);
                return new ExportCredentialsToDeviceSetupResponse(bundleF2);
            case 2:
                int iN03 = z2.N0(parcel);
                ArrayList arrayListR = null;
                Bundle bundleF3 = null;
                String strN = null;
                ResultReceiver resultReceiver = null;
                while (parcel.dataPosition() < iN03) {
                    int i12 = parcel.readInt();
                    char c11 = (char) i12;
                    if (c11 == 1) {
                        arrayListR = z2.R(parcel, i12, CredentialOption.CREATOR);
                    } else if (c11 == 2) {
                        bundleF3 = z2.F(parcel, i12);
                    } else if (c11 == 3) {
                        strN = z2.N(parcel, i12);
                    } else if (c11 != 4) {
                        z2.I0(parcel, i12);
                    } else {
                        resultReceiver = (ResultReceiver) z2.L(parcel, i12, ResultReceiver.CREATOR);
                    }
                }
                z2.U(parcel, iN03);
                return new GetCredentialRequest(arrayListR, bundleF3, strN, resultReceiver);
            case 3:
                int iN04 = z2.N0(parcel);
                Bundle bundleF4 = null;
                while (parcel.dataPosition() < iN04) {
                    int i13 = parcel.readInt();
                    if (((char) i13) != 1) {
                        z2.I0(parcel, i13);
                    } else {
                        bundleF4 = z2.F(parcel, i13);
                    }
                }
                z2.U(parcel, iN04);
                return new ImportCredentialsForDeviceSetupResponse(bundleF4);
            case 4:
                int iN05 = z2.N0(parcel);
                PendingIntent pendingIntent = null;
                while (parcel.dataPosition() < iN05) {
                    int i14 = parcel.readInt();
                    if (((char) i14) != 1) {
                        z2.I0(parcel, i14);
                    } else {
                        pendingIntent = (PendingIntent) z2.L(parcel, i14, PendingIntent.CREATOR);
                    }
                }
                z2.U(parcel, iN05);
                return new PendingGetCredentialHandle(pendingIntent);
            case 5:
                int iN06 = z2.N0(parcel);
                PendingIntent pendingIntent2 = null;
                while (parcel.dataPosition() < iN06) {
                    int i15 = parcel.readInt();
                    if (((char) i15) != 1) {
                        z2.I0(parcel, i15);
                    } else {
                        pendingIntent2 = (PendingIntent) z2.L(parcel, i15, PendingIntent.CREATOR);
                    }
                }
                z2.U(parcel, iN06);
                return new PendingImportCredentialsHandle(pendingIntent2);
            case 6:
                int iN07 = z2.N0(parcel);
                while (parcel.dataPosition() < iN07) {
                    z2.I0(parcel, parcel.readInt());
                }
                z2.U(parcel, iN07);
                return new RegisterCreationOptionsResponse();
            case 7:
                int iN08 = z2.N0(parcel);
                while (parcel.dataPosition() < iN08) {
                    z2.I0(parcel, parcel.readInt());
                }
                z2.U(parcel, iN08);
                return new RegisterExportResponse();
            case 8:
                int iN09 = z2.N0(parcel);
                while (parcel.dataPosition() < iN09) {
                    z2.I0(parcel, parcel.readInt());
                }
                z2.U(parcel, iN09);
                return new RegistrationResponse();
            case 9:
                int iN010 = z2.N0(parcel);
                while (parcel.dataPosition() < iN010) {
                    z2.I0(parcel, parcel.readInt());
                }
                z2.U(parcel, iN010);
                return new SignalCredentialStateResponse();
            case 10:
                return new VorbisComment(parcel);
            case 11:
                Intrinsics.g(parcel, "parcel");
                return new AttestationArgs(parcel.readString(), parcel.createStringArrayList());
            case 12:
                Intrinsics.g(parcel, "parcel");
                return new AccountRange(BinRange.CREATOR.createFromParcel(parcel), parcel.readInt(), ft.a.valueOf(parcel.readString()), c.valueOf(parcel.readString()), parcel.readString());
            case 13:
                Intrinsics.g(parcel, "parcel");
                return new Address(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            case 14:
                Intrinsics.g(parcel, "parcel");
                return new AndroidVerificationObject(parcel.readString());
            case 15:
                Intrinsics.g(parcel, "parcel");
                return new BinRange(parcel.readString(), parcel.readString(), parcel.readInt() != 0);
            case 16:
                Intrinsics.g(parcel, "parcel");
                return new Card(parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), b.valueOf(parcel.readString()), parcel.readInt() == 0 ? null : c.valueOf(parcel.readString()), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() != 0 ? u0.valueOf(parcel.readString()) : null);
            case 17:
                Intrinsics.g(parcel, "parcel");
                Bin bin = (Bin) parcel.readParcelable(CardMetadata.class.getClassLoader());
                int i16 = parcel.readInt();
                ArrayList arrayList = new ArrayList(i16);
                int iB = 0;
                while (iB != i16) {
                    iB = fq.c.b(AccountRange.CREATOR, parcel, arrayList, iB, 1);
                }
                return new CardMetadata(bin, arrayList);
            case 18:
                Intrinsics.g(parcel, "parcel");
                return new CheckoutSessionResponse(parcel.readString(), parcel.readLong(), parcel.readString(), (ElementsSession) parcel.readParcelable(CheckoutSessionResponse.class.getClassLoader()), (PaymentIntent) parcel.readParcelable(CheckoutSessionResponse.class.getClassLoader()));
            case 19:
                Intrinsics.g(parcel, "parcel");
                return new ClientAttributionMetadata(parcel.readString(), parcel.readInt() == 0 ? null : o0.valueOf(parcel.readString()), parcel.readInt() != 0 ? p0.valueOf(parcel.readString()) : null, parcel.readString());
            case 20:
                Intrinsics.g(parcel, "parcel");
                String string = parcel.readString();
                String string2 = parcel.readString();
                PaymentMethodCreateParams paymentMethodCreateParamsCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.CREATOR.createFromParcel(parcel);
                String string3 = parcel.readString();
                if (parcel.readInt() != 0) {
                    z12 = false;
                    z11 = true;
                } else {
                    z11 = false;
                    z12 = false;
                }
                return new ConfirmSetupIntentParams(string, string2, paymentMethodCreateParamsCreateFromParcel, string3, z11, parcel.readString(), parcel.readInt() == 0 ? null : MandateDataParams.CREATOR.createFromParcel(parcel), parcel.readInt() == 0 ? null : Boolean.valueOf(parcel.readInt() == 0 ? z12 : true), parcel.readString(), (PaymentMethodOptionsParams) parcel.readParcelable(ConfirmSetupIntentParams.class.getClassLoader()), parcel.readInt() == 0 ? null : RadarOptions.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? ClientAttributionMetadata.CREATOR.createFromParcel(parcel) : null, parcel.readString());
            case 21:
                Intrinsics.g(parcel, "parcel");
                return new ConfirmationTokenClientContextParams(parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : d.valueOf(parcel.readString()), parcel.readString(), parcel.createStringArrayList(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            case 22:
                Intrinsics.g(parcel, "parcel");
                int i17 = parcel.readInt();
                ArrayList arrayList2 = new ArrayList(i17);
                for (int i18 = 0; i18 != i17; i18++) {
                    arrayList2.add(parcel.readParcelable(ConsumerPaymentDetails.class.getClassLoader()));
                }
                return new ConsumerPaymentDetails(arrayList2);
            case 23:
                Intrinsics.g(parcel, "parcel");
                return new ConsumerPaymentDetailsShare(PaymentMethod.CREATOR.createFromParcel(parcel));
            case 24:
                Intrinsics.g(parcel, "parcel");
                String string4 = parcel.readString();
                LinkedHashMap linkedHashMap = null;
                Boolean boolValueOf = parcel.readInt() == 0 ? null : Boolean.valueOf(parcel.readInt() != 0);
                if (parcel.readInt() != 0) {
                    int i19 = parcel.readInt();
                    LinkedHashMap linkedHashMap2 = new LinkedHashMap(i19);
                    for (int i21 = 0; i21 != i19; i21++) {
                        linkedHashMap2.put(parcel.readString(), parcel.readValue(ConsumerPaymentDetailsUpdateParams.class.getClassLoader()));
                    }
                    linkedHashMap = linkedHashMap2;
                }
                int i22 = parcel.readInt();
                LinkedHashMap linkedHashMap3 = new LinkedHashMap(i22);
                for (int i23 = 0; i23 != i22; i23++) {
                    linkedHashMap3.put(parcel.readString(), parcel.readString());
                }
                return new ConsumerPaymentDetailsUpdateParams(string4, boolValueOf, linkedHashMap, linkedHashMap3);
            case 25:
                Intrinsics.g(parcel, "parcel");
                return new ConsumerSessionLookup(parcel.readInt() != 0, parcel.readInt() == 0 ? null : ConsumerSession.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : DisplayablePaymentDetails.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? ConsentUi.CREATOR.createFromParcel(parcel) : null, parcel.readString());
            case 26:
                Intrinsics.g(parcel, "parcel");
                return new ConsumerSessionRefresh(ConsumerSession.CREATOR.createFromParcel(parcel), parcel.readInt() == 0 ? null : LinkAuthIntent.CREATOR.createFromParcel(parcel));
            case 27:
                Intrinsics.g(parcel, "parcel");
                return new ConsumerSessionSignup(ConsumerSession.CREATOR.createFromParcel(parcel), parcel.readString());
            case 28:
                Intrinsics.g(parcel, "parcel");
                int i24 = parcel.readInt();
                ArrayList arrayList3 = new ArrayList(i24);
                int iB2 = 0;
                while (iB2 != i24) {
                    iB2 = fq.c.b(ConsumerShippingAddress.CREATOR, parcel, arrayList3, iB2, 1);
                }
                return new ConsumerShippingAddresses(arrayList3);
            default:
                Intrinsics.g(parcel, "parcel");
                String string5 = parcel.readString();
                String string6 = parcel.readString();
                ShippingInformation shippingInformationCreateFromParcel = parcel.readInt() == 0 ? null : ShippingInformation.CREATOR.createFromParcel(parcel);
                int i25 = parcel.readInt();
                ArrayList arrayList4 = new ArrayList(i25);
                boolean z14 = false;
                for (int i26 = 0; i26 != i25; i26++) {
                    arrayList4.add(parcel.readParcelable(Customer.class.getClassLoader()));
                }
                if (parcel.readInt() != 0) {
                    z13 = false;
                    z14 = true;
                } else {
                    z13 = false;
                }
                return new Customer(string5, string6, shippingInformationCreateFromParcel, arrayList4, z14, parcel.readInt() != 0 ? Integer.valueOf(parcel.readInt()) : null, parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() != 0 ? true : z13);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f52773a) {
            case 0:
                return new CredentialTransferCapabilities[i5];
            case 1:
                return new ExportCredentialsToDeviceSetupResponse[i5];
            case 2:
                return new GetCredentialRequest[i5];
            case 3:
                return new ImportCredentialsForDeviceSetupResponse[i5];
            case 4:
                return new PendingGetCredentialHandle[i5];
            case 5:
                return new PendingImportCredentialsHandle[i5];
            case 6:
                return new RegisterCreationOptionsResponse[i5];
            case 7:
                return new RegisterExportResponse[i5];
            case 8:
                return new RegistrationResponse[i5];
            case 9:
                return new SignalCredentialStateResponse[i5];
            case 10:
                return new VorbisComment[i5];
            case 11:
                return new AttestationArgs[i5];
            case 12:
                return new AccountRange[i5];
            case 13:
                return new Address[i5];
            case 14:
                return new AndroidVerificationObject[i5];
            case 15:
                return new BinRange[i5];
            case 16:
                return new Card[i5];
            case 17:
                return new CardMetadata[i5];
            case 18:
                return new CheckoutSessionResponse[i5];
            case 19:
                return new ClientAttributionMetadata[i5];
            case 20:
                return new ConfirmSetupIntentParams[i5];
            case 21:
                return new ConfirmationTokenClientContextParams[i5];
            case 22:
                return new ConsumerPaymentDetails[i5];
            case 23:
                return new ConsumerPaymentDetailsShare[i5];
            case 24:
                return new ConsumerPaymentDetailsUpdateParams[i5];
            case 25:
                return new ConsumerSessionLookup[i5];
            case 26:
                return new ConsumerSessionRefresh[i5];
            case 27:
                return new ConsumerSessionSignup[i5];
            case 28:
                return new ConsumerShippingAddresses[i5];
            default:
                return new Customer[i5];
        }
    }
}
