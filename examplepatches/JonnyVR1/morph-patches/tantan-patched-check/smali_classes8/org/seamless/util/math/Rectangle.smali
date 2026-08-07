.class public Lorg/seamless/util/math/Rectangle;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private height:I

.field private position:Lorg/seamless/util/math/Point;

.field private width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/seamless/util/math/Point;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/seamless/util/math/Rectangle;->position:Lorg/seamless/util/math/Point;

    .line 5
    .line 6
    iput p2, p0, Lorg/seamless/util/math/Rectangle;->width:I

    .line 7
    .line 8
    iput p3, p0, Lorg/seamless/util/math/Rectangle;->height:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/seamless/util/math/Rectangle;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getPosition()Lorg/seamless/util/math/Point;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/math/Rectangle;->position:Lorg/seamless/util/math/Point;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/seamless/util/math/Rectangle;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public intersection(Lorg/seamless/util/math/Rectangle;)Lorg/seamless/util/math/Rectangle;
    .locals 12

    .line 1
    iget-object v0, p0, Lorg/seamless/util/math/Rectangle;->position:Lorg/seamless/util/math/Point;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/seamless/util/math/Point;->getX()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lorg/seamless/util/math/Rectangle;->position:Lorg/seamless/util/math/Point;

    .line 8
    .line 9
    invoke-virtual {v1}, Lorg/seamless/util/math/Point;->getY()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p1, Lorg/seamless/util/math/Rectangle;->position:Lorg/seamless/util/math/Point;

    .line 14
    .line 15
    invoke-virtual {v2}, Lorg/seamless/util/math/Point;->getX()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    iget-object v3, p1, Lorg/seamless/util/math/Rectangle;->position:Lorg/seamless/util/math/Point;

    .line 20
    .line 21
    invoke-virtual {v3}, Lorg/seamless/util/math/Point;->getY()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    int-to-long v4, v0

    .line 26
    iget v6, p0, Lorg/seamless/util/math/Rectangle;->width:I

    .line 27
    .line 28
    int-to-long v6, v6

    .line 29
    add-long/2addr v4, v6

    .line 30
    int-to-long v6, v1

    .line 31
    iget p0, p0, Lorg/seamless/util/math/Rectangle;->height:I

    .line 32
    .line 33
    int-to-long v8, p0

    .line 34
    add-long/2addr v6, v8

    .line 35
    int-to-long v8, v2

    .line 36
    iget p0, p1, Lorg/seamless/util/math/Rectangle;->width:I

    .line 37
    .line 38
    int-to-long v10, p0

    .line 39
    add-long/2addr v8, v10

    .line 40
    int-to-long v10, v3

    .line 41
    iget p0, p1, Lorg/seamless/util/math/Rectangle;->height:I

    .line 42
    .line 43
    int-to-long p0, p0

    .line 44
    add-long/2addr v10, p0

    .line 45
    if-ge v0, v2, :cond_0

    .line 46
    .line 47
    move v0, v2

    .line 48
    :cond_0
    if-ge v1, v3, :cond_1

    .line 49
    .line 50
    move v1, v3

    .line 51
    :cond_1
    cmp-long p0, v4, v8

    .line 52
    .line 53
    if-lez p0, :cond_2

    .line 54
    .line 55
    move-wide v4, v8

    .line 56
    :cond_2
    cmp-long p0, v6, v10

    .line 57
    .line 58
    if-lez p0, :cond_3

    .line 59
    .line 60
    move-wide v6, v10

    .line 61
    :cond_3
    int-to-long p0, v0

    .line 62
    sub-long/2addr v4, p0

    .line 63
    int-to-long p0, v1

    .line 64
    sub-long/2addr v6, p0

    .line 65
    const-wide/32 p0, -0x80000000

    .line 66
    .line 67
    .line 68
    cmp-long v2, v4, p0

    .line 69
    .line 70
    if-gez v2, :cond_4

    .line 71
    .line 72
    move-wide v4, p0

    .line 73
    :cond_4
    cmp-long v2, v6, p0

    .line 74
    .line 75
    if-gez v2, :cond_5

    .line 76
    .line 77
    move-wide v6, p0

    .line 78
    :cond_5
    new-instance p0, Lorg/seamless/util/math/Rectangle;

    .line 79
    .line 80
    new-instance p1, Lorg/seamless/util/math/Point;

    .line 81
    .line 82
    invoke-direct {p1, v0, v1}, Lorg/seamless/util/math/Point;-><init>(II)V

    .line 83
    .line 84
    .line 85
    long-to-int v0, v4

    .line 86
    long-to-int v1, v6

    .line 87
    invoke-direct {p0, p1, v0, v1}, Lorg/seamless/util/math/Rectangle;-><init>(Lorg/seamless/util/math/Point;II)V

    .line 88
    .line 89
    .line 90
    return-object p0
.end method

.method public isOverlapping(Lorg/seamless/util/math/Rectangle;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/seamless/util/math/Rectangle;->intersection(Lorg/seamless/util/math/Rectangle;)Lorg/seamless/util/math/Rectangle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lorg/seamless/util/math/Rectangle;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-lez p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/seamless/util/math/Rectangle;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-lez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public reset()V
    .locals 2

    .line 1
    new-instance v0, Lorg/seamless/util/math/Point;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, v1}, Lorg/seamless/util/math/Point;-><init>(II)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lorg/seamless/util/math/Rectangle;->position:Lorg/seamless/util/math/Point;

    .line 8
    .line 9
    iput v1, p0, Lorg/seamless/util/math/Rectangle;->width:I

    .line 10
    .line 11
    iput v1, p0, Lorg/seamless/util/math/Rectangle;->height:I

    .line 12
    .line 13
    return-void
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/seamless/util/math/Rectangle;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setPosition(Lorg/seamless/util/math/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/util/math/Rectangle;->position:Lorg/seamless/util/math/Point;

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/seamless/util/math/Rectangle;->width:I

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
    const-string v1, "Rectangle("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lorg/seamless/util/math/Rectangle;->position:Lorg/seamless/util/math/Point;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " - "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lorg/seamless/util/math/Rectangle;->width:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "x"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget p0, p0, Lorg/seamless/util/math/Rectangle;->height:I

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, ")"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method
