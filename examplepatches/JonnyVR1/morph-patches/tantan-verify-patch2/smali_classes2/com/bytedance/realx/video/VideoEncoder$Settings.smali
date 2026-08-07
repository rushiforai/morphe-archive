.class public Lcom/bytedance/realx/video/VideoEncoder$Settings;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/VideoEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Settings"
.end annotation


# instance fields
.field public final bFrameNum:I

.field public final bitrateMode:Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;

.field public final closeSetProfile:Z

.field public final enableAsyncMode:Z

.field public final enableQpSetting:Z

.field public final encodeMode:Lcom/bytedance/realx/video/VideoEncoder$EncodeMode;

.field public final height:I

.field public final isStatisticsEnabled:Z

.field public final matrixId:I

.field public final maxIQp:I

.field public final maxQp:I

.field public final minIQp:I

.field public final minQp:I

.field public final primaryId:I

.field public final rangeId:I

.field public final scaleMode:Lcom/bytedance/realx/video/VideoEncoder$ScaleMode;

.field public final sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

.field public targetBps:I

.field public final targetFps:I

.field public final targetKeyFrameIntervalMs:I

.field public final temporalLayerNum:I

.field public final transferId:I

.field public final useSurfaceMode:Z

.field public final width:I


# direct methods
.method public constructor <init>(IIIIIIIIIIIIIZIIIZZIILcom/bytedance/realx/video/EglBase$Context;ZZ)V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Settings"
    .end annotation

    move-object/from16 v0, p22

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->width:I

    .line 3
    iput p2, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->height:I

    .line 4
    invoke-static {p3}, Lcom/bytedance/realx/video/VideoEncoder$ScaleMode;->fromValue(I)Lcom/bytedance/realx/video/VideoEncoder$ScaleMode;

    move-result-object p1

    iput-object p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->scaleMode:Lcom/bytedance/realx/video/VideoEncoder$ScaleMode;

    .line 5
    iput p4, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetBps:I

    .line 6
    iput p5, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetFps:I

    .line 7
    iput p6, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->primaryId:I

    .line 8
    iput p7, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->transferId:I

    .line 9
    iput p8, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->matrixId:I

    .line 10
    iput p9, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->rangeId:I

    .line 11
    iput p10, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxQp:I

    .line 12
    iput p11, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minQp:I

    move/from16 p1, p15

    .line 13
    iput p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->temporalLayerNum:I

    .line 14
    invoke-static/range {p16 .. p16}, Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;->fromValue(I)Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;

    move-result-object p1

    iput-object p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->bitrateMode:Lcom/bytedance/realx/video/VideoEncoder$BitrateMode;

    move/from16 p1, p17

    .line 15
    iput p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->targetKeyFrameIntervalMs:I

    move/from16 p1, p18

    .line 16
    iput-boolean p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->closeSetProfile:Z

    move/from16 p1, p19

    .line 17
    iput-boolean p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->useSurfaceMode:Z

    .line 18
    iput p12, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->maxIQp:I

    .line 19
    iput p13, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->minIQp:I

    move/from16 p1, p21

    .line 20
    iput p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->bFrameNum:I

    .line 21
    iput-boolean p14, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->enableQpSetting:Z

    .line 22
    invoke-static/range {p20 .. p20}, Lcom/bytedance/realx/video/VideoEncoder$EncodeMode;->fromValue(I)Lcom/bytedance/realx/video/VideoEncoder$EncodeMode;

    move-result-object p1

    iput-object p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->encodeMode:Lcom/bytedance/realx/video/VideoEncoder$EncodeMode;

    .line 23
    instance-of p1, v0, Lcom/bytedance/realx/video/EglBase14$Context;

    if-eqz p1, :cond_0

    .line 24
    move-object p1, v0

    check-cast p1, Lcom/bytedance/realx/video/EglBase14$Context;

    iput-object p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

    :goto_0
    move/from16 p1, p23

    goto :goto_1

    :cond_0
    const/4 p1, 0x0

    .line 25
    iput-object p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->sharedContext:Lcom/bytedance/realx/video/EglBase14$Context;

    goto :goto_0

    .line 26
    :goto_1
    iput-boolean p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->enableAsyncMode:Z

    move/from16 p1, p24

    .line 27
    iput-boolean p1, p0, Lcom/bytedance/realx/video/VideoEncoder$Settings;->isStatisticsEnabled:Z

    return-void
.end method
