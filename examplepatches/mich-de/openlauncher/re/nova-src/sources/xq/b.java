package xq;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.AppInfo;
import com.stripe.android.core.StripeError;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96221a;

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        LinkedHashMap linkedHashMap;
        switch (this.f96221a) {
            case 0:
                Intrinsics.g(parcel, "parcel");
                return new AppInfo(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
            default:
                Intrinsics.g(parcel, "parcel");
                String string = parcel.readString();
                String string2 = parcel.readString();
                String string3 = parcel.readString();
                String string4 = parcel.readString();
                String string5 = parcel.readString();
                String string6 = parcel.readString();
                String string7 = parcel.readString();
                if (parcel.readInt() == 0) {
                    linkedHashMap = null;
                } else {
                    int i5 = parcel.readInt();
                    LinkedHashMap linkedHashMap2 = new LinkedHashMap(i5);
                    for (int i11 = 0; i11 != i5; i11++) {
                        linkedHashMap2.put(parcel.readString(), parcel.readString());
                    }
                    linkedHashMap = linkedHashMap2;
                }
                return new StripeError(string, string2, string3, string4, string5, string6, string7, linkedHashMap);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f96221a) {
            case 0:
                return new AppInfo[i5];
            default:
                return new StripeError[i5];
        }
    }
}
