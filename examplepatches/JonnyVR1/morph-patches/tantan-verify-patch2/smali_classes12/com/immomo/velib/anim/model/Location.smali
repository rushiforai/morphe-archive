.class public Lcom/immomo/velib/anim/model/Location;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private anchor:Ljava/lang/String;

.field private wh:F

.field private width:F

.field private x:F

.field private y:F


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
    if-eqz p1, :cond_2

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
    check-cast p1, Lcom/immomo/velib/anim/model/Location;

    .line 20
    .line 21
    iget v2, p1, Lcom/immomo/velib/anim/model/Location;->x:F

    .line 22
    .line 23
    iget v3, p0, Lcom/immomo/velib/anim/model/Location;->x:F

    .line 24
    .line 25
    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_2

    .line 30
    .line 31
    iget v2, p1, Lcom/immomo/velib/anim/model/Location;->y:F

    .line 32
    .line 33
    iget v3, p0, Lcom/immomo/velib/anim/model/Location;->y:F

    .line 34
    .line 35
    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_2

    .line 40
    .line 41
    iget v2, p1, Lcom/immomo/velib/anim/model/Location;->width:F

    .line 42
    .line 43
    iget v3, p0, Lcom/immomo/velib/anim/model/Location;->width:F

    .line 44
    .line 45
    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-nez v2, :cond_2

    .line 50
    .line 51
    iget v2, p1, Lcom/immomo/velib/anim/model/Location;->wh:F

    .line 52
    .line 53
    iget v3, p0, Lcom/immomo/velib/anim/model/Location;->wh:F

    .line 54
    .line 55
    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_2

    .line 60
    .line 61
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Location;->anchor:Ljava/lang/String;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/immomo/velib/anim/model/Location;->anchor:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_2

    .line 70
    .line 71
    return v0

    .line 72
    :cond_2
    :goto_0
    return v1
.end method

.method public getAnchor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/Location;->anchor:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWh()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/Location;->wh:F

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/Location;->width:F

    .line 2
    .line 3
    return p0
.end method

.method public getX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/Location;->x:F

    .line 2
    .line 3
    return p0
.end method

.method public getY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/Location;->y:F

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/anim/model/Location;->anchor:Ljava/lang/String;

    .line 2
    .line 3
    iget v1, p0, Lcom/immomo/velib/anim/model/Location;->x:F

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget v2, p0, Lcom/immomo/velib/anim/model/Location;->y:F

    .line 10
    .line 11
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget v3, p0, Lcom/immomo/velib/anim/model/Location;->width:F

    .line 16
    .line 17
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget p0, p0, Lcom/immomo/velib/anim/model/Location;->wh:F

    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {v0, v1, v2, v3, p0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public setAnchor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/Location;->anchor:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setWh(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/Location;->wh:F

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/Location;->width:F

    .line 2
    .line 3
    return-void
.end method

.method public setX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/Location;->x:F

    .line 2
    .line 3
    return-void
.end method

.method public setY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/Location;->y:F

    .line 2
    .line 3
    return-void
.end method
