package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzang;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class xtf implements Cloneable {
    public final ytf a;
    public ytf b;

    public xtf(ytf ytfVar) {
        this.a = ytfVar;
        if (ytfVar.s()) {
            ay0.e("Default instance must be immutable.");
            throw null;
        }
        this.b = ytfVar.p();
    }

    public static void a(Object obj, Object obj2) {
        quf qufVar = quf.c;
        qufVar.getClass();
        qufVar.a(obj.getClass()).i(obj, obj2);
    }

    public final ytf b() {
        boolean zS = this.b.s();
        ytf ytfVar = this.b;
        if (zS) {
            ytfVar.q();
            ytfVar = this.b;
        }
        ytfVar.getClass();
        if (ytf.n(ytfVar, true)) {
            return ytfVar;
        }
        throw new zzang();
    }

    public final void c() {
        if (this.b.s()) {
            return;
        }
        d();
    }

    public final Object clone() {
        xtf xtfVar = (xtf) this.a.d(5);
        boolean zS = this.b.s();
        ytf ytfVar = this.b;
        if (zS) {
            ytfVar.q();
            ytfVar = this.b;
        }
        xtfVar.b = ytfVar;
        return xtfVar;
    }

    public final void d() {
        ytf ytfVarP = this.a.p();
        a(ytfVarP, this.b);
        this.b = ytfVarP;
    }
}
