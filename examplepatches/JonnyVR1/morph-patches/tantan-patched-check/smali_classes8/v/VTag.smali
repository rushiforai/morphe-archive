.class public Lv/VTag;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VIcon;

.field public b:Landroid/widget/TextView;

.field public c:Lv/VIcon;

.field public d:Landroid/widget/LinearLayout;

.field public e:Landroid/view/View;

.field public f:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public g:F

.field public h:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public i:Ljava/lang/String;

.field public j:I

.field public k:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public l:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public m:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, v0}, Lv/VTag;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lv/VTag;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lv/VTag;->i(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lv/VTag;->h(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    invoke-static {p0, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Landroid/graphics/Canvas;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Landroid/graphics/Rect;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    const/4 v5, 0x0

    .line 40
    invoke-direct {v2, v5, v5, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 41
    .line 42
    .line 43
    new-instance v3, Landroid/graphics/RectF;

    .line 44
    .line 45
    invoke-direct {v3, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v5, v5, v5, v5}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v3, p2, p2, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 52
    .line 53
    .line 54
    new-instance p2, Landroid/graphics/PorterDuffXfermode;

    .line 55
    .line 56
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 57
    .line 58
    invoke-direct {p2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, p2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p1, v2, v2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 65
    .line 66
    .line 67
    return-object p0
.end method

.method public final b(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p1, p3, p0}, Ll/t43;->a(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    new-instance p1, Landroid/graphics/Canvas;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public c(II)Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-lez p1, :cond_1

    .line 2
    .line 3
    if-gtz p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 7
    .line 8
    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance p2, Landroid/graphics/drawable/BitmapDrawable;

    .line 13
    .line 14
    iget v0, p0, Lv/VTag;->h:I

    .line 15
    .line 16
    const/16 v1, 0xe

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0, v1}, Lv/VTag;->b(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget v1, p0, Lv/VTag;->r:I

    .line 23
    .line 24
    int-to-float v1, v1

    .line 25
    invoke-virtual {p0, v0, v1}, Lv/VTag;->a(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-direct {p2, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 33
    .line 34
    .line 35
    return-object p2

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public d(FI)Landroid/graphics/drawable/Drawable;
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    int-to-float p1, p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public e(FIFI)Landroid/graphics/drawable/Drawable;
    .locals 3
    .param p2    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lv/VTag;->h:I

    .line 7
    .line 8
    const v2, 0x7fffffff

    .line 9
    .line 10
    .line 11
    if-eq v1, v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 26
    .line 27
    .line 28
    :goto_0
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    int-to-float p1, p1

    .line 33
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 34
    .line 35
    .line 36
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, p4}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {v0, p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public final f(FLandroid/graphics/drawable/GradientDrawable$Orientation;IIFI)Landroid/graphics/drawable/Drawable;
    .locals 0
    .param p3    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    filled-new-array {p3, p4}, [I

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    new-instance p4, Landroid/graphics/drawable/GradientDrawable;

    .line 6
    .line 7
    invoke-direct {p4, p2, p3}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    int-to-float p1, p1

    .line 15
    invoke-virtual {p4, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 16
    .line 17
    .line 18
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p6}, Landroid/content/res/Resources;->getColor(I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p4, p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 31
    .line 32
    .line 33
    return-object p4
.end method

.method public final g(I)V
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/VTag;->k()V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :pswitch_0
    invoke-virtual {p0}, Lv/VTag;->r()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :pswitch_1
    invoke-virtual {p0}, Lv/VTag;->q()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_2
    invoke-virtual {p0}, Lv/VTag;->p()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :pswitch_3
    invoke-virtual {p0}, Lv/VTag;->o()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :pswitch_4
    invoke-virtual {p0}, Lv/VTag;->n()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :pswitch_5
    invoke-virtual {p0}, Lv/VTag;->m()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :pswitch_6
    invoke-virtual {p0}, Lv/VTag;->l()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :pswitch_7
    invoke-virtual {p0}, Lv/VTag;->k()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :pswitch_8
    invoke-virtual {p0}, Lv/VTag;->u()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :pswitch_9
    invoke-virtual {p0}, Lv/VTag;->t()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :pswitch_a
    invoke-virtual {p0}, Lv/VTag;->s()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    nop

    .line 53
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getContainer()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContent()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIvLeft()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VTag;->a:Lv/VIcon;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIvRight()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VTag;->c:Lv/VIcon;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/gec0;->w:I

    .line 6
    .line 7
    invoke-virtual {p1, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    sget p1, Ll/vcc0;->P0:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lv/VIcon;

    .line 17
    .line 18
    iput-object p1, p0, Lv/VTag;->a:Lv/VIcon;

    .line 19
    .line 20
    sget p1, Ll/vcc0;->N0:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Landroid/widget/TextView;

    .line 27
    .line 28
    iput-object p1, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 29
    .line 30
    sget p1, Ll/vcc0;->Q0:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lv/VIcon;

    .line 37
    .line 38
    iput-object p1, p0, Lv/VTag;->c:Lv/VIcon;

    .line 39
    .line 40
    sget p1, Ll/vcc0;->M0:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Landroid/widget/LinearLayout;

    .line 47
    .line 48
    iput-object p1, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 49
    .line 50
    sget p1, Ll/vcc0;->O0:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lv/VTag;->e:Landroid/view/View;

    .line 57
    .line 58
    iget-object p1, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 59
    .line 60
    iget-object v0, p0, Lv/VTag;->i:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget p1, p0, Lv/VTag;->k:I

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    if-eqz p1, :cond_0

    .line 69
    .line 70
    iget-object p1, p0, Lv/VTag;->a:Lv/VIcon;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lv/VTag;->a:Lv/VIcon;

    .line 76
    .line 77
    iget v1, p0, Lv/VTag;->k:I

    .line 78
    .line 79
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 80
    .line 81
    .line 82
    :cond_0
    iget p1, p0, Lv/VTag;->l:I

    .line 83
    .line 84
    if-eqz p1, :cond_1

    .line 85
    .line 86
    iget-object p1, p0, Lv/VTag;->c:Lv/VIcon;

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lv/VTag;->c:Lv/VIcon;

    .line 92
    .line 93
    iget v1, p0, Lv/VTag;->l:I

    .line 94
    .line 95
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 96
    .line 97
    .line 98
    :cond_1
    iget p1, p0, Lv/VTag;->j:I

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Lv/VTag;->g(I)V

    .line 101
    .line 102
    .line 103
    iget p1, p0, Lv/VTag;->f:I

    .line 104
    .line 105
    const/4 v1, 0x1

    .line 106
    if-eq p1, v1, :cond_2

    .line 107
    .line 108
    iget-object v1, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 109
    .line 110
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    .line 112
    .line 113
    :cond_2
    iget p1, p0, Lv/VTag;->g:F

    .line 114
    .line 115
    const/high16 v1, -0x40800000    # -1.0f

    .line 116
    .line 117
    cmpl-float v1, p1, v1

    .line 118
    .line 119
    if-eqz v1, :cond_3

    .line 120
    .line 121
    iget-object p0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 122
    .line 123
    invoke-virtual {p0, v0, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 124
    .line 125
    .line 126
    :cond_3
    return-void
.end method

.method public final i(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object v0, Ll/hhc0;->Z4:[I

    .line 5
    .line 6
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget p2, Ll/hhc0;->c5:I

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Lv/VTag;->i:Ljava/lang/String;

    .line 17
    .line 18
    sget p2, Ll/hhc0;->h5:I

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iput p2, p0, Lv/VTag;->j:I

    .line 26
    .line 27
    sget p2, Ll/hhc0;->b5:I

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iput p2, p0, Lv/VTag;->f:I

    .line 35
    .line 36
    sget p2, Ll/hhc0;->a5:I

    .line 37
    .line 38
    const/high16 v1, -0x40800000    # -1.0f

    .line 39
    .line 40
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iput p2, p0, Lv/VTag;->g:F

    .line 45
    .line 46
    sget p2, Ll/hhc0;->d5:I

    .line 47
    .line 48
    const v1, 0x7fffffff

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    iput p2, p0, Lv/VTag;->h:I

    .line 56
    .line 57
    sget p2, Ll/hhc0;->f5:I

    .line 58
    .line 59
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    iput p2, p0, Lv/VTag;->k:I

    .line 64
    .line 65
    sget p2, Ll/hhc0;->g5:I

    .line 66
    .line 67
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    iput p2, p0, Lv/VTag;->l:I

    .line 72
    .line 73
    sget p2, Ll/hhc0;->e5:I

    .line 74
    .line 75
    const/4 v0, -0x1

    .line 76
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    iput p2, p0, Lv/VTag;->m:I

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public j(Lv/VIcon;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VTag;->a:Lv/VIcon;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lv/VTag;->c:Lv/VIcon;

    .line 6
    .line 7
    if-eq p1, p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p1, p2}, Lv/VIcon;->setIconStyle(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final k()V
    .locals 5

    .line 1
    const/16 v0, 0x28

    .line 2
    .line 3
    iput v0, p0, Lv/VTag;->n:I

    .line 4
    .line 5
    const/16 v1, 0xc

    .line 6
    .line 7
    iput v1, p0, Lv/VTag;->o:I

    .line 8
    .line 9
    iput v1, p0, Lv/VTag;->p:I

    .line 10
    .line 11
    iput v1, p0, Lv/VTag;->q:I

    .line 12
    .line 13
    const/16 v1, 0x10

    .line 14
    .line 15
    iput v1, p0, Lv/VTag;->r:I

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    iput v1, p0, Lv/VTag;->s:I

    .line 19
    .line 20
    int-to-float v0, v0

    .line 21
    invoke-virtual {p0, v0}, Lv/VTag;->setContainerHeight(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    iget v1, p0, Lv/VTag;->o:I

    .line 27
    .line 28
    iget v2, p0, Lv/VTag;->p:I

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1, v2}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget v2, Ll/z8c0;->d:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 49
    .line 50
    iget v1, p0, Lv/VTag;->q:I

    .line 51
    .line 52
    int-to-float v1, v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 57
    .line 58
    iget v1, p0, Lv/VTag;->r:I

    .line 59
    .line 60
    int-to-float v1, v1

    .line 61
    sget v2, Ll/z8c0;->w:I

    .line 62
    .line 63
    iget v3, p0, Lv/VTag;->s:I

    .line 64
    .line 65
    int-to-float v3, v3

    .line 66
    sget v4, Ll/z8c0;->s:I

    .line 67
    .line 68
    invoke-virtual {p0, v1, v2, v3, v4}, Lv/VTag;->e(FIFI)Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final l()V
    .locals 5

    .line 1
    const/16 v0, 0x28

    .line 2
    .line 3
    iput v0, p0, Lv/VTag;->n:I

    .line 4
    .line 5
    const/16 v1, 0xc

    .line 6
    .line 7
    iput v1, p0, Lv/VTag;->q:I

    .line 8
    .line 9
    const/16 v2, 0x10

    .line 10
    .line 11
    iput v2, p0, Lv/VTag;->r:I

    .line 12
    .line 13
    const/4 v2, 0x3

    .line 14
    iput v2, p0, Lv/VTag;->s:I

    .line 15
    .line 16
    int-to-float v0, v0

    .line 17
    invoke-virtual {p0, v0}, Lv/VTag;->setContainerHeight(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lv/VTag;->a:Lv/VIcon;

    .line 21
    .line 22
    const/16 v2, 0xa

    .line 23
    .line 24
    const/4 v3, 0x4

    .line 25
    invoke-virtual {p0, v0, v2, v3}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {p0, v0, v2, v1}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Ll/z8c0;->d:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 50
    .line 51
    iget v1, p0, Lv/VTag;->q:I

    .line 52
    .line 53
    int-to-float v1, v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    iget v1, p0, Lv/VTag;->r:I

    .line 60
    .line 61
    int-to-float v1, v1

    .line 62
    sget v2, Ll/z8c0;->w:I

    .line 63
    .line 64
    iget v3, p0, Lv/VTag;->s:I

    .line 65
    .line 66
    int-to-float v3, v3

    .line 67
    sget v4, Ll/z8c0;->s:I

    .line 68
    .line 69
    invoke-virtual {p0, v1, v2, v3, v4}, Lv/VTag;->e(FIFI)Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final m()V
    .locals 5

    .line 1
    const/16 v0, 0x1c

    .line 2
    .line 3
    iput v0, p0, Lv/VTag;->n:I

    .line 4
    .line 5
    const/16 v1, 0xa

    .line 6
    .line 7
    iput v1, p0, Lv/VTag;->o:I

    .line 8
    .line 9
    iput v1, p0, Lv/VTag;->p:I

    .line 10
    .line 11
    const/16 v1, 0xc

    .line 12
    .line 13
    iput v1, p0, Lv/VTag;->q:I

    .line 14
    .line 15
    iput v1, p0, Lv/VTag;->r:I

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    iput v1, p0, Lv/VTag;->s:I

    .line 19
    .line 20
    int-to-float v0, v0

    .line 21
    invoke-virtual {p0, v0}, Lv/VTag;->setContainerHeight(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    iget v1, p0, Lv/VTag;->o:I

    .line 27
    .line 28
    iget v2, p0, Lv/VTag;->p:I

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1, v2}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget v2, Ll/z8c0;->d:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 49
    .line 50
    iget v1, p0, Lv/VTag;->q:I

    .line 51
    .line 52
    int-to-float v1, v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 57
    .line 58
    iget v1, p0, Lv/VTag;->r:I

    .line 59
    .line 60
    int-to-float v1, v1

    .line 61
    sget v2, Ll/z8c0;->w:I

    .line 62
    .line 63
    iget v3, p0, Lv/VTag;->s:I

    .line 64
    .line 65
    int-to-float v3, v3

    .line 66
    sget v4, Ll/z8c0;->s:I

    .line 67
    .line 68
    invoke-virtual {p0, v1, v2, v3, v4}, Lv/VTag;->e(FIFI)Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final n()V
    .locals 5

    .line 1
    const/16 v0, 0x1c

    .line 2
    .line 3
    iput v0, p0, Lv/VTag;->n:I

    .line 4
    .line 5
    const/16 v1, 0xc

    .line 6
    .line 7
    iput v1, p0, Lv/VTag;->q:I

    .line 8
    .line 9
    iput v1, p0, Lv/VTag;->r:I

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    iput v1, p0, Lv/VTag;->s:I

    .line 13
    .line 14
    int-to-float v0, v0

    .line 15
    invoke-virtual {p0, v0}, Lv/VTag;->setContainerHeight(F)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lv/VTag;->a:Lv/VIcon;

    .line 19
    .line 20
    const/16 v1, 0x8

    .line 21
    .line 22
    const/4 v2, 0x4

    .line 23
    invoke-virtual {p0, v0, v1, v2}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    const/16 v2, 0xa

    .line 30
    .line 31
    invoke-virtual {p0, v0, v1, v2}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lv/VTag;->a:Lv/VIcon;

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-virtual {p0, v0, v1}, Lv/VTag;->j(Lv/VIcon;I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget v2, Ll/z8c0;->d:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 56
    .line 57
    iget v1, p0, Lv/VTag;->q:I

    .line 58
    .line 59
    int-to-float v1, v1

    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    iget v1, p0, Lv/VTag;->r:I

    .line 66
    .line 67
    int-to-float v1, v1

    .line 68
    sget v2, Ll/z8c0;->w:I

    .line 69
    .line 70
    iget v3, p0, Lv/VTag;->s:I

    .line 71
    .line 72
    int-to-float v3, v3

    .line 73
    sget v4, Ll/z8c0;->s:I

    .line 74
    .line 75
    invoke-virtual {p0, v1, v2, v3, v4}, Lv/VTag;->e(FIFI)Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final o()V
    .locals 9

    .line 1
    const/16 v0, 0x18

    .line 2
    .line 3
    iput v0, p0, Lv/VTag;->n:I

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    iput v1, p0, Lv/VTag;->o:I

    .line 8
    .line 9
    iput v1, p0, Lv/VTag;->p:I

    .line 10
    .line 11
    const/16 v1, 0xc

    .line 12
    .line 13
    iput v1, p0, Lv/VTag;->q:I

    .line 14
    .line 15
    const/4 v1, 0x6

    .line 16
    iput v1, p0, Lv/VTag;->r:I

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput v1, p0, Lv/VTag;->s:I

    .line 20
    .line 21
    int-to-float v0, v0

    .line 22
    invoke-virtual {p0, v0}, Lv/VTag;->setContainerHeight(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 26
    .line 27
    iget v1, p0, Lv/VTag;->o:I

    .line 28
    .line 29
    iget v2, p0, Lv/VTag;->p:I

    .line 30
    .line 31
    invoke-virtual {p0, v0, v1, v2}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Ll/z8c0;->w:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 50
    .line 51
    iget v1, p0, Lv/VTag;->q:I

    .line 52
    .line 53
    int-to-float v1, v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    iget v1, p0, Lv/VTag;->r:I

    .line 60
    .line 61
    int-to-float v3, v1

    .line 62
    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    sget v2, Ll/z8c0;->t:I

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    sget v2, Ll/z8c0;->u:I

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    iget v1, p0, Lv/VTag;->s:I

    .line 85
    .line 86
    int-to-float v7, v1

    .line 87
    sget v8, Ll/z8c0;->s:I

    .line 88
    .line 89
    move-object v2, p0

    .line 90
    invoke-virtual/range {v2 .. v8}, Lv/VTag;->f(FLandroid/graphics/drawable/GradientDrawable$Orientation;IIFI)Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final p()V
    .locals 3

    .line 1
    const/16 v0, 0x18

    .line 2
    .line 3
    iput v0, p0, Lv/VTag;->n:I

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    iput v1, p0, Lv/VTag;->o:I

    .line 8
    .line 9
    iput v1, p0, Lv/VTag;->p:I

    .line 10
    .line 11
    const/16 v1, 0xc

    .line 12
    .line 13
    iput v1, p0, Lv/VTag;->q:I

    .line 14
    .line 15
    const/4 v1, 0x6

    .line 16
    iput v1, p0, Lv/VTag;->r:I

    .line 17
    .line 18
    int-to-float v0, v0

    .line 19
    invoke-virtual {p0, v0}, Lv/VTag;->setContainerHeight(F)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 23
    .line 24
    iget v1, p0, Lv/VTag;->o:I

    .line 25
    .line 26
    iget v2, p0, Lv/VTag;->p:I

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1, v2}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget v2, Ll/z8c0;->w:I

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 47
    .line 48
    iget v1, p0, Lv/VTag;->q:I

    .line 49
    .line 50
    int-to-float v1, v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    new-instance v1, Lv/VTag$a;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Lv/VTag$a;-><init>(Lv/VTag;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final q()V
    .locals 5

    .line 1
    const/16 v0, 0x18

    .line 2
    .line 3
    iput v0, p0, Lv/VTag;->n:I

    .line 4
    .line 5
    const/16 v1, 0xc

    .line 6
    .line 7
    iput v1, p0, Lv/VTag;->q:I

    .line 8
    .line 9
    const/4 v1, 0x6

    .line 10
    iput v1, p0, Lv/VTag;->r:I

    .line 11
    .line 12
    int-to-float v0, v0

    .line 13
    invoke-virtual {p0, v0}, Lv/VTag;->setContainerHeight(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lv/VTag;->e:Landroid/view/View;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lv/VTag;->e:Landroid/view/View;

    .line 23
    .line 24
    const/high16 v3, 0x40400000    # 3.0f

    .line 25
    .line 26
    iget v4, p0, Lv/VTag;->m:I

    .line 27
    .line 28
    invoke-virtual {p0, v3, v4}, Lv/VTag;->d(FI)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lv/VTag;->e:Landroid/view/View;

    .line 36
    .line 37
    const/4 v3, 0x3

    .line 38
    invoke-virtual {p0, v0, v1, v3}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 42
    .line 43
    const/16 v1, 0x8

    .line 44
    .line 45
    invoke-virtual {p0, v0, v2, v1}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    sget v2, Ll/z8c0;->w:I

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 64
    .line 65
    iget v1, p0, Lv/VTag;->q:I

    .line 66
    .line 67
    int-to-float v1, v1

    .line 68
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 72
    .line 73
    new-instance v1, Lv/VTag$b;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Lv/VTag$b;-><init>(Lv/VTag;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final r()V
    .locals 3

    .line 1
    const/16 v0, 0x18

    .line 2
    .line 3
    iput v0, p0, Lv/VTag;->n:I

    .line 4
    .line 5
    const/16 v1, 0xc

    .line 6
    .line 7
    iput v1, p0, Lv/VTag;->q:I

    .line 8
    .line 9
    const/4 v1, 0x6

    .line 10
    iput v1, p0, Lv/VTag;->r:I

    .line 11
    .line 12
    int-to-float v0, v0

    .line 13
    invoke-virtual {p0, v0}, Lv/VTag;->setContainerHeight(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lv/VTag;->a:Lv/VIcon;

    .line 17
    .line 18
    const/4 v2, 0x4

    .line 19
    invoke-virtual {p0, v0, v1, v2}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    const/16 v2, 0x8

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1, v2}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lv/VTag;->a:Lv/VIcon;

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {p0, v0, v1}, Lv/VTag;->j(Lv/VIcon;I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v2, Ll/z8c0;->w:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 52
    .line 53
    iget v1, p0, Lv/VTag;->q:I

    .line 54
    .line 55
    int-to-float v1, v1

    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    new-instance v1, Lv/VTag$c;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Lv/VTag$c;-><init>(Lv/VTag;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final s()V
    .locals 5

    .line 1
    const/16 v0, 0x2c

    .line 2
    .line 3
    iput v0, p0, Lv/VTag;->n:I

    .line 4
    .line 5
    const/16 v1, 0x10

    .line 6
    .line 7
    iput v1, p0, Lv/VTag;->o:I

    .line 8
    .line 9
    iput v1, p0, Lv/VTag;->p:I

    .line 10
    .line 11
    const/16 v2, 0xe

    .line 12
    .line 13
    iput v2, p0, Lv/VTag;->q:I

    .line 14
    .line 15
    iput v1, p0, Lv/VTag;->r:I

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    iput v1, p0, Lv/VTag;->s:I

    .line 19
    .line 20
    int-to-float v0, v0

    .line 21
    invoke-virtual {p0, v0}, Lv/VTag;->setContainerHeight(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    iget v1, p0, Lv/VTag;->o:I

    .line 27
    .line 28
    iget v2, p0, Lv/VTag;->p:I

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1, v2}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget v2, Ll/z8c0;->d:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 49
    .line 50
    iget v1, p0, Lv/VTag;->q:I

    .line 51
    .line 52
    int-to-float v1, v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 57
    .line 58
    iget v1, p0, Lv/VTag;->r:I

    .line 59
    .line 60
    int-to-float v1, v1

    .line 61
    sget v2, Ll/z8c0;->w:I

    .line 62
    .line 63
    iget v3, p0, Lv/VTag;->s:I

    .line 64
    .line 65
    int-to-float v3, v3

    .line 66
    sget v4, Ll/z8c0;->s:I

    .line 67
    .line 68
    invoke-virtual {p0, v1, v2, v3, v4}, Lv/VTag;->e(FIFI)Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public setBgColor(I)V
    .locals 3
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v1, v0, Landroid/graphics/drawable/GradientDrawable;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move-object v1, v0

    .line 16
    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public setContainerHeight(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 14
    .line 15
    iget-object p0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTextColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final t()V
    .locals 4

    .line 1
    const/16 v0, 0x2c

    .line 2
    .line 3
    iput v0, p0, Lv/VTag;->n:I

    .line 4
    .line 5
    const/16 v1, 0x10

    .line 6
    .line 7
    iput v1, p0, Lv/VTag;->o:I

    .line 8
    .line 9
    iput v1, p0, Lv/VTag;->p:I

    .line 10
    .line 11
    const/16 v2, 0xe

    .line 12
    .line 13
    iput v2, p0, Lv/VTag;->q:I

    .line 14
    .line 15
    iput v1, p0, Lv/VTag;->r:I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput v1, p0, Lv/VTag;->s:I

    .line 19
    .line 20
    int-to-float v0, v0

    .line 21
    invoke-virtual {p0, v0}, Lv/VTag;->setContainerHeight(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    iget v1, p0, Lv/VTag;->o:I

    .line 27
    .line 28
    iget v2, p0, Lv/VTag;->p:I

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1, v2}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget v2, Ll/z8c0;->w:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 49
    .line 50
    iget v1, p0, Lv/VTag;->q:I

    .line 51
    .line 52
    int-to-float v1, v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 57
    .line 58
    iget v1, p0, Lv/VTag;->r:I

    .line 59
    .line 60
    int-to-float v1, v1

    .line 61
    sget v2, Ll/z8c0;->t:I

    .line 62
    .line 63
    iget v3, p0, Lv/VTag;->s:I

    .line 64
    .line 65
    int-to-float v3, v3

    .line 66
    invoke-virtual {p0, v1, v2, v3, v2}, Lv/VTag;->e(FIFI)Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final u()V
    .locals 4

    .line 1
    const/16 v0, 0x2c

    .line 2
    .line 3
    iput v0, p0, Lv/VTag;->n:I

    .line 4
    .line 5
    const/16 v1, 0x10

    .line 6
    .line 7
    iput v1, p0, Lv/VTag;->r:I

    .line 8
    .line 9
    const/16 v2, 0xe

    .line 10
    .line 11
    iput v2, p0, Lv/VTag;->q:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    iput v2, p0, Lv/VTag;->s:I

    .line 15
    .line 16
    int-to-float v0, v0

    .line 17
    invoke-virtual {p0, v0}, Lv/VTag;->setContainerHeight(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 21
    .line 22
    const/4 v3, 0x6

    .line 23
    invoke-virtual {p0, v0, v1, v3}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lv/VTag;->c:Lv/VIcon;

    .line 27
    .line 28
    const/16 v1, 0xc

    .line 29
    .line 30
    invoke-virtual {p0, v0, v2, v1}, Lv/VTag;->v(Landroid/view/View;II)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget v2, Ll/z8c0;->F:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 49
    .line 50
    iget v1, p0, Lv/VTag;->q:I

    .line 51
    .line 52
    int-to-float v1, v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lv/VTag;->d:Landroid/widget/LinearLayout;

    .line 57
    .line 58
    iget v1, p0, Lv/VTag;->r:I

    .line 59
    .line 60
    int-to-float v1, v1

    .line 61
    sget v2, Ll/z8c0;->t:I

    .line 62
    .line 63
    iget v3, p0, Lv/VTag;->s:I

    .line 64
    .line 65
    int-to-float v3, v3

    .line 66
    invoke-virtual {p0, v1, v2, v3, v2}, Lv/VTag;->e(FIFI)Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public v(Landroid/view/View;II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VTag;->a:Lv/VIcon;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lv/VTag;->b:Landroid/widget/TextView;

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lv/VTag;->c:Lv/VIcon;

    .line 10
    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lv/VTag;->e:Landroid/view/View;

    .line 14
    .line 15
    if-eq p1, p0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 23
    .line 24
    int-to-float p2, p2

    .line 25
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 30
    .line 31
    .line 32
    int-to-float p2, p3

    .line 33
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
