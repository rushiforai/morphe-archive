/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package com.facebook.browser.iabcontext;

import android.os.Parcel;
import android.os.Parcelable;

/** A stand-in with the kept name Instagram's browser launchers give this link context. */
public class IABOrganicContext implements Parcelable {
    public static final Creator<IABOrganicContext> CREATOR = new Creator<IABOrganicContext>() {
        @Override
        public IABOrganicContext createFromParcel(Parcel in) {
            return new IABOrganicContext();
        }

        @Override
        public IABOrganicContext[] newArray(int size) {
            return new IABOrganicContext[size];
        }
    };

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel out, int flags) {}
}
