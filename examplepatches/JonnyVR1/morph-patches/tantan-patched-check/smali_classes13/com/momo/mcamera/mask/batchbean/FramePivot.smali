.class public Lcom/momo/mcamera/mask/batchbean/FramePivot;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private pivotX:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "x"
    .end annotation
.end field

.field private pivotY:I
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
.method public getPivotX()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/batchbean/FramePivot;->pivotX:I

    .line 2
    .line 3
    return p0
.end method

.method public getPivotY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/batchbean/FramePivot;->pivotY:I

    .line 2
    .line 3
    return p0
.end method

.method public setPivotX(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/batchbean/FramePivot;->pivotX:I

    .line 2
    .line 3
    return-void
.end method

.method public setPivotY(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/batchbean/FramePivot;->pivotY:I

    .line 2
    .line 3
    return-void
.end method
