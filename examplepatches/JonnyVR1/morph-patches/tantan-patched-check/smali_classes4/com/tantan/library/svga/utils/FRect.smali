.class public final Lcom/tantan/library/svga/utils/FRect;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0014\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0008\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0007J\t\u0010\u0012\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0013\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0014\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0015\u001a\u00020\u0003H\u00c6\u0003J1\u0010\u0016\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0003H\u00c6\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u001a\u001a\u00020\u001bH\u00d6\u0001J\t\u0010\u001c\u001a\u00020\u001dH\u00d6\u0001J\u0019\u0010\u001e\u001a\u00020\u001f2\n\u0008\u0002\u0010 \u001a\u0004\u0018\u00010!H\u0000\u00a2\u0006\u0002\u0008\"R\u001a\u0010\u0006\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0008\u0010\t\"\u0004\u0008\n\u0010\u000bR\u001a\u0010\u0005\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000c\u0010\t\"\u0004\u0008\r\u0010\u000bR\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\t\"\u0004\u0008\u000f\u0010\u000bR\u001a\u0010\u0004\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\t\"\u0004\u0008\u0011\u0010\u000b\u00a8\u0006#"
    }
    d2 = {
        "Lcom/tantan/library/svga/utils/FRect;",
        "",
        "x",
        "",
        "y",
        "width",
        "height",
        "(FFFF)V",
        "getHeight",
        "()F",
        "setHeight",
        "(F)V",
        "getWidth",
        "setWidth",
        "getX",
        "setX",
        "getY",
        "setY",
        "component1",
        "component2",
        "component3",
        "component4",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
        "",
        "transform",
        "",
        "from",
        "Lcom/tantan/library/svga/compose/proto/Layout;",
        "transform$svga_lib_release",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private height:F

.field private width:F

.field private x:F

.field private y:F


# direct methods
.method public constructor <init>(FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/tantan/library/svga/utils/FRect;->x:F

    .line 5
    .line 6
    iput p2, p0, Lcom/tantan/library/svga/utils/FRect;->y:F

    .line 7
    .line 8
    iput p3, p0, Lcom/tantan/library/svga/utils/FRect;->width:F

    .line 9
    .line 10
    iput p4, p0, Lcom/tantan/library/svga/utils/FRect;->height:F

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic copy$default(Lcom/tantan/library/svga/utils/FRect;FFFFILjava/lang/Object;)Lcom/tantan/library/svga/utils/FRect;
    .locals 0

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    iget p1, p0, Lcom/tantan/library/svga/utils/FRect;->x:F

    :cond_0
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_1

    iget p2, p0, Lcom/tantan/library/svga/utils/FRect;->y:F

    :cond_1
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_2

    iget p3, p0, Lcom/tantan/library/svga/utils/FRect;->width:F

    :cond_2
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_3

    iget p4, p0, Lcom/tantan/library/svga/utils/FRect;->height:F

    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/tantan/library/svga/utils/FRect;->copy(FFFF)Lcom/tantan/library/svga/utils/FRect;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic transform$svga_lib_release$default(Lcom/tantan/library/svga/utils/FRect;Lcom/tantan/library/svga/compose/proto/Layout;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/utils/FRect;->transform$svga_lib_release(Lcom/tantan/library/svga/compose/proto/Layout;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final component1()F
    .locals 0

    iget p0, p0, Lcom/tantan/library/svga/utils/FRect;->x:F

    return p0
.end method

.method public final component2()F
    .locals 0

    iget p0, p0, Lcom/tantan/library/svga/utils/FRect;->y:F

    return p0
.end method

.method public final component3()F
    .locals 0

    iget p0, p0, Lcom/tantan/library/svga/utils/FRect;->width:F

    return p0
.end method

.method public final component4()F
    .locals 0

    iget p0, p0, Lcom/tantan/library/svga/utils/FRect;->height:F

    return p0
.end method

.method public final copy(FFFF)Lcom/tantan/library/svga/utils/FRect;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance p0, Lcom/tantan/library/svga/utils/FRect;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/tantan/library/svga/utils/FRect;-><init>(FFFF)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/tantan/library/svga/utils/FRect;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/tantan/library/svga/utils/FRect;

    iget v1, p0, Lcom/tantan/library/svga/utils/FRect;->x:F

    iget v3, p1, Lcom/tantan/library/svga/utils/FRect;->x:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_2

    return v2

    :cond_2
    iget v1, p0, Lcom/tantan/library/svga/utils/FRect;->y:F

    iget v3, p1, Lcom/tantan/library/svga/utils/FRect;->y:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_3

    return v2

    :cond_3
    iget v1, p0, Lcom/tantan/library/svga/utils/FRect;->width:F

    iget v3, p1, Lcom/tantan/library/svga/utils/FRect;->width:F

    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-eqz v1, :cond_4

    return v2

    :cond_4
    iget p0, p0, Lcom/tantan/library/svga/utils/FRect;->height:F

    iget p1, p1, Lcom/tantan/library/svga/utils/FRect;->height:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-eqz p0, :cond_5

    return v2

    :cond_5
    return v0
.end method

.method public final getHeight()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/utils/FRect;->height:F

    .line 2
    .line 3
    return p0
.end method

.method public final getWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/utils/FRect;->width:F

    .line 2
    .line 3
    return p0
.end method

.method public final getX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/utils/FRect;->x:F

    .line 2
    .line 3
    return p0
.end method

.method public final getY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/utils/FRect;->y:F

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/tantan/library/svga/utils/FRect;->x:F

    invoke-static {v0}, Ljava/lang/Float;->hashCode(F)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/tantan/library/svga/utils/FRect;->y:F

    invoke-static {v1}, Ljava/lang/Float;->hashCode(F)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/tantan/library/svga/utils/FRect;->width:F

    invoke-static {v1}, Ljava/lang/Float;->hashCode(F)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lcom/tantan/library/svga/utils/FRect;->height:F

    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public final setHeight(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/utils/FRect;->height:F

    .line 2
    .line 3
    return-void
.end method

.method public final setWidth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/utils/FRect;->width:F

    .line 2
    .line 3
    return-void
.end method

.method public final setX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/utils/FRect;->x:F

    .line 2
    .line 3
    return-void
.end method

.method public final setY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/utils/FRect;->y:F

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FRect(x="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/tantan/library/svga/utils/FRect;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", y="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/tantan/library/svga/utils/FRect;->y:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/tantan/library/svga/utils/FRect;->width:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/tantan/library/svga/utils/FRect;->height:F

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final transform$svga_lib_release(Lcom/tantan/library/svga/compose/proto/Layout;)V
    .locals 4
    .param p1    # Lcom/tantan/library/svga/compose/proto/Layout;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/Layout;->x:Ljava/lang/Float;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v1, v0

    .line 14
    :goto_0
    const/4 v2, 0x0

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object v3, p1, Lcom/tantan/library/svga/compose/proto/Layout;->y:Ljava/lang/Float;

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    move-object v3, v2

    .line 21
    :goto_1
    if-nez v3, :cond_2

    .line 22
    .line 23
    move v3, v0

    .line 24
    goto :goto_2

    .line 25
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    :goto_2
    add-float/2addr v1, v3

    .line 30
    if-eqz p1, :cond_3

    .line 31
    .line 32
    iget-object v3, p1, Lcom/tantan/library/svga/compose/proto/Layout;->width:Ljava/lang/Float;

    .line 33
    .line 34
    goto :goto_3

    .line 35
    :cond_3
    move-object v3, v2

    .line 36
    :goto_3
    if-nez v3, :cond_4

    .line 37
    .line 38
    move v3, v0

    .line 39
    goto :goto_4

    .line 40
    :cond_4
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    :goto_4
    add-float/2addr v1, v3

    .line 45
    if-eqz p1, :cond_5

    .line 46
    .line 47
    iget-object v3, p1, Lcom/tantan/library/svga/compose/proto/Layout;->height:Ljava/lang/Float;

    .line 48
    .line 49
    goto :goto_5

    .line 50
    :cond_5
    move-object v3, v2

    .line 51
    :goto_5
    if-nez v3, :cond_6

    .line 52
    .line 53
    move v3, v0

    .line 54
    goto :goto_6

    .line 55
    :cond_6
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    :goto_6
    add-float/2addr v1, v3

    .line 60
    cmpg-float v1, v1, v0

    .line 61
    .line 62
    const/high16 v3, 0x3f800000    # 1.0f

    .line 63
    .line 64
    if-gtz v1, :cond_7

    .line 65
    .line 66
    iput v0, p0, Lcom/tantan/library/svga/utils/FRect;->x:F

    .line 67
    .line 68
    iput v0, p0, Lcom/tantan/library/svga/utils/FRect;->y:F

    .line 69
    .line 70
    iput v3, p0, Lcom/tantan/library/svga/utils/FRect;->width:F

    .line 71
    .line 72
    iput v3, p0, Lcom/tantan/library/svga/utils/FRect;->height:F

    .line 73
    .line 74
    return-void

    .line 75
    :cond_7
    if-eqz p1, :cond_8

    .line 76
    .line 77
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/Layout;->x:Ljava/lang/Float;

    .line 78
    .line 79
    goto :goto_7

    .line 80
    :cond_8
    move-object v1, v2

    .line 81
    :goto_7
    if-nez v1, :cond_9

    .line 82
    .line 83
    move v1, v0

    .line 84
    goto :goto_8

    .line 85
    :cond_9
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    :goto_8
    iput v1, p0, Lcom/tantan/library/svga/utils/FRect;->x:F

    .line 90
    .line 91
    if-eqz p1, :cond_a

    .line 92
    .line 93
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/Layout;->y:Ljava/lang/Float;

    .line 94
    .line 95
    goto :goto_9

    .line 96
    :cond_a
    move-object v1, v2

    .line 97
    :goto_9
    if-nez v1, :cond_b

    .line 98
    .line 99
    goto :goto_a

    .line 100
    :cond_b
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    :goto_a
    iput v0, p0, Lcom/tantan/library/svga/utils/FRect;->y:F

    .line 105
    .line 106
    if-eqz p1, :cond_c

    .line 107
    .line 108
    iget-object v0, p1, Lcom/tantan/library/svga/compose/proto/Layout;->width:Ljava/lang/Float;

    .line 109
    .line 110
    goto :goto_b

    .line 111
    :cond_c
    move-object v0, v2

    .line 112
    :goto_b
    if-nez v0, :cond_d

    .line 113
    .line 114
    move v0, v3

    .line 115
    goto :goto_c

    .line 116
    :cond_d
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    :goto_c
    iput v0, p0, Lcom/tantan/library/svga/utils/FRect;->width:F

    .line 121
    .line 122
    if-eqz p1, :cond_e

    .line 123
    .line 124
    iget-object v2, p1, Lcom/tantan/library/svga/compose/proto/Layout;->height:Ljava/lang/Float;

    .line 125
    .line 126
    :cond_e
    if-nez v2, :cond_f

    .line 127
    .line 128
    goto :goto_d

    .line 129
    :cond_f
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    :goto_d
    iput v3, p0, Lcom/tantan/library/svga/utils/FRect;->height:F

    .line 134
    .line 135
    return-void
.end method
