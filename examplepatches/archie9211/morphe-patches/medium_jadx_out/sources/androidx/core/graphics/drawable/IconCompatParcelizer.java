package androidx.core.graphics.drawable;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.os.Parcel;
import android.os.Parcelable;
import defpackage.ay0;
import defpackage.nse;
import defpackage.ose;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class IconCompatParcelizer {
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static IconCompat read(nse nseVar) {
        IconCompat iconCompat = new IconCompat();
        iconCompat.a = -1;
        iconCompat.c = null;
        iconCompat.d = null;
        iconCompat.e = 0;
        iconCompat.f = 0;
        iconCompat.g = null;
        iconCompat.h = IconCompat.k;
        iconCompat.i = null;
        iconCompat.a = nseVar.f(-1, 1);
        byte[] bArr = iconCompat.c;
        if (nseVar.e(2)) {
            Parcel parcel = ((ose) nseVar).e;
            int i = parcel.readInt();
            if (i < 0) {
                bArr = null;
            } else {
                byte[] bArr2 = new byte[i];
                parcel.readByteArray(bArr2);
                bArr = bArr2;
            }
        }
        iconCompat.c = bArr;
        iconCompat.d = nseVar.g(iconCompat.d, 3);
        iconCompat.e = nseVar.f(iconCompat.e, 4);
        iconCompat.f = nseVar.f(iconCompat.f, 5);
        iconCompat.g = (ColorStateList) nseVar.g(iconCompat.g, 6);
        String string = iconCompat.i;
        if (nseVar.e(7)) {
            string = ((ose) nseVar).e.readString();
        }
        iconCompat.i = string;
        String string2 = iconCompat.j;
        if (nseVar.e(8)) {
            string2 = ((ose) nseVar).e.readString();
        }
        iconCompat.j = string2;
        iconCompat.h = PorterDuff.Mode.valueOf(iconCompat.i);
        switch (iconCompat.a) {
            case -1:
                Parcelable parcelable = iconCompat.d;
                if (parcelable != null) {
                    iconCompat.b = parcelable;
                    return iconCompat;
                }
                ay0.e("Invalid icon");
                return null;
            case 0:
            default:
                return iconCompat;
            case 1:
            case 5:
                Parcelable parcelable2 = iconCompat.d;
                if (parcelable2 != null) {
                    iconCompat.b = parcelable2;
                    return iconCompat;
                }
                byte[] bArr3 = iconCompat.c;
                iconCompat.b = bArr3;
                iconCompat.a = 3;
                iconCompat.e = 0;
                iconCompat.f = bArr3.length;
                return iconCompat;
            case 2:
            case 4:
            case 6:
                String str = new String(iconCompat.c, Charset.forName("UTF-16"));
                iconCompat.b = str;
                if (iconCompat.a == 2 && iconCompat.j == null) {
                    iconCompat.j = str.split(":", -1)[0];
                }
                return iconCompat;
            case 3:
                iconCompat.b = iconCompat.c;
                return iconCompat;
        }
    }

    public static void write(IconCompat iconCompat, nse nseVar) {
        nseVar.getClass();
        iconCompat.i = iconCompat.h.name();
        switch (iconCompat.a) {
            case -1:
                iconCompat.d = (Parcelable) iconCompat.b;
                break;
            case 1:
            case 5:
                iconCompat.d = (Parcelable) iconCompat.b;
                break;
            case 2:
                iconCompat.c = ((String) iconCompat.b).getBytes(Charset.forName("UTF-16"));
                break;
            case 3:
                iconCompat.c = (byte[]) iconCompat.b;
                break;
            case 4:
            case 6:
                iconCompat.c = iconCompat.b.toString().getBytes(Charset.forName("UTF-16"));
                break;
        }
        int i = iconCompat.a;
        if (-1 != i) {
            nseVar.j(i, 1);
        }
        byte[] bArr = iconCompat.c;
        if (bArr != null) {
            nseVar.i(2);
            Parcel parcel = ((ose) nseVar).e;
            parcel.writeInt(bArr.length);
            parcel.writeByteArray(bArr);
        }
        Parcelable parcelable = iconCompat.d;
        if (parcelable != null) {
            nseVar.k(parcelable, 3);
        }
        int i2 = iconCompat.e;
        if (i2 != 0) {
            nseVar.j(i2, 4);
        }
        int i3 = iconCompat.f;
        if (i3 != 0) {
            nseVar.j(i3, 5);
        }
        ColorStateList colorStateList = iconCompat.g;
        if (colorStateList != null) {
            nseVar.k(colorStateList, 6);
        }
        String str = iconCompat.i;
        if (str != null) {
            nseVar.i(7);
            ((ose) nseVar).e.writeString(str);
        }
        String str2 = iconCompat.j;
        if (str2 != null) {
            nseVar.i(8);
            ((ose) nseVar).e.writeString(str2);
        }
    }
}
