package defpackage;

import java.util.Arrays;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class el1 {
    public final n98 a;
    public final x2b b;
    public final Collection c;
    public final x45 d;
    public final zk1[] e;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public el1(n98 n98Var, zk1[] zk1VarArr, x45 x45Var) {
        this(n98Var, null, null, x45Var, (zk1[]) Arrays.copyOf(zk1VarArr, zk1VarArr.length));
        n98Var.getClass();
    }

    public /* synthetic */ el1(n98 n98Var, zk1[] zk1VarArr) {
        this(n98Var, zk1VarArr, xx.p);
    }

    public el1(n98 n98Var, x2b x2bVar, Collection collection, x45 x45Var, zk1... zk1VarArr) {
        this.a = n98Var;
        this.b = x2bVar;
        this.c = collection;
        this.d = x45Var;
        this.e = zk1VarArr;
    }

    public /* synthetic */ el1(Collection collection, zk1[] zk1VarArr) {
        this(collection, zk1VarArr, xx.r);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public el1(Collection collection, zk1[] zk1VarArr, x45 x45Var) {
        this(null, null, collection, x45Var, (zk1[]) Arrays.copyOf(zk1VarArr, zk1VarArr.length));
        collection.getClass();
    }
}
