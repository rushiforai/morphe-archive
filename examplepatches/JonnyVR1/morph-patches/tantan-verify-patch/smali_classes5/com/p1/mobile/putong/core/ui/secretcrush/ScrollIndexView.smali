.class public Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView$a;
    }
.end annotation


# static fields
.field public static l:Ljava/lang/String; = "HEART"

.field public static m:[Ljava/lang/String;

.field public static n:I


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView$a;

.field public b:I

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/widget/FrameLayout;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/ImageView;

.field public g:Landroid/content/Context;

.field public h:F

.field public i:Landroid/graphics/Typeface;

.field public j:Landroid/graphics/Bitmap;

.field public k:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .locals 29

    .line 1
    const-string v27, "Z"

    .line 2
    .line 3
    const-string v28, "#"

    .line 4
    .line 5
    const-string v1, "HEART"

    .line 6
    .line 7
    const-string v2, "A"

    .line 8
    .line 9
    const-string v3, "B"

    .line 10
    .line 11
    const-string v4, "C"

    .line 12
    .line 13
    const-string v5, "D"

    .line 14
    .line 15
    const-string v6, "E"

    .line 16
    .line 17
    const-string v7, "F"

    .line 18
    .line 19
    const-string v8, "G"

    .line 20
    .line 21
    const-string v9, "H"

    .line 22
    .line 23
    const-string v10, "I"

    .line 24
    .line 25
    const-string v11, "J"

    .line 26
    .line 27
    const-string v12, "K"

    .line 28
    .line 29
    const-string v13, "L"

    .line 30
    .line 31
    const-string v14, "M"

    .line 32
    .line 33
    const-string v15, "N"

    .line 34
    .line 35
    const-string v16, "O"

    .line 36
    .line 37
    const-string v17, "P"

    .line 38
    .line 39
    const-string v18, "Q"

    .line 40
    .line 41
    const-string v19, "R"

    .line 42
    .line 43
    const-string v20, "S"

    .line 44
    .line 45
    const-string v21, "T"

    .line 46
    .line 47
    const-string v22, "U"

    .line 48
    .line 49
    const-string v23, "V"

    .line 50
    .line 51
    const-string v24, "W"

    .line 52
    .line 53
    const-string v25, "X"

    .line 54
    .line 55
    const-string v26, "Y"

    .line 56
    .line 57
    filled-new-array/range {v1 .. v28}, [Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->m:[Ljava/lang/String;

    .line 62
    .line 63
    const/high16 v0, 0x41200000    # 10.0f

    .line 64
    .line 65
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    sput v0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->n:I

    .line 70
    .line 71
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->b:I

    .line 6
    .line 7
    new-instance v0, Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->c:Landroid/graphics/Paint;

    .line 13
    .line 14
    new-instance v0, Landroid/graphics/RectF;

    .line 15
    .line 16
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->k:Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->b(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, -0x1

    .line 26
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->b:I

    .line 27
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->c:Landroid/graphics/Paint;

    .line 28
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->k:Landroid/graphics/RectF;

    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->b(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, -0x1

    .line 31
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->b:I

    .line 32
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->c:Landroid/graphics/Paint;

    .line 33
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->k:Landroid/graphics/RectF;

    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->b(Landroid/content/Context;)V

    return-void
.end method

.method public static a(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    invoke-static {p0, p1}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, Ll/u1l0;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 19
    .line 20
    invoke-static {p1, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v1, Landroid/graphics/Canvas;

    .line 25
    .line 26
    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-virtual {p0, v0, v0, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 41
    .line 42
    .line 43
    return-object p1

    .line 44
    :cond_0
    instance-of p1, p0, Landroid/graphics/drawable/VectorDrawable;

    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 57
    .line 58
    invoke-static {p1, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v1, Landroid/graphics/Canvas;

    .line 63
    .line 64
    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    invoke-virtual {p0, v0, v0, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 79
    .line 80
    .line 81
    return-object p1

    .line 82
    :cond_1
    const-string p0, "unsupported drawable type"

    .line 83
    .line 84
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    const/4 p0, 0x0

    .line 88
    return-object p0
.end method


# virtual methods
.method public b(Landroid/content/Context;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->g:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->i:Landroid/graphics/Typeface;

    .line 9
    .line 10
    sget v0, Ll/dbc0;->rs:I

    .line 11
    .line 12
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->a(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->j:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->b:I

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->a:Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView$a;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    int-to-float v3, v3

    .line 18
    div-float v3, p1, v3

    .line 19
    .line 20
    sget-object v4, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->m:[Ljava/lang/String;

    .line 21
    .line 22
    array-length v5, v4

    .line 23
    int-to-float v5, v5

    .line 24
    mul-float/2addr v3, v5

    .line 25
    float-to-int v3, v3

    .line 26
    const/4 v5, 0x4

    .line 27
    const/4 v6, 0x1

    .line 28
    if-eq v0, v6, :cond_4

    .line 29
    .line 30
    const/4 v7, 0x3

    .line 31
    if-eq v0, v7, :cond_4

    .line 32
    .line 33
    if-ltz v3, :cond_5

    .line 34
    .line 35
    array-length v0, v4

    .line 36
    if-ge v3, v0, :cond_5

    .line 37
    .line 38
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    if-eq v1, v3, :cond_0

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->m:[Ljava/lang/String;

    .line 47
    .line 48
    aget-object v0, v0, v3

    .line 49
    .line 50
    invoke-interface {v2, v0}, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView$a;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->d:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->m:[Ljava/lang/String;

    .line 62
    .line 63
    aget-object v0, v0, v3

    .line 64
    .line 65
    sget-object v1, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->l:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->f:Landroid/widget/ImageView;

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->e:Landroid/widget/TextView;

    .line 80
    .line 81
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->e:Landroid/widget/TextView;

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->e:Landroid/widget/TextView;

    .line 94
    .line 95
    sget-object v1, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->m:[Ljava/lang/String;

    .line 96
    .line 97
    aget-object v1, v1, v3

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->d:Landroid/widget/FrameLayout;

    .line 103
    .line 104
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->d:Landroid/widget/FrameLayout;

    .line 108
    .line 109
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->h:F

    .line 110
    .line 111
    const/high16 v2, 0x40000000    # 2.0f

    .line 112
    .line 113
    mul-float v4, v1, v2

    .line 114
    .line 115
    cmpg-float v4, p1, v4

    .line 116
    .line 117
    if-gez v4, :cond_2

    .line 118
    .line 119
    const/4 p1, 0x0

    .line 120
    goto :goto_1

    .line 121
    :cond_2
    mul-float/2addr v1, v2

    .line 122
    sub-float/2addr p1, v1

    .line 123
    :goto_1
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 124
    .line 125
    .line 126
    :cond_3
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->b:I

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_4
    const/4 p1, -0x1

    .line 130
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->b:I

    .line 131
    .line 132
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->d:Landroid/widget/FrameLayout;

    .line 133
    .line 134
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eqz p1, :cond_5

    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->d:Landroid/widget/FrameLayout;

    .line 141
    .line 142
    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 143
    .line 144
    .line 145
    :cond_5
    :goto_2
    return v6
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 13
    .line 14
    div-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    if-ge v0, v1, :cond_0

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    int-to-float v0, v0

    .line 29
    const/high16 v2, 0x3f800000    # 1.0f

    .line 30
    .line 31
    mul-float/2addr v0, v2

    .line 32
    sget-object v2, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->m:[Ljava/lang/String;

    .line 33
    .line 34
    array-length v3, v2

    .line 35
    int-to-float v3, v3

    .line 36
    div-float v3, v0, v3

    .line 37
    .line 38
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->h:F

    .line 39
    .line 40
    const/high16 v4, 0x40000000    # 2.0f

    .line 41
    .line 42
    div-float/2addr v3, v4

    .line 43
    sub-float/2addr v0, v3

    .line 44
    array-length v2, v2

    .line 45
    int-to-float v2, v2

    .line 46
    div-float/2addr v0, v2

    .line 47
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->h:F

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->c:Landroid/graphics/Paint;

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->g:Landroid/content/Context;

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    sget v3, Ll/c9c0;->H1:I

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->c:Landroid/graphics/Paint;

    .line 67
    .line 68
    const/4 v2, 0x1

    .line 69
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->c:Landroid/graphics/Paint;

    .line 73
    .line 74
    const/high16 v2, 0x41200000    # 10.0f

    .line 75
    .line 76
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    int-to-float v2, v2

    .line 81
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    :goto_0
    sget-object v2, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->m:[Ljava/lang/String;

    .line 86
    .line 87
    array-length v3, v2

    .line 88
    if-ge v0, v3, :cond_2

    .line 89
    .line 90
    div-int/lit8 v3, v1, 0x2

    .line 91
    .line 92
    int-to-float v5, v3

    .line 93
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->c:Landroid/graphics/Paint;

    .line 94
    .line 95
    aget-object v2, v2, v0

    .line 96
    .line 97
    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    div-float/2addr v2, v4

    .line 102
    sub-float/2addr v5, v2

    .line 103
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->h:F

    .line 104
    .line 105
    int-to-float v6, v0

    .line 106
    mul-float/2addr v6, v2

    .line 107
    add-float/2addr v6, v2

    .line 108
    sget-object v2, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->m:[Ljava/lang/String;

    .line 109
    .line 110
    aget-object v2, v2, v0

    .line 111
    .line 112
    sget-object v7, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->l:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-eqz v2, :cond_1

    .line 119
    .line 120
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->k:Landroid/graphics/RectF;

    .line 121
    .line 122
    sget v5, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->n:I

    .line 123
    .line 124
    div-int/lit8 v6, v5, 0x2

    .line 125
    .line 126
    sub-int v6, v3, v6

    .line 127
    .line 128
    int-to-float v6, v6

    .line 129
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->h:F

    .line 130
    .line 131
    int-to-float v8, v5

    .line 132
    sub-float v8, v7, v8

    .line 133
    .line 134
    div-int/lit8 v5, v5, 0x2

    .line 135
    .line 136
    add-int/2addr v3, v5

    .line 137
    int-to-float v3, v3

    .line 138
    invoke-virtual {v2, v6, v8, v3, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 139
    .line 140
    .line 141
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->j:Landroid/graphics/Bitmap;

    .line 142
    .line 143
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->k:Landroid/graphics/RectF;

    .line 144
    .line 145
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->c:Landroid/graphics/Paint;

    .line 146
    .line 147
    const/4 v6, 0x0

    .line 148
    invoke-virtual {p1, v2, v6, v3, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->c:Landroid/graphics/Paint;

    .line 153
    .line 154
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->i:Landroid/graphics/Typeface;

    .line 155
    .line 156
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 157
    .line 158
    .line 159
    sget-object v2, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->m:[Ljava/lang/String;

    .line 160
    .line 161
    aget-object v2, v2, v0

    .line 162
    .line 163
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->c:Landroid/graphics/Paint;

    .line 164
    .line 165
    invoke-virtual {p1, v2, v5, v6, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 166
    .line 167
    .line 168
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 169
    .line 170
    goto :goto_0

    .line 171
    :cond_2
    :goto_2
    return-void
.end method

.method public setDialog(Landroid/widget/FrameLayout;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->d:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/TextView;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->e:Landroid/widget/TextView;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroid/widget/ImageView;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->f:Landroid/widget/ImageView;

    .line 20
    .line 21
    return-void
.end method

.method public setOnTouchingLetterChangedListener(Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->a:Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView$a;

    .line 2
    .line 3
    return-void
.end method
