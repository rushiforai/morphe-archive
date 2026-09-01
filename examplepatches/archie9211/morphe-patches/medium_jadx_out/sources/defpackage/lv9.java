package defpackage;

import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lv9 extends p92 {
    public PostMetaData b;
    public rj2 c;
    public String d;
    public /* synthetic */ Object e;
    public final /* synthetic */ sw9 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lv9(sw9 sw9Var, p92 p92Var) {
        super(p92Var);
        this.f = sw9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.h(null, null, this);
    }
}
