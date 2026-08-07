.class public final Lcom/tencent/liteav/network/a/a/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/network/a/c;


# static fields
.field private static final b:Ljava/util/Random;


# instance fields
.field final a:Ljava/net/InetAddress;

.field private final c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tencent/liteav/network/a/a/c;->b:Ljava/util/Random;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;)V
    .locals 1

    const/16 v0, 0xa

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/tencent/liteav/network/a/a/c;-><init>(Ljava/net/InetAddress;I)V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/liteav/network/a/a/c;->a:Ljava/net/InetAddress;

    .line 5
    .line 6
    iput p2, p0, Lcom/tencent/liteav/network/a/a/c;->c:I

    .line 7
    .line 8
    return-void
.end method

.method private a([B)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/net/DatagramSocket;

    .line 3
    .line 4
    invoke-direct {v1}, Ljava/net/DatagramSocket;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    .line 6
    .line 7
    :try_start_1
    new-instance v0, Ljava/net/DatagramPacket;

    .line 8
    .line 9
    array-length v2, p1

    .line 10
    iget-object v3, p0, Lcom/tencent/liteav/network/a/a/c;->a:Ljava/net/InetAddress;

    .line 11
    .line 12
    const/16 v4, 0x35

    .line 13
    .line 14
    invoke-direct {v0, p1, v2, v3, v4}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 15
    .line 16
    .line 17
    iget p0, p0, Lcom/tencent/liteav/network/a/a/c;->c:I

    .line 18
    .line 19
    mul-int/lit16 p0, p0, 0x3e8

    .line 20
    .line 21
    invoke-virtual {v1, p0}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ljava/net/DatagramPacket;

    .line 28
    .line 29
    const/16 p1, 0x5dc

    .line 30
    .line 31
    new-array v0, p1, [B

    .line 32
    .line 33
    invoke-direct {p0, v0, p1}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p0}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/net/DatagramPacket;->getData()[B

    .line 40
    .line 41
    .line 42
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    invoke-virtual {v1}, Ljava/net/DatagramSocket;->close()V

    .line 44
    .line 45
    .line 46
    return-object p0

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    move-object v0, v1

    .line 49
    goto :goto_0

    .line 50
    :catchall_1
    move-exception p0

    .line 51
    :goto_0
    if-eqz v0, :cond_0

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 54
    .line 55
    .line 56
    :cond_0
    throw p0
.end method


# virtual methods
.method public a(Lcom/tencent/liteav/network/a/b;Lcom/tencent/liteav/network/a/d;)[Lcom/tencent/liteav/network/a/e;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 57
    sget-object p2, Lcom/tencent/liteav/network/a/a/c;->b:Ljava/util/Random;

    monitor-enter p2

    .line 58
    :try_start_0
    invoke-virtual {p2}, Ljava/util/Random;->nextInt()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    .line 59
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    iget-object p2, p1, Lcom/tencent/liteav/network/a/b;->a:Ljava/lang/String;

    invoke-static {p2, v0}, Lcom/tencent/liteav/network/a/a/b;->a(Ljava/lang/String;I)[B

    move-result-object p2

    .line 61
    invoke-direct {p0, p2}, Lcom/tencent/liteav/network/a/a/c;->a([B)[B

    move-result-object p0

    .line 62
    iget-object p1, p1, Lcom/tencent/liteav/network/a/b;->a:Ljava/lang/String;

    if-eqz p0, :cond_0

    .line 63
    invoke-static {p0, v0, p1}, Lcom/tencent/liteav/network/a/a/b;->a([BILjava/lang/String;)[Lcom/tencent/liteav/network/a/e;

    move-result-object p0

    return-object p0

    .line 64
    :cond_0
    new-instance p0, Lcom/tencent/liteav/network/a/a;

    const-string p2, "cant get answer"

    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/network/a/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw p0

    :catchall_0
    move-exception p0

    .line 65
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
