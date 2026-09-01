package com.medium.android.highlightdetail;

import android.os.Bundle;
import com.medium.android.core.navigation.HighlightReference;
import com.medium.android.highlightdetail.HighlightDetailBottomSheetFragment;
import defpackage.ho2;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class c {
    public static Bundle a(HighlightReference highlightReference, SourceParameter sourceParameter, String str, String str2) {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new HighlightDetailBottomSheetFragment.BundleInfo(highlightReference, sourceParameter, str2, str));
        return bundleA;
    }
}
