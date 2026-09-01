package defpackage;

import android.net.Uri;
import android.widget.ImageView;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.models.ReadingContext;
import com.medium.android.core.navigation.HighlightReference;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public interface oi9 {
    void E(SourceParameter sourceParameter, String str, String str2);

    void F(String str, String str2);

    void G(String str, String str2);

    void H(String str, SourceParameter sourceParameter);

    void I(String str, SourceParameter sourceParameter);

    void J(ResponsesReference.Post post, String str);

    void K(String str, String str2, String str3);

    void L(String str, SourceParameter sourceParameter);

    void M(String str, String str2);

    void N(String str, EntityType entityType, SourceParameter sourceParameter);

    void O(PostShareData postShareData, String str, String str2, String str3);

    void P(String str, g08 g08Var);

    void Q(String str, String str2, g08 g08Var);

    void R(String str);

    void S(SourceParameter sourceParameter, String str, String str2, String str3, String str4);

    void T(String str, String str2);

    void U(Uri uri, String str);

    void V(CatalogItemType catalogItemType, String str, String str2);

    void W(String str);

    void X(UpsellInfo upsellInfo, String str);

    void Y(String str, String str2);

    void Z(String str);

    void a();

    void a0(HighlightReference highlightReference, SourceParameter sourceParameter, String str, String str2);

    void b(SourceParameter sourceParameter, String str, String str2);

    void b0();

    void c(SourceParameter sourceParameter, String str, String str2);

    void c0(String str, String str2);

    void d(String str, String str2);

    void d0(String str, String str2, String str3);

    void e0(String str, String str2, String str3, ReadingContext readingContext);

    void f(String str, String str2);

    void f0(String str, String str2);

    void g(PostShareData postShareData, g08 g08Var);

    void g0(String str, String str2);

    void h(String str, SourceParameter sourceParameter);

    void h0(String str, g08 g08Var);

    void i(SourceParameter sourceParameter, String str, String str2);

    void i0(String str, String str2);

    void j(String str, String str2);

    void j0(String str, String str2, String str3, Integer num, Integer num2, String str4, ImageView imageView, cx7 cx7Var);

    void k(String str, String str2);

    void k0(String str, String str2, String str3, String str4, boolean z);

    void l(String str, String str2);

    void l0(String str, EntityType entityType, String str2, String str3, String str4);

    void m0(String str);

    void n0(String str, String str2);

    void o(String str, String str2);

    void o0();
}
