.class public abstract Lfr8;
.super Landroid/widget/TextView;
.source "SourceFile"


# instance fields
.field public final a:Lgjf;

.field public final b:I

.field public final c:I

.field public final d:Landroid/graphics/Rect;

.field public final e:Landroid/graphics/Rect;

.field public f:I

.field public g:I

.field public h:Lvr8;

.field public i:Lo8f;

.field public j:I

.field public k:I

.field public l:Z

.field public m:Z

.field public n:Lds8;

.field public o:I

.field public p:Landroid/graphics/drawable/Drawable;

.field public final q:Lzu4;

.field public final r:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltta;Lvr8;)V
    .registers 14

    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lfr8;->l:Z

    invoke-static {p1}, Lgjf;->a(Landroid/content/Context;)Lgjf;

    move-result-object v1

    iput-object v1, p0, Lfr8;->a:Lgjf;

    const v1, 0x7f04067b

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lfr8;->b:I

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    const v1, 0x7f150288

    invoke-static {p0, v1}, Lxf8;->r0(Landroid/widget/TextView;I)V

    iget v1, p2, Ltta;->a:I

    iget v3, p2, Ltta;->g:I

    iput v1, p0, Lfr8;->c:I

    iget v4, p0, Lfr8;->g:I

    if-eq v4, v1, :cond_36

    iput v1, p0, Lfr8;->g:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_36
    iget v1, p2, Ltta;->e:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v4, 0x7f070219

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, v2, p1, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    new-instance v4, Landroid/graphics/Rect;

    iget v5, p2, Ltta;->c:I

    iget v6, p0, Lfr8;->g:I

    shl-int/2addr p1, v0

    add-int/2addr v6, p1

    invoke-direct {v4, v2, v2, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v4, p0, Lfr8;->r:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/Rect;

    iget v4, p0, Lfr8;->g:I

    invoke-direct {p1, v2, v2, v4, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p1, p0, Lfr8;->d:Landroid/graphics/Rect;

    iget p1, p0, Lfr8;->g:I

    int-to-double v6, p1

    const-wide v8, 0x4003333333333333L    # 2.4

    div-double/2addr v6, v8

    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    add-double/2addr v6, v8

    double-to-int v4, v6

    div-int/lit8 v4, v4, 0x2

    div-int/lit8 p1, p1, 0x8

    invoke-static {p0}, Lcs5;->L(Landroid/view/View;)I

    move-result v6

    if-ne v6, v0, :cond_75

    move v6, p1

    goto :goto_78

    :cond_75
    iget v6, p0, Lfr8;->g:I

    sub-int/2addr v6, p1

    :goto_78
    iget v7, p0, Lfr8;->g:I

    sub-int/2addr v7, p1

    new-instance p1, Landroid/graphics/Rect;

    sub-int v8, v6, v4

    sub-int v9, v7, v4

    add-int/2addr v6, v4

    add-int/2addr v7, v4

    invoke-direct {p1, v8, v9, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p1, p0, Lfr8;->e:Landroid/graphics/Rect;

    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setLines(I)V

    if-ne v3, v0, :cond_93

    invoke-virtual {p0}, Landroid/widget/TextView;->setSingleLine()V

    :cond_93
    iput-object p3, p0, Lfr8;->h:Lvr8;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    iget p1, p2, Ltta;->d:I

    int-to-float p1, p1

    invoke-virtual {p0, v2, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    sget-object p1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    new-instance p1, Lhc;

    invoke-direct {p1, p0}, Lhc;-><init>(Lfr8;)V

    const/4 p3, 0x0

    invoke-virtual {p0, p3, p1, p3, p3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/view/View;->setTextAlignment(I)V

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p1

    iget v0, p0, Lfr8;->g:I

    add-int/2addr p1, v0

    add-int/2addr p1, v1

    invoke-virtual {p0}, Landroid/widget/TextView;->getLineHeight()I

    move-result v0

    add-int/2addr v0, p1

    iget p1, p2, Ltta;->f:I

    add-int/2addr v0, p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result p1

    add-int/2addr p1, v0

    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {p2, v5, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lpc5;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_e0

    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_e0
    invoke-virtual {p1, p0}, Lpc5;->a(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 p2, 0x40800000    # 4.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p2, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    new-instance v0, Luf9;

    const v1, 0x7f040479

    invoke-direct {v0, p1, p3, p2, v1}, Luf9;-><init>(Landroid/content/Context;Lsll;II)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Lzu4;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const p3, 0x7f0809c4

    invoke-static {p3, p2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-direct {p1, p2}, Lzu4;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object p1, p0, Lfr8;->q:Lzu4;

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public b(Lvr8;Z)V
    .registers 4

    iget p2, p0, Lfr8;->b:I

    const/4 v0, 0x2

    if-ne p2, v0, :cond_8

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_8
    iget-object p2, p1, Lvr8;->b:Llaj;

    invoke-virtual {p2, p0}, Llaj;->a(Landroid/widget/TextView;)V

    iget-object p2, p1, Lvr8;->d:Lcxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p2

    iput p2, p0, Lfr8;->f:I

    iget-object p1, p1, Lvr8;->a:Lcxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcxh;->a(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public d()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 3

    iget-object v0, p0, Lfr8;->i:Lo8f;

    if-eqz v0, :cond_8

    invoke-virtual {v0, p0}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :cond_8
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final e()Ld03;
    .registers 6

    new-instance v0, Lecd;

    iget-object v1, p0, Lfr8;->a:Lgjf;

    iget v2, p0, Lfr8;->b:I

    invoke-direct {v0, v1, v2}, Lecd;-><init>(Lgjf;I)V

    iget-object v3, p0, Lfr8;->h:Lvr8;

    iget-object v3, v3, Lvr8;->e:Lcxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcxh;->a(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v0, v3}, Lecd;->setTint(I)V

    new-instance v3, Lecd;

    invoke-direct {v3, v1, v2}, Lecd;-><init>(Lgjf;I)V

    sget v1, Ld03;->e:I

    invoke-static {v0, p0, v3}, Lydp;->s(Landroid/graphics/drawable/Drawable;Landroid/view/View;Landroid/graphics/drawable/Drawable;)Ld03;

    move-result-object p0

    return-object p0
.end method

.method public final f()V
    .registers 1

    invoke-virtual {p0}, Lfr8;->performClick()Z

    return-void
.end method

.method public g(Landroid/graphics/Canvas;)V
    .registers 8

    invoke-virtual {p0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getShadowColor()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/TextView;->getShadowRadius()F

    move-result v3

    invoke-virtual {p0}, Landroid/widget/TextView;->getShadowDx()F

    move-result v4

    invoke-virtual {p0}, Landroid/widget/TextView;->getShadowDy()F

    move-result v5

    invoke-virtual {p0, v3, v4, v5, v1}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    invoke-virtual {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getShadowRadius()F

    move-result p1

    invoke-virtual {p0}, Landroid/widget/TextView;->getShadowDx()F

    move-result v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getShadowDy()F

    move-result v1

    invoke-virtual {p0, p1, v0, v1, v2}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    return-void
.end method

.method public getView()Landroid/view/View;
    .registers 1

    return-object p0
.end method

.method public final hasOverlappingRendering()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final i(Landroid/graphics/Rect;)V
    .registers 6

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iget v2, p0, Lfr8;->g:I

    const/4 v3, 0x2

    invoke-static {v0, v2, v3, v1}, Lz1m;->d(IIII)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    iget p0, p0, Lfr8;->g:I

    add-int v2, v0, p0

    add-int/2addr p0, v1

    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public k()I
    .registers 1

    iget p0, p0, Lfr8;->c:I

    return p0
.end method

.method public final l()V
    .registers 2

    iget-boolean v0, p0, Lfr8;->m:Z

    if-nez v0, :cond_11

    const/4 v0, 0x1

    iput-boolean v0, p0, Lfr8;->m:Z

    iget-object v0, p0, Lfr8;->n:Lds8;

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Lds8;->run()V

    const/4 v0, 0x0

    iput-object v0, p0, Lfr8;->n:Lds8;

    :cond_11
    return-void
.end method

.method public abstract n(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
.end method

.method public o()V
    .registers 3

    iget-object v0, p0, Lfr8;->h:Lvr8;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lfr8;->b(Lvr8;Z)V

    iget v0, p0, Lfr8;->o:I

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lfr8;->o:I

    invoke-static {v1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lfr8;->p:Landroid/graphics/drawable/Drawable;

    :cond_16
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 2

    invoke-virtual {p0}, Lfr8;->invalidate()V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/widget/TextView;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget p1, p0, Lfr8;->g:I

    iget v0, p0, Lfr8;->c:I

    if-ne p1, v0, :cond_a

    return-void

    :cond_a
    iput v0, p0, Lfr8;->g:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/widget/TextView;->onLayout(ZIIII)V

    if-eqz p1, :cond_14

    iget p1, p0, Lfr8;->g:I

    iget p2, p0, Lfr8;->c:I

    if-eq p1, p2, :cond_10

    iput p2, p0, Lfr8;->g:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_10
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lfr8;->q(Z)V

    :cond_14
    return-void
.end method

.method public final p(Lvr8;)V
    .registers 4

    iget-object v0, p0, Lfr8;->h:Lvr8;

    invoke-virtual {p1, v0}, Lvr8;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    iget-object v0, p0, Lfr8;->h:Lvr8;

    iget-byte v0, v0, Lvr8;->k:B

    iget-byte v1, p1, Lvr8;->k:B

    if-eq v0, v1, :cond_13

    const/4 v0, 0x1

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    iput-object p1, p0, Lfr8;->h:Lvr8;

    invoke-virtual {p0, p1, v0}, Lfr8;->b(Lvr8;Z)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public q(Z)V
    .registers 2

    return-void
.end method

.method public s()V
    .registers 2

    const-string v0, " "

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
