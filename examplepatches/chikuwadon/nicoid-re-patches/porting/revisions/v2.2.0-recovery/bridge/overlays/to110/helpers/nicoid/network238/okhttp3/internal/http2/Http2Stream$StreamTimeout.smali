.class public final Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;
.super Lnicoid/network238/okio/AsyncTimeout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http2/Http2Stream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "StreamTimeout"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0080\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0004\u001a\u00020\u0005H\u0014J\u0012\u0010\u0006\u001a\u00020\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0007H\u0014J\u0006\u0010\t\u001a\u00020\u0005\u00a8\u0006\n"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;",
        "Lnicoid/network238/okio/AsyncTimeout;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)V",
        "timedOut",
        "",
        "newTimeoutException",
        "Ljava/io/IOException;",
        "cause",
        "exitAndThrowIfTimedOut",
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
.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 724
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-direct {p0}, Lnicoid/network238/okio/AsyncTimeout;-><init>()V

    return-void
.end method


# virtual methods
.method public final exitAndThrowIfTimedOut()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 739
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method protected newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 4

    .line 731
    new-instance v0, Ljava/net/SocketTimeoutException;

    const-string v1, "timeout"

    invoke-direct {v0, v1}, Ljava/net/SocketTimeoutException;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 733
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    :cond_0
    return-object v0
.end method

.method protected timedOut()V
    .registers 3

    .line 726
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->closeLater(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    .line 727
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$StreamTimeout;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getConnection()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->sendDegradedPingLater$okhttp()V

    return-void
.end method
