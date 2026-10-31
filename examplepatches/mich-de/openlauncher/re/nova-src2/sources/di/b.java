package di;

import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.os.ResultReceiver;
import com.android.launcher3.logging.InstanceId;
import com.google.android.exoplayer2.metadata.scte35.PrivateCommand;
import com.google.android.exoplayer2.metadata.scte35.SpliceInsertCommand;
import com.google.android.exoplayer2.metadata.scte35.SpliceNullCommand;
import com.google.android.exoplayer2.metadata.scte35.SpliceScheduleCommand;
import com.google.android.exoplayer2.metadata.scte35.TimeSignalCommand;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zaw;
import com.google.android.gms.common.internal.zay;
import com.google.android.gms.identitycredentials.ClearCreationOptionsResponse;
import com.google.android.gms.identitycredentials.ClearCredentialStateResponse;
import com.google.android.gms.identitycredentials.ClearExportResponse;
import com.google.android.gms.identitycredentials.ClearRegistryResponse;
import com.google.android.gms.identitycredentials.CreateCredentialHandle;
import com.google.android.gms.identitycredentials.CreateCredentialResponse;
import com.google.android.gms.identitycredentials.CredentialOption;
import com.google.android.gms.signin.internal.zaa;
import com.google.android.gms.signin.internal.zag;
import com.google.android.gms.signin.internal.zai;
import com.google.android.gms.signin.internal.zak;
import com.stripe.android.DefaultCardBrandFilter;
import com.stripe.android.DefaultCardFundingFilter;
import com.stripe.android.GooglePayJsonFactory$BillingAddressParameters;
import com.stripe.android.GooglePayJsonFactory$MerchantInfo;
import com.stripe.android.GooglePayJsonFactory$SoftwareInfo;
import com.stripe.android.GooglePayJsonFactory$TransactionInfo;
import com.stripe.android.PaymentAuthConfig$Stripe3ds2Config;
import com.stripe.android.PaymentAuthConfig$Stripe3ds2UiCustomization;
import com.stripe.android.PaymentConfiguration;
import com.stripe.android.PaymentIntentResult;
import com.stripe.android.SetupIntentResult;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.Source;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import com.stripe.android.stripe3ds2.init.ui.StripeUiCustomization;
import dq.e;
import dq.f;
import dq.g;
import dq.h;
import e10.z2;
import java.io.Serializable;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class b implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49236a;

    public /* synthetic */ b(int i5) {
        this.f49236a = i5;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        int iU0 = 0;
        boolean zP0 = false;
        boolean zP02 = false;
        boolean zP03 = false;
        int iU02 = 0;
        int iU03 = 0;
        ArrayList arrayListP = null;
        String strN = null;
        PendingIntent pendingIntent = null;
        e.b bVar = null;
        ConnectionResult connectionResult = null;
        zaw zawVar = null;
        switch (this.f49236a) {
            case 0:
                int iN0 = z2.N0(parcel);
                Intent intent = null;
                int iU04 = 0;
                while (parcel.dataPosition() < iN0) {
                    int i5 = parcel.readInt();
                    char c11 = (char) i5;
                    if (c11 == 1) {
                        iU0 = z2.u0(parcel, i5);
                    } else if (c11 == 2) {
                        iU04 = z2.u0(parcel, i5);
                    } else if (c11 != 3) {
                        z2.I0(parcel, i5);
                    } else {
                        intent = (Intent) z2.L(parcel, i5, Intent.CREATOR);
                    }
                }
                z2.U(parcel, iN0);
                return new zaa(iU0, iU04, intent);
            case 1:
                int iN02 = z2.N0(parcel);
                String strN2 = null;
                while (parcel.dataPosition() < iN02) {
                    int i11 = parcel.readInt();
                    char c12 = (char) i11;
                    if (c12 == 1) {
                        arrayListP = z2.P(parcel, i11);
                    } else if (c12 != 2) {
                        z2.I0(parcel, i11);
                    } else {
                        strN2 = z2.N(parcel, i11);
                    }
                }
                z2.U(parcel, iN02);
                return new zag(arrayListP, strN2);
            case 2:
                int iN03 = z2.N0(parcel);
                while (parcel.dataPosition() < iN03) {
                    int i12 = parcel.readInt();
                    char c13 = (char) i12;
                    if (c13 == 1) {
                        iU03 = z2.u0(parcel, i12);
                    } else if (c13 != 2) {
                        z2.I0(parcel, i12);
                    } else {
                        zawVar = (zaw) z2.L(parcel, i12, zaw.CREATOR);
                    }
                }
                z2.U(parcel, iN03);
                return new zai(iU03, zawVar);
            case 3:
                int iN04 = z2.N0(parcel);
                zay zayVar = null;
                while (parcel.dataPosition() < iN04) {
                    int i13 = parcel.readInt();
                    char c14 = (char) i13;
                    if (c14 == 1) {
                        iU02 = z2.u0(parcel, i13);
                    } else if (c14 == 2) {
                        connectionResult = (ConnectionResult) z2.L(parcel, i13, ConnectionResult.CREATOR);
                    } else if (c14 != 3) {
                        z2.I0(parcel, i13);
                    } else {
                        zayVar = (zay) z2.L(parcel, i13, zay.CREATOR);
                    }
                }
                z2.U(parcel, iN04);
                return new zak(iU02, connectionResult, zayVar);
            case 4:
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return DefaultCardBrandFilter.f42421a;
            case 5:
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return DefaultCardFundingFilter.f42422a;
            case 6:
                Intrinsics.g(parcel, "parcel");
                return new GooglePayJsonFactory$BillingAddressParameters(parcel.readInt() != 0, e.valueOf(parcel.readString()), parcel.readInt() != 0);
            case 7:
                Intrinsics.g(parcel, "parcel");
                return new GooglePayJsonFactory$MerchantInfo(parcel.readString(), GooglePayJsonFactory$SoftwareInfo.CREATOR.createFromParcel(parcel));
            case 8:
                Intrinsics.g(parcel, "parcel");
                return new GooglePayJsonFactory$SoftwareInfo(f.valueOf(parcel.readString()));
            case 9:
                Intrinsics.g(parcel, "parcel");
                return new GooglePayJsonFactory$TransactionInfo(parcel.readString(), h.valueOf(parcel.readString()), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : Long.valueOf(parcel.readLong()), parcel.readString(), parcel.readInt() != 0 ? g.valueOf(parcel.readString()) : null);
            case 10:
                Intrinsics.g(parcel, "parcel");
                return new PaymentAuthConfig$Stripe3ds2Config(parcel.readInt(), PaymentAuthConfig$Stripe3ds2UiCustomization.CREATOR.createFromParcel(parcel));
            case 11:
                Intrinsics.g(parcel, "parcel");
                return new PaymentAuthConfig$Stripe3ds2UiCustomization((StripeUiCustomization) parcel.readParcelable(PaymentAuthConfig$Stripe3ds2UiCustomization.class.getClassLoader()));
            case 12:
                Intrinsics.g(parcel, "parcel");
                return new PaymentConfiguration(parcel.readString(), parcel.readString());
            case 13:
                Intrinsics.g(parcel, "parcel");
                return new PaymentIntentResult(PaymentIntent.CREATOR.createFromParcel(parcel), parcel.readInt(), parcel.readString());
            case 14:
                Intrinsics.g(parcel, "parcel");
                return new SetupIntentResult(SetupIntent.CREATOR.createFromParcel(parcel), parcel.readInt(), parcel.readString());
            case 15:
                Intrinsics.g(parcel, "parcel");
                String string = parcel.readString();
                int i14 = parcel.readInt();
                Serializable serializable = parcel.readSerializable();
                return new PaymentFlowResult$Unvalidated(string, i14, serializable instanceof StripeException ? (StripeException) serializable : null, parcel.readInt() == 1, parcel.readString(), (Source) parcel.readParcelable(Source.class.getClassLoader()), parcel.readString());
            case 16:
                ResultReceiver resultReceiver = new ResultReceiver();
                IBinder strongBinder = parcel.readStrongBinder();
                int i15 = e.c.f49892b;
                if (strongBinder != null) {
                    IInterface iInterfaceQueryLocalInterface = strongBinder.queryLocalInterface(e.b.Zo);
                    if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof e.b)) {
                        e.a aVar = new e.a();
                        aVar.f49891a = strongBinder;
                        bVar = aVar;
                    } else {
                        bVar = (e.b) iInterfaceQueryLocalInterface;
                    }
                }
                resultReceiver.f13596a = bVar;
                return resultReceiver;
            case 17:
                return new InstanceId(parcel.readInt());
            case 18:
                return new PrivateCommand(parcel);
            case 19:
                return new SpliceInsertCommand(parcel);
            case 20:
                return new SpliceNullCommand();
            case 21:
                return new SpliceScheduleCommand(parcel);
            case 22:
                return new TimeSignalCommand(parcel.readLong(), parcel.readLong());
            case 23:
                int iN05 = z2.N0(parcel);
                while (parcel.dataPosition() < iN05) {
                    int i16 = parcel.readInt();
                    if (((char) i16) != 1) {
                        z2.I0(parcel, i16);
                    } else {
                        zP03 = z2.p0(parcel, i16);
                    }
                }
                z2.U(parcel, iN05);
                return new ClearCreationOptionsResponse(zP03);
            case 24:
                int iN06 = z2.N0(parcel);
                while (parcel.dataPosition() < iN06) {
                    z2.I0(parcel, parcel.readInt());
                }
                z2.U(parcel, iN06);
                return new ClearCredentialStateResponse();
            case 25:
                int iN07 = z2.N0(parcel);
                while (parcel.dataPosition() < iN07) {
                    int i17 = parcel.readInt();
                    if (((char) i17) != 1) {
                        z2.I0(parcel, i17);
                    } else {
                        zP02 = z2.p0(parcel, i17);
                    }
                }
                z2.U(parcel, iN07);
                return new ClearExportResponse(zP02);
            case 26:
                int iN08 = z2.N0(parcel);
                while (parcel.dataPosition() < iN08) {
                    int i18 = parcel.readInt();
                    if (((char) i18) != 1) {
                        z2.I0(parcel, i18);
                    } else {
                        zP0 = z2.p0(parcel, i18);
                    }
                }
                z2.U(parcel, iN08);
                return new ClearRegistryResponse(zP0);
            case 27:
                int iN09 = z2.N0(parcel);
                CreateCredentialResponse createCredentialResponse = null;
                while (parcel.dataPosition() < iN09) {
                    int i19 = parcel.readInt();
                    char c15 = (char) i19;
                    if (c15 == 1) {
                        pendingIntent = (PendingIntent) z2.L(parcel, i19, PendingIntent.CREATOR);
                    } else if (c15 != 2) {
                        z2.I0(parcel, i19);
                    } else {
                        createCredentialResponse = (CreateCredentialResponse) z2.L(parcel, i19, CreateCredentialResponse.CREATOR);
                    }
                }
                z2.U(parcel, iN09);
                return new CreateCredentialHandle(pendingIntent, createCredentialResponse);
            case 28:
                int iN010 = z2.N0(parcel);
                Bundle bundleF = null;
                while (parcel.dataPosition() < iN010) {
                    int i21 = parcel.readInt();
                    char c16 = (char) i21;
                    if (c16 == 1) {
                        strN = z2.N(parcel, i21);
                    } else if (c16 != 2) {
                        z2.I0(parcel, i21);
                    } else {
                        bundleF = z2.F(parcel, i21);
                    }
                }
                z2.U(parcel, iN010);
                return new CreateCredentialResponse(strN, bundleF);
            default:
                int iN011 = z2.N0(parcel);
                String strN3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                String strN4 = strN3;
                String strN5 = strN4;
                Bundle bundleF2 = null;
                Bundle bundleF3 = null;
                String strN6 = null;
                while (parcel.dataPosition() < iN011) {
                    int i22 = parcel.readInt();
                    switch ((char) i22) {
                        case 1:
                            strN3 = z2.N(parcel, i22);
                            break;
                        case 2:
                            bundleF2 = z2.F(parcel, i22);
                            break;
                        case 3:
                            bundleF3 = z2.F(parcel, i22);
                            break;
                        case 4:
                            strN6 = z2.N(parcel, i22);
                            break;
                        case 5:
                            strN4 = z2.N(parcel, i22);
                            break;
                        case 6:
                            strN5 = z2.N(parcel, i22);
                            break;
                        default:
                            z2.I0(parcel, i22);
                            break;
                    }
                }
                z2.U(parcel, iN011);
                return new CredentialOption(strN3, bundleF2, bundleF3, strN6, strN4, strN5);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f49236a) {
            case 0:
                return new zaa[i5];
            case 1:
                return new zag[i5];
            case 2:
                return new zai[i5];
            case 3:
                return new zak[i5];
            case 4:
                return new DefaultCardBrandFilter[i5];
            case 5:
                return new DefaultCardFundingFilter[i5];
            case 6:
                return new GooglePayJsonFactory$BillingAddressParameters[i5];
            case 7:
                return new GooglePayJsonFactory$MerchantInfo[i5];
            case 8:
                return new GooglePayJsonFactory$SoftwareInfo[i5];
            case 9:
                return new GooglePayJsonFactory$TransactionInfo[i5];
            case 10:
                return new PaymentAuthConfig$Stripe3ds2Config[i5];
            case 11:
                return new PaymentAuthConfig$Stripe3ds2UiCustomization[i5];
            case 12:
                return new PaymentConfiguration[i5];
            case 13:
                return new PaymentIntentResult[i5];
            case 14:
                return new SetupIntentResult[i5];
            case 15:
                return new PaymentFlowResult$Unvalidated[i5];
            case 16:
                return new ResultReceiver[i5];
            case 17:
                return new InstanceId[i5];
            case 18:
                return new PrivateCommand[i5];
            case 19:
                return new SpliceInsertCommand[i5];
            case 20:
                return new SpliceNullCommand[i5];
            case 21:
                return new SpliceScheduleCommand[i5];
            case 22:
                return new TimeSignalCommand[i5];
            case 23:
                return new ClearCreationOptionsResponse[i5];
            case 24:
                return new ClearCredentialStateResponse[i5];
            case 25:
                return new ClearExportResponse[i5];
            case 26:
                return new ClearRegistryResponse[i5];
            case 27:
                return new CreateCredentialHandle[i5];
            case 28:
                return new CreateCredentialResponse[i5];
            default:
                return new CredentialOption[i5];
        }
    }
}
