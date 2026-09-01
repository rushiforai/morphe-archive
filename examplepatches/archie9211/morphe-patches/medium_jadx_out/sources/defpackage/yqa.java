package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yqa {
    public static final yqa d;
    public final /* synthetic */ int a;
    public int b;
    public int c;

    static {
        int i = 0;
        d = new yqa(i, i, 0);
    }

    public /* synthetic */ yqa(int i, int i2, int i3) {
        this.a = i3;
        this.b = i;
        this.c = i2;
    }

    public int a(int i) {
        if (i >= 0 && i <= this.b) {
            xz5.D0(i, this.c, i);
        }
        return i;
    }

    public void b(pr0 pr0Var) {
        View view = pr0Var.a;
        this.b = view.getLeft();
        this.c = view.getTop();
        view.getRight();
        view.getBottom();
    }

    public int c(int i) {
        if (i >= 0 && i <= this.c) {
            xz5.E0(i, this.b, i);
        }
        return i;
    }

    public String toString() {
        switch (this.a) {
            case 0:
                StringBuilder sb = new StringBuilder(yqa.class.getSimpleName());
                sb.append("[position = ");
                sb.append(this.b);
                sb.append(", length = ");
                return ho2.H(sb, this.c, "]");
            case 1:
                StringBuilder sb2 = new StringBuilder("Location(line = ");
                sb2.append(this.b);
                sb2.append(", column = ");
                return km4.A(sb2, this.c, ')');
            default:
                return super.toString();
        }
    }

    public /* synthetic */ yqa() {
        this.a = 4;
    }
}
