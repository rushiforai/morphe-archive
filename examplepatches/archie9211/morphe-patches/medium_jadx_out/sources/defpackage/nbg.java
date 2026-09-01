package defpackage;

import j$.util.DesugarCollections;
import java.security.GeneralSecurityException;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class nbg {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;
    public static final Map e;
    public static final Map f;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.AesSivKey");
        int i = 0;
        a = new uhg(dbg.class, new rbg(i));
        b = new shg(qvgVarC, new pbg(i));
        c = new zfg(vag.class, new ybg());
        d = new wfg(qvgVarC, new ubg(i));
        HashMap map = new HashMap();
        ntg ntgVar = ntg.RAW;
        bbg bbgVar = bbg.d;
        map.put(bbgVar, ntgVar);
        ntg ntgVar2 = ntg.TINK;
        bbg bbgVar2 = bbg.b;
        map.put(bbgVar2, ntgVar2);
        ntg ntgVar3 = ntg.CRUNCHY;
        bbg bbgVar3 = bbg.c;
        map.put(bbgVar3, ntgVar3);
        e = DesugarCollections.unmodifiableMap(map);
        EnumMap enumMap = new EnumMap(ntg.class);
        enumMap.put(ntgVar, bbgVar);
        enumMap.put(ntgVar2, bbgVar2);
        enumMap.put(ntgVar3, bbgVar3);
        enumMap.put(ntg.zzc, bbgVar3);
        f = DesugarCollections.unmodifiableMap(enumMap);
    }

    public static bbg a(ntg ntgVar) throws GeneralSecurityException {
        Map map = f;
        if (map.containsKey(ntgVar)) {
            return (bbg) map.get(ntgVar);
        }
        throw new GeneralSecurityException(b09.w(ntgVar.zza(), "Unable to parse OutputPrefixType: "));
    }
}
