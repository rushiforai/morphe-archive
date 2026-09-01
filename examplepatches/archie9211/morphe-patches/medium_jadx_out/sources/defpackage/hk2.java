package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hk2 extends p92 {
    public UserDismissableFlags b;
    public Set c;
    public Object d;
    public /* synthetic */ Object e;
    public final /* synthetic */ zk2 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hk2(zk2 zk2Var, p92 p92Var) {
        super(p92Var);
        this.f = zk2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        Object objB = this.f.b(null, this);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : new bjb(objB);
    }
}
