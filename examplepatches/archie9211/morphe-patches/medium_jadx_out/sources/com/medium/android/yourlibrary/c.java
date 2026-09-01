package com.medium.android.yourlibrary;

import android.os.Bundle;
import com.medium.android.yourlibrary.YourLibraryFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class c {
    public static Bundle a(YourLibraryTab yourLibraryTab, String str, String str2) {
        str.getClass();
        yourLibraryTab.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new YourLibraryFragment.BundleInfo(yourLibraryTab, str2, str));
        return bundle;
    }

    public static /* synthetic */ Bundle b(String str, YourLibraryTab yourLibraryTab, int i) {
        if ((i & 2) != 0) {
            yourLibraryTab = YourLibraryTab.YOUR_LISTS;
        }
        return a(yourLibraryTab, str, null);
    }
}
