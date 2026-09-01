package com.google.firebase;

import com.google.firebase.components.ComponentRegistrar;
import defpackage.d46;
import defpackage.hy1;
import defpackage.iy1;
import defpackage.kb2;
import defpackage.om0;
import defpackage.ps0;
import defpackage.rqa;
import defpackage.rzd;
import defpackage.s73;
import defpackage.tz7;
import defpackage.u3b;
import defpackage.wz7;
import defpackage.y3b;
import defpackage.yy6;
import java.util.List;
import java.util.concurrent.Executor;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0019\u0010\u0006\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00050\u0004H\u0016¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/google/firebase/FirebaseCommonKtxRegistrar;", "Lcom/google/firebase/components/ComponentRegistrar;", "<init>", "()V", "", "Liy1;", "getComponents", "()Ljava/util/List;", "com.google.firebase-firebase-common"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class FirebaseCommonKtxRegistrar implements ComponentRegistrar {
    @Override // com.google.firebase.components.ComponentRegistrar
    public List<iy1> getComponents() {
        hy1 hy1VarA = iy1.a(new rqa(om0.class, kb2.class));
        hy1VarA.a(new s73(new rqa(om0.class, Executor.class), 1, 0));
        hy1VarA.f = tz7.h;
        iy1 iy1VarB = hy1VarA.b();
        hy1 hy1VarA2 = iy1.a(new rqa(yy6.class, kb2.class));
        hy1VarA2.a(new s73(new rqa(yy6.class, Executor.class), 1, 0));
        hy1VarA2.f = wz7.e;
        iy1 iy1VarB2 = hy1VarA2.b();
        hy1 hy1VarA3 = iy1.a(new rqa(ps0.class, kb2.class));
        hy1VarA3.a(new s73(new rqa(ps0.class, Executor.class), 1, 0));
        hy1VarA3.f = u3b.e;
        iy1 iy1VarB3 = hy1VarA3.b();
        hy1 hy1VarA4 = iy1.a(new rqa(rzd.class, kb2.class));
        hy1VarA4.a(new s73(new rqa(rzd.class, Executor.class), 1, 0));
        hy1VarA4.f = y3b.f;
        return d46.R(iy1VarB, iy1VarB2, iy1VarB3, hy1VarA4.b());
    }
}
