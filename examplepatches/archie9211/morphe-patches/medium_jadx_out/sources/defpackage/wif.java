package defpackage;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wif {
    public static final Set b = Collections.newSetFromMap(new WeakHashMap());
    public final zd5 a;

    public wif(zd5 zd5Var) {
        this.a = zd5Var;
    }

    public final nkf a(nkf nkfVar) {
        nkfVar.zak();
        zd5 zd5Var = this.a;
        ee5 ee5Var = zd5Var.k;
        ee5Var.getClass();
        ajf ajfVar = new ajf(new fjf(nkfVar), ee5Var.i.get(), zd5Var);
        tjf tjfVar = ee5Var.m;
        tjfVar.sendMessage(tjfVar.obtainMessage(4, ajfVar));
        return nkfVar;
    }
}
