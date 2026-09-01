package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class eta implements en6 {
    public final /* synthetic */ int a;
    public final /* synthetic */ gta b;

    public /* synthetic */ eta(gta gtaVar, int i) {
        this.a = i;
        this.b = gtaVar;
    }

    @Override // defpackage.en6
    public final void b() {
        int i = this.a;
    }

    @Override // defpackage.en6
    public final void g(n98 n98Var, Object obj) {
        int i = this.a;
        gta gtaVar = this.b;
        switch (i) {
            case 0:
                String strB = n98Var.b();
                if (!"k".equals(strB)) {
                    if (!"mv".equals(strB)) {
                        if (!"xs".equals(strB)) {
                            if (!"xi".equals(strB)) {
                                "pn".equals(strB);
                            } else if (obj instanceof Integer) {
                                gtaVar.c = ((Integer) obj).intValue();
                            }
                        } else if (obj instanceof String) {
                            String str = (String) obj;
                            if (!str.isEmpty()) {
                                gtaVar.b = str;
                            }
                        }
                    } else if (obj instanceof int[]) {
                        gtaVar.a = (int[]) obj;
                    }
                } else if (obj instanceof Integer) {
                    gtaVar.g = xm6.getById(((Integer) obj).intValue());
                }
                break;
            default:
                String strB2 = n98Var.b();
                if (!"version".equals(strB2)) {
                    if ("multifileClassName".equals(strB2)) {
                        gtaVar.b = obj instanceof String ? (String) obj : null;
                    }
                } else if (obj instanceof int[]) {
                    gtaVar.a = (int[]) obj;
                }
                break;
        }
    }

    @Override // defpackage.en6
    public final void j(n98 n98Var, rn1 rn1Var) {
        int i = this.a;
    }

    @Override // defpackage.en6
    public final fn6 m(n98 n98Var) {
        int i = 0;
        int i2 = 1;
        switch (this.a) {
            case 0:
                String strB = n98Var.b();
                if ("d1".equals(strB)) {
                    return new dta(this, i);
                }
                if ("d2".equals(strB)) {
                    return new dta(this, i2);
                }
                return null;
            default:
                String strB2 = n98Var.b();
                if ("data".equals(strB2) || "filePartClassNames".equals(strB2)) {
                    return new fta(this, i);
                }
                if ("strings".equals(strB2)) {
                    return new fta(this, i2);
                }
                return null;
        }
    }

    @Override // defpackage.en6
    public final void n(n98 n98Var, mn1 mn1Var, n98 n98Var2) {
        int i = this.a;
    }

    @Override // defpackage.en6
    public final en6 p(mn1 mn1Var, n98 n98Var) {
        switch (this.a) {
        }
        return null;
    }

    private final void d() {
    }

    private final void e() {
    }

    private final void a(n98 n98Var, rn1 rn1Var) {
    }

    private final void c(n98 n98Var, rn1 rn1Var) {
    }

    private final void f(n98 n98Var, mn1 mn1Var, n98 n98Var2) {
    }

    private final void h(n98 n98Var, mn1 mn1Var, n98 n98Var2) {
    }
}
