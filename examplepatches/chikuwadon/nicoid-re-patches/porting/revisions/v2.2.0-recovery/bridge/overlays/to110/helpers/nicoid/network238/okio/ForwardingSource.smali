.class public abstract Lnicoid/network238/okio/ForwardingSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008&\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0018\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u0007H\u0016J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016J\u0008\u0010\r\u001a\u00020\u000eH\u0016J\u0008\u0010\u000f\u001a\u00020\u0010H\u0016J\r\u0010\u0002\u001a\u00020\u0001H\u0007\u00a2\u0006\u0002\u0008\u0011R\u0013\u0010\u0002\u001a\u00020\u00018\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0005\u00a8\u0006\u0012"
    }
    d2 = {
        "Lnicoid/network238/okio/ForwardingSource;",
        "Lnicoid/network238/okio/Source;",
        "delegate",
        "<init>",
        "(Lnicoid/network238/okio/Source;)V",
        "()Lnicoid/network238/okio/Source;",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
        "",
        "toString",
        "",
        "-deprecated_delegate",
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
.field private final delegate:Lnicoid/network238/okio/Source;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Source;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lnicoid/network238/okio/ForwardingSource;->delegate:Lnicoid/network238/okio/Source;

    return-void
.end method


# virtual methods
.method public final -deprecated_delegate()Lnicoid/network238/okio/Source;
    .registers 2

    .line 42
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingSource;->delegate:Lnicoid/network238/okio/Source;

    return-object v0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingSource;->delegate:Lnicoid/network238/okio/Source;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->close()V

    return-void
.end method

.method public final delegate()Lnicoid/network238/okio/Source;
    .registers 2

    .line 22
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingSource;->delegate:Lnicoid/network238/okio/Source;

    return-object v0
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingSource;->delegate:Lnicoid/network238/okio/Source;

    invoke-interface {v0, p1, p2, p3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1

    return-wide p1
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 29
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingSource;->delegate:Lnicoid/network238/okio/Source;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okio/ForwardingSource;->delegate:Lnicoid/network238/okio/Source;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
