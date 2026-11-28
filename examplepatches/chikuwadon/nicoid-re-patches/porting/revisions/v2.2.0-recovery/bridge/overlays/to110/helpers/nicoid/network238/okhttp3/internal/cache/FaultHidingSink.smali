.class public Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;
.super Lnicoid/network238/okio/ForwardingSink;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\u0008\u0010\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0012\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u0005\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0018\u0010\u000e\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J\u0008\u0010\u0013\u001a\u00020\u0007H\u0016J\u0008\u0010\u0014\u001a\u00020\u0007H\u0016R\u001d\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u000e\u0010\u000c\u001a\u00020\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;",
        "Lnicoid/network238/okio/ForwardingSink;",
        "delegate",
        "Lnicoid/network238/okio/Sink;",
        "onException",
        "Lnicoid/network238/kotlin/Function1;",
        "Ljava/io/IOException;",
        "",
        "<init>",
        "(Lnicoid/network238/okio/Sink;Lnicoid/network238/kotlin/jvm/functions/Function1;)V",
        "getOnException",
        "()Lnicoid/network238/kotlin/jvm/functions/Function1;",
        "hasErrors",
        "",
        "write",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "flush",
        "close",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private hasErrors:Z

.field private final onException:Lnicoid/network238/kotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnicoid/network238/kotlin/jvm/functions/Function1;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Sink;Lnicoid/network238/kotlin/jvm/functions/Function1;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Sink;",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingSink;-><init>(Lnicoid/network238/okio/Sink;)V

    .line 26
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;->onException:Lnicoid/network238/kotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    .line 60
    :try_start_0
    invoke-super {p0}, Lnicoid/network238/okio/ForwardingSink;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 62
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;->hasErrors:Z

    .line 63
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;->onException:Lnicoid/network238/kotlin/jvm/functions/Function1;

    invoke-interface {v1, v0}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public flush()V
    .registers 3

    .line 47
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;->hasErrors:Z

    if-eqz v0, :cond_0

    return-void

    .line 51
    :cond_0
    :try_start_0
    invoke-super {p0}, Lnicoid/network238/okio/ForwardingSink;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 53
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;->hasErrors:Z

    .line 54
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;->onException:Lnicoid/network238/kotlin/jvm/functions/Function1;

    invoke-interface {v1, v0}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final getOnException()Lnicoid/network238/kotlin/jvm/functions/Function1;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;"
        }
    .end annotation

    .line 26
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;->onException:Lnicoid/network238/kotlin/jvm/functions/Function1;

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;->hasErrors:Z

    if-eqz v0, :cond_0

    .line 35
    invoke-virtual {p1, p2, p3}, Lnicoid/network238/okio/Buffer;->skip(J)V

    return-void

    .line 39
    :cond_0
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Lnicoid/network238/okio/ForwardingSink;->write(Lnicoid/network238/okio/Buffer;J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 41
    const/4 p2, 0x1

    iput-boolean p2, p0, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;->hasErrors:Z

    .line 42
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;->onException:Lnicoid/network238/kotlin/jvm/functions/Function1;

    invoke-interface {p2, p1}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
