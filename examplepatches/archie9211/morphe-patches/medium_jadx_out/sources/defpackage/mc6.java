package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mc6 implements pj6 {
    public static final mc6 a = new mc6();
    public static final u0a b;

    static {
        r0a r0aVar = r0a.m;
        if (muc.b0("kotlinx.serialization.json.JsonLiteral")) {
            ay0.e("Blank serial names are prohibited");
            return;
        }
        Object it2 = ((fh7) y0a.a.values()).iterator();
        while (((ch7) it2).hasNext()) {
            pj6 pj6Var = (pj6) ((ah7) it2).next();
            if ("kotlinx.serialization.json.JsonLiteral".equals(pj6Var.a().a())) {
                ay0.e(nuc.B("\n                The name of serial descriptor should uniquely identify associated serializer.\n                For serial name kotlinx.serialization.json.JsonLiteral there already exists " + n1b.a.b(pj6Var.getClass()).j() + ".\n                Please refer to SerialDescriptor documentation for additional information.\n            "));
                return;
            }
        }
        b = new u0a("kotlinx.serialization.json.JsonLiteral", r0aVar);
    }

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        lc6 lc6Var = (lc6) obj;
        lc6Var.getClass();
        String str = lc6Var.b;
        k40.L(xtcVar);
        if (lc6Var.a) {
            xtcVar.r(str);
            return;
        }
        Long lP = tuc.P(str);
        if (lP != null) {
            xtcVar.k(lP.longValue());
            return;
        }
        ezd ezdVarQ = fo7.Q(str);
        if (ezdVarQ != null) {
            xtcVar.h(izd.b).k(ezdVarQ.a);
            return;
        }
        Boolean bool = null;
        Double dValueOf = suc.D(str) ? Double.valueOf(Double.parseDouble(str)) : null;
        if (dValueOf != null) {
            xtcVar.e(dValueOf.doubleValue());
            return;
        }
        if (str.equals("true")) {
            bool = Boolean.TRUE;
        } else if (str.equals("false")) {
            bool = Boolean.FALSE;
        }
        if (bool != null) {
            xtcVar.b(bool.booleanValue());
        } else {
            xtcVar.r(str);
        }
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        cc6 cc6VarC0 = k40.K(kw2Var).C0();
        if (cc6VarC0 instanceof lc6) {
            return (lc6) cc6VarC0;
        }
        StringBuilder sb = new StringBuilder("Unexpected JSON element, expected JsonLiteral, had ");
        throw m40.r(-1, cc6VarC0.toString(), ka1.p(n1b.a, cc6VarC0.getClass(), sb));
    }
}
