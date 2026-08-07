.class public Lcom/ss/bytertc/engine/InternalRemoteVideoStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public avSyncDiffMs:I

.field public capToRenderDelay:I

.field public codecElapsePerFrame:I

.field public codecType:I

.field public decoderOutputFrameRate:I

.field public e2eDelay:J

.field public frozenRate:I

.field public height:I

.field public isScreen:Z

.field public jitter:I

.field public receivedKBitrate:F

.field public rendererOutputFrameRate:I

.field public rtt:I

.field public stallCount:I

.field public stallDuration:I

.field public statsInterval:I

.field public superResolutionMode:I

.field public videoIndex:I

.field public videoLossRate:F

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(IIFFIIIIJZIIIIIIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->width:I

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->height:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->videoLossRate:F

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->receivedKBitrate:F

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->decoderOutputFrameRate:I

    .line 13
    .line 14
    iput p6, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->rendererOutputFrameRate:I

    .line 15
    .line 16
    iput p7, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->stallCount:I

    .line 17
    .line 18
    iput p8, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->stallDuration:I

    .line 19
    .line 20
    iput-wide p9, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->e2eDelay:J

    .line 21
    .line 22
    iput-boolean p11, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->isScreen:Z

    .line 23
    .line 24
    iput p12, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->statsInterval:I

    .line 25
    .line 26
    iput p13, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->rtt:I

    .line 27
    .line 28
    iput p14, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->frozenRate:I

    .line 29
    .line 30
    iput p15, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->codecType:I

    .line 31
    .line 32
    move/from16 p1, p16

    .line 33
    .line 34
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->videoIndex:I

    .line 35
    .line 36
    move/from16 p1, p17

    .line 37
    .line 38
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->jitter:I

    .line 39
    .line 40
    move/from16 p1, p18

    .line 41
    .line 42
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->superResolutionMode:I

    .line 43
    .line 44
    move/from16 p1, p19

    .line 45
    .line 46
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->capToRenderDelay:I

    .line 47
    .line 48
    move/from16 p1, p20

    .line 49
    .line 50
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->avSyncDiffMs:I

    .line 51
    .line 52
    move/from16 p1, p21

    .line 53
    .line 54
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;->codecElapsePerFrame:I

    .line 55
    .line 56
    return-void
.end method

.method private static create(IIFFIIIIJZIIIIIIIIII)Lcom/ss/bytertc/engine/InternalRemoteVideoStats;
    .locals 22
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;

    .line 2
    .line 3
    move/from16 v1, p0

    .line 4
    .line 5
    move/from16 v2, p1

    .line 6
    .line 7
    move/from16 v3, p2

    .line 8
    .line 9
    move/from16 v4, p3

    .line 10
    .line 11
    move/from16 v5, p4

    .line 12
    .line 13
    move/from16 v6, p5

    .line 14
    .line 15
    move/from16 v7, p6

    .line 16
    .line 17
    move/from16 v8, p7

    .line 18
    .line 19
    move-wide/from16 v9, p8

    .line 20
    .line 21
    move/from16 v11, p10

    .line 22
    .line 23
    move/from16 v12, p11

    .line 24
    .line 25
    move/from16 v13, p12

    .line 26
    .line 27
    move/from16 v14, p13

    .line 28
    .line 29
    move/from16 v15, p14

    .line 30
    .line 31
    move/from16 v16, p15

    .line 32
    .line 33
    move/from16 v17, p16

    .line 34
    .line 35
    move/from16 v18, p17

    .line 36
    .line 37
    move/from16 v19, p18

    .line 38
    .line 39
    move/from16 v20, p19

    .line 40
    .line 41
    move/from16 v21, p20

    .line 42
    .line 43
    invoke-direct/range {v0 .. v21}, Lcom/ss/bytertc/engine/InternalRemoteVideoStats;-><init>(IIFFIIIIJZIIIIIIIIII)V

    .line 44
    .line 45
    .line 46
    return-object v0
.end method
