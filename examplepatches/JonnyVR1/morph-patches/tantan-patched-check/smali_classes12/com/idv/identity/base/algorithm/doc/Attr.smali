.class public Lcom/idv/identity/base/algorithm/doc/Attr;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field bottomScore:F

.field docRegion:Landroid/graphics/RectF;

.field faceScore:F

.field leftScore:F

.field public points:[F

.field rightScore:F

.field topScore:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    iput-object v0, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->points:[F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getBottomScore()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->bottomScore:F

    .line 2
    .line 3
    return p0
.end method

.method public getDocRegion()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->docRegion:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceScore()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->faceScore:F

    .line 2
    .line 3
    return p0
.end method

.method public getLeftScore()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->leftScore:F

    .line 2
    .line 3
    return p0
.end method

.method public getRightScore()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->rightScore:F

    .line 2
    .line 3
    return p0
.end method

.method public getTopScore()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->topScore:F

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Attr{topScore="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->topScore:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", rightScore="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->rightScore:F

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", bottomScore="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->bottomScore:F

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", leftScore="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->leftScore:F

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", faceScore="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->faceScore:F

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", docRegion="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->docRegion:Landroid/graphics/RectF;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", points="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/idv/identity/base/algorithm/doc/Attr;->points:[F

    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const/16 p0, 0x7d

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method
