package com.google.android.libraries.places.api.model;

import android.os.Parcelable;
import androidx.annotation.RecentlyNonNull;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class AddressComponents implements Parcelable {
    @RecentlyNonNull
    public static AddressComponents newInstance(@RecentlyNonNull List<AddressComponent> list) {
        return new zzam(list);
    }

    @RecentlyNonNull
    public abstract List<AddressComponent> asList();
}
