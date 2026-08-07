.class Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;


# virtual methods
.method public a()Ljava/lang/Long;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing$1;->a:Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->a(Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing$1;->a:Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->e(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing$1;->a:Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;

    .line 13
    .line 14
    invoke-static {v0}, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->b(Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing$1;->a:Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;

    .line 21
    .line 22
    invoke-static {v0}, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->b(Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->f(Ljava/nio/ByteBuffer;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing$1;->a:Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;

    .line 30
    .line 31
    invoke-static {p0}, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;->c(Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    const-wide/32 v2, 0xf4240

    .line 36
    .line 37
    .line 38
    div-long/2addr v0, v2

    .line 39
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/util/netspeedutil/TcpPing$1;->a()Ljava/lang/Long;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
