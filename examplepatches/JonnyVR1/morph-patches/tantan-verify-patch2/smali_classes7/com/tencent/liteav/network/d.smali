.class public Lcom/tencent/liteav/network/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/network/f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/network/d$b;,
        Lcom/tencent/liteav/network/d$a;
    }
.end annotation


# instance fields
.field private a:Lcom/tencent/liteav/network/f;

.field private b:Lcom/tencent/liteav/network/d$b;

.field private c:J

.field private d:J

.field private e:Lcom/tencent/liteav/network/d$b;

.field private f:Lcom/tencent/liteav/network/d$a;

.field private g:J

.field private h:J


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/d$a;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/network/d;->a:Lcom/tencent/liteav/network/f;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/network/d;->b:Lcom/tencent/liteav/network/d$b;

    .line 8
    .line 9
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    iput-wide v1, p0, Lcom/tencent/liteav/network/d;->c:J

    .line 12
    .line 13
    iput-wide v1, p0, Lcom/tencent/liteav/network/d;->d:J

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/liteav/network/d;->e:Lcom/tencent/liteav/network/d$b;

    .line 16
    .line 17
    iput-wide v1, p0, Lcom/tencent/liteav/network/d;->g:J

    .line 18
    .line 19
    iput-wide v1, p0, Lcom/tencent/liteav/network/d;->h:J

    .line 20
    .line 21
    iput-object p1, p0, Lcom/tencent/liteav/network/d;->f:Lcom/tencent/liteav/network/d$a;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/network/d;)J
    .locals 2

    .line 81
    iget-wide v0, p0, Lcom/tencent/liteav/network/d;->d:J

    return-wide v0
.end method


# virtual methods
.method public a(J)J
    .locals 2

    .line 84
    iget-object p1, p0, Lcom/tencent/liteav/network/d;->b:Lcom/tencent/liteav/network/d$b;

    if-eqz p1, :cond_0

    .line 85
    iget-wide v0, p0, Lcom/tencent/liteav/network/d;->c:J

    invoke-virtual {p1, v0, v1}, Lcom/tencent/liteav/network/d$b;->b(J)V

    .line 86
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, " stream_switch delay stop begin from "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/tencent/liteav/network/d;->c:J

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "TXCMultiStreamDownloader"

    invoke-static {p2, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    iget-wide p0, p0, Lcom/tencent/liteav/network/d;->c:J

    return-wide p0
.end method

.method public a()V
    .locals 3

    .line 77
    iget-object v0, p0, Lcom/tencent/liteav/network/d;->b:Lcom/tencent/liteav/network/d$b;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    .line 78
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/network/d$b;->b(J)V

    .line 79
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/network/d;->e:Lcom/tencent/liteav/network/d$b;

    if-eqz p0, :cond_1

    .line 80
    invoke-virtual {p0, v1, v2}, Lcom/tencent/liteav/network/d$b;->b(J)V

    :cond_1
    return-void
.end method

.method public a(Lcom/tencent/liteav/network/TXIStreamDownloader;Lcom/tencent/liteav/network/TXIStreamDownloader;JJLjava/lang/String;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/tencent/liteav/network/TXIStreamDownloader;->getCurrentTS()J

    .line 2
    .line 3
    .line 4
    move-result-wide p3

    .line 5
    iput-wide p3, p0, Lcom/tencent/liteav/network/d;->c:J

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tencent/liteav/network/TXIStreamDownloader;->getLastIFrameTS()J

    .line 8
    .line 9
    .line 10
    move-result-wide p3

    .line 11
    iput-wide p3, p0, Lcom/tencent/liteav/network/d;->d:J

    .line 12
    .line 13
    new-instance p3, Lcom/tencent/liteav/network/d$b;

    .line 14
    .line 15
    invoke-direct {p3, p1, p0}, Lcom/tencent/liteav/network/d$b;-><init>(Lcom/tencent/liteav/network/TXIStreamDownloader;Lcom/tencent/liteav/network/d;)V

    .line 16
    .line 17
    .line 18
    iput-object p3, p0, Lcom/tencent/liteav/network/d;->b:Lcom/tencent/liteav/network/d$b;

    .line 19
    .line 20
    invoke-virtual {p3, p0}, Lcom/tencent/liteav/network/d$b;->a(Lcom/tencent/liteav/network/f;)V

    .line 21
    .line 22
    .line 23
    move-object p3, p1

    .line 24
    check-cast p3, Lcom/tencent/liteav/network/TXCFLVDownloader;

    .line 25
    .line 26
    const/4 p4, 0x1

    .line 27
    invoke-virtual {p3, p4}, Lcom/tencent/liteav/network/TXCFLVDownloader;->recvData(Z)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ljava/util/Vector;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance p3, Lcom/tencent/liteav/network/e;

    .line 36
    .line 37
    const/4 p5, 0x0

    .line 38
    invoke-direct {p3, p7, p5}, Lcom/tencent/liteav/network/e;-><init>(Ljava/lang/String;Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, p3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2, p7}, Lcom/tencent/liteav/network/TXIStreamDownloader;->setOriginUrl(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    move-object p3, p2

    .line 48
    check-cast p3, Lcom/tencent/liteav/network/TXCFLVDownloader;

    .line 49
    .line 50
    invoke-virtual {p3, p4}, Lcom/tencent/liteav/network/TXCFLVDownloader;->recvData(Z)V

    .line 51
    .line 52
    .line 53
    iget-boolean v4, p1, Lcom/tencent/liteav/network/TXIStreamDownloader;->mEnableMessage:Z

    .line 54
    .line 55
    iget-boolean v5, p1, Lcom/tencent/liteav/network/TXIStreamDownloader;->mEnableMetaData:Z

    .line 56
    .line 57
    const/4 v2, 0x0

    .line 58
    const/4 v3, 0x0

    .line 59
    move-object v0, p2

    .line 60
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/liteav/network/TXIStreamDownloader;->startDownload(Ljava/util/Vector;ZZZZ)V

    .line 61
    .line 62
    .line 63
    new-instance p1, Lcom/tencent/liteav/network/d$b;

    .line 64
    .line 65
    invoke-direct {p1, v0, p0}, Lcom/tencent/liteav/network/d$b;-><init>(Lcom/tencent/liteav/network/TXIStreamDownloader;Lcom/tencent/liteav/network/d;)V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Lcom/tencent/liteav/network/d;->e:Lcom/tencent/liteav/network/d$b;

    .line 69
    .line 70
    iget-wide p2, p0, Lcom/tencent/liteav/network/d;->c:J

    .line 71
    .line 72
    invoke-virtual {p1, p2, p3}, Lcom/tencent/liteav/network/d$b;->a(J)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public a(Lcom/tencent/liteav/network/TXIStreamDownloader;Z)V
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/tencent/liteav/network/d;->f:Lcom/tencent/liteav/network/d$a;

    if-eqz p0, :cond_0

    .line 83
    invoke-interface {p0, p1, p2}, Lcom/tencent/liteav/network/d$a;->onSwitchFinish(Lcom/tencent/liteav/network/TXIStreamDownloader;Z)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/liteav/network/f;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/tencent/liteav/network/d;->a:Lcom/tencent/liteav/network/f;

    return-void
.end method

.method public b()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/network/d;->b:Lcom/tencent/liteav/network/d$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/network/d$b;->a(Lcom/tencent/liteav/network/f;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/liteav/network/d;->e:Lcom/tencent/liteav/network/d$b;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/network/d$b;->a(Lcom/tencent/liteav/network/f;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/liteav/network/d;->e:Lcom/tencent/liteav/network/d$b;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/liteav/network/d;->b:Lcom/tencent/liteav/network/d$b;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/tencent/liteav/network/d;->e:Lcom/tencent/liteav/network/d$b;

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v1, " stream_switch end at "

    .line 21
    .line 22
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-wide v1, p0, Lcom/tencent/liteav/network/d;->c:J

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, " stop ts "

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-wide v1, p0, Lcom/tencent/liteav/network/d;->h:J

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, " start ts "

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-wide v1, p0, Lcom/tencent/liteav/network/d;->g:J

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, " diff ts "

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-wide v1, p0, Lcom/tencent/liteav/network/d;->h:J

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/tencent/liteav/network/d;->g:J

    .line 58
    .line 59
    cmp-long p0, v1, v3

    .line 60
    .line 61
    if-lez p0, :cond_0

    .line 62
    .line 63
    sub-long/2addr v1, v3

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    sub-long v1, v3, v1

    .line 66
    .line 67
    :goto_0
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string v0, "TXCMultiStreamDownloader"

    .line 75
    .line 76
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public b(J)V
    .locals 0

    .line 80
    iput-wide p1, p0, Lcom/tencent/liteav/network/d;->g:J

    return-void
.end method

.method public c(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/liteav/network/d;->h:J

    .line 2
    .line 3
    return-void
.end method

.method public onPullAudio(Lcom/tencent/liteav/basic/structs/a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/network/d;->a:Lcom/tencent/liteav/network/f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/tencent/liteav/network/f;->onPullAudio(Lcom/tencent/liteav/basic/structs/a;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onPullNAL(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 3

    .line 1
    iget-wide v0, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/tencent/liteav/network/d;->c:J

    .line 4
    .line 5
    iget v2, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/tencent/liteav/network/d;->d:J

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/network/d;->a:Lcom/tencent/liteav/network/f;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0, p1}, Lcom/tencent/liteav/network/f;->onPullNAL(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method
