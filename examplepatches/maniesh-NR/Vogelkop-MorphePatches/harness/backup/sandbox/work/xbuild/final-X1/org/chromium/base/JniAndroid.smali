.class public final Lorg/chromium/base/JniAndroid;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static handleException(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/Throwable;
    .registers 6

    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Lsnb;

    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Native stack trace:"

    invoke-static {v3, v2, p1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object p0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-interface {p0, p1, v1}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    :try_end_1b
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1b} :catch_1e
    .catchall {:try_start_1 .. :try_end_1b} :catchall_1c

    return-object v0

    :catchall_1c
    move-exception p0

    return-object p0

    :catch_1e
    return-object v0
.end method

.method public static sanitizedStacktraceForUnhandledException(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 4

    const-string v0, "Error while getting stack trace: "

    const/4 v1, 0x0

    :try_start_3
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lveg;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_b
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_b} :catch_1e
    .catchall {:try_start_3 .. :try_end_b} :catchall_c

    return-object p0

    :catchall_c
    move-exception p0

    :try_start_d
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_1d
    .catch Ljava/lang/OutOfMemoryError; {:try_start_d .. :try_end_1d} :catch_1e

    return-object p0

    :catch_1e
    return-object v1
.end method
