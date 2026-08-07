.class public Ll/yi60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/TypeEvaluator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/animation/TypeEvaluator<",
        "Ll/dj60;",
        ">;"
    }
.end annotation


# instance fields
.field a:Ll/dj60;


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
.method public a(FLl/dj60;Ll/dj60;)Ll/dj60;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yi60;->a:Ll/dj60;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iput-object p2, p0, Ll/yi60;->a:Ll/dj60;

    .line 12
    .line 13
    :cond_1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    sub-float/2addr p0, p1

    .line 16
    iget v0, p3, Ll/dj60;->g:I

    .line 17
    .line 18
    const/4 v1, 0x3

    .line 19
    if-ne v0, v1, :cond_2

    .line 20
    .line 21
    iget v0, p2, Ll/dj60;->a:F

    .line 22
    .line 23
    mul-float/2addr v0, p0

    .line 24
    mul-float/2addr v0, p0

    .line 25
    mul-float/2addr v0, p0

    .line 26
    iget v1, p3, Ll/dj60;->c:F

    .line 27
    .line 28
    const/high16 v2, 0x40400000    # 3.0f

    .line 29
    .line 30
    mul-float/2addr v1, v2

    .line 31
    mul-float/2addr v1, p1

    .line 32
    mul-float/2addr v1, p0

    .line 33
    mul-float/2addr v1, p0

    .line 34
    add-float/2addr v0, v1

    .line 35
    iget v1, p3, Ll/dj60;->e:F

    .line 36
    .line 37
    mul-float/2addr v1, v2

    .line 38
    mul-float/2addr v1, p1

    .line 39
    mul-float/2addr v1, p1

    .line 40
    mul-float/2addr v1, p0

    .line 41
    add-float/2addr v0, v1

    .line 42
    iget v1, p3, Ll/dj60;->a:F

    .line 43
    .line 44
    mul-float/2addr v1, p1

    .line 45
    mul-float/2addr v1, p1

    .line 46
    mul-float/2addr v1, p1

    .line 47
    add-float/2addr v0, v1

    .line 48
    iget p2, p2, Ll/dj60;->b:F

    .line 49
    .line 50
    mul-float/2addr p2, p0

    .line 51
    mul-float/2addr p2, p0

    .line 52
    mul-float/2addr p2, p0

    .line 53
    iget v1, p3, Ll/dj60;->d:F

    .line 54
    .line 55
    mul-float/2addr v1, v2

    .line 56
    mul-float/2addr v1, p1

    .line 57
    mul-float/2addr v1, p0

    .line 58
    mul-float/2addr v1, p0

    .line 59
    add-float/2addr p2, v1

    .line 60
    iget v1, p3, Ll/dj60;->f:F

    .line 61
    .line 62
    mul-float/2addr v1, v2

    .line 63
    mul-float/2addr v1, p1

    .line 64
    mul-float/2addr v1, p1

    .line 65
    mul-float/2addr v1, p0

    .line 66
    add-float/2addr p2, v1

    .line 67
    iget p0, p3, Ll/dj60;->b:F

    .line 68
    .line 69
    mul-float/2addr p0, p1

    .line 70
    mul-float/2addr p0, p1

    .line 71
    mul-float/2addr p0, p1

    .line 72
    add-float/2addr p2, p0

    .line 73
    goto :goto_0

    .line 74
    :cond_2
    const/4 v1, 0x2

    .line 75
    if-ne v0, v1, :cond_3

    .line 76
    .line 77
    mul-float v0, p0, p0

    .line 78
    .line 79
    iget v1, p2, Ll/dj60;->a:F

    .line 80
    .line 81
    mul-float/2addr v1, v0

    .line 82
    const/high16 v2, 0x40000000    # 2.0f

    .line 83
    .line 84
    mul-float/2addr v2, p1

    .line 85
    mul-float/2addr v2, p0

    .line 86
    iget p0, p3, Ll/dj60;->c:F

    .line 87
    .line 88
    mul-float/2addr p0, v2

    .line 89
    add-float/2addr v1, p0

    .line 90
    mul-float/2addr p1, p1

    .line 91
    iget p0, p3, Ll/dj60;->a:F

    .line 92
    .line 93
    mul-float/2addr p0, p1

    .line 94
    add-float/2addr p0, v1

    .line 95
    iget p2, p2, Ll/dj60;->b:F

    .line 96
    .line 97
    mul-float/2addr v0, p2

    .line 98
    iget p2, p3, Ll/dj60;->d:F

    .line 99
    .line 100
    mul-float/2addr v2, p2

    .line 101
    add-float/2addr v0, v2

    .line 102
    iget p2, p3, Ll/dj60;->b:F

    .line 103
    .line 104
    mul-float/2addr p1, p2

    .line 105
    add-float p2, v0, p1

    .line 106
    .line 107
    move v0, p0

    .line 108
    goto :goto_0

    .line 109
    :cond_3
    const/4 p0, 0x1

    .line 110
    if-ne v0, p0, :cond_4

    .line 111
    .line 112
    iget p0, p2, Ll/dj60;->a:F

    .line 113
    .line 114
    iget v0, p3, Ll/dj60;->a:F

    .line 115
    .line 116
    sub-float/2addr v0, p0

    .line 117
    mul-float/2addr v0, p1

    .line 118
    add-float/2addr v0, p0

    .line 119
    iget p0, p2, Ll/dj60;->b:F

    .line 120
    .line 121
    iget p2, p3, Ll/dj60;->b:F

    .line 122
    .line 123
    sub-float/2addr p2, p0

    .line 124
    mul-float/2addr p1, p2

    .line 125
    add-float p2, p0, p1

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_4
    iget v0, p3, Ll/dj60;->a:F

    .line 129
    .line 130
    iget p2, p3, Ll/dj60;->b:F

    .line 131
    .line 132
    :goto_0
    invoke-static {v0, p2}, Ll/ej60;->d(FF)Ll/dj60;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    return-object p0
.end method

.method public bridge synthetic evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Ll/dj60;

    .line 2
    .line 3
    check-cast p3, Ll/dj60;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/yi60;->a(FLl/dj60;Ll/dj60;)Ll/dj60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
