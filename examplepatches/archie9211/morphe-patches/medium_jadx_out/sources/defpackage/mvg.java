package defpackage;

import j$.util.DesugarCollections;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.security.interfaces.ECPublicKey;
import java.util.Arrays;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mvg implements njg {
    public static final byte[] g = new byte[0];
    public static final byte[] h = {0};
    public static final pif i;
    public static final pif j;
    public static final pif k;
    public final ECPublicKey a;
    public final String b;
    public final ulf c;
    public final byte[] d;
    public final byte[] e;
    public final Provider f;

    static {
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        ylf ylfVar = ylf.zzc;
        d1g d1gVar = d1g.A;
        map.put(ylfVar, d1gVar);
        map2.put(d1gVar, ylfVar);
        ylf ylfVar2 = ylf.zzd;
        d1g d1gVar2 = d1g.B;
        map.put(ylfVar2, d1gVar2);
        map2.put(d1gVar2, ylfVar2);
        ylf ylfVar3 = ylf.zze;
        d1g d1gVar3 = d1g.C;
        map.put(ylfVar3, d1gVar3);
        map2.put(d1gVar3, ylfVar3);
        i = new pif(DesugarCollections.unmodifiableMap(map), DesugarCollections.unmodifiableMap(map2));
        HashMap map3 = new HashMap();
        HashMap map4 = new HashMap();
        ulf ulfVar = ulf.zza;
        d2g d2gVar = d2g.f;
        map3.put(ulfVar, d2gVar);
        map4.put(d2gVar, ulfVar);
        ulf ulfVar2 = ulf.zzb;
        d2g d2gVar2 = d2g.g;
        map3.put(ulfVar2, d2gVar2);
        map4.put(d2gVar2, ulfVar2);
        j = new pif(DesugarCollections.unmodifiableMap(map3), DesugarCollections.unmodifiableMap(map4));
        HashMap map5 = new HashMap();
        HashMap map6 = new HashMap();
        nlf nlfVar = nlf.zza;
        grg grgVar = grg.c;
        map5.put(nlfVar, grgVar);
        map6.put(grgVar, nlfVar);
        nlf nlfVar2 = nlf.zzb;
        grg grgVar2 = grg.d;
        map5.put(nlfVar2, grgVar2);
        map6.put(grgVar2, nlfVar2);
        nlf nlfVar3 = nlf.zzc;
        grg grgVar3 = grg.e;
        map5.put(nlfVar3, grgVar3);
        map6.put(grgVar3, nlfVar3);
        k = new pif(DesugarCollections.unmodifiableMap(map5), DesugarCollections.unmodifiableMap(map6));
    }

    public mvg(ECPublicKey eCPublicKey, ylf ylfVar, ulf ulfVar, byte[] bArr, byte[] bArr2, Provider provider) throws GeneralSecurityException {
        if (!hk7.M(2)) {
            ygf.l("Can not use ECDSA in FIPS-mode, as BoringCrypto is not available.");
            throw null;
        }
        ek7.P(ylfVar);
        this.b = ylfVar.toString().concat("withECDSA");
        this.a = eCPublicKey;
        this.c = ulfVar;
        this.d = bArr;
        this.e = bArr2;
        this.f = provider;
    }

    /* JADX WARN: Removed duplicated region for block: B:61:0x010f  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0134 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(byte[] r18, byte[] r19) throws java.security.GeneralSecurityException {
        /*
            Method dump skipped, instruction units count: 317
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mvg.a(byte[], byte[]):void");
    }

    @Override // defpackage.njg
    public final void b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArr3 = this.d;
        int length = bArr3.length;
        if (length == 0) {
            a(bArr, bArr2);
        } else if (aog.b(bArr3, bArr)) {
            a(Arrays.copyOfRange(bArr, length, bArr.length), bArr2);
        } else {
            ygf.l("Invalid signature (output prefix mismatch)");
        }
    }
}
