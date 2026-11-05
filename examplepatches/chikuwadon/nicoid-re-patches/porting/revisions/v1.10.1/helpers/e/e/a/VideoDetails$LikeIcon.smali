.class final Le/e/a/VideoDetails$LikeIcon;
.super Landroid/widget/Button;
.source "VideoDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/VideoDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LikeIcon"
.end annotation


# instance fields
.field final circle:Landroid/graphics/drawable/Drawable;

.field final data:Landroid/os/Bundle;

.field liked:Z

.field final paint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/os/Bundle;)V
    .registers 5

    .line 44
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/VideoDetails$LikeIcon;->paint:Landroid/graphics/Paint;

    iput-object p2, p0, Le/e/a/VideoDetails$LikeIcon;->data:Landroid/os/Bundle;

    const/4 p2, 0x0

    invoke-virtual {p0, p2, p2, p2, p2}, Le/e/a/VideoDetails$LikeIcon;->setPadding(IIII)V

    invoke-virtual {p0, p2}, Le/e/a/VideoDetails$LikeIcon;->setMinWidth(I)V

    invoke-virtual {p0, p2}, Le/e/a/VideoDetails$LikeIcon;->setMinimumWidth(I)V

    invoke-virtual {p0, p2}, Le/e/a/VideoDetails$LikeIcon;->setMinHeight(I)V

    invoke-virtual {p0, p2}, Le/e/a/VideoDetails$LikeIcon;->setMinimumHeight(I)V

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Le/e/a/VideoDetails$LikeIcon;->setElevation(F)V

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Le/e/a/VideoDetails$LikeIcon;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-static {p1}, Le/e/a/Ui110;->actionColor(Landroid/content/Context;)I

    move-result p2

    const/16 v0, 0x64

    invoke-static {p1, p2, v0}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    iput-object p1, p0, Le/e/a/VideoDetails$LikeIcon;->circle:Landroid/graphics/drawable/Drawable;

    iget-object p1, p0, Le/e/a/VideoDetails$LikeIcon;->circle:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Le/e/a/VideoDetails$LikeIcon;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 11

    .line 44
    invoke-virtual {p0}, Le/e/a/VideoDetails$LikeIcon;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Le/e/a/VideoDetails$LikeIcon;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x42400000    # 48.0f

    div-float/2addr v0, v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Le/e/a/VideoDetails$LikeIcon;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v0

    sub-float/2addr v2, v1

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    invoke-virtual {p0}, Le/e/a/VideoDetails$LikeIcon;->getHeight()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v1

    div-float/2addr v4, v3

    invoke-virtual {p1, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, p0, Le/e/a/VideoDetails$LikeIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Le/e/a/VideoDetails$LikeIcon;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Le/e/a/VideoDetails$LikeIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Le/e/a/VideoDetails$LikeIcon;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_43

    const/16 v1, 0xff

    goto :goto_45

    :cond_43
    const/16 v1, 0x82

    :goto_45
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Le/e/a/VideoDetails$LikeIcon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x3fc00000    # 1.5f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Le/e/a/VideoDetails$LikeIcon;->paint:Landroid/graphics/Paint;

    iget-boolean v1, p0, Le/e/a/VideoDetails$LikeIcon;->liked:Z

    if-eqz v1, :cond_58

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    goto :goto_5a

    :cond_58
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    :goto_5a
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v1, 0x41c00000    # 24.0f

    const/high16 v2, 0x42040000    # 33.0f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v7, 0x41c00000    # 24.0f

    const/high16 v8, 0x41980000    # 19.0f

    const/high16 v3, 0x41000000    # 8.0f

    const/high16 v4, 0x41c00000    # 24.0f

    const/high16 v5, 0x41700000    # 15.0f

    const/high16 v6, 0x41400000    # 12.0f

    move-object v2, v0

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v8, 0x42040000    # 33.0f

    const/high16 v3, 0x42040000    # 33.0f

    const/high16 v4, 0x41400000    # 12.0f

    const/high16 v5, 0x42200000    # 40.0f

    const/high16 v6, 0x41c00000    # 24.0f

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v1, p0, Le/e/a/VideoDetails$LikeIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method state()V
    .registers 3

    .line 44
    invoke-virtual {p0}, Le/e/a/VideoDetails$LikeIcon;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Le/e/a/VideoDetails$LikeIcon;->circle:Landroid/graphics/drawable/Drawable;

    if-eq v0, v1, :cond_11

    iget-object v0, p0, Le/e/a/VideoDetails$LikeIcon;->circle:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Le/e/a/VideoDetails$LikeIcon;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0, v0}, Le/e/a/VideoDetails$LikeIcon;->setPadding(IIII)V

    :cond_11
    iget-object v0, p0, Le/e/a/VideoDetails$LikeIcon;->data:Landroid/os/Bundle;

    const-string v1, "nicoid_liked"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iget-boolean v1, p0, Le/e/a/VideoDetails$LikeIcon;->liked:Z

    if-eq v0, v1, :cond_22

    iput-boolean v0, p0, Le/e/a/VideoDetails$LikeIcon;->liked:Z

    invoke-virtual {p0}, Le/e/a/VideoDetails$LikeIcon;->invalidate()V

    :cond_22
    return-void
.end method
