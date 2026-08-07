.class public Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/util/netspeedutil/SpeedTask;


# instance fields
.field private a:I

.field private b:Ljava/lang/String;

.field private c:J

.field private d:Ljava/nio/ByteBuffer;

.field private e:J

.field private f:Ljava/lang/String;

.field private g:Ljava/net/Socket;

.field private h:I


# direct methods
.method public static synthetic a(Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->d:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private d()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->c:J

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public e(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/net/Socket;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->g:Ljava/net/Socket;

    .line 14
    .line 15
    iput-object p1, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->f:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v1, Ljava/net/InetSocketAddress;

    .line 18
    .line 19
    iget v2, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->a:I

    .line 20
    .line 21
    invoke-direct {v1, p1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    iget p0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->h:I

    .line 25
    .line 26
    invoke-virtual {v0, v1, p0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public f(Ljava/nio/ByteBuffer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->g:Ljava/net/Socket;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->g:Ljava/net/Socket;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iget-wide v2, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->c:J

    .line 24
    .line 25
    sub-long/2addr v0, v2

    .line 26
    iput-wide v0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->e:J

    .line 27
    .line 28
    return-void
.end method
