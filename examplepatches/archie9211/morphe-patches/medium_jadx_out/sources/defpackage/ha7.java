package defpackage;

import android.content.Context;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ha7 implements ea4 {
    public final l66 a;
    public final rg8 b;
    public final ev2 f;
    public ru2 c = new rz5(20);
    public final AtomicBoolean d = new AtomicBoolean(false);
    public String e = "";
    public final ConcurrentHashMap g = new ConcurrentHashMap();
    public final String h = "logs";
    public final w5d i = new w5d(new ga7(this, 0));
    public final jb4 j = jb4.a;

    public ha7(l66 l66Var, rg8 rg8Var) {
        this.a = l66Var;
        this.b = rg8Var;
        this.f = new ev2(null, l66Var.e());
    }

    @Override // defpackage.ea4
    public final void a() {
        this.a.b(this.h);
        this.c = new rz5(20);
        this.e = "";
        this.d.set(false);
        this.g.clear();
    }

    @Override // defpackage.ea4
    public final void b(Context context) {
        context.getClass();
        String str = this.h;
        l66 l66Var = this.a;
        l66Var.h(str, this);
        String packageName = context.getPackageName();
        packageName.getClass();
        this.e = packageName;
        this.c = new hx4(new olb(new dq1(this.b, l66Var.e()), 20, new hx4(l66Var.e())), l66Var.e());
        this.d.set(true);
    }

    @Override // defpackage.ea4
    public final String getName() {
        return this.h;
    }
}
