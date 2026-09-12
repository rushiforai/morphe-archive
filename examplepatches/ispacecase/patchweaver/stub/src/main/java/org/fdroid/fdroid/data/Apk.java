package org.fdroid.fdroid.data;

import android.os.Parcel;
import android.os.Parcelable;

/** Stub matching org.fdroid.fdroid.data.Apk from org.fdroid.fdroid 1.23.2 (1023052). Compile-only:
 * never instantiated here, only ever received as a real Parcelable instance from the app. */
public class Apk implements Parcelable {
    public String packageName;
    public long size;
    public int targetSdkVersion;
    public long versionCode;

    @Override
    public int describeContents() {
        throw new AssertionError("stub");
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        throw new AssertionError("stub");
    }
}
