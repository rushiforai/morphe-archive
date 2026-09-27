.class final Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;
.super Landroid/view/View;
.source "SubtitleStylePreview.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Preview"
.end annotation


# instance fields
.field onOrientationChanged:Ljava/lang/Runnable;

.field opacity:I

.field final paint:Landroid/graphics/Paint;

.field portrait:Z

.field size:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 55
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 54
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    .line 55
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayStyle(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object p1

    iget v0, p1, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->captionTextSize:I

    iput v0, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->size:I

    iget p1, p1, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->backgroundOpacity:I

    iput p1, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->opacity:I

    invoke-virtual {p0, v1}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->setClickable(Z)V

    invoke-virtual {p0, v1}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->setFocusable(Z)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->describe()V

    return-void
.end method

.method private describe()V
    .registers 4

    .line 56
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-boolean v1, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->portrait:Z

    if-eqz v1, :cond_b

    const-string v1, "\u7ad6\u5c4f"

    goto :goto_d

    :cond_b
    const-string v1, "\u6a2a\u5c4f"

    :goto_d
    const-string v2, "\u5b57\u5e55\u9884\u89c8\uff0c\u70b9\u51fb\u5207\u6362\u65b9\u5411"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 28

    move-object/from16 v0, p0

    .line 60
    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v1, v9, Landroid/util/DisplayMetrics;->density:F

    const/high16 v10, 0x41400000    # 12.0f

    mul-float v6, v1, v10

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v2

    const/4 v3, 0x7

    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->tint(II)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getWidth()I

    move-result v1

    int-to-float v4, v1

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getHeight()I

    move-result v1

    int-to-float v5, v1

    iget-object v8, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v7, v6

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 61
    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getWidth()I

    move-result v2

    int-to-float v2, v2

    iget v3, v9, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v3, v3

    iget v4, v9, Landroid/util/DisplayMetrics;->density:F

    invoke-static {v2, v3, v4}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->frameWidth(FFF)F

    move-result v14

    .line 62
    iget-boolean v2, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->portrait:Z

    const/high16 v7, 0x41800000    # 16.0f

    const/high16 v8, 0x41100000    # 9.0f

    if-eqz v2, :cond_50

    mul-float v2, v14, v7

    div-float/2addr v2, v8

    goto :goto_53

    :cond_50
    mul-float v2, v14, v8

    div-float/2addr v2, v7

    :goto_53
    move v15, v2

    .line 63
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getWidth()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v14

    const/high16 v19, 0x40000000    # 2.0f

    div-float v2, v2, v19

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getHeight()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v15

    div-float v3, v3, v19

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    new-instance v3, Landroid/graphics/RectF;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v4, v14, v15}, Landroid/graphics/RectF;-><init>(FFFF)V

    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v2, v3, v6, v6, v5}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 64
    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xff

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    new-instance v11, Landroid/graphics/LinearGradient;

    const v3, -0xcab9b0

    const v5, -0x605152

    filled-new-array {v3, v5}, [I

    move-result-object v16

    const/16 v17, 0x0

    sget-object v18, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v11 .. v18}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v2, v11}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    const/4 v3, 0x0

    iget-object v6, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    move v11, v4

    move v4, v14

    move v5, v15

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    const v3, -0xac979a

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    invoke-virtual {v2, v11, v15}, Landroid/graphics/Path;->moveTo(FF)V

    const v3, 0x3e99999a    # 0.3f

    mul-float/2addr v3, v14

    const v4, 0x3ec28f5c    # 0.38f

    mul-float/2addr v4, v15

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    const v3, 0x3f19999a    # 0.6f

    mul-float/2addr v3, v14

    const v4, 0x3f333333    # 0.7f

    mul-float/2addr v4, v15

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    const v3, 0x3f51eb85    # 0.82f

    mul-float/2addr v3, v14

    const v4, 0x3ef5c28f    # 0.48f

    mul-float/2addr v4, v15

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    const v3, 0x3f23d70a    # 0.64f

    mul-float/2addr v3, v15

    invoke-virtual {v2, v14, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v2, v14, v15}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    iget-object v3, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 65
    iget v2, v9, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v3, v9, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    int-to-float v2, v2

    iget v3, v9, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v4, v9, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    .line 66
    iget-boolean v4, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->portrait:Z

    if-eqz v4, :cond_110

    mul-float/2addr v3, v8

    div-float/2addr v3, v7

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    goto :goto_116

    :cond_110
    mul-float/2addr v2, v7

    div-float/2addr v2, v8

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    :goto_116
    const/high16 v3, 0x3f800000    # 1.0f

    .line 67
    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v24

    div-float v14, v14, v24

    div-float/2addr v15, v14

    .line 69
    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "\u8fd9\u662f\u5b57\u5e55\u6837\u5f0f\u9884\u89c8"

    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v21

    .line 72
    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getContext()Landroid/content/Context;

    move-result-object v20

    iget v2, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->size:I

    iget v3, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->opacity:I

    iget-boolean v4, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->portrait:Z

    move/from16 v22, v2

    move/from16 v23, v3

    move/from16 v25, v4

    invoke-static/range {v20 .. v25}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->sampleLabel(Landroid/content/Context;Ljava/lang/String;IIFZ)Landroid/widget/TextView;

    move-result-object v2

    .line 73
    iget-boolean v3, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->portrait:Z

    if-eqz v3, :cond_14a

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->shortsPosition(Landroid/content/Context;)F

    move-result v3

    goto :goto_153

    :cond_14a
    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->captionPositionY(Landroid/content/Context;Z)F

    move-result v3

    .line 74
    :goto_153
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {v1, v14, v14}, Landroid/graphics/Canvas;->scale(FF)V

    .line 75
    invoke-virtual {v2}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v4

    int-to-float v4, v4

    sub-float v24, v24, v4

    div-float v4, v24, v19

    invoke-virtual {v2}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v5

    int-to-float v5, v5

    sub-float v5, v15, v5

    mul-float/2addr v15, v3

    invoke-virtual {v2}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v3

    int-to-float v3, v3

    div-float v3, v3, v19

    sub-float/2addr v15, v3

    invoke-static {v5, v15}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v11, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-virtual {v1, v4, v3}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 76
    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    iget v3, v9, Landroid/util/DisplayMetrics;->scaledDensity:F

    mul-float/2addr v3, v10

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-boolean v2, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->portrait:Z

    if-eqz v2, :cond_19f

    const-string v2, "9:16"

    goto :goto_1a1

    :cond_19f
    const-string v2, "16:9"

    :goto_1a1
    iget v3, v9, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v3, v10

    const/high16 v4, 0x41c00000    # 24.0f

    iget v5, v9, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v5, v4

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v5, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method protected onMeasure(II)V
    .registers 7

    .line 58
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    int-to-float v1, p1

    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iget-boolean v3, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->portrait:Z

    invoke-static {v1, v2, v0, v3}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->stageHeight(FFFZ)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {v0, p2}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->resolveSize(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->setMeasuredDimension(II)V

    return-void
.end method

.method public performClick()Z
    .registers 3

    .line 57
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->portrait:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->portrait:Z

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->describe()V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->onOrientationChanged:Ljava/lang/Runnable;

    if-eqz v0, :cond_13

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_13
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->requestLayout()V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->invalidate()V

    return v1
.end method
