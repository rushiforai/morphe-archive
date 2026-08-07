.class public Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;
.super Lv/VText;
.source "SourceFile"


# instance fields
.field public i:Landroid/graphics/Paint;

.field public j:F

.field public k:I

.field public l:I

.field public m:F

.field public n:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->k:I

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->n:Z

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->p()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Lv/VText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->k:I

    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->n:Z

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->p()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lv/VText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->k:I

    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->n:Z

    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->p()V

    return-void
.end method

.method private p()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->i:Landroid/graphics/Paint;

    .line 11
    .line 12
    const/high16 v0, 0x40800000    # 4.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->l:I

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->m:F

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final l(Ljava/lang/String;I)V
    .locals 5

    .line 1
    if-lez p2, :cond_3

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->j:F

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    move v2, v1

    .line 15
    move v3, v2

    .line 16
    :goto_0
    array-length v4, v0

    .line 17
    if-ge v2, v4, :cond_1

    .line 18
    .line 19
    aget-object v4, v0, v2

    .line 20
    .line 21
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    aget-object v4, v0, v2

    .line 28
    .line 29
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    add-int/2addr v3, v4

    .line 38
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    sub-int/2addr p2, v0

    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    sub-int/2addr p2, v0

    .line 51
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawablePadding()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    sub-int/2addr p2, v0

    .line 56
    sub-int/2addr p2, v3

    .line 57
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->l:I

    .line 58
    .line 59
    sub-int/2addr p2, v0

    .line 60
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->j:F

    .line 61
    .line 62
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->o(FLjava/lang/String;)F

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    :goto_1
    int-to-float v2, p2

    .line 67
    cmpl-float v0, v0, v2

    .line 68
    .line 69
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->j:F

    .line 70
    .line 71
    if-lez v0, :cond_2

    .line 72
    .line 73
    const/high16 v0, 0x3f800000    # 1.0f

    .line 74
    .line 75
    sub-float/2addr v2, v0

    .line 76
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->j:F

    .line 77
    .line 78
    invoke-virtual {p0, v2, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->o(FLjava/lang/String;)F

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    goto :goto_1

    .line 83
    :cond_2
    invoke-virtual {p0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 84
    .line 85
    .line 86
    :cond_3
    return-void
.end method

.method public final o(FLjava/lang/String;)F
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->i:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 4
    .line 5
    .line 6
    const-string p1, "\n"

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    array-length p2, p1

    .line 13
    const/4 v0, 0x0

    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    if-ge v1, p2, :cond_1

    .line 16
    .line 17
    aget-object v2, p1, v1

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->i:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    cmpg-float v3, v0, v2

    .line 26
    .line 27
    if-gez v3, :cond_0

    .line 28
    .line 29
    move v0, v2

    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->n:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->k:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->k:I

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->k:I

    .line 29
    .line 30
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/QuickChatAutoText;->l(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
