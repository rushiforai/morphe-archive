package mx;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Parcel;
import android.os.Parcelable;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.CustomIcon;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Bitmap[] bitmapArr;
        Parcelable parcelable = parcel.readParcelable(NovaIconSource.class.getClassLoader());
        Intrinsics.d(parcelable);
        NovaIconSource novaIconSource = (NovaIconSource) parcelable;
        int i5 = parcel.readInt();
        int i11 = parcel.readInt();
        byte[] bArr = new byte[i11];
        parcel.readByteArray(bArr);
        BitmapInfo bitmapInfo = new BitmapInfo(BitmapFactory.decodeByteArray(bArr, 0, i11), i5);
        int i12 = parcel.readInt();
        byte[] bArr2 = new byte[i12];
        if (i12 == 0) {
            bitmapArr = null;
        } else {
            parcel.readByteArray(bArr2);
            int i13 = parcel.readInt();
            byte[] bArr3 = new byte[i13];
            parcel.readByteArray(bArr3);
            bitmapArr = new Bitmap[]{BitmapFactory.decodeByteArray(bArr2, 0, i12), BitmapFactory.decodeByteArray(bArr3, 0, i13)};
        }
        return new CustomIcon(novaIconSource, bitmapInfo, bitmapArr);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CustomIcon[i5];
    }
}
