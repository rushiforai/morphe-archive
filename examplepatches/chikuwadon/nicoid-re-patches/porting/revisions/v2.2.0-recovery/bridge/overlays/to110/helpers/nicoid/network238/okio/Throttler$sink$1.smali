.class public final Lnicoid/network238/okio/Throttler$sink$1;
.super Lnicoid/network238/okio/ForwardingSink;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/Throttler;->sink(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/Sink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "nicoid/network238/okio/Throttler$sink$1",
        "Lnicoid/network238/okio/ForwardingSink;",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "okio"
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
.field final synthetic this$0:Lnicoid/network238/okio/Throttler;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/Sink;Lnicoid/network238/okio/Throttler;)V
    .registers 3

    iput-object p2, p0, Lnicoid/network238/okio/Throttler$sink$1;->this$0:Lnicoid/network238/okio/Throttler;

    .line 150
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingSink;-><init>(Lnicoid/network238/okio/Sink;)V

    return-void
.end method


# virtual methods
.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_0

    .line 156
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okio/Throttler$sink$1;->this$0:Lnicoid/network238/okio/Throttler;

    invoke-virtual {v0, p2, p3}, Lnicoid/network238/okio/Throttler;->take$okio(J)J

    move-result-wide v0

    .line 157
    invoke-super {p0, p1, v0, v1}, Lnicoid/network238/okio/ForwardingSink;->write(Lnicoid/network238/okio/Buffer;J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    sub-long/2addr p2, v0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 161
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 162
    new-instance p1, Ljava/io/InterruptedIOException;

    const-string p2, "interrupted"

    invoke-direct {p1, p2}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_0
    return-void
.end method
