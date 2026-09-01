package defpackage;

import com.medium.android.graphql.type.CatalogVisibility;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i5e extends p92 {
    public String b;
    public CatalogVisibility c;
    public String d;
    public String e;
    public String f;
    public /* synthetic */ Object g;
    public final /* synthetic */ j5e h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i5e(j5e j5eVar, p92 p92Var) {
        super(p92Var);
        this.h = j5eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        return this.h.a(null, null, null, null, null, null, this);
    }
}
