package ob0;

import ib0.f;

/* loaded from: classes5.dex */
public final class a implements f {

    /* renamed from: g, reason: collision with root package name */
    public static final br.c f80301g = new br.c();

    /* renamed from: a, reason: collision with root package name */
    public long f80302a;

    /* renamed from: b, reason: collision with root package name */
    public f f80303b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f80304c;

    /* renamed from: d, reason: collision with root package name */
    public long f80305d;

    /* renamed from: e, reason: collision with root package name */
    public long f80306e;

    /* renamed from: f, reason: collision with root package name */
    public f f80307f;

    public final void a() {
        while (true) {
            synchronized (this) {
                try {
                    long j11 = this.f80305d;
                    long j12 = this.f80306e;
                    f fVar = this.f80307f;
                    if (j11 == 0 && j12 == 0 && fVar == null) {
                        this.f80304c = false;
                        return;
                    }
                    this.f80305d = 0L;
                    this.f80306e = 0L;
                    this.f80307f = null;
                    long j13 = this.f80302a;
                    if (j13 != Long.MAX_VALUE) {
                        long j14 = j13 + j11;
                        if (j14 < 0 || j14 == Long.MAX_VALUE) {
                            this.f80302a = Long.MAX_VALUE;
                            j13 = Long.MAX_VALUE;
                        } else {
                            j13 = j14 - j12;
                            if (j13 < 0) {
                                throw new IllegalStateException("more produced than requested");
                            }
                            this.f80302a = j13;
                        }
                    }
                    if (fVar == null) {
                        f fVar2 = this.f80303b;
                        if (fVar2 != null && j11 != 0) {
                            fVar2.j(j11);
                        }
                    } else if (fVar == f80301g) {
                        this.f80303b = null;
                    } else {
                        this.f80303b = fVar;
                        fVar.j(j13);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }

    public final void b(f fVar) {
        synchronized (this) {
            try {
                if (this.f80304c) {
                    this.f80307f = fVar;
                    return;
                }
                this.f80304c = true;
                try {
                    this.f80303b = fVar;
                    fVar.j(this.f80302a);
                    a();
                } catch (Throwable th2) {
                    synchronized (this) {
                        this.f80304c = false;
                        throw th2;
                    }
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }

    @Override // ib0.f
    public final void j(long j11) {
        if (j11 < 0) {
            throw new IllegalArgumentException("n >= 0 required");
        }
        if (j11 == 0) {
            return;
        }
        synchronized (this) {
            try {
                if (this.f80304c) {
                    this.f80305d += j11;
                    return;
                }
                this.f80304c = true;
                try {
                    long j12 = this.f80302a + j11;
                    if (j12 < 0) {
                        j12 = Long.MAX_VALUE;
                    }
                    this.f80302a = j12;
                    f fVar = this.f80303b;
                    if (fVar != null) {
                        fVar.j(j11);
                    }
                    a();
                } catch (Throwable th2) {
                    synchronized (this) {
                        this.f80304c = false;
                        throw th2;
                    }
                }
            } finally {
            }
        }
    }
}
