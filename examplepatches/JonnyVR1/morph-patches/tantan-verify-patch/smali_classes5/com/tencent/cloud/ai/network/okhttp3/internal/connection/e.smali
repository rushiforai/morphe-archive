.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;
.super Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$e;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/h;


# static fields
.field public static final synthetic r:Z = true


# instance fields
.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

.field public final c:Lcom/tencent/cloud/ai/network/okhttp3/s;

.field public d:Ljava/net/Socket;

.field public e:Ljava/net/Socket;

.field public f:Lcom/tencent/cloud/ai/network/okhttp3/n;

.field public g:Lcom/tencent/cloud/ai/network/okhttp3/q;

.field public h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

.field public i:Lcom/tencent/cloud/ai/network/okio/g;

.field public j:Lcom/tencent/cloud/ai/network/okio/f;

.field public k:Z

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public final p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/Reference<",
            "Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;",
            ">;>;"
        }
    .end annotation
.end field

.field public q:J


# direct methods
.method public static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;Lcom/tencent/cloud/ai/network/okhttp3/s;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->o:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->p:Ljava/util/List;

    .line 13
    .line 14
    const-wide v0, 0x7fffffffffffffffL

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->q:J

    .line 20
    .line 21
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 22
    .line 23
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;)Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;
    .locals 4

    .line 596
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    if-eqz v0, :cond_0

    .line 597
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;

    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    invoke-direct {v0, p1, p0, p2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;)V

    return-object v0

    .line 598
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    invoke-interface {p2}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->readTimeoutMillis()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 599
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    move-result-object v0

    invoke-interface {p2}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->readTimeoutMillis()I

    move-result v1

    int-to-long v1, v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/x;->a(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okio/x;

    .line 600
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->j:Lcom/tencent/cloud/ai/network/okio/f;

    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/v;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    move-result-object v0

    invoke-interface {p2}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->writeTimeoutMillis()I

    move-result p2

    int-to-long v1, p2

    invoke-virtual {v0, v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/x;->a(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okio/x;

    .line 601
    new-instance p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->j:Lcom/tencent/cloud/ai/network/okio/f;

    invoke-direct {p2, p1, p0, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;Lcom/tencent/cloud/ai/network/okio/g;Lcom/tencent/cloud/ai/network/okio/f;)V

    return-object p2
.end method

.method public final a(I)V
    .locals 7

    .line 481
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 482
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;-><init>(Z)V

    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 483
    iget-object v4, v4, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 484
    iget-object v4, v4, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 485
    iget-object v4, v4, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 486
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    iget-object v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->j:Lcom/tencent/cloud/ai/network/okio/f;

    .line 487
    iput-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;->a:Ljava/net/Socket;

    .line 488
    iput-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;->b:Ljava/lang/String;

    .line 489
    iput-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;->c:Lcom/tencent/cloud/ai/network/okio/g;

    .line 490
    iput-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 491
    iput-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$e;

    .line 492
    iput p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;->h:I

    .line 493
    new-instance p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    invoke-direct {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$c;)V

    .line 494
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 495
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    monitor-enter p0

    .line 496
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->e:Z

    if-nez v0, :cond_8

    .line 497
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    goto :goto_1

    .line 498
    :cond_0
    :try_start_1
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->g:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 499
    sget-object v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, ">> CONNECTION %s"

    invoke-static {v4, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto/16 :goto_6

    .line 500
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a:Lcom/tencent/cloud/ai/network/okio/f;

    sget-object v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->toByteArray()[B

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/tencent/cloud/ai/network/okio/f;->a([B)Lcom/tencent/cloud/ai/network/okio/f;

    .line 501
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a:Lcom/tencent/cloud/ai/network/okio/f;

    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/f;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    .line 502
    :goto_1
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->s:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    monitor-enter p0

    .line 503
    :try_start_2
    iget-boolean v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->e:Z

    if-nez v3, :cond_7

    .line 504
    iget v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a:I

    invoke-static {v3}, Ljava/lang/Integer;->bitCount(I)I

    move-result v3

    mul-int/lit8 v3, v3, 0x6

    const/4 v4, 0x4

    .line 505
    invoke-virtual {p0, v1, v3, v4, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a(IIBB)V

    move v3, v1

    :goto_2
    const/16 v5, 0xa

    if-ge v3, v5, :cond_5

    shl-int v5, v2, v3

    .line 506
    iget v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a:I

    and-int/2addr v5, v6

    if-eqz v5, :cond_4

    if-ne v3, v4, :cond_2

    const/4 v5, 0x3

    goto :goto_3

    :cond_2
    const/4 v5, 0x7

    if-ne v3, v5, :cond_3

    move v5, v4

    goto :goto_3

    :cond_3
    move v5, v3

    .line 507
    :goto_3
    iget-object v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a:Lcom/tencent/cloud/ai/network/okio/f;

    invoke-interface {v6, v5}, Lcom/tencent/cloud/ai/network/okio/f;->a(I)Lcom/tencent/cloud/ai/network/okio/f;

    .line 508
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a:Lcom/tencent/cloud/ai/network/okio/f;

    .line 509
    iget-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->b:[I

    aget v6, v6, v3

    .line 510
    invoke-interface {v5, v6}, Lcom/tencent/cloud/ai/network/okio/f;->b(I)Lcom/tencent/cloud/ai/network/okio/f;

    goto :goto_4

    :catchall_1
    move-exception p1

    goto :goto_5

    :cond_4
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 511
    :cond_5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a:Lcom/tencent/cloud/ai/network/okio/f;

    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/f;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit p0

    .line 512
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->s:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a()I

    move-result p0

    const v0, 0xffff

    if-eq p0, v0, :cond_6

    .line 513
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    sub-int/2addr p0, v0

    int-to-long v3, p0

    invoke-virtual {v2, v1, v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a(IJ)V

    .line 514
    :cond_6
    new-instance p0, Ljava/lang/Thread;

    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->w:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    return-void

    .line 515
    :cond_7
    :try_start_3
    new-instance p1, Ljava/io/IOException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_5
    monitor-exit p0

    throw p1

    .line 516
    :cond_8
    :try_start_4
    new-instance p1, Ljava/io/IOException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :goto_6
    monitor-exit p0

    throw p1
.end method

.method public a(IIIIZLcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V
    .locals 13

    .line 517
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->g:Lcom/tencent/cloud/ai/network/okhttp3/q;

    if-nez v0, :cond_13

    .line 518
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 519
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 520
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/a;->f:Ljava/util/List;

    .line 521
    new-instance v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;

    invoke-direct {v7, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;-><init>(Ljava/util/List;)V

    .line 522
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 523
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 524
    iget-object v2, v1, Lcom/tencent/cloud/ai/network/okhttp3/a;->i:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v2, :cond_2

    .line 525
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/j;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 526
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 527
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 528
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 529
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 530
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 531
    invoke-virtual {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->b(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 532
    :cond_0
    new-instance p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;

    new-instance p1, Ljava/net/UnknownServiceException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "CLEARTEXT communication to "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " not permitted by network security policy"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;-><init>(Ljava/io/IOException;)V

    throw p0

    .line 533
    :cond_1
    new-instance p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;

    new-instance p1, Ljava/net/UnknownServiceException;

    const-string p2, "CLEARTEXT communication not enabled for client"

    invoke-direct {p1, p2}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;-><init>(Ljava/io/IOException;)V

    throw p0

    .line 534
    :cond_2
    iget-object v0, v1, Lcom/tencent/cloud/ai/network/okhttp3/a;->e:Ljava/util/List;

    .line 535
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/q;->f:Lcom/tencent/cloud/ai/network/okhttp3/q;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    :goto_0
    const/4 v8, 0x0

    move-object v9, v8

    .line 536
    :goto_1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/s;->a()Z

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    if-eqz v0, :cond_4

    move-object v1, p0

    move v2, p1

    move v3, p2

    move/from16 v4, p3

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    .line 537
    :try_start_1
    invoke-virtual/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a(IIILcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V

    .line 538
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    if-nez v0, :cond_3

    goto :goto_4

    :cond_3
    :goto_2
    move/from16 v4, p4

    goto :goto_3

    :catch_0
    move-exception v0

    move/from16 v4, p4

    goto/16 :goto_a

    :cond_4
    move-object/from16 v5, p6

    move-object/from16 v6, p7

    .line 539
    invoke-virtual {p0, p1, p2, v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a(IILcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 540
    :goto_3
    :try_start_2
    invoke-virtual {p0, v7, v4, v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;ILcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V

    .line 541
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 542
    iget-object v10, v0, Lcom/tencent/cloud/ai/network/okhttp3/s;->c:Ljava/net/InetSocketAddress;

    .line 543
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/s;->b:Ljava/net/Proxy;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    if-eqz v6, :cond_9

    .line 544
    :goto_4
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/s;->a()Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    if-eqz p1, :cond_5

    goto :goto_5

    .line 545
    :cond_5
    new-instance p0, Ljava/net/ProtocolException;

    const-string p1, "Too many tunnel connections attempted: 21"

    invoke-direct {p0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 546
    new-instance p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;

    invoke-direct {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;-><init>(Ljava/io/IOException;)V

    throw p1

    .line 547
    :cond_6
    :goto_5
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    if-eqz p1, :cond_8

    .line 548
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    monitor-enter p1

    .line 549
    :try_start_3
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    monitor-enter p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 550
    :try_start_4
    iget-object v0, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->t:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 551
    iget v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a:I

    and-int/lit8 v2, v2, 0x10

    if-eqz v2, :cond_7

    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->b:[I

    const/4 v2, 0x4

    aget v0, v0, v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_6

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_7

    :cond_7
    const v0, 0x7fffffff

    :goto_6
    :try_start_5
    monitor-exit p2

    .line 552
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->o:I

    .line 553
    monitor-exit p1

    goto :goto_9

    :catchall_1
    move-exception v0

    move-object p0, v0

    goto :goto_8

    :goto_7
    monitor-exit p2

    throw p0

    :goto_8
    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw p0

    :cond_8
    :goto_9
    return-void

    .line 554
    :cond_9
    :try_start_6
    throw v8
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    :catch_1
    move-exception v0

    goto :goto_a

    :catch_2
    move-exception v0

    move/from16 v4, p4

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    .line 555
    :goto_a
    iget-object v10, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    invoke-static {v10}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/net/Socket;)V

    .line 556
    iget-object v10, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    invoke-static {v10}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/net/Socket;)V

    .line 557
    iput-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    .line 558
    iput-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    .line 559
    iput-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    .line 560
    iput-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->j:Lcom/tencent/cloud/ai/network/okio/f;

    .line 561
    iput-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->f:Lcom/tencent/cloud/ai/network/okhttp3/n;

    .line 562
    iput-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->g:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 563
    iput-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 564
    iget-object v10, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 565
    iget-object v10, v10, Lcom/tencent/cloud/ai/network/okhttp3/s;->c:Ljava/net/InetSocketAddress;

    .line 566
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v9, :cond_a

    .line 567
    new-instance v9, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;

    invoke-direct {v9, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;-><init>(Ljava/io/IOException;)V

    goto :goto_b

    .line 568
    :cond_a
    iget-object v10, v9, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;->a:Ljava/io/IOException;

    .line 569
    sget-object v11, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->j:Ljava/lang/reflect/Method;

    if-eqz v11, :cond_b

    .line 570
    :try_start_7
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v10, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_7 .. :try_end_7} :catch_3

    .line 571
    :catch_3
    :cond_b
    iput-object v0, v9, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;->b:Ljava/io/IOException;

    :goto_b
    if-eqz p5, :cond_11

    const/4 v10, 0x1

    .line 572
    iput-boolean v10, v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->d:Z

    .line 573
    iget-boolean v10, v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->c:Z

    if-nez v10, :cond_c

    goto :goto_c

    .line 574
    :cond_c
    instance-of v10, v0, Ljava/net/ProtocolException;

    if-eqz v10, :cond_d

    goto :goto_c

    .line 575
    :cond_d
    instance-of v10, v0, Ljava/io/InterruptedIOException;

    if-eqz v10, :cond_e

    goto :goto_c

    .line 576
    :cond_e
    instance-of v10, v0, Ljavax/net/ssl/SSLHandshakeException;

    if-eqz v10, :cond_f

    .line 577
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v10

    instance-of v10, v10, Ljava/security/cert/CertificateException;

    if-eqz v10, :cond_f

    goto :goto_c

    .line 578
    :cond_f
    instance-of v10, v0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    if-eqz v10, :cond_10

    :goto_c
    const/4 v0, 0x0

    goto :goto_d

    .line 579
    :cond_10
    instance-of v0, v0, Ljavax/net/ssl/SSLException;

    :goto_d
    if-eqz v0, :cond_11

    goto/16 :goto_1

    .line 580
    :cond_11
    throw v9

    .line 581
    :cond_12
    new-instance p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;

    new-instance p1, Ljava/net/UnknownServiceException;

    const-string p2, "H2_PRIOR_KNOWLEDGE cannot be used with HTTPS"

    invoke-direct {p1, p2}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;-><init>(Ljava/io/IOException;)V

    throw p0

    .line 582
    :cond_13
    const-string p0, "already connected"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return-void
.end method

.method public final a(IIILcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 6
    .line 7
    invoke-direct {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 11
    .line 12
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 13
    .line 14
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->url(Lcom/tencent/cloud/ai/network/okhttp3/p;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v3, "CONNECT"

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-virtual {v2, v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 28
    .line 29
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 30
    .line 31
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 32
    .line 33
    const/4 v5, 0x1

    .line 34
    invoke-static {v3, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;Z)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const-string v6, "Host"

    .line 39
    .line 40
    invoke-virtual {v2, v6, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const-string v3, "Proxy-Connection"

    .line 45
    .line 46
    const-string v6, "Keep-Alive"

    .line 47
    .line 48
    invoke-virtual {v2, v3, v6}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const-string v3, "User-Agent"

    .line 53
    .line 54
    const-string v6, "okhttp/3.14.0"

    .line 55
    .line 56
    invoke-virtual {v2, v3, v6}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 65
    .line 66
    invoke-direct {v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->request(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    sget-object v6, Lcom/tencent/cloud/ai/network/okhttp3/q;->c:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 74
    .line 75
    invoke-virtual {v3, v6}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->protocol(Lcom/tencent/cloud/ai/network/okhttp3/q;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    const/16 v6, 0x197

    .line 80
    .line 81
    invoke-virtual {v3, v6}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->code(I)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    const-string v7, "Preemptive Authenticate"

    .line 86
    .line 87
    invoke-virtual {v3, v7}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->message(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    sget-object v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 92
    .line 93
    invoke-virtual {v3, v7}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->body(Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    const-wide/16 v7, -0x1

    .line 98
    .line 99
    invoke-virtual {v3, v7, v8}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->sentRequestAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-virtual {v3, v7, v8}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->receivedResponseAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    const-string v9, "Proxy-Authenticate"

    .line 108
    .line 109
    const-string v10, "OkHttp-Preemptive"

    .line 110
    .line 111
    invoke-virtual {v3, v9, v10}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    iget-object v9, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 120
    .line 121
    iget-object v10, v9, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 122
    .line 123
    iget-object v10, v10, Lcom/tencent/cloud/ai/network/okhttp3/a;->d:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 124
    .line 125
    invoke-interface {v10, v9, v3}, Lcom/tencent/cloud/ai/network/okhttp3/b;->a(Lcom/tencent/cloud/ai/network/okhttp3/s;Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    if-eqz v3, :cond_0

    .line 130
    .line 131
    move-object v2, v3

    .line 132
    :cond_0
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    const/4 v10, 0x0

    .line 137
    :goto_0
    const/16 v11, 0x15

    .line 138
    .line 139
    if-ge v10, v11, :cond_8

    .line 140
    .line 141
    move/from16 v11, p1

    .line 142
    .line 143
    move-object/from16 v12, p4

    .line 144
    .line 145
    move-object/from16 v13, p5

    .line 146
    .line 147
    invoke-virtual {v0, v11, v1, v12, v13}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a(IILcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V

    .line 148
    .line 149
    .line 150
    new-instance v14, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    const-string v15, "CONNECT "

    .line 153
    .line 154
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-static {v3, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;Z)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v15

    .line 161
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string v15, " HTTP/1.1"

    .line 165
    .line 166
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v14

    .line 173
    :goto_1
    new-instance v15, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 174
    .line 175
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    .line 176
    .line 177
    move-wide/from16 v16, v7

    .line 178
    .line 179
    iget-object v7, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->j:Lcom/tencent/cloud/ai/network/okio/f;

    .line 180
    .line 181
    invoke-direct {v15, v4, v4, v5, v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;Lcom/tencent/cloud/ai/network/okio/g;Lcom/tencent/cloud/ai/network/okio/f;)V

    .line 182
    .line 183
    .line 184
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    .line 185
    .line 186
    invoke-interface {v5}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 187
    .line 188
    .line 189
    move-result-object v5

    .line 190
    int-to-long v7, v1

    .line 191
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 192
    .line 193
    invoke-virtual {v5, v7, v8, v4}, Lcom/tencent/cloud/ai/network/okio/x;->a(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okio/x;

    .line 194
    .line 195
    .line 196
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->j:Lcom/tencent/cloud/ai/network/okio/f;

    .line 197
    .line 198
    invoke-interface {v5}, Lcom/tencent/cloud/ai/network/okio/v;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 199
    .line 200
    .line 201
    move-result-object v5

    .line 202
    move/from16 v7, p3

    .line 203
    .line 204
    move/from16 v18, v10

    .line 205
    .line 206
    int-to-long v9, v7

    .line 207
    invoke-virtual {v5, v9, v10, v4}, Lcom/tencent/cloud/ai/network/okio/x;->a(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okio/x;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->headers()Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 211
    .line 212
    .line 213
    move-result-object v5

    .line 214
    invoke-virtual {v15, v5, v14}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/o;Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    iget-object v5, v15, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 218
    .line 219
    invoke-interface {v5}, Lcom/tencent/cloud/ai/network/okio/f;->flush()V

    .line 220
    .line 221
    .line 222
    const/4 v8, 0x0

    .line 223
    invoke-virtual {v15, v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a(Z)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 224
    .line 225
    .line 226
    move-result-object v5

    .line 227
    invoke-virtual {v5, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->request(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-static {v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)J

    .line 236
    .line 237
    .line 238
    move-result-wide v9

    .line 239
    cmp-long v5, v9, v16

    .line 240
    .line 241
    if-nez v5, :cond_1

    .line 242
    .line 243
    goto :goto_2

    .line 244
    :cond_1
    invoke-virtual {v15, v9, v10}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a(J)Lcom/tencent/cloud/ai/network/okio/w;

    .line 245
    .line 246
    .line 247
    move-result-object v5

    .line 248
    const v9, 0x7fffffff

    .line 249
    .line 250
    .line 251
    invoke-static {v5, v9, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b(Lcom/tencent/cloud/ai/network/okio/w;ILjava/util/concurrent/TimeUnit;)Z

    .line 252
    .line 253
    .line 254
    check-cast v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$e;

    .line 255
    .line 256
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$e;->close()V

    .line 257
    .line 258
    .line 259
    :goto_2
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 260
    .line 261
    .line 262
    move-result v4

    .line 263
    const/16 v5, 0xc8

    .line 264
    .line 265
    if-eq v4, v5, :cond_5

    .line 266
    .line 267
    if-ne v4, v6, :cond_4

    .line 268
    .line 269
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 270
    .line 271
    iget-object v5, v4, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 272
    .line 273
    iget-object v5, v5, Lcom/tencent/cloud/ai/network/okhttp3/a;->d:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 274
    .line 275
    invoke-interface {v5, v4, v2}, Lcom/tencent/cloud/ai/network/okhttp3/b;->a(Lcom/tencent/cloud/ai/network/okhttp3/s;Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    if-eqz v4, :cond_3

    .line 280
    .line 281
    const-string v5, "Connection"

    .line 282
    .line 283
    invoke-virtual {v2, v5}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    const-string v5, "close"

    .line 288
    .line 289
    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 290
    .line 291
    .line 292
    move-result v2

    .line 293
    if-eqz v2, :cond_2

    .line 294
    .line 295
    move-object v2, v4

    .line 296
    goto :goto_3

    .line 297
    :cond_2
    move-object v2, v4

    .line 298
    move-wide/from16 v7, v16

    .line 299
    .line 300
    move/from16 v10, v18

    .line 301
    .line 302
    const/4 v4, 0x0

    .line 303
    const/4 v5, 0x1

    .line 304
    goto/16 :goto_1

    .line 305
    .line 306
    :cond_3
    const-string v0, "Failed to authenticate with proxy"

    .line 307
    .line 308
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    return-void

    .line 312
    :cond_4
    const-string v0, "Unexpected response code for CONNECT: "

    .line 313
    .line 314
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 315
    .line 316
    .line 317
    move-result v1

    .line 318
    invoke-static {v0, v1}, Ll/yll;->a(Ljava/lang/String;I)V

    .line 319
    .line 320
    .line 321
    return-void

    .line 322
    :cond_5
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    .line 323
    .line 324
    invoke-interface {v2}, Lcom/tencent/cloud/ai/network/okio/g;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 325
    .line 326
    .line 327
    move-result-object v2

    .line 328
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    .line 329
    .line 330
    .line 331
    move-result v2

    .line 332
    if-eqz v2, :cond_7

    .line 333
    .line 334
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->j:Lcom/tencent/cloud/ai/network/okio/f;

    .line 335
    .line 336
    invoke-interface {v2}, Lcom/tencent/cloud/ai/network/okio/f;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    .line 341
    .line 342
    .line 343
    move-result v2

    .line 344
    if-eqz v2, :cond_7

    .line 345
    .line 346
    const/4 v2, 0x0

    .line 347
    :goto_3
    if-nez v2, :cond_6

    .line 348
    .line 349
    goto :goto_4

    .line 350
    :cond_6
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    .line 351
    .line 352
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/net/Socket;)V

    .line 353
    .line 354
    .line 355
    const/4 v4, 0x0

    .line 356
    iput-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    .line 357
    .line 358
    iput-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->j:Lcom/tencent/cloud/ai/network/okio/f;

    .line 359
    .line 360
    iput-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    .line 361
    .line 362
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 363
    .line 364
    iget-object v5, v5, Lcom/tencent/cloud/ai/network/okhttp3/s;->c:Ljava/net/InetSocketAddress;

    .line 365
    .line 366
    add-int/lit8 v10, v18, 0x1

    .line 367
    .line 368
    move-wide/from16 v7, v16

    .line 369
    .line 370
    const/4 v5, 0x1

    .line 371
    goto/16 :goto_0

    .line 372
    .line 373
    :cond_7
    const-string v0, "TLS tunnel buffered too many bytes!"

    .line 374
    .line 375
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 376
    .line 377
    .line 378
    :cond_8
    :goto_4
    return-void
.end method

.method public final a(IILcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V
    .locals 3

    .line 379
    iget-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 380
    iget-object v0, p3, Lcom/tencent/cloud/ai/network/okhttp3/s;->b:Ljava/net/Proxy;

    .line 381
    iget-object p3, p3, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 382
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v1

    sget-object v2, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v1, v2, :cond_1

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v1

    sget-object v2, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 383
    :cond_0
    new-instance p3, Ljava/net/Socket;

    invoke-direct {p3, v0}, Ljava/net/Socket;-><init>(Ljava/net/Proxy;)V

    goto :goto_1

    .line 384
    :cond_1
    :goto_0
    iget-object p3, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->c:Ljavax/net/SocketFactory;

    .line 385
    invoke-virtual {p3}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object p3

    .line 386
    :goto_1
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    .line 387
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 388
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/s;->c:Ljava/net/InetSocketAddress;

    .line 389
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 390
    invoke-virtual {p3, p2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 391
    :try_start_0
    sget-object p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 392
    iget-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    iget-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 393
    iget-object p4, p4, Lcom/tencent/cloud/ai/network/okhttp3/s;->c:Ljava/net/InetSocketAddress;

    .line 394
    invoke-virtual {p2, p3, p4, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V
    :try_end_0
    .catch Ljava/net/ConnectException; {:try_start_0 .. :try_end_0} :catch_1

    .line 395
    :try_start_1
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okio/n;->b(Ljava/net/Socket;)Lcom/tencent/cloud/ai/network/okio/w;

    move-result-object p1

    .line 396
    new-instance p2, Lcom/tencent/cloud/ai/network/okio/r;

    invoke-direct {p2, p1}, Lcom/tencent/cloud/ai/network/okio/r;-><init>(Lcom/tencent/cloud/ai/network/okio/w;)V

    .line 397
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    .line 398
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okio/n;->a(Ljava/net/Socket;)Lcom/tencent/cloud/ai/network/okio/v;

    move-result-object p1

    .line 399
    new-instance p2, Lcom/tencent/cloud/ai/network/okio/q;

    invoke-direct {p2, p1}, Lcom/tencent/cloud/ai/network/okio/q;-><init>(Lcom/tencent/cloud/ai/network/okio/v;)V

    .line 400
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->j:Lcom/tencent/cloud/ai/network/okio/f;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 401
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string p2, "throw with null exception"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    return-void

    .line 402
    :cond_2
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p1

    .line 403
    new-instance p2, Ljava/net/ConnectException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "Failed to connect to "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 404
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/s;->c:Ljava/net/InetSocketAddress;

    .line 405
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    .line 406
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 407
    throw p2
.end method

.method public final a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;ILcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V
    .locals 5

    .line 408
    iget-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 409
    iget-object p3, p3, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 410
    iget-object v0, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->i:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v0, :cond_1

    .line 411
    iget-object p1, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->e:Ljava/util/List;

    .line 412
    sget-object p3, Lcom/tencent/cloud/ai/network/okhttp3/q;->f:Lcom/tencent/cloud/ai/network/okhttp3/q;

    invoke-interface {p1, p3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    .line 413
    iget-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    if-eqz p1, :cond_0

    .line 414
    iput-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    .line 415
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->g:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 416
    invoke-virtual {p0, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a(I)V

    return-void

    .line 417
    :cond_0
    iput-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    .line 418
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/q;->c:Lcom/tencent/cloud/ai/network/okhttp3/q;

    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->g:Lcom/tencent/cloud/ai/network/okhttp3/q;

    return-void

    .line 419
    :cond_1
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p4, 0x0

    .line 420
    :try_start_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    .line 421
    iget-object v2, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 422
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 423
    iget v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    const/4 v4, 0x1

    .line 424
    invoke-virtual {v0, v1, v3, v2, v4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 425
    :try_start_1
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->a(Ljavax/net/ssl/SSLSocket;)Lcom/tencent/cloud/ai/network/okhttp3/j;

    move-result-object p1

    .line 426
    iget-boolean v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/j;->b:Z

    if-eqz v1, :cond_2

    .line 427
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 428
    iget-object v2, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 429
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 430
    iget-object v3, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->e:Ljava/util/List;

    .line 431
    invoke-virtual {v1, v0, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    :catchall_0
    move-exception p0

    move-object p4, v0

    goto/16 :goto_3

    :catch_0
    move-exception p0

    move-object p4, v0

    goto/16 :goto_2

    .line 432
    :cond_2
    :goto_0
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 433
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v1

    .line 434
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okhttp3/n;->a(Ljavax/net/ssl/SSLSession;)Lcom/tencent/cloud/ai/network/okhttp3/n;

    move-result-object v2

    .line 435
    iget-object v3, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->j:Ljavax/net/ssl/HostnameVerifier;

    .line 436
    iget-object v4, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 437
    iget-object v4, v4, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 438
    invoke-interface {v3, v4, v1}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 439
    iget-object p0, v2, Lcom/tencent/cloud/ai/network/okhttp3/n;->c:Ljava/util/List;

    .line 440
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1
    :try_end_1
    .catch Ljava/lang/AssertionError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string p2, "Hostname "

    if-nez p1, :cond_3

    const/4 p1, 0x0

    .line 441
    :try_start_2
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/security/cert/X509Certificate;

    .line 442
    new-instance p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 443
    iget-object p2, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 444
    iget-object p2, p2, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 445
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " not verified:\n    certificate: "

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/e;->a(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\n    DN: "

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 447
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object p2

    invoke-interface {p2}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\n    subjectAltNames: "

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/d;->a(Ljava/security/cert/X509Certificate;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 449
    :cond_3
    new-instance p0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 450
    iget-object p2, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 451
    iget-object p2, p2, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 452
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " not verified (no certificates)"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 453
    :cond_4
    iget-object v1, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->k:Lcom/tencent/cloud/ai/network/okhttp3/e;

    .line 454
    iget-object p3, p3, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 455
    iget-object p3, p3, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 456
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/n;->c:Ljava/util/List;

    .line 457
    invoke-virtual {v1, p3, v3}, Lcom/tencent/cloud/ai/network/okhttp3/e;->a(Ljava/lang/String;Ljava/util/List;)V

    .line 458
    iget-boolean p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/j;->b:Z

    if-eqz p1, :cond_5

    .line 459
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 460
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;

    move-result-object p4

    .line 461
    :cond_5
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    .line 462
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okio/n;->b(Ljava/net/Socket;)Lcom/tencent/cloud/ai/network/okio/w;

    move-result-object p1

    .line 463
    new-instance p3, Lcom/tencent/cloud/ai/network/okio/r;

    invoke-direct {p3, p1}, Lcom/tencent/cloud/ai/network/okio/r;-><init>(Lcom/tencent/cloud/ai/network/okio/w;)V

    .line 464
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    .line 465
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okio/n;->a(Ljava/net/Socket;)Lcom/tencent/cloud/ai/network/okio/v;

    move-result-object p1

    .line 466
    new-instance p3, Lcom/tencent/cloud/ai/network/okio/q;

    invoke-direct {p3, p1}, Lcom/tencent/cloud/ai/network/okio/q;-><init>(Lcom/tencent/cloud/ai/network/okio/v;)V

    .line 467
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->j:Lcom/tencent/cloud/ai/network/okio/f;

    .line 468
    iput-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->f:Lcom/tencent/cloud/ai/network/okhttp3/n;

    if-eqz p4, :cond_6

    .line 469
    invoke-static {p4}, Lcom/tencent/cloud/ai/network/okhttp3/q;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/q;

    move-result-object p1

    goto :goto_1

    .line 470
    :cond_6
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/q;->c:Lcom/tencent/cloud/ai/network/okhttp3/q;

    :goto_1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->g:Lcom/tencent/cloud/ai/network/okhttp3/q;
    :try_end_2
    .catch Ljava/lang/AssertionError; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 471
    sget-object p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 472
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 473
    sget-object p3, Lcom/tencent/cloud/ai/network/okhttp3/q;->e:Lcom/tencent/cloud/ai/network/okhttp3/q;

    if-ne p1, p3, :cond_7

    .line 474
    invoke-virtual {p0, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a(I)V

    :cond_7
    return-void

    :catchall_1
    move-exception p0

    goto :goto_3

    :catch_1
    move-exception p0

    .line 475
    :goto_2
    :try_start_3
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/AssertionError;)Z

    move-result p1

    if-eqz p1, :cond_8

    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 476
    :cond_8
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_3
    if-eqz p4, :cond_9

    .line 477
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 478
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 479
    :cond_9
    invoke-static {p4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/net/Socket;)V

    .line 480
    throw p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;)V
    .locals 3

    .line 615
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    monitor-enter v0

    :try_start_0
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 616
    :try_start_1
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->t:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 617
    iget v2, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a:I

    and-int/lit8 v2, v2, 0x10

    if-eqz v2, :cond_0

    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->b:[I

    const/4 v2, 0x4

    aget v1, v1, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_0
    const v1, 0x7fffffff

    :goto_0
    :try_start_2
    monitor-exit p1

    .line 618
    iput v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->o:I

    .line 619
    monitor-exit v0

    return-void

    :catchall_1
    move-exception p0

    goto :goto_2

    :goto_1
    monitor-exit p1

    throw p0

    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;)V
    .locals 1

    .line 614
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Ljava/io/IOException;)V

    return-void
.end method

.method public a()Z
    .locals 0

    .line 620
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/p;)Z
    .locals 4

    .line 583
    iget v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    .line 584
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 585
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 586
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 587
    iget v2, v1, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    const/4 v3, 0x0

    if-eq v0, v2, :cond_0

    return v3

    .line 588
    :cond_0
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 589
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 590
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_2

    .line 591
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->f:Lcom/tencent/cloud/ai/network/okhttp3/n;

    if-eqz p0, :cond_1

    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/d;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/d;

    .line 592
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 593
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/n;->c:Ljava/util/List;

    .line 594
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/security/cert/X509Certificate;

    .line 595
    invoke-virtual {v0, p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/d;->a(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z

    move-result p0

    if-eqz p0, :cond_1

    return v1

    :cond_1
    return v3

    :cond_2
    return v1
.end method

.method public a(Z)Z
    .locals 7

    .line 602
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isClosed()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isInputShutdown()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isOutputShutdown()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 603
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 604
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide p0

    monitor-enter v0

    .line 605
    :try_start_0
    iget-boolean v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->g:Z

    if-eqz v3, :cond_1

    goto :goto_0

    .line 606
    :cond_1
    iget-wide v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->n:J

    iget-wide v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->m:J

    cmp-long v3, v3, v5

    if-gez v3, :cond_2

    iget-wide v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->p:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long p0, p0, v3

    if-ltz p0, :cond_2

    .line 607
    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 608
    :cond_2
    monitor-exit v0

    return v2

    :goto_1
    monitor-exit v0

    throw p0

    :cond_3
    if-eqz p1, :cond_5

    .line 609
    :try_start_1
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    invoke-virtual {p1}, Ljava/net/Socket;->getSoTimeout()I

    move-result p1
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 610
    :try_start_2
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    invoke-virtual {v0, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 611
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/g;->g()Z

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 612
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    if-eqz v0, :cond_4

    :try_start_3
    invoke-virtual {p0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    return v1

    :cond_4
    invoke-virtual {p0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    return v2

    :catchall_1
    move-exception v0

    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    invoke-virtual {p0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 613
    throw v0
    :try_end_3
    .catch Ljava/net/SocketTimeoutException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    return v1

    :catch_1
    :cond_5
    return v2

    :cond_6
    :goto_2
    return v1
.end method

.method public b()V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->r:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    const/4 v1, 0x1

    .line 22
    :try_start_0
    iput-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->k:Z

    .line 23
    .line 24
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Connection{"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ":"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 29
    .line 30
    iget v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, ", proxy="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/s;->b:Ljava/net/Proxy;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, " hostAddress="

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/s;->c:Ljava/net/InetSocketAddress;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v1, " cipherSuite="

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->f:Lcom/tencent/cloud/ai/network/okhttp3/n;

    .line 65
    .line 66
    if-eqz v1, :cond_0

    .line 67
    .line 68
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/n;->b:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const-string v1, "none"

    .line 72
    .line 73
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v1, " protocol="

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->g:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const/16 p0, 0x7d

    .line 87
    .line 88
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method
