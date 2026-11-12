.class public final Lqhi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/net/URLConnection;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public constructor <init>(Ljava/net/URLConnection;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqhi;->a:Ljava/net/URLConnection;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    :try_start_0
    iget-object p0, p0, Lqhi;->a:Ljava/net/URLConnection;

    invoke-virtual {p0}, Ljava/net/URLConnection;->connect()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_10
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_b
    .catchall {:try_start_0 .. :try_end_5} :catchall_6

    return-void

    :catchall_6
    move-exception p0

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    return-void

    :catch_b
    move-exception p0

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    return-void

    :catch_10
    move-exception p0

    throw p0
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Lqhi;->a:Ljava/net/URLConnection;

    instance-of v0, p0, Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_b

    :try_start_6
    check-cast p0, Ljava/net/HttpURLConnection;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_b
    .catchall {:try_start_6 .. :try_end_b} :catchall_b

    :catchall_b
    :cond_b
    return-void
.end method

.method public final c()Ljava/io/InputStream;
    .registers 3

    invoke-virtual {p0}, Lqhi;->a()V

    const/4 v0, 0x0

    :try_start_4
    iget-object p0, p0, Lqhi;->a:Ljava/net/URLConnection;

    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    if-eqz p0, :cond_d

    return-object p0

    :cond_d
    new-instance p0, Ljava/io/IOException;

    const-string v1, "InputStream is null"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_15} :catch_1f
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_15} :catch_1a
    .catchall {:try_start_4 .. :try_end_15} :catchall_15

    :catchall_15
    move-exception p0

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    return-object v0

    :catch_1a
    move-exception p0

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    return-object v0

    :catch_1f
    move-exception p0

    throw p0
.end method

.method public final d()I
    .registers 3

    iget-object v0, p0, Lqhi;->a:Ljava/net/URLConnection;

    instance-of v1, v0, Ljava/net/HttpURLConnection;

    if-eqz v1, :cond_1d

    invoke-virtual {p0}, Lqhi;->a()V

    :try_start_9
    check-cast v0, Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p0
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_f} :catch_1b
    .catch Ljava/lang/NullPointerException; {:try_start_9 .. :try_end_f} :catch_16
    .catchall {:try_start_9 .. :try_end_f} :catchall_10

    return p0

    :catchall_10
    move-exception p0

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    :goto_14
    const/4 p0, 0x0

    return p0

    :catch_16
    move-exception p0

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    goto :goto_14

    :catch_1b
    move-exception p0

    throw p0

    :cond_1d
    const/4 p0, -0x1

    return p0
.end method
