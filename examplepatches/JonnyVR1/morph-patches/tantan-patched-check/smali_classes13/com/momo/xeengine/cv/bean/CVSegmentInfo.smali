.class public Lcom/momo/xeengine/cv/bean/CVSegmentInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private datas:[B

.field private flipShowX:Z

.field private height:I

.field private length:I

.field private warpMat:[F

.field private width:I


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
    iput-boolean v0, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->flipShowX:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getDatas()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->datas:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getLength()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->length:I

    .line 2
    .line 3
    return p0
.end method

.method public getWarpMat()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->warpMat:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public isFlipShowX()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->flipShowX:Z

    .line 2
    .line 3
    return p0
.end method

.method public setDatas([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->datas:[B

    .line 2
    .line 3
    return-void
.end method

.method public setFlipShowX(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->flipShowX:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setLength(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->length:I

    .line 2
    .line 3
    return-void
.end method

.method public setWarpMat([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->warpMat:[F

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->width:I

    .line 2
    .line 3
    return-void
.end method
