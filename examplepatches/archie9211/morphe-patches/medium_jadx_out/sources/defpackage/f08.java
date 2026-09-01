package defpackage;

import android.app.PendingIntent;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.media.RatingCompat;
import android.support.v4.media.session.ParcelableVolumeInfo;
import android.support.v4.media.session.PlaybackStateCompat;
import androidx.versionedparcelable.ParcelImpl;
import com.medium.android.core.models.BillingPeriod;
import com.medium.android.core.share.PostShareData;
import com.medium.android.core.share.RepostShareData;
import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;
import com.medium.android.responses.ResponsesViewModel$WriteState$Highlight;
import gen.model.SourceParameter;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f08 implements Parcelable.Creator {
    public final /* synthetic */ int a;

    public /* synthetic */ f08(int i) {
        this.a = i;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        PendingIntent pendingIntent = null;
        String strP = null;
        wu5 wu5Var = null;
        Bundle bundleM = null;
        PendingIntent pendingIntent2 = null;
        switch (this.a) {
            case 0:
                parcel.getClass();
                return new g08((SourceParameter) parcel.readParcelable(g08.class.getClassLoader()), parcel.readString(), parcel.readString());
            case 1:
                ld8 ld8Var = new ld8(parcel);
                ld8Var.a = parcel.readInt();
                return ld8Var;
            case 2:
                parcel.getClass();
                long j = parcel.readLong();
                int i = uu1.i;
                return new nr8(parcel.readFloat(), j, parcel.readLong(), parcel.readLong());
            case 3:
                return new ParcelImpl(parcel);
            case 4:
                return new g49(parcel.readFloat());
            case 5:
                return new h49(parcel.readInt());
            case 6:
                return new i49(parcel.readLong());
            case 7:
                ParcelableVolumeInfo parcelableVolumeInfo = new ParcelableVolumeInfo();
                parcelableVolumeInfo.a = parcel.readInt();
                parcelableVolumeInfo.c = parcel.readInt();
                parcelableVolumeInfo.d = parcel.readInt();
                parcelableVolumeInfo.e = parcel.readInt();
                parcelableVolumeInfo.b = parcel.readInt();
                return parcelableVolumeInfo;
            case 8:
                int iJ0 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ0) {
                    int i2 = parcel.readInt();
                    if (((char) i2) != 1) {
                        vn7.a0(i2, parcel);
                    } else {
                        pendingIntent = (PendingIntent) vn7.o(parcel, i2, PendingIntent.CREATOR);
                    }
                }
                vn7.t(iJ0, parcel);
                return new y79(pendingIntent);
            case 9:
                int iJ02 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ02) {
                    int i3 = parcel.readInt();
                    if (((char) i3) != 1) {
                        vn7.a0(i3, parcel);
                    } else {
                        pendingIntent2 = (PendingIntent) vn7.o(parcel, i3, PendingIntent.CREATOR);
                    }
                }
                vn7.t(iJ02, parcel);
                return new z79(pendingIntent2);
            case 10:
                return new PlaybackStateCompat(parcel);
            case 11:
                parcel.getClass();
                Uri uri = (Uri) parcel.readParcelable(PostShareData.class.getClassLoader());
                String string = parcel.readString();
                String string2 = parcel.readString();
                String string3 = parcel.readString();
                sw5 sw5VarCreateFromParcel = parcel.readInt() == 0 ? null : sw5.CREATOR.createFromParcel(parcel);
                Integer numValueOf = parcel.readInt() != 0 ? Integer.valueOf(parcel.readInt()) : null;
                return new PostShareData(uri, string, string2, string3, sw5VarCreateFromParcel, numValueOf, parcel.readString(), parcel.readString(), (Uri) parcel.readParcelable(PostShareData.class.getClassLoader()), parcel.createStringArrayList(), parcel.readString(), parcel.readInt() != 0, parcel.readString());
            case 12:
                parcel.getClass();
                return new s2a(parcel);
            case 13:
                parcel.getClass();
                parcel.readInt();
                return xla.a;
            case 14:
                parcel.getClass();
                return new yla(PublicationData.CREATOR.createFromParcel(parcel));
            case 15:
                return new RatingCompat(parcel.readInt(), parcel.readFloat());
            case 16:
                int iJ03 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ03) {
                    vn7.a0(parcel.readInt(), parcel);
                }
                vn7.t(iJ03, parcel);
                return new z2b();
            case 17:
                int iJ04 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ04) {
                    vn7.a0(parcel.readInt(), parcel);
                }
                vn7.t(iJ04, parcel);
                return new a3b();
            case 18:
                int iJ05 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ05) {
                    vn7.a0(parcel.readInt(), parcel);
                }
                vn7.t(iJ05, parcel);
                return new b3b();
            case 19:
                int iJ06 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ06) {
                    int i4 = parcel.readInt();
                    if (((char) i4) != 2) {
                        vn7.a0(i4, parcel);
                    } else {
                        bundleM = vn7.m(i4, parcel);
                    }
                }
                vn7.t(iJ06, parcel);
                return new t3b(bundleM);
            case 20:
                parcel.getClass();
                return new RepostShareData(parcel.readString(), parcel.readInt() != 0, parcel.readString(), PostShareData.CREATOR.createFromParcel(parcel));
            case 21:
                parcel.getClass();
                return new agb(parcel.readString(), parcel.createStringArrayList(), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readString(), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() != 0 ? Long.valueOf(parcel.readLong()) : null, parcel.readString(), parcel.readString());
            case 22:
                parcel.getClass();
                return new bib(parcel.readString(), parcel.readInt() == 0 ? null : zw7.valueOf(parcel.readString()), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() != 0, parcel.readString(), parcel.readInt() != 0, parcel.readInt() != 0 ? ResponsesViewModel$WriteState$Highlight.CREATOR.createFromParcel(parcel) : null);
            case 23:
                parcel.getClass();
                int i5 = parcel.readInt();
                int i6 = parcel.readInt();
                String string4 = parcel.readString();
                String string5 = parcel.readString();
                int i7 = parcel.readInt();
                ArrayList arrayList = new ArrayList(i7);
                for (int i8 = 0; i8 != i7; i8++) {
                    arrayList.add(parcel.readParcelable(ResponsesViewModel$WriteState$Highlight.class.getClassLoader()));
                }
                return new ResponsesViewModel$WriteState$Highlight(i5, i6, string4, string5, arrayList);
            case 24:
                ejb ejbVar = new ejb();
                IBinder strongBinder = parcel.readStrongBinder();
                int i9 = djb.f;
                if (strongBinder != null) {
                    IInterface iInterfaceQueryLocalInterface = strongBinder.queryLocalInterface(wu5.d);
                    if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof wu5)) {
                        vu5 vu5Var = new vu5();
                        vu5Var.e = strongBinder;
                        wu5Var = vu5Var;
                    } else {
                        wu5Var = (wu5) iInterfaceQueryLocalInterface;
                    }
                }
                ejbVar.a = wu5Var;
                return ejbVar;
            case 25:
                int iJ07 = vn7.j0(parcel);
                String strP2 = null;
                Bundle bundleM2 = null;
                while (parcel.dataPosition() < iJ07) {
                    int i10 = parcel.readInt();
                    char c = (char) i10;
                    if (c == 1) {
                        strP = vn7.p(i10, parcel);
                    } else if (c == 2) {
                        strP2 = vn7.p(i10, parcel);
                    } else if (c != 3) {
                        vn7.a0(i10, parcel);
                    } else {
                        bundleM2 = vn7.m(i10, parcel);
                    }
                }
                vn7.t(iJ07, parcel);
                return new tdc(strP, strP2, bundleM2);
            case 26:
                int iJ08 = vn7.j0(parcel);
                while (parcel.dataPosition() < iJ08) {
                    vn7.a0(parcel.readInt(), parcel);
                }
                vn7.t(iJ08, parcel);
                return new vdc();
            case 27:
                bnc bncVar = new bnc();
                bncVar.a = parcel.readInt();
                bncVar.b = parcel.readInt();
                bncVar.d = parcel.readInt() == 1;
                int i11 = parcel.readInt();
                if (i11 > 0) {
                    int[] iArr = new int[i11];
                    bncVar.c = iArr;
                    parcel.readIntArray(iArr);
                }
                return bncVar;
            case 28:
                cnc cncVar = new cnc();
                cncVar.a = parcel.readInt();
                cncVar.b = parcel.readInt();
                int i12 = parcel.readInt();
                cncVar.c = i12;
                if (i12 > 0) {
                    int[] iArr2 = new int[i12];
                    cncVar.d = iArr2;
                    parcel.readIntArray(iArr2);
                }
                int i13 = parcel.readInt();
                cncVar.e = i13;
                if (i13 > 0) {
                    int[] iArr3 = new int[i13];
                    cncVar.f = iArr3;
                    parcel.readIntArray(iArr3);
                }
                cncVar.h = parcel.readInt() == 1;
                cncVar.i = parcel.readInt() == 1;
                cncVar.j = parcel.readInt() == 1;
                cncVar.g = parcel.readArrayList(bnc.class.getClassLoader());
                return cncVar;
            default:
                parcel.getClass();
                return new wyc(parcel.readString(), parcel.readString(), zw7.valueOf(parcel.readString()), BillingPeriod.valueOf(parcel.readString()), parcel.readInt() != 0, parcel.readString());
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i) {
        switch (this.a) {
            case 0:
                return new g08[i];
            case 1:
                return new ld8[i];
            case 2:
                return new nr8[i];
            case 3:
                return new ParcelImpl[i];
            case 4:
                return new g49[i];
            case 5:
                return new h49[i];
            case 6:
                return new i49[i];
            case 7:
                return new ParcelableVolumeInfo[i];
            case 8:
                return new y79[i];
            case 9:
                return new z79[i];
            case 10:
                return new PlaybackStateCompat[i];
            case 11:
                return new PostShareData[i];
            case 12:
                return new s2a[i];
            case 13:
                return new xla[i];
            case 14:
                return new yla[i];
            case 15:
                return new RatingCompat[i];
            case 16:
                return new z2b[i];
            case 17:
                return new a3b[i];
            case 18:
                return new b3b[i];
            case 19:
                return new t3b[i];
            case 20:
                return new RepostShareData[i];
            case 21:
                return new agb[i];
            case 22:
                return new bib[i];
            case 23:
                return new ResponsesViewModel$WriteState$Highlight[i];
            case 24:
                return new ejb[i];
            case 25:
                return new tdc[i];
            case 26:
                return new vdc[i];
            case 27:
                return new bnc[i];
            case 28:
                return new cnc[i];
            default:
                return new wyc[i];
        }
    }
}
