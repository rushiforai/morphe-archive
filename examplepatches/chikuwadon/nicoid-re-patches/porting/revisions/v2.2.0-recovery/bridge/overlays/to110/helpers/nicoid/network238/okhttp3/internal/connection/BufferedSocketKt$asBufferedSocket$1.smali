.class public final Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt;->asBufferedSocket(Lnicoid/network238/okio/Socket;)Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u000c\u001a\u00020\rH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0014\u0010\u0008\u001a\u00020\tX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000e"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1",
        "Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "delegate",
        "Lnicoid/network238/okio/Socket;",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "getSource",
        "()Lnicoid/network238/okio/BufferedSource;",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "getSink",
        "()Lnicoid/network238/okio/BufferedSink;",
        "cancel",
        "",
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
.field private final delegate:Lnicoid/network238/okio/Socket;

.field private final sink:Lnicoid/network238/okio/BufferedSink;

.field private final source:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/Socket;)V
    .registers 3

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1;->delegate:Lnicoid/network238/okio/Socket;

    .line 35
    invoke-interface {p1}, Lnicoid/network238/okio/Socket;->getSource()Lnicoid/network238/okio/Source;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1;->source:Lnicoid/network238/okio/BufferedSource;

    .line 36
    invoke-interface {p1}, Lnicoid/network238/okio/Socket;->getSink()Lnicoid/network238/okio/Sink;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1;->sink:Lnicoid/network238/okio/BufferedSink;

    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .line 39
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1;->delegate:Lnicoid/network238/okio/Socket;

    invoke-interface {v0}, Lnicoid/network238/okio/Socket;->cancel()V

    return-void
.end method

.method public getSink()Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 36
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1;->sink:Lnicoid/network238/okio/BufferedSink;

    return-object v0
.end method

.method public bridge synthetic getSink()Lnicoid/network238/okio/Sink;
    .registers 2

    .line 33
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    return-object v0
.end method

.method public getSource()Lnicoid/network238/okio/BufferedSource;
    .registers 2

    .line 35
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1;->source:Lnicoid/network238/okio/BufferedSource;

    return-object v0
.end method

.method public bridge synthetic getSource()Lnicoid/network238/okio/Source;
    .registers 2

    .line 33
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    return-object v0
.end method
