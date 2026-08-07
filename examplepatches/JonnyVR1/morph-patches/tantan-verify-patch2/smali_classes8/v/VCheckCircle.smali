.class public Lv/VCheckCircle;
.super Landroid/widget/ImageView;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "AppCompatCustomView"
    }
.end annotation


# static fields
.field public static r:Landroid/graphics/Paint;

.field public static s:Landroid/graphics/Paint;

.field public static t:Landroid/graphics/Paint;

.field public static u:Landroid/graphics/Paint;


# instance fields
.field public a:Landroid/graphics/Bitmap;

.field public b:Landroid/graphics/Bitmap;

.field public c:Landroid/graphics/Canvas;

.field public d:Landroid/graphics/Canvas;

.field public e:Z

.field public f:I

.field public g:I

.field public h:F

.field public i:Landroid/animation/ObjectAnimator;

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:I

.field public n:I

.field public o:I

.field public p:F

.field public q:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 47
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Lv/VCheckCircle;->e:Z

    const/high16 v1, 0x44000000    # 512.0f

    .line 49
    iput v1, p0, Lv/VCheckCircle;->f:I

    const/4 v1, -0x1

    .line 50
    iput v1, p0, Lv/VCheckCircle;->g:I

    .line 51
    iput-boolean v0, p0, Lv/VCheckCircle;->j:Z

    const/16 v0, 0x18

    .line 52
    iput v0, p0, Lv/VCheckCircle;->m:I

    const v0, -0xff37ad

    .line 53
    iput v0, p0, Lv/VCheckCircle;->o:I

    const/high16 v0, 0x3e800000    # 0.25f

    .line 54
    iput v0, p0, Lv/VCheckCircle;->p:F

    const-wide/16 v0, 0x1f4

    .line 55
    iput-wide v0, p0, Lv/VCheckCircle;->q:J

    .line 56
    invoke-virtual {p0, p1}, Lv/VCheckCircle;->c(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x1

    .line 5
    iput-boolean p2, p0, Lv/VCheckCircle;->e:Z

    .line 6
    .line 7
    const/high16 v0, 0x44000000    # 512.0f

    .line 8
    .line 9
    iput v0, p0, Lv/VCheckCircle;->f:I

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lv/VCheckCircle;->g:I

    .line 13
    .line 14
    iput-boolean p2, p0, Lv/VCheckCircle;->j:Z

    .line 15
    .line 16
    const/16 p2, 0x18

    .line 17
    .line 18
    iput p2, p0, Lv/VCheckCircle;->m:I

    .line 19
    .line 20
    const p2, -0xff37ad

    .line 21
    .line 22
    .line 23
    iput p2, p0, Lv/VCheckCircle;->o:I

    .line 24
    .line 25
    const/high16 p2, 0x3e800000    # 0.25f

    .line 26
    .line 27
    iput p2, p0, Lv/VCheckCircle;->p:F

    .line 28
    .line 29
    const-wide/16 v0, 0x1f4

    .line 30
    .line 31
    iput-wide v0, p0, Lv/VCheckCircle;->q:J

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lv/VCheckCircle;->c(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x1

    .line 38
    iput-boolean p2, p0, Lv/VCheckCircle;->e:Z

    const/high16 p3, 0x44000000    # 512.0f

    .line 39
    iput p3, p0, Lv/VCheckCircle;->f:I

    const/4 p3, -0x1

    .line 40
    iput p3, p0, Lv/VCheckCircle;->g:I

    .line 41
    iput-boolean p2, p0, Lv/VCheckCircle;->j:Z

    const/16 p2, 0x18

    .line 42
    iput p2, p0, Lv/VCheckCircle;->m:I

    const p2, -0xff37ad

    .line 43
    iput p2, p0, Lv/VCheckCircle;->o:I

    const/high16 p2, 0x3e800000    # 0.25f

    .line 44
    iput p2, p0, Lv/VCheckCircle;->p:F

    const-wide/16 p2, 0x1f4

    .line 45
    iput-wide p2, p0, Lv/VCheckCircle;->q:J

    .line 46
    invoke-virtual {p0, p1}, Lv/VCheckCircle;->c(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lv/VCheckCircle;->j:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/high16 p1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    const/4 v0, 0x1

    .line 10
    new-array v0, v0, [F

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    aput p1, v0, v1

    .line 14
    .line 15
    const-string p1, "progress"

    .line 16
    .line 17
    invoke-static {p0, p1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lv/VCheckCircle;->i:Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    iget-wide v0, p0, Lv/VCheckCircle;->q:J

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lv/VCheckCircle;->i:Landroid/animation/ObjectAnimator;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VCheckCircle;->i:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final c(Landroid/content/Context;)V
    .locals 4

    .line 1
    sget-object p1, Lv/VCheckCircle;->r:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Landroid/graphics/Paint;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 9
    .line 10
    .line 11
    sput-object p1, Lv/VCheckCircle;->r:Landroid/graphics/Paint;

    .line 12
    .line 13
    new-instance p1, Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 16
    .line 17
    .line 18
    sput-object p1, Lv/VCheckCircle;->s:Landroid/graphics/Paint;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lv/VCheckCircle;->s:Landroid/graphics/Paint;

    .line 25
    .line 26
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    .line 27
    .line 28
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 29
    .line 30
    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 34
    .line 35
    .line 36
    new-instance p1, Landroid/graphics/Paint;

    .line 37
    .line 38
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 39
    .line 40
    .line 41
    sput-object p1, Lv/VCheckCircle;->t:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 44
    .line 45
    .line 46
    sget-object p1, Lv/VCheckCircle;->t:Landroid/graphics/Paint;

    .line 47
    .line 48
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 51
    .line 52
    .line 53
    sget-object p1, Lv/VCheckCircle;->t:Landroid/graphics/Paint;

    .line 54
    .line 55
    const/high16 v2, 0x41e00000    # 28.0f

    .line 56
    .line 57
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    int-to-float v2, v2

    .line 62
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 63
    .line 64
    .line 65
    sget-object p1, Lv/VCheckCircle;->t:Landroid/graphics/Paint;

    .line 66
    .line 67
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    .line 68
    .line 69
    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 73
    .line 74
    .line 75
    new-instance p1, Landroid/graphics/Paint;

    .line 76
    .line 77
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 78
    .line 79
    .line 80
    sput-object p1, Lv/VCheckCircle;->u:Landroid/graphics/Paint;

    .line 81
    .line 82
    iget p0, p0, Lv/VCheckCircle;->g:I

    .line 83
    .line 84
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 85
    .line 86
    .line 87
    sget-object p0, Lv/VCheckCircle;->u:Landroid/graphics/Paint;

    .line 88
    .line 89
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 90
    .line 91
    .line 92
    :cond_0
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lv/VCheckCircle;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public e(ZZ)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lv/VCheckCircle;->l:Z

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lv/VCheckCircle;->l:Z

    .line 7
    .line 8
    iget-boolean v0, p0, Lv/VCheckCircle;->k:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lv/VCheckCircle;->a(Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-virtual {p0}, Lv/VCheckCircle;->b()V

    .line 19
    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    const/high16 p1, 0x3f800000    # 1.0f

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const/4 p1, 0x0

    .line 27
    :goto_0
    invoke-virtual {p0, p1}, Lv/VCheckCircle;->setProgress(F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public getProgress()F
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iget p0, p0, Lv/VCheckCircle;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lv/VCheckCircle;->k:Z

    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lv/VCheckCircle;->k:Z

    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-boolean v0, p0, Lv/VCheckCircle;->e:Z

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget v0, p0, Lv/VCheckCircle;->h:F

    .line 14
    .line 15
    cmpl-float v0, v0, v1

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    return-void

    .line 21
    :cond_2
    :goto_1
    sget-object v0, Lv/VCheckCircle;->t:Landroid/graphics/Paint;

    .line 22
    .line 23
    iget v2, p0, Lv/VCheckCircle;->m:I

    .line 24
    .line 25
    const/high16 v3, 0x40c00000    # 6.0f

    .line 26
    .line 27
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    add-int/2addr v2, v4

    .line 32
    int-to-float v2, v2

    .line 33
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lv/VCheckCircle;->a:Landroid/graphics/Bitmap;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-virtual {v0, v2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    div-int/lit8 v0, v0, 0x2

    .line 47
    .line 48
    int-to-float v0, v0

    .line 49
    iget v4, p0, Lv/VCheckCircle;->h:F

    .line 50
    .line 51
    const/high16 v5, 0x3f000000    # 0.5f

    .line 52
    .line 53
    cmpl-float v6, v4, v5

    .line 54
    .line 55
    const/high16 v7, 0x3f800000    # 1.0f

    .line 56
    .line 57
    if-ltz v6, :cond_3

    .line 58
    .line 59
    move v6, v7

    .line 60
    goto :goto_2

    .line 61
    :cond_3
    div-float v6, v4, v5

    .line 62
    .line 63
    :goto_2
    cmpg-float v8, v4, v5

    .line 64
    .line 65
    if-gez v8, :cond_4

    .line 66
    .line 67
    move v8, v1

    .line 68
    goto :goto_3

    .line 69
    :cond_4
    sub-float v8, v4, v5

    .line 70
    .line 71
    div-float/2addr v8, v5

    .line 72
    :goto_3
    iget-boolean v5, p0, Lv/VCheckCircle;->j:Z

    .line 73
    .line 74
    if-eqz v5, :cond_5

    .line 75
    .line 76
    goto :goto_4

    .line 77
    :cond_5
    sub-float v4, v7, v4

    .line 78
    .line 79
    :goto_4
    iget v5, p0, Lv/VCheckCircle;->p:F

    .line 80
    .line 81
    cmpg-float v9, v4, v5

    .line 82
    .line 83
    const/high16 v10, 0x40000000    # 2.0f

    .line 84
    .line 85
    if-gez v9, :cond_6

    .line 86
    .line 87
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    int-to-float v5, v5

    .line 92
    mul-float/2addr v5, v4

    .line 93
    iget v4, p0, Lv/VCheckCircle;->p:F

    .line 94
    .line 95
    div-float/2addr v5, v4

    .line 96
    :goto_5
    sub-float/2addr v0, v5

    .line 97
    goto :goto_6

    .line 98
    :cond_6
    mul-float/2addr v5, v10

    .line 99
    cmpg-float v5, v4, v5

    .line 100
    .line 101
    if-gez v5, :cond_7

    .line 102
    .line 103
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    int-to-float v5, v5

    .line 108
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result v9

    .line 112
    int-to-float v9, v9

    .line 113
    iget v11, p0, Lv/VCheckCircle;->p:F

    .line 114
    .line 115
    sub-float/2addr v4, v11

    .line 116
    mul-float/2addr v9, v4

    .line 117
    div-float/2addr v9, v11

    .line 118
    sub-float/2addr v5, v9

    .line 119
    goto :goto_5

    .line 120
    :cond_7
    :goto_6
    iget-boolean v4, p0, Lv/VCheckCircle;->e:Z

    .line 121
    .line 122
    if-eqz v4, :cond_9

    .line 123
    .line 124
    sget-object v4, Lv/VCheckCircle;->r:Landroid/graphics/Paint;

    .line 125
    .line 126
    iget v5, p0, Lv/VCheckCircle;->f:I

    .line 127
    .line 128
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    div-int/lit8 v4, v4, 0x2

    .line 136
    .line 137
    int-to-float v4, v4

    .line 138
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    div-int/lit8 v5, v5, 0x2

    .line 143
    .line 144
    int-to-float v5, v5

    .line 145
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 146
    .line 147
    .line 148
    move-result v9

    .line 149
    int-to-float v9, v9

    .line 150
    sub-float v9, v0, v9

    .line 151
    .line 152
    sget-object v11, Lv/VCheckCircle;->r:Landroid/graphics/Paint;

    .line 153
    .line 154
    invoke-virtual {p1, v4, v5, v9, v11}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 155
    .line 156
    .line 157
    sget-object v4, Lv/VCheckCircle;->u:Landroid/graphics/Paint;

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 160
    .line 161
    .line 162
    move-result v5

    .line 163
    div-int/lit8 v5, v5, 0x2

    .line 164
    .line 165
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 166
    .line 167
    .line 168
    move-result v9

    .line 169
    sub-int/2addr v5, v9

    .line 170
    int-to-float v5, v5

    .line 171
    sub-float/2addr v5, v0

    .line 172
    const/high16 v9, 0x40a00000    # 5.0f

    .line 173
    .line 174
    div-float/2addr v5, v9

    .line 175
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 176
    .line 177
    .line 178
    move-result v9

    .line 179
    int-to-float v9, v9

    .line 180
    add-float/2addr v5, v9

    .line 181
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 182
    .line 183
    .line 184
    sget-object v4, Lv/VCheckCircle;->u:Landroid/graphics/Paint;

    .line 185
    .line 186
    iget-boolean v5, p0, Lv/VCheckCircle;->l:Z

    .line 187
    .line 188
    if-eqz v5, :cond_8

    .line 189
    .line 190
    iget v5, p0, Lv/VCheckCircle;->o:I

    .line 191
    .line 192
    goto :goto_7

    .line 193
    :cond_8
    iget v5, p0, Lv/VCheckCircle;->g:I

    .line 194
    .line 195
    :goto_7
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    div-int/lit8 v4, v4, 0x2

    .line 203
    .line 204
    int-to-float v4, v4

    .line 205
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 206
    .line 207
    .line 208
    move-result v5

    .line 209
    div-int/lit8 v5, v5, 0x2

    .line 210
    .line 211
    int-to-float v5, v5

    .line 212
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 213
    .line 214
    .line 215
    move-result v9

    .line 216
    int-to-float v9, v9

    .line 217
    sub-float v9, v0, v9

    .line 218
    .line 219
    sget-object v11, Lv/VCheckCircle;->u:Landroid/graphics/Paint;

    .line 220
    .line 221
    invoke-virtual {p1, v4, v5, v9, v11}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 222
    .line 223
    .line 224
    :cond_9
    sget-object v4, Lv/VCheckCircle;->r:Landroid/graphics/Paint;

    .line 225
    .line 226
    iget v5, p0, Lv/VCheckCircle;->o:I

    .line 227
    .line 228
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 229
    .line 230
    .line 231
    iget-object v4, p0, Lv/VCheckCircle;->c:Landroid/graphics/Canvas;

    .line 232
    .line 233
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 234
    .line 235
    .line 236
    move-result v5

    .line 237
    div-int/lit8 v5, v5, 0x2

    .line 238
    .line 239
    int-to-float v5, v5

    .line 240
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 241
    .line 242
    .line 243
    move-result v9

    .line 244
    div-int/lit8 v9, v9, 0x2

    .line 245
    .line 246
    int-to-float v9, v9

    .line 247
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 248
    .line 249
    .line 250
    move-result v10

    .line 251
    int-to-float v10, v10

    .line 252
    sub-float v10, v0, v10

    .line 253
    .line 254
    sget-object v11, Lv/VCheckCircle;->r:Landroid/graphics/Paint;

    .line 255
    .line 256
    invoke-virtual {v4, v5, v9, v10, v11}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 257
    .line 258
    .line 259
    iget-object v4, p0, Lv/VCheckCircle;->c:Landroid/graphics/Canvas;

    .line 260
    .line 261
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 262
    .line 263
    .line 264
    move-result v5

    .line 265
    div-int/lit8 v5, v5, 0x2

    .line 266
    .line 267
    int-to-float v5, v5

    .line 268
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 269
    .line 270
    .line 271
    move-result v9

    .line 272
    div-int/lit8 v9, v9, 0x2

    .line 273
    .line 274
    int-to-float v9, v9

    .line 275
    sub-float v6, v7, v6

    .line 276
    .line 277
    mul-float/2addr v0, v6

    .line 278
    sget-object v6, Lv/VCheckCircle;->s:Landroid/graphics/Paint;

    .line 279
    .line 280
    invoke-virtual {v4, v5, v9, v0, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 281
    .line 282
    .line 283
    iget-object v0, p0, Lv/VCheckCircle;->a:Landroid/graphics/Bitmap;

    .line 284
    .line 285
    const/4 v4, 0x0

    .line 286
    invoke-virtual {p1, v0, v1, v1, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 287
    .line 288
    .line 289
    iget-object v0, p0, Lv/VCheckCircle;->b:Landroid/graphics/Bitmap;

    .line 290
    .line 291
    invoke-virtual {v0, v2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 299
    .line 300
    .line 301
    move-result v0

    .line 302
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 307
    .line 308
    .line 309
    move-result v2

    .line 310
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 311
    .line 312
    .line 313
    move-result v5

    .line 314
    sub-int/2addr v5, v0

    .line 315
    div-int/lit8 v5, v5, 0x2

    .line 316
    .line 317
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 318
    .line 319
    .line 320
    move-result v6

    .line 321
    sub-int/2addr v6, v2

    .line 322
    div-int/lit8 v6, v6, 0x2

    .line 323
    .line 324
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 325
    .line 326
    .line 327
    move-result-object v9

    .line 328
    iget v10, p0, Lv/VCheckCircle;->n:I

    .line 329
    .line 330
    add-int v11, v6, v10

    .line 331
    .line 332
    add-int/2addr v0, v5

    .line 333
    add-int/2addr v6, v2

    .line 334
    add-int/2addr v6, v10

    .line 335
    invoke-virtual {v9, v5, v11, v0, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    iget-object v2, p0, Lv/VCheckCircle;->d:Landroid/graphics/Canvas;

    .line 343
    .line 344
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 345
    .line 346
    .line 347
    iget-object v0, p0, Lv/VCheckCircle;->d:Landroid/graphics/Canvas;

    .line 348
    .line 349
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 350
    .line 351
    .line 352
    move-result v2

    .line 353
    div-int/lit8 v2, v2, 0x2

    .line 354
    .line 355
    const/high16 v5, 0x40200000    # 2.5f

    .line 356
    .line 357
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 358
    .line 359
    .line 360
    move-result v5

    .line 361
    sub-int/2addr v2, v5

    .line 362
    int-to-float v2, v2

    .line 363
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 364
    .line 365
    .line 366
    move-result v5

    .line 367
    div-int/lit8 v5, v5, 0x2

    .line 368
    .line 369
    const/high16 v6, 0x40800000    # 4.0f

    .line 370
    .line 371
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 372
    .line 373
    .line 374
    move-result v6

    .line 375
    add-int/2addr v5, v6

    .line 376
    int-to-float v5, v5

    .line 377
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 378
    .line 379
    .line 380
    move-result v6

    .line 381
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 382
    .line 383
    .line 384
    move-result v3

    .line 385
    add-int/2addr v6, v3

    .line 386
    div-int/lit8 v6, v6, 0x2

    .line 387
    .line 388
    int-to-float v3, v6

    .line 389
    sub-float/2addr v7, v8

    .line 390
    mul-float/2addr v3, v7

    .line 391
    sget-object v6, Lv/VCheckCircle;->t:Landroid/graphics/Paint;

    .line 392
    .line 393
    invoke-virtual {v0, v2, v5, v3, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 394
    .line 395
    .line 396
    iget-object p0, p0, Lv/VCheckCircle;->b:Landroid/graphics/Bitmap;

    .line 397
    .line 398
    invoke-virtual {p1, p0, v1, v1, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 399
    .line 400
    .line 401
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lv/VCheckCircle;->m:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Lv/VCheckCircle;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VCheckCircle;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public setCheckOffset(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VCheckCircle;->n:I

    .line 2
    .line 3
    return-void
.end method

.method public setColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VCheckCircle;->o:I

    .line 2
    .line 3
    return-void
.end method

.method public setDrawBackground(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/VCheckCircle;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lv/VCheckCircle;->q:J

    .line 2
    .line 3
    return-void
.end method

.method public setProgress(F)V
    .locals 1
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iget v0, p0, Lv/VCheckCircle;->h:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lv/VCheckCircle;->h:F

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setProgressBounceEffect(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Lv/VCheckCircle;->p:F

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 7
    .line 8
    .line 9
    :goto_0
    iput p1, p0, Lv/VCheckCircle;->p:F

    .line 10
    .line 11
    return-void
.end method

.method public setSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VCheckCircle;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public setStrokeColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VCheckCircle;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setVisibility(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lv/VCheckCircle;->a:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget p1, p0, Lv/VCheckCircle;->m:I

    .line 11
    .line 12
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    .line 13
    .line 14
    invoke-static {p1, p1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lv/VCheckCircle;->a:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    new-instance p1, Landroid/graphics/Canvas;

    .line 21
    .line 22
    iget-object v1, p0, Lv/VCheckCircle;->a:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    invoke-direct {p1, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lv/VCheckCircle;->c:Landroid/graphics/Canvas;

    .line 28
    .line 29
    iget p1, p0, Lv/VCheckCircle;->m:I

    .line 30
    .line 31
    invoke-static {p1, p1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lv/VCheckCircle;->b:Landroid/graphics/Bitmap;

    .line 36
    .line 37
    new-instance p1, Landroid/graphics/Canvas;

    .line 38
    .line 39
    iget-object v0, p0, Lv/VCheckCircle;->b:Landroid/graphics/Bitmap;

    .line 40
    .line 41
    invoke-direct {p1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lv/VCheckCircle;->d:Landroid/graphics/Canvas;

    .line 45
    .line 46
    :cond_0
    return-void
.end method
