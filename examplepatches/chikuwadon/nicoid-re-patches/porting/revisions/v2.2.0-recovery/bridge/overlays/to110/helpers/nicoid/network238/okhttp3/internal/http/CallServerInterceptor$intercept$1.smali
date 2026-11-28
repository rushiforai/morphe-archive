.class public final Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor$intercept$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/TrailersSource;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor;->intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0013\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\n\u0010\u0002\u001a\u0004\u0018\u00010\u0003H\u0016J\u0008\u0010\u0004\u001a\u00020\u0003H\u0016\u00a8\u0006\u0005"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/http/CallServerInterceptor$intercept$1",
        "Lnicoid/network238/okhttp3/TrailersSource;",
        "peek",
        "Lnicoid/network238/okhttp3/Headers;",
        "get",
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
.field final synthetic $exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

.field final synthetic $responseBody:Lnicoid/network238/okhttp3/ResponseBody;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/ResponseBody;)V
    .registers 3

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor$intercept$1;->$exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor$intercept$1;->$responseBody:Lnicoid/network238/okhttp3/ResponseBody;

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get()Lnicoid/network238/okhttp3/Headers;
    .registers 3

    .line 168
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor$intercept$1;->$responseBody:Lnicoid/network238/okhttp3/ResponseBody;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    .line 165
    invoke-interface {v0}, Ljava/nio/channels/Channel;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 166
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->skipAll(Lnicoid/network238/okio/BufferedSource;)V

    .line 168
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor$intercept$1;->peek()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "null trailers after exhausting response body?!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public peek()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 161
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor$intercept$1;->$exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->peekTrailers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    return-object v0
.end method
