.class public abstract Lcom/immomo/mediabase/AudioProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected mSampleBits:I

.field protected mSampleChannels:I

.field protected mSampleRate:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public prepare()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public abstract processAudioFrame(Lcom/immomo/mediabase/PacketData;IJ)Lcom/immomo/mediabase/PacketData;
.end method

.method public abstract release()V
.end method

.method public reset()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public setAudioInfo(III)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediabase/AudioProcessor;->mSampleRate:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/mediabase/AudioProcessor;->mSampleBits:I

    .line 4
    .line 5
    iput p3, p0, Lcom/immomo/mediabase/AudioProcessor;->mSampleChannels:I

    .line 6
    .line 7
    return-void
.end method
