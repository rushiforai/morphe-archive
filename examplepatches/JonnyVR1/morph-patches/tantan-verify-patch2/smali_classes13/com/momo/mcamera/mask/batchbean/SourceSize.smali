.class public Lcom/momo/mcamera/mask/batchbean/SourceSize;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private imageSizeHeight:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "h"
    .end annotation
.end field

.field private imageSizeWidth:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "w"
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
.method public getImageSizeHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/batchbean/SourceSize;->imageSizeHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getImageSizeWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/batchbean/SourceSize;->imageSizeWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public setImageSizeHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/batchbean/SourceSize;->imageSizeHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageSizeWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/batchbean/SourceSize;->imageSizeWidth:I

    .line 2
    .line 3
    return-void
.end method
