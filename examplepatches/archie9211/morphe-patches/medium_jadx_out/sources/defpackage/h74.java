package defpackage;

import android.content.Intent;
import android.content.IntentSender;
import android.graphics.Bitmap;
import android.media.MediaDescription;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.ResultReceiver;
import android.support.v4.media.MediaBrowserCompat$MediaItem;
import android.support.v4.media.MediaDescriptionCompat;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.session.MediaSessionCompat$QueueItem;
import android.support.v4.media.session.MediaSessionCompat$Token;
import com.google.android.gms.identitycredentials.GetCredentialRequest;
import com.medium.android.core.models.HighlightType;
import com.medium.android.core.navigation.HighlightReference;
import com.medium.android.core.push.MediumPushNotification;
import com.medium.android.domain.post.models.AnchorType;
import com.medium.android.domain.post.models.Highlight;
import com.medium.android.domain.post.models.Markup;
import com.medium.android.domain.post.models.MarkupType;
import defpackage.h74;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h74 implements Parcelable.Creator {
    public final /* synthetic */ int a;

    public /* synthetic */ h74(int i) {
        this.a = i;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(final Parcel parcel) {
        Bundle bundle;
        Bundle bundleM = null;
        Bundle bundleM2 = null;
        Bundle bundleM3 = null;
        Bundle bundleM4 = null;
        wg2 wg2Var = null;
        ArrayList arrayListS = null;
        switch (this.a) {
            case 0:
                int iJ0 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ0) {
                    int i = parcel.readInt();
                    if (((char) i) != 1) {
                        vn7.a0(i, parcel);
                    } else {
                        bundleM = vn7.m(i, parcel);
                    }
                }
                vn7.t(iJ0, parcel);
                return new g74(bundleM);
            case 1:
                parcel.getClass();
                return new b94(parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), null, null, false);
            case 2:
                a25 a25Var = new a25();
                a25Var.a = parcel.readString();
                a25Var.b = parcel.readInt();
                return a25Var;
            case 3:
                h25 h25Var = new h25();
                h25Var.e = null;
                h25Var.f = new ArrayList();
                h25Var.g = new ArrayList();
                h25Var.a = parcel.createStringArrayList();
                h25Var.b = parcel.createStringArrayList();
                h25Var.c = (lm0[]) parcel.createTypedArray(lm0.CREATOR);
                h25Var.d = parcel.readInt();
                h25Var.e = parcel.readString();
                h25Var.f = parcel.createStringArrayList();
                h25Var.g = parcel.createTypedArrayList(mm0.CREATOR);
                h25Var.h = parcel.createTypedArrayList(a25.CREATOR);
                return h25Var;
            case 4:
                return new q25(parcel);
            case 5:
                Bundle bundleM5 = null;
                int iJ02 = vn7.j0(parcel);
                String strP = null;
                ResultReceiver resultReceiver = null;
                while (parcel.dataPosition() < iJ02) {
                    int i2 = parcel.readInt();
                    char c = (char) i2;
                    if (c == 1) {
                        arrayListS = vn7.s(parcel, i2, ch2.CREATOR);
                    } else if (c == 2) {
                        bundleM5 = vn7.m(i2, parcel);
                    } else if (c == 3) {
                        strP = vn7.p(i2, parcel);
                    } else if (c != 4) {
                        vn7.a0(i2, parcel);
                    } else {
                        resultReceiver = (ResultReceiver) vn7.o(parcel, i2, ResultReceiver.CREATOR);
                    }
                }
                vn7.t(iJ02, parcel);
                return new GetCredentialRequest(arrayListS, bundleM5, strP, resultReceiver);
            case 6:
                int iJ03 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ03) {
                    int i3 = parcel.readInt();
                    if (((char) i3) != 1) {
                        vn7.a0(i3, parcel);
                    } else {
                        wg2Var = (wg2) vn7.o(parcel, i3, wg2.CREATOR);
                    }
                }
                vn7.t(iJ03, parcel);
                return new j95(wg2Var);
            case 7:
                int iJ04 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ04) {
                    int i4 = parcel.readInt();
                    if (((char) i4) != 1) {
                        vn7.a0(i4, parcel);
                    } else {
                        bundleM4 = vn7.m(i4, parcel);
                    }
                }
                vn7.t(iJ04, parcel);
                return new vb5(bundleM4);
            case 8:
                int iJ05 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ05) {
                    int i5 = parcel.readInt();
                    if (((char) i5) != 1) {
                        vn7.a0(i5, parcel);
                    } else {
                        bundleM3 = vn7.m(i5, parcel);
                    }
                }
                vn7.t(iJ05, parcel);
                return new wb5(bundleM3);
            case 9:
                parcel.getClass();
                return new qc5(parcel);
            case 10:
                parcel.getClass();
                return new df5(parcel);
            case 11:
                parcel.getClass();
                String string = parcel.readString();
                String string2 = parcel.readString();
                String string3 = parcel.readString();
                Integer numValueOf = parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt());
                int i6 = parcel.readInt();
                int i7 = parcel.readInt();
                String string4 = parcel.readString();
                String string5 = parcel.readString();
                int i8 = parcel.readInt();
                ArrayList arrayList = new ArrayList(i8);
                for (int i9 = 0; i9 != i8; i9++) {
                    arrayList.add(Markup.CREATOR.createFromParcel(parcel));
                }
                return new Highlight(string, string2, string3, numValueOf, i6, i7, string4, string5, bo.g0(arrayList), parcel.readString(), parcel.readString(), HighlightType.valueOf(parcel.readString()));
            case 12:
                parcel.getClass();
                return new HighlightReference(parcel.readString(), parcel.readString(), parcel.readInt(), parcel.readInt());
            case 13:
                parcel.getClass();
                return new sw5(parcel.readString(), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() == 0 ? null : Double.valueOf(parcel.readDouble()), parcel.readInt() == 0 ? null : Double.valueOf(parcel.readDouble()), parcel.readString());
            case 14:
                int iJ06 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ06) {
                    int i10 = parcel.readInt();
                    if (((char) i10) != 1) {
                        vn7.a0(i10, parcel);
                    } else {
                        bundleM2 = vn7.m(i10, parcel);
                    }
                }
                vn7.t(iJ06, parcel);
                return new cz5(bundleM2);
            case 15:
                parcel.getClass();
                return new n36(parcel);
            case 16:
                parcel.getClass();
                Parcelable parcelable = parcel.readParcelable(IntentSender.class.getClassLoader());
                parcelable.getClass();
                return new a56((IntentSender) parcelable, (Intent) parcel.readParcelable(Intent.class.getClassLoader()), parcel.readInt(), parcel.readInt());
            case 17:
                parcel.getClass();
                return new dk6(0, parcel);
            case 18:
                uz6 uz6Var = new uz6();
                uz6Var.a = parcel.readInt();
                uz6Var.b = parcel.readInt();
                uz6Var.c = parcel.readInt() == 1;
                return uz6Var;
            case 19:
                parcel.getClass();
                p87 p87Var = new p87();
                p87Var.b = -1;
                Parcelable[] parcelableArray = parcel.readParcelableArray(ba7.class.getClassLoader());
                if (parcelableArray == null) {
                    parcelableArray = new Parcelable[0];
                }
                ArrayList arrayList2 = new ArrayList();
                for (Parcelable parcelable2 : parcelableArray) {
                    ba7 ba7Var = parcelable2 instanceof ba7 ? (ba7) parcelable2 : null;
                    if (ba7Var != null) {
                        ba7Var.b = p87Var;
                    }
                    if (ba7Var != null) {
                        arrayList2.add(ba7Var);
                    }
                }
                p87Var.a = (ba7[]) arrayList2.toArray(new ba7[0]);
                p87Var.b = parcel.readInt();
                p87Var.g = (m87) parcel.readParcelable(m87.class.getClassLoader());
                HashMap mapS = epe.S(parcel);
                p87Var.h = mapS != null ? new LinkedHashMap(mapS) : null;
                HashMap mapS2 = epe.S(parcel);
                p87Var.i = mapS2 != null ? new LinkedHashMap(mapS2) : null;
                return p87Var;
            case 20:
                parcel.getClass();
                return new m87(parcel);
            case 21:
                parcel.getClass();
                return new o87(parcel);
            case 22:
                parcel.getClass();
                return new Markup(MarkupType.valueOf(parcel.readString()), parcel.readInt(), parcel.readInt(), parcel.readInt() != 0 ? AnchorType.valueOf(parcel.readString()) : null, parcel.readString(), parcel.readString());
            case 23:
                yj7 yj7Var = new yj7(parcel);
                yj7Var.a = ((Integer) parcel.readValue(yj7.class.getClassLoader())).intValue();
                return yj7Var;
            case 24:
                return new Parcelable(parcel) { // from class: android.support.v4.media.MediaBrowserCompat$MediaItem
                    public static final Parcelable.Creator<MediaBrowserCompat$MediaItem> CREATOR = new h74(24);
                    public final int a;
                    public final MediaDescriptionCompat b;

                    {
                        this.a = parcel.readInt();
                        this.b = MediaDescriptionCompat.CREATOR.createFromParcel(parcel);
                    }

                    @Override // android.os.Parcelable
                    public final int describeContents() {
                        return 0;
                    }

                    public final String toString() {
                        return "MediaItem{mFlags=" + this.a + ", mDescription=" + this.b + '}';
                    }

                    @Override // android.os.Parcelable
                    public final void writeToParcel(Parcel parcel2, int i11) {
                        parcel2.writeInt(this.a);
                        this.b.writeToParcel(parcel2, i11);
                    }
                };
            case 25:
                Object objCreateFromParcel = MediaDescription.CREATOR.createFromParcel(parcel);
                if (objCreateFromParcel == null) {
                    return null;
                }
                MediaDescription mediaDescription = (MediaDescription) objCreateFromParcel;
                String strG = tl7.g(mediaDescription);
                CharSequence charSequenceI = tl7.i(mediaDescription);
                CharSequence charSequenceH = tl7.h(mediaDescription);
                CharSequence charSequenceC = tl7.c(mediaDescription);
                Bitmap bitmapE = tl7.e(mediaDescription);
                Uri uriF = tl7.f(mediaDescription);
                Bundle bundleD = tl7.d(mediaDescription);
                if (bundleD != null) {
                    bundleD = zm7.W(bundleD);
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
                    uriA = ul7.a(mediaDescription);
                }
                MediaDescriptionCompat mediaDescriptionCompat = new MediaDescriptionCompat(strG, charSequenceI, charSequenceH, charSequenceC, bitmapE, uriF, bundle, uriA);
                mediaDescriptionCompat.i = mediaDescription;
                return mediaDescriptionCompat;
            case 26:
                return new MediaMetadataCompat(parcel);
            case 27:
                return new MediaSessionCompat$QueueItem(parcel);
            case 28:
                return new MediaSessionCompat$Token(parcel.readParcelable(null), null);
            default:
                parcel.getClass();
                return new MediumPushNotification(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt(), parcel.readString(), parcel.readString(), parcel.readString());
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i) {
        switch (this.a) {
            case 0:
                return new g74[i];
            case 1:
                return new b94[i];
            case 2:
                return new a25[i];
            case 3:
                return new h25[i];
            case 4:
                return new q25[i];
            case 5:
                return new GetCredentialRequest[i];
            case 6:
                return new j95[i];
            case 7:
                return new vb5[i];
            case 8:
                return new wb5[i];
            case 9:
                return new qc5[i];
            case 10:
                return new df5[i];
            case 11:
                return new Highlight[i];
            case 12:
                return new HighlightReference[i];
            case 13:
                return new sw5[i];
            case 14:
                return new cz5[i];
            case 15:
                return new n36[i];
            case 16:
                return new a56[i];
            case 17:
                return new dk6[i];
            case 18:
                return new uz6[i];
            case 19:
                return new p87[i];
            case 20:
                return new m87[i];
            case 21:
                return new o87[i];
            case 22:
                return new Markup[i];
            case 23:
                return new yj7[i];
            case 24:
                return new MediaBrowserCompat$MediaItem[i];
            case 25:
                return new MediaDescriptionCompat[i];
            case 26:
                return new MediaMetadataCompat[i];
            case 27:
                return new MediaSessionCompat$QueueItem[i];
            case 28:
                return new MediaSessionCompat$Token[i];
            default:
                return new MediumPushNotification[i];
        }
    }
}
