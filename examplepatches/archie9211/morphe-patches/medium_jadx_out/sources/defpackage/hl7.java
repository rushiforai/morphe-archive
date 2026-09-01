package defpackage;

import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hl7 implements ro0 {
    public final c72 a;
    public Map b;
    public final LinkedHashMap c;
    public final LinkedHashMap d;
    public final qpc e;
    public final int[] f;
    public final int[] g;

    public hl7(m73 m73Var) {
        c72 c72Var = new c72(0, 0);
        c72Var.r0 = new ArrayList();
        c72Var.s0 = new m50(c72Var);
        w73 w73Var = new w73(c72Var);
        c72Var.t0 = w73Var;
        c72Var.v0 = null;
        c72Var.w0 = false;
        c72Var.x0 = new wz6();
        c72Var.A0 = 0;
        c72Var.B0 = 0;
        c72Var.C0 = new pj1[4];
        c72Var.D0 = new pj1[4];
        c72Var.E0 = 257;
        c72Var.F0 = false;
        c72Var.G0 = false;
        c72Var.H0 = null;
        c72Var.I0 = null;
        c72Var.J0 = null;
        c72Var.K0 = null;
        c72Var.L0 = new HashSet();
        c72Var.M0 = new qo0();
        c72Var.v0 = this;
        w73Var.h = this;
        this.a = c72Var;
        this.b = new LinkedHashMap();
        this.c = new LinkedHashMap();
        this.d = new LinkedHashMap();
        this.e = new qpc(m73Var);
        this.f = new int[2];
        this.g = new int[2];
    }

    public static void d(a72 a72Var, int i, int i2, int i3, boolean z, boolean z2, int i4, int[] iArr) {
        int i5 = gl7.a[a72Var.ordinal()];
        if (i5 == 1) {
            iArr[0] = i;
            iArr[1] = i;
            return;
        }
        if (i5 == 2) {
            iArr[0] = 0;
            iArr[1] = i4;
            return;
        }
        if (i5 == 3) {
            boolean z3 = z2 || ((i3 == 1 || i3 == 2) && (i3 == 2 || i2 != 1 || z));
            iArr[0] = z3 ? i : 0;
            if (!z3) {
                i = i4;
            }
            iArr[1] = i;
            return;
        }
        if (i5 == 4) {
            iArr[0] = i4;
            iArr[1] = i4;
        } else {
            throw new IllegalStateException((a72Var + " is not supported").toString());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x019a  */
    @Override // defpackage.ro0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(defpackage.b72 r28, defpackage.qo0 r29) {
        /*
            Method dump skipped, instruction units count: 498
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hl7.b(b72, qo0):void");
    }

    public final long c(b72 b72Var, long j) {
        Object obj = b72Var.h0;
        String str = b72Var.k;
        int i = 0;
        if (b72Var instanceof dwe) {
            int i2 = f72.f(j) ? 1073741824 : f72.d(j) ? Integer.MIN_VALUE : 0;
            if (f72.e(j)) {
                i = 1073741824;
            } else if (f72.c(j)) {
                i = Integer.MIN_VALUE;
            }
            dwe dweVar = (dwe) b72Var;
            dweVar.X(i2, f72.h(j), i, f72.g(j));
            return f46.a(dweVar.y0, dweVar.z0);
        }
        if (obj instanceof tk7) {
            t99 t99VarS = ((tk7) obj).s(j);
            this.b.put(obj, t99VarS);
            return f46.a(t99VarS.a, t99VarS.b);
        }
        Log.w("CCL", "Nothing to measure for widget: " + str);
        return f46.a(0, 0);
    }

    public final void e(s99 s99Var, List list, Map map) {
        b72 b72Var;
        t99 t99Var;
        s99 s99Var2;
        this.b = map;
        LinkedHashMap linkedHashMap = this.d;
        boolean zIsEmpty = linkedHashMap.isEmpty();
        c72 c72Var = this.a;
        if (zIsEmpty) {
            ArrayList arrayList = c72Var.r0;
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                b72 b72Var2 = (b72) arrayList.get(i);
                Object obj = b72Var2.h0;
                if (obj instanceof tk7) {
                    i3f i3fVar = b72Var2.j;
                    b72 b72Var3 = i3fVar.a;
                    if (b72Var3 != null) {
                        i3fVar.b = b72Var3.s();
                        i3fVar.c = b72Var3.t();
                        i3fVar.d = b72Var3.s() + b72Var3.W;
                        i3fVar.e = b72Var3.t() + b72Var3.X;
                        i3fVar.c(b72Var3.j);
                    }
                    linkedHashMap.put(il7.x((tk7) obj), new i3f(i3fVar));
                }
            }
        }
        int size2 = list.size();
        int i2 = 0;
        while (i2 < size2) {
            tk7 tk7Var = (tk7) list.get(i2);
            i3f i3fVar2 = (i3f) linkedHashMap.get(il7.x(tk7Var));
            if (i3fVar2 == null || (t99Var = (t99) this.b.get(tk7Var)) == null || i3fVar2.q == 8) {
                s99Var2 = s99Var;
            } else if (Float.isNaN(i3fVar2.h) && Float.isNaN(i3fVar2.i) && Float.isNaN(i3fVar2.j) && Float.isNaN(i3fVar2.k) && Float.isNaN(i3fVar2.l) && Float.isNaN(i3fVar2.m) && Float.isNaN(i3fVar2.n) && Float.isNaN(i3fVar2.o) && Float.isNaN(i3fVar2.p)) {
                s99.i(s99Var, t99Var, (((long) i3fVar2.c) & 4294967295L) | (((long) i3fVar2.b) << 32));
                s99Var2 = s99Var;
            } else {
                s99Var2 = s99Var;
                s99Var2.n(t99Var, i3fVar2.b, i3fVar2.c, Float.isNaN(i3fVar2.m) ? 0.0f : i3fVar2.m, new ce(12, i3fVar2));
            }
            i2++;
            s99Var = s99Var2;
        }
        if (op6.BOUNDS == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("{   root: {interpolated: { left:  0,  top:  0,");
            sb.append("  right:   " + c72Var.r() + " ,");
            sb.append("  bottom:  " + c72Var.l() + " ,");
            sb.append(" } }");
            for (b72 b72Var4 : c72Var.r0) {
                Object obj2 = b72Var4.h0;
                if (obj2 instanceof tk7) {
                    if (b72Var4.k == null) {
                        tk7 tk7Var2 = (tk7) obj2;
                        Object objF = kng.F(tk7Var2);
                        if (objF == null) {
                            tk7Var2.w();
                            objF = null;
                        }
                        b72Var4.k = objF != null ? objF.toString() : null;
                    }
                    i3f i3fVar3 = (i3f) linkedHashMap.get(il7.x((tk7) obj2));
                    i3f i3fVar4 = (i3fVar3 == null || (b72Var = i3fVar3.a) == null) ? null : b72Var.j;
                    if (i3fVar4 != null) {
                        sb.append(" " + b72Var4.k + ": {");
                        sb.append(" interpolated : ");
                        HashMap map2 = i3fVar4.r;
                        sb.append("{\n");
                        i3f.a(sb, i3fVar4.b, "left");
                        i3f.a(sb, i3fVar4.c, "top");
                        i3f.a(sb, i3fVar4.d, "right");
                        i3f.a(sb, i3fVar4.e, "bottom");
                        i3f.b(sb, "pivotX", i3fVar4.f);
                        i3f.b(sb, "pivotY", i3fVar4.g);
                        i3f.b(sb, "rotationX", i3fVar4.h);
                        i3f.b(sb, "rotationY", i3fVar4.i);
                        i3f.b(sb, "rotationZ", i3fVar4.j);
                        i3f.b(sb, "translationX", i3fVar4.k);
                        i3f.b(sb, "translationY", i3fVar4.l);
                        i3f.b(sb, "translationZ", i3fVar4.m);
                        i3f.b(sb, "scaleX", i3fVar4.n);
                        i3f.b(sb, "scaleY", i3fVar4.o);
                        i3f.b(sb, "alpha", i3fVar4.p);
                        i3f.a(sb, i3fVar4.q, "visibility");
                        i3f.b(sb, "interpolatedPos", Float.NaN);
                        b72 b72Var5 = i3fVar4.a;
                        if (b72Var5 != null) {
                            for (k52 k52Var : k52.values()) {
                                l52 l52VarJ = b72Var5.j(k52Var);
                                if (l52VarJ != null && l52VarJ.f != null) {
                                    sb.append("Anchor");
                                    sb.append(k52Var.name());
                                    sb.append(": ['");
                                    String str = l52VarJ.f.d.k;
                                    if (str == null) {
                                        str = "#PARENT";
                                    }
                                    sb.append(str);
                                    sb.append("', '");
                                    sb.append(l52VarJ.f.e.name());
                                    sb.append("', '");
                                    sb.append(l52VarJ.g);
                                    sb.append("'],\n");
                                }
                            }
                        }
                        i3f.b(sb, "phone_orientation", Float.NaN);
                        i3f.b(sb, "phone_orientation", Float.NaN);
                        if (map2.size() != 0) {
                            sb.append("custom : {\n");
                            for (String str2 : map2.keySet()) {
                                jm2 jm2Var = (jm2) map2.get(str2);
                                sb.append(str2);
                                sb.append(": ");
                                switch (jm2Var.b) {
                                    case 900:
                                        sb.append(jm2Var.c);
                                        sb.append(",\n");
                                        break;
                                    case 901:
                                        sb.append(jm2Var.d);
                                        sb.append(",\n");
                                        break;
                                    case 902:
                                        sb.append("'");
                                        sb.append(jm2.a(jm2Var.c));
                                        sb.append("',\n");
                                        break;
                                    case 903:
                                        sb.append("'");
                                        sb.append((String) null);
                                        sb.append("',\n");
                                        break;
                                }
                            }
                            sb.append("}\n");
                        }
                        sb.append("}\n");
                        sb.append("}, ");
                    }
                } else if (b72Var4 instanceof sh5) {
                    sb.append(" " + b72Var4.k + ": {");
                    sh5 sh5Var = (sh5) b72Var4;
                    if (sh5Var.v0 == 0) {
                        sb.append(" type: 'hGuideline', ");
                    } else {
                        sb.append(" type: 'vGuideline', ");
                    }
                    sb.append(" interpolated: ");
                    sb.append(" { left: " + sh5Var.s() + ", top: " + sh5Var.t() + ", right: " + (sh5Var.r() + sh5Var.s()) + ", bottom: " + (sh5Var.l() + sh5Var.t()) + " }");
                    sb.append("}, ");
                }
            }
            sb.append(" }");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:108:0x02a4  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00dd A[LOOP:1: B:39:0x00d7->B:41:0x00dd, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x013d  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x016b  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01a9  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01e8  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0230  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long f(long r19, defpackage.ip6 r21, defpackage.m62 r22, java.util.List r23, java.util.LinkedHashMap r24) {
        /*
            Method dump skipped, instruction units count: 761
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hl7.f(long, ip6, m62, java.util.List, java.util.LinkedHashMap):long");
    }

    @Override // defpackage.ro0
    public final void a() {
    }
}
