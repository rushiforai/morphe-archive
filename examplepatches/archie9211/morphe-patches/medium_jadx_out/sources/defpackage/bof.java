package defpackage;

import com.google.android.gms.common.api.Status;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class bof {
    public final int a;
    public final ujf b = new ujf(9, this);
    public xj4 c;
    public xmf d;
    public cag e;
    public ovf f;
    public d2f g;
    public zpf h;
    public ppf i;
    public zb0 j;
    public zjf k;
    public bqf l;
    public boolean m;

    public bof(int i) {
        new ArrayList();
        this.a = i;
    }

    public abstract String a();

    public final void b(xj4 xj4Var) {
        vp7.q("firebaseApp cannot be null", xj4Var);
        this.c = xj4Var;
    }

    public abstract void c(wfd wfdVar, hnf hnfVar);

    public final void d(Status status) {
        this.m = true;
        this.g.G0(null, status);
    }

    public abstract void e();

    public final void f(Object obj) {
        this.m = true;
        this.g.G0(obj, null);
    }
}
