package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class onc extends xwd {
    public final /* synthetic */ int a = 1;
    public final Object b;
    public final Object c;

    public onc(swd swdVar) {
        swdVar.getClass();
        this.b = swdVar;
        this.c = vx0.d0(yw6.PUBLICATION, new bx6(9, this));
    }

    public static /* synthetic */ void e(int i) {
        String str = (i == 4 || i == 5) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 4 || i == 5) ? 2 : 3];
        switch (i) {
            case 1:
            case 2:
            case 3:
                objArr[0] = "type";
                break;
            case 4:
            case 5:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/types/TypeProjectionImpl";
                break;
            case 6:
                objArr[0] = "kotlinTypeRefiner";
                break;
            default:
                objArr[0] = "projection";
                break;
        }
        if (i == 4) {
            objArr[1] = "getProjectionKind";
        } else if (i != 5) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/types/TypeProjectionImpl";
        } else {
            objArr[1] = "getType";
        }
        if (i == 3) {
            objArr[2] = "replaceType";
        } else if (i != 4 && i != 5) {
            if (i != 6) {
                objArr[2] = "<init>";
            } else {
                objArr[2] = "refine";
            }
        }
        String str2 = String.format(str, objArr);
        if (i != 4 && i != 5) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @Override // defpackage.xwd
    public final pqe a() {
        switch (this.a) {
            case 0:
                return pqe.OUT_VARIANCE;
            default:
                pqe pqeVar = (pqe) this.b;
                if (pqeVar != null) {
                    return pqeVar;
                }
                e(4);
                throw null;
        }
    }

    @Override // defpackage.xwd
    public final mn6 b() {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                return (mn6) ((vq6) obj).getValue();
            default:
                mn6 mn6Var = (mn6) obj;
                if (mn6Var != null) {
                    return mn6Var;
                }
                e(5);
                throw null;
        }
    }

    @Override // defpackage.xwd
    public final boolean c() {
        switch (this.a) {
            case 0:
                return true;
            default:
                return false;
        }
    }

    @Override // defpackage.xwd
    public final xwd d(sn6 sn6Var) {
        switch (this.a) {
            case 0:
                return this;
            default:
                pqe pqeVar = (pqe) this.b;
                mn6 mn6Var = (mn6) this.c;
                mn6Var.getClass();
                return new onc(mn6Var, pqeVar);
        }
    }

    public onc(mn6 mn6Var, pqe pqeVar) {
        if (pqeVar == null) {
            e(0);
            throw null;
        }
        if (mn6Var != null) {
            this.b = pqeVar;
            this.c = mn6Var;
        } else {
            e(1);
            throw null;
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public onc(mn6 mn6Var) {
        this(mn6Var, pqe.INVARIANT);
        if (mn6Var != null) {
        } else {
            e(2);
            throw null;
        }
    }
}
