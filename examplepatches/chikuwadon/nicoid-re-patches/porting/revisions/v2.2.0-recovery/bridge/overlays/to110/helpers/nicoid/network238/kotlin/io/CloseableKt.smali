.class public abstract Lnicoid/network238/kotlin/io/CloseableKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    .registers 2

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    .line 46
    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    return-void

    .line 49
    :cond_0
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 51
    invoke-static {p1, p0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method
