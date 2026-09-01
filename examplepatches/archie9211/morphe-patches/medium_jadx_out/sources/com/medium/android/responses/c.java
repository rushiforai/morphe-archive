package com.medium.android.responses;

import android.os.Bundle;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.responses.ResponsesFragment;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class c {
    public static Bundle a(ResponsesReference responsesReference, String str) {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new ResponsesFragment.BundleInfo(responsesReference, str));
        return bundleA;
    }
}
