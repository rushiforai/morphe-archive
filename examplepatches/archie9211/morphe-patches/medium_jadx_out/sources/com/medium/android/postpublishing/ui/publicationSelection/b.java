package com.medium.android.postpublishing.ui.publicationSelection;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z;
        boolean z2;
        PublicationData.PublicationRole publicationRole;
        boolean z3;
        PublicationData.PublishStatePreference publishStatePreference;
        boolean z4;
        parcel.getClass();
        String string = parcel.readString();
        String string2 = parcel.readString();
        String string3 = parcel.readString();
        String string4 = parcel.readString();
        boolean z5 = false;
        if (parcel.readInt() != 0) {
            z = false;
            z5 = true;
        } else {
            z = false;
        }
        PublicationData.PublicationRole publicationRoleValueOf = PublicationData.PublicationRole.valueOf(parcel.readString());
        if (parcel.readInt() != 0) {
            z2 = true;
            publicationRole = publicationRoleValueOf;
            z3 = true;
        } else {
            z2 = true;
            publicationRole = publicationRoleValueOf;
            z3 = z;
        }
        PublicationData.PublishStatePreference publishStatePreferenceValueOf = PublicationData.PublishStatePreference.valueOf(parcel.readString());
        if (parcel.readInt() != 0) {
            z4 = z2;
            publishStatePreference = publishStatePreferenceValueOf;
        } else {
            publishStatePreference = publishStatePreferenceValueOf;
            z4 = z;
        }
        return new PublicationData(string, string2, string3, string4, z5, publicationRole, z3, publishStatePreference, z4);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i) {
        return new PublicationData[i];
    }
}
