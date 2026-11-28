.class abstract Lnicoid/network238/kotlin/LazyKt__LazyJVMKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static lazy(Lnicoid/network238/kotlin/jvm/functions/Function0;)Lnicoid/network238/kotlin/Lazy;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    new-instance v0, Lnicoid/network238/kotlin/SynchronizedLazyImpl;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {v0, p0, v1, v2, v1}, Lnicoid/network238/kotlin/SynchronizedLazyImpl;-><init>(Lnicoid/network238/kotlin/jvm/functions/Function0;Ljava/lang/Object;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method
