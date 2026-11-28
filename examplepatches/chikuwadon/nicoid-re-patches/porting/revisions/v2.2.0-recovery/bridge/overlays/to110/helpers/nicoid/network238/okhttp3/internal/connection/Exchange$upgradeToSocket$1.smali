.class public final Lnicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Socket;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/connection/Exchange;->upgradeToSocket()Lnicoid/network238/okio/Socket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016R\u0018\u0010\u0004\u001a\u00060\u0005R\u00020\u0006X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0018\u0010\t\u001a\u00060\nR\u00020\u0006X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1",
        "Lnicoid/network238/okio/Socket;",
        "cancel",
        "",
        "sink",
        "Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;",
        "Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "getSink",
        "()Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;",
        "source",
        "Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;",
        "getSource",
        "()Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;",
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
.field private final sink:Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;

.field private final source:Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/internal/connection/Exchange;)V
    .registers 14

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;

    .line 165
    # getter for: Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->access$getCodec$p(Lnicoid/network238/okhttp3/internal/connection/Exchange;)Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->getSocket()Lnicoid/network238/okio/Socket;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okio/Socket;->getSink()Lnicoid/network238/okio/Sink;

    move-result-object v2

    .line 164
    const-wide/16 v3, -0x1

    const/4 v5, 0x1

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;-><init>(Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okio/Sink;JZ)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1;->sink:Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;

    .line 170
    new-instance v6, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;

    .line 171
    # getter for: Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->access$getCodec$p(Lnicoid/network238/okhttp3/internal/connection/Exchange;)Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->getSocket()Lnicoid/network238/okio/Socket;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/okio/Socket;->getSource()Lnicoid/network238/okio/Source;

    move-result-object v8

    .line 170
    const-wide/16 v9, -0x1

    const/4 v11, 0x1

    move-object v7, v1

    invoke-direct/range {v6 .. v11}, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;-><init>(Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okio/Source;JZ)V

    iput-object v6, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1;->source:Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;

    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .line 160
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1;->this$0:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->cancel()V

    return-void
.end method

.method public getSink()Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;
    .registers 2

    .line 163
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1;->sink:Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;

    return-object v0
.end method

.method public bridge synthetic getSink()Lnicoid/network238/okio/Sink;
    .registers 2

    .line 158
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1;->getSink()Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;

    move-result-object v0

    return-object v0
.end method

.method public getSource()Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;
    .registers 2

    .line 169
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1;->source:Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;

    return-object v0
.end method

.method public bridge synthetic getSource()Lnicoid/network238/okio/Source;
    .registers 2

    .line 158
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1;->getSource()Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;

    move-result-object v0

    return-object v0
.end method
