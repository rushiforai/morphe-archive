.class public Lcom/ss/bytertc/engine/handler/RTCAudioFileFrameObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mAudioFileFrameObserver:Lcom/ss/bytertc/engine/IAudioFileFrameObserver;


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

.method private static createAudioFrameImpl(Ljava/nio/ByteBuffer;III)Lcom/ss/bytertc/engine/utils/IAudioFrame;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;

    .line 9
    .line 10
    invoke-static {p2}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->fromId(I)Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {p3}, Lcom/ss/bytertc/engine/data/AudioChannel;->fromId(I)Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;-><init>(Ljava/nio/ByteBuffer;ILcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method


# virtual methods
.method public onAudioFileFrame(ILcom/ss/bytertc/engine/utils/IAudioFrame;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCAudioFileFrameObserver;->mAudioFileFrameObserver:Lcom/ss/bytertc/engine/IAudioFileFrameObserver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/ss/bytertc/engine/IAudioFileFrameObserver;->onAudioFileFrame(ILcom/ss/bytertc/engine/utils/IAudioFrame;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setAudioFileFrameObserver(Lcom/ss/bytertc/engine/IAudioFileFrameObserver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/handler/RTCAudioFileFrameObserver;->mAudioFileFrameObserver:Lcom/ss/bytertc/engine/IAudioFileFrameObserver;

    .line 2
    .line 3
    return-void
.end method
