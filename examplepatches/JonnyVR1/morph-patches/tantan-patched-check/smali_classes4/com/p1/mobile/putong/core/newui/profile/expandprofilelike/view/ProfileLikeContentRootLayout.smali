.class public Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:F

.field public c:I

.field public d:Landroid/graphics/Bitmap;

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/Path;

.field public g:Landroid/graphics/PorterDuffXfermode;

.field public h:F

.field public i:Landroid/animation/ArgbEvaluator;

.field public j:Landroid/graphics/Rect;

.field public k:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gra;->z()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->a:Z

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->b:F

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->c:I

    .line 15
    .line 16
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 17
    .line 18
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 19
    .line 20
    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->g:Landroid/graphics/PorterDuffXfermode;

    .line 24
    .line 25
    sget p1, Ll/qa00;->o:I

    .line 26
    .line 27
    int-to-float p1, p1

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->h:F

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->a()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 34
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    invoke-static {}, Ll/gra;->z()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->a:Z

    const/4 p1, 0x0

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->b:F

    const/4 p1, -0x1

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->c:I

    .line 38
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->g:Landroid/graphics/PorterDuffXfermode;

    .line 39
    sget p1, Ll/qa00;->o:I

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->h:F

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 41
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    invoke-static {}, Ll/gra;->z()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->a:Z

    const/4 p1, 0x0

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->b:F

    const/4 p1, -0x1

    .line 44
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->c:I

    .line 45
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->g:Landroid/graphics/PorterDuffXfermode;

    .line 46
    sget p1, Ll/qa00;->o:I

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->h:F

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->e:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Landroid/animation/ArgbEvaluator;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->i:Landroid/animation/ArgbEvaluator;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Landroid/graphics/Path;

    .line 24
    .line 25
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->f:Landroid/graphics/Path;

    .line 29
    .line 30
    new-instance v1, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-direct {v1, v0, v0, v0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->j:Landroid/graphics/Rect;

    .line 36
    .line 37
    new-instance v0, Landroid/graphics/RectF;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->k:Landroid/graphics/RectF;

    .line 44
    .line 45
    return-void
.end method

.method public b(II)V
    .locals 1

    .line 1
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->c:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->d:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->j:Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->d:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p2, v0, v0, p1, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 19
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->a:Z

    .line 7
    .line 8
    const/4 v9, -0x1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    int-to-float v4, v1

    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v5, v1

    .line 21
    const/4 v6, 0x0

    .line 22
    const/16 v7, 0x1f

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    const/4 v3, 0x0

    .line 26
    move-object/from16 v1, p1

    .line 27
    .line 28
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 29
    .line 30
    .line 31
    move-result v10

    .line 32
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->e:Landroid/graphics/Paint;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    int-to-float v4, v1

    .line 43
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    int-to-float v5, v1

    .line 48
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->h:F

    .line 49
    .line 50
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->e:Landroid/graphics/Paint;

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    move v7, v6

    .line 54
    move-object/from16 v1, p1

    .line 55
    .line 56
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    int-to-float v2, v2

    .line 64
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->d:Landroid/graphics/Bitmap;

    .line 65
    .line 66
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    int-to-float v3, v3

    .line 71
    div-float/2addr v2, v3

    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    int-to-float v3, v3

    .line 77
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->d:Landroid/graphics/Bitmap;

    .line 78
    .line 79
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    int-to-float v4, v4

    .line 84
    div-float/2addr v3, v4

    .line 85
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->k:Landroid/graphics/RectF;

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    int-to-float v4, v4

    .line 96
    const/high16 v5, 0x40000000    # 2.0f

    .line 97
    .line 98
    div-float/2addr v4, v5

    .line 99
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->d:Landroid/graphics/Bitmap;

    .line 100
    .line 101
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    int-to-float v6, v6

    .line 106
    mul-float/2addr v6, v2

    .line 107
    div-float/2addr v6, v5

    .line 108
    sub-float/2addr v4, v6

    .line 109
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    int-to-float v6, v6

    .line 114
    div-float/2addr v6, v5

    .line 115
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->d:Landroid/graphics/Bitmap;

    .line 116
    .line 117
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    .line 118
    .line 119
    .line 120
    move-result v7

    .line 121
    int-to-float v7, v7

    .line 122
    mul-float/2addr v7, v2

    .line 123
    div-float/2addr v7, v5

    .line 124
    sub-float/2addr v6, v7

    .line 125
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 126
    .line 127
    .line 128
    move-result v7

    .line 129
    int-to-float v7, v7

    .line 130
    div-float/2addr v7, v5

    .line 131
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->d:Landroid/graphics/Bitmap;

    .line 132
    .line 133
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getWidth()I

    .line 134
    .line 135
    .line 136
    move-result v8

    .line 137
    int-to-float v8, v8

    .line 138
    mul-float/2addr v8, v2

    .line 139
    div-float/2addr v8, v5

    .line 140
    add-float/2addr v7, v8

    .line 141
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 142
    .line 143
    .line 144
    move-result v8

    .line 145
    int-to-float v8, v8

    .line 146
    div-float/2addr v8, v5

    .line 147
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->d:Landroid/graphics/Bitmap;

    .line 148
    .line 149
    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getHeight()I

    .line 150
    .line 151
    .line 152
    move-result v11

    .line 153
    int-to-float v11, v11

    .line 154
    mul-float/2addr v2, v11

    .line 155
    div-float/2addr v2, v5

    .line 156
    add-float/2addr v8, v2

    .line 157
    invoke-virtual {v3, v4, v6, v7, v8}, Landroid/graphics/RectF;->set(FFFF)V

    .line 158
    .line 159
    .line 160
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->d:Landroid/graphics/Bitmap;

    .line 161
    .line 162
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->j:Landroid/graphics/Rect;

    .line 163
    .line 164
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->k:Landroid/graphics/RectF;

    .line 165
    .line 166
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->e:Landroid/graphics/Paint;

    .line 167
    .line 168
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 169
    .line 170
    .line 171
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->e:Landroid/graphics/Paint;

    .line 172
    .line 173
    invoke-virtual {v2, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 174
    .line 175
    .line 176
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->f:Landroid/graphics/Path;

    .line 177
    .line 178
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 179
    .line 180
    .line 181
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->f:Landroid/graphics/Path;

    .line 182
    .line 183
    sget-object v3, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 184
    .line 185
    invoke-virtual {v2, v3}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 186
    .line 187
    .line 188
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->f:Landroid/graphics/Path;

    .line 189
    .line 190
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    add-int/lit8 v2, v2, 0x1

    .line 195
    .line 196
    int-to-float v7, v2

    .line 197
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 198
    .line 199
    .line 200
    move-result v2

    .line 201
    add-int/lit8 v2, v2, 0x1

    .line 202
    .line 203
    int-to-float v8, v2

    .line 204
    sget-object v18, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 205
    .line 206
    const/high16 v5, -0x40800000    # -1.0f

    .line 207
    .line 208
    const/high16 v6, -0x40800000    # -1.0f

    .line 209
    .line 210
    move-object/from16 v9, v18

    .line 211
    .line 212
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 213
    .line 214
    .line 215
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->f:Landroid/graphics/Path;

    .line 216
    .line 217
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    int-to-float v14, v2

    .line 222
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    int-to-float v15, v2

    .line 227
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->h:F

    .line 228
    .line 229
    const/4 v12, 0x0

    .line 230
    const/4 v13, 0x0

    .line 231
    move/from16 v17, v2

    .line 232
    .line 233
    move/from16 v16, v2

    .line 234
    .line 235
    invoke-virtual/range {v11 .. v18}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 236
    .line 237
    .line 238
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->e:Landroid/graphics/Paint;

    .line 239
    .line 240
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->g:Landroid/graphics/PorterDuffXfermode;

    .line 241
    .line 242
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 243
    .line 244
    .line 245
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->f:Landroid/graphics/Path;

    .line 246
    .line 247
    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 248
    .line 249
    .line 250
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->f:Landroid/graphics/Path;

    .line 251
    .line 252
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->e:Landroid/graphics/Paint;

    .line 253
    .line 254
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v1, v10}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 258
    .line 259
    .line 260
    return-void

    .line 261
    :cond_0
    move-object/from16 v1, p1

    .line 262
    .line 263
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->i:Landroid/animation/ArgbEvaluator;

    .line 264
    .line 265
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->b:F

    .line 266
    .line 267
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 268
    .line 269
    .line 270
    move-result-object v4

    .line 271
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->c:I

    .line 272
    .line 273
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    invoke-virtual {v2, v3, v4, v5}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    check-cast v2, Ljava/lang/Integer;

    .line 282
    .line 283
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 284
    .line 285
    .line 286
    move-result v2

    .line 287
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->e:Landroid/graphics/Paint;

    .line 288
    .line 289
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 293
    .line 294
    .line 295
    move-result v2

    .line 296
    int-to-float v3, v2

    .line 297
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 298
    .line 299
    .line 300
    move-result v2

    .line 301
    int-to-float v4, v2

    .line 302
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->h:F

    .line 303
    .line 304
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->e:Landroid/graphics/Paint;

    .line 305
    .line 306
    const/4 v1, 0x0

    .line 307
    const/4 v2, 0x0

    .line 308
    move v6, v5

    .line 309
    move-object/from16 v0, p1

    .line 310
    .line 311
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 312
    .line 313
    .line 314
    return-void
.end method
