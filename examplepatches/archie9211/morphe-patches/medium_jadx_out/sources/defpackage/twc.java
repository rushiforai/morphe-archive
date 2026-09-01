package defpackage;

import com.medium.android.core.models.EntityType;
import com.medium.android.graphql.fragment.NewsletterData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class twc extends p92 {
    public String b;
    public String c;
    public EntityType d;
    public Boolean e;
    public Boolean f;
    public NewsletterData g;
    public boolean h;
    public /* synthetic */ Object i;
    public final /* synthetic */ o2b j;
    public int k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public twc(o2b o2bVar, p92 p92Var) {
        super(p92Var);
        this.j = o2bVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.i = obj;
        this.k |= Integer.MIN_VALUE;
        return this.j.u(this, null, null, null, null, false);
    }
}
