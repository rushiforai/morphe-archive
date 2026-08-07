.class public final Lcom/momo/xeengine/sensor/Vector3f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected points:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    .line 90
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    return-void
.end method

.method public constructor <init>(F)V
    .locals 1

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    .line 85
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    const/4 p0, 0x0

    .line 86
    aput p1, v0, p0

    const/4 p0, 0x1

    .line 87
    aput p1, v0, p0

    const/4 p0, 0x2

    .line 88
    aput p1, v0, p0

    return-void
.end method

.method public constructor <init>(FFF)V
    .locals 1

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    .line 97
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    const/4 p0, 0x0

    .line 98
    aput p1, v0, p0

    const/4 p0, 0x1

    .line 99
    aput p2, v0, p0

    const/4 p0, 0x2

    .line 100
    aput p3, v0, p0

    return-void
.end method

.method public constructor <init>(Lcom/momo/xeengine/sensor/Vector3f;)V
    .locals 2

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    .line 92
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 93
    iget-object p0, p1, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    const/4 p1, 0x0

    aget v1, p0, p1

    aput v1, v0, p1

    const/4 p1, 0x1

    .line 94
    aget v1, p0, p1

    aput v1, v0, p1

    const/4 p1, 0x2

    .line 95
    aget p0, p0, p1

    aput p0, v0, p1

    return-void
.end method

.method public constructor <init>(Lcom/momo/xeengine/sensor/Vector4f;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector4f;->w()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    cmpl-float v0, v0, v1

    .line 15
    .line 16
    iget-object v1, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    const/4 v3, 0x1

    .line 20
    const/4 v4, 0x0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector4f;->x()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector4f;->w()F

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    div-float/2addr v0, v5

    .line 32
    aput v0, v1, v4

    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector4f;->y()F

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector4f;->w()F

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    div-float/2addr v1, v4

    .line 45
    aput v1, v0, v3

    .line 46
    .line 47
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector4f;->z()F

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector4f;->w()F

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    div-float/2addr v0, p1

    .line 58
    aput v0, p0, v2

    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector4f;->x()F

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    aput v0, v1, v4

    .line 66
    .line 67
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector4f;->y()F

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    aput v1, v0, v3

    .line 74
    .line 75
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector4f;->z()F

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    aput p1, p0, v2

    .line 82
    .line 83
    return-void
.end method


# virtual methods
.method public add(F)V
    .locals 2

    .line 30
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    const/4 v0, 0x0

    aget v1, p0, v0

    add-float/2addr v1, p1

    aput v1, p0, v0

    const/4 v0, 0x1

    .line 31
    aget v1, p0, v0

    add-float/2addr v1, p1

    aput v1, p0, v0

    const/4 v0, 0x2

    .line 32
    aget v1, p0, v0

    add-float/2addr v1, p1

    aput v1, p0, v0

    return-void
.end method

.method public add(Lcom/momo/xeengine/sensor/Vector3f;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 7
    .line 8
    aget v2, p1, v0

    .line 9
    .line 10
    add-float/2addr v1, v2

    .line 11
    aput v1, p0, v0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aget v1, p0, v0

    .line 15
    .line 16
    aget v2, p1, v0

    .line 17
    .line 18
    add-float/2addr v1, v2

    .line 19
    aput v1, p0, v0

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    aget v1, p0, v0

    .line 23
    .line 24
    aget p1, p1, v0

    .line 25
    .line 26
    add-float/2addr v1, p1

    .line 27
    aput v1, p0, v0

    .line 28
    .line 29
    return-void
.end method

.method public crossProduct(Lcom/momo/xeengine/sensor/Vector3f;Lcom/momo/xeengine/sensor/Vector3f;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    aget v2, v0, v1

    .line 5
    .line 6
    iget-object v3, p1, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 7
    .line 8
    const/4 v4, 0x2

    .line 9
    aget v5, v3, v4

    .line 10
    .line 11
    mul-float/2addr v2, v5

    .line 12
    aget v0, v0, v4

    .line 13
    .line 14
    aget v3, v3, v1

    .line 15
    .line 16
    mul-float/2addr v0, v3

    .line 17
    sub-float/2addr v2, v0

    .line 18
    invoke-virtual {p2, v2}, Lcom/momo/xeengine/sensor/Vector3f;->setX(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 22
    .line 23
    aget v2, v0, v4

    .line 24
    .line 25
    iget-object v3, p1, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    aget v6, v3, v5

    .line 29
    .line 30
    mul-float/2addr v2, v6

    .line 31
    aget v0, v0, v5

    .line 32
    .line 33
    aget v3, v3, v4

    .line 34
    .line 35
    mul-float/2addr v0, v3

    .line 36
    sub-float/2addr v2, v0

    .line 37
    invoke-virtual {p2, v2}, Lcom/momo/xeengine/sensor/Vector3f;->setY(F)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 41
    .line 42
    aget v0, p0, v5

    .line 43
    .line 44
    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 45
    .line 46
    aget v2, p1, v1

    .line 47
    .line 48
    mul-float/2addr v0, v2

    .line 49
    aget p0, p0, v1

    .line 50
    .line 51
    aget p1, p1, v5

    .line 52
    .line 53
    mul-float/2addr p0, p1

    .line 54
    sub-float/2addr v0, p0

    .line 55
    invoke-virtual {p2, v0}, Lcom/momo/xeengine/sensor/Vector3f;->setZ(F)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public dotProduct(Lcom/momo/xeengine/sensor/Vector3f;)F
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 7
    .line 8
    aget v0, p1, v0

    .line 9
    .line 10
    mul-float/2addr v1, v0

    .line 11
    const/4 v0, 0x1

    .line 12
    aget v2, p0, v0

    .line 13
    .line 14
    aget v0, p1, v0

    .line 15
    .line 16
    mul-float/2addr v2, v0

    .line 17
    add-float/2addr v1, v2

    .line 18
    const/4 v0, 0x2

    .line 19
    aget p0, p0, v0

    .line 20
    .line 21
    aget p1, p1, v0

    .line 22
    .line 23
    mul-float/2addr p0, p1

    .line 24
    add-float/2addr v1, p0

    .line 25
    return v1
.end method

.method public getLength()F
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v0, p0, v0

    .line 5
    .line 6
    mul-float/2addr v0, v0

    .line 7
    const/4 v1, 0x1

    .line 8
    aget v1, p0, v1

    .line 9
    .line 10
    mul-float/2addr v1, v1

    .line 11
    add-float/2addr v0, v1

    .line 12
    const/4 v1, 0x2

    .line 13
    aget p0, p0, v1

    .line 14
    .line 15
    mul-float/2addr p0, p0

    .line 16
    add-float/2addr v0, p0

    .line 17
    float-to-double v0, v0

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    double-to-float p0, v0

    .line 23
    return p0
.end method

.method public getX()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public getY()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public getZ()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public multiplyByScalar(F)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    mul-float/2addr v1, p1

    .line 7
    aput v1, p0, v0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aget v1, p0, v0

    .line 11
    .line 12
    mul-float/2addr v1, p1

    .line 13
    aput v1, p0, v0

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    aget v1, p0, v0

    .line 17
    .line 18
    mul-float/2addr v1, p1

    .line 19
    aput v1, p0, v0

    .line 20
    .line 21
    return-void
.end method

.method public normalize()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v2, v0, v1

    .line 5
    .line 6
    mul-float/2addr v2, v2

    .line 7
    const/4 v3, 0x1

    .line 8
    aget v4, v0, v3

    .line 9
    .line 10
    mul-float/2addr v4, v4

    .line 11
    add-float/2addr v2, v4

    .line 12
    const/4 v4, 0x2

    .line 13
    aget v0, v0, v4

    .line 14
    .line 15
    mul-float/2addr v0, v0

    .line 16
    add-float/2addr v2, v0

    .line 17
    float-to-double v5, v2

    .line 18
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    .line 19
    .line 20
    .line 21
    move-result-wide v5

    .line 22
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 23
    .line 24
    aget v0, p0, v1

    .line 25
    .line 26
    float-to-double v7, v0

    .line 27
    div-double/2addr v7, v5

    .line 28
    double-to-float v0, v7

    .line 29
    aput v0, p0, v1

    .line 30
    .line 31
    aget v0, p0, v3

    .line 32
    .line 33
    float-to-double v0, v0

    .line 34
    div-double/2addr v0, v5

    .line 35
    double-to-float v0, v0

    .line 36
    aput v0, p0, v3

    .line 37
    .line 38
    aget v0, p0, v4

    .line 39
    .line 40
    float-to-double v0, v0

    .line 41
    div-double/2addr v0, v5

    .line 42
    double-to-float v0, v0

    .line 43
    aput v0, p0, v4

    .line 44
    .line 45
    return-void
.end method

.method public set(Lcom/momo/xeengine/sensor/Vector3f;)V
    .locals 0

    .line 9
    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    invoke-virtual {p0, p1}, Lcom/momo/xeengine/sensor/Vector3f;->set([F)V

    return-void
.end method

.method public set([F)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {p1, v1, p0, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setX(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public setXYZ(FFF)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    aput p2, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    aput p3, p0, p1

    .line 11
    .line 12
    return-void
.end method

.method public setY(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public setZ(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public subtract(Lcom/momo/xeengine/sensor/Vector3f;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 7
    .line 8
    aget v2, p1, v0

    .line 9
    .line 10
    sub-float/2addr v1, v2

    .line 11
    aput v1, p0, v0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aget v1, p0, v0

    .line 15
    .line 16
    aget v2, p1, v0

    .line 17
    .line 18
    sub-float/2addr v1, v2

    .line 19
    aput v1, p0, v0

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    aget v1, p0, v0

    .line 23
    .line 24
    aget p1, p1, v0

    .line 25
    .line 26
    sub-float/2addr v1, p1

    .line 27
    aput v1, p0, v0

    .line 28
    .line 29
    return-void
.end method

.method public toArray()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "X:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    aget v1, v1, v2

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " Y:"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    aget v1, v1, v2

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, " Z:"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 35
    .line 36
    const/4 v1, 0x2

    .line 37
    aget p0, p0, v1

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

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

.method public x()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public x(F)V
    .locals 1

    .line 7
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    const/4 v0, 0x0

    aput p1, p0, v0

    return-void
.end method

.method public y()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public y(F)V
    .locals 1

    .line 7
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    const/4 v0, 0x1

    aput p1, p0, v0

    return-void
.end method

.method public z()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public z(F)V
    .locals 1

    .line 7
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector3f;->points:[F

    const/4 v0, 0x2

    aput p1, p0, v0

    return-void
.end method
