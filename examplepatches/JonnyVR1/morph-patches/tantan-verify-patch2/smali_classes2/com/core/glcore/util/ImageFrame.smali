.class public Lcom/core/glcore/util/ImageFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/core/glcore/util/ImageFrame$MMFormat;
    }
.end annotation


# instance fields
.field public format:I

.field public height:I

.field public imageByteBuffer:Ljava/nio/ByteBuffer;

.field imageByteData:[B

.field public step:I

.field public width:I


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
.method public getFormat()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/util/ImageFrame;->format:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/util/ImageFrame;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getImageByteBuffer()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/ImageFrame;->imageByteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImageByteData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/ImageFrame;->imageByteData:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getStep()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/util/ImageFrame;->step:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/util/ImageFrame;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public setFormat(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/util/ImageFrame;->format:I

    .line 2
    .line 3
    return-void
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/util/ImageFrame;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageByteBuffer(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/ImageFrame;->imageByteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-void
.end method

.method public setStep(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/util/ImageFrame;->step:I

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/util/ImageFrame;->width:I

    .line 2
    .line 3
    return-void
.end method
