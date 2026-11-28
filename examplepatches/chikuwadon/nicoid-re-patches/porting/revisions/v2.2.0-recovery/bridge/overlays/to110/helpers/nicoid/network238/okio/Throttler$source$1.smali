.class public final Lnicoid/network238/okio/Throttler$source$1;
.super Lnicoid/network238/okio/ForwardingSource;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/Throttler;->source(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/Source;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0019\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0003H\u0016\u00a8\u0006\u0007"
    }
    d2 = {
        "nicoid/network238/okio/Throttler$source$1",
        "Lnicoid/network238/okio/ForwardingSource;",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
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
.method constructor <init>(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/Throttler;)V
    .registers 3

    iput-object p2, p0, Lnicoid/network238/okio/Throttler$source$1;->this$0:Lnicoid/network238/okio/Throttler;

    .line 135
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingSource;-><init>(Lnicoid/network238/okio/Source;)V

    return-void
.end method


# virtual methods
.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 138
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okio/Throttler$source$1;->this$0:Lnicoid/network238/okio/Throttler;

    invoke-virtual {v0, p2, p3}, Lnicoid/network238/okio/Throttler;->take$okio(J)J

    move-result-wide p2

    .line 139
    invoke-super {p0, p1, p2, p3}, Lnicoid/network238/okio/ForwardingSource;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p1

    :catch_0
    move-exception p1

    .line 141
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 142
    new-instance p1, Ljava/io/InterruptedIOException;

    const-string p2, "interrupted"

    invoke-direct {p1, p2}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
