package com.google.android.libraries.places.api.net;

import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;

/* loaded from: classes3.dex */
public abstract class IsOpenResponse {
    @RecentlyNonNull
    public static IsOpenResponse newInstance(Boolean bool) {
        return new zzx(bool);
    }

    @RecentlyNullable
    public abstract Boolean isOpen();
}
