package defpackage;

import android.content.Context;
import com.android.installreferrer.api.InstallReferrerClient;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q36 extends p4d implements b55 {
    public final /* synthetic */ Context b;
    public final /* synthetic */ v16 c;
    public final /* synthetic */ qn7 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q36(Context context, v16 v16Var, qn7 qn7Var, n92 n92Var) {
        super(2, n92Var);
        this.b = context;
        this.c = v16Var;
        this.d = qn7Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new q36(this.b, this.c, this.d, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        q36 q36Var = (q36) create((sb2) obj, (n92) obj2);
        c1e c1eVar = c1e.a;
        q36Var.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        InstallReferrerClient installReferrerClientBuild = InstallReferrerClient.newBuilder(this.b).build();
        installReferrerClientBuild.startConnection(new ku3(installReferrerClientBuild, this.c, this.d, 11));
        return c1e.a;
    }
}
