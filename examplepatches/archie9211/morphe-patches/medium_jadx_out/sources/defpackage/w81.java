package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import com.medium.android.catalogs.catalogdetail.CatalogDetailFragment;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w81 implements z81 {
    public final /* synthetic */ CatalogDetailFragment a;

    public w81(CatalogDetailFragment catalogDetailFragment) {
        this.a = catalogDetailFragment;
    }

    public final void a(String str, String str2, String str3, String str4, String str5) throws PendingIntent.CanceledException {
        str2.getClass();
        str3.getClass();
        CatalogDetailFragment catalogDetailFragment = this.a;
        catalogDetailFragment.Z();
        Context contextS = catalogDetailFragment.S();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new AbstractMediumFragment.BundleInfo(str5));
        bundle.putString("referrer_source", str5);
        bundle.putString("catalog_id", str2);
        bundle.putString("catalog_item_id", str3);
        bundle.putString("post_id", str4);
        bundle.putString("annotation", str);
        boolean z = false;
        if (str != null && (!muc.b0(str))) {
            z = true;
        }
        bundle.putBoolean("is_editing_annotation", z);
        m4.w(contextS, R.id.addNoteToListItemDialogFragment, bundle, null, 12);
    }
}
