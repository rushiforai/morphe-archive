package ou;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$ButtonThemes;
import com.stripe.android.paymentsheet.PaymentSheet$CardBrandAcceptance;
import com.stripe.android.paymentsheet.PaymentSheet$CardFundingType;
import com.stripe.android.paymentsheet.PaymentSheet$Colors;
import com.stripe.android.paymentsheet.PaymentSheet$Configuration;
import com.stripe.android.paymentsheet.PaymentSheet$CustomPaymentMethod;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerAccessType;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$GooglePayConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$Insets;
import com.stripe.android.paymentsheet.PaymentSheet$LinkConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$PrimaryButton;
import com.stripe.android.paymentsheet.PaymentSheet$PrimaryButtonColors;
import com.stripe.android.paymentsheet.PaymentSheet$PrimaryButtonShape;
import com.stripe.android.paymentsheet.PaymentSheet$PrimaryButtonTypography;
import com.stripe.android.paymentsheet.PaymentSheet$Shapes;
import com.stripe.android.paymentsheet.PaymentSheet$ShopPayConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$Spacing;
import com.stripe.android.paymentsheet.PaymentSheet$WalletButtonsConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l0 implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f80926a;

    public /* synthetic */ l0(int i5) {
        this.f80926a = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        int i5;
        switch (this.f80926a) {
            case 0:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$Address(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            case 1:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$BillingDetails(parcel.readInt() == 0 ? null : PaymentSheet$Address.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readString(), parcel.readString());
            case 2:
                Intrinsics.g(parcel, "parcel");
                n0 n0VarValueOf = n0.valueOf(parcel.readString());
                n0 n0VarValueOf2 = n0.valueOf(parcel.readString());
                n0 n0VarValueOf3 = n0.valueOf(parcel.readString());
                m0 m0VarValueOf = m0.valueOf(parcel.readString());
                int iH = 0;
                boolean z11 = parcel.readInt() != 0;
                int i11 = parcel.readInt();
                LinkedHashSet linkedHashSet = new LinkedHashSet(i11);
                while (iH != i11) {
                    iH = k2.h(parcel, linkedHashSet, iH, 1);
                }
                return new PaymentSheet$BillingDetailsCollectionConfiguration(n0VarValueOf, n0VarValueOf2, n0VarValueOf3, m0VarValueOf, z11, linkedHashSet);
            case 3:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$ButtonThemes(o0.valueOf(parcel.readString()));
            case 4:
                Intrinsics.g(parcel, "parcel");
                return PaymentSheet$CardFundingType.valueOf(parcel.readString());
            case 5:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$Colors(parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt());
            case 6:
                Intrinsics.g(parcel, "parcel");
                String string = parcel.readString();
                PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfigurationCreateFromParcel = parcel.readInt() == 0 ? null : PaymentSheet$CustomerConfiguration.CREATOR.createFromParcel(parcel);
                PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfigurationCreateFromParcel = parcel.readInt() == 0 ? null : PaymentSheet$GooglePayConfiguration.CREATOR.createFromParcel(parcel);
                PaymentSheet$BillingDetails paymentSheet$BillingDetailsCreateFromParcel = parcel.readInt() == 0 ? null : PaymentSheet$BillingDetails.CREATOR.createFromParcel(parcel);
                AddressDetails addressDetails = (AddressDetails) parcel.readParcelable(PaymentSheet$Configuration.class.getClassLoader());
                boolean z12 = false;
                boolean z13 = parcel.readInt() != 0;
                if (parcel.readInt() != 0) {
                    i5 = 0;
                    z12 = true;
                } else {
                    i5 = 0;
                }
                PaymentSheet$Appearance paymentSheet$AppearanceCreateFromParcel = PaymentSheet$Appearance.CREATOR.createFromParcel(parcel);
                int i12 = i5;
                String string2 = parcel.readString();
                PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfigurationCreateFromParcel = PaymentSheet$BillingDetailsCollectionConfiguration.CREATOR.createFromParcel(parcel);
                int i13 = parcel.readInt();
                ArrayList arrayList = new ArrayList(i13);
                for (int i14 = i12; i14 != i13; i14++) {
                    arrayList.add(ft.b.valueOf(parcel.readString()));
                }
                boolean z14 = parcel.readInt() != 0 ? 1 : i12;
                ArrayList<String> arrayListCreateStringArrayList = parcel.createStringArrayList();
                ArrayList<String> arrayListCreateStringArrayList2 = parcel.createStringArrayList();
                v0 v0VarValueOf = v0.valueOf(parcel.readString());
                PaymentSheet$CardBrandAcceptance paymentSheet$CardBrandAcceptance = (PaymentSheet$CardBrandAcceptance) parcel.readParcelable(PaymentSheet$Configuration.class.getClassLoader());
                int i15 = parcel.readInt();
                ArrayList arrayList2 = new ArrayList(i15);
                int iB = 0;
                while (iB != i15) {
                    iB = fq.c.b(PaymentSheet$CardFundingType.CREATOR, parcel, arrayList2, iB, 1);
                    i15 = i15;
                    string = string;
                }
                String str = string;
                int i16 = parcel.readInt();
                ArrayList arrayList3 = new ArrayList(i16);
                int iB2 = 0;
                while (true) {
                    ArrayList arrayList4 = arrayList2;
                    if (iB2 == i16) {
                        PaymentSheet$LinkConfiguration paymentSheet$LinkConfigurationCreateFromParcel = PaymentSheet$LinkConfiguration.CREATOR.createFromParcel(parcel);
                        PaymentSheet$WalletButtonsConfiguration paymentSheet$WalletButtonsConfigurationCreateFromParcel = PaymentSheet$WalletButtonsConfiguration.CREATOR.createFromParcel(parcel);
                        PaymentSheet$ShopPayConfiguration paymentSheet$ShopPayConfigurationCreateFromParcel = parcel.readInt() == 0 ? null : PaymentSheet$ShopPayConfiguration.CREATOR.createFromParcel(parcel);
                        String string3 = parcel.readString();
                        int i17 = parcel.readInt();
                        LinkedHashMap linkedHashMap = new LinkedHashMap(i17);
                        int i18 = 0;
                        while (i18 != i17) {
                            linkedHashMap.put(parcel.readParcelable(PaymentSheet$Configuration.class.getClassLoader()), w0.valueOf(parcel.readString()));
                            i18++;
                            i17 = i17;
                        }
                        return new PaymentSheet$Configuration(str, paymentSheet$CustomerConfigurationCreateFromParcel, paymentSheet$GooglePayConfigurationCreateFromParcel, paymentSheet$BillingDetailsCreateFromParcel, addressDetails, z13, z12, paymentSheet$AppearanceCreateFromParcel, string2, paymentSheet$BillingDetailsCollectionConfigurationCreateFromParcel, arrayList, z14, arrayListCreateStringArrayList, arrayListCreateStringArrayList2, v0VarValueOf, paymentSheet$CardBrandAcceptance, arrayList4, arrayList3, paymentSheet$LinkConfigurationCreateFromParcel, paymentSheet$WalletButtonsConfigurationCreateFromParcel, paymentSheet$ShopPayConfigurationCreateFromParcel, string3, linkedHashMap, parcel.readInt() != 0, parcel.readString());
                    }
                    iB2 = fq.c.b(PaymentSheet$CustomPaymentMethod.CREATOR, parcel, arrayList3, iB2, 1);
                    arrayList2 = arrayList4;
                    i16 = i16;
                }
            case 7:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$CustomPaymentMethod(parcel.readString(), (ResolvableString) parcel.readParcelable(PaymentSheet$CustomPaymentMethod.class.getClassLoader()), parcel.readInt() != 0);
            case 8:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$CustomerConfiguration(parcel.readString(), parcel.readString(), (PaymentSheet$CustomerAccessType) parcel.readParcelable(PaymentSheet$CustomerConfiguration.class.getClassLoader()));
            case 9:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$GooglePayConfiguration(q0.valueOf(parcel.readString()), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : Long.valueOf(parcel.readLong()), parcel.readString(), p0.valueOf(parcel.readString()), parcel.createStringArrayList());
            case 10:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$Insets(parcel.readFloat(), parcel.readFloat(), parcel.readFloat(), parcel.readFloat());
            case 11:
                Intrinsics.g(parcel, "parcel");
                u0 u0VarValueOf = u0.valueOf(parcel.readString());
                int iH2 = 0;
                boolean z15 = parcel.readInt() != 0;
                boolean z16 = parcel.readInt() != 0;
                boolean z17 = parcel.readInt() != 0;
                int i19 = parcel.readInt();
                LinkedHashSet linkedHashSet2 = new LinkedHashSet(i19);
                while (iH2 != i19) {
                    iH2 = k2.h(parcel, linkedHashSet2, iH2, 1);
                }
                return new PaymentSheet$LinkConfiguration(u0VarValueOf, z15, z16, z17, linkedHashSet2);
            case 12:
                Intrinsics.g(parcel, "parcel");
                Parcelable.Creator<PaymentSheet$PrimaryButtonColors> creator = PaymentSheet$PrimaryButtonColors.CREATOR;
                return new PaymentSheet$PrimaryButton(creator.createFromParcel(parcel), creator.createFromParcel(parcel), PaymentSheet$PrimaryButtonShape.CREATOR.createFromParcel(parcel), PaymentSheet$PrimaryButtonTypography.CREATOR.createFromParcel(parcel));
            case 13:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$PrimaryButtonColors(parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()));
            case 14:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$PrimaryButtonShape(parcel.readInt() == 0 ? null : Float.valueOf(parcel.readFloat()), parcel.readInt() == 0 ? null : Float.valueOf(parcel.readFloat()), parcel.readInt() != 0 ? Float.valueOf(parcel.readFloat()) : null);
            case 15:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$PrimaryButtonTypography(parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() != 0 ? Float.valueOf(parcel.readFloat()) : null);
            case 16:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$Shapes(parcel.readFloat(), parcel.readFloat(), parcel.readFloat());
            default:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheet$Spacing(parcel.readFloat());
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f80926a) {
            case 0:
                return new PaymentSheet$Address[i5];
            case 1:
                return new PaymentSheet$BillingDetails[i5];
            case 2:
                return new PaymentSheet$BillingDetailsCollectionConfiguration[i5];
            case 3:
                return new PaymentSheet$ButtonThemes[i5];
            case 4:
                return new PaymentSheet$CardFundingType[i5];
            case 5:
                return new PaymentSheet$Colors[i5];
            case 6:
                return new PaymentSheet$Configuration[i5];
            case 7:
                return new PaymentSheet$CustomPaymentMethod[i5];
            case 8:
                return new PaymentSheet$CustomerConfiguration[i5];
            case 9:
                return new PaymentSheet$GooglePayConfiguration[i5];
            case 10:
                return new PaymentSheet$Insets[i5];
            case 11:
                return new PaymentSheet$LinkConfiguration[i5];
            case 12:
                return new PaymentSheet$PrimaryButton[i5];
            case 13:
                return new PaymentSheet$PrimaryButtonColors[i5];
            case 14:
                return new PaymentSheet$PrimaryButtonShape[i5];
            case 15:
                return new PaymentSheet$PrimaryButtonTypography[i5];
            case 16:
                return new PaymentSheet$Shapes[i5];
            default:
                return new PaymentSheet$Spacing[i5];
        }
    }
}
