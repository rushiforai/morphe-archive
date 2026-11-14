package com.facebook.user.model;

import android.os.Parcel;
import android.os.Parcelable;

/** Stands in for Messenger's user key: who a presence update or a typing broadcast is about, by their user id. */
public final class UserKey implements Parcelable {
    public final String id;

    public UserKey(String id) {
        this.id = id;
    }

    @Override public int describeContents() {
        return 0;
    }

    @Override public void writeToParcel(Parcel out, int flags) {
        out.writeString(id);
    }

    public static final Creator<UserKey> CREATOR = new Creator<UserKey>() {
        @Override public UserKey createFromParcel(Parcel in) {
            return new UserKey(in.readString());
        }

        @Override public UserKey[] newArray(int size) {
            return new UserKey[size];
        }
    };
}
