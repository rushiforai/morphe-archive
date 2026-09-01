package defpackage;

import android.net.Uri;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public interface dle {
    void B(String str, g08 g08Var);

    void H(String str, String str2, g08 g08Var);

    void J(SourceParameter sourceParameter, String str, String str2);

    void X(Uri uri, SourceParameter sourceParameter);

    void b(boolean z);

    void c(CatalogItemType catalogItemType, String str, SourceParameter sourceParameter);

    void e(PostShareData postShareData, g08 g08Var);

    void i(String str, SourceParameter sourceParameter);

    void k(String str, SourceParameter sourceParameter);

    void l(SourceParameter sourceParameter, String str, String str2);

    void m(String str, SourceParameter sourceParameter);

    void q(SourceParameter sourceParameter);

    void r(SourceParameter sourceParameter, String str, String str2);

    void u(String str, SourceParameter sourceParameter);

    void z(SourceParameter sourceParameter, String str, String str2);
}
