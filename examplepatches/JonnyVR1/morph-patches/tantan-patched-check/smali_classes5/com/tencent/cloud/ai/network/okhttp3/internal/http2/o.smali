.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;


# static fields
.field public static final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;

.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

.field public final c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

.field public volatile d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

.field public final e:Lcom/tencent/cloud/ai/network/okhttp3/q;

.field public volatile f:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 12

    .line 1
    const-string v10, ":scheme"

    .line 2
    .line 3
    const-string v11, ":authority"

    .line 4
    .line 5
    const-string v0, "connection"

    .line 6
    .line 7
    const-string v1, "host"

    .line 8
    .line 9
    const-string v2, "keep-alive"

    .line 10
    .line 11
    const-string v3, "proxy-connection"

    .line 12
    .line 13
    const-string v4, "te"

    .line 14
    .line 15
    const-string v5, "transfer-encoding"

    .line 16
    .line 17
    const-string v6, "encoding"

    .line 18
    .line 19
    const-string v7, "upgrade"

    .line 20
    .line 21
    const-string v8, ":method"

    .line 22
    .line 23
    const-string v9, ":path"

    .line 24
    .line 25
    filled-new-array/range {v0 .. v11}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a([Ljava/lang/Object;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->g:Ljava/util/List;

    .line 34
    .line 35
    const-string v7, "encoding"

    .line 36
    .line 37
    const-string v8, "upgrade"

    .line 38
    .line 39
    const-string v1, "connection"

    .line 40
    .line 41
    const-string v2, "host"

    .line 42
    .line 43
    const-string v3, "keep-alive"

    .line 44
    .line 45
    const-string v4, "proxy-connection"

    .line 46
    .line 47
    const-string v5, "te"

    .line 48
    .line 49
    const-string v6, "transfer-encoding"

    .line 50
    .line 51
    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, [Ljava/lang/Object;

    .line 60
    .line 61
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->h:Ljava/util/List;

    .line 70
    .line 71
    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 5
    .line 6
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->a:Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;

    .line 7
    .line 8
    iput-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->protocols()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget-object p2, Lcom/tencent/cloud/ai/network/okhttp3/q;->f:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 15
    .line 16
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-object p2, Lcom/tencent/cloud/ai/network/okhttp3/q;->e:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 24
    .line 25
    :goto_0
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->e:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)J
    .locals 0

    .line 377
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)J

    move-result-wide p0

    return-wide p0
.end method

.method public a(Z)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 9

    .line 346
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    monitor-enter v0

    .line 347
    :try_start_0
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/c;->h()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 348
    :goto_0
    :try_start_1
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->e:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    if-nez v1, :cond_0

    .line 349
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->f()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto/16 :goto_4

    .line 350
    :cond_0
    :try_start_2
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k()V

    .line 351
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->e:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    .line 352
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->e:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tencent/cloud/ai/network/okhttp3/o;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit v0

    .line 353
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->e:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 354
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/o$a;-><init>()V

    .line 355
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v5, v3

    :goto_1
    if-ge v4, v2, :cond_3

    .line 356
    invoke-virtual {v1, v4}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(I)Ljava/lang/String;

    move-result-object v6

    .line 357
    invoke-virtual {v1, v4}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b(I)Ljava/lang/String;

    move-result-object v7

    const-string v8, ":status"

    .line 358
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 359
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "HTTP/1.1 "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/e;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/internal/http/e;

    move-result-object v5

    goto :goto_2

    .line 360
    :cond_1
    sget-object v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->h:Ljava/util/List;

    invoke-interface {v8, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 361
    sget-object v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    check-cast v8, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;

    .line 362
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 363
    iget-object v8, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 364
    iget-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_3
    if-eqz v5, :cond_5

    .line 365
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    invoke-direct {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;-><init>()V

    .line 366
    invoke-virtual {v1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->protocol(Lcom/tencent/cloud/ai/network/okhttp3/q;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object p0

    iget v1, v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/e;->b:I

    .line 367
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->code(I)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object p0

    iget-object v1, v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/e;->c:Ljava/lang/String;

    .line 368
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->message(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object p0

    .line 369
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/o;

    invoke-direct {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/o;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/o$a;)V

    .line 370
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->headers(Lcom/tencent/cloud/ai/network/okhttp3/o;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object p0

    if-eqz p1, :cond_4

    .line 371
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;

    .line 372
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->code:I

    const/16 v0, 0x64

    if-ne p1, v0, :cond_4

    return-object v3

    :cond_4
    return-object p0

    .line 373
    :cond_5
    const-string p0, "Expected \':status\' header not present"

    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    return-object v3

    :catchall_1
    move-exception p0

    goto :goto_5

    .line 374
    :cond_6
    :try_start_3
    iget-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->l:Ljava/io/IOException;

    if-eqz p0, :cond_7

    goto :goto_3

    :cond_7
    new-instance p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;

    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    invoke-direct {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    :goto_3
    throw p0

    .line 375
    :goto_4
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k()V

    .line 376
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_5
    monitor-exit v0

    throw p0
.end method

.method public a()Lcom/tencent/cloud/ai/network/okhttp3/o;
    .locals 2

    .line 378
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    monitor-enter p0

    .line 379
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    if-eqz v0, :cond_1

    .line 380
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->l:Ljava/io/IOException;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;

    invoke-direct {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    :goto_0
    throw v1

    :catchall_0
    move-exception v0

    goto :goto_2

    .line 381
    :cond_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    iget-boolean v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->f:Z

    if-eqz v1, :cond_3

    .line 382
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 383
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    .line 384
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->b:Lcom/tencent/cloud/ai/network/okio/e;

    .line 385
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 386
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    .line 387
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->d:Lcom/tencent/cloud/ai/network/okhttp3/o;

    if-eqz v0, :cond_2

    goto :goto_1

    .line 388
    :cond_2
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b:Lcom/tencent/cloud/ai/network/okhttp3/o;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    monitor-exit p0

    return-object v0

    .line 389
    :cond_3
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "too early; can\'t read the trailers yet"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_2
    monitor-exit p0

    throw v0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/Request;J)Lcom/tencent/cloud/ai/network/okio/v;
    .locals 0

    .line 345
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c()Lcom/tencent/cloud/ai/network/okio/v;

    move-result-object p0

    return-object p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/Request;)V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    move v0, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    move v0, v1

    .line 17
    :goto_0
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->headers()Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    new-instance v4, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    add-int/lit8 v5, v5, 0x4

    .line 28
    .line 29
    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 30
    .line 31
    .line 32
    new-instance v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 33
    .line 34
    sget-object v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->f:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->method()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    invoke-static {v7}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    invoke-direct {v5, v6, v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    new-instance v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 51
    .line 52
    sget-object v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->g:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    invoke-static {v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/d;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    invoke-static {v7}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    invoke-direct {v5, v6, v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    const-string v5, "Host"

    .line 73
    .line 74
    invoke-virtual {p1, v5}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    if-eqz v5, :cond_2

    .line 79
    .line 80
    new-instance v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 81
    .line 82
    sget-object v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->i:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 83
    .line 84
    invoke-static {v5}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    invoke-direct {v6, v7, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    :cond_2
    new-instance v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 95
    .line 96
    sget-object v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->h:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-direct {v5, v6, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    move v5, v1

    .line 119
    :goto_1
    if-ge v5, p1, :cond_5

    .line 120
    .line 121
    invoke-virtual {v3, v5}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v6

    .line 125
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 126
    .line 127
    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    sget-object v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->g:Ljava/util/List;

    .line 132
    .line 133
    invoke-interface {v7, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v7

    .line 137
    if-eqz v7, :cond_3

    .line 138
    .line 139
    const-string v7, "te"

    .line 140
    .line 141
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v7

    .line 145
    if-eqz v7, :cond_4

    .line 146
    .line 147
    invoke-virtual {v3, v5}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b(I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v7

    .line 151
    const-string v8, "trailers"

    .line 152
    .line 153
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v7

    .line 157
    if-eqz v7, :cond_4

    .line 158
    .line 159
    :cond_3
    new-instance v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 160
    .line 161
    invoke-virtual {v3, v5}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b(I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v8

    .line 165
    invoke-direct {v7, v6, v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    :cond_4
    add-int/lit8 v5, v5, 0x1

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_5
    iget-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 175
    .line 176
    xor-int/lit8 v9, v0, 0x1

    .line 177
    .line 178
    iget-object p1, v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    .line 179
    .line 180
    monitor-enter p1

    .line 181
    :try_start_0
    monitor-enter v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 182
    :try_start_1
    iget v3, v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->f:I

    .line 183
    .line 184
    const v5, 0x3fffffff    # 1.9999999f

    .line 185
    .line 186
    .line 187
    if-le v3, v5, :cond_6

    .line 188
    .line 189
    sget-object v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 190
    .line 191
    invoke-virtual {v8, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    .line 192
    .line 193
    .line 194
    goto :goto_2

    .line 195
    :catchall_0
    move-exception v0

    .line 196
    move-object p0, v0

    .line 197
    goto/16 :goto_5

    .line 198
    .line 199
    :cond_6
    :goto_2
    iget-boolean v3, v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->g:Z

    .line 200
    .line 201
    if-nez v3, :cond_d

    .line 202
    .line 203
    iget v7, v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->f:I

    .line 204
    .line 205
    add-int/lit8 v3, v7, 0x2

    .line 206
    .line 207
    iput v3, v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->f:I

    .line 208
    .line 209
    new-instance v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 210
    .line 211
    const/4 v11, 0x0

    .line 212
    const/4 v10, 0x0

    .line 213
    invoke-direct/range {v6 .. v11}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;-><init>(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;ZZLcom/tencent/cloud/ai/network/okhttp3/o;)V

    .line 214
    .line 215
    .line 216
    if-eqz v0, :cond_7

    .line 217
    .line 218
    iget-wide v10, v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->r:J

    .line 219
    .line 220
    const-wide/16 v12, 0x0

    .line 221
    .line 222
    cmp-long v0, v10, v12

    .line 223
    .line 224
    if-eqz v0, :cond_7

    .line 225
    .line 226
    iget-wide v10, v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b:J

    .line 227
    .line 228
    cmp-long v0, v10, v12

    .line 229
    .line 230
    if-nez v0, :cond_8

    .line 231
    .line 232
    :cond_7
    move v1, v2

    .line 233
    :cond_8
    invoke-virtual {v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->e()Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-eqz v0, :cond_9

    .line 238
    .line 239
    iget-object v0, v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->c:Ljava/util/Map;

    .line 240
    .line 241
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    invoke-interface {v0, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    :cond_9
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 249
    :try_start_2
    iget-object v0, v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    .line 250
    .line 251
    invoke-virtual {v0, v9, v7, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a(ZILjava/util/List;)V

    .line 252
    .line 253
    .line 254
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 255
    if-eqz v1, :cond_b

    .line 256
    .line 257
    iget-object p1, v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    .line 258
    .line 259
    monitor-enter p1

    .line 260
    :try_start_3
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->e:Z

    .line 261
    .line 262
    if-nez v0, :cond_a

    .line 263
    .line 264
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a:Lcom/tencent/cloud/ai/network/okio/f;

    .line 265
    .line 266
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/f;->flush()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 267
    .line 268
    .line 269
    monitor-exit p1

    .line 270
    goto :goto_4

    .line 271
    :catchall_1
    move-exception v0

    .line 272
    move-object p0, v0

    .line 273
    goto :goto_3

    .line 274
    :cond_a
    :try_start_4
    new-instance p0, Ljava/io/IOException;

    .line 275
    .line 276
    const-string v0, "closed"

    .line 277
    .line 278
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 282
    :goto_3
    monitor-exit p1

    .line 283
    throw p0

    .line 284
    :cond_b
    :goto_4
    iput-object v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 285
    .line 286
    iget-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->f:Z

    .line 287
    .line 288
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 289
    .line 290
    if-nez p1, :cond_c

    .line 291
    .line 292
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 293
    .line 294
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->a:Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;

    .line 295
    .line 296
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->readTimeoutMillis()I

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    int-to-long v0, v0

    .line 301
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 302
    .line 303
    invoke-virtual {p1, v0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/x;->a(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okio/x;

    .line 304
    .line 305
    .line 306
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 307
    .line 308
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 309
    .line 310
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->a:Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;

    .line 311
    .line 312
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->writeTimeoutMillis()I

    .line 313
    .line 314
    .line 315
    move-result p0

    .line 316
    int-to-long v0, p0

    .line 317
    invoke-virtual {p1, v0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/x;->a(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okio/x;

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :cond_c
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 322
    .line 323
    invoke-virtual {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    .line 324
    .line 325
    .line 326
    const-string p0, "Canceled"

    .line 327
    .line 328
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    return-void

    .line 332
    :catchall_2
    move-exception v0

    .line 333
    move-object p0, v0

    .line 334
    goto :goto_6

    .line 335
    :cond_d
    :try_start_5
    new-instance p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/a;

    .line 336
    .line 337
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/a;-><init>()V

    .line 338
    .line 339
    .line 340
    throw p0

    .line 341
    :goto_5
    monitor-exit v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 342
    :try_start_6
    throw p0

    .line 343
    :goto_6
    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 344
    throw p0
.end method

.method public b(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okio/w;
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 8
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    return-object p0
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->flush()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c()Lcom/tencent/cloud/ai/network/okio/v;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->close()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public cancel()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->f:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 9
    .line 10
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/o;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 2
    .line 3
    return-object p0
.end method
