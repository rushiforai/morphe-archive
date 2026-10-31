package com.google.android.gms.internal.play_billing;

import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class m1 {

    /* renamed from: a, reason: collision with root package name */
    public final g0 f33451a = new g0();

    /* renamed from: b, reason: collision with root package name */
    public final String f33452b;

    /* renamed from: c, reason: collision with root package name */
    public volatile Logger f33453c;

    public m1(Class cls) {
        this.f33452b = cls.getName();
    }

    public final Logger a() {
        Logger logger = this.f33453c;
        if (logger != null) {
            return logger;
        }
        synchronized (this.f33451a) {
            try {
                Logger logger2 = this.f33453c;
                if (logger2 != null) {
                    return logger2;
                }
                Logger logger3 = Logger.getLogger(this.f33452b);
                this.f33453c = logger3;
                return logger3;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
