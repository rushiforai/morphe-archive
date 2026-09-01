package defpackage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class jb9 implements xzb, p31 {
    public final String a;
    public final t75 b;
    public final int c;
    public int d = -1;
    public final String[] e;
    public final List[] f;
    public final boolean[] g;
    public Map h;
    public final vq6 i;
    public final vq6 j;
    public final vq6 k;

    public jb9(String str, t75 t75Var, int i) {
        this.a = str;
        this.b = t75Var;
        this.c = i;
        String[] strArr = new String[i];
        final int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            strArr[i3] = "[UNINITIALIZED]";
        }
        this.e = strArr;
        int i4 = this.c;
        this.f = new List[i4];
        this.g = new boolean[i4];
        this.h = fy3.a;
        yw6 yw6Var = yw6.PUBLICATION;
        this.i = vx0.d0(yw6Var, new m45(this) { // from class: ib9
            public final /* synthetic */ jb9 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i5 = i2;
                jb9 jb9Var = this.b;
                switch (i5) {
                    case 0:
                        t75 t75Var2 = jb9Var.b;
                        return t75Var2 != null ? t75Var2.c() : r40.f;
                    case 1:
                        return m40.G(jb9Var.b != null ? new ArrayList(0) : null);
                    default:
                        return Integer.valueOf(jq7.q(jb9Var, (xzb[]) jb9Var.j.getValue()));
                }
            }
        });
        final int i5 = 1;
        this.j = vx0.d0(yw6Var, new m45(this) { // from class: ib9
            public final /* synthetic */ jb9 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i52 = i5;
                jb9 jb9Var = this.b;
                switch (i52) {
                    case 0:
                        t75 t75Var2 = jb9Var.b;
                        return t75Var2 != null ? t75Var2.c() : r40.f;
                    case 1:
                        return m40.G(jb9Var.b != null ? new ArrayList(0) : null);
                    default:
                        return Integer.valueOf(jq7.q(jb9Var, (xzb[]) jb9Var.j.getValue()));
                }
            }
        });
        final int i6 = 2;
        this.k = vx0.d0(yw6Var, new m45(this) { // from class: ib9
            public final /* synthetic */ jb9 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i52 = i6;
                jb9 jb9Var = this.b;
                switch (i52) {
                    case 0:
                        t75 t75Var2 = jb9Var.b;
                        return t75Var2 != null ? t75Var2.c() : r40.f;
                    case 1:
                        return m40.G(jb9Var.b != null ? new ArrayList(0) : null);
                    default:
                        return Integer.valueOf(jq7.q(jb9Var, (xzb[]) jb9Var.j.getValue()));
                }
            }
        });
    }

    @Override // defpackage.xzb
    public final String a() {
        return this.a;
    }

    @Override // defpackage.p31
    public final Set b() {
        return this.h.keySet();
    }

    @Override // defpackage.xzb
    public final boolean c() {
        return false;
    }

    @Override // defpackage.xzb
    public final int d(String str) {
        str.getClass();
        Integer num = (Integer) this.h.get(str);
        if (num != null) {
            return num.intValue();
        }
        return -3;
    }

    @Override // defpackage.xzb
    public final int e() {
        return this.c;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof jb9) {
            xzb xzbVar = (xzb) obj;
            if (this.a.equals(xzbVar.a()) && Arrays.equals((xzb[]) this.j.getValue(), (xzb[]) ((jb9) obj).j.getValue())) {
                int iE = xzbVar.e();
                int i = this.c;
                if (i == iE) {
                    for (int i2 = 0; i2 < i; i2++) {
                        if (g76.L(h(i2).a(), xzbVar.h(i2).a()) && g76.L(h(i2).j(), xzbVar.h(i2).j())) {
                        }
                    }
                    return true;
                }
            }
        }
        return false;
    }

    @Override // defpackage.xzb
    public final String f(int i) {
        return this.e[i];
    }

    @Override // defpackage.xzb
    public final List g(int i) {
        List list = this.f[i];
        return list == null ? ey3.a : list;
    }

    @Override // defpackage.xzb
    public final List getAnnotations() {
        return ey3.a;
    }

    @Override // defpackage.xzb
    public xzb h(int i) {
        return ((pj6[]) this.i.getValue())[i].a();
    }

    public int hashCode() {
        return ((Number) this.k.getValue()).intValue();
    }

    public final void i(String str, boolean z) {
        str.getClass();
        int i = this.d + 1;
        this.d = i;
        String[] strArr = this.e;
        strArr[i] = str;
        this.g[i] = z;
        this.f[i] = null;
        if (i == this.c - 1) {
            HashMap map = new HashMap();
            int length = strArr.length;
            for (int i2 = 0; i2 < length; i2++) {
                map.put(strArr[i2], Integer.valueOf(i2));
            }
            this.h = map;
        }
    }

    @Override // defpackage.xzb
    public boolean isInline() {
        return false;
    }

    @Override // defpackage.xzb
    public mo7 j() {
        return wuc.e;
    }

    public String toString() {
        return bu1.F0(iq7.W(0, this.c), ", ", this.a.concat("("), ")", new eb8(6, this), 24);
    }
}
