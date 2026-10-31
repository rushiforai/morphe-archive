package com.amplitude;

import com.amplitude.common.Logger;
import kotlin.ExceptionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class K3 implements Logger {

    /* renamed from: a, reason: collision with root package name */
    public final Logger f20306a;

    public K3(Logger logger) {
        this.f20306a = logger;
        AbstractC0521u1.f20771a = this;
    }

    public final void a(Function0 message) {
        Intrinsics.g(message, "message");
        if (this.f20306a == null || !a(Logger.LogMode.DEBUG)) {
            return;
        }
        this.f20306a.debug((String) message.invoke());
    }

    public final void b(Function0 message) {
        Intrinsics.g(message, "message");
        if (this.f20306a == null || !a(Logger.LogMode.ERROR)) {
            return;
        }
        this.f20306a.error((String) message.invoke());
    }

    public final void c(Function0 message) {
        Intrinsics.g(message, "message");
        if (this.f20306a == null || !a(Logger.LogMode.INFO)) {
            return;
        }
        this.f20306a.info((String) message.invoke());
    }

    public final void d(Function0 message) {
        Intrinsics.g(message, "message");
        if (this.f20306a == null || !a(Logger.LogMode.WARN)) {
            return;
        }
        this.f20306a.warn((String) message.invoke());
    }

    @Override // com.amplitude.common.Logger
    public final void debug(String message) {
        Intrinsics.g(message, "message");
        Logger logger = this.f20306a;
        if (logger != null) {
            logger.debug(message);
        }
    }

    @Override // com.amplitude.common.Logger
    public final void error(String message) {
        Intrinsics.g(message, "message");
        Logger logger = this.f20306a;
        if (logger != null) {
            logger.error(message);
        }
    }

    @Override // com.amplitude.common.Logger
    public final Logger.LogMode getLogMode() {
        Logger.LogMode logMode;
        Logger logger = this.f20306a;
        return (logger == null || (logMode = logger.getLogMode()) == null) ? Logger.LogMode.INFO : logMode;
    }

    @Override // com.amplitude.common.Logger
    public final void info(String message) {
        Intrinsics.g(message, "message");
        Logger logger = this.f20306a;
        if (logger != null) {
            logger.info(message);
        }
    }

    @Override // com.amplitude.common.Logger
    public final void setLogMode(Logger.LogMode value) {
        Intrinsics.g(value, "value");
        Logger logger = this.f20306a;
        if (logger == null) {
            return;
        }
        logger.setLogMode(value);
    }

    @Override // com.amplitude.common.Logger
    public final void warn(String message) {
        Intrinsics.g(message, "message");
        Logger logger = this.f20306a;
        if (logger != null) {
            logger.warn(message);
        }
    }

    public final void a(Throwable throwable, Function0 message) {
        Intrinsics.g(throwable, "throwable");
        Intrinsics.g(message, "message");
        if (this.f20306a == null || !a(Logger.LogMode.ERROR)) {
            return;
        }
        this.f20306a.error((String) message.invoke());
        this.f20306a.error(ExceptionsKt.b(throwable));
    }

    public final boolean a(Logger.LogMode logMode) {
        Intrinsics.g(logMode, "logMode");
        Logger logger = this.f20306a;
        return logger != null && logger.getLogMode().compareTo(logMode) <= 0;
    }
}
