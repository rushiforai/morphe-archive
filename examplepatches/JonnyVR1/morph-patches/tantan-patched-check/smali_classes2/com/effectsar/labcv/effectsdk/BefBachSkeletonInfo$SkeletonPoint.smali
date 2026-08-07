.class public Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SkeletonPoint"
.end annotation


# instance fields
.field is_detect:Z

.field score:F

.field x:F

.field y:F


# direct methods
.method public constructor <init>(FFZF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->x:F

    .line 5
    .line 6
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->y:F

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->is_detect:Z

    .line 9
    .line 10
    iput p4, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->score:F

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public asPoint()Landroid/graphics/PointF;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->x:F

    .line 4
    .line 5
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->y:F

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public getScore()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->score:F

    .line 2
    .line 3
    return p0
.end method

.method public getX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->x:F

    .line 2
    .line 3
    return p0
.end method

.method public getY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->y:F

    .line 2
    .line 3
    return p0
.end method

.method public isDetect()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->is_detect:Z

    .line 2
    .line 3
    return p0
.end method

.method public setIs_detect(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->is_detect:Z

    .line 2
    .line 3
    return-void
.end method

.method public setX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->x:F

    .line 2
    .line 3
    return-void
.end method

.method public setY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->y:F

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "FacePoint{x="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->x:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", y="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->y:F

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", isdetect="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/BefBachSkeletonInfo$SkeletonPoint;->is_detect:Z

    .line 29
    .line 30
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const/16 p0, 0x7d

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method
