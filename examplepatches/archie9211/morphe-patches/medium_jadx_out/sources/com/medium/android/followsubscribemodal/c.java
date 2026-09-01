package com.medium.android.followsubscribemodal;

import android.os.Bundle;
import com.medium.android.core.models.EntityType;
import com.medium.android.followsubscribemodal.FollowSubscribeModalFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class c {
    public static Bundle a(String str, EntityType entityType, String str2) {
        str.getClass();
        entityType.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new FollowSubscribeModalFragment.BundleInfo(str, entityType, str2));
        return bundle;
    }
}
