.class public final Lkotlin/io/CloseableKt;
.super Ljava/lang/Object;
.source "Closeable.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u001aQ\u0010\u0000\u001a\u0002H\u0001\"\n\u0008\u0000\u0010\u0002*\u0004\u0018\u00010\u0003\"\u0004\u0008\u0001\u0010\u0001*\u0002H\u00022\u0012\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u0002H\u0002\u0012\u0004\u0012\u0002H\u00010\u0005H\u0087\u0088\u0008b\u0002\u0008\u0007b\u0002\u0008\u0008\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0001 \u0001\u00a2\u0006\u0002\u0010\u0006\u001a,\u0010\t\u001a\u00020\n*\u0004\u0018\u00010\u00032\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000cH\u0081\u0080\u0004b\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u000fb\u0002\u0008\u0010\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u0011"
    }
    d2 = {
        "use",
        "R",
        "T",
        "Ljava/io/Closeable;",
        "block",
        "Lkotlin/Function1;",
        "(Ljava/io/Closeable;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;",
        "Lkotlin/internal/InlineOnly;",
        "Lkotlin/IgnorableReturnValue;",
        "closeFinally",
        "",
        "cause",
        "",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.1",
        "Lkotlin/PublishedApi;",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    .registers 2

    if-eqz p0, :cond_10

    if-nez p1, :cond_8

    .line 47
    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    return-void

    .line 50
    :cond_8
    :try_start_8
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_b
    .catchall {:try_start_8 .. :try_end_b} :catchall_c

    return-void

    :catchall_c
    move-exception p0

    .line 52
    invoke-static {p1, p0}, Lkotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_10
    return-void
.end method

.method private static final use(Ljava/io/Closeable;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Closeable;",
            "R:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;+TR;>;)TR;"
        }
    .end annotation

    .annotation runtime Lkotlin/IgnorableReturnValue;
    .end annotation

    const-string v0, "block"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    :try_start_5
    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_9
    .catchall {:try_start_5 .. :try_end_9} :catchall_e

    const/4 v0, 0x0

    .line 33
    invoke-static {p0, v0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object p1

    :catchall_e
    move-exception p1

    .line 31
    :try_start_f
    throw p1
    :try_end_10
    .catchall {:try_start_f .. :try_end_10} :catchall_10

    :catchall_10
    move-exception v0

    .line 33
    invoke-static {p0, p1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method
