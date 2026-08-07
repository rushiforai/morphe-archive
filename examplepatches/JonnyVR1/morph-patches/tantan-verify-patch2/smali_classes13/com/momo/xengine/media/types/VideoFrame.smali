.class public Lcom/momo/xengine/media/types/VideoFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private data:[B

.field private filp:Z

.field private flipY:Z

.field private format:Lcom/momo/xengine/media/types/PixelFormat;

.field private height:I

.field private lineSize:I

.field private speed:F

.field private timestamp:J

.field private width:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/xengine/media/types/VideoFrame;->data:[B

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/momo/xengine/media/types/VideoFrame;->lineSize:I

    .line 9
    .line 10
    const-wide/16 v1, 0x0

    .line 11
    .line 12
    iput-wide v1, p0, Lcom/momo/xengine/media/types/VideoFrame;->timestamp:J

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momo/xengine/media/types/VideoFrame;->flipY:Z

    .line 15
    .line 16
    sget-object v0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NONE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/momo/xengine/media/types/VideoFrame;->format:Lcom/momo/xengine/media/types/PixelFormat;

    .line 19
    .line 20
    const/high16 v0, 0x3f800000    # 1.0f

    .line 21
    .line 22
    iput v0, p0, Lcom/momo/xengine/media/types/VideoFrame;->speed:F

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public getData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/VideoFrame;->data:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getFormat()Lcom/momo/xengine/media/types/PixelFormat;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/VideoFrame;->format:Lcom/momo/xengine/media/types/PixelFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/VideoFrame;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getLineSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/VideoFrame;->lineSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getSpeed()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/VideoFrame;->speed:F

    .line 2
    .line 3
    return p0
.end method

.method public getTimestamp()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/types/VideoFrame;->timestamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/VideoFrame;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public isFilp()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xengine/media/types/VideoFrame;->filp:Z

    .line 2
    .line 3
    return p0
.end method

.method public isFlipY()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xengine/media/types/VideoFrame;->flipY:Z

    .line 2
    .line 3
    return p0
.end method

.method public setData([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/types/VideoFrame;->data:[B

    .line 2
    .line 3
    return-void
.end method

.method public setFilp(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xengine/media/types/VideoFrame;->filp:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFlipY(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xengine/media/types/VideoFrame;->flipY:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFormat(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/media/types/PixelFormat;->valueOf(I)Lcom/momo/xengine/media/types/PixelFormat;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/momo/xengine/media/types/VideoFrame;->format:Lcom/momo/xengine/media/types/PixelFormat;

    .line 6
    .line 7
    return-void
.end method

.method public setFormat(Lcom/momo/xengine/media/types/PixelFormat;)V
    .locals 0
    .param p1    # Lcom/momo/xengine/media/types/PixelFormat;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 8
    iput-object p1, p0, Lcom/momo/xengine/media/types/VideoFrame;->format:Lcom/momo/xengine/media/types/PixelFormat;

    return-void
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/VideoFrame;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setLineSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/VideoFrame;->lineSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setSpeed(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/VideoFrame;->speed:F

    .line 2
    .line 3
    return-void
.end method

.method public setTimestamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/types/VideoFrame;->timestamp:J

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/VideoFrame;->width:I

    .line 2
    .line 3
    return-void
.end method
