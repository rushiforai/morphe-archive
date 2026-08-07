.class public interface abstract Lcom/ss/bytertc/engine/utils/IAudioFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract channel()Lcom/ss/bytertc/engine/data/AudioChannel;
.end method

.method public abstract data_size()I
.end method

.method public abstract extraInfoSize()I
.end method

.method public abstract frame_type()Lcom/ss/bytertc/engine/data/AudioFrameType;
.end method

.method public abstract getDataBuffer()Ljava/nio/ByteBuffer;
.end method

.method public abstract getExtraInfo()Ljava/nio/ByteBuffer;
.end method

.method public abstract release()V
.end method

.method public abstract sample_rate()Lcom/ss/bytertc/engine/data/AudioSampleRate;
.end method

.method public abstract timestamp_us()J
.end method
