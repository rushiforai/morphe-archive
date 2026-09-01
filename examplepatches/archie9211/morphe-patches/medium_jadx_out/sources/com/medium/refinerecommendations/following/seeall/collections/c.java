package com.medium.refinerecommendations.following.seeall.collections;

import android.os.Bundle;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.refinerecommendations.following.seeall.collections.AllFollowedCollectionsFragment;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class c {
    public static Bundle a(int i, String str) {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable(ziYqbdHrAXvj.yUifGic, new AllFollowedCollectionsFragment.BundleInfo(str, i));
        return bundleA;
    }
}
