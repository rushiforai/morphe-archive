.class public Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private channel:I

.field private height:I

.field private imageData:[B

.field private maskData:[B

.field private width:I


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
.method public getChannel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;->channel:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getImageData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;->imageData:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaskData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;->maskData:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public setChannel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;->channel:I

    .line 2
    .line 3
    return-void
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageData([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;->imageData:[B

    .line 2
    .line 3
    return-void
.end method

.method public setMaskData([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;->maskData:[B

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;->width:I

    .line 2
    .line 3
    return-void
.end method
