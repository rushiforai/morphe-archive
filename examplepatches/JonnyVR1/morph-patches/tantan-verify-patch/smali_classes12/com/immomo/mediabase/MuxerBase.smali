.class public abstract Lcom/immomo/mediabase/MuxerBase;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MEDIA_TRACK_AUDIO:I = 0x1

.field public static final MEDIA_TRACK_AV:I = 0x3

.field public static final MEDIA_TRACK_VIDEO:I = 0x2


# instance fields
.field protected mAddedMediaTrack:I

.field protected mMediaTrackInfo:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/mediabase/MuxerBase;->mAddedMediaTrack:I

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    iput v0, p0, Lcom/immomo/mediabase/MuxerBase;->mMediaTrackInfo:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public abstract addMediaTrack(Landroid/media/MediaFormat;I)I
.end method

.method public abstract isStarting()Z
.end method

.method public abstract setVideoOrientation(I)V
.end method

.method public abstract startMuxing()V
.end method

.method public abstract stopMuxing()V
.end method

.method public abstract writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z
.end method
