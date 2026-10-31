package com.teslacoilsw.launcher.theme;

import android.os.Parcel;
import android.os.Parcelable;
import com.teslacoilsw.launcher.theme.ThemeListFragment;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        return new ThemeListFragment.ThemePackageInfo(parcel);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ThemeListFragment.ThemePackageInfo[i5];
    }
}
