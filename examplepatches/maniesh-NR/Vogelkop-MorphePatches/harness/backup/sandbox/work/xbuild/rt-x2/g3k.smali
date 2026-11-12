.class public abstract Lg3k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf94;


# static fields
.field public static final e:Lii;


# instance fields
.field public final a:Lt9f;

.field public final b:Ljava/lang/String;

.field public c:I

.field public d:Lokhttp3/internal/connection/RealCall;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lii;

    const/16 v1, 0x17

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    sput-object v0, Lg3k;->e:Lii;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lt9f;I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg3k;->b:Ljava/lang/String;

    iput-object p2, p0, Lg3k;->a:Lt9f;

    iput p3, p0, Lg3k;->c:I

    return-void
.end method


# virtual methods
.method public a(Lpzh;[B)V
    .registers 3

    invoke-virtual {p0, p1, p2}, Lg3k;->d(Lpzh;[B)V

    return-void
.end method

.method public b(I)Z
    .registers 3

    iget p1, p0, Lg3k;->c:I

    if-lez p1, :cond_9

    const/4 v0, 0x1

    sub-int/2addr p1, v0

    iput p1, p0, Lg3k;->c:I

    return v0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public abstract c(Ljava/lang/String;)V
.end method

.method public abstract d(Lpzh;[B)V
.end method

.method public abstract e(Lfvh;)V
.end method

.method public f(Lvzh;Lpzh;)[B
    .registers 3

    invoke-virtual {p1}, Lvzh;->bytes()[B

    move-result-object p0

    return-object p0
.end method

.method public final g()V
    .registers 3

    new-instance v0, Lfvh;

    invoke-direct {v0}, Lfvh;-><init>()V

    iget-object v1, p0, Lg3k;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lfvh;->h(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lg3k;->e(Lfvh;)V

    iget-object v1, p0, Lg3k;->a:Lt9f;

    invoke-static {v0, v1}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    iput-object v0, p0, Lg3k;->d:Lokhttp3/internal/connection/RealCall;

    invoke-interface {v0, p0}, Lv84;->enqueue(Lf94;)V

    return-void
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 10

    instance-of v0, p2, Ljava/net/SocketTimeoutException;

    if-eqz v0, :cond_7

    const/4 v0, 0x1

    :goto_5
    move v3, v0

    goto :goto_1d

    :cond_7
    instance-of v0, p2, Ljava/net/ConnectException;

    if-nez v0, :cond_1b

    instance-of v0, p2, Ljava/net/NoRouteToHostException;

    if-nez v0, :cond_1b

    instance-of v0, p2, Ljava/net/UnknownHostException;

    if-nez v0, :cond_1b

    instance-of v0, p2, Ljavax/net/ssl/SSLException;

    if-eqz v0, :cond_19

    const/4 v0, 0x4

    goto :goto_5

    :cond_19
    const/4 v0, 0x3

    goto :goto_5

    :cond_1b
    const/4 v0, 0x2

    goto :goto_5

    :goto_1d
    new-instance v1, Lky;

    const/4 v6, 0x1

    move-object v2, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v6}, Lky;-><init>(Ljava/lang/Object;ILjava/lang/Object;Ljava/io/Serializable;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 5

    const/4 v0, 0x0

    :try_start_1
    iget-object v0, p2, Lpzh;->g:Lvzh;

    invoke-virtual {p0, v0, p2}, Lg3k;->f(Lvzh;Lpzh;)[B

    move-result-object p1
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_7} :catch_15
    .catchall {:try_start_1 .. :try_end_7} :catchall_1d

    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    new-instance v0, Liv;

    const/16 v1, 0xc

    invoke-direct {v0, p0, p2, p1, v1}, Liv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :catch_15
    move-exception p2

    :try_start_16
    invoke-virtual {p0, p1, p2}, Lg3k;->onFailure(Lv84;Ljava/io/IOException;)V
    :try_end_19
    .catchall {:try_start_16 .. :try_end_19} :catchall_1d

    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    return-void

    :catchall_1d
    move-exception p0

    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0
.end method
