package ih;

import android.os.BadParcelableException;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.gms.common.Feature;

/* loaded from: classes3.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final Feature f61598a;

    /* renamed from: b, reason: collision with root package name */
    public static final Feature[] f61599b;

    static {
        Feature feature = new Feature("auth_api_credentials_begin_sign_in", 9L);
        Feature feature2 = new Feature("auth_api_credentials_sign_out", 2L);
        f61598a = feature2;
        f61599b = new Feature[]{feature, feature2, new Feature("auth_api_credentials_authorize", 1L), new Feature("auth_api_credentials_revoke_access", 1L), new Feature("auth_api_credentials_save_password", 4L), new Feature("auth_api_credentials_get_sign_in_intent", 6L), new Feature("auth_api_credentials_save_account_linking_token", 3L), new Feature("auth_api_credentials_get_phone_number_hint_intent", 3L), new Feature("auth_api_credentials_verify_with_google", 1L), new Feature("auth_api_credentials_credential_provider", 1L)};
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
            throw new BadParcelableException(c0.h(iDataAvail, "Parcel data not fully consumed, unread size: "));
        }
    }

    public static void c(Parcel parcel, Parcelable parcelable) {
        if (parcelable == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcelable.writeToParcel(parcel, 0);
        }
    }
}
