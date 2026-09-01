package defpackage;

import java.util.LinkedHashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class nlc {
    public static final LinkedHashSet a;
    public static final mn1 b;

    static {
        List<y05> listR = d46.R(de6.a, de6.h, de6.i, de6.c, de6.d, de6.f);
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (y05 y05Var : listR) {
            y05Var.getClass();
            linkedHashSet.add(new mn1(y05Var.b(), y05Var.a.g()));
        }
        a = linkedHashSet;
        y05 y05Var2 = de6.g;
        y05Var2.getClass();
        b = new mn1(y05Var2.b(), y05Var2.a.g());
    }
}
