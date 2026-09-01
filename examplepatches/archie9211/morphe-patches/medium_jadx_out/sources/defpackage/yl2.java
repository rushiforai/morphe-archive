package defpackage;

import java.util.LinkedHashMap;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yl2 implements q44 {
    public static final z46 d = new z46();
    public static final yl2 e = new yl2(new LinkedHashMap(), null, null);
    public final Set a;
    public final Set b;
    public final LinkedHashMap c;

    static {
        new LinkedHashMap();
    }

    public yl2(LinkedHashMap linkedHashMap, Set set, Set set2) {
        this.a = set;
        this.b = set2;
        this.c = linkedHashMap;
    }

    @Override // defpackage.s44
    public final /* synthetic */ s44 a(r44 r44Var) {
        return ho2.b(this, r44Var);
    }

    @Override // defpackage.s44
    public final Object b(Object obj, p44 p44Var) {
        return p44Var.invoke(obj, this);
    }

    @Override // defpackage.s44
    public final /* synthetic */ s44 c(s44 s44Var) {
        return ho2.c(this, s44Var);
    }

    @Override // defpackage.s44
    public final /* synthetic */ q44 d(r44 r44Var) {
        return ho2.a(this, r44Var);
    }

    @Override // defpackage.q44
    public final r44 getKey() {
        return d;
    }
}
