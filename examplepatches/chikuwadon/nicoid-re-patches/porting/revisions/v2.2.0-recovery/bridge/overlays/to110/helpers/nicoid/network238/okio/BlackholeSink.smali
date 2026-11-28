.class final Lnicoid/network238/okio/BlackholeSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0016J\u0008\u0010\n\u001a\u00020\u0005H\u0016J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016J\u0008\u0010\r\u001a\u00020\u0005H\u0016\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okio/BlackholeSink;",
        "Lnicoid/network238/okio/Sink;",
        "<init>",
        "()V",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "flush",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
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


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    return-void
.end method

.method public flush()V
    .registers 1

    return-void
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 49
    sget-object v0, Lnicoid/network238/okio/Timeout;->NONE:Lnicoid/network238/okio/Timeout;

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    invoke-virtual {p1, p2, p3}, Lnicoid/network238/okio/Buffer;->skip(J)V

    return-void
.end method
