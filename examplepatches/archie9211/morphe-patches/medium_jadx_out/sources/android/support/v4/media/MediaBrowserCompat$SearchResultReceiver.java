package android.support.v4.media;

import android.os.Bundle;
import android.os.Parcelable;
import defpackage.ejb;
import defpackage.zm7;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
class MediaBrowserCompat$SearchResultReceiver extends ejb {
    @Override // defpackage.ejb
    public final void a(int i, Bundle bundle) {
        if (bundle != null) {
            bundle = zm7.W(bundle);
        }
        if (i != 0 || bundle == null || !bundle.containsKey("search_results")) {
            throw null;
        }
        Parcelable[] parcelableArray = bundle.getParcelableArray("search_results");
        parcelableArray.getClass();
        ArrayList arrayList = new ArrayList(parcelableArray.length);
        for (Parcelable parcelable : parcelableArray) {
            arrayList.add((MediaBrowserCompat$MediaItem) parcelable);
        }
        throw null;
    }
}
