.class public abstract Ll/jgl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected a:Ll/mgl;

.field private b:Landroid/view/animation/Interpolator;

.field private c:I

.field protected d:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 16
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Ll/jgl;-><init>(Ll/mgl;Landroid/view/animation/Interpolator;)V

    return-void
.end method

.method public constructor <init>(Ll/mgl;Landroid/view/animation/Interpolator;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/jgl;->d:Ljava/util/LinkedHashMap;

    .line 10
    .line 11
    iput-object p1, p0, Ll/jgl;->a:Ll/mgl;

    .line 12
    .line 13
    iput-object p2, p0, Ll/jgl;->b:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(IF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jgl;->d:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p0, p1, p2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b(I)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jgl;->b:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/jgl;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public d(F)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/jgl;->a:Ll/mgl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object v1, p0, Ll/jgl;->d:Ljava/util/LinkedHashMap;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 15
    .line 16
    .line 17
    const/high16 v1, -0x40800000    # -1.0f

    .line 18
    .line 19
    const/4 v2, -0x1

    .line 20
    const/4 v3, 0x0

    .line 21
    move v5, v1

    .line 22
    move v4, v2

    .line 23
    :goto_0
    iget-object v6, p0, Ll/jgl;->d:Ljava/util/LinkedHashMap;

    .line 24
    .line 25
    invoke-virtual {v6}, Ljava/util/AbstractMap;->size()I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    if-ge v3, v6, :cond_3

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    check-cast v6, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    int-to-float v6, v6

    .line 42
    iget v7, p0, Ll/jgl;->c:I

    .line 43
    .line 44
    int-to-float v7, v7

    .line 45
    mul-float/2addr v7, p1

    .line 46
    cmpg-float v6, v6, v7

    .line 47
    .line 48
    if-gtz v6, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    iget-object v6, p0, Ll/jgl;->d:Ljava/util/LinkedHashMap;

    .line 61
    .line 62
    invoke-virtual {v6, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    check-cast v4, Ljava/lang/Float;

    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    move v8, v5

    .line 73
    move v5, v4

    .line 74
    move v4, v8

    .line 75
    :cond_1
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    check-cast v6, Ljava/lang/Integer;

    .line 80
    .line 81
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    int-to-float v6, v6

    .line 86
    iget v7, p0, Ll/jgl;->c:I

    .line 87
    .line 88
    int-to-float v7, v7

    .line 89
    mul-float/2addr v7, p1

    .line 90
    cmpl-float v6, v6, v7

    .line 91
    .line 92
    if-lez v6, :cond_2

    .line 93
    .line 94
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Ljava/lang/Integer;

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    iget-object v1, p0, Ll/jgl;->d:Ljava/util/LinkedHashMap;

    .line 105
    .line 106
    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Ljava/lang/Float;

    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    goto :goto_1

    .line 117
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_3
    :goto_1
    if-ltz v4, :cond_5

    .line 121
    .line 122
    if-ltz v2, :cond_5

    .line 123
    .line 124
    iget v0, p0, Ll/jgl;->c:I

    .line 125
    .line 126
    int-to-float v0, v0

    .line 127
    mul-float/2addr p1, v0

    .line 128
    int-to-float v0, v4

    .line 129
    sub-float/2addr p1, v0

    .line 130
    sub-int/2addr v2, v4

    .line 131
    int-to-float v0, v2

    .line 132
    div-float/2addr p1, v0

    .line 133
    invoke-virtual {p0, v4}, Ll/jgl;->b(I)Landroid/view/animation/Interpolator;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    if-eqz v0, :cond_4

    .line 138
    .line 139
    invoke-interface {v0, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    :cond_4
    sub-float/2addr v1, v5

    .line 144
    mul-float/2addr v1, p1

    .line 145
    add-float/2addr v5, v1

    .line 146
    goto :goto_3

    .line 147
    :cond_5
    if-gez v4, :cond_6

    .line 148
    .line 149
    if-ltz v2, :cond_6

    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_6
    if-ltz v4, :cond_7

    .line 153
    .line 154
    if-gez v2, :cond_7

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_7
    :goto_2
    const/4 v5, 0x0

    .line 158
    :goto_3
    invoke-virtual {p0, v5}, Ll/jgl;->e(F)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public abstract e(F)V
.end method
