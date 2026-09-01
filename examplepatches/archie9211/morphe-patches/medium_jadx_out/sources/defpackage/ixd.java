package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ixd {
    public static final ixd b = new ixd(exd.a);
    public final exd a;

    public ixd(exd exdVar) {
        this.a = exdVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0021 A[FALL_THROUGH] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00b8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ void a(int r13) {
        /*
            Method dump skipped, instruction units count: 660
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ixd.a(int):void");
    }

    public static pqe b(pqe pqeVar, pqe pqeVar2) {
        if (pqeVar == null) {
            a(38);
            throw null;
        }
        if (pqeVar2 == null) {
            a(39);
            throw null;
        }
        pqe pqeVar3 = pqe.INVARIANT;
        if (pqeVar == pqeVar3) {
            if (pqeVar2 != null) {
                return pqeVar2;
            }
            a(40);
            throw null;
        }
        if (pqeVar2 == pqeVar3) {
            if (pqeVar != null) {
                return pqeVar;
            }
            a(41);
            throw null;
        }
        if (pqeVar == pqeVar2) {
            if (pqeVar2 != null) {
                return pqeVar2;
            }
            a(42);
            throw null;
        }
        throw new AssertionError("Variance conflict: type parameter variance '" + pqeVar + "' and projection kind '" + pqeVar2 + "' cannot be combined");
    }

    public static hxd c(pqe pqeVar, pqe pqeVar2) {
        pqe pqeVar3 = pqe.IN_VARIANCE;
        return (pqeVar == pqeVar3 && pqeVar2 == pqe.OUT_VARIANCE) ? hxd.OUT_IN_IN_POSITION : (pqeVar == pqe.OUT_VARIANCE && pqeVar2 == pqeVar3) ? hxd.IN_IN_OUT_POSITION : hxd.NO_CONFLICT;
    }

    public static ixd d(mn6 mn6Var) {
        if (mn6Var == null) {
            a(6);
            throw null;
        }
        return new ixd(bwd.b.n(mn6Var.j0(), mn6Var.h0()));
    }

    public static ixd e(exd exdVar, exd exdVar2) {
        if (exdVar == null) {
            a(3);
            throw null;
        }
        if (exdVar2 == null) {
            a(4);
            throw null;
        }
        if (exdVar.e()) {
            exdVar = exdVar2;
        } else if (!exdVar2.e()) {
            exdVar = new vf3(exdVar, exdVar2);
        }
        return new ixd(exdVar);
    }

    public static String g(Object obj) {
        try {
            return obj.toString();
        } catch (Throwable th) {
            if (guc.M(th)) {
                throw th;
            }
            return y30.p("[Exception while computing toString(): ", "]", th);
        }
    }

    public final mn6 f(mn6 mn6Var, pqe pqeVar) {
        if (mn6Var == null) {
            a(9);
            throw null;
        }
        if (pqeVar == null) {
            a(10);
            throw null;
        }
        if (this.a.e()) {
            return mn6Var;
        }
        try {
            mn6 mn6VarB = i(new onc(mn6Var, pqeVar), null, 0).b();
            if (mn6VarB != null) {
                return mn6VarB;
            }
            a(12);
            throw null;
        } catch (gxd e) {
            return l24.c(k24.UNABLE_TO_SUBSTITUTE_TYPE, e.getMessage());
        }
    }

    public final mn6 h(mn6 mn6Var, pqe pqeVar) throws gxd {
        if (mn6Var == null) {
            a(14);
            throw null;
        }
        if (pqeVar == null) {
            a(15);
            throw null;
        }
        exd exdVar = this.a;
        xwd oncVar = new onc(exdVar.f(mn6Var, pqeVar), pqeVar);
        if (!exdVar.e()) {
            try {
                oncVar = i(oncVar, null, 0);
            } catch (gxd unused) {
                oncVar = null;
            }
        }
        if (exdVar.a() || exdVar.b()) {
            boolean zB = exdVar.b();
            if (oncVar == null) {
                oncVar = null;
            } else if (!oncVar.c()) {
                mn6 mn6VarB = oncVar.b();
                mn6VarB.getClass();
                if (nxd.c(mn6VarB, xx.o, null)) {
                    pqe pqeVarA = oncVar.a();
                    pqeVarA.getClass();
                    if (pqeVarA == pqe.OUT_VARIANCE) {
                        oncVar = new onc((mn6) hlg.k(mn6VarB).b, pqeVarA);
                    } else if (zB) {
                        oncVar = new onc((mn6) hlg.k(mn6VarB).a, pqeVarA);
                    } else {
                        l61 l61Var = new l61();
                        ixd ixdVar = new ixd(l61Var);
                        if (!l61Var.e()) {
                            try {
                                oncVar = ixdVar.i(oncVar, null, 0);
                            } catch (gxd unused2) {
                                oncVar = null;
                            }
                        }
                    }
                }
            }
        }
        if (oncVar == null) {
            return null;
        }
        return oncVar.b();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0248  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0131  */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.xwd i(defpackage.xwd r18, defpackage.swd r19, int r20) throws defpackage.gxd {
        /*
            Method dump skipped, instruction units count: 775
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ixd.i(xwd, swd, int):xwd");
    }
}
