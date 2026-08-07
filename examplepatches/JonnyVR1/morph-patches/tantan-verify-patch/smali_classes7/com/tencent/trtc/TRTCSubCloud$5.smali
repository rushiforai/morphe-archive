.class Lcom/tencent/trtc/TRTCSubCloud$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/trtc/TRTCSubCloud;->snapshotVideo(Ljava/lang/String;ILcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:I

.field final synthetic c:Lcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;

.field final synthetic d:Lcom/tencent/trtc/TRTCSubCloud;


# direct methods
.method public constructor <init>(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;ILcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->b:I

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->c:Lcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$5300(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUser(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v1, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->b:I

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 33
    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v3, "snapshotRemoteSubStreamView->userId: "

    .line 37
    .line 38
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->a:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v1, v2}, Lcom/tencent/trtc/TRTCSubCloud;->access$5400(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->getVideoRender()Lcom/tencent/liteav/renderer/e;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    if-eqz v0, :cond_1

    .line 63
    .line 64
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 65
    .line 66
    if-eqz v1, :cond_1

    .line 67
    .line 68
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 69
    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 73
    .line 74
    new-instance v2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v3, "snapshotRemoteView->userId: "

    .line 77
    .line 78
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v3, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->a:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {v1, v2}, Lcom/tencent/trtc/TRTCSubCloud;->access$5500(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/tencent/liteav/TXCRenderAndDec;->getVideoRender()Lcom/tencent/liteav/renderer/e;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    goto :goto_0

    .line 102
    :cond_1
    const/4 v0, 0x0

    .line 103
    :goto_0
    if-eqz v0, :cond_2

    .line 104
    .line 105
    new-instance v1, Lcom/tencent/trtc/TRTCSubCloud$5$1;

    .line 106
    .line 107
    invoke-direct {v1, p0}, Lcom/tencent/trtc/TRTCSubCloud$5$1;-><init>(Lcom/tencent/trtc/TRTCSubCloud$5;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/renderer/e;->a(Lcom/tencent/liteav/basic/c/o;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_2
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 115
    .line 116
    new-instance v1, Lcom/tencent/trtc/TRTCSubCloud$5$2;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Lcom/tencent/trtc/TRTCSubCloud$5$2;-><init>(Lcom/tencent/trtc/TRTCSubCloud$5;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v0, v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$5700(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/Runnable;)V

    .line 122
    .line 123
    .line 124
    :cond_3
    return-void
.end method
