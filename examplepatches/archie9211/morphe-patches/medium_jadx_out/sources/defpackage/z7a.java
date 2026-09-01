package defpackage;

import com.google.firebase.encoders.EncodingException;
import java.io.ByteArrayOutputStream;
import java.security.GeneralSecurityException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z7a {
    public final HashMap a;
    public final HashMap b;

    public z7a(int i) {
        switch (i) {
            case 2:
                this.a = new HashMap();
                this.b = new HashMap();
                break;
            default:
                this.a = new HashMap();
                this.b = new HashMap();
                break;
        }
    }

    public void a(Object obj, ByteArrayOutputStream byteArrayOutputStream) {
        HashMap map = this.b;
        HashMap map2 = this.a;
        y7a y7aVar = new y7a(byteArrayOutputStream, map2, map);
        lm8 lm8Var = (lm8) map2.get(obj.getClass());
        if (lm8Var != null) {
            lm8Var.a(obj, y7aVar);
            return;
        }
        throw new EncodingException("No encoder for " + obj.getClass());
    }

    public void b(cig cigVar) throws GeneralSecurityException {
        if (cigVar == null) {
            z72.c("primitive constructor must be non-null");
            return;
        }
        iig iigVar = new iig(cigVar.a, cigVar.b);
        HashMap map = this.a;
        if (!map.containsKey(iigVar)) {
            map.put(iigVar, cigVar);
            return;
        }
        cig cigVar2 = (cig) map.get(iigVar);
        if (!cigVar2.equals(cigVar) || cigVar != cigVar2) {
            throw new GeneralSecurityException("Attempt to register non-equal PrimitiveConstructor object for already existing object of type: ".concat(String.valueOf(iigVar)));
        }
    }

    public void c(xmg xmgVar) throws GeneralSecurityException {
        bng bngVar = new bng(xmgVar.a, xmgVar.b);
        HashMap map = this.a;
        if (!map.containsKey(bngVar)) {
            map.put(bngVar, xmgVar);
            return;
        }
        xmg xmgVar2 = (xmg) map.get(bngVar);
        if (!xmgVar2.equals(xmgVar) || xmgVar != xmgVar2) {
            throw new GeneralSecurityException("Attempt to register non-equal PrimitiveConstructor object for already existing object of type: ".concat(bngVar.toString()));
        }
    }

    public /* synthetic */ z7a(eng engVar) {
        this.a = new HashMap(engVar.a);
        this.b = new HashMap(engVar.b);
    }

    public z7a(gig gigVar) {
        this.a = new HashMap(gigVar.a);
        this.b = new HashMap(gigVar.b);
    }

    public z7a(HashMap map, HashMap map2) {
        this.a = map;
        this.b = map2;
    }
}
