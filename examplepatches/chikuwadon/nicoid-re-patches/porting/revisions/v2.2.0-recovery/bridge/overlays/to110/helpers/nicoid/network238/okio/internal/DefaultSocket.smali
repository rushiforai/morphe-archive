.class public final Lnicoid/network238/okio/internal/DefaultSocket;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Socket;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;,
        Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0000\u0018\u00002\u00020\u0001:\u0002\u0016\u0017B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u0012\u001a\u00020\u0013H\u0016J\u0008\u0010\u0014\u001a\u00020\u0015H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\n\u001a\u00020\u000bX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0014\u0010\u000e\u001a\u00020\u000fX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0018"
    }
    d2 = {
        "Lnicoid/network238/okio/internal/DefaultSocket;",
        "Lnicoid/network238/okio/Socket;",
        "socket",
        "Ljava/net/Socket;",
        "<init>",
        "(Ljava/net/Socket;)V",
        "getSocket",
        "()Ljava/net/Socket;",
        "closeBits",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "source",
        "Lnicoid/network238/okio/Source;",
        "getSource",
        "()Lnicoid/network238/okio/Source;",
        "sink",
        "Lnicoid/network238/okio/Sink;",
        "getSink",
        "()Lnicoid/network238/okio/Sink;",
        "cancel",
        "",
        "toString",
        "",
        "SocketSink",
        "SocketSource",
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
.field private closeBits:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final sink:Lnicoid/network238/okio/Sink;

.field private final socket:Ljava/net/Socket;

.field private final source:Lnicoid/network238/okio/Source;


# direct methods
.method public constructor <init>(Ljava/net/Socket;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/internal/DefaultSocket;->socket:Ljava/net/Socket;

    .line 39
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/internal/DefaultSocket;->closeBits:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 41
    new-instance p1, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;

    invoke-direct {p1, p0}, Lnicoid/network238/okio/internal/DefaultSocket$SocketSource;-><init>(Lnicoid/network238/okio/internal/DefaultSocket;)V

    iput-object p1, p0, Lnicoid/network238/okio/internal/DefaultSocket;->source:Lnicoid/network238/okio/Source;

    .line 42
    new-instance p1, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;

    invoke-direct {p1, p0}, Lnicoid/network238/okio/internal/DefaultSocket$SocketSink;-><init>(Lnicoid/network238/okio/internal/DefaultSocket;)V

    iput-object p1, p0, Lnicoid/network238/okio/internal/DefaultSocket;->sink:Lnicoid/network238/okio/Sink;

    return-void
.end method

.method public static final synthetic access$getCloseBits$p(Lnicoid/network238/okio/internal/DefaultSocket;)Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 1

    .line 38
    iget-object p0, p0, Lnicoid/network238/okio/internal/DefaultSocket;->closeBits:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .line 45
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    return-void
.end method

.method public getSink()Lnicoid/network238/okio/Sink;
    .registers 2

    .line 42
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket;->sink:Lnicoid/network238/okio/Sink;

    return-object v0
.end method

.method public final getSocket()Ljava/net/Socket;
    .registers 2

    .line 38
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket;->socket:Ljava/net/Socket;

    return-object v0
.end method

.method public getSource()Lnicoid/network238/okio/Source;
    .registers 2

    .line 41
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket;->source:Lnicoid/network238/okio/Source;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 48
    iget-object v0, p0, Lnicoid/network238/okio/internal/DefaultSocket;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method
