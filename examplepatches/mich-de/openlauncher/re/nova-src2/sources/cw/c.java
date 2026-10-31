package cw;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.ui.core.elements.AddressSpec;
import com.stripe.android.ui.core.elements.AffirmTextSpec;
import com.stripe.android.ui.core.elements.AfterpayClearpayTextSpec;
import com.stripe.android.ui.core.elements.AuBankAccountNumberSpec;
import com.stripe.android.ui.core.elements.AuBecsDebitMandateTextSpec;
import com.stripe.android.ui.core.elements.BacsDebitBankAccountSpec;
import com.stripe.android.ui.core.elements.BacsDebitConfirmSpec;
import com.stripe.android.ui.core.elements.BsbSpec;
import com.stripe.android.ui.core.elements.CashAppPayMandateTextSpec;
import com.stripe.android.ui.core.elements.CountrySpec;
import com.stripe.android.ui.core.elements.DropdownItemSpec;
import com.stripe.android.ui.core.elements.DropdownSpec;
import com.stripe.android.ui.core.elements.EmailSpec;
import com.stripe.android.ui.core.elements.EmptyFormSpec;
import com.stripe.android.ui.core.elements.ExternalPaymentMethodSpec;
import com.stripe.android.ui.core.elements.IbanSpec;
import com.stripe.android.ui.core.elements.KlarnaHeaderStaticTextSpec;
import com.stripe.android.ui.core.elements.KlarnaMandateTextSpec;
import com.stripe.android.ui.core.elements.MandateTextSpec;
import com.stripe.android.ui.core.elements.NameSpec;
import com.stripe.android.ui.core.elements.OTPSpec;
import com.stripe.android.ui.core.elements.PhoneSpec;
import com.stripe.android.ui.core.elements.PlaceholderSpec;
import com.stripe.android.ui.core.elements.SelectorIcon;
import com.stripe.android.ui.core.elements.SepaMandateTextSpec;
import com.stripe.android.ui.core.elements.SharedDataSpec;
import com.stripe.android.ui.core.elements.SimpleTextSpec;
import com.stripe.android.ui.core.elements.StaticTextSpec;
import com.stripe.android.uicore.elements.AddressInputMode;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48105a;

    public /* synthetic */ c(int i5) {
        this.f48105a = i5;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        switch (this.f48105a) {
            case 0:
                Intrinsics.g(parcel, "parcel");
                IdentifierSpec identifierSpec = (IdentifierSpec) parcel.readParcelable(AddressSpec.class.getClassLoader());
                int i5 = parcel.readInt();
                LinkedHashSet linkedHashSet = new LinkedHashSet(i5);
                int iH = 0;
                while (true) {
                    boolean z12 = true;
                    if (iH == i5) {
                        int i11 = parcel.readInt();
                        LinkedHashSet linkedHashSet2 = new LinkedHashSet(i11);
                        for (int i12 = 0; i12 != i11; i12++) {
                            linkedHashSet2.add(d2.valueOf(parcel.readString()));
                        }
                        if (parcel.readInt() != 0) {
                            z11 = true;
                        } else {
                            z11 = true;
                            z12 = false;
                        }
                        return new AddressSpec(identifierSpec, linkedHashSet, linkedHashSet2, z12, (AddressInputMode) parcel.readParcelable(AddressSpec.class.getClassLoader()), parcel.readInt() != 0 ? z11 : false);
                    }
                    iH = com.google.android.gms.internal.measurement.k2.h(parcel, linkedHashSet, iH, 1);
                }
            case 1:
                Intrinsics.g(parcel, "parcel");
                return new AffirmTextSpec((IdentifierSpec) parcel.readParcelable(AffirmTextSpec.class.getClassLoader()));
            case 2:
                Intrinsics.g(parcel, "parcel");
                return new AfterpayClearpayTextSpec((IdentifierSpec) parcel.readParcelable(AfterpayClearpayTextSpec.class.getClassLoader()));
            case 3:
                Intrinsics.g(parcel, "parcel");
                return new AuBankAccountNumberSpec((IdentifierSpec) parcel.readParcelable(AuBankAccountNumberSpec.class.getClassLoader()));
            case 4:
                Intrinsics.g(parcel, "parcel");
                return new AuBecsDebitMandateTextSpec((IdentifierSpec) parcel.readParcelable(AuBecsDebitMandateTextSpec.class.getClassLoader()));
            case 5:
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return new BacsDebitBankAccountSpec();
            case 6:
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return new BacsDebitConfirmSpec();
            case 7:
                Intrinsics.g(parcel, "parcel");
                return new BsbSpec((IdentifierSpec) parcel.readParcelable(BsbSpec.class.getClassLoader()));
            case 8:
                Intrinsics.g(parcel, "parcel");
                return new CashAppPayMandateTextSpec(parcel.readInt(), (IdentifierSpec) parcel.readParcelable(CashAppPayMandateTextSpec.class.getClassLoader()));
            case 9:
                Intrinsics.g(parcel, "parcel");
                IdentifierSpec identifierSpec2 = (IdentifierSpec) parcel.readParcelable(CountrySpec.class.getClassLoader());
                int i13 = parcel.readInt();
                LinkedHashSet linkedHashSet3 = new LinkedHashSet(i13);
                int iH2 = 0;
                while (iH2 != i13) {
                    iH2 = com.google.android.gms.internal.measurement.k2.h(parcel, linkedHashSet3, iH2, 1);
                }
                return new CountrySpec(identifierSpec2, linkedHashSet3);
            case 10:
                Intrinsics.g(parcel, "parcel");
                return new DropdownItemSpec(parcel.readString(), parcel.readString());
            case 11:
                Intrinsics.g(parcel, "parcel");
                IdentifierSpec identifierSpec3 = (IdentifierSpec) parcel.readParcelable(DropdownSpec.class.getClassLoader());
                s4 s4VarValueOf = s4.valueOf(parcel.readString());
                int i14 = parcel.readInt();
                ArrayList arrayList = new ArrayList(i14);
                for (int i15 = 0; i15 != i14; i15++) {
                    arrayList.add(parcel.readParcelable(DropdownSpec.class.getClassLoader()));
                }
                return new DropdownSpec(identifierSpec3, s4VarValueOf, arrayList);
            case 12:
                Intrinsics.g(parcel, "parcel");
                return new EmailSpec((IdentifierSpec) parcel.readParcelable(EmailSpec.class.getClassLoader()));
            case 13:
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return EmptyFormSpec.INSTANCE;
            case 14:
                Intrinsics.g(parcel, "parcel");
                return new ExternalPaymentMethodSpec(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            case 15:
                Intrinsics.g(parcel, "parcel");
                return new IbanSpec((IdentifierSpec) parcel.readParcelable(IbanSpec.class.getClassLoader()));
            case 16:
                Intrinsics.g(parcel, "parcel");
                return new KlarnaHeaderStaticTextSpec((IdentifierSpec) parcel.readParcelable(KlarnaHeaderStaticTextSpec.class.getClassLoader()));
            case 17:
                Intrinsics.g(parcel, "parcel");
                return new KlarnaMandateTextSpec(parcel.readInt(), (IdentifierSpec) parcel.readParcelable(KlarnaMandateTextSpec.class.getClassLoader()));
            case 18:
                Intrinsics.g(parcel, "parcel");
                return new MandateTextSpec(parcel.readInt(), (IdentifierSpec) parcel.readParcelable(MandateTextSpec.class.getClassLoader()));
            case 19:
                Intrinsics.g(parcel, "parcel");
                return new NameSpec((IdentifierSpec) parcel.readParcelable(NameSpec.class.getClassLoader()), s4.valueOf(parcel.readString()));
            case 20:
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return OTPSpec.INSTANCE;
            case 21:
                Intrinsics.g(parcel, "parcel");
                return new PhoneSpec((IdentifierSpec) parcel.readParcelable(PhoneSpec.class.getClassLoader()));
            case 22:
                Intrinsics.g(parcel, "parcel");
                return new PlaceholderSpec((IdentifierSpec) parcel.readParcelable(PlaceholderSpec.class.getClassLoader()), t3.valueOf(parcel.readString()));
            case 23:
                Intrinsics.g(parcel, "parcel");
                return new SelectorIcon(parcel.readString(), parcel.readString());
            case 24:
                Intrinsics.g(parcel, "parcel");
                return new SepaMandateTextSpec(parcel.readInt(), (IdentifierSpec) parcel.readParcelable(SepaMandateTextSpec.class.getClassLoader()));
            case 25:
                Intrinsics.g(parcel, "parcel");
                String string = parcel.readString();
                int i16 = parcel.readInt();
                ArrayList arrayList2 = new ArrayList(i16);
                for (int i17 = 0; i17 != i16; i17++) {
                    arrayList2.add(parcel.readParcelable(SharedDataSpec.class.getClassLoader()));
                }
                return new SharedDataSpec(string, arrayList2, parcel.readInt() == 0 ? null : SelectorIcon.CREATOR.createFromParcel(parcel));
            case 26:
                Intrinsics.g(parcel, "parcel");
                return new SimpleTextSpec((IdentifierSpec) parcel.readParcelable(SimpleTextSpec.class.getClassLoader()), parcel.readInt(), i0.valueOf(parcel.readString()), a3.valueOf(parcel.readString()), parcel.readInt() != 0);
            default:
                Intrinsics.g(parcel, "parcel");
                return new StaticTextSpec(parcel.readInt(), (IdentifierSpec) parcel.readParcelable(StaticTextSpec.class.getClassLoader()));
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f48105a) {
            case 0:
                return new AddressSpec[i5];
            case 1:
                return new AffirmTextSpec[i5];
            case 2:
                return new AfterpayClearpayTextSpec[i5];
            case 3:
                return new AuBankAccountNumberSpec[i5];
            case 4:
                return new AuBecsDebitMandateTextSpec[i5];
            case 5:
                return new BacsDebitBankAccountSpec[i5];
            case 6:
                return new BacsDebitConfirmSpec[i5];
            case 7:
                return new BsbSpec[i5];
            case 8:
                return new CashAppPayMandateTextSpec[i5];
            case 9:
                return new CountrySpec[i5];
            case 10:
                return new DropdownItemSpec[i5];
            case 11:
                return new DropdownSpec[i5];
            case 12:
                return new EmailSpec[i5];
            case 13:
                return new EmptyFormSpec[i5];
            case 14:
                return new ExternalPaymentMethodSpec[i5];
            case 15:
                return new IbanSpec[i5];
            case 16:
                return new KlarnaHeaderStaticTextSpec[i5];
            case 17:
                return new KlarnaMandateTextSpec[i5];
            case 18:
                return new MandateTextSpec[i5];
            case 19:
                return new NameSpec[i5];
            case 20:
                return new OTPSpec[i5];
            case 21:
                return new PhoneSpec[i5];
            case 22:
                return new PlaceholderSpec[i5];
            case 23:
                return new SelectorIcon[i5];
            case 24:
                return new SepaMandateTextSpec[i5];
            case 25:
                return new SharedDataSpec[i5];
            case 26:
                return new SimpleTextSpec[i5];
            default:
                return new StaticTextSpec[i5];
        }
    }
}
