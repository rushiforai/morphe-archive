package defpackage;

import java.io.Closeable;
import java.io.Flushable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class zd6 implements Closeable, Flushable {
    public int a;
    public int[] b;
    public String[] c;
    public int[] d;
    public boolean e;
    public int f;

    public final String B() {
        return k50.b0(this.a, this.b, this.c, this.d);
    }

    public abstract ud6 D(String str);

    public abstract ud6 I();

    public final int L() {
        int i = this.a;
        if (i != 0) {
            return this.b[i - 1];
        }
        ygf.f("JsonWriter is closed.");
        return 0;
    }

    public abstract ud6 N(long j);

    public abstract ud6 Q(String str);

    public abstract ud6 f();

    public abstract ud6 m();

    public abstract ud6 p();
}
