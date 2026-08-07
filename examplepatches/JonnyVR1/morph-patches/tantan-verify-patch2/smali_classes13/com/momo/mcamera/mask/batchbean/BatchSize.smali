.class public Lcom/momo/mcamera/mask/batchbean/BatchSize;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private imageBatchHeight:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "h"
    .end annotation
.end field

.field private imageBatchWidth:I
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
.method public getImageBatchHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchSize;->imageBatchHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getImageBatchWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchSize;->imageBatchWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public setImageBatchHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchSize;->imageBatchHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageBatchWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchSize;->imageBatchWidth:I

    .line 2
    .line 3
    return-void
.end method
