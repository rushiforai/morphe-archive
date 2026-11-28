.class abstract Lnicoid/network238/kotlin/ExceptionsKt__ExceptionsKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eq p0, p1, :cond_0

    .line 70
    sget-object v0, Lnicoid/network238/kotlin/internal/PlatformImplementationsKt;->IMPLEMENTATIONS:Lnicoid/network238/kotlin/internal/PlatformImplementations;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/kotlin/internal/PlatformImplementations;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method
