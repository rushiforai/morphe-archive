package com.medium.android.digest.ui.settings;

import android.os.Bundle;
import com.medium.android.digest.ui.settings.DigestSettingsFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class c {
    public static Bundle a(String str) {
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new DigestSettingsFragment.BundleInfo(str));
        return bundle;
    }
}
