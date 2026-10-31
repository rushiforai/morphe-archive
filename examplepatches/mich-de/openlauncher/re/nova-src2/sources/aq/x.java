package aq;

import java.io.Closeable;
import java.io.Flushable;

/* loaded from: classes4.dex */
public abstract class x implements Closeable, Flushable {

    /* renamed from: a, reason: collision with root package name */
    public int f15529a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f15530b;

    /* renamed from: c, reason: collision with root package name */
    public String[] f15531c;

    /* renamed from: d, reason: collision with root package name */
    public int[] f15532d;

    /* renamed from: e, reason: collision with root package name */
    public String f15533e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f15534f;

    /* renamed from: g, reason: collision with root package name */
    public int f15535g;

    public abstract w a();

    public abstract w b();

    public final String c() {
        return m0.c(this.f15529a, this.f15530b, this.f15531c, this.f15532d);
    }

    public abstract w d(String str);

    public abstract w e();

    public final int f() {
        int i5 = this.f15529a;
        if (i5 != 0) {
            return this.f15530b[i5 - 1];
        }
        throw new IllegalStateException("JsonWriter is closed.");
    }

    public abstract w h(long j11);

    public abstract w l(String str);
}
