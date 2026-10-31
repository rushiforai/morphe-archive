package androidx.core.graphics.drawable;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.os.Parcel;
import android.os.Parcelable;
import java.nio.charset.Charset;
import k7.a;
import k7.b;

/* loaded from: classes2.dex */
public class IconCompatParcelizer {
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static IconCompat read(a aVar) {
        IconCompat iconCompat = new IconCompat();
        iconCompat.f14225a = aVar.f(iconCompat.f14225a, 1);
        byte[] bArr = iconCompat.f14227c;
        if (aVar.e(2)) {
            Parcel parcel = ((b) aVar).f71185e;
            int i5 = parcel.readInt();
            if (i5 < 0) {
                bArr = null;
            } else {
                byte[] bArr2 = new byte[i5];
                parcel.readByteArray(bArr2);
                bArr = bArr2;
            }
        }
        iconCompat.f14227c = bArr;
        iconCompat.f14228d = aVar.g(iconCompat.f14228d, 3);
        iconCompat.f14229e = aVar.f(iconCompat.f14229e, 4);
        iconCompat.f14230f = aVar.f(iconCompat.f14230f, 5);
        iconCompat.f14231g = (ColorStateList) aVar.g(iconCompat.f14231g, 6);
        String string = iconCompat.f14233i;
        if (aVar.e(7)) {
            string = ((b) aVar).f71185e.readString();
        }
        iconCompat.f14233i = string;
        String string2 = iconCompat.f14234j;
        if (aVar.e(8)) {
            string2 = ((b) aVar).f71185e.readString();
        }
        iconCompat.f14234j = string2;
        iconCompat.f14232h = PorterDuff.Mode.valueOf(iconCompat.f14233i);
        switch (iconCompat.f14225a) {
            case -1:
                Parcelable parcelable = iconCompat.f14228d;
                if (parcelable == null) {
                    throw new IllegalArgumentException("Invalid icon");
                }
                iconCompat.f14226b = parcelable;
                return iconCompat;
            case 0:
            default:
                return iconCompat;
            case 1:
            case 5:
                Parcelable parcelable2 = iconCompat.f14228d;
                if (parcelable2 != null) {
                    iconCompat.f14226b = parcelable2;
                    return iconCompat;
                }
                byte[] bArr3 = iconCompat.f14227c;
                iconCompat.f14226b = bArr3;
                iconCompat.f14225a = 3;
                iconCompat.f14229e = 0;
                iconCompat.f14230f = bArr3.length;
                return iconCompat;
            case 2:
            case 4:
            case 6:
                String str = new String(iconCompat.f14227c, Charset.forName("UTF-16"));
                iconCompat.f14226b = str;
                if (iconCompat.f14225a == 2 && iconCompat.f14234j == null) {
                    iconCompat.f14234j = str.split(":", -1)[0];
                }
                return iconCompat;
            case 3:
                iconCompat.f14226b = iconCompat.f14227c;
                return iconCompat;
        }
    }

    public static void write(IconCompat iconCompat, a aVar) {
        aVar.getClass();
        iconCompat.f14233i = iconCompat.f14232h.name();
        switch (iconCompat.f14225a) {
            case -1:
                iconCompat.f14228d = (Parcelable) iconCompat.f14226b;
                break;
            case 1:
            case 5:
                iconCompat.f14228d = (Parcelable) iconCompat.f14226b;
                break;
            case 2:
                iconCompat.f14227c = ((String) iconCompat.f14226b).getBytes(Charset.forName("UTF-16"));
                break;
            case 3:
                iconCompat.f14227c = (byte[]) iconCompat.f14226b;
                break;
            case 4:
            case 6:
                iconCompat.f14227c = iconCompat.f14226b.toString().getBytes(Charset.forName("UTF-16"));
                break;
        }
        int i5 = iconCompat.f14225a;
        if (-1 != i5) {
            aVar.j(i5, 1);
        }
        byte[] bArr = iconCompat.f14227c;
        if (bArr != null) {
            aVar.i(2);
            Parcel parcel = ((b) aVar).f71185e;
            parcel.writeInt(bArr.length);
            parcel.writeByteArray(bArr);
        }
        Parcelable parcelable = iconCompat.f14228d;
        if (parcelable != null) {
            aVar.k(parcelable, 3);
        }
        int i11 = iconCompat.f14229e;
        if (i11 != 0) {
            aVar.j(i11, 4);
        }
        int i12 = iconCompat.f14230f;
        if (i12 != 0) {
            aVar.j(i12, 5);
        }
        ColorStateList colorStateList = iconCompat.f14231g;
        if (colorStateList != null) {
            aVar.k(colorStateList, 6);
        }
        String str = iconCompat.f14233i;
        if (str != null) {
            aVar.i(7);
            ((b) aVar).f71185e.writeString(str);
        }
        String str2 = iconCompat.f14234j;
        if (str2 != null) {
            aVar.i(8);
            ((b) aVar).f71185e.writeString(str2);
        }
    }
}
