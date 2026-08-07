.class public Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/drawable/Drawable;

.field public b:I

.field public c:I

.field public d:Landroid/text/TextPaint;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x10

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->c:I

    .line 7
    .line 8
    const-string p1, ""

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->e:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->f:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->g:Ljava/lang/String;

    .line 15
    .line 16
    const/4 p1, 0x2

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->h:I

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->b()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 23
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x10

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->c:I

    .line 25
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->e:Ljava/lang/String;

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->f:Ljava/lang/String;

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->g:Ljava/lang/String;

    const/4 p1, 0x2

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->h:I

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->b()V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 6

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->e:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const-string v1, ""

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->f:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->g:Ljava/lang/String;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->b:I

    .line 20
    .line 21
    sub-int v0, p1, v0

    .line 22
    .line 23
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->c:I

    .line 24
    .line 25
    sub-int/2addr v0, v2

    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->d:Landroid/text/TextPaint;

    .line 27
    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->e:Ljava/lang/String;

    .line 29
    .line 30
    int-to-float v0, v0

    .line 31
    const/4 v4, 0x0

    .line 32
    const/4 v5, 0x1

    .line 33
    invoke-virtual {v2, v3, v5, v0, v4}, Landroid/graphics/Paint;->breakText(Ljava/lang/String;ZF[F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->e:Ljava/lang/String;

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->f:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->e:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-ge v0, v2, :cond_2

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->e:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->d:Landroid/text/TextPaint;

    .line 65
    .line 66
    int-to-float p1, p1

    .line 67
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 68
    .line 69
    invoke-static {v0, v1, p1, v2}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->g:Ljava/lang/String;

    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->g:Ljava/lang/String;

    .line 81
    .line 82
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    new-instance v0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->d:Landroid/text/TextPaint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->d:Landroid/text/TextPaint;

    .line 13
    .line 14
    const/high16 v1, 0x41600000    # 14.0f

    .line 15
    .line 16
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->d:Landroid/text/TextPaint;

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 27
    .line 28
    sget v2, Ll/c9c0;->m0:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 35
    .line 36
    .line 37
    const/high16 v0, 0x41a00000    # 20.0f

    .line 38
    .line 39
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->b:I

    .line 44
    .line 45
    const/high16 v0, 0x40800000    # 4.0f

    .line 46
    .line 47
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->c:I

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const v1, 0x1080041

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->a:Landroid/graphics/drawable/Drawable;

    .line 65
    .line 66
    if-eqz v0, :cond_0

    .line 67
    .line 68
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->b:I

    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-virtual {v0, v1, v1, p0, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->f:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->d:Landroid/text/TextPaint;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 20
    .line 21
    neg-float v2, v1

    .line 22
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 23
    .line 24
    sub-float/2addr v0, v1

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->a:Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->f:Ljava/lang/String;

    .line 33
    .line 34
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->b:I

    .line 35
    .line 36
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->c:I

    .line 37
    .line 38
    add-int/2addr v3, v4

    .line 39
    int-to-float v3, v3

    .line 40
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->d:Landroid/text/TextPaint;

    .line 41
    .line 42
    invoke-virtual {p1, v1, v3, v2, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->g:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->g:Ljava/lang/String;

    .line 54
    .line 55
    add-float/2addr v2, v0

    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->d:Landroid/text/TextPaint;

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    invoke-virtual {p1, v1, v0, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    :goto_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->a(I)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->d:Landroid/text/TextPaint;

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iget v0, p2, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 15
    .line 16
    iget p2, p2, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 17
    .line 18
    sub-float/2addr v0, p2

    .line 19
    float-to-int p2, v0

    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->g:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->b:I

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->h:I

    .line 36
    .line 37
    mul-int/2addr p2, v0

    .line 38
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    :goto_0
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public setIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->b:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v1, v1, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->e:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->a(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setTextSize(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;->d:Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
