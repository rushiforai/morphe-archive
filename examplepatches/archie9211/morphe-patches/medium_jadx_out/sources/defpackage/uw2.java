package defpackage;

import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class uw2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ zw2 b;
    public final /* synthetic */ Collection c;
    public final /* synthetic */ f31 d;

    public /* synthetic */ uw2(zw2 zw2Var, Collection collection, f31 f31Var, int i) {
        this.a = i;
        this.b = zw2Var;
        this.c = collection;
        this.d = f31Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        f31 f31Var = this.d;
        Collection collection = this.c;
        zw2 zw2Var = this.b;
        switch (i) {
        }
        return zw2Var.a().d(collection, f31Var);
    }
}
