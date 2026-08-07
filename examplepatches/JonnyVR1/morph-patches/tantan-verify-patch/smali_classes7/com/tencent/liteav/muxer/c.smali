.class public Lcom/tencent/liteav/muxer/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/muxer/a;


# instance fields
.field private a:I

.field private b:Lcom/tencent/liteav/muxer/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/liteav/muxer/c;->a:I

    .line 6
    .line 7
    const-string v1, "TXCMP4Muxer: use sw model "

    .line 8
    .line 9
    const-string v2, "TXCMP4Muxer"

    .line 10
    .line 11
    if-eqz p2, :cond_2

    .line 12
    .line 13
    const-string v3, "TXCMP4Muxer: use hw model "

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    if-eq p2, v4, :cond_1

    .line 17
    .line 18
    invoke-static {p1}, Lcom/tencent/liteav/muxer/c;->a(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iput v0, p0, Lcom/tencent/liteav/muxer/c;->a:I

    .line 25
    .line 26
    new-instance p1, Lcom/tencent/liteav/muxer/d;

    .line 27
    .line 28
    invoke-direct {p1}, Lcom/tencent/liteav/muxer/d;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    .line 32
    .line 33
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iput v4, p0, Lcom/tencent/liteav/muxer/c;->a:I

    .line 38
    .line 39
    new-instance p1, Lcom/tencent/liteav/muxer/b;

    .line 40
    .line 41
    invoke-direct {p1}, Lcom/tencent/liteav/muxer/b;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    .line 45
    .line 46
    invoke-static {v2, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iput v4, p0, Lcom/tencent/liteav/muxer/c;->a:I

    .line 51
    .line 52
    new-instance p1, Lcom/tencent/liteav/muxer/b;

    .line 53
    .line 54
    invoke-direct {p1}, Lcom/tencent/liteav/muxer/b;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    .line 58
    .line 59
    invoke-static {v2, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    iput v0, p0, Lcom/tencent/liteav/muxer/c;->a:I

    .line 64
    .line 65
    new-instance p1, Lcom/tencent/liteav/muxer/d;

    .line 66
    .line 67
    invoke-direct {p1}, Lcom/tencent/liteav/muxer/d;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    .line 71
    .line 72
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/basic/d/c;->a(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/d/c;->d()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/4 v0, 0x1

    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    invoke-interface {p0}, Lcom/tencent/liteav/muxer/a;->a()I

    move-result p0

    return p0
.end method

.method public a(Landroid/media/MediaFormat;)V
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    invoke-interface {p0, p1}, Lcom/tencent/liteav/muxer/a;->a(Landroid/media/MediaFormat;)V

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    invoke-interface {p0, p1}, Lcom/tencent/liteav/muxer/a;->a(Ljava/lang/String;)V

    return-void
.end method

.method public a([BIIJI)V
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    invoke-interface/range {p0 .. p6}, Lcom/tencent/liteav/muxer/a;->a([BIIJI)V

    return-void
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tencent/liteav/muxer/a;->b()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b(Landroid/media/MediaFormat;)V
    .locals 0

    .line 9
    iget-object p0, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    invoke-interface {p0, p1}, Lcom/tencent/liteav/muxer/a;->b(Landroid/media/MediaFormat;)V

    return-void
.end method

.method public b([BIIJI)V
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    invoke-interface/range {p0 .. p6}, Lcom/tencent/liteav/muxer/a;->b([BIIJI)V

    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/muxer/c;->b:Lcom/tencent/liteav/muxer/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tencent/liteav/muxer/a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
