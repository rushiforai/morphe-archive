.class public final Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion;->newTestConnection(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;Lnicoid/network238/okhttp3/Route;Ljava/net/Socket;J)Lnicoid/network238/okhttp3/internal/connection/RealConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0019\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0008\u001a\u00020\tH\u0016R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u0005R\u0014\u0010\u0006\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0005\u00a8\u0006\n"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1",
        "Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "getSink",
        "()Lnicoid/network238/okio/Buffer;",
        "source",
        "getSource",
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
.field private final sink:Lnicoid/network238/okio/Buffer;

.field private final source:Lnicoid/network238/okio/Buffer;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 439
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 440
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1;->sink:Lnicoid/network238/okio/Buffer;

    .line 441
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1;->source:Lnicoid/network238/okio/Buffer;

    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 1

    return-void
.end method

.method public getSink()Lnicoid/network238/okio/Buffer;
    .registers 2

    .line 440
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1;->sink:Lnicoid/network238/okio/Buffer;

    return-object v0
.end method

.method public bridge synthetic getSink()Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 439
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1;->getSink()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getSink()Lnicoid/network238/okio/Sink;
    .registers 2

    .line 439
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1;->getSink()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public getSource()Lnicoid/network238/okio/Buffer;
    .registers 2

    .line 441
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1;->source:Lnicoid/network238/okio/Buffer;

    return-object v0
.end method

.method public bridge synthetic getSource()Lnicoid/network238/okio/BufferedSource;
    .registers 2

    .line 439
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1;->getSource()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getSource()Lnicoid/network238/okio/Source;
    .registers 2

    .line 439
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1;->getSource()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    return-object v0
.end method
