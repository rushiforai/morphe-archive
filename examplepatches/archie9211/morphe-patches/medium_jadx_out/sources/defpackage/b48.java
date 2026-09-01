package defpackage;

import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import android.os.Looper;
import android.provider.Settings;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b48 implements a48 {
    public final Context a;
    public k92 b;
    public final g49 c = new g49(1.0f);
    public enc d;

    public b48(Context context) {
        this.a = context;
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        return b55Var.invoke(obj, this);
    }

    @Override // defpackage.ib2
    public final ib2 T(hb2 hb2Var) {
        return flb.n0(this, hb2Var);
    }

    @Override // defpackage.a48
    public final float U() {
        n92 n92Var;
        vpc vpcVar;
        if (this.d == null) {
            Context context = this.a;
            f78 f78Var = t5f.a;
            synchronized (f78Var) {
                try {
                    Object objG = f78Var.g(context);
                    n92Var = null;
                    if (objG == null) {
                        ContentResolver contentResolver = context.getContentResolver();
                        Uri uriFor = Settings.Global.getUriFor("animator_duration_scale");
                        uz0 uz0VarE = pwd.e(-1, 6, null);
                        objG = bo.e0(new u50(12, new nz(contentResolver, uriFor, new s5f(uz0VarE, gsa.W(Looper.getMainLooper())), uz0VarE, context, null, 19)), o7f.i(), new ync(0L, Long.MAX_VALUE), Float.valueOf(Settings.Global.getFloat(context.getContentResolver(), "animator_duration_scale", 1.0f)));
                        f78Var.m(context, objG);
                    }
                    vpcVar = (vpc) objG;
                } catch (Throwable th) {
                    throw th;
                }
            }
            this.c.h(((Number) vpcVar.getValue()).floatValue());
            k92 k92Var = this.b;
            if (k92Var == null) {
                ygf.f("MotionDurationScale scale factor requested before recomposer loop start");
                return 0.0f;
            }
            this.d = vx0.c0(k92Var, null, null, new kd7(vpcVar, this, n92Var, 5), 3);
        }
        return this.c.g();
    }

    @Override // defpackage.gb2
    public final hb2 getKey() {
        return wz7.f;
    }

    @Override // defpackage.ib2
    public final ib2 j0(ib2 ib2Var) {
        return flb.p0(this, ib2Var);
    }

    @Override // defpackage.ib2
    public final gb2 o0(hb2 hb2Var) {
        return flb.i0(this, hb2Var);
    }
}
