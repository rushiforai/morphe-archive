package com.google.android.libraries.places.api.model;

import android.os.Parcelable;
import androidx.annotation.RecentlyNonNull;
import com.google.android.libraries.places.internal.zznx;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class AuthorAttributions implements Parcelable {
    @RecentlyNonNull
    public static AuthorAttributions newInstance(@RecentlyNonNull List<AuthorAttribution> list) {
        return new zzaq(zznx.zzj(list));
    }

    @RecentlyNonNull
    public abstract List<AuthorAttribution> asList();
}
