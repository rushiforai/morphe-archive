.class public final Liec;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final a:Lxbf;

.field public b:Z

.field public c:Z

.field public d:I

.field public e:I

.field public final f:I

.field public final g:I

.field public final synthetic h:Lcom/opera/android/bar/LimitedSideActionsAppbar;


# direct methods
.method public constructor <init>(Lcom/opera/android/bar/LimitedSideActionsAppbar;Landroid/content/res/Resources;)V
    .registers 4

    iput-object p1, p0, Liec;->h:Lcom/opera/android/bar/LimitedSideActionsAppbar;

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance p1, Lxbf;

    const/16 v0, 0xc

    invoke-direct {p1, v0}, Lxbf;-><init>(B)V

    iput-object p1, p0, Liec;->a:Lxbf;

    const p1, 0x7f070a00

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Liec;->f:I

    sget-object p1, Lfan;->a:Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 p2, 0x1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p2, v0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Liec;->g:I

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 15

    iget-object v0, p0, Liec;->h:Lcom/opera/android/bar/LimitedSideActionsAppbar;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v6

    iget v7, p0, Liec;->e:I

    iget v8, p0, Liec;->d:I

    iget-boolean v0, p0, Liec;->c:Z

    if-eqz v0, :cond_16

    iget v0, p0, Liec;->g:I

    :goto_14
    move v11, v0

    goto :goto_19

    :cond_16
    iget v0, p0, Liec;->f:I

    goto :goto_14

    :goto_19
    const/4 v12, 0x0

    iget-object v1, p0, Liec;->a:Lxbf;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v2, p1

    invoke-virtual/range {v1 .. v12}, Lxbf;->y(Landroid/graphics/Canvas;IIIIIIIIIZ)V

    return-void
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public final setAlpha(I)V
    .registers 2

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    return-void
.end method
