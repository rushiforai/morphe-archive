package nh;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.Feature;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Feature f78240a;

    /* renamed from: b, reason: collision with root package name */
    public static final Feature[] f78241b;

    static {
        Feature feature = new Feature("GET_CREDENTIAL", 1L);
        f78240a = feature;
        f78241b = new Feature[]{feature, new Feature("CREDENTIAL_REGISTRY", 1L), new Feature("CLEAR_REGISTRY", 2L), new Feature("CLEAR_CREATION_OPTIONS", 1L), new Feature("CLEAR_CREDENTIAL_STATE", 1L), new Feature("CREATE_CREDENTIAL", 3L), new Feature("REGISTER_CREATION_OPTIONS", 1L), new Feature("REGISTER_EXPORT", 1L), new Feature("IMPORT_CREDENTIALS", 1L), new Feature("SIGNAL_CREDENTIAL_STATE", 1L), new Feature("CLEAR_EXPORT", 1L), new Feature("IMPORT_CREDENTIALS_FOR_DEVICE_SETUP", 3L), new Feature("EXPORT_CREDENTIALS_TO_DEVICE_SETUP", 3L), new Feature("GET_CREDENTIAL_TRANSFER_CAPABILITIES", 3L)};
    }

    public static Parcelable a(Parcel parcel, Parcelable.Creator creator) {
        if (parcel.readInt() == 0) {
            return null;
        }
        return (Parcelable) creator.createFromParcel(parcel);
    }

    public static void b(Parcel parcel, Parcelable parcelable) {
        if (parcelable == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcelable.writeToParcel(parcel, 0);
        }
    }
}
