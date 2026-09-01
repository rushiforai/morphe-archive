package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zy9 {
    public final List a;
    public final List[] b;
    public int c;
    public int d;
    public boolean e;
    public final /* synthetic */ az9 f;

    public zy9(az9 az9Var, List list) {
        this.f = az9Var;
        this.a = list;
        this.b = new List[list.size()];
        if (list.isEmpty()) {
            e26.a("NestedPrefetchController shouldn't be created with no states");
        }
    }
}
