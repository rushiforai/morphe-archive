.class final Le/e/a/VideoDetails$FollowIcon;
.super Landroid/widget/Button;
.source "VideoDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/VideoDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FollowIcon"
.end annotation


# instance fields
.field followed:Z

.field final ink:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 29
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1, p1, p1}, Le/e/a/VideoDetails$FollowIcon;->setPadding(IIII)V

    invoke-virtual {p0, p1}, Le/e/a/VideoDetails$FollowIcon;->setMinWidth(I)V

    invoke-virtual {p0, p1}, Le/e/a/VideoDetails$FollowIcon;->setMinimumWidth(I)V

    invoke-virtual {p0, p1}, Le/e/a/VideoDetails$FollowIcon;->setMinHeight(I)V

    invoke-virtual {p0, p1}, Le/e/a/VideoDetails$FollowIcon;->setMinimumHeight(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/VideoDetails$FollowIcon;->setElevation(F)V

    invoke-virtual {p0, p1}, Le/e/a/VideoDetails$FollowIcon;->state(Z)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 15

    .line 29
    invoke-virtual {p0}, Le/e/a/VideoDetails$FollowIcon;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Le/e/a/VideoDetails$FollowIcon;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v2

    const/high16 v3, 0x42800000    # 64.0f

    div-float/2addr v2, v3

    iget-boolean v3, p0, Le/e/a/VideoDetails$FollowIcon;->followed:Z

    if-eqz v3, :cond_25

    invoke-virtual {p0}, Le/e/a/VideoDetails$FollowIcon;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_23

    const v3, -0xe6dfd6

    goto :goto_2d

    :cond_23
    const/4 v3, -0x1

    goto :goto_2d

    :cond_25
    invoke-virtual {p0}, Le/e/a/VideoDetails$FollowIcon;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v3

    :goto_2d
    iget-object v4, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    invoke-virtual {p0}, Le/e/a/VideoDetails$FollowIcon;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_3d

    const/16 v4, 0xff

    goto :goto_3f

    :cond_3d
    const/16 v4, 0x82

    :goto_3f
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v3, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    const/high16 v4, 0x40000000    # 2.0f

    mul-float v5, v2, v4

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v3, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    const/high16 v3, 0x42400000    # 48.0f

    mul-float v3, v3, v2

    sub-float/2addr v0, v3

    div-float/2addr v0, v4

    sub-float/2addr v1, v3

    div-float/2addr v1, v4

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v2, v2}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 v0, 0x40a00000    # 5.0f

    iget-object v1, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    const/high16 v2, 0x41a00000    # 20.0f

    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {p1, v2, v3, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 v11, 0x0

    iget-object v12, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    const/high16 v5, 0x41200000    # 10.0f

    const/high16 v6, 0x41b80000    # 23.0f

    const/high16 v7, 0x41f00000    # 30.0f

    const/high16 v8, 0x421c0000    # 39.0f

    const/high16 v9, 0x43340000    # 180.0f

    const/high16 v10, 0x43340000    # 180.0f

    move-object v4, p1

    invoke-virtual/range {v4 .. v12}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    iget-boolean v0, p0, Le/e/a/VideoDetails$FollowIcon;->followed:Z

    if-eqz v0, :cond_ae

    const/high16 v5, 0x41f00000    # 30.0f

    iget-object v6, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    const/high16 v2, 0x42000000    # 32.0f

    const/high16 v3, 0x41d80000    # 27.0f

    const/high16 v4, 0x420c0000    # 35.0f

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v11, 0x41b80000    # 23.0f

    iget-object v12, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    const/high16 v8, 0x420c0000    # 35.0f

    const/high16 v9, 0x41f00000    # 30.0f

    const/high16 v10, 0x42240000    # 41.0f

    move-object v7, p1

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_ca

    :cond_ae
    const/high16 v4, 0x41d00000    # 26.0f

    iget-object v5, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    const/high16 v1, 0x42000000    # 32.0f

    const/high16 v2, 0x41d00000    # 26.0f

    const/high16 v3, 0x42200000    # 40.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v10, 0x41f00000    # 30.0f

    iget-object v11, p0, Le/e/a/VideoDetails$FollowIcon;->ink:Landroid/graphics/Paint;

    const/high16 v7, 0x42100000    # 36.0f

    const/high16 v8, 0x41b00000    # 22.0f

    const/high16 v9, 0x42100000    # 36.0f

    move-object v6, p1

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :goto_ca
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method state(Z)V
    .registers 5

    .line 29
    iput-boolean p1, p0, Le/e/a/VideoDetails$FollowIcon;->followed:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/VideoDetails$FollowIcon;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    if-eqz p1, :cond_11

    invoke-virtual {p0}, Le/e/a/VideoDetails$FollowIcon;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result p1

    goto :goto_22

    :cond_11
    invoke-virtual {p0}, Le/e/a/VideoDetails$FollowIcon;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1f

    const p1, -0xdddad5

    goto :goto_22

    :cond_1f
    const p1, -0x1a1715

    :goto_22
    new-instance v0, Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {p0}, Le/e/a/VideoDetails$FollowIcon;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x64

    invoke-static {v1, p1, v2}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {p0}, Le/e/a/VideoDetails$FollowIcon;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x6

    # invokes: Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I
    invoke-static {v1, v2}, Le/e/a/VideoDetails;->access$6(Landroid/content/Context;I)I

    move-result v1

    invoke-direct {v0, p1, v1}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {p0, v0}, Le/e/a/VideoDetails$FollowIcon;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Le/e/a/VideoDetails$FollowIcon;->invalidate()V

    return-void
.end method
