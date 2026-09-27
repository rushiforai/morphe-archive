.class public final Lkotlin/jdk7/AutoCloseableKt;
.super Ljava/lang/Object;
.source "AutoCloseableJVM.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0018\u0002\n\u0000\u001a3\u0010\u0000\u001a\u00060\u0001j\u0002`\u00052\u000e\u0008\u0004\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007H\u0087\u0088\u0004b\u000c\u0008\u0002\u0012\u0008\u0008\u0003\u0012\u0004\u0008\u0008(\u0004b\u0002\u0008\t\u00f8\u0001\u0000\u001ae\u0010\n\u001a\u0002H\u000b\"\u0010\u0008\u0000\u0010\u000c*\n\u0018\u00010\u0001j\u0004\u0018\u0001`\u0005\"\u0004\u0008\u0001\u0010\u000b*\u0002H\u000c2\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u0002H\u000c\u0012\u0004\u0012\u0002H\u000b0\u000eH\u0087\u0088\u0008b\u000c\u0008\u0002\u0012\u0008\u0008\u0003\u0012\u0004\u0008\u0008(\u0010b\u0002\u0008\tb\u0002\u0008\u0011\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0001 \u0001\u00a2\u0006\u0002\u0010\u000f\u001a2\u0010\u0012\u001a\u00020\u0008*\n\u0018\u00010\u0001j\u0004\u0018\u0001`\u00052\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0014H\u0081\u0080\u0004b\u000c\u0008\u0002\u0012\u0008\u0008\u0003\u0012\u0004\u0008\u0008(\u0010b\u0002\u0008\u0015*\u001a\u0008\u0007\u0010\u0000\"\u00020\u00012\u00020\u0001B\u000c\u0008\u0002\u0012\u0008\u0008\u0003\u0012\u0004\u0008\u0008(\u0004\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u0016"
    }
    d2 = {
        "AutoCloseable",
        "Ljava/lang/AutoCloseable;",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.0",
        "Lkotlin/AutoCloseable;",
        "closeAction",
        "Lkotlin/Function0;",
        "",
        "Lkotlin/internal/InlineOnly;",
        "use",
        "R",
        "T",
        "block",
        "Lkotlin/Function1;",
        "(Ljava/lang/AutoCloseable;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;",
        "1.2",
        "Lkotlin/IgnorableReturnValue;",
        "closeFinally",
        "cause",
        "",
        "Lkotlin/PublishedApi;",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    pn = "kotlin"
    xi = 0x30
.end annotation


# direct methods
.method private static final AutoCloseable(Lkotlin/jvm/functions/Function0;)Ljava/lang/AutoCloseable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/AutoCloseable;"
        }
    .end annotation

    const-string v0, "closeAction"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    new-instance v0, Lkotlin/jdk7/AutoCloseableKt$AutoCloseable$1;

    invoke-direct {v0, p0}, Lkotlin/jdk7/AutoCloseableKt$AutoCloseable$1;-><init>(Lkotlin/jvm/functions/Function0;)V

    check-cast v0, Ljava/lang/AutoCloseable;

    return-object v0
.end method

.method public static synthetic AutoCloseable$annotations()V
    .registers 0

    return-void
.end method

.method public static final closeFinally(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V
    .registers 2

    if-eqz p0, :cond_10

    if-nez p1, :cond_8

    .line 43
    invoke-static {p0}, Lkotlin/jdk7/AutoCloseableKt$$ExternalSyntheticThrowIAE2;->m(Ljava/lang/Object;)V

    return-void

    .line 46
    :cond_8
    :try_start_8
    invoke-static {p0}, Lkotlin/jdk7/AutoCloseableKt$$ExternalSyntheticThrowIAE2;->m(Ljava/lang/Object;)V
    :try_end_b
    .catchall {:try_start_8 .. :try_end_b} :catchall_c

    return-void

    :catchall_c
    move-exception p0

    .line 48
    invoke-static {p1, p0}, Lkotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_10
    return-void
.end method

.method private static final use(Ljava/lang/AutoCloseable;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/AutoCloseable;",
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

    .line 30
    :try_start_5
    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_9
    .catchall {:try_start_5 .. :try_end_9} :catchall_e

    const/4 v0, 0x0

    .line 35
    invoke-static {p0, v0}, Lkotlin/jdk7/AutoCloseableKt;->closeFinally(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    return-object p1

    :catchall_e
    move-exception p1

    .line 33
    :try_start_f
    throw p1
    :try_end_10
    .catchall {:try_start_f .. :try_end_10} :catchall_10

    :catchall_10
    move-exception v0

    .line 35
    invoke-static {p0, p1}, Lkotlin/jdk7/AutoCloseableKt;->closeFinally(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    throw v0
.end method
