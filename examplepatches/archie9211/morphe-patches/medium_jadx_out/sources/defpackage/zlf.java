package defpackage;

import j$.util.DesugarCollections;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zlf implements njg {
    public static final byte[] a = new byte[0];
    public static final byte[] b = {0};
    public static final pif c;

    static {
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        ylf ylfVar = ylf.zzc;
        aug augVar = aug.b;
        map.put(ylfVar, augVar);
        map2.put(augVar, ylfVar);
        ylf ylfVar2 = ylf.zzd;
        aug augVar2 = aug.c;
        map.put(ylfVar2, augVar2);
        map2.put(augVar2, ylfVar2);
        ylf ylfVar3 = ylf.zze;
        aug augVar3 = aug.d;
        map.put(ylfVar3, augVar3);
        map2.put(augVar3, ylfVar3);
        c = new pif(DesugarCollections.unmodifiableMap(map), DesugarCollections.unmodifiableMap(map2));
    }
}
