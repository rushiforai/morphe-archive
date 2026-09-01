package defpackage;

import java.util.List;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h00 implements h68 {
    public final hv8 a;
    public UUID b;
    public s44 c;
    public et5 d;
    public List e;
    public Boolean f;
    public Boolean g;
    public Boolean h;
    public Boolean i;
    public Boolean j;
    public Boolean k;
    public boolean l;

    public h00(hv8 hv8Var, UUID uuid, s44 s44Var, et5 et5Var, List list, Boolean bool, Boolean bool2, Boolean bool3, Boolean bool4, Boolean bool5, Boolean bool6, boolean z) {
        this.a = hv8Var;
        this.b = uuid;
        this.c = s44Var;
        this.d = et5Var;
        this.e = list;
        this.f = bool;
        this.g = bool2;
        this.h = bool3;
        this.i = bool4;
        this.j = bool5;
        this.k = bool6;
        this.l = z;
    }

    @Override // defpackage.h68
    public /* bridge */ /* synthetic */ Object a(q44 q44Var) {
        b(q44Var);
        return this;
    }

    public void b(q44 q44Var) {
        this.c = this.c.c(q44Var);
    }

    public h00 c() {
        UUID uuidRandomUUID = this.b;
        if (uuidRandomUUID == null) {
            uuidRandomUUID = UUID.randomUUID();
            uuidRandomUUID.getClass();
        }
        return new h00(this.a, uuidRandomUUID, this.c, this.d, this.e, this.g, this.h, this.f, this.i, this.j, this.k, this.l);
    }

    public h00 d() {
        h00 h00Var = new h00(this.a);
        h00Var.b = this.b;
        s44 s44Var = this.c;
        s44Var.getClass();
        h00Var.c = s44Var;
        h00Var.d = this.d;
        h00Var.e = this.e;
        h00Var.g = this.f;
        h00Var.h = this.g;
        h00Var.f = this.h;
        h00Var.i = this.i;
        h00Var.j = this.j;
        h00Var.k = this.k;
        h00Var.l = this.l;
        return h00Var;
    }

    public h00(hv8 hv8Var) {
        this.a = hv8Var;
        this.c = by3.a;
        this.l = true;
    }
}
