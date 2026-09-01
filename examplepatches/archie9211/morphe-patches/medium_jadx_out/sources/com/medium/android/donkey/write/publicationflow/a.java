package com.medium.android.donkey.write.publicationflow;

import android.content.Context;
import android.content.Intent;
import com.medium.android.donkey.write.publicationflow.PublicationFlowActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class a {
    public static Intent a(Context context, PublicationFlowActivity.BundleInfo bundleInfo) {
        Intent intent = new Intent(context, (Class<?>) PublicationFlowActivity.class);
        intent.putExtra("POST_ID_KEY", bundleInfo.getPostId());
        intent.putExtra("REFERRER_SOURCE_KEY", bundleInfo.getReferrerSource());
        intent.putExtra("DESTINATION_KEY", bundleInfo.getDestination());
        return intent;
    }
}
