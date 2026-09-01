package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hq0 implements y27 {
    public final y27 a;
    public int b = 0;
    public int c = -1;
    public int d = -1;

    public hq0(y27 y27Var) {
        this.a = y27Var;
    }

    @Override // defpackage.y27
    public final void F(int i, int i2) {
        int i3;
        int i4;
        int i5;
        if (this.b == 3 && i <= (i4 = this.d + (i3 = this.c)) && (i5 = i + i2) >= i3) {
            this.c = Math.min(i, i3);
            this.d = Math.max(i4, i5) - this.c;
        } else {
            a();
            this.c = i;
            this.d = i2;
            this.b = 3;
        }
    }

    public final void a() {
        int i = this.b;
        if (i == 0) {
            return;
        }
        y27 y27Var = this.a;
        if (i == 1) {
            y27Var.l(this.c, this.d);
        } else if (i == 2) {
            y27Var.w(this.c, this.d);
        } else if (i == 3) {
            y27Var.F(this.c, this.d);
        }
        this.b = 0;
    }

    @Override // defpackage.y27
    public final void e(int i, int i2) {
        a();
        this.a.e(i, i2);
    }

    @Override // defpackage.y27
    public final void l(int i, int i2) {
        int i3;
        if (this.b == 1 && i >= (i3 = this.c)) {
            int i4 = this.d;
            if (i <= i3 + i4) {
                this.d = i4 + i2;
                this.c = Math.min(i, i3);
                return;
            }
        }
        a();
        this.c = i;
        this.d = i2;
        this.b = 1;
    }

    @Override // defpackage.y27
    public final void w(int i, int i2) {
        int i3;
        if (this.b == 2 && (i3 = this.c) >= i && i3 <= i + i2) {
            this.d += i2;
            this.c = i;
        } else {
            a();
            this.c = i;
            this.d = i2;
            this.b = 2;
        }
    }
}
