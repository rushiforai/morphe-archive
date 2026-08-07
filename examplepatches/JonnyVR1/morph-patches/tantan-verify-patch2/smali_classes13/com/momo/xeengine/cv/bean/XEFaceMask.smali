.class public Lcom/momo/xeengine/cv/bean/XEFaceMask;
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

.field private length:I

.field private maskHeight:I

.field private maskWidth:I

.field private warpMat:[F


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
    iput-boolean v0, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->flipShowX:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getDatas()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->datas:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getLength()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->length:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaskHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->maskHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaskWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->maskWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getWarpMat()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->warpMat:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public isFlipShowX()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->flipShowX:Z

    .line 2
    .line 3
    return p0
.end method

.method public setDatas([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->datas:[B

    .line 2
    .line 3
    return-void
.end method

.method public setFlipShowX(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->flipShowX:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLength(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->length:I

    .line 2
    .line 3
    return-void
.end method

.method public setMaskHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->maskHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setMaskWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->maskWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setWarpMat([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEFaceMask;->warpMat:[F

    .line 2
    .line 3
    return-void
.end method
