package defpackage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class b2 implements iwa, gx, xu {
    public final /* synthetic */ int a;
    public Object b;

    public b2(int i) {
        this.a = i;
        switch (i) {
            case 4:
                break;
            case 5:
                this.b = new Object();
                break;
            case 6:
                this.b = qo7.u(Boolean.FALSE);
                break;
            default:
                k68 k68Var = j46.a;
                this.b = new k68();
                break;
        }
    }

    public static /* synthetic */ void f0(int i) {
        String str = (i == 1 || i == 2) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 1 || i == 2) ? 2 : 3];
        if (i == 1 || i == 2) {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/resolve/scopes/receivers/AbstractReceiverValue";
        } else {
            objArr[0] = "receiverType";
        }
        if (i == 1) {
            objArr[1] = "getType";
        } else if (i != 2) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/resolve/scopes/receivers/AbstractReceiverValue";
        } else {
            objArr[1] = "getOriginal";
        }
        if (i != 1 && i != 2) {
            objArr[2] = "<init>";
        }
        String str2 = String.format(str, objArr);
        if (i != 1 && i != 2) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    public static /* synthetic */ void h0(int i) {
        String str = i != 1 ? "Argument for @NotNull parameter '%s' of %s.%s must not be null" : "@NotNull method %s.%s must not return null";
        Object[] objArr = new Object[i != 1 ? 3 : 2];
        if (i != 1) {
            objArr[0] = "annotations";
        } else {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/annotations/AnnotatedImpl";
        }
        if (i != 1) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/annotations/AnnotatedImpl";
        } else {
            objArr[1] = "getAnnotations";
        }
        if (i != 1) {
            objArr[2] = "<init>";
        }
        String str2 = String.format(str, objArr);
        if (i == 1) {
            throw new IllegalStateException(str2);
        }
    }

    @Override // defpackage.xu
    public List a0() {
        return (List) this.b;
    }

    @Override // defpackage.xu
    public boolean b0() {
        List list = (List) this.b;
        return list.isEmpty() || (list.size() == 1 && ((uk6) list.get(0)).c());
    }

    @Override // defpackage.gx
    public ly getAnnotations() {
        ly lyVar = (ly) this.b;
        if (lyVar != null) {
            return lyVar;
        }
        h0(1);
        throw null;
    }

    @Override // defpackage.iwa
    public mn6 getType() {
        mn6 mn6Var = (mn6) this.b;
        if (mn6Var != null) {
            return mn6Var;
        }
        f0(1);
        throw null;
    }

    public abstract void i0(n0c n0cVar);

    public abstract void j0(xyb xybVar);

    public abstract void k0();

    public abstract void l0();

    public abstract zt6 m0(int i, int i2, int i3, long j);

    public String n0() {
        return null;
    }

    public abstract Object o0();

    public List p0(yt6 yt6Var, int i, long j) {
        k68 k68Var = (k68) this.b;
        List list = (List) k68Var.b(i);
        if (list != null) {
            return list;
        }
        List listA = yt6Var.a(i);
        int size = listA.size();
        ArrayList arrayList = new ArrayList(size);
        int iQ = 0;
        while (iQ < size) {
            iQ = km4.q((tk7) listA.get(iQ), j, arrayList, iQ, 1);
        }
        k68Var.i(i, arrayList);
        return arrayList;
    }

    public abstract Object q0();

    public abstract x45 r0(xyb xybVar);

    public abstract void s0(wj1 wj1Var);

    public abstract void t0(Object obj);

    public String toString() {
        switch (this.a) {
            case 2:
                StringBuilder sb = new StringBuilder();
                List list = (List) this.b;
                if (!list.isEmpty()) {
                    sb.append("values=");
                    sb.append(Arrays.toString(list.toArray()));
                }
                return sb.toString();
            default:
                return super.toString();
        }
    }

    public abstract void u0(dsd dsdVar);

    public abstract void v0();

    public b2(ly lyVar) {
        this.a = 1;
        if (lyVar != null) {
            this.b = lyVar;
        } else {
            h0(0);
            throw null;
        }
    }

    public b2(mn6 mn6Var) {
        this.a = 0;
        if (mn6Var != null) {
            this.b = mn6Var;
        } else {
            f0(0);
            throw null;
        }
    }

    public b2(List list) {
        this.a = 2;
        this.b = list;
    }
}
