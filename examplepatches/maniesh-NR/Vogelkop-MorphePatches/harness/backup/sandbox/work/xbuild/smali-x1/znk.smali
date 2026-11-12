.class public final Lznk;
.super Ler8;
.source "SourceFile"

# interfaces
.implements Lpvb;


# static fields
.field public static final K:[I


# instance fields
.field public final B:Landroid/graphics/Paint;

.field public final C:F

.field public final D:I

.field public E:I

.field public F:I

.field public G:Landroid/graphics/drawable/Drawable;

.field public H:F

.field public final I:Z

.field public J:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x101009c

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lznk;->K:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ltta;Lvr8;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Ler8;-><init>(Landroid/content/Context;Ltta;Lvr8;Lzzj;)V

    new-instance p2, Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lznk;->B:Landroid/graphics/Paint;

    const/high16 p2, 0x3f800000    # 1.0f

    iput p2, p0, Lznk;->H:F

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p2, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lznk;->C:F

    invoke-static {p1}, Lnr8;->e(Landroid/content/Context;)I

    move-result p2

    iput p2, p0, Lznk;->D:I

    invoke-static {p1}, Lwok;->t(Landroid/content/Context;)Lwok;

    move-result-object p2

    invoke-virtual {p2}, Lno7;->i()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lvok;

    iget p2, p2, Lvok;->a:I

    and-int/lit8 p2, p2, 0x2

    if-nez p2, :cond_32

    const/4 p3, 0x0

    :cond_32
    iput-boolean p3, p0, Lznk;->I:Z

    const p2, 0x7f040912

    const p3, 0x7f061084

    invoke-static {p2, p1, p3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p2

    iput p2, p0, Lznk;->E:I

    const p2, 0x7f040914

    const p3, 0x7f0600a7

    invoke-static {p2, p1, p3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p2

    iput p2, p0, Lznk;->F:I

    invoke-virtual {p0, p1}, Lznk;->z(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final d()Z
    .registers 2

    iget-object p0, p0, Ler8;->s:Lhq8;

    if-eqz p0, :cond_10

    check-cast p0, Lqok;

    iget-object p0, p0, Lqok;->e:Look;

    iget-byte p0, p0, Look;->d:B

    const/16 v0, 0xb

    if-eq p0, v0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final g(Landroid/graphics/Canvas;)V
    .registers 3

    const/4 v0, 0x0

    iput v0, p0, Lznk;->H:F

    invoke-super {p0, p1}, Lfr8;->g(Landroid/graphics/Canvas;)V

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lznk;->H:F

    return-void
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    return-object p0
.end method

.method public final h(Z)V
    .registers 3

    iget-boolean v0, p0, Lznk;->J:Z

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Lznk;->J:Z

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    return-void
.end method

.method public final j()Z
    .registers 1

    iget-object p0, p0, Ler8;->s:Lhq8;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final k()I
    .registers 1

    iget p0, p0, Lznk;->D:I

    return p0
.end method

.method public final m()Li1;
    .registers 4

    iget-object v0, p0, Ler8;->s:Lhq8;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    move-object v1, v0

    check-cast v1, Lqok;

    iget-object v1, v1, Lqok;->e:Look;

    new-instance v2, Li1;

    invoke-virtual {v0}, Lhq8;->g()Ljava/lang/String;

    move-result-object v0

    iget-object v1, v1, Look;->b:Ljava/lang/String;

    iget p0, p0, Lznk;->D:I

    invoke-direct {v2, v0, v1, p0}, Li1;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2
.end method

.method public final o()V
    .registers 4

    invoke-super {p0}, Ler8;->o()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f040912

    const v2, 0x7f061084

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    iput v1, p0, Lznk;->E:I

    const v1, 0x7f040914

    const v2, 0x7f0600a7

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    iput v1, p0, Lznk;->F:I

    invoke-virtual {p0, v0}, Lznk;->z(Landroid/content/Context;)V

    return-void
.end method

.method public final onCreateDrawableState(I)[I
    .registers 3

    iget-boolean v0, p0, Lznk;->J:Z

    if-eqz v0, :cond_11

    add-int/lit8 p1, p1, 0x1

    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    sget-object p1, Lznk;->K:[I

    invoke-static {p0, p1}, Landroid/view/View;->mergeDrawableStates([I[I)[I

    move-result-object p0

    return-object p0

    :cond_11
    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    return-object p0
.end method

.method public final v(Landroid/graphics/Canvas;Landroid/graphics/Rect;F)V
    .registers 11

    invoke-super {p0, p1, p2, p3}, Ler8;->v(Landroid/graphics/Canvas;Landroid/graphics/Rect;F)V

    iget-object p3, p0, Lznk;->G:Landroid/graphics/drawable/Drawable;

    if-nez p3, :cond_8

    return-void

    :cond_8
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result p3

    int-to-float p3, p3

    const/high16 v0, 0x41200000    # 10.0f

    div-float/2addr p3, v0

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1b

    iget v0, p2, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    add-float/2addr v0, p3

    goto :goto_1f

    :cond_1b
    iget v0, p2, Landroid/graphics/Rect;->right:I

    int-to-float v0, v0

    sub-float/2addr v0, p3

    :goto_1f
    iget v1, p2, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v1

    sub-float/2addr v1, p3

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result p2

    int-to-float p2, p2

    const p3, 0x3ed559b4    # 0.4167f

    mul-float/2addr p2, p3

    const/high16 p3, 0x40000000    # 2.0f

    div-float v2, p2, p3

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    iget-object v4, p0, Lznk;->B:Landroid/graphics/Paint;

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget v3, p0, Lznk;->C:F

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget v5, p0, Lznk;->F:I

    iget v6, p0, Lznk;->H:F

    invoke-static {v6, v5}, Lp37;->a0(FI)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    div-float/2addr v3, p3

    add-float/2addr v3, v2

    invoke-virtual {p1, v0, v1, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget v3, p0, Lznk;->E:I

    iget v5, p0, Lznk;->H:F

    invoke-static {v5, v3}, Lp37;->a0(FI)I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p1, v0, v1, v2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const v2, 0x3f4ccccd    # 0.8f

    mul-float/2addr p2, v2

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    int-to-float v2, p2

    div-float/2addr v2, p3

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p3

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget-object v1, p0, Lznk;->G:Landroid/graphics/drawable/Drawable;

    const/high16 v2, 0x437f0000    # 255.0f

    iget v3, p0, Lznk;->H:F

    mul-float/2addr v3, v2

    float-to-int v2, v3

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v1, p0, Lznk;->G:Landroid/graphics/drawable/Drawable;

    add-int v2, p3, p2

    add-int/2addr p2, v0

    invoke-virtual {v1, p3, v0, v2, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p0, p0, Lznk;->G:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final w()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ler8;->s:Lhq8;

    check-cast p0, Lqok;

    iget-object p0, p0, Lqok;->e:Look;

    iget-object p0, p0, Look;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final x()V
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lznk;->z(Landroid/content/Context;)V

    return-void
.end method

.method public final z(Landroid/content/Context;)V
    .registers 6

    iget-object v0, p0, Ler8;->s:Lhq8;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    iput-object v1, p0, Lznk;->G:Landroid/graphics/drawable/Drawable;

    return-void

    :cond_8
    check-cast v0, Lqok;

    iget-object v0, v0, Lqok;->e:Look;

    iget-byte v0, v0, Look;->d:B

    const/4 v2, 0x1

    if-eq v0, v2, :cond_30

    const/4 v2, 0x6

    if-eq v0, v2, :cond_2c

    const/16 v2, 0x9

    const/4 v3, 0x0

    if-eq v0, v2, :cond_24

    const/4 v2, 0x3

    if-eq v0, v2, :cond_20

    const/4 v2, 0x4

    if-eq v0, v2, :cond_30

    goto :goto_33

    :cond_20
    const v3, 0x7f0805a4

    goto :goto_33

    :cond_24
    iget-boolean v0, p0, Lznk;->I:Z

    if-eqz v0, :cond_33

    const v3, 0x7f0804dc

    goto :goto_33

    :cond_2c
    const v3, 0x7f080509

    goto :goto_33

    :cond_30
    const v3, 0x7f08057b

    :cond_33
    :goto_33
    if-nez v3, :cond_38

    iput-object v1, p0, Lznk;->G:Landroid/graphics/drawable/Drawable;

    return-void

    :cond_38
    invoke-static {v3, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v1, 0x7f040913

    const v2, 0x7f0600a7

    invoke-static {v1, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {v0, p1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    iput-object v0, p0, Lznk;->G:Landroid/graphics/drawable/Drawable;

    return-void
.end method
