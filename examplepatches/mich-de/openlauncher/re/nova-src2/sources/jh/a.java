package jh;

import android.os.BadParcelableException;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.gms.common.Feature;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Feature f69558a;

    /* renamed from: b, reason: collision with root package name */
    public static final Feature f69559b;

    /* renamed from: c, reason: collision with root package name */
    public static final Feature[] f69560c;

    static {
        Feature feature = new Feature("CLIENT_TELEMETRY", 1L);
        f69558a = feature;
        Feature feature2 = new Feature("CLIENT_NOTIFICATION_TELEMETRY", 1L);
        f69559b = feature2;
        f69560c = new Feature[]{feature, feature2};
    }

    public static Parcelable a(Parcel parcel, Parcelable.Creator creator) {
        if (parcel.readInt() == 0) {
            return null;
        }
        return (Parcelable) creator.createFromParcel(parcel);
    }

    public static void b(Parcel parcel) {
        int iDataAvail = parcel.dataAvail();
        if (iDataAvail > 0) {
            throw new BadParcelableException(c0.p(new StringBuilder(String.valueOf(iDataAvail).length() + 45), "Parcel data not fully consumed, unread size: ", iDataAvail));
        }
    }
}
