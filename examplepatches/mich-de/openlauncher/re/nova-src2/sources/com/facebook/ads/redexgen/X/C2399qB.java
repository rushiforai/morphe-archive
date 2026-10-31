package com.facebook.ads.redexgen.X;

import java.io.Closeable;
import java.io.IOException;
import java.io.InterruptedIOException;

/* renamed from: com.facebook.ads.redexgen.X.qB, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2399qB extends Thread implements Closeable {
    public boolean A00 = false;
    public final /* synthetic */ C2400qC A01;

    public C2399qB(C2400qC c2400qC) {
        this.A01 = c2400qC;
        start();
    }

    public final synchronized void A00() {
        this.A01.A02.A02();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        synchronized (this) {
            this.A00 = true;
            this.A01.A02.A02();
        }
        try {
            join();
        } catch (InterruptedException unused) {
            throw new InterruptedIOException();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0024, code lost:
    
        if (r1 == false) goto L15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0027, code lost:
    
        if (r0 == false) goto L87;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x002c, code lost:
    
        r5.A01.A03.run();
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x004d, code lost:
    
        r2 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x005b, code lost:
    
        monitor-enter(r5.A01);
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x005c, code lost:
    
        r5.A01.A02.A03();
        r5.A01.A00 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x006b, code lost:
    
        throw r2;
     */
    @Override // java.lang.Thread, java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        while (true) {
            try {
                try {
                    try {
                        this.A01.A02.A04();
                        synchronized (this.A01) {
                            try {
                                synchronized (this) {
                                    try {
                                        boolean z11 = this.A00;
                                        boolean zA05 = this.A01.A02.A05();
                                    } finally {
                                        th = th;
                                        while (true) {
                                            try {
                                            } catch (Throwable th2) {
                                                th = th2;
                                            }
                                        }
                                    }
                                }
                                try {
                                } catch (Throwable th3) {
                                    th = th3;
                                }
                            } catch (Throwable th4) {
                                th = th4;
                            }
                        }
                        throw th;
                    } catch (Exception unused) {
                        synchronized (this.A01) {
                            try {
                                this.A01.A02.A03();
                                this.A01.A00 = null;
                                return;
                            } finally {
                                th = th;
                                while (true) {
                                    try {
                                    } catch (Throwable th5) {
                                        th = th5;
                                    }
                                }
                            }
                        }
                    }
                } catch (Throwable th6) {
                    AbstractC2311oi.A00(th6, this);
                    return;
                }
            } catch (Throwable th7) {
                th = th7;
            }
        }
        synchronized (this.A01) {
            try {
                this.A01.A02.A03();
                this.A01.A00 = null;
            } catch (Throwable th8) {
                th = th8;
                while (true) {
                    try {
                        throw th;
                    } catch (Throwable th9) {
                    }
                }
            }
        }
    }
}
