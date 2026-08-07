.class public Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, -0x1

    .line 14
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3fc00000    # 1.5f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    int-to-float p1, p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;->c:F

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->Za:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;->a:Landroid/view/View;

    .line 11
    .line 12
    sget v0, Ll/adc0;->ab:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;->b:Landroid/view/View;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;->a:Landroid/view/View;

    .line 21
    .line 22
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;->c:F

    .line 23
    .line 24
    float-to-int p0, p0

    .line 25
    invoke-static {v0, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setProgress(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;->a:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;->b:Landroid/view/View;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;->b:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/high16 v2, 0x40000000    # 2.0f

    .line 21
    .line 22
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;->c:F

    .line 23
    .line 24
    mul-float/2addr v3, v2

    .line 25
    float-to-int v2, v3

    .line 26
    sub-int/2addr v1, v2

    .line 27
    sub-int/2addr v0, v1

    .line 28
    const/4 v1, 0x0

    .line 29
    cmpg-float v2, p1, v1

    .line 30
    .line 31
    if-gez v2, :cond_1

    .line 32
    .line 33
    move p1, v1

    .line 34
    :cond_1
    const/high16 v1, 0x3f800000    # 1.0f

    .line 35
    .line 36
    cmpl-float v2, p1, v1

    .line 37
    .line 38
    if-lez v2, :cond_2

    .line 39
    .line 40
    move p1, v1

    .line 41
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CoreCardScrollBar;->b:Landroid/view/View;

    .line 42
    .line 43
    int-to-float v0, v0

    .line 44
    mul-float/2addr v0, p1

    .line 45
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 46
    .line 47
    .line 48
    :cond_3
    :goto_0
    return-void
.end method
