package com.facebook.ads.redexgen.X;

import android.os.ConditionVariable;

/* renamed from: com.facebook.ads.redexgen.X.eb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1697eb extends Thread {
    public final /* synthetic */ ConditionVariable A00;
    public final /* synthetic */ MT A01;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C1697eb(MT mt2, String str, ConditionVariable conditionVariable) {
        super(str);
        this.A01 = mt2;
        this.A00 = conditionVariable;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            synchronized (this.A01) {
                try {
                    this.A00.open();
                    this.A01.A05();
                } finally {
                    th = th;
                    while (true) {
                        try {
                        } catch (Throwable th2) {
                        }
                    }
                }
            }
        } catch (Throwable th3) {
            AbstractC2311oi.A00(th3, this);
        }
    }
}
