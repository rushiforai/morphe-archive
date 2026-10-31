package fi;

import java.util.concurrent.ExecutionException;

/* loaded from: classes.dex */
public final class m implements g, f, d {

    /* renamed from: a, reason: collision with root package name */
    public final Object f55140a = new Object();

    /* renamed from: b, reason: collision with root package name */
    public final int f55141b;

    /* renamed from: c, reason: collision with root package name */
    public final t f55142c;

    /* renamed from: d, reason: collision with root package name */
    public int f55143d;

    /* renamed from: e, reason: collision with root package name */
    public int f55144e;

    /* renamed from: f, reason: collision with root package name */
    public int f55145f;

    /* renamed from: g, reason: collision with root package name */
    public Exception f55146g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f55147h;

    public m(int i5, t tVar) {
        this.f55141b = i5;
        this.f55142c = tVar;
    }

    public final void a() {
        int i5 = this.f55143d + this.f55144e + this.f55145f;
        int i11 = this.f55141b;
        if (i5 == i11) {
            Exception exc = this.f55146g;
            t tVar = this.f55142c;
            if (exc == null) {
                if (this.f55147h) {
                    tVar.w();
                    return;
                } else {
                    tVar.t(null);
                    return;
                }
            }
            int i12 = this.f55144e;
            int length = String.valueOf(i12).length();
            StringBuilder sb2 = new StringBuilder(String.valueOf(i11).length() + length + 8 + 24);
            sb2.append(i12);
            sb2.append(" out of ");
            sb2.append(i11);
            sb2.append(" underlying tasks failed");
            tVar.v(new ExecutionException(sb2.toString(), this.f55146g));
        }
    }

    @Override // fi.f
    public final void i(Exception exc) {
        synchronized (this.f55140a) {
            this.f55144e++;
            this.f55146g = exc;
            a();
        }
    }

    @Override // fi.d
    public final void onCanceled() {
        synchronized (this.f55140a) {
            this.f55145f++;
            this.f55147h = true;
            a();
        }
    }

    @Override // fi.g
    public final void onSuccess(Object obj) {
        synchronized (this.f55140a) {
            this.f55143d++;
            a();
        }
    }
}
