.class public Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Z

.field public c:Landroid/graphics/Bitmap;

.field public d:I

.field public e:Landroid/graphics/PorterDuffXfermode;

.field public f:Landroid/graphics/Rect;

.field public g:Landroid/graphics/RectF;

.field public h:Landroid/graphics/Paint;

.field public i:Landroid/graphics/Path;

.field public j:I


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
    const/high16 p1, 0x40800000    # 4.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->a:I

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->b:Z

    .line 14
    .line 15
    sget p1, Ll/abc0;->m:I

    .line 16
    .line 17
    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->d:I

    .line 18
    .line 19
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 20
    .line 21
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 22
    .line 23
    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->e:Landroid/graphics/PorterDuffXfermode;

    .line 27
    .line 28
    const/4 p1, -0x1

    .line 29
    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->j:I

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c()V

    .line 32
    .line 33
    .line 34
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

    .line 35
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x40800000    # 4.0f

    .line 36
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->a:I

    const/4 p1, 0x0

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->b:Z

    .line 38
    sget p1, Ll/abc0;->m:I

    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->d:I

    .line 39
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->e:Landroid/graphics/PorterDuffXfermode;

    const/4 p1, -0x1

    .line 40
    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->j:I

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c()V

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

    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x40800000    # 4.0f

    .line 43
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->a:I

    const/4 p1, 0x0

    .line 44
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->b:Z

    .line 45
    sget p1, Ll/abc0;->m:I

    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->d:I

    .line 46
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->e:Landroid/graphics/PorterDuffXfermode;

    const/4 p1, -0x1

    .line 47
    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->j:I

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 49
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/high16 p1, 0x40800000    # 4.0f

    .line 50
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->a:I

    const/4 p1, 0x0

    .line 51
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->b:Z

    .line 52
    sget p1, Ll/abc0;->m:I

    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->d:I

    .line 53
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->e:Landroid/graphics/PorterDuffXfermode;

    const/4 p1, -0x1

    .line 54
    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->j:I

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c()V

    return-void
.end method


# virtual methods
.method public final c()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->f:Landroid/graphics/Rect;

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/RectF;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->g:Landroid/graphics/RectF;

    .line 16
    .line 17
    new-instance v0, Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->h:Landroid/graphics/Paint;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->h:Landroid/graphics/Paint;

    .line 29
    .line 30
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Landroid/graphics/Path;

    .line 36
    .line 37
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->i:Landroid/graphics/Path;

    .line 41
    .line 42
    return-void
.end method

.method public d(ZI)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->e(ZII)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e(ZII)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->b:Z

    .line 2
    .line 3
    iput p3, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->a:I

    .line 4
    .line 5
    iput p2, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->j:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public f(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->d:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->d:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    :cond_0
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
    iget-boolean v1, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->b:Z

    .line 7
    .line 8
    if-eqz v1, :cond_3

    .line 9
    .line 10
    iget-object v1, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget v2, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->d:I

    .line 19
    .line 20
    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_1
    iget v1, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->j:I

    .line 33
    .line 34
    const/4 v9, -0x1

    .line 35
    if-eq v1, v9, :cond_2

    .line 36
    .line 37
    iget-object v2, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->h:Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-float v4, v1

    .line 47
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    int-to-float v5, v1

    .line 52
    iget v1, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->a:I

    .line 53
    .line 54
    int-to-float v6, v1

    .line 55
    int-to-float v7, v1

    .line 56
    iget-object v8, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->h:Landroid/graphics/Paint;

    .line 57
    .line 58
    const/4 v2, 0x0

    .line 59
    const/4 v3, 0x0

    .line 60
    move-object/from16 v1, p1

    .line 61
    .line 62
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    int-to-float v4, v1

    .line 70
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    int-to-float v5, v1

    .line 75
    const/4 v6, 0x0

    .line 76
    const/16 v7, 0x1f

    .line 77
    .line 78
    const/4 v2, 0x0

    .line 79
    const/4 v3, 0x0

    .line 80
    move-object/from16 v1, p1

    .line 81
    .line 82
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->h:Landroid/graphics/Paint;

    .line 87
    .line 88
    const/4 v4, 0x0

    .line 89
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    int-to-float v6, v3

    .line 101
    iget-object v7, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c:Landroid/graphics/Bitmap;

    .line 102
    .line 103
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    .line 104
    .line 105
    .line 106
    move-result v7

    .line 107
    int-to-float v7, v7

    .line 108
    mul-float/2addr v6, v7

    .line 109
    int-to-float v5, v5

    .line 110
    div-float/2addr v6, v5

    .line 111
    float-to-int v6, v6

    .line 112
    iget-object v7, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c:Landroid/graphics/Bitmap;

    .line 113
    .line 114
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    .line 115
    .line 116
    .line 117
    move-result v7

    .line 118
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    iget-object v7, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->f:Landroid/graphics/Rect;

    .line 123
    .line 124
    iget-object v8, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c:Landroid/graphics/Bitmap;

    .line 125
    .line 126
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    .line 127
    .line 128
    .line 129
    move-result v8

    .line 130
    const/4 v10, 0x0

    .line 131
    invoke-virtual {v7, v10, v10, v6, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 132
    .line 133
    .line 134
    int-to-float v6, v6

    .line 135
    mul-float/2addr v6, v5

    .line 136
    iget-object v7, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c:Landroid/graphics/Bitmap;

    .line 137
    .line 138
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    .line 139
    .line 140
    .line 141
    move-result v7

    .line 142
    int-to-float v7, v7

    .line 143
    div-float/2addr v6, v7

    .line 144
    float-to-int v6, v6

    .line 145
    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    iget-object v6, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->g:Landroid/graphics/RectF;

    .line 150
    .line 151
    int-to-float v3, v3

    .line 152
    const/4 v7, 0x0

    .line 153
    invoke-virtual {v6, v7, v7, v3, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 154
    .line 155
    .line 156
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->c:Landroid/graphics/Bitmap;

    .line 157
    .line 158
    iget-object v5, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->f:Landroid/graphics/Rect;

    .line 159
    .line 160
    iget-object v6, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->g:Landroid/graphics/RectF;

    .line 161
    .line 162
    iget-object v7, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->h:Landroid/graphics/Paint;

    .line 163
    .line 164
    invoke-virtual {v1, v3, v5, v6, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 165
    .line 166
    .line 167
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->h:Landroid/graphics/Paint;

    .line 168
    .line 169
    invoke-virtual {v3, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 170
    .line 171
    .line 172
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->i:Landroid/graphics/Path;

    .line 173
    .line 174
    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 175
    .line 176
    .line 177
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->i:Landroid/graphics/Path;

    .line 178
    .line 179
    sget-object v5, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 180
    .line 181
    invoke-virtual {v3, v5}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 182
    .line 183
    .line 184
    iget-object v6, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->i:Landroid/graphics/Path;

    .line 185
    .line 186
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    add-int/lit8 v3, v3, 0x1

    .line 191
    .line 192
    int-to-float v9, v3

    .line 193
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    add-int/lit8 v3, v3, 0x1

    .line 198
    .line 199
    int-to-float v10, v3

    .line 200
    sget-object v18, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 201
    .line 202
    const/high16 v7, -0x40800000    # -1.0f

    .line 203
    .line 204
    const/high16 v8, -0x40800000    # -1.0f

    .line 205
    .line 206
    move-object/from16 v11, v18

    .line 207
    .line 208
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 209
    .line 210
    .line 211
    iget-object v11, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->i:Landroid/graphics/Path;

    .line 212
    .line 213
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    int-to-float v14, v3

    .line 218
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 219
    .line 220
    .line 221
    move-result v3

    .line 222
    int-to-float v15, v3

    .line 223
    iget v3, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->a:I

    .line 224
    .line 225
    int-to-float v5, v3

    .line 226
    int-to-float v3, v3

    .line 227
    const/4 v12, 0x0

    .line 228
    const/4 v13, 0x0

    .line 229
    move/from16 v17, v3

    .line 230
    .line 231
    move/from16 v16, v5

    .line 232
    .line 233
    invoke-virtual/range {v11 .. v18}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 234
    .line 235
    .line 236
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->h:Landroid/graphics/Paint;

    .line 237
    .line 238
    iget-object v5, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->e:Landroid/graphics/PorterDuffXfermode;

    .line 239
    .line 240
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 241
    .line 242
    .line 243
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->i:Landroid/graphics/Path;

    .line 244
    .line 245
    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 246
    .line 247
    .line 248
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->i:Landroid/graphics/Path;

    .line 249
    .line 250
    iget-object v5, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->h:Landroid/graphics/Paint;

    .line 251
    .line 252
    invoke-virtual {v1, v3, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 253
    .line 254
    .line 255
    iget-object v0, v0, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->h:Landroid/graphics/Paint;

    .line 256
    .line 257
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 261
    .line 262
    .line 263
    :cond_3
    :goto_0
    return-void
.end method
