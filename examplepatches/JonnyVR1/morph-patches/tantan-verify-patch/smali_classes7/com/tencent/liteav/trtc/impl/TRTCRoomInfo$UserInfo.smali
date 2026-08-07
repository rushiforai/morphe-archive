.class public Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserInfo"
.end annotation


# instance fields
.field public debugMargin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

.field public mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

.field public muteAudioInSpeaker:Z

.field public streamState:I

.field public streamType:I

.field public subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

.field public terminalType:I

.field public tinyID:J

.field public userID:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;II)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 10
    .line 11
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    iput v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 20
    .line 21
    new-instance v0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    const v2, 0x3dcccccd    # 0.1f

    .line 25
    .line 26
    .line 27
    invoke-direct {v0, v1, v1, v2, v1}, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;-><init>(FFFF)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->debugMargin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->muteAudioInSpeaker:Z

    .line 34
    .line 35
    iput-wide p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 36
    .line 37
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->userID:Ljava/lang/String;

    .line 38
    .line 39
    iput p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->terminalType:I

    .line 40
    .line 41
    iput p5, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamState:I

    .line 42
    .line 43
    iget-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 44
    .line 45
    iput-wide p1, p3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->tinyID:J

    .line 46
    .line 47
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 48
    .line 49
    iput-wide p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->tinyID:J

    .line 50
    .line 51
    return-void
.end method
