.class public final Lnicoid/network238/okhttp3/Response;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/Response$Builder;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0082\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001:\u0001PB\u008d\u0001\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\u0006\u0010\u000c\u001a\u00020\r\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0011\u0012\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0000\u0012\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0000\u0012\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0000\u0012\u0006\u0010\u0015\u001a\u00020\u0016\u0012\u0006\u0010\u0017\u001a\u00020\u0016\u0012\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0019\u0012\u0006\u0010\u001a\u001a\u00020\u001b\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\r\u0010\u0002\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008/J\r\u0010\u0004\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u00080J\r\u0010\u0008\u001a\u00020\tH\u0007\u00a2\u0006\u0002\u00081J\r\u0010\u0006\u001a\u00020\u0007H\u0007\u00a2\u0006\u0002\u00085J\u000f\u0010\n\u001a\u0004\u0018\u00010\u000bH\u0007\u00a2\u0006\u0002\u00086J\u0014\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u0007072\u0006\u00108\u001a\u00020\u0007J\u001e\u00109\u001a\u0004\u0018\u00010\u00072\u0006\u00108\u001a\u00020\u00072\n\u0008\u0002\u0010:\u001a\u0004\u0018\u00010\u0007H\u0007J\r\u0010\u000c\u001a\u00020\rH\u0007\u00a2\u0006\u0002\u0008;J\u0006\u0010<\u001a\u00020\rJ\u0008\u0010=\u001a\u0004\u0018\u00010\rJ\u000e\u0010>\u001a\u00020\u000f2\u0006\u0010?\u001a\u00020\u0016J\r\u0010\u000e\u001a\u00020\u000fH\u0007\u00a2\u0006\u0002\u0008@J\u0006\u0010A\u001a\u00020BJ\u000f\u0010\u0012\u001a\u0004\u0018\u00010\u0000H\u0007\u00a2\u0006\u0002\u0008DJ\u000f\u0010\u0013\u001a\u0004\u0018\u00010\u0000H\u0007\u00a2\u0006\u0002\u0008EJ\u000f\u0010\u0014\u001a\u0004\u0018\u00010\u0000H\u0007\u00a2\u0006\u0002\u0008FJ\u000c\u0010G\u001a\u0008\u0012\u0004\u0012\u00020H07J\r\u0010I\u001a\u00020*H\u0007\u00a2\u0006\u0002\u0008JJ\r\u0010\u0015\u001a\u00020\u0016H\u0007\u00a2\u0006\u0002\u0008KJ\r\u0010\u0017\u001a\u00020\u0016H\u0007\u00a2\u0006\u0002\u0008LJ\u0008\u0010M\u001a\u00020NH\u0016J\u0008\u0010O\u001a\u00020\u0007H\u0016R\u0013\u0010\u0002\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u001eR\u0013\u0010\u0004\u001a\u00020\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u001fR\u0013\u0010\u0006\u001a\u00020\u00078\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010 R\u0013\u0010\u0008\u001a\u00020\t8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010!R\u0015\u0010\n\u001a\u0004\u0018\u00010\u000b8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\"R\u0013\u0010\u000c\u001a\u00020\r8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010#R\u0013\u0010\u000e\u001a\u00020\u000f8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010$R\u0015\u0010\u0010\u001a\u0004\u0018\u00010\u00118\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010%R\u0015\u0010\u0012\u001a\u0004\u0018\u00010\u00008\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010&R\u0015\u0010\u0013\u001a\u0004\u0018\u00010\u00008\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010&R\u0015\u0010\u0014\u001a\u0004\u0018\u00010\u00008\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010&R\u0013\u0010\u0015\u001a\u00020\u00168\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\'R\u0013\u0010\u0017\u001a\u00020\u00168\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\'R\u0018\u0010\u0018\u001a\u0004\u0018\u00010\u00198\u0001X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0018\u0010(R\u000e\u0010\u001a\u001a\u00020\u001bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u0010)\u001a\u0004\u0018\u00010*X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008+\u0010,\"\u0004\u0008-\u0010.R\u0011\u00102\u001a\u000203\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00082\u00104R\u0011\u0010C\u001a\u000203\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008C\u00104R\u0011\u0010I\u001a\u00020*8G\u00a2\u0006\u0006\u001a\u0004\u0008I\u0010,\u00a8\u0006Q"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Response;",
        "Ljava/io/Closeable;",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "protocol",
        "Lnicoid/network238/okhttp3/Protocol;",
        "message",
        "",
        "code",
        "",
        "handshake",
        "Lnicoid/network238/okhttp3/Handshake;",
        "headers",
        "Lnicoid/network238/okhttp3/Headers;",
        "body",
        "Lnicoid/network238/okhttp3/ResponseBody;",
        "socket",
        "Lnicoid/network238/okio/Socket;",
        "networkResponse",
        "cacheResponse",
        "priorResponse",
        "sentRequestAtMillis",
        "",
        "receivedResponseAtMillis",
        "exchange",
        "Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "trailersSource",
        "Lnicoid/network238/okhttp3/TrailersSource;",
        "<init>",
        "(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Protocol;Ljava/lang/String;ILnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/ResponseBody;Lnicoid/network238/okio/Socket;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Response;JJLnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/TrailersSource;)V",
        "()Lnicoid/network238/okhttp3/Request;",
        "()Lnicoid/network238/okhttp3/Protocol;",
        "()Ljava/lang/String;",
        "()I",
        "()Lnicoid/network238/okhttp3/Handshake;",
        "()Lnicoid/network238/okhttp3/Headers;",
        "()Lnicoid/network238/okhttp3/ResponseBody;",
        "()Lnicoid/network238/okio/Socket;",
        "()Lnicoid/network238/okhttp3/Response;",
        "()J",
        "()Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "lazyCacheControl",
        "Lnicoid/network238/okhttp3/CacheControl;",
        "getLazyCacheControl$okhttp",
        "()Lnicoid/network238/okhttp3/CacheControl;",
        "setLazyCacheControl$okhttp",
        "(Lnicoid/network238/okhttp3/CacheControl;)V",
        "-deprecated_request",
        "-deprecated_protocol",
        "-deprecated_code",
        "isSuccessful",
        "",
        "()Z",
        "-deprecated_message",
        "-deprecated_handshake",
        "",
        "name",
        "header",
        "defaultValue",
        "-deprecated_headers",
        "trailers",
        "peekTrailers",
        "peekBody",
        "byteCount",
        "-deprecated_body",
        "newBuilder",
        "Lnicoid/network238/okhttp3/Response$Builder;",
        "isRedirect",
        "-deprecated_networkResponse",
        "-deprecated_cacheResponse",
        "-deprecated_priorResponse",
        "challenges",
        "Lnicoid/network238/okhttp3/Challenge;",
        "cacheControl",
        "-deprecated_cacheControl",
        "-deprecated_sentRequestAtMillis",
        "-deprecated_receivedResponseAtMillis",
        "close",
        "",
        "toString",
        "Builder",
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
.field private final body:Lnicoid/network238/okhttp3/ResponseBody;

.field private final cacheResponse:Lnicoid/network238/okhttp3/Response;

.field private final code:I

.field private final exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

.field private final handshake:Lnicoid/network238/okhttp3/Handshake;

.field private final headers:Lnicoid/network238/okhttp3/Headers;

.field private final isRedirect:Z

.field private final isSuccessful:Z

.field private lazyCacheControl:Lnicoid/network238/okhttp3/CacheControl;

.field private final message:Ljava/lang/String;

.field private final networkResponse:Lnicoid/network238/okhttp3/Response;

.field private final priorResponse:Lnicoid/network238/okhttp3/Response;

.field private final protocol:Lnicoid/network238/okhttp3/Protocol;

.field private final receivedResponseAtMillis:J

.field private final request:Lnicoid/network238/okhttp3/Request;

.field private final sentRequestAtMillis:J

.field private final socket:Lnicoid/network238/okio/Socket;

.field private trailersSource:Lnicoid/network238/okhttp3/TrailersSource;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Protocol;Ljava/lang/String;ILnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/ResponseBody;Lnicoid/network238/okio/Socket;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Response;JJLnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/TrailersSource;)V
    .registers 18

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p17 .. p17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response;->request:Lnicoid/network238/okhttp3/Request;

    .line 57
    iput-object p2, p0, Lnicoid/network238/okhttp3/Response;->protocol:Lnicoid/network238/okhttp3/Protocol;

    .line 59
    iput-object p3, p0, Lnicoid/network238/okhttp3/Response;->message:Ljava/lang/String;

    .line 61
    iput p4, p0, Lnicoid/network238/okhttp3/Response;->code:I

    .line 66
    iput-object p5, p0, Lnicoid/network238/okhttp3/Response;->handshake:Lnicoid/network238/okhttp3/Handshake;

    .line 68
    iput-object p6, p0, Lnicoid/network238/okhttp3/Response;->headers:Lnicoid/network238/okhttp3/Headers;

    .line 80
    iput-object p7, p0, Lnicoid/network238/okhttp3/Response;->body:Lnicoid/network238/okhttp3/ResponseBody;

    .line 84
    iput-object p8, p0, Lnicoid/network238/okhttp3/Response;->socket:Lnicoid/network238/okio/Socket;

    .line 90
    iput-object p9, p0, Lnicoid/network238/okhttp3/Response;->networkResponse:Lnicoid/network238/okhttp3/Response;

    .line 96
    iput-object p10, p0, Lnicoid/network238/okhttp3/Response;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    .line 103
    iput-object p11, p0, Lnicoid/network238/okhttp3/Response;->priorResponse:Lnicoid/network238/okhttp3/Response;

    .line 109
    iput-wide p12, p0, Lnicoid/network238/okhttp3/Response;->sentRequestAtMillis:J

    .line 115
    iput-wide p14, p0, Lnicoid/network238/okhttp3/Response;->receivedResponseAtMillis:J

    .line 116
    move-object/from16 p1, p16

    iput-object p1, p0, Lnicoid/network238/okhttp3/Response;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    .line 117
    move-object/from16 p1, p17

    iput-object p1, p0, Lnicoid/network238/okhttp3/Response;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;

    const/16 p1, 0xc8

    const/4 p2, 0x1

    const/4 p3, 0x0

    if-gt p1, p4, :cond_0

    const/16 p1, 0x12c

    if-ge p4, p1, :cond_0

    move p1, p2

    goto :goto_0

    :cond_0
    move p1, p3

    .line 149
    :goto_0
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/Response;->isSuccessful:Z

    packed-switch p4, :pswitch_data_0

    :pswitch_0
    move p2, p3

    .line 252
    :pswitch_1
    iput-boolean p2, p0, Lnicoid/network238/okhttp3/Response;->isRedirect:Z

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x12c
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static final synthetic access$getTrailersSource$p(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/TrailersSource;
    .registers 1

    .line 41
    iget-object p0, p0, Lnicoid/network238/okhttp3/Response;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;

    return-object p0
.end method

.method public static synthetic header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 170
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_body()Lnicoid/network238/okhttp3/ResponseBody;
    .registers 2

    .line 246
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->body:Lnicoid/network238/okhttp3/ResponseBody;

    return-object v0
.end method

.method public final -deprecated_cacheControl()Lnicoid/network238/okhttp3/CacheControl;
    .registers 2

    .line 323
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    return-object v0
.end method

.method public final -deprecated_cacheResponse()Lnicoid/network238/okhttp3/Response;
    .registers 2

    .line 271
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    return-object v0
.end method

.method public final -deprecated_code()I
    .registers 2

    .line 143
    iget v0, p0, Lnicoid/network238/okhttp3/Response;->code:I

    return v0
.end method

.method public final -deprecated_handshake()Lnicoid/network238/okhttp3/Handshake;
    .registers 2

    .line 165
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->handshake:Lnicoid/network238/okhttp3/Handshake;

    return-object v0
.end method

.method public final -deprecated_headers()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 181
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->headers:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method

.method public final -deprecated_message()Ljava/lang/String;
    .registers 2

    .line 157
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->message:Ljava/lang/String;

    return-object v0
.end method

.method public final -deprecated_networkResponse()Lnicoid/network238/okhttp3/Response;
    .registers 2

    .line 263
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->networkResponse:Lnicoid/network238/okhttp3/Response;

    return-object v0
.end method

.method public final -deprecated_priorResponse()Lnicoid/network238/okhttp3/Response;
    .registers 2

    .line 279
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->priorResponse:Lnicoid/network238/okhttp3/Response;

    return-object v0
.end method

.method public final -deprecated_protocol()Lnicoid/network238/okhttp3/Protocol;
    .registers 2

    .line 135
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->protocol:Lnicoid/network238/okhttp3/Protocol;

    return-object v0
.end method

.method public final -deprecated_receivedResponseAtMillis()J
    .registers 3

    .line 339
    iget-wide v0, p0, Lnicoid/network238/okhttp3/Response;->receivedResponseAtMillis:J

    return-wide v0
.end method

.method public final -deprecated_request()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 127
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->request:Lnicoid/network238/okhttp3/Request;

    return-object v0
.end method

.method public final -deprecated_sentRequestAtMillis()J
    .registers 3

    .line 331
    iget-wide v0, p0, Lnicoid/network238/okhttp3/Response;->sentRequestAtMillis:J

    return-wide v0
.end method

.method public final body()Lnicoid/network238/okhttp3/ResponseBody;
    .registers 2

    .line 80
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->body:Lnicoid/network238/okhttp3/ResponseBody;

    return-object v0
.end method

.method public final cacheControl()Lnicoid/network238/okhttp3/CacheControl;
    .registers 3

    .line 309
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->lazyCacheControl:Lnicoid/network238/okhttp3/CacheControl;

    if-nez v0, :cond_0

    .line 311
    sget-object v0, Lnicoid/network238/okhttp3/CacheControl;->Companion:Lnicoid/network238/okhttp3/CacheControl$Companion;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Response;->headers:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/CacheControl$Companion;->parse(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    .line 312
    iput-object v0, p0, Lnicoid/network238/okhttp3/Response;->lazyCacheControl:Lnicoid/network238/okhttp3/CacheControl;

    :cond_0
    return-object v0
.end method

.method public final cacheResponse()Lnicoid/network238/okhttp3/Response;
    .registers 2

    .line 96
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    return-object v0
.end method

.method public final challenges()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Challenge;",
            ">;"
        }
    .end annotation

    .line 293
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->headers:Lnicoid/network238/okhttp3/Headers;

    .line 294
    iget v1, p0, Lnicoid/network238/okhttp3/Response;->code:I

    const/16 v2, 0x191

    if-eq v1, v2, :cond_1

    const/16 v2, 0x197

    if-eq v1, v2, :cond_0

    .line 297
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 296
    :cond_0
    const-string v1, "Proxy-Authenticate"

    goto :goto_0

    .line 295
    :cond_1
    const-string v1, "WWW-Authenticate"

    .line 293
    :goto_0
    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->parseChallenges(Lnicoid/network238/okhttp3/Headers;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .registers 2

    .line 348
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->body:Lnicoid/network238/okhttp3/ResponseBody;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->close()V

    return-void
.end method

.method public final code()I
    .registers 2

    .line 61
    iget v0, p0, Lnicoid/network238/okhttp3/Response;->code:I

    return v0
.end method

.method public final exchange()Lnicoid/network238/okhttp3/internal/connection/Exchange;
    .registers 2

    .line 116
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    return-object v0
.end method

.method public final getLazyCacheControl$okhttp()Lnicoid/network238/okhttp3/CacheControl;
    .registers 2

    .line 119
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->lazyCacheControl:Lnicoid/network238/okhttp3/CacheControl;

    return-object v0
.end method

.method public final handshake()Lnicoid/network238/okhttp3/Handshake;
    .registers 2

    .line 66
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->handshake:Lnicoid/network238/okhttp3/Handshake;

    return-object v0
.end method

.method public final header(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, v1, v0}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 173
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->headers:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    :cond_0
    return-object p1
.end method

.method public final headers(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 167
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->headers:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public final headers()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 68
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->headers:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method

.method public final isRedirect()Z
    .registers 2

    .line 251
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Response;->isRedirect:Z

    return v0
.end method

.method public final isSuccessful()Z
    .registers 2

    .line 149
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/Response;->isSuccessful:Z

    return v0
.end method

.method public final message()Ljava/lang/String;
    .registers 2

    .line 59
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->message:Ljava/lang/String;

    return-object v0
.end method

.method public final networkResponse()Lnicoid/network238/okhttp3/Response;
    .registers 2

    .line 90
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->networkResponse:Lnicoid/network238/okhttp3/Response;

    return-object v0
.end method

.method public final newBuilder()Lnicoid/network238/okhttp3/Response$Builder;
    .registers 2

    .line 248
    new-instance v0, Lnicoid/network238/okhttp3/Response$Builder;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/Response$Builder;-><init>(Lnicoid/network238/okhttp3/Response;)V

    return-object v0
.end method

.method public final peekBody(J)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 233
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->body:Lnicoid/network238/okhttp3/ResponseBody;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->peek()Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    .line 234
    new-instance v1, Lnicoid/network238/okio/Buffer;

    invoke-direct {v1}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 235
    invoke-interface {v0, p1, p2}, Lnicoid/network238/okio/BufferedSource;->request(J)Z

    .line 236
    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    invoke-virtual {v1, v0, p1, p2}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Source;J)Lnicoid/network238/okio/Buffer;

    .line 237
    sget-object p1, Lnicoid/network238/okhttp3/ResponseBody;->Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

    iget-object p2, p0, Lnicoid/network238/okhttp3/Response;->body:Lnicoid/network238/okhttp3/ResponseBody;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/ResponseBody;->contentType()Lnicoid/network238/okhttp3/MediaType;

    move-result-object p2

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    invoke-virtual {p1, v1, p2, v2, v3}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;J)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    return-object p1
.end method

.method public final peekTrailers()Lnicoid/network238/okhttp3/Headers;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/TrailersSource;->peek()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    return-object v0
.end method

.method public final priorResponse()Lnicoid/network238/okhttp3/Response;
    .registers 2

    .line 103
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->priorResponse:Lnicoid/network238/okhttp3/Response;

    return-object v0
.end method

.method public final protocol()Lnicoid/network238/okhttp3/Protocol;
    .registers 2

    .line 57
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->protocol:Lnicoid/network238/okhttp3/Protocol;

    return-object v0
.end method

.method public final receivedResponseAtMillis()J
    .registers 3

    .line 115
    iget-wide v0, p0, Lnicoid/network238/okhttp3/Response;->receivedResponseAtMillis:J

    return-wide v0
.end method

.method public final request()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 55
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->request:Lnicoid/network238/okhttp3/Request;

    return-object v0
.end method

.method public final sentRequestAtMillis()J
    .registers 3

    .line 109
    iget-wide v0, p0, Lnicoid/network238/okhttp3/Response;->sentRequestAtMillis:J

    return-wide v0
.end method

.method public final setLazyCacheControl$okhttp(Lnicoid/network238/okhttp3/CacheControl;)V
    .registers 2

    .line 119
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response;->lazyCacheControl:Lnicoid/network238/okhttp3/CacheControl;

    return-void
.end method

.method public final socket()Lnicoid/network238/okio/Socket;
    .registers 2

    .line 84
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->socket:Lnicoid/network238/okio/Socket;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 351
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Response{protocol="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okhttp3/Response;->protocol:Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/okhttp3/Response;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", message="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/Response;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/Response;->request:Lnicoid/network238/okhttp3/Request;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final trailers()Lnicoid/network238/okhttp3/Headers;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 198
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/TrailersSource;->get()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    return-object v0
.end method
