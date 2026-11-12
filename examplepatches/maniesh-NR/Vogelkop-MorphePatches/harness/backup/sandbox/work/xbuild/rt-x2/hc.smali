.class public final Lhc;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x3

    iput-byte v0, p0, Lhc;->a:B

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lhc;->b:Ljava/lang/Object;

    new-instance p0, Landroid/graphics/RectF;

    new-instance p0, Landroid/graphics/Paint;

    new-instance p0, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroid/graphics/Paint;-><init>(I)V

    new-instance p0, Landroid/graphics/Matrix;

    return-void
.end method

.method public constructor <init>(Lfr8;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lhc;->a:B

    .line 27
    iput-object p1, p0, Lhc;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 26
    iput-byte p2, p0, Lhc;->a:B

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput-object p1, p0, Lhc;->b:Ljava/lang/Object;

    return-void
.end method

.method private final a(Landroid/graphics/Canvas;)V
    .registers 2

    return-void
.end method

.method private final b(I)V
    .registers 2

    return-void
.end method

.method private final c(I)V
    .registers 2

    return-void
.end method

.method private final d(I)V
    .registers 2

    return-void
.end method

.method private final e(I)V
    .registers 2

    return-void
.end method

.method private final f(Landroid/graphics/ColorFilter;)V
    .registers 2

    return-void
.end method

.method private final g(Landroid/graphics/ColorFilter;)V
    .registers 2

    return-void
.end method

.method private final h(Landroid/graphics/ColorFilter;)V
    .registers 2

    return-void
.end method

.method private final i(Landroid/graphics/ColorFilter;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 8

    iget-byte v0, p0, Lhc;->a:B

    iget-object p0, p0, Lhc;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_84

    return-void

    :pswitch_8
    check-cast p0, Ljva;

    invoke-interface {p0, p1}, Ljva;->c(Landroid/graphics/Canvas;)V

    return-void

    :pswitch_e
    check-cast p0, Lfr8;

    iget v0, p0, Lfr8;->g:I

    iget-object v1, p0, Lfr8;->d:Landroid/graphics/Rect;

    iget v2, p0, Lfr8;->c:I

    if-eq v0, v2, :cond_1a

    const/4 v3, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v3, 0x0

    :goto_1b
    if-eqz v3, :cond_2a

    int-to-float v0, v0

    int-to-float v4, v2

    div-float/2addr v0, v4

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    int-to-float v2, v2

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v2, v4

    invoke-virtual {p1, v0, v0, v2, v2}, Landroid/graphics/Canvas;->scale(FFFF)V

    :cond_2a
    iget-boolean v0, p0, Lfr8;->l:Z

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lfr8;->a:Lgjf;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v2

    iget v4, p0, Lfr8;->b:I

    invoke-virtual {v0, v2, v4}, Lgjf;->b(II)Lbcd;

    move-result-object v0

    iget v2, v1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    const/4 v4, -0x1

    const v5, 0x3ec28f5c    # 0.38f

    invoke-static {v5, v4}, Lp37;->j0(FI)I

    move-result v4

    invoke-virtual {v0, p1, v2, v1, v4}, Lbcd;->b(Landroid/graphics/Canvas;FFI)V

    goto :goto_4f

    :cond_4c
    invoke-virtual {p0, p1, v1}, Lfr8;->n(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    :goto_4f
    iget-object v0, p0, Lfr8;->p:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_5d

    iget-object v1, p0, Lfr8;->e:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object p0, p0, Lfr8;->p:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_5d
    if-eqz v3, :cond_62

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_62
    return-void

    :pswitch_63
    check-cast p0, Landroidx/appcompat/widget/ActionBarContainer;

    iget-boolean v0, p0, Landroidx/appcompat/widget/ActionBarContainer;->g:Z

    if-eqz v0, :cond_71

    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarContainer;->f:Landroid/graphics/drawable/Drawable;

    if-eqz p0, :cond_83

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_83

    :cond_71
    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarContainer;->d:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_78

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_78
    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarContainer;->e:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_83

    iget-boolean p0, p0, Landroidx/appcompat/widget/ActionBarContainer;->h:Z

    if-eqz p0, :cond_83

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_83
    :goto_83
    return-void

    :pswitch_data_84
    .packed-switch 0x0
        :pswitch_63
        :pswitch_e
        :pswitch_8
    .end packed-switch
.end method

.method public final getIntrinsicHeight()I
    .registers 2

    iget-byte v0, p0, Lhc;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lhc;->b:Ljava/lang/Object;

    check-cast p0, Lfr8;

    iget p0, p0, Lfr8;->g:I

    return p0

    nop

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final getIntrinsicWidth()I
    .registers 2

    iget-byte v0, p0, Lhc;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lhc;->b:Ljava/lang/Object;

    check-cast p0, Lfr8;

    iget p0, p0, Lfr8;->g:I

    return p0

    nop

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final getOpacity()I
    .registers 1

    iget-byte p0, p0, Lhc;->a:B

    packed-switch p0, :pswitch_data_a

    :pswitch_5
    const/4 p0, -0x3

    return p0

    :pswitch_7
    const/4 p0, 0x0

    return p0

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_7
        :pswitch_5
        :pswitch_7
    .end packed-switch
.end method

.method public final getOutline(Landroid/graphics/Outline;)V
    .registers 4

    iget-byte v0, p0, Lhc;->a:B

    packed-switch v0, :pswitch_data_22

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->getOutline(Landroid/graphics/Outline;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Lhc;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/appcompat/widget/ActionBarContainer;

    iget-boolean v0, p0, Landroidx/appcompat/widget/ActionBarContainer;->g:Z

    iget-object v1, p0, Landroidx/appcompat/widget/ActionBarContainer;->d:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1b

    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarContainer;->f:Landroid/graphics/drawable/Drawable;

    if-eqz p0, :cond_20

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->getOutline(Landroid/graphics/Outline;)V

    goto :goto_20

    :cond_1b
    if-eqz v1, :cond_20

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->getOutline(Landroid/graphics/Outline;)V

    :cond_20
    :goto_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final setAlpha(I)V
    .registers 2

    iget-byte p0, p0, Lhc;->a:B

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    iget-byte p0, p0, Lhc;->a:B

    return-void
.end method
