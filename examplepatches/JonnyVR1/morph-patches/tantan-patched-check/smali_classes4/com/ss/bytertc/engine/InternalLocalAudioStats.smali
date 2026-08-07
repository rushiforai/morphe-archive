.class public Lcom/ss/bytertc/engine/InternalLocalAudioStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioDeviceLoopDelay:I

.field public audioLossRate:F

.field public encodeFrameRate:D

.field public jitter:I

.field public numChannels:I

.field public recordSampleRate:I

.field public rtt:I

.field public sendKBitrate:I

.field public sentSampleRate:I

.field public statsInterval:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(FIIIIIIIID)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->audioLossRate:F

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->sendKBitrate:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->recordSampleRate:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->statsInterval:I

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->rtt:I

    .line 13
    .line 14
    iput p6, p0, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->numChannels:I

    .line 15
    .line 16
    iput p7, p0, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->sentSampleRate:I

    .line 17
    .line 18
    iput p8, p0, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->jitter:I

    .line 19
    .line 20
    iput p9, p0, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->audioDeviceLoopDelay:I

    .line 21
    .line 22
    iput-wide p10, p0, Lcom/ss/bytertc/engine/InternalLocalAudioStats;->encodeFrameRate:D

    .line 23
    .line 24
    return-void
.end method

.method private static create(FIIIIIIIID)Lcom/ss/bytertc/engine/InternalLocalAudioStats;
    .locals 12
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalLocalAudioStats;

    .line 2
    .line 3
    move v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move/from16 v5, p4

    .line 8
    .line 9
    move/from16 v6, p5

    .line 10
    .line 11
    move/from16 v7, p6

    .line 12
    .line 13
    move/from16 v8, p7

    .line 14
    .line 15
    move/from16 v9, p8

    .line 16
    .line 17
    move-wide/from16 v10, p9

    .line 18
    .line 19
    invoke-direct/range {v0 .. v11}, Lcom/ss/bytertc/engine/InternalLocalAudioStats;-><init>(FIIIIIIIID)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method
