package com.medium.android.core.susi;

import android.util.Patterns;
import com.medium.android.core.susi.SusiDestination;
import defpackage.tuc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a {
    public static final /* synthetic */ a a = new a();

    public static SusiDestination a(String str) {
        str.getClass();
        if (str.equals("/search")) {
            return SusiDestination.Search.INSTANCE;
        }
        if (str.equals("/new-story")) {
            return SusiDestination.NewStory.INSTANCE;
        }
        if (tuc.N(str, "/p", false)) {
            return new SusiDestination.Post(tuc.L(str, "/p/", ""));
        }
        if (Patterns.WEB_URL.matcher(str).matches()) {
            return new SusiDestination.Deeplink(str);
        }
        return null;
    }
}
