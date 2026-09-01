package defpackage;

import j$.util.DesugarCollections;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class bmf implements njg {
    public static final pif a;
    public static final byte[] b;
    public static final byte[] c;

    static {
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        ylf ylfVar = ylf.zzc;
        oug ougVar = oug.b;
        map.put(ylfVar, ougVar);
        map2.put(ougVar, ylfVar);
        ylf ylfVar2 = ylf.zzd;
        oug ougVar2 = oug.c;
        map.put(ylfVar2, ougVar2);
        map2.put(ougVar2, ylfVar2);
        ylf ylfVar3 = ylf.zze;
        oug ougVar3 = oug.d;
        map.put(ylfVar3, ougVar3);
        map2.put(ougVar3, ylfVar3);
        a = new pif(DesugarCollections.unmodifiableMap(map), DesugarCollections.unmodifiableMap(map2));
        b = new byte[0];
        c = new byte[]{0};
    }
}
