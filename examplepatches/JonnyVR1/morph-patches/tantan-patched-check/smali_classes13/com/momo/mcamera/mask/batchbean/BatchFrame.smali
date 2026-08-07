.class public Lcom/momo/mcamera/mask/batchbean/BatchFrame;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private imageHeight:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "h"
    .end annotation
.end field

.field private imageWidth:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "w"
    .end annotation
.end field

.field private imageX:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "x"
    .end annotation
.end field

.field private imageY:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "y"
    .end annotation
.end field


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
.method public getImageHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->imageHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getImageWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->imageWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getImageX()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->imageX:I

    .line 2
    .line 3
    return p0
.end method

.method public getImageY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->imageY:I

    .line 2
    .line 3
    return p0
.end method

.method public setImageHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->imageHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->imageWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageX(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->imageX:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageY(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchFrame;->imageY:I

    .line 2
    .line 3
    return-void
.end method
