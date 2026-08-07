.class public Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public channelNum:Lcom/ss/bytertc/engine/data/AudioChannel;

.field public codecType:Lcom/ss/bytertc/engine/type/AudioCodecType;

.field public data:Ljava/nio/ByteBuffer;

.field public extraInfo:Ljava/nio/ByteBuffer;

.field public frameSizeMs:I

.field public sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public size:I

.field public timestampUs:J


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/type/AudioCodecType;Ljava/nio/ByteBuffer;IJLcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->codecType:Lcom/ss/bytertc/engine/type/AudioCodecType;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->data:Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->size:I

    .line 9
    .line 10
    iput-wide p4, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->timestampUs:J

    .line 11
    .line 12
    iput-object p6, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 13
    .line 14
    iput-object p7, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->channelNum:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 15
    .line 16
    iput p8, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->frameSizeMs:I

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->extraInfo:Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/type/AudioCodecType;Ljava/nio/ByteBuffer;IJLcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;ILjava/nio/ByteBuffer;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->codecType:Lcom/ss/bytertc/engine/type/AudioCodecType;

    .line 24
    iput-object p2, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->data:Ljava/nio/ByteBuffer;

    .line 25
    iput p3, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->size:I

    .line 26
    iput-wide p4, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->timestampUs:J

    .line 27
    iput-object p6, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 28
    iput-object p7, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->channelNum:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 29
    iput p8, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->frameSizeMs:I

    .line 30
    iput-object p9, p0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;->extraInfo:Ljava/nio/ByteBuffer;

    return-void
.end method
