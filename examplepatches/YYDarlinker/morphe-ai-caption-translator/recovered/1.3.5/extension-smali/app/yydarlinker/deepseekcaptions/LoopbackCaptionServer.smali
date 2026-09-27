.class final Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;
.super Ljava/lang/Object;
.source "LoopbackCaptionServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;
    }
.end annotation


# static fields
.field private static final INVISIBLE_CUE:Ljava/lang/String; = "\u2060"

.field private static final STRUCTURAL_SINK_POLL_MS:J = 0x23L

.field private static final STRUCTURAL_SINK_WAIT_MS:J = 0x640L

.field private static final THREAD_IDS:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static volatile instance:Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;


# instance fields
.field private final context:Landroid/content/Context;

.field private volatile lastFallbackSourceKey:Ljava/lang/String;

.field private volatile lastMaskedSourceKey:Ljava/lang/String;

.field private final secret:Ljava/lang/String;

.field private final server:Ljava/net/ServerSocket;

.field private final workers:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public static synthetic $r8$lambda$Zb11Uf8YMP5soX5c0TuF1QgTUDY(Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;)V
    .registers 1

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->acceptLoop()V

    return-void
.end method

.method public static synthetic $r8$lambda$zzeRI7-L1vciEn7Yh0PCsZvwLAM(Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;Ljava/net/Socket;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->lambda$acceptLoop$0(Ljava/net/Socket;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetTHREAD_IDS()Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 1

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->THREAD_IDS:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 1

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->THREAD_IDS:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$1;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$1;-><init>(Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->workers:Ljava/util/concurrent/ExecutorService;

    .line 66
    const-string v0, ""

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->lastMaskedSourceKey:Ljava/lang/String;

    .line 67
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->lastFallbackSourceKey:Ljava/lang/String;

    .line 82
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->context:Landroid/content/Context;

    .line 83
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->randomSecret()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->secret:Ljava/lang/String;

    .line 84
    new-instance v0, Ljava/net/ServerSocket;

    const-string v1, "127.0.0.1"

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0x18

    invoke-direct {v0, v2, v3, v1}, Ljava/net/ServerSocket;-><init>(IILjava/net/InetAddress;)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->server:Ljava/net/ServerSocket;

    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u672c\u673a\u7a7a\u5b57\u5e55\u8f68\u7aef\u53e3 "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SERVER_STARTED"

    invoke-static {p1, v1, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$$ExternalSyntheticLambda0;-><init>(Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;)V

    const-string p0, "DeepSeekCaptionLoopback"

    invoke-direct {p1, v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p0, 0x1

    .line 87
    invoke-virtual {p1, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 88
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private acceptLoop()V
    .registers 4

    .line 101
    :cond_0
    :goto_0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->server:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_2e

    .line 103
    :try_start_8
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->server:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0

    .line 104
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->workers:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v0}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$$ExternalSyntheticLambda1;-><init>(Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;Ljava/net/Socket;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_18
    .catchall {:try_start_8 .. :try_end_18} :catchall_19

    goto :goto_0

    :catchall_19
    move-exception v0

    .line 106
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->server:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 107
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->context:Landroid/content/Context;

    const-string v2, "SERVER_ACCEPT_ERROR"

    .line 110
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->errorDetail(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    .line 107
    invoke-static {v1, v2, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2e
    return-void
.end method

.method private static drainBody(Ljava/io/BufferedInputStream;Ljava/util/Map;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/BufferedInputStream;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 362
    const-string v0, "transfer-encoding"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-wide/32 v1, 0x400000

    .line 363
    const-string v3, "request body too large"

    const-wide/16 v4, 0x0

    if-eqz v0, :cond_64

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v6, "chunked"

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_64

    :goto_1f
    const/16 p1, 0x400

    .line 366
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->readAsciiLine(Ljava/io/BufferedInputStream;I)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_28

    goto :goto_8b

    :cond_28
    const/16 v0, 0x3b

    .line 368
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_35

    const/4 v6, 0x0

    .line 370
    invoke-virtual {p1, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_35
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x10

    .line 369
    invoke-static {p1, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p1

    if-nez p1, :cond_50

    :cond_41
    const/16 p1, 0x1000

    .line 375
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->readAsciiLine(Ljava/io/BufferedInputStream;I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_8b

    .line 376
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_41

    goto :goto_8b

    :cond_50
    int-to-long v6, p1

    add-long/2addr v4, v6

    cmp-long p1, v4, v1

    if-gtz p1, :cond_5e

    .line 381
    invoke-static {p0, v6, v7}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->skipFully(Ljava/io/BufferedInputStream;J)V

    const/4 p1, 0x4

    .line 382
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->readAsciiLine(Ljava/io/BufferedInputStream;I)Ljava/lang/String;

    goto :goto_1f

    .line 380
    :cond_5e
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 386
    :cond_64
    const-string v0, "content-length"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_8b

    .line 387
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_75

    goto :goto_8b

    .line 388
    :cond_75
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    cmp-long p1, v6, v4

    if-ltz p1, :cond_85

    cmp-long p1, v6, v1

    if-gtz p1, :cond_85

    .line 392
    invoke-static {p0, v6, v7}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->skipFully(Ljava/io/BufferedInputStream;J)V

    return-void

    .line 390
    :cond_85
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_8b
    :goto_8b
    return-void
.end method

.method private static emptyTrackFor(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;
    .registers 4

    .line 301
    const-string v0, ""

    .line 303
    :try_start_2
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const-string v1, "fmt"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_15

    .line 304
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0
    :try_end_14
    .catchall {:try_start_2 .. :try_end_14} :catchall_15

    move-object v0, p0

    .line 308
    :catchall_15
    :cond_15
    const-string p0, "json"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_29

    .line 309
    new-instance p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;

    const-string v0, "application/json; charset=utf-8"

    .line 311
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->jsonOwnershipTrack()[B

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;-><init>(Ljava/lang/String;[B)V

    return-object p0

    .line 314
    :cond_29
    const-string p0, "vtt"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_41

    .line 315
    new-instance p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;

    const-string v0, "WEBVTT\n\n00:00.000 --> 99:59:59.999\n\u2060\n\n"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 318
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    const-string v1, "text/vtt; charset=utf-8"

    invoke-direct {p0, v1, v0}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;-><init>(Ljava/lang/String;[B)V

    return-object p0

    .line 321
    :cond_41
    const-string p0, "srv"

    invoke-virtual {v0, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    const-string v1, "application/xml; charset=utf-8"

    if-nez p0, :cond_62

    const-string p0, "ttml"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_54

    goto :goto_62

    .line 330
    :cond_54
    new-instance p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;

    const-string v0, "<?xml version=\"1.0\" encoding=\"utf-8\"?><transcript><text start=\"0\" dur=\"360000\">&#8288;</text></transcript>"

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 334
    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;-><init>(Ljava/lang/String;[B)V

    return-object p0

    .line 322
    :cond_62
    :goto_62
    new-instance p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;

    const-string v0, "<?xml version=\"1.0\" encoding=\"utf-8\"?><timedtext format=\"3\"><body><p t=\"0\" d=\"360000000\"><s>&#8288;</s></p></body></timedtext>"

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 327
    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;-><init>(Ljava/lang/String;[B)V

    return-object p0
.end method

.method static get(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 70
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->instance:Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;

    if-eqz v0, :cond_d

    .line 71
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->server:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v1

    if-nez v1, :cond_d

    return-object v0

    .line 72
    :cond_d
    const-class v0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;

    monitor-enter v0

    .line 73
    :try_start_10
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->instance:Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;

    if-eqz v1, :cond_1c

    .line 74
    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->server:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 75
    :cond_1c
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;-><init>(Landroid/content/Context;)V

    sput-object v1, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->instance:Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;

    .line 77
    :cond_27
    monitor-exit v0

    return-object v1

    :catchall_29
    move-exception p0

    .line 78
    monitor-exit v0
    :try_end_2b
    .catchall {:try_start_10 .. :try_end_2b} :catchall_29

    throw p0
.end method

.method private handle(Ljava/net/Socket;)V
    .registers 16

    const-string v0, "/"

    const/16 v3, 0x1388

    .line 119
    :try_start_4
    invoke-virtual {p1, v3}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 120
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const v4, 0x8000

    .line 121
    invoke-static {v3, v4}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->readAsciiLine(Ljava/io/BufferedInputStream;I)Ljava/lang/String;

    move-result-object v4
    :try_end_17
    .catchall {:try_start_4 .. :try_end_17} :catchall_131

    .line 122
    const-string v5, "Bad Request"

    const/16 v6, 0x190

    const/4 v7, 0x0

    if-eqz v4, :cond_128

    :try_start_1e
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_26

    goto/16 :goto_128

    .line 127
    :cond_26
    const-string v8, " "

    const/4 v9, 0x3

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    .line 128
    array-length v8, v4

    const/4 v9, 0x2

    if-ge v8, v9, :cond_38

    .line 129
    const-string v0, "invalid request line"

    invoke-static {p1, v6, v5, v0, v7}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->writeText(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_12d

    .line 132
    :cond_38
    aget-object v8, v4, v7

    sget-object v9, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    .line 133
    const-string v9, "GET"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9
    :try_end_46
    .catchall {:try_start_1e .. :try_end_46} :catchall_131

    const-string v10, "HEAD"

    if-nez v9, :cond_63

    :try_start_4a
    const-string v9, "POST"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_63

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_63

    .line 134
    const-string v0, "Method Not Allowed"

    const-string v3, "unsupported method"

    const/16 v4, 0x195

    invoke-static {p1, v4, v0, v3, v7}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->writeText(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_12d

    .line 138
    :cond_63
    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->readHeaders(Ljava/io/BufferedInputStream;)Ljava/util/Map;

    move-result-object v9

    .line 139
    const-string v11, "100-continue"

    const-string v12, "expect"

    invoke-interface {v9, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_89

    .line 140
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    .line 141
    const-string v12, "HTTP/1.1 100 Continue\r\n\r\n"

    sget-object v13, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/OutputStream;->write([B)V

    .line 142
    invoke-virtual {v11}, Ljava/io/OutputStream;->flush()V

    .line 144
    :cond_89
    invoke-static {v3, v9}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->drainBody(Ljava/io/BufferedInputStream;Ljava/util/Map;)V

    const/4 v3, 0x1

    .line 146
    aget-object v4, v4, v3

    const/16 v9, 0x3f

    .line 147
    invoke-virtual {v4, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    if-ltz v9, :cond_9c

    .line 148
    invoke-virtual {v4, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    goto :goto_9d

    :cond_9c
    move-object v7, v4

    .line 149
    :goto_9d
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->secret:Ljava/lang/String;

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/caption"

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c4

    .line 150
    const-string v0, "Not Found"

    const-string v3, "not found"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/16 v5, 0x194

    invoke-static {p1, v5, v0, v3, v4}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->writeText(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;Z)V

    goto :goto_12d

    :cond_c4
    if-ltz v9, :cond_cc

    add-int/2addr v9, v3

    .line 154
    invoke-virtual {v4, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_ce

    :cond_cc
    const-string v0, ""

    .line 155
    :goto_ce
    const-string v3, "u"

    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->queryValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_11e

    .line 156
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x6000

    if-le v3, v4, :cond_df

    goto :goto_11e

    .line 160
    :cond_df
    new-instance v3, Ljava/lang/String;

    const-string v4, "UTF-8"

    .line 162
    invoke-static {v0, v4}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v4, 0xb

    .line 161
    invoke-static {v0, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v0, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 167
    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isAutoTranslatedCaptionUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_106

    .line 168
    const-string v0, "Forbidden"

    const-string v3, "invalid caption url"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/16 v5, 0x193

    invoke-static {p1, v5, v0, v3, v4}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->writeText(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;Z)V

    goto :goto_12d

    .line 172
    :cond_106
    invoke-direct {p0, v3}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->ownershipTrackFor(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;

    move-result-object v0

    .line 173
    const-string v4, "OK"

    iget-object v5, v0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;->contentType:Ljava/lang/String;

    iget-object v6, v0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;->body:[B

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const/16 v3, 0xc8

    move-object v2, p1

    invoke-static/range {v2 .. v7}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->write(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;[BZ)V
    :try_end_11a
    .catchall {:try_start_4a .. :try_end_11a} :catchall_131

    .line 184
    :try_start_11a
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_11d
    .catchall {:try_start_11a .. :try_end_11d} :catchall_14f

    return-void

    .line 157
    :cond_11e
    :goto_11e
    :try_start_11e
    const-string v0, "missing caption url"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-static {p1, v6, v5, v0, v3}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->writeText(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;Z)V

    goto :goto_12d

    .line 123
    :cond_128
    :goto_128
    const-string v0, "empty request"

    invoke-static {p1, v6, v5, v0, v7}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->writeText(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;Z)V
    :try_end_12d
    .catchall {:try_start_11e .. :try_end_12d} :catchall_131

    .line 184
    :goto_12d
    :try_start_12d
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_130
    .catchall {:try_start_12d .. :try_end_130} :catchall_130

    :catchall_130
    return-void

    :catchall_131
    move-exception v0

    .line 175
    :try_start_132
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->context:Landroid/content/Context;

    const-string v3, "BRIDGE_ERROR"

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->errorDetail(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v3, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_13d
    .catchall {:try_start_132 .. :try_end_13d} :catchall_150

    .line 179
    :try_start_13d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->jsonOwnershipTrack()[B

    move-result-object v5

    .line 180
    const-string v3, "OK"

    const-string v4, "application/json; charset=utf-8"

    const/4 v6, 0x0

    const/16 v2, 0xc8

    move-object v1, p1

    invoke-static/range {v1 .. v6}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->write(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;[BZ)V
    :try_end_14c
    .catchall {:try_start_13d .. :try_end_14c} :catchall_14c

    .line 184
    :catchall_14c
    :try_start_14c
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_14f
    .catchall {:try_start_14c .. :try_end_14f} :catchall_14f

    :catchall_14f
    return-void

    :catchall_150
    move-exception v0

    :try_start_151
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_154
    .catchall {:try_start_151 .. :try_end_154} :catchall_154

    .line 185
    :catchall_154
    throw v0
.end method

.method private static jsonOwnershipTrack()[B
    .registers 2

    .line 339
    const-string v0, "{\"wireMagic\":\"pb3\",\"events\":[{\"tStartMs\":0,\"dDurationMs\":360000000,\"segs\":[{\"utf8\":\"\\u2060\"}]}]}"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 342
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    return-object v0
.end method

.method private synthetic lambda$acceptLoop$0(Ljava/net/Socket;)V
    .registers 2

    .line 104
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->handle(Ljava/net/Socket;)V

    return-void
.end method

.method private static maskAllJsonSegments([B)[B
    .registers 11

    .line 265
    const-string v0, "utf8"

    if-eqz p0, :cond_8b

    array-length v1, p0

    if-nez v1, :cond_9

    goto/16 :goto_8b

    .line 267
    :cond_9
    :try_start_9
    new-instance v1, Ljava/lang/String;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, p0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 268
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 269
    const-string v3, "{"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8b

    const-string v3, "\"events\""

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_26

    goto/16 :goto_8b

    .line 271
    :cond_26
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 272
    const-string v1, "events"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-nez v1, :cond_34

    goto :goto_8b

    :cond_34
    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    .line 275
    :goto_37
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v4, v6, :cond_7f

    .line 276
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-nez v6, :cond_44

    goto :goto_7c

    .line 278
    :cond_44
    const-string v7, "segs"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    if-eqz v6, :cond_7c

    .line 279
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-nez v7, :cond_53

    goto :goto_7c

    .line 280
    :cond_53
    invoke-virtual {v6, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    if-nez v5, :cond_61

    .line 282
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 283
    invoke-virtual {v6, v3, v5}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 285
    :cond_61
    const-string v7, "\u2060"

    invoke-virtual {v5, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const/4 v5, 0x1

    move v7, v5

    .line 286
    :goto_68
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v7, v8, :cond_7c

    .line 287
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    if-eqz v8, :cond_79

    .line 288
    const-string v9, ""

    invoke-virtual {v8, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_79
    add-int/lit8 v7, v7, 0x1

    goto :goto_68

    :cond_7c
    :goto_7c
    add-int/lit8 v4, v4, 0x1

    goto :goto_37

    :cond_7f
    if-eqz v5, :cond_8b

    .line 293
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0
    :try_end_8b
    .catchall {:try_start_9 .. :try_end_8b} :catchall_8b

    :catchall_8b
    :cond_8b
    :goto_8b
    return-object p0
.end method

.method private static maskSourceTrack([BLjava/lang/String;)Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 250
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parse([BLjava/lang/String;)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    move-result-object p0

    .line 251
    invoke-interface {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;->texts()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-gtz p1, :cond_10

    const/4 p0, 0x0

    return-object p0

    .line 254
    :cond_10
    const-string v0, "\u2060"

    invoke-static {p1, v0}, Ljava/util/Collections;->nCopies(ILjava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 255
    invoke-interface {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;->render(Ljava/util/List;)[B

    move-result-object p1

    .line 260
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->maskAllJsonSegments([B)[B

    move-result-object p1

    .line 261
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;

    invoke-interface {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;->contentType()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;-><init>(Ljava/lang/String;[B)V

    return-object v0
.end method

.method private ownershipTrackFor(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;
    .registers 9

    .line 196
    const-string v0, "NATIVE_RENDERER_MASK_FALLBACK"

    const-string v1, ""

    .line 198
    :try_start_4
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionEngine;->sourceCaptionUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 199
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 200
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->context:Landroid/content/Context;

    invoke-static {v2, v1}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->get(Landroid/content/Context;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;

    move-result-object v2

    .line 201
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    const-wide/16 v5, 0x640

    add-long/2addr v3, v5

    :goto_19
    if-nez v2, :cond_36

    .line 202
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5
    :try_end_1f
    .catchall {:try_start_4 .. :try_end_1f} :catchall_6c

    cmp-long v5, v5, v3

    if-gez v5, :cond_36

    const-wide/16 v5, 0x23

    .line 203
    :try_start_25
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_28
    .catch Ljava/lang/InterruptedException; {:try_start_25 .. :try_end_28} :catch_2f
    .catchall {:try_start_25 .. :try_end_28} :catchall_6c

    .line 208
    :try_start_28
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->context:Landroid/content/Context;

    invoke-static {v2, v1}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->get(Landroid/content/Context;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;

    move-result-object v2

    goto :goto_19

    .line 205
    :catch_2f
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    :cond_36
    if-eqz v2, :cond_56

    .line 212
    iget-object v3, v2, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;->body:[B

    iget-object v2, v2, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;->contentType:Ljava/lang/String;

    invoke-static {v3, v2}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->maskSourceTrack([BLjava/lang/String;)Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;

    move-result-object v2

    if-eqz v2, :cond_56

    .line 214
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->lastMaskedSourceKey:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_55

    .line 215
    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->lastMaskedSourceKey:Ljava/lang/String;

    .line 216
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->context:Landroid/content/Context;

    const-string v4, "NATIVE_RENDERER_MASKED"

    const-string v5, "\u539f\u751f renderer \u5df2\u63a5\u7ba1\u540c\u683c\u5f0f\u3001\u540c\u65f6\u95f4\u8f74\u7684\u4e0d\u53ef\u89c1\u955c\u50cf\u8f68\uff1b\u6e90\u5b57\u5e55\u4e0d\u4f1a\u4e0e AI \u53e0\u52a0"

    invoke-static {v3, v4, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_55
    .catchall {:try_start_28 .. :try_end_55} :catchall_6c

    :cond_55
    return-object v2

    .line 238
    :cond_56
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->lastFallbackSourceKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_67

    .line 239
    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->lastFallbackSourceKey:Ljava/lang/String;

    .line 240
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->context:Landroid/content/Context;

    const-string v1, "\u539f\u8f68\u5c1a\u672a\u5728\u77ed\u7b49\u5f85\u7a97\u53e3\u5185\u5c31\u7eea\uff0c\u9000\u56de\u4e0d\u53ef\u89c1 ownership \u8f68"

    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    :cond_67
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->emptyTrackFor(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;

    move-result-object p0

    return-object p0

    :catchall_6c
    move-exception v2

    .line 226
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->lastFallbackSourceKey:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8e

    .line 227
    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->lastFallbackSourceKey:Ljava/lang/String;

    .line 228
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->context:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "\u539f\u8f68\u955c\u50cf\u4e0d\u53ef\u7528\uff0c\u9000\u56de\u4e0d\u53ef\u89c1 ownership \u8f68\uff1a"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 232
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->errorDetail(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 228
    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    :cond_8e
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->emptyTrackFor(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;

    move-result-object p0

    return-object p0
.end method

.method private static queryValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 418
    const-string v0, "&"

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_a
    if-ge v2, v0, :cond_37

    aget-object v3, p0, v2

    const/16 v4, 0x3d

    .line 419
    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-gez v4, :cond_18

    move-object v5, v3

    goto :goto_1c

    .line 420
    :cond_18
    invoke-virtual {v3, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 422
    :goto_1c
    :try_start_1c
    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5
    :try_end_22
    .catchall {:try_start_1c .. :try_end_22} :catchall_22

    .line 424
    :catchall_22
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_34

    if-gez v4, :cond_2d

    const-string p0, ""

    goto :goto_33

    :cond_2d
    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :goto_33
    return-object p0

    :cond_34
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_37
    const/4 p0, 0x0

    return-object p0
.end method

.method private static randomSecret()Ljava/lang/String;
    .registers 2

    const/16 v0, 0x10

    .line 471
    new-array v0, v0, [B

    .line 472
    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    const/16 v1, 0xb

    .line 473
    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static readAsciiLine(Ljava/io/BufferedInputStream;I)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 406
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 407
    :cond_5
    :goto_5
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v1

    const-string v2, "US-ASCII"

    if-ge v1, p1, :cond_2d

    .line 408
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->read()I

    move-result v1

    if-gez v1, :cond_20

    .line 409
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result p0

    if-nez p0, :cond_1b

    const/4 p0, 0x0

    return-object p0

    :cond_1b
    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_20
    const/16 v3, 0xa

    if-ne v1, v3, :cond_25

    goto :goto_2d

    :cond_25
    const/16 v2, 0xd

    if-eq v1, v2, :cond_5

    .line 411
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_5

    .line 413
    :cond_2d
    :goto_2d
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result p0

    if-ge p0, p1, :cond_38

    .line 414
    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 413
    :cond_38
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "HTTP line too long"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static readHeaders(Ljava/io/BufferedInputStream;)Ljava/util/Map;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/BufferedInputStream;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 346
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    :goto_7
    const/16 v3, 0x64

    if-ge v2, v3, :cond_42

    const v3, 0x8000

    .line 348
    invoke-static {p0, v3}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->readAsciiLine(Ljava/io/BufferedInputStream;I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_42

    .line 349
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1b

    goto :goto_42

    :cond_1b
    const/16 v4, 0x3a

    .line 350
    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-gtz v4, :cond_24

    goto :goto_3f

    .line 353
    :cond_24
    invoke-virtual {v3, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    .line 354
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 352
    invoke-interface {v0, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_3f
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_42
    :goto_42
    return-object v0
.end method

.method private static sanitizeHeader(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    if-eqz p0, :cond_18

    .line 466
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_18

    .line 467
    :cond_9
    const-string v0, "\r"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\n"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 466
    :cond_18
    :goto_18
    const-string p0, "application/octet-stream"

    return-object p0
.end method

.method private static skipFully(Ljava/io/BufferedInputStream;J)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/16 v0, 0x2000

    .line 397
    new-array v0, v0, [B

    :goto_4
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-lez v1, :cond_23

    const-wide/16 v1, 0x2000

    .line 399
    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v1, v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v1

    if-ltz v1, :cond_1b

    int-to-long v1, v1

    sub-long/2addr p1, v1

    goto :goto_4

    .line 400
    :cond_1b
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "unexpected end of request body"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_23
    return-void
.end method

.method private static write(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;[BZ)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 454
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "HTTP/1.1 "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\r\nContent-Type: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    invoke-static {p3}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->sanitizeHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\r\nContent-Length: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p1, p4

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "\r\nCache-Control: no-store\r\nConnection: close\r\n\r\n"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 459
    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    .line 460
    sget-object p2, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    if-nez p5, :cond_42

    .line 461
    invoke-virtual {p0, p4}, Ljava/io/OutputStream;->write([B)V

    .line 462
    :cond_42
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    return-void
.end method

.method private static writeText(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;Z)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 436
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 441
    invoke-virtual {p3, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v5

    .line 436
    const-string v4, "text/plain; charset=utf-8"

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move v6, p4

    invoke-static/range {v1 .. v6}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->write(Ljava/net/Socket;ILjava/lang/String;Ljava/lang/String;[BZ)V

    return-void
.end method


# virtual methods
.method urlFor(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 92
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 93
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    const/16 v0, 0xb

    .line 92
    invoke-static {p1, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "http://127.0.0.1:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->server:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->secret:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/caption?u="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
