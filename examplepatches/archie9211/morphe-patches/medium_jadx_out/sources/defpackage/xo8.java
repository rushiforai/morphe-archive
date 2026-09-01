package defpackage;

import com.medium.android.graphql.fragment.CatalogDetailData;
import com.medium.android.graphql.fragment.CatalogSummaryData;
import com.medium.android.graphql.fragment.OfflineCatalogResult;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xo8 extends p92 {
    public OfflineCatalogResult b;
    public CatalogSummaryData c;
    public CatalogDetailData d;
    public OfflineCatalogResult.OnCatalog e;
    public String f;
    public List g;
    public List h;
    public boolean i;
    public /* synthetic */ Object j;
    public final /* synthetic */ yo8 k;
    public int l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xo8(yo8 yo8Var, p92 p92Var) {
        super(p92Var);
        this.k = yo8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.j = obj;
        this.l |= Integer.MIN_VALUE;
        return this.k.o(null, this);
    }
}
