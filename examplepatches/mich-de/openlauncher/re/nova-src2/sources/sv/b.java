package sv;

import android.app.PendingIntent;
import android.content.Intent;
import android.location.Location;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import android.os.WorkSource;
import android.widget.RemoteViews;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.google.android.gms.internal.location.zzd;
import com.google.android.gms.internal.wallet.zze;
import com.google.android.gms.internal.wallet.zzg;
import com.google.android.gms.internal.wallet.zzi;
import com.google.android.gms.internal.wallet.zzk;
import com.google.android.gms.internal.wallet.zzm;
import com.google.android.gms.location.CurrentLocationRequest;
import com.google.android.gms.location.LocationAvailability;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.zzac;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLngBounds;
import com.stripe.android.common.model.CommonConfiguration;
import com.stripe.android.link.LinkAppearance;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentelement.confirmation.link.LinkConfirmationOption;
import com.stripe.android.paymentelement.confirmation.link.LinkPassthroughConfirmationDefinition$Result;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$CardBrandAcceptance;
import com.stripe.android.paymentsheet.PaymentSheet$CardFundingType;
import com.stripe.android.paymentsheet.PaymentSheet$CustomPaymentMethod;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$GooglePayConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$LinkConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$ShopPayConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$WalletButtonsConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import com.stripe.android.paymentsheet.model.PaymentIntentClientSecret;
import com.stripe.android.paymentsheet.model.PaymentMethodIncentive;
import com.stripe.android.paymentsheet.model.SetupIntentClientSecret;
import com.stripe.android.stripe3ds2.init.ui.StripeUiCustomization;
import com.stripe.android.stripe3ds2.transaction.AcsData;
import com.stripe.android.stripe3ds2.transaction.AuthenticationRequestParameters;
import com.stripe.android.stripe3ds2.transaction.ChallengeParameters;
import com.stripe.android.stripe3ds2.transaction.InitChallengeArgs;
import com.stripe.android.stripe3ds2.transaction.IntentData;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import com.teslacoilsw.launcher.search.hero.AppWidgetContent;
import com.teslacoilsw.launcher.theme.FolderIconReference;
import com.teslacoilsw.launcher.theme.IntentIconReference;
import com.teslacoilsw.launcher.theme.NovaActionIconReference;
import com.teslacoilsw.launcher.theme.ShortcutIconReference;
import com.teslacoilsw.launcher.theme.ShortcutKeyIconReference;
import e10.z2;
import es.o;
import java.security.KeyPair;
import java.security.interfaces.ECPublicKey;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import mx.c0;
import ou.w0;
import ps.j;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f87737a;

    public /* synthetic */ b(int i5) {
        this.f87737a = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        int i5;
        switch (this.f87737a) {
            case 0:
                return new StripeUiCustomization(parcel);
            case 1:
                int iN0 = z2.N0(parcel);
                byte[] bArrG = null;
                while (parcel.dataPosition() < iN0) {
                    int i11 = parcel.readInt();
                    if (((char) i11) != 2) {
                        z2.I0(parcel, i11);
                    } else {
                        bArrG = z2.G(parcel, i11);
                    }
                }
                z2.U(parcel, iN0);
                return new zze(bArrG);
            case 2:
                int iN02 = z2.N0(parcel);
                byte[] bArrG2 = null;
                while (parcel.dataPosition() < iN02) {
                    int i12 = parcel.readInt();
                    if (((char) i12) != 2) {
                        z2.I0(parcel, i12);
                    } else {
                        bArrG2 = z2.G(parcel, i12);
                    }
                }
                z2.U(parcel, iN02);
                return new zzg(bArrG2);
            case 3:
                int iN03 = z2.N0(parcel);
                byte[] bArrG3 = null;
                while (parcel.dataPosition() < iN03) {
                    int i13 = parcel.readInt();
                    if (((char) i13) != 1) {
                        z2.I0(parcel, i13);
                    } else {
                        bArrG3 = z2.G(parcel, i13);
                    }
                }
                z2.U(parcel, iN03);
                return new zzi(bArrG3);
            case 4:
                int iN04 = z2.N0(parcel);
                PendingIntent pendingIntent = null;
                while (parcel.dataPosition() < iN04) {
                    int i14 = parcel.readInt();
                    if (((char) i14) != 1) {
                        z2.I0(parcel, i14);
                    } else {
                        pendingIntent = (PendingIntent) z2.L(parcel, i14, PendingIntent.CREATOR);
                    }
                }
                z2.U(parcel, iN04);
                return new zzk(pendingIntent);
            case 5:
                int iN05 = z2.N0(parcel);
                String[] strArrO = null;
                int[] iArrJ = null;
                RemoteViews remoteViews = null;
                byte[] bArrG4 = null;
                while (parcel.dataPosition() < iN05) {
                    int i15 = parcel.readInt();
                    char c11 = (char) i15;
                    if (c11 == 1) {
                        strArrO = z2.O(parcel, i15);
                    } else if (c11 == 2) {
                        iArrJ = z2.J(parcel, i15);
                    } else if (c11 == 3) {
                        remoteViews = (RemoteViews) z2.L(parcel, i15, RemoteViews.CREATOR);
                    } else if (c11 != 4) {
                        z2.I0(parcel, i15);
                    } else {
                        bArrG4 = z2.G(parcel, i15);
                    }
                }
                z2.U(parcel, iN05);
                zzm zzmVar = new zzm();
                zzmVar.f33681f = strArrO;
                zzmVar.f33682g = iArrJ;
                zzmVar.f33683h = remoteViews;
                zzmVar.f33684i = bArrG4;
                return zzmVar;
            case 6:
                Intrinsics.g(parcel, "parcel");
                String string = parcel.readString();
                PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfigurationCreateFromParcel = parcel.readInt() == 0 ? null : PaymentSheet$CustomerConfiguration.CREATOR.createFromParcel(parcel);
                PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfigurationCreateFromParcel = parcel.readInt() == 0 ? null : PaymentSheet$GooglePayConfiguration.CREATOR.createFromParcel(parcel);
                PaymentSheet$LinkConfiguration paymentSheet$LinkConfigurationCreateFromParcel = PaymentSheet$LinkConfiguration.CREATOR.createFromParcel(parcel);
                PaymentSheet$BillingDetails paymentSheet$BillingDetailsCreateFromParcel = parcel.readInt() == 0 ? null : PaymentSheet$BillingDetails.CREATOR.createFromParcel(parcel);
                AddressDetails addressDetailsCreateFromParcel = parcel.readInt() == 0 ? null : AddressDetails.CREATOR.createFromParcel(parcel);
                boolean z11 = false;
                if (parcel.readInt() != 0) {
                    i5 = 0;
                    z11 = true;
                } else {
                    i5 = 0;
                }
                int i16 = parcel.readInt() != 0 ? 1 : i5;
                PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfigurationCreateFromParcel = PaymentSheet$BillingDetailsCollectionConfiguration.CREATOR.createFromParcel(parcel);
                int i17 = parcel.readInt();
                boolean z12 = i16;
                ArrayList arrayList = new ArrayList(i17);
                while (i5 != i17) {
                    arrayList.add(ft.b.valueOf(parcel.readString()));
                    i5++;
                }
                boolean z13 = parcel.readInt() != 0;
                ArrayList<String> arrayListCreateStringArrayList = parcel.createStringArrayList();
                ArrayList<String> arrayListCreateStringArrayList2 = parcel.createStringArrayList();
                PaymentSheet$CardBrandAcceptance paymentSheet$CardBrandAcceptance = (PaymentSheet$CardBrandAcceptance) parcel.readParcelable(CommonConfiguration.class.getClassLoader());
                int i18 = parcel.readInt();
                ArrayList arrayList2 = new ArrayList(i18);
                int iB = 0;
                while (true) {
                    PaymentSheet$CardBrandAcceptance paymentSheet$CardBrandAcceptance2 = paymentSheet$CardBrandAcceptance;
                    if (iB != i18) {
                        iB = fq.c.b(PaymentSheet$CardFundingType.CREATOR, parcel, arrayList2, iB, 1);
                        paymentSheet$CardBrandAcceptance = paymentSheet$CardBrandAcceptance2;
                        string = string;
                    } else {
                        String str = string;
                        int i19 = parcel.readInt();
                        ArrayList arrayList3 = new ArrayList(i19);
                        int iB2 = 0;
                        while (true) {
                            ArrayList arrayList4 = arrayList2;
                            if (iB2 == i19) {
                                PaymentSheet$ShopPayConfiguration paymentSheet$ShopPayConfigurationCreateFromParcel = parcel.readInt() == 0 ? null : PaymentSheet$ShopPayConfiguration.CREATOR.createFromParcel(parcel);
                                String string2 = parcel.readString();
                                LinkAppearance linkAppearanceCreateFromParcel = parcel.readInt() == 0 ? null : LinkAppearance.CREATOR.createFromParcel(parcel);
                                int i21 = parcel.readInt();
                                LinkedHashMap linkedHashMap = new LinkedHashMap(i21);
                                int i22 = 0;
                                while (i22 != i21) {
                                    linkedHashMap.put(parcel.readParcelable(CommonConfiguration.class.getClassLoader()), w0.valueOf(parcel.readString()));
                                    i22++;
                                    arrayList3 = arrayList3;
                                }
                                return new CommonConfiguration(str, paymentSheet$CustomerConfigurationCreateFromParcel, paymentSheet$GooglePayConfigurationCreateFromParcel, paymentSheet$LinkConfigurationCreateFromParcel, paymentSheet$BillingDetailsCreateFromParcel, addressDetailsCreateFromParcel, z11, z12, paymentSheet$BillingDetailsCollectionConfigurationCreateFromParcel, arrayList, z13, arrayListCreateStringArrayList, arrayListCreateStringArrayList2, paymentSheet$CardBrandAcceptance2, arrayList4, arrayList3, paymentSheet$ShopPayConfigurationCreateFromParcel, string2, linkAppearanceCreateFromParcel, linkedHashMap, parcel.readInt() == 0 ? null : PaymentSheet$WalletButtonsConfiguration.CREATOR.createFromParcel(parcel), parcel.readInt() != 0, parcel.readString(), PaymentSheet$Appearance.CREATOR.createFromParcel(parcel));
                            }
                            iB2 = fq.c.b(PaymentSheet$CustomPaymentMethod.CREATOR, parcel, arrayList3, iB2, 1);
                            arrayList2 = arrayList4;
                        }
                    }
                }
            case 7:
                return new AppWidgetContent(parcel.readInt(), parcel.readInt(), parcel.readLong(), parcel.readString(), parcel.readString());
            case 8:
                return new FolderIconReference((BitmapInfo) parcel.readParcelable(FolderIconReference.class.getClassLoader()));
            case 9:
                return new IntentIconReference((Intent) parcel.readParcelable(IntentIconReference.class.getClassLoader()), (UserHandle) parcel.readParcelable(IntentIconReference.class.getClassLoader()));
            case 10:
                return new NovaActionIconReference(c0.valueOf(parcel.readString()));
            case 11:
                return new ShortcutIconReference((Intent.ShortcutIconResource) parcel.readParcelable(ShortcutIconReference.class.getClassLoader()));
            case 12:
                return new ShortcutKeyIconReference((ShortcutKey) parcel.readParcelable(ShortcutKeyIconReference.class.getClassLoader()));
            case 13:
                int iN06 = z2.N0(parcel);
                int iU0 = 1;
                int iU02 = 1;
                long jW0 = -1;
                long jW02 = -1;
                while (parcel.dataPosition() < iN06) {
                    int i23 = parcel.readInt();
                    char c12 = (char) i23;
                    if (c12 == 1) {
                        iU0 = z2.u0(parcel, i23);
                    } else if (c12 == 2) {
                        iU02 = z2.u0(parcel, i23);
                    } else if (c12 == 3) {
                        jW0 = z2.w0(parcel, i23);
                    } else if (c12 != 4) {
                        z2.I0(parcel, i23);
                    } else {
                        jW02 = z2.w0(parcel, i23);
                    }
                }
                z2.U(parcel, iN06);
                return new zzac(jW0, jW02, iU0, iU02);
            case 14:
                int iN07 = z2.N0(parcel);
                WorkSource workSource = new WorkSource();
                long jW03 = Long.MAX_VALUE;
                long jW04 = Long.MAX_VALUE;
                int iU03 = 0;
                boolean zP0 = false;
                int iU04 = 0;
                int iU05 = 102;
                String strN = null;
                zzd zzdVar = null;
                while (parcel.dataPosition() < iN07) {
                    int i24 = parcel.readInt();
                    switch ((char) i24) {
                        case 1:
                            jW03 = z2.w0(parcel, i24);
                            break;
                        case 2:
                            iU03 = z2.u0(parcel, i24);
                            break;
                        case 3:
                            iU05 = z2.u0(parcel, i24);
                            break;
                        case 4:
                            jW04 = z2.w0(parcel, i24);
                            break;
                        case 5:
                            zP0 = z2.p0(parcel, i24);
                            break;
                        case 6:
                            workSource = (WorkSource) z2.L(parcel, i24, WorkSource.CREATOR);
                            break;
                        case 7:
                            iU04 = z2.u0(parcel, i24);
                            break;
                        case '\b':
                            strN = z2.N(parcel, i24);
                            break;
                        case '\t':
                            zzdVar = (zzd) z2.L(parcel, i24, zzd.CREATOR);
                            break;
                        default:
                            z2.I0(parcel, i24);
                            break;
                    }
                }
                z2.U(parcel, iN07);
                return new CurrentLocationRequest(jW03, iU03, iU05, jW04, zP0, iU04, strN, workSource, zzdVar);
            case 15:
                int iN08 = z2.N0(parcel);
                int iU06 = 1000;
                int iU07 = 1;
                int iU08 = 1;
                long jW05 = 0;
                zzac[] zzacVarArr = null;
                while (parcel.dataPosition() < iN08) {
                    int i25 = parcel.readInt();
                    switch ((char) i25) {
                        case 1:
                            iU07 = z2.u0(parcel, i25);
                            break;
                        case 2:
                            iU08 = z2.u0(parcel, i25);
                            break;
                        case 3:
                            jW05 = z2.w0(parcel, i25);
                            break;
                        case 4:
                            iU06 = z2.u0(parcel, i25);
                            break;
                        case 5:
                            zzacVarArr = (zzac[]) z2.Q(parcel, i25, zzac.CREATOR);
                            break;
                        case 6:
                            z2.p0(parcel, i25);
                            break;
                        default:
                            z2.I0(parcel, i25);
                            break;
                    }
                }
                z2.U(parcel, iN08);
                return new LocationAvailability(iU06, iU07, iU08, jW05, zzacVarArr);
            case 16:
                int iN09 = z2.N0(parcel);
                WorkSource workSource2 = new WorkSource();
                int iU09 = 102;
                long jW06 = 3600000;
                long jW07 = 600000;
                long jW08 = 0;
                long jW09 = Long.MAX_VALUE;
                long jW010 = Long.MAX_VALUE;
                int iU010 = Integer.MAX_VALUE;
                float fR0 = 0.0f;
                boolean zP02 = false;
                int iU011 = 0;
                int iU012 = 0;
                boolean zP03 = false;
                long jW011 = -1;
                String strN2 = null;
                zzd zzdVar2 = null;
                while (parcel.dataPosition() < iN09) {
                    int i26 = parcel.readInt();
                    switch ((char) i26) {
                        case 1:
                            iU09 = z2.u0(parcel, i26);
                            break;
                        case 2:
                            jW06 = z2.w0(parcel, i26);
                            break;
                        case 3:
                            jW07 = z2.w0(parcel, i26);
                            break;
                        case 4:
                        default:
                            z2.I0(parcel, i26);
                            break;
                        case 5:
                            jW09 = z2.w0(parcel, i26);
                            break;
                        case 6:
                            iU010 = z2.u0(parcel, i26);
                            break;
                        case 7:
                            fR0 = z2.r0(parcel, i26);
                            break;
                        case '\b':
                            jW08 = z2.w0(parcel, i26);
                            break;
                        case '\t':
                            zP02 = z2.p0(parcel, i26);
                            break;
                        case '\n':
                            jW010 = z2.w0(parcel, i26);
                            break;
                        case 11:
                            jW011 = z2.w0(parcel, i26);
                            break;
                        case '\f':
                            iU011 = z2.u0(parcel, i26);
                            break;
                        case '\r':
                            iU012 = z2.u0(parcel, i26);
                            break;
                        case 14:
                            strN2 = z2.N(parcel, i26);
                            break;
                        case 15:
                            zP03 = z2.p0(parcel, i26);
                            break;
                        case 16:
                            workSource2 = (WorkSource) z2.L(parcel, i26, WorkSource.CREATOR);
                            break;
                        case 17:
                            zzdVar2 = (zzd) z2.L(parcel, i26, zzd.CREATOR);
                            break;
                    }
                }
                z2.U(parcel, iN09);
                return new LocationRequest(iU09, jW06, jW07, jW08, jW09, jW010, iU010, fR0, zP02, jW011, iU011, iU012, strN2, zP03, workSource2, zzdVar2);
            case 17:
                int iN010 = z2.N0(parcel);
                List listR = LocationResult.f33711g;
                while (parcel.dataPosition() < iN010) {
                    int i27 = parcel.readInt();
                    if (((char) i27) != 1) {
                        z2.I0(parcel, i27);
                    } else {
                        listR = z2.R(parcel, i27, Location.CREATOR);
                    }
                }
                z2.U(parcel, iN010);
                return new LocationResult(listR);
            case 18:
                int iN011 = z2.N0(parcel);
                int iU013 = 0;
                byte bQ0 = -1;
                byte bQ02 = -1;
                CameraPosition cameraPosition = null;
                byte bQ03 = -1;
                byte bQ04 = -1;
                byte bQ05 = -1;
                byte bQ06 = -1;
                byte bQ07 = -1;
                byte bQ08 = -1;
                byte bQ09 = -1;
                byte bQ010 = -1;
                byte bQ011 = -1;
                Float fS0 = null;
                Float fS02 = null;
                LatLngBounds latLngBounds = null;
                byte bQ012 = -1;
                Integer numV0 = null;
                String strN3 = null;
                while (parcel.dataPosition() < iN011) {
                    int i28 = parcel.readInt();
                    switch ((char) i28) {
                        case 2:
                            bQ0 = z2.q0(parcel, i28);
                            break;
                        case 3:
                            bQ02 = z2.q0(parcel, i28);
                            break;
                        case 4:
                            iU013 = z2.u0(parcel, i28);
                            break;
                        case 5:
                            cameraPosition = (CameraPosition) z2.L(parcel, i28, CameraPosition.CREATOR);
                            break;
                        case 6:
                            bQ03 = z2.q0(parcel, i28);
                            break;
                        case 7:
                            bQ04 = z2.q0(parcel, i28);
                            break;
                        case '\b':
                            bQ05 = z2.q0(parcel, i28);
                            break;
                        case '\t':
                            bQ06 = z2.q0(parcel, i28);
                            break;
                        case '\n':
                            bQ07 = z2.q0(parcel, i28);
                            break;
                        case 11:
                            bQ08 = z2.q0(parcel, i28);
                            break;
                        case '\f':
                            bQ09 = z2.q0(parcel, i28);
                            break;
                        case '\r':
                        default:
                            z2.I0(parcel, i28);
                            break;
                        case 14:
                            bQ010 = z2.q0(parcel, i28);
                            break;
                        case 15:
                            bQ011 = z2.q0(parcel, i28);
                            break;
                        case 16:
                            fS0 = z2.s0(parcel, i28);
                            break;
                        case 17:
                            fS02 = z2.s0(parcel, i28);
                            break;
                        case 18:
                            latLngBounds = (LatLngBounds) z2.L(parcel, i28, LatLngBounds.CREATOR);
                            break;
                        case 19:
                            bQ012 = z2.q0(parcel, i28);
                            break;
                        case 20:
                            numV0 = z2.v0(parcel, i28);
                            break;
                        case 21:
                            strN3 = z2.N(parcel, i28);
                            break;
                    }
                }
                z2.U(parcel, iN011);
                GoogleMapOptions googleMapOptions = new GoogleMapOptions();
                googleMapOptions.f33719h = -1;
                googleMapOptions.f33728s = null;
                googleMapOptions.f33729t = null;
                googleMapOptions.f33730u = null;
                googleMapOptions.f33732w = null;
                googleMapOptions.f33733x = null;
                googleMapOptions.f33717f = j.q(bQ0);
                googleMapOptions.f33718g = j.q(bQ02);
                googleMapOptions.f33719h = iU013;
                googleMapOptions.f33720i = cameraPosition;
                googleMapOptions.f33721j = j.q(bQ03);
                googleMapOptions.f33722k = j.q(bQ04);
                googleMapOptions.f33723l = j.q(bQ05);
                googleMapOptions.f33724m = j.q(bQ06);
                googleMapOptions.n = j.q(bQ07);
                googleMapOptions.o = j.q(bQ08);
                googleMapOptions.f33725p = j.q(bQ09);
                googleMapOptions.f33726q = j.q(bQ010);
                googleMapOptions.f33727r = j.q(bQ011);
                googleMapOptions.f33728s = fS0;
                googleMapOptions.f33729t = fS02;
                googleMapOptions.f33730u = latLngBounds;
                googleMapOptions.f33731v = j.q(bQ012);
                googleMapOptions.f33732w = numV0;
                googleMapOptions.f33733x = strN3;
                return googleMapOptions;
            case 19:
                Intrinsics.g(parcel, "parcel");
                return new LinkConfirmationOption(LinkConfiguration.CREATOR.createFromParcel(parcel), (LinkLaunchMode) parcel.readParcelable(LinkConfirmationOption.class.getClassLoader()), o.valueOf(parcel.readString()));
            case 20:
                Intrinsics.g(parcel, "parcel");
                return new LinkPassthroughConfirmationDefinition$Result((PaymentMethodConfirmationOption) parcel.readParcelable(LinkPassthroughConfirmationDefinition$Result.class.getClassLoader()));
            case 21:
                Intrinsics.g(parcel, "parcel");
                return new PaymentIntentClientSecret(parcel.readString());
            case 22:
                Intrinsics.g(parcel, "parcel");
                return new PaymentMethodIncentive(parcel.readString(), parcel.readString());
            case 23:
                Intrinsics.g(parcel, "parcel");
                return new SetupIntentClientSecret(parcel.readString());
            case 24:
                Intrinsics.g(parcel, "parcel");
                return new AcsData(parcel.readString(), (ECPublicKey) parcel.readSerializable(), (ECPublicKey) parcel.readSerializable());
            case 25:
                Intrinsics.g(parcel, "parcel");
                return new AuthenticationRequestParameters(parcel.readString(), SdkTransactionId.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            case 26:
                Intrinsics.g(parcel, "parcel");
                return new ChallengeParameters(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            case 27:
                Intrinsics.g(parcel, "parcel");
                return new InitChallengeArgs(parcel.readString(), (KeyPair) parcel.readSerializable(), ChallengeParameters.CREATOR.createFromParcel(parcel), parcel.readInt(), IntentData.CREATOR.createFromParcel(parcel));
            case 28:
                Intrinsics.g(parcel, "parcel");
                return new IntentData(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            default:
                Intrinsics.g(parcel, "parcel");
                return new SdkTransactionId(parcel.readString());
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f87737a) {
            case 0:
                return new StripeUiCustomization[i5];
            case 1:
                return new zze[i5];
            case 2:
                return new zzg[i5];
            case 3:
                return new zzi[i5];
            case 4:
                return new zzk[i5];
            case 5:
                return new zzm[i5];
            case 6:
                return new CommonConfiguration[i5];
            case 7:
                return new AppWidgetContent[i5];
            case 8:
                return new FolderIconReference[i5];
            case 9:
                return new IntentIconReference[i5];
            case 10:
                return new NovaActionIconReference[i5];
            case 11:
                return new ShortcutIconReference[i5];
            case 12:
                return new ShortcutKeyIconReference[i5];
            case 13:
                return new zzac[i5];
            case 14:
                return new CurrentLocationRequest[i5];
            case 15:
                return new LocationAvailability[i5];
            case 16:
                return new LocationRequest[i5];
            case 17:
                return new LocationResult[i5];
            case 18:
                return new GoogleMapOptions[i5];
            case 19:
                return new LinkConfirmationOption[i5];
            case 20:
                return new LinkPassthroughConfirmationDefinition$Result[i5];
            case 21:
                return new PaymentIntentClientSecret[i5];
            case 22:
                return new PaymentMethodIncentive[i5];
            case 23:
                return new SetupIntentClientSecret[i5];
            case 24:
                return new AcsData[i5];
            case 25:
                return new AuthenticationRequestParameters[i5];
            case 26:
                return new ChallengeParameters[i5];
            case 27:
                return new InitChallengeArgs[i5];
            case 28:
                return new IntentData[i5];
            default:
                return new SdkTransactionId[i5];
        }
    }
}
