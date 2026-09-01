package j$.util.stream;

import java.util.concurrent.CountedCompleter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class u3 extends CountedCompleter {
    public final g2 a;
    public final int b;
    public final /* synthetic */ int c;
    public final Object d;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public u3(u3 u3Var, g2 g2Var, int i) {
        this(u3Var, g2Var, i, (byte) 0);
        this.c = 1;
        this.d = (Object[]) u3Var.d;
    }

    public final u3 a(int i, int i2) {
        switch (this.c) {
            case 0:
                return new u3(this, ((f2) this.a).a(i), i2);
            default:
                return new u3(this, this.a.a(i), i2);
        }
    }

    @Override // java.util.concurrent.CountedCompleter
    public final void compute() {
        int i;
        while (this.a.o() != 0) {
            this.setPendingCount(this.a.o() - 1);
            int i2 = 0;
            int iCount = 0;
            while (true) {
                int iO = this.a.o() - 1;
                i = this.b;
                if (i2 < iO) {
                    u3 u3VarA = this.a(i2, i + iCount);
                    iCount = (int) (u3VarA.a.count() + ((long) iCount));
                    u3VarA.fork();
                    i2++;
                }
            }
            this = this.a(i2, i + iCount);
        }
        switch (this.c) {
            case 0:
                ((f2) this.a).f(this.b, this.d);
                break;
            default:
                this.a.k((Object[]) this.d, this.b);
                break;
        }
        this.propagateCompletion();
    }

    public u3(u3 u3Var, g2 g2Var, int i, byte b) {
        super(u3Var);
        this.a = g2Var;
        this.b = i;
    }

    public u3(g2 g2Var, Object obj, int i) {
        this.c = i;
        this.a = g2Var;
        this.b = 0;
        this.d = obj;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public u3(u3 u3Var, f2 f2Var, int i) {
        this(u3Var, f2Var, i, (byte) 0);
        this.c = 0;
        this.d = u3Var.d;
    }
}
