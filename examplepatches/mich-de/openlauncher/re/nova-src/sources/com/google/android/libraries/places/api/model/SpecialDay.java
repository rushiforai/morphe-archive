package com.google.android.libraries.places.api.model;

import android.os.Parcelable;
import androidx.annotation.RecentlyNonNull;

/* loaded from: classes3.dex */
public abstract class SpecialDay implements Parcelable {

    public static abstract class Builder {
        @RecentlyNonNull
        public abstract SpecialDay build();

        @RecentlyNonNull
        public abstract LocalDate getDate();

        public abstract boolean isExceptional();

        @RecentlyNonNull
        public abstract Builder setDate(@RecentlyNonNull LocalDate localDate);

        @RecentlyNonNull
        public abstract Builder setExceptional(boolean z11);
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull LocalDate localDate) {
        zzaf zzafVar = new zzaf();
        zzafVar.setDate(localDate);
        zzafVar.setExceptional(false);
        return zzafVar;
    }

    @RecentlyNonNull
    public abstract LocalDate getDate();

    public abstract boolean isExceptional();
}
