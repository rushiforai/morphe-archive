package defpackage;

import android.graphics.Rect;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class n4f {
    public final z4f a;
    public b36[] b;
    public final Rect[][] c;
    public final Rect[][] d;

    public n4f(z4f z4fVar) {
        this.c = new Rect[10][];
        this.d = new Rect[10][];
        this.a = z4fVar;
        c(z4fVar);
    }

    public final void a() {
        b36[] b36VarArr = this.b;
        if (b36VarArr != null) {
            b36 b36VarI = b36VarArr[0];
            b36 b36VarI2 = b36VarArr[1];
            z4f z4fVar = this.a;
            if (b36VarI2 == null) {
                b36VarI2 = z4fVar.a.i(2);
            }
            if (b36VarI == null) {
                b36VarI = z4fVar.a.i(1);
            }
            h(b36.a(b36VarI, b36VarI2));
            b36 b36Var = this.b[pr7.m(16)];
            if (b36Var != null) {
                g(b36Var);
            }
            b36 b36Var2 = this.b[pr7.m(32)];
            if (b36Var2 != null) {
                e(b36Var2);
            }
            b36 b36Var3 = this.b[pr7.m(64)];
            if (b36Var3 != null) {
                i(b36Var3);
            }
        }
    }

    public abstract z4f b();

    public void c(z4f z4fVar) {
        for (int i = 1; i <= 512; i <<= 1) {
            List<Rect> listF = z4fVar.a.f(i);
            int iM = pr7.m(i);
            this.c[iM] = (Rect[]) listF.toArray(new Rect[listF.size()]);
            if (i != 8) {
                List<Rect> listG = z4fVar.a.g(i);
                this.d[iM] = (Rect[]) listG.toArray(new Rect[listG.size()]);
            }
        }
    }

    public void d(int i, b36 b36Var) {
        if (this.b == null) {
            this.b = new b36[10];
        }
        for (int i2 = 1; i2 <= 512; i2 <<= 1) {
            if ((i & i2) != 0) {
                this.b[pr7.m(i2)] = b36Var;
            }
        }
    }

    public abstract void f(b36 b36Var);

    public abstract void h(b36 b36Var);

    public n4f() {
        this(new z4f((z4f) null));
    }

    public void e(b36 b36Var) {
    }

    public void g(b36 b36Var) {
    }

    public void i(b36 b36Var) {
    }
}
