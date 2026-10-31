package cf;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.exoplayer2.metadata.id3.BinaryFrame;
import com.google.android.exoplayer2.metadata.id3.ChapterFrame;
import com.google.android.exoplayer2.metadata.id3.ChapterTocFrame;
import com.google.android.exoplayer2.metadata.id3.CommentFrame;
import com.google.android.exoplayer2.metadata.id3.GeobFrame;
import com.google.android.exoplayer2.metadata.id3.InternalFrame;
import com.google.android.exoplayer2.metadata.id3.MlltFrame;
import com.google.android.exoplayer2.metadata.id3.PrivFrame;
import com.google.android.exoplayer2.metadata.id3.TextInformationFrame;
import com.google.android.exoplayer2.metadata.id3.UrlLinkFrame;
import com.google.android.exoplayer2.metadata.mp4.MdtaMetadataEntry;
import com.google.android.exoplayer2.metadata.mp4.MotionPhotoMetadata;
import com.google.android.exoplayer2.metadata.mp4.SmtaMetadataEntry;
import com.google.android.gms.fido.fido2.api.common.AuthenticationExtensionsClientOutputs;
import com.google.android.gms.fido.fido2.api.common.AuthenticationExtensionsCredPropsOutputs;
import com.google.android.gms.fido.fido2.api.common.AuthenticatorAssertionResponse;
import com.google.android.gms.fido.fido2.api.common.AuthenticatorAttestationResponse;
import com.google.android.gms.fido.fido2.api.common.AuthenticatorErrorResponse;
import com.google.android.gms.fido.fido2.api.common.PublicKeyCredential;
import com.google.android.gms.fido.fido2.api.common.UvmEntries;
import com.google.android.gms.fido.fido2.api.common.UvmEntry;
import com.google.android.gms.fido.fido2.api.common.zzf;
import com.google.android.gms.fido.fido2.api.common.zzh;
import com.google.android.gms.identity.intents.model.UserAddress;
import com.stripe.android.core.model.Country;
import com.stripe.android.core.model.CountryCode;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.lpmfoundations.paymentmethod.AnalyticsMetadata;
import com.stripe.android.lpmfoundations.paymentmethod.DisplayableCustomPaymentMethod;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentSheetCardBrandFilter;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentSheetCardFundingFilter;
import com.stripe.android.paymentsheet.PaymentSheet$CardBrandAcceptance;
import com.stripe.android.paymentsheet.PaymentSheet$CardFundingType;
import e10.z2;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;
import mh.k0;

/* loaded from: classes3.dex */
public final class a implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19942a;

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        switch (this.f19942a) {
            case 0:
                return new BinaryFrame(parcel);
            case 1:
                return new ChapterFrame(parcel);
            case 2:
                return new ChapterTocFrame(parcel);
            case 3:
                return new CommentFrame(parcel);
            case 4:
                return new GeobFrame(parcel);
            case 5:
                return new InternalFrame(parcel);
            case 6:
                return new MlltFrame(parcel);
            case 7:
                return new PrivFrame(parcel);
            case 8:
                return new TextInformationFrame(parcel);
            case 9:
                return new UrlLinkFrame(parcel);
            case 10:
                int iN0 = z2.N0(parcel);
                String strN = null;
                String strN2 = null;
                byte[] bArrG = null;
                AuthenticatorAttestationResponse authenticatorAttestationResponse = null;
                AuthenticatorAssertionResponse authenticatorAssertionResponse = null;
                AuthenticatorErrorResponse authenticatorErrorResponse = null;
                AuthenticationExtensionsClientOutputs authenticationExtensionsClientOutputs = null;
                String strN3 = null;
                while (parcel.dataPosition() < iN0) {
                    int i5 = parcel.readInt();
                    switch ((char) i5) {
                        case 1:
                            strN = z2.N(parcel, i5);
                            break;
                        case 2:
                            strN2 = z2.N(parcel, i5);
                            break;
                        case 3:
                            bArrG = z2.G(parcel, i5);
                            break;
                        case 4:
                            authenticatorAttestationResponse = (AuthenticatorAttestationResponse) z2.L(parcel, i5, AuthenticatorAttestationResponse.CREATOR);
                            break;
                        case 5:
                            authenticatorAssertionResponse = (AuthenticatorAssertionResponse) z2.L(parcel, i5, AuthenticatorAssertionResponse.CREATOR);
                            break;
                        case 6:
                            authenticatorErrorResponse = (AuthenticatorErrorResponse) z2.L(parcel, i5, AuthenticatorErrorResponse.CREATOR);
                            break;
                        case 7:
                            authenticationExtensionsClientOutputs = (AuthenticationExtensionsClientOutputs) z2.L(parcel, i5, AuthenticationExtensionsClientOutputs.CREATOR);
                            break;
                        case '\b':
                            strN3 = z2.N(parcel, i5);
                            break;
                        case '\t':
                            z2.N(parcel, i5);
                            break;
                        default:
                            z2.I0(parcel, i5);
                            break;
                    }
                }
                z2.U(parcel, iN0);
                return new PublicKeyCredential(strN, strN2, bArrG, authenticatorAttestationResponse, authenticatorAssertionResponse, authenticatorErrorResponse, authenticationExtensionsClientOutputs, strN3);
            case 11:
                int iN02 = z2.N0(parcel);
                ArrayList arrayListR = null;
                while (parcel.dataPosition() < iN02) {
                    int i11 = parcel.readInt();
                    if (((char) i11) != 1) {
                        z2.I0(parcel, i11);
                    } else {
                        arrayListR = z2.R(parcel, i11, UvmEntry.CREATOR);
                    }
                }
                z2.U(parcel, iN02);
                return new UvmEntries(arrayListR);
            case 12:
                int iN03 = z2.N0(parcel);
                int iU0 = 0;
                short s11 = 0;
                short s12 = 0;
                while (parcel.dataPosition() < iN03) {
                    int i12 = parcel.readInt();
                    char c11 = (char) i12;
                    if (c11 == 1) {
                        iU0 = z2.u0(parcel, i12);
                    } else if (c11 == 2) {
                        z2.P0(parcel, i12, 4);
                        s11 = (short) parcel.readInt();
                    } else if (c11 != 3) {
                        z2.I0(parcel, i12);
                    } else {
                        z2.P0(parcel, i12, 4);
                        s12 = (short) parcel.readInt();
                    }
                }
                z2.U(parcel, iN03);
                return new UvmEntry(iU0, s11, s12);
            case 13:
                int iN04 = z2.N0(parcel);
                UvmEntries uvmEntries = null;
                zzf zzfVar = null;
                AuthenticationExtensionsCredPropsOutputs authenticationExtensionsCredPropsOutputs = null;
                zzh zzhVar = null;
                String strN4 = null;
                while (parcel.dataPosition() < iN04) {
                    int i13 = parcel.readInt();
                    char c12 = (char) i13;
                    if (c12 == 1) {
                        uvmEntries = (UvmEntries) z2.L(parcel, i13, UvmEntries.CREATOR);
                    } else if (c12 == 2) {
                        zzfVar = (zzf) z2.L(parcel, i13, zzf.CREATOR);
                    } else if (c12 == 3) {
                        authenticationExtensionsCredPropsOutputs = (AuthenticationExtensionsCredPropsOutputs) z2.L(parcel, i13, AuthenticationExtensionsCredPropsOutputs.CREATOR);
                    } else if (c12 == 4) {
                        zzhVar = (zzh) z2.L(parcel, i13, zzh.CREATOR);
                    } else if (c12 != 5) {
                        z2.I0(parcel, i13);
                    } else {
                        strN4 = z2.N(parcel, i13);
                    }
                }
                z2.U(parcel, iN04);
                return new AuthenticationExtensionsClientOutputs(uvmEntries, zzfVar, authenticationExtensionsCredPropsOutputs, zzhVar, strN4);
            case 14:
                int iN05 = z2.N0(parcel);
                boolean zP0 = false;
                while (parcel.dataPosition() < iN05) {
                    int i14 = parcel.readInt();
                    if (((char) i14) != 1) {
                        z2.I0(parcel, i14);
                    } else {
                        zP0 = z2.p0(parcel, i14);
                    }
                }
                z2.U(parcel, iN05);
                return new AuthenticationExtensionsCredPropsOutputs(zP0);
            case 15:
                int iN06 = z2.N0(parcel);
                byte[] bArrG2 = null;
                byte[] bArrG3 = null;
                while (parcel.dataPosition() < iN06) {
                    int i15 = parcel.readInt();
                    char c13 = (char) i15;
                    if (c13 == 1) {
                        bArrG2 = z2.G(parcel, i15);
                    } else if (c13 != 2) {
                        z2.I0(parcel, i15);
                    } else {
                        bArrG3 = z2.G(parcel, i15);
                    }
                }
                z2.U(parcel, iN06);
                return new zzf(bArrG2 == null ? null : k0.k(bArrG2.length, bArrG2), bArrG3 != null ? k0.k(bArrG3.length, bArrG3) : null);
            case 16:
                int iN07 = z2.N0(parcel);
                boolean zP02 = false;
                byte[] bArrG4 = null;
                while (parcel.dataPosition() < iN07) {
                    int i16 = parcel.readInt();
                    char c14 = (char) i16;
                    if (c14 == 1) {
                        zP02 = z2.p0(parcel, i16);
                    } else if (c14 != 2) {
                        z2.I0(parcel, i16);
                    } else {
                        bArrG4 = z2.G(parcel, i16);
                    }
                }
                z2.U(parcel, iN07);
                return new zzh(zP02, bArrG4 != null ? k0.k(bArrG4.length, bArrG4) : null);
            case 17:
                int iN08 = z2.N0(parcel);
                byte[] bArrG5 = null;
                byte[] bArrG6 = null;
                byte[] bArrG7 = null;
                byte[] bArrG8 = null;
                byte[] bArrG9 = null;
                while (parcel.dataPosition() < iN08) {
                    int i17 = parcel.readInt();
                    char c15 = (char) i17;
                    if (c15 == 2) {
                        bArrG5 = z2.G(parcel, i17);
                    } else if (c15 == 3) {
                        bArrG6 = z2.G(parcel, i17);
                    } else if (c15 == 4) {
                        bArrG7 = z2.G(parcel, i17);
                    } else if (c15 == 5) {
                        bArrG8 = z2.G(parcel, i17);
                    } else if (c15 != 6) {
                        z2.I0(parcel, i17);
                    } else {
                        bArrG9 = z2.G(parcel, i17);
                    }
                }
                z2.U(parcel, iN08);
                return new AuthenticatorAssertionResponse(bArrG5, bArrG6, bArrG7, bArrG8, bArrG9);
            case 18:
                int iN09 = z2.N0(parcel);
                byte[] bArrG10 = null;
                byte[] bArrG11 = null;
                byte[] bArrG12 = null;
                String[] strArrO = null;
                while (parcel.dataPosition() < iN09) {
                    int i18 = parcel.readInt();
                    char c16 = (char) i18;
                    if (c16 == 2) {
                        bArrG10 = z2.G(parcel, i18);
                    } else if (c16 == 3) {
                        bArrG11 = z2.G(parcel, i18);
                    } else if (c16 == 4) {
                        bArrG12 = z2.G(parcel, i18);
                    } else if (c16 != 5) {
                        z2.I0(parcel, i18);
                    } else {
                        strArrO = z2.O(parcel, i18);
                    }
                }
                z2.U(parcel, iN09);
                return new AuthenticatorAttestationResponse(bArrG10, bArrG11, bArrG12, strArrO);
            case 19:
                int iN010 = z2.N0(parcel);
                int iU02 = 0;
                String strN5 = null;
                int iU03 = 0;
                while (parcel.dataPosition() < iN010) {
                    int i19 = parcel.readInt();
                    char c17 = (char) i19;
                    if (c17 == 2) {
                        iU02 = z2.u0(parcel, i19);
                    } else if (c17 == 3) {
                        strN5 = z2.N(parcel, i19);
                    } else if (c17 != 4) {
                        z2.I0(parcel, i19);
                    } else {
                        iU03 = z2.u0(parcel, i19);
                    }
                }
                z2.U(parcel, iN010);
                return new AuthenticatorErrorResponse(iU02, strN5, iU03);
            case 20:
                Intrinsics.g(parcel, "parcel");
                return new Country(CountryCode.CREATOR.createFromParcel(parcel), parcel.readString());
            case 21:
                Intrinsics.g(parcel, "parcel");
                return new CountryCode(parcel.readString());
            case 22:
                Intrinsics.g(parcel, "parcel");
                int i21 = parcel.readInt();
                LinkedHashMap linkedHashMap = new LinkedHashMap(i21);
                for (int i22 = 0; i22 != i21; i22++) {
                    linkedHashMap.put(parcel.readString(), parcel.readParcelable(AnalyticsMetadata.class.getClassLoader()));
                }
                return new AnalyticsMetadata(linkedHashMap);
            case 23:
                Intrinsics.g(parcel, "parcel");
                return new DisplayableCustomPaymentMethod(parcel.readString(), parcel.readString(), parcel.readString(), (ResolvableString) parcel.readParcelable(DisplayableCustomPaymentMethod.class.getClassLoader()), parcel.readInt() != 0);
            case 24:
                Intrinsics.g(parcel, "parcel");
                return new PaymentSheetCardBrandFilter((PaymentSheet$CardBrandAcceptance) parcel.readParcelable(PaymentSheetCardBrandFilter.class.getClassLoader()));
            case 25:
                Intrinsics.g(parcel, "parcel");
                int i23 = parcel.readInt();
                ArrayList arrayList = new ArrayList(i23);
                int iB = 0;
                while (iB != i23) {
                    iB = fq.c.b(PaymentSheet$CardFundingType.CREATOR, parcel, arrayList, iB, 1);
                }
                return new PaymentSheetCardFundingFilter(arrayList);
            case 26:
                return new MdtaMetadataEntry(parcel);
            case 27:
                return new MotionPhotoMetadata(parcel);
            case 28:
                return new SmtaMetadataEntry(parcel);
            default:
                int iN011 = z2.N0(parcel);
                String strN6 = null;
                String strN7 = null;
                String strN8 = null;
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
                boolean zP03 = false;
                String strN19 = null;
                while (parcel.dataPosition() < iN011) {
                    int i24 = parcel.readInt();
                    boolean z11 = zP03;
                    switch ((char) i24) {
                        case 2:
                            strN6 = z2.N(parcel, i24);
                            break;
                        case 3:
                            strN19 = z2.N(parcel, i24);
                            break;
                        case 4:
                            strN7 = z2.N(parcel, i24);
                            break;
                        case 5:
                            strN8 = z2.N(parcel, i24);
                            break;
                        case 6:
                            strN9 = z2.N(parcel, i24);
                            break;
                        case 7:
                            strN10 = z2.N(parcel, i24);
                            break;
                        case '\b':
                            strN11 = z2.N(parcel, i24);
                            break;
                        case '\t':
                            strN12 = z2.N(parcel, i24);
                            break;
                        case '\n':
                            strN13 = z2.N(parcel, i24);
                            break;
                        case 11:
                            strN14 = z2.N(parcel, i24);
                            break;
                        case '\f':
                            strN15 = z2.N(parcel, i24);
                            break;
                        case '\r':
                            strN16 = z2.N(parcel, i24);
                            break;
                        case 14:
                            zP03 = z2.p0(parcel, i24);
                            continue;
                        case 15:
                            strN18 = z2.N(parcel, i24);
                            break;
                        case 16:
                            strN17 = z2.N(parcel, i24);
                            break;
                        default:
                            z2.I0(parcel, i24);
                            break;
                    }
                    zP03 = z11;
                }
                boolean z12 = zP03;
                z2.U(parcel, iN011);
                UserAddress userAddress = new UserAddress();
                userAddress.f31948f = strN6;
                userAddress.f31949g = strN19;
                userAddress.f31950h = strN7;
                userAddress.f31951i = strN8;
                userAddress.f31952j = strN9;
                userAddress.f31953k = strN10;
                userAddress.f31954l = strN11;
                userAddress.f31955m = strN12;
                userAddress.n = strN13;
                userAddress.o = strN14;
                userAddress.f31956p = strN15;
                userAddress.f31957q = strN16;
                userAddress.f31958r = z12;
                userAddress.f31959s = strN18;
                userAddress.f31960t = strN17;
                return userAddress;
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f19942a) {
            case 0:
                return new BinaryFrame[i5];
            case 1:
                return new ChapterFrame[i5];
            case 2:
                return new ChapterTocFrame[i5];
            case 3:
                return new CommentFrame[i5];
            case 4:
                return new GeobFrame[i5];
            case 5:
                return new InternalFrame[i5];
            case 6:
                return new MlltFrame[i5];
            case 7:
                return new PrivFrame[i5];
            case 8:
                return new TextInformationFrame[i5];
            case 9:
                return new UrlLinkFrame[i5];
            case 10:
                return new PublicKeyCredential[i5];
            case 11:
                return new UvmEntries[i5];
            case 12:
                return new UvmEntry[i5];
            case 13:
                return new AuthenticationExtensionsClientOutputs[i5];
            case 14:
                return new AuthenticationExtensionsCredPropsOutputs[i5];
            case 15:
                return new zzf[i5];
            case 16:
                return new zzh[i5];
            case 17:
                return new AuthenticatorAssertionResponse[i5];
            case 18:
                return new AuthenticatorAttestationResponse[i5];
            case 19:
                return new AuthenticatorErrorResponse[i5];
            case 20:
                return new Country[i5];
            case 21:
                return new CountryCode[i5];
            case 22:
                return new AnalyticsMetadata[i5];
            case 23:
                return new DisplayableCustomPaymentMethod[i5];
            case 24:
                return new PaymentSheetCardBrandFilter[i5];
            case 25:
                return new PaymentSheetCardFundingFilter[i5];
            case 26:
                return new MdtaMetadataEntry[i5];
            case 27:
                return new MotionPhotoMetadata[i5];
            case 28:
                return new SmtaMetadataEntry[i5];
            default:
                return new UserAddress[i5];
        }
    }
}
