.class public Lorg/seamless/util/math/Point;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private x:I

.field private y:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lorg/seamless/util/math/Point;->x:I

    .line 5
    .line 6
    iput p2, p0, Lorg/seamless/util/math/Point;->y:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public divide(D)Lorg/seamless/util/math/Point;
    .locals 5

    .line 1
    new-instance v0, Lorg/seamless/util/math/Point;

    .line 2
    .line 3
    iget v1, p0, Lorg/seamless/util/math/Point;->x:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    int-to-double v3, v1

    .line 9
    div-double/2addr v3, p1

    .line 10
    double-to-int v1, v3

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v1, v2

    .line 13
    :goto_0
    iget p0, p0, Lorg/seamless/util/math/Point;->y:I

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    int-to-double v2, p0

    .line 18
    div-double/2addr v2, p1

    .line 19
    double-to-int v2, v2

    .line 20
    :cond_1
    invoke-direct {v0, v1, v2}, Lorg/seamless/util/math/Point;-><init>(II)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_4

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lorg/seamless/util/math/Point;

    .line 20
    .line 21
    iget v2, p0, Lorg/seamless/util/math/Point;->x:I

    .line 22
    .line 23
    iget v3, p1, Lorg/seamless/util/math/Point;->x:I

    .line 24
    .line 25
    if-eq v2, v3, :cond_2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_2
    iget p0, p0, Lorg/seamless/util/math/Point;->y:I

    .line 29
    .line 30
    iget p1, p1, Lorg/seamless/util/math/Point;->y:I

    .line 31
    .line 32
    if-eq p0, p1, :cond_3

    .line 33
    .line 34
    return v1

    .line 35
    :cond_3
    return v0

    .line 36
    :cond_4
    :goto_0
    return v1
.end method

.method public getX()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/seamless/util/math/Point;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public getY()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/seamless/util/math/Point;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Lorg/seamless/util/math/Point;->x:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget p0, p0, Lorg/seamless/util/math/Point;->y:I

    .line 6
    .line 7
    add-int/2addr v0, p0

    .line 8
    return v0
.end method

.method public multiply(D)Lorg/seamless/util/math/Point;
    .locals 5

    .line 1
    new-instance v0, Lorg/seamless/util/math/Point;

    .line 2
    .line 3
    iget v1, p0, Lorg/seamless/util/math/Point;->x:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    int-to-double v3, v1

    .line 9
    mul-double/2addr v3, p1

    .line 10
    double-to-int v1, v3

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v1, v2

    .line 13
    :goto_0
    iget p0, p0, Lorg/seamless/util/math/Point;->y:I

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    int-to-double v2, p0

    .line 18
    mul-double/2addr v2, p1

    .line 19
    double-to-int v2, v2

    .line 20
    :cond_1
    invoke-direct {v0, v1, v2}, Lorg/seamless/util/math/Point;-><init>(II)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Point("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lorg/seamless/util/math/Point;->x:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "/"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lorg/seamless/util/math/Point;->y:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, ")"

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
