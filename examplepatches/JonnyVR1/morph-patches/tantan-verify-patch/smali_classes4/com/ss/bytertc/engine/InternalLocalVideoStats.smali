.class public Lcom/ss/bytertc/engine/InternalLocalVideoStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public codecType:I

.field public encodedBitrate:I

.field public encodedFrameCount:I

.field public encodedFrameHeight:I

.field public encodedFrameWidth:I

.field public encoderOutputFrameRate:I

.field public inputFrameRate:I

.field public isScreen:Z

.field public jitter:I

.field public rendererOutputFrameRate:I

.field public rtt:I

.field public sentFrameRate:I

.field public sentKBitrate:F

.field public statsInterval:I

.field public videoDenoiseMode:I

.field public videoLossRate:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(FIIIIIFIIIIIIZII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->sentKBitrate:F

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->inputFrameRate:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->sentFrameRate:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->encoderOutputFrameRate:I

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->rendererOutputFrameRate:I

    .line 13
    .line 14
    iput p6, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->statsInterval:I

    .line 15
    .line 16
    iput p7, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->videoLossRate:F

    .line 17
    .line 18
    iput p8, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->rtt:I

    .line 19
    .line 20
    iput p9, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->encodedBitrate:I

    .line 21
    .line 22
    iput p10, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->encodedFrameWidth:I

    .line 23
    .line 24
    iput p11, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->encodedFrameHeight:I

    .line 25
    .line 26
    iput p12, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->encodedFrameCount:I

    .line 27
    .line 28
    iput p13, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->codecType:I

    .line 29
    .line 30
    iput-boolean p14, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->isScreen:Z

    .line 31
    .line 32
    iput p15, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->jitter:I

    .line 33
    .line 34
    move/from16 p1, p16

    .line 35
    .line 36
    iput p1, p0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;->videoDenoiseMode:I

    .line 37
    .line 38
    return-void
.end method

.method private static create(FIIIIIFIIIIIIZII)Lcom/ss/bytertc/engine/InternalLocalVideoStats;
    .locals 17
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalLocalVideoStats;

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
    move/from16 v9, p8

    .line 20
    .line 21
    move/from16 v10, p9

    .line 22
    .line 23
    move/from16 v11, p10

    .line 24
    .line 25
    move/from16 v12, p11

    .line 26
    .line 27
    move/from16 v13, p12

    .line 28
    .line 29
    move/from16 v14, p13

    .line 30
    .line 31
    move/from16 v15, p14

    .line 32
    .line 33
    move/from16 v16, p15

    .line 34
    .line 35
    invoke-direct/range {v0 .. v16}, Lcom/ss/bytertc/engine/InternalLocalVideoStats;-><init>(FIIIIIFIIIIIIZII)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method
