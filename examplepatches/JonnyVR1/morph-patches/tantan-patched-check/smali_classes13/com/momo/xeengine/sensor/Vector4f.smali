.class public Lcom/momo/xeengine/sensor/Vector4f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected points:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 44
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    const/4 p0, 0x0

    const/4 v1, 0x0

    .line 45
    aput v1, v0, p0

    const/4 p0, 0x1

    .line 46
    aput v1, v0, p0

    const/4 p0, 0x2

    .line 47
    aput v1, v0, p0

    const/4 p0, 0x3

    .line 48
    aput v1, v0, p0

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(FFFF)V
    .locals 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 50
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    const/4 p0, 0x0

    .line 51
    aput p1, v0, p0

    const/4 p0, 0x1

    .line 52
    aput p2, v0, p0

    const/4 p0, 0x2

    .line 53
    aput p3, v0, p0

    const/4 p0, 0x3

    .line 54
    aput p4, v0, p0

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Lcom/momo/xeengine/sensor/Vector3f;F)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector3f;->x()F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    aput v2, v0, v1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector3f;->y()F

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    aput v2, v0, v1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector3f;->z()F

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    aput p1, v0, v1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 38
    .line 39
    const/4 p1, 0x3

    .line 40
    aput p2, p0, p1

    .line 41
    .line 42
    return-void

    .line 43
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public add(Lcom/momo/xeengine/sensor/Vector3f;F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v2, v0, v1

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector3f;->x()F

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    add-float/2addr v2, v3

    .line 11
    aput v2, v0, v1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    aget v2, v0, v1

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector3f;->y()F

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    add-float/2addr v2, v3

    .line 23
    aput v2, v0, v1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    aget v2, v0, v1

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector3f;->z()F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    add-float/2addr v2, p1

    .line 35
    aput v2, v0, v1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 38
    .line 39
    const/4 p1, 0x3

    .line 40
    aget v0, p0, p1

    .line 41
    .line 42
    add-float/2addr v0, p2

    .line 43
    aput v0, p0, p1

    .line 44
    .line 45
    return-void
.end method

.method public add(Lcom/momo/xeengine/sensor/Vector4f;)V
    .locals 3

    .line 46
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    const/4 v0, 0x0

    aget v1, p0, v0

    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    aget v2, p1, v0

    add-float/2addr v1, v2

    aput v1, p0, v0

    const/4 v0, 0x1

    .line 47
    aget v1, p0, v0

    aget v2, p1, v0

    add-float/2addr v1, v2

    aput v1, p0, v0

    const/4 v0, 0x2

    .line 48
    aget v1, p0, v0

    aget v2, p1, v0

    add-float/2addr v1, v2

    aput v1, p0, v0

    const/4 v0, 0x3

    .line 49
    aget v1, p0, v0

    aget p1, p1, v0

    add-float/2addr v1, p1

    aput v1, p0, v0

    return-void
.end method

.method public array()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public compareTo(Lcom/momo/xeengine/sensor/Vector4f;)Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 7
    .line 8
    aget v2, p1, v0

    .line 9
    .line 10
    cmpl-float v1, v1, v2

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    aget v2, p0, v1

    .line 16
    .line 17
    aget v3, p1, v1

    .line 18
    .line 19
    cmpl-float v2, v2, v3

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    aget v3, p0, v2

    .line 25
    .line 26
    aget v2, p1, v2

    .line 27
    .line 28
    cmpl-float v2, v3, v2

    .line 29
    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    const/4 v2, 0x3

    .line 33
    aget p0, p0, v2

    .line 34
    .line 35
    aget p1, p1, v2

    .line 36
    .line 37
    cmpl-float p0, p0, p1

    .line 38
    .line 39
    if-nez p0, :cond_0

    .line 40
    .line 41
    return v1

    .line 42
    :cond_0
    return v0
.end method

.method public copyFromV3f(Lcom/momo/xeengine/sensor/Vector3f;F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector3f;->x()F

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    aput v2, v0, v1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector3f;->y()F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    aput v2, v0, v1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    invoke-virtual {p1}, Lcom/momo/xeengine/sensor/Vector3f;->z()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    aput p1, v0, v1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 29
    .line 30
    const/4 p1, 0x3

    .line 31
    aput p2, p0, p1

    .line 32
    .line 33
    return-void
.end method

.method public copyVec4(Lcom/momo/xeengine/sensor/Vector4f;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    aget v1, p1, v0

    .line 7
    .line 8
    aput v1, p0, v0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    aget v1, p1, v0

    .line 12
    .line 13
    aput v1, p0, v0

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    aget v1, p1, v0

    .line 17
    .line 18
    aput v1, p0, v0

    .line 19
    .line 20
    const/4 v0, 0x3

    .line 21
    aget p1, p1, v0

    .line 22
    .line 23
    aput p1, p0, v0

    .line 24
    .line 25
    return-void
.end method

.method public dotProduct(Lcom/momo/xeengine/sensor/Vector4f;)F
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    aget v2, p0, v0

    .line 20
    .line 21
    aget v0, p1, v0

    .line 22
    .line 23
    mul-float/2addr v2, v0

    .line 24
    add-float/2addr v1, v2

    .line 25
    const/4 v0, 0x3

    .line 26
    aget p0, p0, v0

    .line 27
    .line 28
    aget p1, p1, v0

    .line 29
    .line 30
    mul-float/2addr p0, p1

    .line 31
    add-float/2addr v1, p0

    .line 32
    return v1
.end method

.method public getW()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public getX()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public lerp(Lcom/momo/xeengine/sensor/Vector4f;Lcom/momo/xeengine/sensor/Vector4f;F)V
    .locals 4

    .line 1
    iget-object p2, p2, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    aget v1, p0, v0

    .line 7
    .line 8
    const/high16 v2, 0x3f800000    # 1.0f

    .line 9
    .line 10
    mul-float/2addr v2, p3

    .line 11
    mul-float/2addr v1, v2

    .line 12
    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 13
    .line 14
    aget v3, p1, v0

    .line 15
    .line 16
    mul-float/2addr v3, p3

    .line 17
    add-float/2addr v1, v3

    .line 18
    aput v1, p2, v0

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    aget v1, p0, v0

    .line 22
    .line 23
    mul-float/2addr v1, v2

    .line 24
    aget v3, p1, v0

    .line 25
    .line 26
    mul-float/2addr v3, p3

    .line 27
    add-float/2addr v1, v3

    .line 28
    aput v1, p2, v0

    .line 29
    .line 30
    const/4 v0, 0x2

    .line 31
    aget v1, p0, v0

    .line 32
    .line 33
    mul-float/2addr v1, v2

    .line 34
    aget v3, p1, v0

    .line 35
    .line 36
    mul-float/2addr v3, p3

    .line 37
    add-float/2addr v1, v3

    .line 38
    aput v1, p2, v0

    .line 39
    .line 40
    const/4 v0, 0x3

    .line 41
    aget p0, p0, v0

    .line 42
    .line 43
    mul-float/2addr p0, v2

    .line 44
    aget p1, p1, v0

    .line 45
    .line 46
    mul-float/2addr p1, p3

    .line 47
    add-float/2addr p0, p1

    .line 48
    aput p0, p2, v0

    .line 49
    .line 50
    return-void
.end method

.method public multiplyByScalar(F)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    const/4 v0, 0x3

    .line 22
    aget v1, p0, v0

    .line 23
    .line 24
    mul-float/2addr v1, p1

    .line 25
    aput v1, p0, v0

    .line 26
    .line 27
    return-void
.end method

.method public normalize()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    aget v1, v0, v1

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    cmpl-float v2, v1, v2

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v2, 0x0

    .line 13
    aget v3, v0, v2

    .line 14
    .line 15
    div-float/2addr v3, v1

    .line 16
    aput v3, v0, v2

    .line 17
    .line 18
    const/4 v4, 0x1

    .line 19
    aget v5, v0, v4

    .line 20
    .line 21
    div-float/2addr v5, v1

    .line 22
    aput v5, v0, v4

    .line 23
    .line 24
    const/4 v6, 0x2

    .line 25
    aget v7, v0, v6

    .line 26
    .line 27
    div-float/2addr v7, v1

    .line 28
    aput v7, v0, v6

    .line 29
    .line 30
    mul-float/2addr v3, v3

    .line 31
    mul-float/2addr v5, v5

    .line 32
    add-float/2addr v3, v5

    .line 33
    mul-float/2addr v7, v7

    .line 34
    add-float/2addr v3, v7

    .line 35
    float-to-double v0, v3

    .line 36
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 41
    .line 42
    aget v3, p0, v2

    .line 43
    .line 44
    float-to-double v7, v3

    .line 45
    div-double/2addr v7, v0

    .line 46
    double-to-float v3, v7

    .line 47
    aput v3, p0, v2

    .line 48
    .line 49
    aget v2, p0, v4

    .line 50
    .line 51
    float-to-double v2, v2

    .line 52
    div-double/2addr v2, v0

    .line 53
    double-to-float v2, v2

    .line 54
    aput v2, p0, v4

    .line 55
    .line 56
    aget v2, p0, v6

    .line 57
    .line 58
    float-to-double v2, v2

    .line 59
    div-double/2addr v2, v0

    .line 60
    double-to-float v0, v2

    .line 61
    aput v0, p0, v6

    .line 62
    .line 63
    return-void
.end method

.method public setW(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public setX(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public setXYZW(FFFF)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    const/4 p1, 0x3

    .line 13
    aput p4, p0, p1

    .line 14
    .line 15
    return-void
.end method

.method public setY(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    return-void
.end method

.method public subdivide(Lcom/momo/xeengine/sensor/Vector4f;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 7
    .line 8
    aget v2, p1, v0

    .line 9
    .line 10
    div-float/2addr v1, v2

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
    div-float/2addr v1, v2

    .line 19
    aput v1, p0, v0

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    aget v1, p0, v0

    .line 23
    .line 24
    aget v2, p1, v0

    .line 25
    .line 26
    div-float/2addr v1, v2

    .line 27
    aput v1, p0, v0

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    aget v1, p0, v0

    .line 31
    .line 32
    aget p1, p1, v0

    .line 33
    .line 34
    div-float/2addr v1, p1

    .line 35
    aput v1, p0, v0

    .line 36
    .line 37
    return-void
.end method

.method public subtract(Lcom/momo/xeengine/sensor/Vector4f;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    aget v2, p1, v0

    .line 25
    .line 26
    sub-float/2addr v1, v2

    .line 27
    aput v1, p0, v0

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    aget v1, p0, v0

    .line 31
    .line 32
    aget p1, p1, v0

    .line 33
    .line 34
    sub-float/2addr v1, p1

    .line 35
    aput v1, p0, v0

    .line 36
    .line 37
    return-void
.end method

.method public subtract(Lcom/momo/xeengine/sensor/Vector4f;Lcom/momo/xeengine/sensor/Vector4f;)V
    .locals 4

    .line 38
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    const/4 v0, 0x0

    aget v1, p0, v0

    iget-object p1, p1, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    aget v0, p1, v0

    sub-float/2addr v1, v0

    const/4 v0, 0x1

    aget v2, p0, v0

    aget v0, p1, v0

    sub-float/2addr v2, v0

    const/4 v0, 0x2

    aget v3, p0, v0

    aget v0, p1, v0

    sub-float/2addr v3, v0

    const/4 v0, 0x3

    aget p0, p0, v0

    aget p1, p1, v0

    sub-float/2addr p0, p1

    invoke-virtual {p2, v1, v2, v3, p0}, Lcom/momo/xeengine/sensor/Vector4f;->setXYZW(FFFF)V

    return-void
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
    iget-object v1, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    iget-object v1, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    iget-object v1, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 35
    .line 36
    const/4 v2, 0x2

    .line 37
    aget v1, v1, v2

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, " W:"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 48
    .line 49
    const/4 v1, 0x3

    .line 50
    aget p0, p0, v1

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public w()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    return p0
.end method

.method public w(F)V
    .locals 1

    .line 7
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    const/4 v0, 0x3

    aput p1, p0, v0

    return-void
.end method

.method public x()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    const/4 v0, 0x0

    aput p1, p0, v0

    return-void
.end method

.method public y()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    const/4 v0, 0x1

    aput p1, p0, v0

    return-void
.end method

.method public z()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

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
    iget-object p0, p0, Lcom/momo/xeengine/sensor/Vector4f;->points:[F

    const/4 v0, 0x2

    aput p1, p0, v0

    return-void
.end method
