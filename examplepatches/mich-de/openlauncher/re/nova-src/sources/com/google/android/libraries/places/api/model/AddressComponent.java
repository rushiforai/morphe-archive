package com.google.android.libraries.places.api.model;

import android.os.Parcelable;
import android.text.TextUtils;
import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.google.android.libraries.places.internal.zzmt;
import com.google.android.libraries.places.internal.zznx;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class AddressComponent implements Parcelable {

    public static abstract class Builder {
        @RecentlyNonNull
        public AddressComponent build() {
            AddressComponent addressComponentZzc = zzc();
            zzmt.zzp(!addressComponentZzc.getName().isEmpty(), "Name must not be empty.");
            List<String> types = addressComponentZzc.getTypes();
            Iterator<String> it = types.iterator();
            while (it.hasNext()) {
                zzmt.zzp(!TextUtils.isEmpty(it.next()), "Types must not contain null or empty values.");
            }
            zzb(zznx.zzj(types));
            return zzc();
        }

        @RecentlyNullable
        public abstract String getShortName();

        @RecentlyNonNull
        public abstract Builder setShortName(String str);

        public abstract Builder zzb(List list);

        public abstract AddressComponent zzc();
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull String str, @RecentlyNonNull List<String> list) {
        zza zzaVar = new zza();
        zzaVar.zza(str);
        zzaVar.zzb(list);
        return zzaVar;
    }

    @RecentlyNonNull
    public abstract String getName();

    @RecentlyNullable
    public abstract String getShortName();

    @RecentlyNonNull
    public abstract List<String> getTypes();
}
