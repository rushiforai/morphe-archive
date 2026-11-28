.class public final Lnicoid/network238/okhttp3/internal/TagsKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a=\u0010\u0000\u001a\u0002H\u0001\"\u0008\u0008\u0000\u0010\u0001*\u00020\u0002*\u0008\u0012\u0004\u0012\u00020\u00040\u00032\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u0002H\u00010\u00062\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u0002H\u00010\u0008H\u0000\u00a2\u0006\u0002\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "computeIfAbsent",
        "T",
        "",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "Lnicoid/network238/okhttp3/internal/Tags;",
        "type",
        "Lnicoid/network238/kotlin/reflect/KClass;",
        "compute",
        "Lnicoid/network238/kotlin/Function0;",
        "(Ljava/util/concurrent/atomic/AtomicReference;Lnicoid/network238/kotlin/reflect/KClass;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "okhttp"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final computeIfAbsent(Ljava/util/concurrent/atomic/AtomicReference;Lnicoid/network238/kotlin/reflect/KClass;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lnicoid/network238/okhttp3/internal/Tags;",
            ">;",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")TT;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    .line 122
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/Tags;

    .line 125
    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/internal/Tags;->get(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    return-object v2

    :cond_1
    if-nez v0, :cond_2

    .line 129
    invoke-interface {p2}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    .line 133
    :cond_2
    invoke-virtual {v1, p1, v0}, Lnicoid/network238/okhttp3/internal/Tags;->plus(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/internal/Tags;

    move-result-object v2

    .line 134
    invoke-static {p0, v1, v2}, Lnicoid/network238/okhttp3/internal/TagsKt$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0
.end method
