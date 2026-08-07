.class public Ll/h910;
.super Ll/nw40;
.source "SourceFile"


# instance fields
.field public final m:Ljava/lang/String;

.field public final n:Z

.field public o:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;Ljava/lang/String;Z)V
    .locals 9

    .line 1
    move-object/from16 v0, p7

    .line 2
    .line 3
    iget-boolean v8, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->canMaintain:Z

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    move-object v2, p1

    .line 7
    move-object v3, p2

    .line 8
    move-object v4, p3

    .line 9
    move-object v5, p4

    .line 10
    move-object v6, p5

    .line 11
    move-object v7, p6

    .line 12
    invoke-direct/range {v1 .. v8}, Ll/nw40;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->appId:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->f:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->g:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channel:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->h:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->rtcProvider:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 30
    .line 31
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->userSig:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->i:Ljava/lang/String;

    .line 34
    .line 35
    iget p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->bitrate:I

    .line 36
    .line 37
    iput p1, p0, Ll/h910;->o:I

    .line 38
    .line 39
    move/from16 p1, p9

    .line 40
    .line 41
    iput-boolean p1, p0, Ll/h910;->n:Z

    .line 42
    .line 43
    move-object/from16 p1, p8

    .line 44
    .line 45
    iput-object p1, p0, Ll/h910;->m:Ljava/lang/String;

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 2
    .line 3
    return-object p0
.end method
