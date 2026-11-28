.class public abstract Lnicoid/network238/kotlin/ResultKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 122
    new-instance v0, Lnicoid/network238/kotlin/Result$Failure;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/Result$Failure;-><init>(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static final throwOnFailure(Ljava/lang/Object;)V
    .registers 2

    .line 132
    instance-of v0, p0, Lnicoid/network238/kotlin/Result$Failure;

    if-nez v0, :cond_0

    return-void

    :cond_0
    check-cast p0, Lnicoid/network238/kotlin/Result$Failure;

    iget-object p0, p0, Lnicoid/network238/kotlin/Result$Failure;->exception:Ljava/lang/Throwable;

    throw p0
.end method
