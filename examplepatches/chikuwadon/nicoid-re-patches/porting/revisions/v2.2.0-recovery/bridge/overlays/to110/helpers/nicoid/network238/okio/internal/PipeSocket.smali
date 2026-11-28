.class public final Lnicoid/network238/okio/internal/PipeSocket;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Socket;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0008\u0010\u0012\u001a\u00020\u0013H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u0008R\u0014\u0010\n\u001a\u00020\u000b8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000c\u0010\rR\u0014\u0010\u000e\u001a\u00020\u000f8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0014"
    }
    d2 = {
        "Lnicoid/network238/okio/internal/PipeSocket;",
        "Lnicoid/network238/okio/Socket;",
        "sinkPipe",
        "Lnicoid/network238/okio/Pipe;",
        "sourcePipe",
        "<init>",
        "(Lnicoid/network238/okio/Pipe;Lnicoid/network238/okio/Pipe;)V",
        "getSinkPipe",
        "()Lnicoid/network238/okio/Pipe;",
        "getSourcePipe",
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
.field private final sinkPipe:Lnicoid/network238/okio/Pipe;

.field private final sourcePipe:Lnicoid/network238/okio/Pipe;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Pipe;Lnicoid/network238/okio/Pipe;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/internal/PipeSocket;->sinkPipe:Lnicoid/network238/okio/Pipe;

    iput-object p2, p0, Lnicoid/network238/okio/internal/PipeSocket;->sourcePipe:Lnicoid/network238/okio/Pipe;

    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .line 31
    iget-object v0, p0, Lnicoid/network238/okio/internal/PipeSocket;->sourcePipe:Lnicoid/network238/okio/Pipe;

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->cancel()V

    .line 32
    iget-object v0, p0, Lnicoid/network238/okio/internal/PipeSocket;->sinkPipe:Lnicoid/network238/okio/Pipe;

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->cancel()V

    return-void
.end method

.method public getSink()Lnicoid/network238/okio/Sink;
    .registers 2

    .line 28
    iget-object v0, p0, Lnicoid/network238/okio/internal/PipeSocket;->sinkPipe:Lnicoid/network238/okio/Pipe;

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->sink()Lnicoid/network238/okio/Sink;

    move-result-object v0

    return-object v0
.end method

.method public final getSinkPipe()Lnicoid/network238/okio/Pipe;
    .registers 2

    .line 23
    iget-object v0, p0, Lnicoid/network238/okio/internal/PipeSocket;->sinkPipe:Lnicoid/network238/okio/Pipe;

    return-object v0
.end method

.method public getSource()Lnicoid/network238/okio/Source;
    .registers 2

    .line 25
    iget-object v0, p0, Lnicoid/network238/okio/internal/PipeSocket;->sourcePipe:Lnicoid/network238/okio/Pipe;

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->source()Lnicoid/network238/okio/Source;

    move-result-object v0

    return-object v0
.end method

.method public final getSourcePipe()Lnicoid/network238/okio/Pipe;
    .registers 2

    .line 23
    iget-object v0, p0, Lnicoid/network238/okio/internal/PipeSocket;->sourcePipe:Lnicoid/network238/okio/Pipe;

    return-object v0
.end method
