package defpackage;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.medium.android.graphql.fragment.FullPostData;
import com.medium.android.graphql.fragment.PostMetaData;
import java.util.ArrayList;
import java.util.List;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class su9 implements tu9 {
    public final FullPostData a;
    public final PostMetaData b;
    public final List c;
    public final List d;
    public final boolean e;
    public final mq9 f;
    public final iv0 g;
    public final boolean h;

    public su9(FullPostData fullPostData, PostMetaData postMetaData, List list, List list2, boolean z, mq9 mq9Var, iv0 iv0Var, boolean z2) {
        fullPostData.getClass();
        postMetaData.getClass();
        list.getClass();
        list2.getClass();
        mq9Var.getClass();
        iv0Var.getClass();
        this.a = fullPostData;
        this.b = postMetaData;
        this.c = list;
        this.d = list2;
        this.e = z;
        this.f = mq9Var;
        this.g = iv0Var;
        this.h = z2;
    }

    public static su9 a(su9 su9Var, ArrayList arrayList, mq9 mq9Var, iv0 iv0Var, int i) {
        FullPostData fullPostData = su9Var.a;
        PostMetaData postMetaData = su9Var.b;
        List list = arrayList;
        if ((i & 4) != 0) {
            list = su9Var.c;
        }
        List list2 = list;
        List list3 = su9Var.d;
        boolean z = su9Var.e;
        if ((i & 32) != 0) {
            mq9Var = su9Var.f;
        }
        mq9 mq9Var2 = mq9Var;
        if ((i & 64) != 0) {
            iv0Var = su9Var.g;
        }
        iv0 iv0Var2 = iv0Var;
        boolean z2 = su9Var.h;
        su9Var.getClass();
        fullPostData.getClass();
        postMetaData.getClass();
        list2.getClass();
        list3.getClass();
        mq9Var2.getClass();
        iv0Var2.getClass();
        return new su9(fullPostData, postMetaData, list2, list3, z, mq9Var2, iv0Var2, z2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof su9)) {
            return false;
        }
        su9 su9Var = (su9) obj;
        return g76.L(this.a, su9Var.a) && g76.L(this.b, su9Var.b) && g76.L(this.c, su9Var.c) && g76.L(this.d, su9Var.d) && this.e == su9Var.e && g76.L(this.f, su9Var.f) && g76.L(this.g, su9Var.g) && this.h == su9Var.h;
    }

    public final int hashCode() {
        return ((this.g.hashCode() + ((this.f.hashCode() + ((wgd.p(wgd.p((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c), 31, this.d) + (this.e ? 1231 : 1237)) * 31)) * 31)) * 31) + (this.h ? 1231 : 1237);
    }

    public final String toString() {
        return PqkdNGCEoxOKZk.PbISJLywEbU + this.a + ", postMetaData=" + this.b + ", postViewModels=" + this.c + ", highlightedTexts=" + this.d + ", isPaywalled=" + this.e + ", topBarUiModel=" + this.f + ", bottomActionBarUiModel=" + this.g + AEVqIoD.SsiIDW + this.h + ")";
    }
}
