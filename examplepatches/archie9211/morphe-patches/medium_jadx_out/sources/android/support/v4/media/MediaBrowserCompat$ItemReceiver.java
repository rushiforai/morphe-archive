package android.support.v4.media;

import android.os.Bundle;
import android.os.Parcelable;
import defpackage.ejb;
import defpackage.zm7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
class MediaBrowserCompat$ItemReceiver extends ejb {
    @Override // defpackage.ejb
    public final void a(int i, Bundle bundle) {
        if (bundle != null) {
            bundle = zm7.W(bundle);
        }
        if (i != 0 || bundle == null || !bundle.containsKey("media_item")) {
            throw null;
        }
        Parcelable parcelable = bundle.getParcelable("media_item");
        if (parcelable != null && !(parcelable instanceof MediaBrowserCompat$MediaItem)) {
            throw null;
        }
        throw null;
    }
}
