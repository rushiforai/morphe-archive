.class public Lcom/ss/bytertc/engine/InternalRemoteAudioStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioLossRate:F

.field public concealedSamples:I

.field public concealmentEvent:I

.field public decDuration:I

.field public decSampleRate:I

.field public decodeFrameRate:D

.field public e2eDelay:J

.field public frozenRate:I

.field public jitter:I

.field public jitterBufferDelay:I

.field public numChannels:I

.field public playoutSampleRate:I

.field public quality:I

.field public receivedKBitrate:I

.field public receivedSampleRate:I

.field public rtt:I

.field public stallCount:I

.field public stallDuration:I

.field public statsInterval:I

.field public totalRtt:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(FIIIJIIIIIIIIIIIIIID)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->audioLossRate:F

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->receivedKBitrate:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->stallCount:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->stallDuration:I

    .line 11
    .line 12
    iput-wide p5, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->e2eDelay:J

    .line 13
    .line 14
    iput p8, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->statsInterval:I

    .line 15
    .line 16
    iput p9, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->rtt:I

    .line 17
    .line 18
    iput p10, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->totalRtt:I

    .line 19
    .line 20
    iput p11, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->quality:I

    .line 21
    .line 22
    iput p12, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->jitterBufferDelay:I

    .line 23
    .line 24
    iput p13, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->numChannels:I

    .line 25
    .line 26
    iput p14, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->receivedSampleRate:I

    .line 27
    .line 28
    iput p15, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->frozenRate:I

    .line 29
    .line 30
    move/from16 p1, p16

    .line 31
    .line 32
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->concealedSamples:I

    .line 33
    .line 34
    move/from16 p1, p17

    .line 35
    .line 36
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->concealmentEvent:I

    .line 37
    .line 38
    move/from16 p1, p18

    .line 39
    .line 40
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->decSampleRate:I

    .line 41
    .line 42
    move/from16 p1, p19

    .line 43
    .line 44
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->decDuration:I

    .line 45
    .line 46
    move/from16 p1, p20

    .line 47
    .line 48
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->jitter:I

    .line 49
    .line 50
    move-wide/from16 p1, p21

    .line 51
    .line 52
    iput-wide p1, p0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;->decodeFrameRate:D

    .line 53
    .line 54
    return-void
.end method

.method private static create(FIIIJIIIIIIIIIIIIIID)Lcom/ss/bytertc/engine/InternalRemoteAudioStats;
    .locals 23
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;

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
    move-wide/from16 v5, p4

    .line 12
    .line 13
    move/from16 v7, p6

    .line 14
    .line 15
    move/from16 v8, p7

    .line 16
    .line 17
    move/from16 v9, p8

    .line 18
    .line 19
    move/from16 v10, p9

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
    move-wide/from16 v21, p20

    .line 42
    .line 43
    invoke-direct/range {v0 .. v22}, Lcom/ss/bytertc/engine/InternalRemoteAudioStats;-><init>(FIIIJIIIIIIIIIIIIIID)V

    .line 44
    .line 45
    .line 46
    return-object v0
.end method
