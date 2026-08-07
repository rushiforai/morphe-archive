.class public Lcom/momo/rtcbase/VideoFrame;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/RefCounted;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/VideoFrame$TextureBuffer;,
        Lcom/momo/rtcbase/VideoFrame$I420Buffer;,
        Lcom/momo/rtcbase/VideoFrame$Buffer;
    }
.end annotation


# instance fields
.field private final buffer:Lcom/momo/rtcbase/VideoFrame$Buffer;

.field private final rotation:I

.field private final timestampNs:J


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/VideoFrame$Buffer;IJ)V
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    rem-int/lit8 v1, p2, 0x5a

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iput-object p1, p0, Lcom/momo/rtcbase/VideoFrame;->buffer:Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 12
    .line 13
    iput p2, p0, Lcom/momo/rtcbase/VideoFrame;->rotation:I

    .line 14
    .line 15
    iput-wide p3, p0, Lcom/momo/rtcbase/VideoFrame;->timestampNs:J

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p0, "rotation must be a multiple of 90"

    .line 19
    .line 20
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw v0

    .line 24
    :cond_1
    const-string p0, "buffer not allowed to be null"

    .line 25
    .line 26
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    throw v0
.end method


# virtual methods
.method public getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/VideoFrame;->buffer:Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRotatedHeight()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/rtcbase/VideoFrame;->rotation:I

    .line 2
    .line 3
    rem-int/lit16 v0, v0, 0xb4

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/rtcbase/VideoFrame;->buffer:Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-interface {p0}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public getRotatedWidth()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/rtcbase/VideoFrame;->rotation:I

    .line 2
    .line 3
    rem-int/lit16 v0, v0, 0xb4

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/rtcbase/VideoFrame;->buffer:Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-interface {p0}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public getRotation()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/VideoFrame;->rotation:I

    .line 2
    .line 3
    return p0
.end method

.method public getTimestampNs()J
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/VideoFrame;->timestampNs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public release()V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/VideoFrame;->buffer:Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/momo/rtcbase/VideoFrame$Buffer;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/VideoFrame;->buffer:Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/momo/rtcbase/VideoFrame$Buffer;->retain()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
