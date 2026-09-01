package defpackage;

import java.security.GeneralSecurityException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ajg {
    public final HashMap a;
    public final HashMap b;
    public final HashMap c;
    public final HashMap d;

    public ajg(int i) {
        switch (i) {
            case 1:
                this.a = new HashMap();
                this.b = new HashMap();
                this.c = new HashMap();
                this.d = new HashMap();
                break;
            default:
                this.a = new HashMap();
                this.b = new HashMap();
                this.c = new HashMap();
                this.d = new HashMap();
                break;
        }
    }

    public void a(wfg wfgVar) throws GeneralSecurityException {
        wfgVar.getClass();
        zig zigVar = new zig(nig.class, wfgVar.a);
        HashMap map = this.b;
        if (!map.containsKey(zigVar)) {
            map.put(zigVar, wfgVar);
            return;
        }
        wfg wfgVar2 = (wfg) map.get(zigVar);
        if (!wfgVar2.equals(wfgVar) || wfgVar != wfgVar2) {
            throw new GeneralSecurityException("Attempt to register non-equal parser for already existing object of type: ".concat(String.valueOf(zigVar)));
        }
    }

    public void b(zfg zfgVar) throws GeneralSecurityException {
        cjg cjgVar = new cjg(zfgVar.a, nig.class);
        HashMap map = this.a;
        if (!map.containsKey(cjgVar)) {
            map.put(cjgVar, zfgVar);
            return;
        }
        zfg zfgVar2 = (zfg) map.get(cjgVar);
        if (!zfgVar2.equals(zfgVar) || zfgVar != zfgVar2) {
            throw new GeneralSecurityException("Attempt to register non-equal serializer for already existing object of type: ".concat(String.valueOf(cjgVar)));
        }
    }

    public void c(shg shgVar) throws GeneralSecurityException {
        shgVar.getClass();
        zig zigVar = new zig(lig.class, shgVar.a);
        HashMap map = this.d;
        if (!map.containsKey(zigVar)) {
            map.put(zigVar, shgVar);
            return;
        }
        shg shgVar2 = (shg) map.get(zigVar);
        if (!shgVar2.equals(shgVar) || shgVar != shgVar2) {
            throw new GeneralSecurityException("Attempt to register non-equal parser for already existing object of type: ".concat(String.valueOf(zigVar)));
        }
    }

    public void d(uhg uhgVar) throws GeneralSecurityException {
        cjg cjgVar = new cjg(uhgVar.a, lig.class);
        HashMap map = this.c;
        if (!map.containsKey(cjgVar)) {
            map.put(cjgVar, uhgVar);
            return;
        }
        uhg uhgVar2 = (uhg) map.get(cjgVar);
        if (!uhgVar2.equals(uhgVar) || uhgVar != uhgVar2) {
            throw new GeneralSecurityException("Attempt to register non-equal serializer for already existing object of type: ".concat(String.valueOf(cjgVar)));
        }
    }

    public void e(skg skgVar) throws GeneralSecurityException {
        vng vngVar = new vng(skgVar.a, ing.class);
        HashMap map = this.a;
        if (!map.containsKey(vngVar)) {
            map.put(vngVar, skgVar);
            return;
        }
        skg skgVar2 = (skg) map.get(vngVar);
        if (!skgVar2.equals(skgVar) || skgVar != skgVar2) {
            throw new GeneralSecurityException("Attempt to register non-equal serializer for already existing object of type: ".concat(vngVar.toString()));
        }
    }

    public void f(okg okgVar) throws GeneralSecurityException {
        okgVar.getClass();
        tng tngVar = new tng(ing.class, okgVar.a);
        HashMap map = this.b;
        if (!map.containsKey(tngVar)) {
            map.put(tngVar, okgVar);
            return;
        }
        okg okgVar2 = (okg) map.get(tngVar);
        if (!okgVar2.equals(okgVar) || okgVar != okgVar2) {
            throw new GeneralSecurityException("Attempt to register non-equal parser for already existing object of type: ".concat(tngVar.toString()));
        }
    }

    public void g(omg omgVar) throws GeneralSecurityException {
        vng vngVar = new vng(omgVar.a, kng.class);
        HashMap map = this.c;
        if (!map.containsKey(vngVar)) {
            map.put(vngVar, omgVar);
            return;
        }
        omg omgVar2 = (omg) map.get(vngVar);
        if (!omgVar2.equals(omgVar) || omgVar != omgVar2) {
            throw new GeneralSecurityException("Attempt to register non-equal serializer for already existing object of type: ".concat(vngVar.toString()));
        }
    }

    public void h(kmg kmgVar) throws GeneralSecurityException {
        kmgVar.getClass();
        tng tngVar = new tng(kng.class, kmgVar.a);
        HashMap map = this.d;
        if (!map.containsKey(tngVar)) {
            map.put(tngVar, kmgVar);
            return;
        }
        kmg kmgVar2 = (kmg) map.get(tngVar);
        if (!kmgVar2.equals(kmgVar) || kmgVar != kmgVar2) {
            throw new GeneralSecurityException("Attempt to register non-equal parser for already existing object of type: ".concat(tngVar.toString()));
        }
    }

    public ajg(wng wngVar) {
        this.a = new HashMap(wngVar.a);
        this.b = new HashMap(wngVar.b);
        this.c = new HashMap(wngVar.c);
        this.d = new HashMap(wngVar.d);
    }

    public ajg(wig wigVar) {
        this.a = new HashMap(wigVar.a);
        this.b = new HashMap(wigVar.b);
        this.c = new HashMap(wigVar.c);
        this.d = new HashMap(wigVar.d);
    }
}
