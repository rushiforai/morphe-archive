package defpackage;

import java.util.concurrent.ExecutionException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mnf implements kr8, br8, kq8 {
    public final Object a = new Object();
    public final int b;
    public final jrg c;
    public int d;
    public int e;
    public int f;
    public Exception g;
    public boolean h;

    public mnf(int i, jrg jrgVar) {
        this.b = i;
        this.c = jrgVar;
    }

    @Override // defpackage.kq8
    public final void a() {
        synchronized (this.a) {
            this.f++;
            this.h = true;
            b();
        }
    }

    public final void b() {
        int i = this.d;
        int i2 = this.e;
        int i3 = i + i2 + this.f;
        int i4 = this.b;
        if (i3 == i4) {
            Exception exc = this.g;
            jrg jrgVar = this.c;
            if (exc == null) {
                if (this.h) {
                    jrgVar.p();
                    return;
                } else {
                    jrgVar.m(null);
                    return;
                }
            }
            int length = String.valueOf(i2).length();
            StringBuilder sb = new StringBuilder(String.valueOf(i4).length() + length + 8 + 24);
            sb.append(i2);
            sb.append(" out of ");
            sb.append(i4);
            sb.append(" underlying tasks failed");
            jrgVar.o(new ExecutionException(sb.toString(), this.g));
        }
    }

    @Override // defpackage.kr8
    public final void i(Object obj) {
        synchronized (this.a) {
            this.d++;
            b();
        }
    }

    @Override // defpackage.br8
    public final void onFailure(Exception exc) {
        synchronized (this.a) {
            this.e++;
            this.g = exc;
            b();
        }
    }
}
