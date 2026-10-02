/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package com.facebook.browser.iabcontext;

import android.os.Parcel;
import android.os.Parcelable;

/** A stand-in with the kept name Instagram's browser launchers give this link context. */
public class IABAdsContext implements Parcelable {
    public static final Creator<IABAdsContext> CREATOR = new Creator<IABAdsContext>() {
        @Override
        public IABAdsContext createFromParcel(Parcel in) {
            return new IABAdsContext();
        }

        @Override
        public IABAdsContext[] newArray(int size) {
            return new IABAdsContext[size];
        }
    };

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel out, int flags) {}
}
