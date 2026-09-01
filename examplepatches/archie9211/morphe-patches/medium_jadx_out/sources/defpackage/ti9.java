package defpackage;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.medium.android.graphql.fragment.CatalogItemPostData;
import com.medium.android.graphql.type.PostVisibilityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ti9 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sw9 b;

    public /* synthetic */ ti9(sw9 sw9Var, int i) {
        this.a = i;
        this.b = sw9Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
        boolean z = false;
        sw9 sw9Var = this.b;
        switch (i) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                String str = PqkdNGCEoxOKZk.UZeTSan + zBooleanValue;
                km4.I(wld.a, null, str, new Object[0], str);
                if (zBooleanValue) {
                    sw9Var.z();
                }
                return c1eVar;
            case 1:
                String str2 = (String) obj;
                str2.getClass();
                vx0.c0(f76.F(sw9Var), null, null, new dv9(sw9Var, str2, n92Var, 5), 3);
                return c1eVar;
            default:
                CatalogItemPostData catalogItemPostData = (CatalogItemPostData) obj;
                catalogItemPostData.getClass();
                if (!g76.L(catalogItemPostData.getPostPreviewData().getId(), sw9Var.b.getId()) && catalogItemPostData.getPostPreviewData().getPostVisibilityData().getVisibility() != PostVisibilityType.UNLISTED) {
                    z = true;
                }
                return Boolean.valueOf(z);
        }
    }
}
