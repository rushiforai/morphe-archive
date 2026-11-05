.class final Le/e/a/BikeRun$RecordRow;
.super Landroid/widget/LinearLayout;
.source "BikeRun.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/BikeRun;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RecordRow"
.end annotation


# instance fields
.field final date:Landroid/widget/TextView;

.field final dateSize:F

.field final score:Landroid/widget/TextView;

.field final scoreSize:F


# direct methods
.method constructor <init>(Le/e/a/BikeRun$Track;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .line 196
    invoke-virtual {p1}, Le/e/a/BikeRun$Track;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/BikeRun$RecordRow;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {p0, v1}, Le/e/a/BikeRun$RecordRow;->setGravity(I)V

    .line 197
    invoke-virtual {p0}, Le/e/a/BikeRun$RecordRow;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x41200000    # 10.0f

    mul-float v2, v2, v1

    .line 198
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {p0, v0, v3, v0, v2}, Le/e/a/BikeRun$RecordRow;->setPadding(IIII)V

    .line 199
    new-instance v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordRow;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le/e/a/BikeRun$RecordRow;->score:Landroid/widget/TextView;

    new-instance v3, Landroid/widget/TextView;

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordRow;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Le/e/a/BikeRun$RecordRow;->date:Landroid/widget/TextView;

    .line 200
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v4, p1, Le/e/a/BikeRun$Track;->foreground:I

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    iget p1, p1, Le/e/a/BikeRun$Track;->foreground:I

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 p1, 0x41600000    # 14.0f

    .line 201
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 p1, 0x41400000    # 12.0f

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v2}, Landroid/widget/TextView;->getTextSize()F

    move-result v4

    iput v4, p0, Le/e/a/BikeRun$RecordRow;->scoreSize:F

    invoke-virtual {v3}, Landroid/widget/TextView;->getTextSize()F

    move-result v4

    iput v4, p0, Le/e/a/BikeRun$RecordRow;->dateSize:F

    const/4 v4, 0x1

    .line 202
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    const/16 v4, 0x15

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    mul-float v1, v1, p1

    .line 203
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-virtual {v3, p1, v0, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 204
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v4, -0x2

    invoke-direct {p1, v0, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, v2, p1}, Le/e/a/BikeRun$RecordRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p1, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v3, p1}, Le/e/a/BikeRun$RecordRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 205
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, ", "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/BikeRun$RecordRow;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 7

    .line 208
    iget-object v0, p0, Le/e/a/BikeRun$RecordRow;->score:Landroid/widget/TextView;

    iget v1, p0, Le/e/a/BikeRun$RecordRow;->scoreSize:F

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    iget-object v0, p0, Le/e/a/BikeRun$RecordRow;->date:Landroid/widget/TextView;

    iget v1, p0, Le/e/a/BikeRun$RecordRow;->dateSize:F

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 209
    iget-object v0, p0, Le/e/a/BikeRun$RecordRow;->score:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    iget-object v1, p0, Le/e/a/BikeRun$RecordRow;->score:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v0

    iget-object v1, p0, Le/e/a/BikeRun$RecordRow;->date:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    iget-object v3, p0, Le/e/a/BikeRun$RecordRow;->date:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v1

    add-float/2addr v0, v1

    .line 210
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordRow;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v1, v3

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordRow;->getPaddingRight()I

    move-result v3

    sub-int/2addr v1, v3

    iget-object v3, p0, Le/e/a/BikeRun$RecordRow;->date:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v1, v3

    add-int/lit8 v1, v1, -0x2

    int-to-float v1, v1

    .line 211
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    if-eqz v3, :cond_72

    cmpl-float v3, v0, v1

    if-lez v3, :cond_72

    const/4 v3, 0x0

    cmpl-float v3, v1, v3

    if-lez v3, :cond_72

    div-float/2addr v1, v0

    .line 213
    iget-object v0, p0, Le/e/a/BikeRun$RecordRow;->score:Landroid/widget/TextView;

    iget v3, p0, Le/e/a/BikeRun$RecordRow;->scoreSize:F

    mul-float v3, v3, v1

    invoke-virtual {v0, v2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    iget-object v0, p0, Le/e/a/BikeRun$RecordRow;->date:Landroid/widget/TextView;

    iget v3, p0, Le/e/a/BikeRun$RecordRow;->dateSize:F

    mul-float v3, v3, v1

    invoke-virtual {v0, v2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 215
    :cond_72
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void
.end method
