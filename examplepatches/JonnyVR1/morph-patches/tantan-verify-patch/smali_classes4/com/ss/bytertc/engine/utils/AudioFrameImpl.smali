.class public Lcom/ss/bytertc/engine/utils/AudioFrameImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/utils/IAudioFrame;


# instance fields
.field private byteBuffer:Ljava/nio/ByteBuffer;

.field private channel:Lcom/ss/bytertc/engine/data/AudioChannel;

.field private extraBuffer:Ljava/nio/ByteBuffer;

.field private frameType:Lcom/ss/bytertc/engine/data/AudioFrameType;

.field private sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field private samplesPerChannel:I

.field private timestamp:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    .line 32
    iput v1, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->samplesPerChannel:I

    .line 33
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioFrameType;->FRAME_TYPE_PCM16:Lcom/ss/bytertc/engine/data/AudioFrameType;

    iput-object v1, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->frameType:Lcom/ss/bytertc/engine/data/AudioFrameType;

    const-wide/16 v1, 0x0

    .line 34
    iput-wide v1, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->timestamp:J

    .line 35
    iput-object v0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->extraBuffer:Ljava/nio/ByteBuffer;

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;ILcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;)V
    .locals 3

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 37
    iput-object v0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    .line 38
    iput v1, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->samplesPerChannel:I

    .line 39
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioFrameType;->FRAME_TYPE_PCM16:Lcom/ss/bytertc/engine/data/AudioFrameType;

    iput-object v1, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->frameType:Lcom/ss/bytertc/engine/data/AudioFrameType;

    const-wide/16 v1, 0x0

    .line 40
    iput-wide v1, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->timestamp:J

    .line 41
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 42
    iput p2, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->samplesPerChannel:I

    .line 43
    iput-object p3, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 44
    iput-object p4, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 45
    iput-object v0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->extraBuffer:Ljava/nio/ByteBuffer;

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;ILcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->samplesPerChannel:I

    .line 9
    .line 10
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioFrameType;->FRAME_TYPE_PCM16:Lcom/ss/bytertc/engine/data/AudioFrameType;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->frameType:Lcom/ss/bytertc/engine/data/AudioFrameType;

    .line 13
    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->timestamp:J

    .line 17
    .line 18
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    iput p2, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->samplesPerChannel:I

    .line 21
    .line 22
    iput-object p3, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 23
    .line 24
    iput-object p4, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 25
    .line 26
    iput-object p5, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->extraBuffer:Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>([BILcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;[B)V
    .locals 0

    .line 29
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-static {p5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p5

    invoke-direct/range {p0 .. p5}, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;-><init>(Ljava/nio/ByteBuffer;ILcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;Ljava/nio/ByteBuffer;)V

    return-void
.end method


# virtual methods
.method public channel()Lcom/ss/bytertc/engine/data/AudioChannel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 2
    .line 3
    return-object p0
.end method

.method public data_size()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->samplesPerChannel:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    mul-int/2addr v0, p0

    .line 10
    mul-int/lit8 v0, v0, 0x2

    .line 11
    .line 12
    return v0
.end method

.method public extraInfoSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->extraBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public frame_type()Lcom/ss/bytertc/engine/data/AudioFrameType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->frameType:Lcom/ss/bytertc/engine/data/AudioFrameType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDataBuffer()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExtraInfo()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->extraBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public release()V
    .locals 0

    return-void
.end method

.method public sample_rate()Lcom/ss/bytertc/engine/data/AudioSampleRate;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 2
    .line 3
    return-object p0
.end method

.method public timestamp_us()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;->timestamp:J

    .line 2
    .line 3
    return-wide v0
.end method
