package w20;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import com.teslacoilsw.launcher.util.NamedIntent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        try {
            String string = parcel.readString();
            Intrinsics.d(string);
            Intent intent = (Intent) parcel.readParcelable(Intent.class.getClassLoader());
            Parcelable parcelable = parcel.readParcelable(UserHandle.class.getClassLoader());
            Intrinsics.d(parcelable);
            return new NamedIntent(string, intent, (UserHandle) parcelable);
        } catch (Exception unused) {
            return NamedIntent.f46367d;
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new NamedIntent[i5];
    }
}
