package defpackage;

import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v38 extends jb6 {
    public final Type a;
    public final String b;
    public final Object c;
    public jb6 d;

    public v38(Type type, String str, Object obj) {
        this.a = type;
        this.b = str;
        this.c = obj;
    }

    @Override // defpackage.jb6
    public final Object a(hd6 hd6Var) {
        jb6 jb6Var = this.d;
        if (jb6Var != null) {
            return jb6Var.a(hd6Var);
        }
        ygf.f("JsonAdapter isn't ready");
        return null;
    }

    @Override // defpackage.jb6
    public final void e(zd6 zd6Var, Object obj) {
        jb6 jb6Var = this.d;
        if (jb6Var != null) {
            jb6Var.e(zd6Var, obj);
        } else {
            ygf.f("JsonAdapter isn't ready");
        }
    }

    public final String toString() {
        jb6 jb6Var = this.d;
        return jb6Var != null ? jb6Var.toString() : super.toString();
    }
}
