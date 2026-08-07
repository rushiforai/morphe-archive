.class Lcom/tencent/iliveroom/a/a$13;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->enableEncSmallVideoStream(ZLcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;ZLcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$13;->e:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/iliveroom/a/a$13;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/iliveroom/a/a$13;->b:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/iliveroom/a/a$13;->c:I

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/iliveroom/a/a$13;->d:I

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/tencent/iliveroom/a/a$13;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$13;->b:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v3, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;->width:I

    .line 10
    .line 11
    if-lez v3, :cond_0

    .line 12
    .line 13
    iget v4, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;->height:I

    .line 14
    .line 15
    if-lez v4, :cond_0

    .line 16
    .line 17
    iget v5, p0, Lcom/tencent/iliveroom/a/a$13;->c:I

    .line 18
    .line 19
    if-lez v5, :cond_0

    .line 20
    .line 21
    iget v6, p0, Lcom/tencent/iliveroom/a/a$13;->d:I

    .line 22
    .line 23
    if-lez v6, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$13;->e:Lcom/tencent/iliveroom/a/a;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-static/range {v1 .. v6}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;IIIII)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v1, "enableEncSmallVideoStream -> disable small "

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-boolean v1, p0, Lcom/tencent/iliveroom/a/a$13;->a:Z

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, " size = "

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$13;->b:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, " fps = "

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget v1, p0, Lcom/tencent/iliveroom/a/a$13;->c:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v1, " videoBitrate = "

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget v1, p0, Lcom/tencent/iliveroom/a/a$13;->d:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const-string v1, "TRTCAdapter-ext"

    .line 79
    .line 80
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$13;->e:Lcom/tencent/iliveroom/a/a;

    .line 84
    .line 85
    const/4 v0, 0x0

    .line 86
    const/4 v1, 0x0

    .line 87
    invoke-static {p0, v0, v1}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)I

    .line 88
    .line 89
    .line 90
    return-void
.end method
