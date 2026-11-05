.class final Le/e/a/GestureControls110$Trace;
.super Landroid/view/View;
.source "GestureControls110.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/GestureControls110;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Trace"
.end annotation


# instance fields
.field final accent:I

.field final box:Landroid/graphics/RectF;

.field boxWidth:F

.field layout:Landroid/text/StaticLayout;

.field layoutKey:Ljava/lang/String;

.field layoutWidth:I

.field message:Ljava/lang/String;

.field final paint:Landroid/graphics/Paint;

.field final path:Landroid/graphics/Path;

.field rules:Le/e/a/GestureRules110;

.field final surface:I

.field final textPaint:Landroid/text/TextPaint;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 29
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 28
    new-instance v0, Le/e/a/GestureRules110;

    invoke-direct {v0}, Le/e/a/GestureRules110;-><init>()V

    iput-object v0, p0, Le/e/a/GestureControls110$Trace;->rules:Le/e/a/GestureRules110;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/GestureControls110$Trace;->paint:Landroid/graphics/Paint;

    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, Le/e/a/GestureControls110$Trace;->textPaint:Landroid/text/TextPaint;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/GestureControls110$Trace;->path:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Le/e/a/GestureControls110$Trace;->box:Landroid/graphics/RectF;

    const-string v0, ""

    iput-object v0, p0, Le/e/a/GestureControls110$Trace;->message:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/GestureControls110$Trace;->layoutKey:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/GestureControls110$Trace;->layoutWidth:I

    .line 29
    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Le/e/a/GestureControls110$Trace;->accent:I

    invoke-static {p1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Le/e/a/GestureControls110$Trace;->surface:I

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Le/e/a/GestureControls110$Trace;->setBackgroundColor(I)V

    return-void
.end method


# virtual methods
.method feed(Landroid/view/MotionEvent;)V
    .registers 7

    .line 30
    invoke-virtual {p0}, Le/e/a/GestureControls110$Trace;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-nez v1, :cond_4a

    iget-object v1, p0, Le/e/a/GestureControls110$Trace;->rules:Le/e/a/GestureRules110;

    invoke-virtual {p0}, Le/e/a/GestureControls110$Trace;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "gesture_sensitivity"

    const/16 v4, 0x32

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Le/e/a/GestureRules110;->threshold(I)F

    move-result v2

    iput v2, v1, Le/e/a/GestureRules110;->distance:F

    iget-object v1, p0, Le/e/a/GestureControls110$Trace;->rules:Le/e/a/GestureRules110;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    div-float/2addr v2, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    div-float/2addr v3, v0

    invoke-virtual {v1, v2, v3}, Le/e/a/GestureRules110;->down(FF)V

    iget-object v0, p0, Le/e/a/GestureControls110$Trace;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    iget-object v0, p0, Le/e/a/GestureControls110$Trace;->path:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_66

    :cond_4a
    iget-object v1, p0, Le/e/a/GestureControls110$Trace;->rules:Le/e/a/GestureRules110;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    div-float/2addr v2, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    div-float/2addr v3, v0

    invoke-virtual {v1, v2, v3}, Le/e/a/GestureRules110;->move(FF)V

    iget-object v0, p0, Le/e/a/GestureControls110$Trace;->path:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_66
    invoke-virtual {p0}, Le/e/a/GestureControls110$Trace;->invalidate()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 16

    .line 31
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0}, Le/e/a/GestureControls110$Trace;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iget-object v1, p0, Le/e/a/GestureControls110$Trace;->paint:Landroid/graphics/Paint;

    const/16 v2, 0xff

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v1, p0, Le/e/a/GestureControls110$Trace;->paint:Landroid/graphics/Paint;

    iget v3, p0, Le/e/a/GestureControls110$Trace;->accent:I

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Le/e/a/GestureControls110$Trace;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, p0, Le/e/a/GestureControls110$Trace;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x40400000    # 3.0f

    mul-float v3, v3, v0

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, p0, Le/e/a/GestureControls110$Trace;->path:Landroid/graphics/Path;

    iget-object v3, p0, Le/e/a/GestureControls110$Trace;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v3, p0, Le/e/a/GestureControls110$Trace;->rules:Le/e/a/GestureRules110;

    iget-object v3, v3, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    invoke-static {v3}, Le/e/a/GestureRules110;->arrows(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Le/e/a/GestureControls110$Trace;->message:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    const-string v4, "\n"

    if-eqz v3, :cond_50

    const-string v3, ""

    goto :goto_5f

    :cond_50
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Le/e/a/GestureControls110$Trace;->message:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_5f
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Le/e/a/GestureControls110$Trace;->getWidth()I

    move-result v3

    const/high16 v5, 0x41c00000    # 24.0f

    mul-float v5, v5, v0

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v6

    sub-int/2addr v3, v6

    const/4 v6, 0x1

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget-object v7, p0, Le/e/a/GestureControls110$Trace;->layout:Landroid/text/StaticLayout;

    const/high16 v8, 0x41800000    # 16.0f

    if-eqz v7, :cond_8b

    iget-object v7, p0, Le/e/a/GestureControls110$Trace;->layoutKey:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8b

    iget v7, p0, Le/e/a/GestureControls110$Trace;->layoutWidth:I

    if-eq v7, v3, :cond_ea

    :cond_8b
    iput-object v1, p0, Le/e/a/GestureControls110$Trace;->layoutKey:Ljava/lang/String;

    iput v3, p0, Le/e/a/GestureControls110$Trace;->layoutWidth:I

    iget-object v7, p0, Le/e/a/GestureControls110$Trace;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {p0}, Le/e/a/GestureControls110$Trace;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->scaledDensity:F

    mul-float v9, v9, v8

    invoke-virtual {v7, v9}, Landroid/text/TextPaint;->setTextSize(F)V

    iget-object v7, p0, Le/e/a/GestureControls110$Trace;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {p0}, Le/e/a/GestureControls110$Trace;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v9

    invoke-virtual {v7, v9}, Landroid/text/TextPaint;->setColor(I)V

    const/4 v7, -0x1

    invoke-virtual {v1, v4, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    array-length v7, v4

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_b6
    if-lt v11, v7, :cond_141

    int-to-float v3, v3

    mul-float v4, v0, v8

    invoke-static {v10, v3, v4}, Le/e/a/GestureDefaults113;->hudWidth(FFF)F

    move-result v3

    iput v3, p0, Le/e/a/GestureControls110$Trace;->boxWidth:F

    iget v3, p0, Le/e/a/GestureControls110$Trace;->boxWidth:F

    const/high16 v4, 0x42000000    # 32.0f

    mul-float v4, v4, v0

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    iget-object v6, p0, Le/e/a/GestureControls110$Trace;->textPaint:Landroid/text/TextPaint;

    invoke-static {v1, v9, v4, v6, v3}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object v1

    sget-object v3, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    invoke-virtual {v1, v3}, Landroid/text/StaticLayout$Builder;->setAlignment(Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    move-result-object v1

    invoke-virtual {v1, v9}, Landroid/text/StaticLayout$Builder;->setIncludePad(Z)Landroid/text/StaticLayout$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    move-result-object v1

    iput-object v1, p0, Le/e/a/GestureControls110$Trace;->layout:Landroid/text/StaticLayout;

    .line 32
    :cond_ea
    invoke-virtual {p0}, Le/e/a/GestureControls110$Trace;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget v3, p0, Le/e/a/GestureControls110$Trace;->boxWidth:F

    sub-float/2addr v1, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v1, v3

    iget-object v3, p0, Le/e/a/GestureControls110$Trace;->box:Landroid/graphics/RectF;

    const/high16 v4, 0x41400000    # 12.0f

    mul-float v4, v4, v0

    iget v6, p0, Le/e/a/GestureControls110$Trace;->boxWidth:F

    add-float/2addr v6, v1

    iget-object v7, p0, Le/e/a/GestureControls110$Trace;->layout:Landroid/text/StaticLayout;

    invoke-virtual {v7}, Landroid/text/StaticLayout;->getHeight()I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v7, v4

    add-float/2addr v7, v5

    invoke-virtual {v3, v1, v4, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v3, p0, Le/e/a/GestureControls110$Trace;->paint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, p0, Le/e/a/GestureControls110$Trace;->paint:Landroid/graphics/Paint;

    iget v4, p0, Le/e/a/GestureControls110$Trace;->surface:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, p0, Le/e/a/GestureControls110$Trace;->paint:Landroid/graphics/Paint;

    const/16 v4, 0xe6

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v3, p0, Le/e/a/GestureControls110$Trace;->box:Landroid/graphics/RectF;

    const/high16 v4, 0x41000000    # 8.0f

    mul-float v4, v4, v0

    iget-object v6, p0, Le/e/a/GestureControls110$Trace;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v4, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    iget-object v3, p0, Le/e/a/GestureControls110$Trace;->paint:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    mul-float v0, v0, v8

    add-float/2addr v1, v0

    invoke-virtual {p1, v1, v5}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Le/e/a/GestureControls110$Trace;->layout:Landroid/text/StaticLayout;

    invoke-virtual {v0, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 33
    return-void

    .line 31
    :cond_141
    aget-object v12, v4, v11

    iget-object v13, p0, Le/e/a/GestureControls110$Trace;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v13, v12}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v12

    invoke-static {v10, v12}, Ljava/lang/Math;->max(FF)F

    move-result v10

    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_b6
.end method
