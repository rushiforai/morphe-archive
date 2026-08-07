.class public Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefFaceInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FaceRect"
.end annotation


# instance fields
.field bottom:I

.field left:I

.field right:I

.field top:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->left:I

    .line 5
    .line 6
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->right:I

    .line 7
    .line 8
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->top:I

    .line 9
    .line 10
    iput p4, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->bottom:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getBottom()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->bottom:I

    .line 2
    .line 3
    return p0
.end method

.method public getLeft()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->left:I

    .line 2
    .line 3
    return p0
.end method

.method public getRight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->right:I

    .line 2
    .line 3
    return p0
.end method

.method public getTop()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->top:I

    .line 2
    .line 3
    return p0
.end method

.method public setBottom(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->bottom:I

    .line 2
    .line 3
    return-void
.end method

.method public setLeft(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->left:I

    .line 2
    .line 3
    return-void
.end method

.method public setRight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->right:I

    .line 2
    .line 3
    return-void
.end method

.method public setTop(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->top:I

    .line 2
    .line 3
    return-void
.end method

.method public toRect()Landroid/graphics/Rect;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->left:I

    .line 4
    .line 5
    iget v2, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->top:I

    .line 6
    .line 7
    iget v3, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->right:I

    .line 8
    .line 9
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->bottom:I

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "FaceRect{left="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->left:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", top="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->top:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", right="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->right:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", bottom="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->bottom:I

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x7d

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method
