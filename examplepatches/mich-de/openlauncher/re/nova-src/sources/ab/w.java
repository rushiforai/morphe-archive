package ab;

import ab.w;
import ads_mobile_sdk.al0;
import android.content.ComponentName;
import android.graphics.Bitmap;
import android.media.MediaDescription;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import android.support.v4.media.MediaBrowserCompat$MediaItem;
import android.support.v4.media.MediaDescriptionCompat;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.RatingCompat;
import com.android.launcher3.widget.WidgetAddFlowHandler;
import com.google.android.exoplayer2.metadata.flac.PictureFrame;
import com.google.android.exoplayer2.metadata.flac.VorbisComment;
import com.google.android.exoplayer2.metadata.icy.IcyHeaders;
import com.google.android.exoplayer2.metadata.icy.IcyInfo;
import com.google.android.exoplayer2.metadata.id3.ApicFrame;
import com.google.android.gms.internal.measurement.k2;
import com.google.android.gms.measurement.internal.zzaf;
import com.google.android.gms.measurement.internal.zzah;
import com.google.android.gms.measurement.internal.zzao;
import com.google.android.gms.measurement.internal.zzbf;
import com.google.android.gms.measurement.internal.zzbh;
import com.google.android.gms.measurement.internal.zzoh;
import com.google.android.gms.measurement.internal.zzom;
import com.google.android.gms.measurement.internal.zzoo;
import com.google.android.gms.measurement.internal.zzoq;
import com.google.android.gms.measurement.internal.zzpl;
import com.google.android.gms.measurement.internal.zzr;
import com.stripe.android.core.frauddetection.FraudDetectionData;
import com.stripe.android.ui.core.Amount;
import com.stripe.android.ui.core.BillingDetailsCollectionConfiguration;
import e10.z2;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.ui.ClickInfo;
import io.branch.search.ui.ContactAction;
import io.branch.search.ui.Image;
import io.branch.search.ui.Impressable;
import io.branch.search.ui.ImpressionInfo;
import io.branch.search.ui.LauncherActivity;
import io.branch.search.ui.UiContext;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class w implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f771a;

    public /* synthetic */ w(int i5) {
        this.f771a = i5;
    }

    public static void a(zzbh zzbhVar, Parcel parcel, int i5) {
        String str = zzbhVar.f33768f;
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.c0(parcel, 2, str);
        fg.a.b0(parcel, 3, zzbhVar.f33769g, i5);
        fg.a.c0(parcel, 4, zzbhVar.f33770h);
        long j11 = zzbhVar.f33771i;
        fg.a.i0(parcel, 5, 8);
        parcel.writeLong(j11);
        long j12 = zzbhVar.f33772j;
        fg.a.i0(parcel, 6, 8);
        parcel.writeLong(j12);
        fg.a.k0(parcel, iJ0);
    }

    public static void b(zzpl zzplVar, Parcel parcel) {
        int i5 = zzplVar.f33785f;
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.i0(parcel, 1, 4);
        parcel.writeInt(i5);
        fg.a.c0(parcel, 2, zzplVar.f33786g);
        long j11 = zzplVar.f33787h;
        fg.a.i0(parcel, 3, 8);
        parcel.writeLong(j11);
        Long l9 = zzplVar.f33788i;
        if (l9 != null) {
            fg.a.i0(parcel, 4, 8);
            parcel.writeLong(l9.longValue());
        }
        fg.a.c0(parcel, 6, zzplVar.f33789j);
        fg.a.c0(parcel, 7, zzplVar.f33790k);
        Double d5 = zzplVar.f33791l;
        if (d5 != null) {
            fg.a.i0(parcel, 8, 8);
            parcel.writeDouble(d5.doubleValue());
        }
        fg.a.k0(parcel, iJ0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(final Parcel parcel) {
        Bundle bundle;
        switch (this.f771a) {
            case 0:
                return new WidgetAddFlowHandler(parcel);
            case 1:
                return new PictureFrame(parcel);
            case 2:
                return new VorbisComment(parcel);
            case 3:
                int iN0 = z2.N0(parcel);
                long jW0 = 0;
                long jW02 = 0;
                int iU0 = 0;
                while (parcel.dataPosition() < iN0) {
                    int i5 = parcel.readInt();
                    char c11 = (char) i5;
                    if (c11 == 1) {
                        jW0 = z2.w0(parcel, i5);
                    } else if (c11 == 2) {
                        iU0 = z2.u0(parcel, i5);
                    } else if (c11 != 3) {
                        z2.I0(parcel, i5);
                    } else {
                        jW02 = z2.w0(parcel, i5);
                    }
                }
                z2.U(parcel, iN0);
                return new zzaf(jW0, iU0, jW02);
            case 4:
                int iN02 = z2.N0(parcel);
                String strN = null;
                String strN2 = null;
                zzpl zzplVar = null;
                String strN3 = null;
                zzbh zzbhVar = null;
                zzbh zzbhVar2 = null;
                zzbh zzbhVar3 = null;
                long jW03 = 0;
                long jW04 = 0;
                long jW05 = 0;
                boolean zP0 = false;
                while (parcel.dataPosition() < iN02) {
                    int i11 = parcel.readInt();
                    switch ((char) i11) {
                        case 2:
                            strN = z2.N(parcel, i11);
                            break;
                        case 3:
                            strN2 = z2.N(parcel, i11);
                            break;
                        case 4:
                            zzplVar = (zzpl) z2.L(parcel, i11, zzpl.CREATOR);
                            break;
                        case 5:
                            jW03 = z2.w0(parcel, i11);
                            break;
                        case 6:
                            zP0 = z2.p0(parcel, i11);
                            break;
                        case 7:
                            strN3 = z2.N(parcel, i11);
                            break;
                        case '\b':
                            zzbhVar = (zzbh) z2.L(parcel, i11, zzbh.CREATOR);
                            break;
                        case '\t':
                            jW04 = z2.w0(parcel, i11);
                            break;
                        case '\n':
                            zzbhVar2 = (zzbh) z2.L(parcel, i11, zzbh.CREATOR);
                            break;
                        case 11:
                            jW05 = z2.w0(parcel, i11);
                            break;
                        case '\f':
                            zzbhVar3 = (zzbh) z2.L(parcel, i11, zzbh.CREATOR);
                            break;
                        default:
                            z2.I0(parcel, i11);
                            break;
                    }
                }
                z2.U(parcel, iN02);
                return new zzah(strN, strN2, zzplVar, jW03, zP0, strN3, zzbhVar, jW04, zzbhVar2, jW05, zzbhVar3);
            case 5:
                int iN03 = z2.N0(parcel);
                Bundle bundleF = null;
                while (parcel.dataPosition() < iN03) {
                    int i12 = parcel.readInt();
                    if (((char) i12) != 1) {
                        z2.I0(parcel, i12);
                    } else {
                        bundleF = z2.F(parcel, i12);
                    }
                }
                z2.U(parcel, iN03);
                return new zzao(bundleF);
            case 6:
                int iN04 = z2.N0(parcel);
                Bundle bundleF2 = null;
                while (parcel.dataPosition() < iN04) {
                    int i13 = parcel.readInt();
                    if (((char) i13) != 2) {
                        z2.I0(parcel, i13);
                    } else {
                        bundleF2 = z2.F(parcel, i13);
                    }
                }
                z2.U(parcel, iN04);
                return new zzbf(bundleF2);
            case 7:
                int iN05 = z2.N0(parcel);
                long jW06 = 0;
                long jW07 = 0;
                String strN4 = null;
                zzbf zzbfVar = null;
                String strN5 = null;
                while (parcel.dataPosition() < iN05) {
                    int i14 = parcel.readInt();
                    char c12 = (char) i14;
                    if (c12 == 2) {
                        strN4 = z2.N(parcel, i14);
                    } else if (c12 == 3) {
                        zzbfVar = (zzbf) z2.L(parcel, i14, zzbf.CREATOR);
                    } else if (c12 == 4) {
                        strN5 = z2.N(parcel, i14);
                    } else if (c12 == 5) {
                        jW06 = z2.w0(parcel, i14);
                    } else if (c12 != 6) {
                        z2.I0(parcel, i14);
                    } else {
                        jW07 = z2.w0(parcel, i14);
                    }
                }
                z2.U(parcel, iN05);
                return new zzbh(strN4, zzbfVar, strN5, jW06, jW07);
            case 8:
                int iN06 = z2.N0(parcel);
                int iU02 = 0;
                long jW08 = 0;
                String strN6 = null;
                while (parcel.dataPosition() < iN06) {
                    int i15 = parcel.readInt();
                    char c13 = (char) i15;
                    if (c13 == 1) {
                        strN6 = z2.N(parcel, i15);
                    } else if (c13 == 2) {
                        jW08 = z2.w0(parcel, i15);
                    } else if (c13 != 3) {
                        z2.I0(parcel, i15);
                    } else {
                        iU02 = z2.u0(parcel, i15);
                    }
                }
                z2.U(parcel, iN06);
                return new zzoh(strN6, jW08, iU02);
            case 9:
                int iN07 = z2.N0(parcel);
                byte[] bArrG = null;
                String strN7 = null;
                Bundle bundleF3 = null;
                String strN8 = null;
                long jW09 = 0;
                long jW010 = 0;
                int iU03 = 0;
                while (parcel.dataPosition() < iN07) {
                    int i16 = parcel.readInt();
                    switch ((char) i16) {
                        case 1:
                            jW09 = z2.w0(parcel, i16);
                            break;
                        case 2:
                            bArrG = z2.G(parcel, i16);
                            break;
                        case 3:
                            strN7 = z2.N(parcel, i16);
                            break;
                        case 4:
                            bundleF3 = z2.F(parcel, i16);
                            break;
                        case 5:
                            iU03 = z2.u0(parcel, i16);
                            break;
                        case 6:
                            jW010 = z2.w0(parcel, i16);
                            break;
                        case 7:
                            strN8 = z2.N(parcel, i16);
                            break;
                        default:
                            z2.I0(parcel, i16);
                            break;
                    }
                }
                z2.U(parcel, iN07);
                return new zzom(jW09, bArrG, strN7, bundleF3, iU03, jW010, strN8);
            case 10:
                int iN08 = z2.N0(parcel);
                ArrayList arrayListK = null;
                while (parcel.dataPosition() < iN08) {
                    int i17 = parcel.readInt();
                    if (((char) i17) != 1) {
                        z2.I0(parcel, i17);
                    } else {
                        arrayListK = z2.K(parcel, i17);
                    }
                }
                z2.U(parcel, iN08);
                return new zzoo(arrayListK);
            case 11:
                int iN09 = z2.N0(parcel);
                ArrayList arrayListR = null;
                while (parcel.dataPosition() < iN09) {
                    int i18 = parcel.readInt();
                    if (((char) i18) != 1) {
                        z2.I0(parcel, i18);
                    } else {
                        arrayListR = z2.R(parcel, i18, zzom.CREATOR);
                    }
                }
                z2.U(parcel, iN09);
                return new zzoq(arrayListR);
            case 12:
                int iN010 = z2.N0(parcel);
                String strN9 = null;
                Long lValueOf = null;
                Float fS0 = null;
                String strN10 = null;
                String strN11 = null;
                Double dValueOf = null;
                long jW011 = 0;
                int iU04 = 0;
                while (parcel.dataPosition() < iN010) {
                    int i19 = parcel.readInt();
                    switch ((char) i19) {
                        case 1:
                            iU04 = z2.u0(parcel, i19);
                            break;
                        case 2:
                            strN9 = z2.N(parcel, i19);
                            break;
                        case 3:
                            jW011 = z2.w0(parcel, i19);
                            break;
                        case 4:
                            int iX0 = z2.x0(parcel, i19);
                            if (iX0 != 0) {
                                z2.Q0(parcel, iX0, 8);
                                lValueOf = Long.valueOf(parcel.readLong());
                                break;
                            } else {
                                lValueOf = null;
                                break;
                            }
                        case 5:
                            fS0 = z2.s0(parcel, i19);
                            break;
                        case 6:
                            strN10 = z2.N(parcel, i19);
                            break;
                        case 7:
                            strN11 = z2.N(parcel, i19);
                            break;
                        case '\b':
                            int iX02 = z2.x0(parcel, i19);
                            if (iX02 != 0) {
                                z2.Q0(parcel, iX02, 8);
                                dValueOf = Double.valueOf(parcel.readDouble());
                                break;
                            } else {
                                dValueOf = null;
                                break;
                            }
                        default:
                            z2.I0(parcel, i19);
                            break;
                    }
                }
                z2.U(parcel, iN010);
                return new zzpl(iU04, strN9, jW011, lValueOf, fS0, strN10, strN11, dValueOf);
            case 13:
                int iN011 = z2.N0(parcel);
                long jW012 = 0;
                long jW013 = 0;
                long jW014 = 0;
                long jW015 = 0;
                long jW016 = 0;
                long jW017 = 0;
                long jW018 = 0;
                long jW019 = 0;
                boolean zP02 = false;
                int iU05 = 0;
                boolean zP03 = false;
                boolean zP04 = false;
                int iU06 = 0;
                int iU07 = 0;
                String strN12 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                String strN13 = strN12;
                String strN14 = strN13;
                String strN15 = strN14;
                String strN16 = null;
                String strN17 = null;
                String strN18 = null;
                String strN19 = null;
                String strN20 = null;
                String strN21 = null;
                Boolean boolValueOf = null;
                ArrayList arrayListP = null;
                String strN22 = null;
                String strN23 = null;
                int iU08 = 100;
                boolean zP05 = true;
                boolean zP06 = true;
                long jW020 = -2147483648L;
                while (parcel.dataPosition() < iN011) {
                    int i21 = parcel.readInt();
                    switch ((char) i21) {
                        case 2:
                            strN16 = z2.N(parcel, i21);
                            break;
                        case 3:
                            strN17 = z2.N(parcel, i21);
                            break;
                        case 4:
                            strN18 = z2.N(parcel, i21);
                            break;
                        case 5:
                            strN19 = z2.N(parcel, i21);
                            break;
                        case 6:
                            jW012 = z2.w0(parcel, i21);
                            break;
                        case 7:
                            jW013 = z2.w0(parcel, i21);
                            break;
                        case '\b':
                            strN20 = z2.N(parcel, i21);
                            break;
                        case '\t':
                            zP05 = z2.p0(parcel, i21);
                            break;
                        case '\n':
                            zP02 = z2.p0(parcel, i21);
                            break;
                        case 11:
                            jW020 = z2.w0(parcel, i21);
                            break;
                        case '\f':
                            strN21 = z2.N(parcel, i21);
                            break;
                        case '\r':
                        case 17:
                        case 19:
                        case 20:
                        case 24:
                        case '!':
                        default:
                            z2.I0(parcel, i21);
                            break;
                        case 14:
                            jW014 = z2.w0(parcel, i21);
                            break;
                        case 15:
                            iU05 = z2.u0(parcel, i21);
                            break;
                        case 16:
                            zP06 = z2.p0(parcel, i21);
                            break;
                        case 18:
                            zP03 = z2.p0(parcel, i21);
                            break;
                        case 21:
                            int iX03 = z2.x0(parcel, i21);
                            if (iX03 != 0) {
                                z2.Q0(parcel, iX03, 4);
                                boolValueOf = Boolean.valueOf(parcel.readInt() != 0);
                                break;
                            } else {
                                boolValueOf = null;
                                break;
                            }
                        case 22:
                            jW015 = z2.w0(parcel, i21);
                            break;
                        case 23:
                            arrayListP = z2.P(parcel, i21);
                            break;
                        case 25:
                            strN12 = z2.N(parcel, i21);
                            break;
                        case 26:
                            strN13 = z2.N(parcel, i21);
                            break;
                        case 27:
                            strN22 = z2.N(parcel, i21);
                            break;
                        case 28:
                            zP04 = z2.p0(parcel, i21);
                            break;
                        case 29:
                            jW016 = z2.w0(parcel, i21);
                            break;
                        case 30:
                            iU08 = z2.u0(parcel, i21);
                            break;
                        case 31:
                            strN14 = z2.N(parcel, i21);
                            break;
                        case ' ':
                            iU06 = z2.u0(parcel, i21);
                            break;
                        case '\"':
                            jW017 = z2.w0(parcel, i21);
                            break;
                        case '#':
                            strN23 = z2.N(parcel, i21);
                            break;
                        case '$':
                            strN15 = z2.N(parcel, i21);
                            break;
                        case '%':
                            jW018 = z2.w0(parcel, i21);
                            break;
                        case '&':
                            iU07 = z2.u0(parcel, i21);
                            break;
                        case '\'':
                            jW019 = z2.w0(parcel, i21);
                            break;
                    }
                }
                z2.U(parcel, iN011);
                return new zzr(strN16, strN17, strN18, strN19, jW012, jW013, strN20, zP05, zP02, jW020, strN21, jW014, iU05, zP06, zP03, boolValueOf, jW015, arrayListP, strN12, strN13, strN22, zP04, jW016, iU08, strN14, iU06, jW017, strN23, strN15, jW018, iU07, jW019);
            case 14:
                return new Parcelable(parcel) { // from class: android.support.v4.media.MediaBrowserCompat$MediaItem
                    public static final Parcelable.Creator<MediaBrowserCompat$MediaItem> CREATOR = new w(14);

                    /* renamed from: a, reason: collision with root package name */
                    public final int f13555a;

                    /* renamed from: b, reason: collision with root package name */
                    public final MediaDescriptionCompat f13556b;

                    {
                        this.f13555a = parcel.readInt();
                        this.f13556b = MediaDescriptionCompat.CREATOR.createFromParcel(parcel);
                    }

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final String toString() {
                        return "MediaItem{mFlags=" + this.f13555a + ", mDescription=" + this.f13556b + AbstractJsonLexerKt.END_OBJ;
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel parcel2, int i22) {
                        parcel2.writeInt(this.f13555a);
                        this.f13556b.writeToParcel(parcel2, i22);
                    }
                };
            case 15:
                Object objCreateFromParcel = MediaDescription.CREATOR.createFromParcel(parcel);
                if (objCreateFromParcel == null) {
                    return null;
                }
                MediaDescription mediaDescription = (MediaDescription) objCreateFromParcel;
                String strG = android.support.v4.media.a.g(mediaDescription);
                CharSequence charSequenceI = android.support.v4.media.a.i(mediaDescription);
                CharSequence charSequenceH = android.support.v4.media.a.h(mediaDescription);
                CharSequence charSequenceC = android.support.v4.media.a.c(mediaDescription);
                Bitmap bitmapE = android.support.v4.media.a.e(mediaDescription);
                Uri uriF = android.support.v4.media.a.f(mediaDescription);
                Bundle bundleD = android.support.v4.media.a.d(mediaDescription);
                if (bundleD != null) {
                    bundleD = android.support.v4.media.session.b.o0(bundleD);
                }
                Uri uriA = bundleD != null ? (Uri) bundleD.getParcelable("android.support.v4.media.description.MEDIA_URI") : null;
                if (uriA == null) {
                    bundle = bundleD;
                } else if (bundleD.containsKey("android.support.v4.media.description.NULL_BUNDLE_FLAG") && bundleD.size() == 2) {
                    bundle = null;
                } else {
                    bundleD.remove("android.support.v4.media.description.MEDIA_URI");
                    bundleD.remove("android.support.v4.media.description.NULL_BUNDLE_FLAG");
                    bundle = bundleD;
                }
                if (uriA == null) {
                    uriA = android.support.v4.media.b.a(mediaDescription);
                }
                MediaDescriptionCompat mediaDescriptionCompat = new MediaDescriptionCompat(strG, charSequenceI, charSequenceH, charSequenceC, bitmapE, uriF, bundle, uriA);
                mediaDescriptionCompat.f13565i = mediaDescription;
                return mediaDescriptionCompat;
            case 16:
                return new MediaMetadataCompat(parcel);
            case 17:
                return new RatingCompat(parcel.readInt(), parcel.readFloat());
            case 18:
                Intrinsics.g(parcel, "parcel");
                return new FraudDetectionData(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readLong());
            case 19:
                Intrinsics.g(parcel, "parcel");
                return new Amount(parcel.readLong(), parcel.readString());
            case 20:
                Intrinsics.g(parcel, "parcel");
                int iH = 0;
                boolean z11 = parcel.readInt() != 0;
                boolean z12 = parcel.readInt() != 0;
                boolean z13 = parcel.readInt() != 0;
                aw.a aVarValueOf = aw.a.valueOf(parcel.readString());
                int i22 = parcel.readInt();
                LinkedHashSet linkedHashSet = new LinkedHashSet(i22);
                while (iH != i22) {
                    iH = k2.h(parcel, linkedHashSet, iH, 1);
                }
                return new BillingDetailsCollectionConfiguration(z11, z12, z13, aVarValueOf, linkedHashSet);
            case 21:
                int iN012 = z2.N0(parcel);
                String strN24 = null;
                int iU09 = 0;
                while (parcel.dataPosition() < iN012) {
                    int i23 = parcel.readInt();
                    char c14 = (char) i23;
                    if (c14 == 1) {
                        strN24 = z2.N(parcel, i23);
                    } else if (c14 != 2) {
                        z2.I0(parcel, i23);
                    } else {
                        iU09 = z2.u0(parcel, i23);
                    }
                }
                z2.U(parcel, iN012);
                return new al0(strN24, iU09);
            case 22:
                Intrinsics.g(parcel, "parcel");
                return new ClickInfo(LauncherActivity.CREATOR.createFromParcel(parcel), UiContext.CREATOR.createFromParcel(parcel), parcel.readLong());
            case 23:
                Intrinsics.g(parcel, "parcel");
                return new ContactAction((InterfaceC3331q6) parcel.readParcelable(ContactAction.class.getClassLoader()), (Image) parcel.readParcelable(ContactAction.class.getClassLoader()), parcel.readString());
            case 24:
                Intrinsics.g(parcel, "parcel");
                return new ImpressionInfo((Impressable) parcel.readParcelable(ImpressionInfo.class.getClassLoader()), UiContext.CREATOR.createFromParcel(parcel), parcel.readFloat(), parcel.readLong(), parcel.readLong());
            case 25:
                Intrinsics.g(parcel, "parcel");
                return new LauncherActivity(parcel.readString(), (ComponentName) parcel.readParcelable(LauncherActivity.class.getClassLoader()), (UserHandle) parcel.readParcelable(LauncherActivity.class.getClassLoader()));
            case 26:
                Intrinsics.g(parcel, "parcel");
                return UiContext.valueOf(parcel.readString());
            case 27:
                return new IcyHeaders(parcel);
            case 28:
                return new IcyInfo(parcel);
            default:
                return new ApicFrame(parcel);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f771a) {
            case 0:
                return new WidgetAddFlowHandler[i5];
            case 1:
                return new PictureFrame[i5];
            case 2:
                return new VorbisComment[i5];
            case 3:
                return new zzaf[i5];
            case 4:
                return new zzah[i5];
            case 5:
                return new zzao[i5];
            case 6:
                return new zzbf[i5];
            case 7:
                return new zzbh[i5];
            case 8:
                return new zzoh[i5];
            case 9:
                return new zzom[i5];
            case 10:
                return new zzoo[i5];
            case 11:
                return new zzoq[i5];
            case 12:
                return new zzpl[i5];
            case 13:
                return new zzr[i5];
            case 14:
                return new MediaBrowserCompat$MediaItem[i5];
            case 15:
                return new MediaDescriptionCompat[i5];
            case 16:
                return new MediaMetadataCompat[i5];
            case 17:
                return new RatingCompat[i5];
            case 18:
                return new FraudDetectionData[i5];
            case 19:
                return new Amount[i5];
            case 20:
                return new BillingDetailsCollectionConfiguration[i5];
            case 21:
                return new al0[i5];
            case 22:
                return new ClickInfo[i5];
            case 23:
                return new ContactAction[i5];
            case 24:
                return new ImpressionInfo[i5];
            case 25:
                return new LauncherActivity[i5];
            case 26:
                return new UiContext[i5];
            case 27:
                return new IcyHeaders[i5];
            case 28:
                return new IcyInfo[i5];
            default:
                return new ApicFrame[i5];
        }
    }
}
