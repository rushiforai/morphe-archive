.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView$b;
    }
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public d:F

.field public e:[F

.field public f:I

.field public g:[F

.field public h:Landroid/graphics/Paint;

.field public final i:I

.field public final j:I

.field public final k:I

.field public final l:I

.field public final m:F

.field public final n:F

.field public o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView$b;

.field public p:Landroid/animation/ValueAnimator;

.field public q:Z

.field public r:J

.field public s:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 57
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->f:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->i:I

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->j:I

    .line 11
    .line 12
    const/4 p2, 0x2

    .line 13
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->k:I

    .line 14
    .line 15
    const/4 p2, 0x3

    .line 16
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->l:I

    .line 17
    .line 18
    const/high16 p2, 0x40400000    # 3.0f

    .line 19
    .line 20
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    int-to-float p2, p2

    .line 25
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->m:F

    .line 26
    .line 27
    const/high16 p2, 0x41200000    # 10.0f

    .line 28
    .line 29
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    int-to-float p2, p2

    .line 34
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->n:F

    .line 35
    .line 36
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->q:Z

    .line 37
    .line 38
    const-wide/16 p2, 0xbb8

    .line 39
    .line 40
    iput-wide p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->r:J

    .line 41
    .line 42
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->s:Z

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 45
    .line 46
    .line 47
    iget-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->r:J

    .line 48
    .line 49
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->j(J)Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->p:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->l(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView$b;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->f:I

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->s:Z

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;[F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->g:[F

    return-void
.end method


# virtual methods
.method public final f(IFLjava/util/List;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IF",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/4 v4, 0x2

    .line 12
    sub-int/2addr v3, v4

    .line 13
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Ljava/lang/Float;

    .line 18
    .line 19
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    const/4 v6, 0x1

    .line 28
    sub-int/2addr v5, v6

    .line 29
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    check-cast v5, Ljava/lang/Float;

    .line 34
    .line 35
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    const/4 v7, 0x0

    .line 40
    :goto_0
    const/16 v8, 0x5a

    .line 41
    .line 42
    if-ge v7, v8, :cond_4

    .line 43
    .line 44
    add-int/lit8 v8, v7, 0xa

    .line 45
    .line 46
    const-wide v9, 0x3f91df46a2529d39L    # 0.017453292519943295

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    if-eq v0, v6, :cond_2

    .line 54
    .line 55
    if-eq v0, v4, :cond_1

    .line 56
    .line 57
    const/4 v11, 0x3

    .line 58
    if-eq v0, v11, :cond_0

    .line 59
    .line 60
    move v15, v7

    .line 61
    goto/16 :goto_1

    .line 62
    .line 63
    :cond_0
    float-to-double v11, v3

    .line 64
    int-to-double v13, v8

    .line 65
    mul-double/2addr v13, v9

    .line 66
    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    .line 67
    .line 68
    .line 69
    move-result-wide v8

    .line 70
    move v15, v7

    .line 71
    float-to-double v6, v1

    .line 72
    mul-double/2addr v8, v6

    .line 73
    add-double/2addr v11, v8

    .line 74
    double-to-float v8, v11

    .line 75
    float-to-double v9, v5

    .line 76
    invoke-static {v13, v14}, Ljava/lang/Math;->cos(D)D

    .line 77
    .line 78
    .line 79
    move-result-wide v11

    .line 80
    mul-double/2addr v11, v6

    .line 81
    sub-double/2addr v6, v11

    .line 82
    add-double/2addr v9, v6

    .line 83
    double-to-float v6, v9

    .line 84
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_1
    move v15, v7

    .line 100
    float-to-double v6, v3

    .line 101
    float-to-double v11, v1

    .line 102
    int-to-double v13, v8

    .line 103
    mul-double/2addr v13, v9

    .line 104
    invoke-static {v13, v14}, Ljava/lang/Math;->cos(D)D

    .line 105
    .line 106
    .line 107
    move-result-wide v8

    .line 108
    mul-double/2addr v8, v11

    .line 109
    sub-double v8, v11, v8

    .line 110
    .line 111
    sub-double/2addr v6, v8

    .line 112
    double-to-float v6, v6

    .line 113
    float-to-double v7, v5

    .line 114
    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    .line 115
    .line 116
    .line 117
    move-result-wide v9

    .line 118
    mul-double/2addr v9, v11

    .line 119
    add-double/2addr v7, v9

    .line 120
    double-to-float v7, v7

    .line 121
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 122
    .line 123
    .line 124
    move-result-object v6

    .line 125
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 129
    .line 130
    .line 131
    move-result-object v6

    .line 132
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_2
    move v15, v7

    .line 137
    float-to-double v6, v3

    .line 138
    int-to-double v11, v8

    .line 139
    mul-double/2addr v11, v9

    .line 140
    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    .line 141
    .line 142
    .line 143
    move-result-wide v8

    .line 144
    float-to-double v13, v1

    .line 145
    mul-double/2addr v8, v13

    .line 146
    sub-double/2addr v6, v8

    .line 147
    double-to-float v6, v6

    .line 148
    float-to-double v7, v5

    .line 149
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 150
    .line 151
    .line 152
    move-result-wide v9

    .line 153
    mul-double/2addr v9, v13

    .line 154
    sub-double/2addr v13, v9

    .line 155
    sub-double/2addr v7, v13

    .line 156
    double-to-float v7, v7

    .line 157
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 165
    .line 166
    .line 167
    move-result-object v6

    .line 168
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    goto :goto_1

    .line 172
    :cond_3
    move v15, v7

    .line 173
    float-to-double v6, v3

    .line 174
    float-to-double v11, v1

    .line 175
    int-to-double v13, v8

    .line 176
    mul-double/2addr v13, v9

    .line 177
    invoke-static {v13, v14}, Ljava/lang/Math;->cos(D)D

    .line 178
    .line 179
    .line 180
    move-result-wide v8

    .line 181
    mul-double/2addr v8, v11

    .line 182
    sub-double v8, v11, v8

    .line 183
    .line 184
    add-double/2addr v6, v8

    .line 185
    double-to-float v6, v6

    .line 186
    float-to-double v7, v5

    .line 187
    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    .line 188
    .line 189
    .line 190
    move-result-wide v9

    .line 191
    mul-double/2addr v9, v11

    .line 192
    sub-double/2addr v7, v9

    .line 193
    double-to-float v7, v7

    .line 194
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 195
    .line 196
    .line 197
    move-result-object v6

    .line 198
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    :goto_1
    add-int/lit8 v7, v15, 0x3

    .line 209
    .line 210
    const/4 v6, 0x1

    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :cond_4
    return-void
.end method

.method public final g(FFFFLjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFF",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/high16 p0, 0x40000000    # 2.0f

    .line 2
    .line 3
    mul-float/2addr p2, p0

    .line 4
    sub-float/2addr p1, p2

    .line 5
    float-to-int p0, p1

    .line 6
    div-int/lit8 p0, p0, 0x2

    .line 7
    .line 8
    :goto_0
    add-int/lit8 p0, p0, 0x1

    .line 9
    .line 10
    int-to-float p2, p0

    .line 11
    cmpg-float v0, p2, p1

    .line 12
    .line 13
    if-gez v0, :cond_0

    .line 14
    .line 15
    add-float/2addr p2, p3

    .line 16
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-interface {p5, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-interface {p5, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public final h(FFFFLjava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFF",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    :goto_0
    int-to-float v0, p0

    .line 3
    const/high16 v1, 0x40000000    # 2.0f

    .line 4
    .line 5
    mul-float v2, p2, v1

    .line 6
    .line 7
    sub-float v2, p1, v2

    .line 8
    .line 9
    div-float/2addr v2, v1

    .line 10
    cmpg-float v1, v0, v2

    .line 11
    .line 12
    if-gez v1, :cond_0

    .line 13
    .line 14
    add-float/2addr v0, p3

    .line 15
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {p5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {p5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    add-int/lit8 p0, p0, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public final i(FFFFLjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFF",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    :goto_0
    int-to-float v0, p0

    .line 3
    const/high16 v1, 0x40000000    # 2.0f

    .line 4
    .line 5
    mul-float/2addr v1, p2

    .line 6
    sub-float v1, p1, v1

    .line 7
    .line 8
    cmpg-float v1, v0, v1

    .line 9
    .line 10
    if-gez v1, :cond_0

    .line 11
    .line 12
    add-float/2addr v0, p3

    .line 13
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {p5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {p5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    add-int/lit8 p0, p0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public final j(J)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    fill-array-data p0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    new-instance p1, Landroid/view/animation/LinearInterpolator;

    .line 15
    .line 16
    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 24
    .line 25
    .line 26
    return-object p0

    .line 27
    :array_0
    .array-data 4
        0x0
        0x42c80000    # 100.0f
    .end array-data
.end method

.method public final k()V
    .locals 8

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->h:Landroid/graphics/Paint;

    .line 7
    .line 8
    sget v1, Ll/n9c0;->p0:I

    .line 9
    .line 10
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->h:Landroid/graphics/Paint;

    .line 18
    .line 19
    sget-object v1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->h:Landroid/graphics/Paint;

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->m:F

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->h:Landroid/graphics/Paint;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 35
    .line 36
    .line 37
    new-instance v7, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->c:F

    .line 43
    .line 44
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->n:F

    .line 45
    .line 46
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->a:F

    .line 47
    .line 48
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->b:F

    .line 49
    .line 50
    move-object v2, p0

    .line 51
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->g(FFFFLjava/util/List;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x3

    .line 55
    iget v0, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->n:F

    .line 56
    .line 57
    invoke-virtual {v2, p0, v0, v7}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->f(IFLjava/util/List;)V

    .line 58
    .line 59
    .line 60
    iget v3, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->d:F

    .line 61
    .line 62
    iget v4, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->n:F

    .line 63
    .line 64
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    sub-int/2addr p0, v1

    .line 69
    invoke-virtual {v7, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Ljava/lang/Float;

    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    const/4 v0, 0x2

    .line 84
    sub-int/2addr p0, v0

    .line 85
    invoke-virtual {v7, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    check-cast p0, Ljava/lang/Float;

    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 92
    .line 93
    .line 94
    move-result v6

    .line 95
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->i(FFFFLjava/util/List;)V

    .line 96
    .line 97
    .line 98
    iget p0, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->n:F

    .line 99
    .line 100
    invoke-virtual {v2, v0, p0, v7}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->f(IFLjava/util/List;)V

    .line 101
    .line 102
    .line 103
    iget v3, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->c:F

    .line 104
    .line 105
    iget v4, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->n:F

    .line 106
    .line 107
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    sub-int/2addr p0, v0

    .line 112
    invoke-virtual {v7, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    check-cast p0, Ljava/lang/Float;

    .line 117
    .line 118
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    sub-int/2addr p0, v1

    .line 127
    invoke-virtual {v7, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    check-cast p0, Ljava/lang/Float;

    .line 132
    .line 133
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->m(FFFFLjava/util/List;)V

    .line 138
    .line 139
    .line 140
    iget p0, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->n:F

    .line 141
    .line 142
    invoke-virtual {v2, v1, p0, v7}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->f(IFLjava/util/List;)V

    .line 143
    .line 144
    .line 145
    iget v3, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->d:F

    .line 146
    .line 147
    iget v4, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->n:F

    .line 148
    .line 149
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    sub-int/2addr p0, v1

    .line 154
    invoke-virtual {v7, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    check-cast p0, Ljava/lang/Float;

    .line 159
    .line 160
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    sub-int/2addr p0, v0

    .line 169
    invoke-virtual {v7, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    check-cast p0, Ljava/lang/Float;

    .line 174
    .line 175
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 176
    .line 177
    .line 178
    move-result v6

    .line 179
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->n(FFFFLjava/util/List;)V

    .line 180
    .line 181
    .line 182
    iget p0, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->n:F

    .line 183
    .line 184
    const/4 v0, 0x0

    .line 185
    invoke-virtual {v2, v0, p0, v7}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->f(IFLjava/util/List;)V

    .line 186
    .line 187
    .line 188
    iget v3, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->c:F

    .line 189
    .line 190
    iget v4, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->n:F

    .line 191
    .line 192
    iget v5, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->a:F

    .line 193
    .line 194
    iget v6, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->b:F

    .line 195
    .line 196
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->h(FFFFLjava/util/List;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    new-array p0, p0, [F

    .line 204
    .line 205
    iput-object p0, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->e:[F

    .line 206
    .line 207
    :goto_0
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    iget-object v1, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->e:[F

    .line 212
    .line 213
    if-ge v0, p0, :cond_0

    .line 214
    .line 215
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    check-cast p0, Ljava/lang/Float;

    .line 220
    .line 221
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    aput p0, v1, v0

    .line 226
    .line 227
    add-int/lit8 v0, v0, 0x1

    .line 228
    .line 229
    goto :goto_0

    .line 230
    :cond_0
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->p([F)V

    .line 231
    .line 232
    .line 233
    return-void
.end method

.method public final synthetic l(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    float-to-int p1, p1

    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->e:[F

    .line 13
    .line 14
    array-length v1, v0

    .line 15
    mul-int/2addr p1, v1

    .line 16
    div-int/lit8 p1, p1, 0x64

    .line 17
    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->f:I

    .line 19
    .line 20
    rem-int/lit8 v1, p1, 0x2

    .line 21
    .line 22
    if-lez v1, :cond_0

    .line 23
    .line 24
    add-int/lit8 p1, p1, -0x1

    .line 25
    .line 26
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->f:I

    .line 27
    .line 28
    if-ltz p1, :cond_1

    .line 29
    .line 30
    array-length v1, v0

    .line 31
    invoke-static {v0, p1, v1}, Ljava/util/Arrays;->copyOfRange([FII)[F

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->g:[F

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public final m(FFFFLjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFF",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    :goto_0
    int-to-float v0, p0

    .line 3
    const/high16 v1, 0x40000000    # 2.0f

    .line 4
    .line 5
    mul-float/2addr v1, p2

    .line 6
    sub-float v1, p1, v1

    .line 7
    .line 8
    cmpg-float v1, v0, v1

    .line 9
    .line 10
    if-gez v1, :cond_0

    .line 11
    .line 12
    sub-float v0, p3, v0

    .line 13
    .line 14
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {p5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {p5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    add-int/lit8 p0, p0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public final n(FFFFLjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFF",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    :goto_0
    int-to-float v0, p0

    .line 3
    const/high16 v1, 0x40000000    # 2.0f

    .line 4
    .line 5
    mul-float/2addr v1, p2

    .line 6
    sub-float v1, p1, v1

    .line 7
    .line 8
    cmpg-float v1, v0, v1

    .line 9
    .line 10
    if-gez v1, :cond_0

    .line 11
    .line 12
    sub-float v0, p3, v0

    .line 13
    .line 14
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {p5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {p5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    add-int/lit8 p0, p0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public o()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->q:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->p:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->p:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->p:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 23
    .line 24
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->p:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    new-instance v1, Ll/hv20;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/hv20;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->p:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView$a;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->p:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->q:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->g:[F

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->h:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPoints([FLandroid/graphics/Paint;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->q:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const p2, 0x3f99999a    # 1.2f

    .line 14
    .line 15
    .line 16
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    sub-int/2addr p1, p2

    .line 21
    int-to-float p1, p1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->d:F

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    const p2, 0x3fc66666    # 1.55f

    .line 29
    .line 30
    .line 31
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    sub-int/2addr p1, p2

    .line 36
    int-to-float p1, p1

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->c:F

    .line 38
    .line 39
    const/high16 p1, 0x413c0000    # 11.75f

    .line 40
    .line 41
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    int-to-float p1, p1

    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->a:F

    .line 47
    .line 48
    const p1, 0x3e99999a    # 0.3f

    .line 49
    .line 50
    .line 51
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    int-to-float p1, p1

    .line 56
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->b:F

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->k()V

    .line 59
    .line 60
    .line 61
    const/4 p1, 0x1

    .line 62
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->q:Z

    .line 63
    .line 64
    return-void
.end method

.method public final p([F)V
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    array-length v0, p1

    .line 3
    div-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    if-ge p0, v0, :cond_0

    .line 6
    .line 7
    aget v0, p1, p0

    .line 8
    .line 9
    array-length v1, p1

    .line 10
    sub-int/2addr v1, p0

    .line 11
    add-int/lit8 v1, v1, -0x2

    .line 12
    .line 13
    aget v1, p1, v1

    .line 14
    .line 15
    aput v1, p1, p0

    .line 16
    .line 17
    array-length v1, p1

    .line 18
    sub-int/2addr v1, p0

    .line 19
    add-int/lit8 v1, v1, -0x2

    .line 20
    .line 21
    aput v0, p1, v1

    .line 22
    .line 23
    add-int/lit8 v0, p0, 0x1

    .line 24
    .line 25
    aget v1, p1, v0

    .line 26
    .line 27
    array-length v2, p1

    .line 28
    sub-int/2addr v2, p0

    .line 29
    add-int/lit8 v2, v2, -0x1

    .line 30
    .line 31
    aget v2, p1, v2

    .line 32
    .line 33
    aput v2, p1, v0

    .line 34
    .line 35
    array-length v0, p1

    .line 36
    sub-int/2addr v0, p0

    .line 37
    add-int/lit8 v0, v0, -0x1

    .line 38
    .line 39
    aput v1, p1, v0

    .line 40
    .line 41
    add-int/lit8 p0, p0, 0x2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-void
.end method

.method public setCountdownTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->r:J

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->j(J)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->p:Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    return-void
.end method

.method public setOnCountDownListener(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/NewFastGiftCountDownView$b;

    .line 2
    .line 3
    return-void
.end method
