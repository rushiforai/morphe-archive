package com.medium.android.donkey.write.publicationflow;

import android.content.Context;
import android.content.Intent;
import com.medium.android.donkey.write.publicationflow.PublicationFlowActivity;
import defpackage.f7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b extends f7 {
    @Override // defpackage.f7
    public final Intent a(Context context, Object obj) {
        PublicationFlowActivity.BundleInfo bundleInfo = (PublicationFlowActivity.BundleInfo) obj;
        bundleInfo.getClass();
        int i = PublicationFlowActivity.p;
        return a.a(context, bundleInfo);
    }

    @Override // defpackage.f7
    public final Object c(int i, Intent intent) {
        return Boolean.valueOf(i == -1);
    }
}
