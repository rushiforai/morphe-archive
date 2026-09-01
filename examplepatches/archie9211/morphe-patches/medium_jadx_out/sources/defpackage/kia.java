package defpackage;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import com.medium.android.core.models.EntityType;
import com.medium.android.publication.ui.editors.PublicationEditorsFragment;
import com.medium.android.publication.ui.main.PublicationFragment;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kia implements sja {
    public final /* synthetic */ PublicationFragment a;

    public kia(PublicationFragment publicationFragment) {
        this.a = publicationFragment;
    }

    public final void a(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        PublicationFragment publicationFragment = this.a;
        publicationFragment.Z();
        Context contextS = publicationFragment.S();
        String strU = gp7.u(sourceParameter);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new PublicationEditorsFragment.BundleInfo(str, strU));
        m4.w(contextS, R.id.publicationEditorsFragment, bundle, null, 12);
    }

    public final void b(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        PublicationFragment publicationFragment = this.a;
        ((p13) publicationFragment.Z()).v0(publicationFragment.S(), str, EntityType.COLLECTION, str2, str3, gp7.u(sourceParameter));
    }

    public final void c(Uri uri, SourceParameter sourceParameter) {
        uri.getClass();
        sourceParameter.getClass();
        PublicationFragment publicationFragment = this.a;
        py2 py2Var = publicationFragment.v0;
        if (py2Var != null) {
            py2Var.a(publicationFragment.S(), uri, gp7.u(sourceParameter), null);
        } else {
            g76.g0("deepLinkHandler");
            throw null;
        }
    }

    public final void d(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        PublicationFragment publicationFragment = this.a;
        ((p13) publicationFragment.Z()).Q(publicationFragment.S(), str, gp7.u(sourceParameter));
    }
}
