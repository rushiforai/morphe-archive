.class public Lcom/ss/bytertc/engine/utils/AudioFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public buffer:[B

.field public channel:Lcom/ss/bytertc/engine/data/AudioChannel;

.field public extraInfo:[B

.field public sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public samples:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>([BILcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/AudioFrame;->buffer:[B

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/utils/AudioFrame;->samples:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/ss/bytertc/engine/utils/AudioFrame;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/ss/bytertc/engine/utils/AudioFrame;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/AudioFrame;->extraInfo:[B

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>([BILcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;[B)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/AudioFrame;->buffer:[B

    .line 19
    iput p2, p0, Lcom/ss/bytertc/engine/utils/AudioFrame;->samples:I

    .line 20
    iput-object p3, p0, Lcom/ss/bytertc/engine/utils/AudioFrame;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 21
    iput-object p4, p0, Lcom/ss/bytertc/engine/utils/AudioFrame;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 22
    iput-object p5, p0, Lcom/ss/bytertc/engine/utils/AudioFrame;->extraInfo:[B

    return-void
.end method
